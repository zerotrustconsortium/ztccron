FROM alpine:latest
MAINTAINER ZTC <info@zerotrustconsortium.org>

RUN apk update && apk add dcron curl wget rsync jq ca-certificates && rm -rf /var/cache/apk/*
RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d

COPY /cron/* /

ENTRYPOINT ["/entry.sh"]
CMD ["/start.sh"]
