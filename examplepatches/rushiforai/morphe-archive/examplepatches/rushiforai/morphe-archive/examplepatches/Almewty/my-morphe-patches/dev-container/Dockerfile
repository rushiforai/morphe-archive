FROM ubuntu:24.04

ENV ANDROID_SDK_TOOLS_VERSION=14742923
ENV ANDROID_SDK_TOOLS_CHECKSUM=04453066b540409d975c676d781da1477479dde3761310f1a7eb92a1dfb15af7

ENV ANDROID_HOME="/opt/android-sdk-linux"
ENV ANDROID_SDK_ROOT=$ANDROID_HOME
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools:$ANDROID_HOME/cmdline-tools/bin:$ANDROID_HOME/platform-tools

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8

# Add base environment
RUN apt-get -qq update \
    && apt-get -qqy --no-install-recommends install \
    apt-utils \
    openjdk-17-jdk \
    openjdk-17-jre-headless \
    curl \
    unzip \
    git > /dev/null \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download and unzip Android SDK Tools
RUN curl -s https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS_VERSION}_latest.zip > /tools.zip \
    && echo "$ANDROID_SDK_TOOLS_CHECKSUM ./tools.zip" | sha256sum -c \
    && unzip -qq /tools.zip -d $ANDROID_HOME \
    && rm -v /tools.zip

# Accept licenses
RUN mkdir -p $ANDROID_HOME/licenses/ \
    && echo "8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e\n24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_HOME/licenses/android-sdk-license \
    && echo "84831b9409646a918e30573bab4c9c91346d8abd\n504667f4c0de7af1a06de9f4b1727b84351f2910" > $ANDROID_HOME/licenses/android-sdk-preview-license --licenses \
    && yes | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --licenses --sdk_root=${ANDROID_SDK_ROOT}

# Add folder for SDK files
RUN mkdir -p /home/gradle/.android \
    && mkdir -p /home/gradle/app \
    && touch /home/gradle/.android/repositories.cfg

ENV HOME=/home/gradle

RUN mkdir -p /home/gradle/.gradle \
    && mkdir -p /home/gradle/app

ENV HOME=/home/gradle
WORKDIR $HOME/app

CMD ["/bin/bash"]