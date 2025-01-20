# Use a modern base image
FROM python:3.9-slim

# Set maintainer information
LABEL maintainer="Docker Education Team <education@docker.com>"

# Update package list and install required dependencies
RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy application dependencies
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copy the application code
ADD ./webapp /opt/webapp/

# Set the working directory
WORKDIR /opt/webapp

# Expose the port the app runs on
EXPOSE 5000

# Define the command to run the application
CMD ["python3", "app.py"]
