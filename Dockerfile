FROM ghcr.io/u032582/ubuntu-devuser:latest

RUN sudo apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sudo pip install kubernetes
ADD src/ /work
WORKDIR /work
CMD [ "-c", "python3 main.py" ]
