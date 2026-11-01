#!/bin/bash
# Download the toolchain used by scripts/build_mpp_local.sh and scripts/verify_apk.sh.
# Everything goes into $TOOLS (default: ~/mpp-tools). Safe to re-run: existing files are kept.
set -euo pipefail

TOOLS="${TOOLS:-$HOME/mpp-tools}"
mkdir -p "$TOOLS"
cd "$TOOLS"

fetch() { [ -s "$2" ] || curl -fsSL --retry 3 -o "$2.part" "$1" && { [ -s "$2" ] || mv "$2.part" "$2"; }; }

fetch https://github.com/Sable/android-platforms/raw/master/android-30/android.jar android.jar
fetch https://dl.google.com/android/maven2/com/android/tools/r8/8.5.35/r8-8.5.35.jar r8.jar
fetch https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.2.jar baksmali.jar
fetch https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.2.jar smali.jar
fetch https://repo1.maven.org/maven2/com/google/code/gson/gson/2.14.0/gson-2.14.0.jar gson.jar
# morphe-cli (desktop) 1.17.0 bundles the morphe-patcher library 1.14.1 (the latest stable
# patcher); the patches are compiled against it and the .mpp declares Patcher-Version 1.14.1.
fetch https://github.com/MorpheApp/morphe-cli/releases/download/v1.17.0/morphe-desktop-1.17.0-all.jar morphe-cli.jar

# Full JDK 17 (javac with --release support; some distro JREs ship without ct.sym).
if [ ! -x jdk17/bin/javac ]; then
  fetch "https://api.adoptium.net/v3/binary/latest/17/ga/linux/x64/jdk/hotspot/normal/eclipse" jdk17.tgz
  mkdir -p jdk17 && tar -xzf jdk17.tgz -C jdk17 --strip-components=1 && rm -f jdk17.tgz
fi

# Kotlin compiler able to read the Kotlin 2.4 metadata of the morphe patcher jar.
if [ ! -x kotlinc/bin/kotlinc ]; then
  fetch https://github.com/JetBrains/kotlin/releases/download/v2.4.20/kotlin-compiler-2.4.20.zip kotlinc.zip
  unzip -q -o kotlinc.zip && rm -f kotlinc.zip
fi

# dex2jar: turns the target app's dex into JVM classes for the reflection harness.
if [ ! -d dex-tools-v2.4 ]; then
  fetch https://github.com/pxb1988/dex2jar/releases/download/v2.4/dex-tools-v2.4.zip d2j.zip
  unzip -q -o d2j.zip && rm -f d2j.zip && chmod +x dex-tools-v2.4/*.sh
fi

echo "Tools ready in $TOOLS"
