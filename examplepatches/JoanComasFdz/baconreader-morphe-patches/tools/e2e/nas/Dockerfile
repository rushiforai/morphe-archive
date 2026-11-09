# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# The NAS's GitHub Actions runner for the e2e scenarios, with what they need next to the phone (README.md here). Same
# file in both BaconReader repos: one image, one runner for each repo. The patcher itself comes with each job: the
# workflow downloads the Reseam CLI, or Morphe Desktop's jar, into the state volume's cache.
FROM ubuntu:24.04

ARG RUNNER_VERSION=2.338.2
ARG NODE_VERSION=22.12.0
ARG APPIUM_VERSION=3.8.0
ARG UIAUTOMATOR2_VERSION=8.7.0

ENV DEBIAN_FRONTEND=noninteractive \
    DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    DOTNET_NOLOGO=1 \
    ANDROID_HOME=/opt/android-sdk \
    APPIUM_HOME=/opt/appium/home

# Ubuntu 24.04 ships the .NET 10 SDK in its own archive. JDK 21 runs Morphe Desktop; ffmpeg and ffprobe join and check
# the scenarios' recordings and downloads.
RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates curl git jq unzip procps \
      dotnet-sdk-10.0 openjdk-21-jre-headless ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# adb, where Appium looks for it ($ANDROID_HOME/platform-tools).
RUN curl -fsSL -o /tmp/platform-tools.zip https://dl.google.com/android/repository/platform-tools-latest-linux.zip && \
    mkdir -p "$ANDROID_HOME" && unzip -q /tmp/platform-tools.zip -d "$ANDROID_HOME" && rm /tmp/platform-tools.zip && \
    ln -s "$ANDROID_HOME/platform-tools/adb" /usr/local/bin/adb

# The NAS's kernel answers fchmodat2 with EFAULT, so tar can't set directory modes in a build there (seccomp.json fixes
# it for the container, but not for a build): the two tarballs tolerate only those errors, and fail on any other. tar
# leaves the directories at 700 then, so they get the 755 both tarballs carry (symlinks have no mode).

# Appium and its UiAutomator2 driver, at the versions the cloud sessions' hook installs.
ENV PATH=/opt/node/bin:$PATH
RUN mkdir -p /opt/node && \
    curl -fsSL -o /tmp/node.tar.gz "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" && \
    { tar -xzf /tmp/node.tar.gz -C /opt/node --strip-components=1 2> /tmp/tar.err || \
      ! grep -v -e 'Cannot change mode' -e 'Exiting with failure status' /tmp/tar.err; } && \
    find /opt/node -type d -exec chmod 755 {} + && rm /tmp/node.tar.gz /tmp/tar.err && node -v && \
    npm install --prefix /opt/appium --no-audit --no-fund --loglevel=error "appium@$APPIUM_VERSION" && \
    /opt/appium/node_modules/.bin/appium driver install "uiautomator2@$UIAUTOMATOR2_VERSION"

# The runner, unregistered: runner.sh copies it into the state volume for each repo it registers.
RUN mkdir -p /opt/actions-runner && \
    curl -fsSL -o /tmp/runner.tar.gz "https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz" && \
    { tar -xzf /tmp/runner.tar.gz -C /opt/actions-runner 2> /tmp/tar.err || \
      ! grep -v -e 'Cannot change mode' -e 'Exiting with failure status' /tmp/tar.err; } && \
    find /opt/actions-runner -type d -exec chmod 755 {} + && rm /tmp/runner.tar.gz /tmp/tar.err && \
    /opt/actions-runner/bin/installdependencies.sh && rm -rf /var/lib/apt/lists/*

# Jobs run as this user, never as root (uid 1000 is the image's "ubuntu" user until then).
RUN userdel --remove ubuntu 2> /dev/null; useradd --create-home --uid 1000 --user-group runner && \
    mkdir -p /home/runner/state && chown -R runner:runner /home/runner /opt/appium/home
COPY --chmod=755 runner.sh /usr/local/bin/runner.sh
USER runner
WORKDIR /home/runner
ENTRYPOINT ["/usr/local/bin/runner.sh"]
