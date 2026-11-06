#!/usr/bin/env bash
set -euo pipefail

# Semaphore's Ubuntu image does not include the Android SDK. Install the
# command-line tools and the platform/build-tools used by the patches plugin.
SDK_ROOT="${ANDROID_SDK_ROOT:-$HOME/android-sdk}"
ANDROID_API="${ANDROID_API:-36}"
BUILD_TOOLS="${BUILD_TOOLS:-36.0.0}"
CMDLINE_TOOLS_URL="${CMDLINE_TOOLS_URL:-https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip}"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SDKMANAGER="$SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"

if [ ! -x "$SDKMANAGER" ]; then
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT

  curl -fsSL "$CMDLINE_TOOLS_URL" -o "$tmp/cmdline-tools.zip"
  mkdir -p "$SDK_ROOT/cmdline-tools"
  unzip -q "$tmp/cmdline-tools.zip" -d "$SDK_ROOT/cmdline-tools"
  rm -rf "$SDK_ROOT/cmdline-tools/latest"
  mv "$SDK_ROOT/cmdline-tools/cmdline-tools" "$SDK_ROOT/cmdline-tools/latest"
fi

yes | "$SDKMANAGER" --sdk_root="$SDK_ROOT" --licenses >/dev/null || true
"$SDKMANAGER" --sdk_root="$SDK_ROOT" --install \
  "platform-tools" \
  "platforms;android-$ANDROID_API" \
  "build-tools;$BUILD_TOOLS"

echo "sdk.dir=$SDK_ROOT" > "$REPO_ROOT/local.properties"
