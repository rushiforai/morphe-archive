# Build + patch toolbox for the YT Music patch bundle.
# JDK 21, Android SDK command-line tools, Morphe Desktop CLI, apkeep.
FROM eclipse-temurin:21-jdk

ARG CMDLINE_TOOLS=commandlinetools-linux-13114758_latest.zip
ARG MORPHE_DESKTOP=2.3.0
ARG APKEEP=1.1.0

ENV ANDROID_HOME=/opt/android-sdk \
    ANDROID_SDK_ROOT=/opt/android-sdk \
    GRADLE_USER_HOME=/gradle
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

RUN apt-get update \
 && apt-get install -y --no-install-recommends unzip wget git ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Android SDK. Licenses accepted (the user agreed to the Android SDK terms).
# Gradle downloads any further platform/build-tools it needs into ANDROID_HOME.
RUN mkdir -p $ANDROID_HOME/cmdline-tools \
 && wget -q https://dl.google.com/android/repository/$CMDLINE_TOOLS -O /tmp/tools.zip \
 && unzip -q /tmp/tools.zip -d /tmp/tools \
 && mv /tmp/tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest \
 && rm -rf /tmp/tools /tmp/tools.zip \
 && yes | sdkmanager --licenses > /dev/null \
 && sdkmanager "platform-tools" "build-tools;36.0.0" "platforms;android-36" > /dev/null

# Morphe Desktop (CLI patcher) and apkeep (APK downloader).
RUN mkdir -p /opt/tools \
 && wget -q https://github.com/MorpheApp/morphe-desktop/releases/download/v$MORPHE_DESKTOP/morphe-desktop-$MORPHE_DESKTOP-all.jar -O /opt/tools/morphe-desktop.jar \
 && wget -q https://github.com/EFForg/apkeep/releases/download/$APKEEP/apkeep-x86_64-unknown-linux-gnu -O /usr/local/bin/apkeep \
 && chmod +x /usr/local/bin/apkeep \
 && printf '#!/bin/sh\nexec java -jar /opt/tools/morphe-desktop.jar "$@"\n' > /usr/local/bin/morphe \
 && chmod +x /usr/local/bin/morphe

WORKDIR /work
