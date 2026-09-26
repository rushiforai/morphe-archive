#!/usr/bin/env bash
# Build the patched app from a Morphe patch set.
#
# Layout this script expects:
#   base/       the untouched original APKs (base + config splits)
#   patches/    the Morphe patch set (Kotlin sources)
#   extensions/ the Morphe extension (Java sources), compiled into the patch bundle
#   keystore/   the signing key
#   build/      scratch: the patch bundle, the Morphe CLI, the patched APK
#   out/signed/ the installable split set
#
# Gradle builds the patch bundle (patches/build/libs/patches-<version>.mpp), which
# also carries the compiled extension. The Morphe CLI then applies every patch in
# the bundle to the untouched APK and writes an unsigned APK. Finally
# scripts/sign-all.sh signs that APK and the original config splits with one key,
# because every split in an install set must carry the same signature.
#
# Usage:
#   bash scripts/build.sh            incremental
#   bash scripts/build.sh --clean    rebuild the patch bundle from scratch
#
# Override these settings in the environment to reuse the script for another app:
#   APP_NAME      patches/<APP_NAME> is the patch set to read the app package from
#                 (default: ather)
#   APP_PACKAGE   app package the patches target, read from the patch sources when
#                 unset
#   BASE_APK      untouched base APK (default: base/<APP_PACKAGE>.apk)
#   JAVA_HOME     JDK 17 or newer (default: Android Studio's JBR)
#   ANDROID_HOME  Android SDK (default: ~/Library/Android/sdk)
# scripts/sign-all.sh also reads APP_NAME, SPLITS, KS, KS_PASS, KS_ALIAS, OUT_DIR,
# ANDROID_HOME and BUILD_TOOLS_VERSION.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# The Android Gradle plugin needs the JDK that ships with Android Studio. The
# Morphe CLI runs on the same JDK.
JAVA_HOME="${JAVA_HOME:-/Applications/Android Studio.app/Contents/jbr/Contents/Home}"
export JAVA_HOME
ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
export ANDROID_HOME
JAVA="$JAVA_HOME/bin/java"

# Pin the CLI: the patch bundle format must match the CLI that reads it.
CLI_VERSION="1.16.0"
CLI_SHA256="82a0df2ff881d83d5ca8b4f9a6ce196bd4ac3b87ff147fe37845c296b436806c" # keywatch:ignore
CLI_JAR="$ROOT/build/tools/morphe-desktop-$CLI_VERSION-all.jar"
CLI_URL="https://github.com/MorpheApp/morphe-desktop/releases/download/v$CLI_VERSION/morphe-desktop-$CLI_VERSION-all.jar"

fail() {
  echo "$1" >&2
  exit 1
}

APP_NAME="${APP_NAME:-ather}"

# Each patch declares the package it targets with compatibleWith(...). Patch sets
# for different apps live in directories named after the app, so APP_NAME selects
# the set to read the package from.
detect_app_package() {
  local dir="$ROOT/patches/src/main/kotlin/app/morphe/patches/$APP_NAME"
  [ -d "$dir" ] || return 1
  grep -rhoE 'compatibleWith\("[^"]+"\)' "$dir" |
    sed 's/^compatibleWith("//; s/")$//' |
    sort -u |
    head -n 1
}
APP_PACKAGE="${APP_PACKAGE:-$(detect_app_package || true)}"
[ -n "$APP_PACKAGE" ] || [ -n "${BASE_APK:-}" ] ||
  fail "cannot read the app package from patches/src/main/kotlin/app/morphe/patches/$APP_NAME - set APP_PACKAGE."

BASE_APK="${BASE_APK:-$ROOT/base/$APP_PACKAGE.apk}"
PATCHED_BASE="$ROOT/build/base-unsigned.apk"
MPP="$ROOT/patches/build/libs/patches-$(sed -n 's/^version *= *//p' "$ROOT/gradle.properties").mpp"

[ -x "$JAVA" ] || fail "$JAVA is missing - install Android Studio, or set JAVA_HOME to a JDK 17 or newer."
[ -f "$BASE_APK" ] || fail "${BASE_APK#"$ROOT"/} is missing - copy the untouched APK there (see README.md)."

mkdir -p "$(dirname "$CLI_JAR")"

if [ ! -f "$CLI_JAR" ]; then
  echo "[1/4] download the Morphe CLI $CLI_VERSION"
  curl -fL --retry 3 -o "$CLI_JAR.part" "$CLI_URL"
  mv "$CLI_JAR.part" "$CLI_JAR"
fi
ACTUAL_SHA256="$(shasum -a 256 "$CLI_JAR" | cut -d' ' -f1)"
[ "$ACTUAL_SHA256" = "$CLI_SHA256" ] || fail "$CLI_JAR does not match the expected checksum - delete it and run the script again."

echo "[2/4] build the patch bundle"
if [ "${1:-}" = "--clean" ]; then
  "$ROOT/gradlew" -p "$ROOT" clean --console=plain
fi
"$ROOT/gradlew" -p "$ROOT" :patches:buildAndroid --console=plain
[ -f "$MPP" ] || fail "$MPP was not built."

echo "[3/4] apply the patch set"
rm -f "$PATCHED_BASE"
"$JAVA" -jar "$CLI_JAR" patch \
  -p="$MPP" \
  --unsigned \
  --disable-purge \
  -t="$ROOT/build/cli-tmp" \
  -o="$PATCHED_BASE" \
  "$BASE_APK"

echo "[4/4] sign the patched base APK and the original splits"
bash "$ROOT/scripts/sign-all.sh"
