FROM alpine:latest

RUN apk add --no-cache curl unzip && \
    curl -L -o /v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip /v2ray.zip -d /v2ray && \
    chmod +x /v2ray/v2ray /v2ray/v2ctl && \
    mkdir -p /etc/v2ray

COPY config.json /etc/v2ray/config.json

EXPOSE 80

CMD ["/v2ray/v2ray", "-config=/etc/v2ray/config.json"]
