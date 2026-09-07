#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
"$ROOT/scripts/compile-patches.sh"
require_file "$ROOT/tools/r8.jar"
ANDROID_JAR="${ANDROID_JAR:-$ANDROID_HOME/platforms/android-36/android.jar}"
require_file "$ANDROID_JAR"
dex_dir="$(mktemp -d "$BUILD_DIR/mpp-dex.XXXXXX")"
trap 'rm -rf "$dex_dir"' EXIT
"$JAVA" -cp "$ROOT/tools/r8.jar" com.android.tools.r8.D8 \
  --release --min-api 26 --lib "$ANDROID_JAR" --classpath "$MORPHE" \
  --output "$dex_dir" "$BUILD_DIR/gemini-patches.jar"
python3 "$ROOT/scripts/package-mpp.py" "$dex_dir"
version="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$ROOT/patches-bundle.json")"
bundle="$BUILD_DIR/release/gemini-microg-patches-$version.mpp"
"$KOTLINC" "$ROOT/scripts/kotlin/VerifyMpp.kt" -cp "$MORPHE" -d "$BUILD_DIR/verify-mpp.jar"
"$JAVA" -cp "$BUILD_DIR/verify-mpp.jar:$MORPHE" VerifyMppKt "$bundle" "$version"
"$JAVA" -jar "$MORPHE" list-patches --patches "$bundle" --out "$BUILD_DIR/mpp-patch-list.txt"
printf 'Verified Morphe bundle: %s\n' "$bundle"
