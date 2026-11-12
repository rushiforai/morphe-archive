#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
require_file "$MORPHE"
[[ -x "$KOTLINC" ]] || fail 'Run scripts/setup-tools.sh first (or set KOTLINC).'
android_jar="${ANDROID_JAR:-$ANDROID_HOME/platforms/android-36/android.jar}"
require_file "$android_jar"
require_file "$ROOT/tools/r8.jar"
extension_dir="$(mktemp -d "$BUILD_DIR/permission-extension.XXXXXX")"
trap 'rm -rf "$extension_dir"' EXIT
mkdir -p "$extension_dir/classes" "$extension_dir/dex" "$extension_dir/resources/extensions"
javac -encoding UTF-8 -source 8 -target 8 -bootclasspath "$android_jar" \
  -d "$extension_dir/classes" "$ROOT/extensions/src/main/java/app/geminipatch/extension/MicrogPermissions.java"
jar cf "$extension_dir/runtime.jar" -C "$extension_dir/classes" .
"$JAVA" -cp "$ROOT/tools/r8.jar" com.android.tools.r8.D8 --release --min-api 26 --lib "$android_jar" \
  --output "$extension_dir/dex" "$extension_dir/runtime.jar"
# Keep raw extension DEX as an opaque resource so D8 does not treat it as patcher code.
cp "$extension_dir/dex/classes.dex" "$extension_dir/resources/extensions/microg-permissions.bin"
"$KOTLINC" "$ROOT/src/main/kotlin" -cp "$MORPHE" -d "$BUILD_DIR/gemini-patches.jar"
jar uf "$BUILD_DIR/gemini-patches.jar" -C "$extension_dir/resources" extensions/microg-permissions.bin
printf 'Built %s\n' "$BUILD_DIR/gemini-patches.jar"
