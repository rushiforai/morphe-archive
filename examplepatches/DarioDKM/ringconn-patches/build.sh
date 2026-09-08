#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"
DIST_DIR="$SCRIPT_DIR/dist"
SMALI_DIR="$SCRIPT_DIR/src/smali"
JAVA_SRC_DIR="$SCRIPT_DIR/src/java"
DEX_DIR="$SCRIPT_DIR/dex"
PAYLOAD_DEX="$DEX_DIR/HealthDataProvider.dex"

# Auto-detect Android SDK (macOS Homebrew, macOS Android Studio, or Ubuntu / GitHub Actions runner)
if [ -z "${ANDROID_HOME:-}" ]; then
    if [ -d "/usr/local/lib/android/sdk" ]; then
        ANDROID_HOME="/usr/local/lib/android/sdk"
    elif [ -d "$HOME/Library/Android/sdk" ]; then
        ANDROID_HOME="$HOME/Library/Android/sdk"
    elif [ -d "/opt/homebrew/share/android-commandlinetools" ]; then
        ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
    fi
fi

ANDROID_JAR=""
if [ -n "${ANDROID_HOME:-}" ] && [ -d "$ANDROID_HOME/platforms" ]; then
    ANDROID_JAR=$(find "$ANDROID_HOME/platforms" -name "android.jar" 2>/dev/null | sort -V | tail -n 1 || true)
fi
if [ -z "$ANDROID_JAR" ] || [ ! -f "$ANDROID_JAR" ]; then
    ANDROID_JAR=$(find /opt/homebrew /usr/local /usr/lib "$HOME" -name "android.jar" 2>/dev/null | sort -V | tail -n 1 || true)
fi

D8=""
if [ -n "${ANDROID_HOME:-}" ] && [ -d "$ANDROID_HOME/build-tools" ]; then
    D8=$(find "$ANDROID_HOME/build-tools" -name "d8" 2>/dev/null | sort -V | tail -n 1 || true)
fi
if [ -z "$D8" ] || [ ! -x "$D8" ]; then
    D8=$(command -v d8 2>/dev/null || find /opt/homebrew /usr/local "$HOME" -name "d8" 2>/dev/null | sort -V | tail -n 1 || true)
fi

mkdir -p "$BUILD_DIR"
mkdir -p "$DIST_DIR"
mkdir -p "$DEX_DIR"

if [ -n "$ANDROID_JAR" ] && [ -f "$ANDROID_JAR" ] && [ -n "$D8" ] && [ -x "$D8" ]; then
    echo "==> 1. Compiling Java sources with android.jar ($ANDROID_JAR)..."
    BIN_DIR="$BUILD_DIR/bin"
    rm -rf "$BIN_DIR"
    mkdir -p "$BIN_DIR"

    javac -cp "$ANDROID_JAR" -source 1.8 -target 1.8 -Xlint:-options -d "$BIN_DIR" \
        $(find "$JAVA_SRC_DIR" -name "*.java")

    echo "==> 2. Converting class files to DEX with d8 ($D8)..."
    rm -f "$PAYLOAD_DEX"
    find "$BIN_DIR" -name "*.class" | xargs "$D8" --min-api 26 --output "$DEX_DIR"
    mv "$DEX_DIR/classes.dex" "$PAYLOAD_DEX"
elif [ -f "$PAYLOAD_DEX" ]; then
    echo "==> Notice: Android SDK not found, using pre-compiled payload DEX at $PAYLOAD_DEX"
else
    echo "ERROR: Neither Android SDK (android.jar + d8) nor pre-compiled $PAYLOAD_DEX found!" >&2
    exit 1
fi

echo "==> 3. Compiling patch smali to classes.dex with apktool..."
TMP_APKTOOL_DIR="$BUILD_DIR/apktool_workspace"
rm -rf "$TMP_APKTOOL_DIR"
mkdir -p "$TMP_APKTOOL_DIR/smali"
cp -r "$SMALI_DIR"/* "$TMP_APKTOOL_DIR/smali/"

cat << 'YAML_EOF' > "$TMP_APKTOOL_DIR/apktool.yml"
version: 3.0.3
apkFileName: patch.apk
isFrameworkApk: false
usesFramework:
  ids:
  - 1
sdkInfo:
  minSdkVersion: '26'
  targetSdkVersion: '34'
YAML_EOF

apktool b "$TMP_APKTOOL_DIR" -o "$BUILD_DIR/patch.apk" >/dev/null

echo "==> 4. Assembling Morphe .mpp package..."
MPP_STAGING="$BUILD_DIR/mpp_staging"
rm -rf "$MPP_STAGING"
mkdir -p "$MPP_STAGING/META-INF"
mkdir -p "$MPP_STAGING/extensions"

unzip -p "$BUILD_DIR/patch.apk" classes.dex > "$MPP_STAGING/classes.dex"
cp "$PAYLOAD_DEX" "$MPP_STAGING/extensions/HealthDataProvider.dex"

cat << 'MF_EOF' > "$MPP_STAGING/META-INF/MANIFEST.MF"
Manifest-Version: 1.0
Name: RingConn Patches
Description: Morphe patches for RingConn: Health Data Provider & Embedded Intervals Direct Dashboard
Version: 1.2.4
Timestamp: 1788720000000
Source: https://github.com/DarioDKM/ringconn-patches
Author: DarioDKM
Website: https://github.com/DarioDKM/ringconn-patches
License: MIT
Patcher-Version: 1.10.0

MF_EOF

(cd "$MPP_STAGING" && zip -q -r "$DIST_DIR/patches-1.2.4.mpp" classes.dex extensions META-INF)
cp "$DIST_DIR/patches-1.2.4.mpp" "$DIST_DIR/patches-1.2.3.mpp"
cp "$DIST_DIR/patches-1.2.4.mpp" "$DIST_DIR/patches-1.2.2.mpp"
cp "$DIST_DIR/patches-1.2.4.mpp" "$DIST_DIR/patches-1.2.1.mpp"
cp "$DIST_DIR/patches-1.2.4.mpp" "$DIST_DIR/patches-1.2.0.mpp"
cp "$DIST_DIR/patches-1.2.4.mpp" "$DIST_DIR/patches-1.1.0.mpp"
cp "$DIST_DIR/patches-1.2.4.mpp" "$DIST_DIR/patches-1.0.0.mpp"

echo "==> Done! Output bundle: $DIST_DIR/patches-1.2.4.mpp"
ls -lh "$DIST_DIR/patches-1.2.4.mpp"

