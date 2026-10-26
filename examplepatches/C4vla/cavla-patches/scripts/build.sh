#!/data/data/com.termux/files/usr/bin/bash
# Build cavla patches on Termux aarch64.
#
# Why -P override: compileSdk is 36, but the SDK build-tools aapt2 (34.0.4 = 2.19) cannot
# parse android-36's android.jar, and build-tools/36.0.0/aapt2 is a stock ELF that won't run
# under Termux. The Termux-native aapt2 (2.20) handles API 36. The stale global override in
# ~/.gradle/gradle.properties points at 34.0.4 and outranks the project gradle.properties, so
# we pass the correct aapt2 on the command line (-P = highest precedence).
set -e
cd "$(dirname "$0")/.."
export ANDROID_HOME="${ANDROID_HOME:-$HOME/.android-sdk}"
export GITHUB_ACTOR="${GITHUB_ACTOR:-C4vla}"
export GITHUB_TOKEN="${GITHUB_TOKEN:-$(gh auth token)}"
export _JAVA_OPTIONS="-Xmx1536m"
AAPT2="${AAPT2:-/data/data/com.termux/files/usr/bin/aapt2}"
TASK="${1:-:patches:buildAndroid}"
exec ./gradlew "$TASK" --no-daemon --console=plain \
  -Dorg.gradle.workers.max=1 \
  -Pandroid.aapt2FromMavenOverride="$AAPT2"
