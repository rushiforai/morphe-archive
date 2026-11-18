FROM eclipse-temurin:21-jre-noble

ARG MORPHE_VERSION=2.0.0
ARG JADX_VERSION=1.5.6

ARG BUILD_TOOLS=36
ARG BUILD_TOOLS_SHA256=5d9ac77fb6ff43d9da518a337b4fcf8f9097113df531d99ccefe80ef7ce8250b

# aapt reads package/version.
RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 python3-venv aapt unzip curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# apksigner checks the apps' signing certificates. Ubuntu's package is too old for v3.1 signatures
# (Google Maps), so take it from the official build-tools; the jar is plain Java.
RUN curl -fsSL -o /tmp/bt.zip "https://dl.google.com/android/repository/build-tools_r${BUILD_TOOLS}_linux.zip" \
 && echo "${BUILD_TOOLS_SHA256}  /tmp/bt.zip" | sha256sum -c - \
 && mkdir -p /opt/apksigner && unzip -q -j /tmp/bt.zip '*/lib/apksigner.jar' -d /opt/apksigner && rm /tmp/bt.zip \
 && printf '#!/bin/sh\nexec java -jar /opt/apksigner/apksigner.jar "$@"\n' > /usr/local/bin/apksigner \
 && chmod +x /usr/local/bin/apksigner

RUN mkdir -p /opt/morphe /opt/jadx \
 && curl -fsSL -o /opt/morphe/morphe.jar \
      "https://github.com/MorpheApp/morphe-cli/releases/download/v${MORPHE_VERSION}/morphe-desktop-${MORPHE_VERSION}-all.jar" \
 && curl -fsSL -o /tmp/jadx.zip "https://github.com/skylot/jadx/releases/download/v${JADX_VERSION}/jadx-${JADX_VERSION}.zip" \
 && unzip -q /tmp/jadx.zip -d /opt/jadx && rm /tmp/jadx.zip

WORKDIR /app
COPY requirements.txt .
RUN python3 -m venv /venv && /venv/bin/pip install --no-cache-dir -r requirements.txt
COPY app.py .
COPY templates templates
COPY static static

ENV DATA_DIR=/data MORPHE_VERSION=${MORPHE_VERSION} JAVA_TOOL_OPTIONS=-Xmx3g
VOLUME /data
EXPOSE 8080
CMD ["/venv/bin/python", "app.py"]
