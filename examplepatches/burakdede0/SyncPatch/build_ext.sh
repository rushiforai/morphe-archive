#!/bin/zsh
# Builds the runtime extension DEX resources from extension/src:
#   1. javac: compile all extension sources together with compile-time stubs
#      (stubs mirror app internals and are NOT shipped).
#   2. d8: dex each extension package separately into a classes.dex (min-api 26).
#   3. Copy the raw dexes as:
#        patches/src/main/resources/extensions/titlefont.mpe        (TitleFontFix)
#        patches/src/main/resources/extensions/predictiveback.mpe   (PredictiveBackFix)
#      which build_mpp.sh then bundles into patches.mpp.
#
# Optional environment overrides:
#   ANDROID_SDK_DIR   (default: ~/Library/Android/sdk)
set -euo pipefail

cd "$(dirname "$0")"
if [[ -z "${JAVA_HOME:-}" ]]; then
  echo "Error: JAVA_HOME must point to a JDK 17 installation (javac is used)." >&2
  exit 1
fi
export PATH="$JAVA_HOME/bin:$PATH"

ROOT=$(pwd)
SDK_DIR=${ANDROID_SDK_DIR:-$HOME/Library/Android/sdk}
ANDROID_JAR=$(find "$SDK_DIR/platforms" -name "android.jar" | sort -V | tail -1)
D8=$(find "$SDK_DIR/build-tools" -name d8 | sort -V | tail -1)
if [[ -z "$ANDROID_JAR" || -z "$D8" ]]; then
  echo "Error: android.jar / d8 not found under $SDK_DIR." >&2
  exit 1
fi

RES=$ROOT/patches/src/main/resources/extensions
rm -rf "$ROOT/extension/build"
mkdir -p "$ROOT/extension/build/obj" "$RES"

# 1. Compile source + stubs (d8 will only include app/ classes below).
#    android.jar goes on the classpath (--release keeps the emitted class
#    files at Java 11 and -bootclasspath is forbidden there on modern JDKs).
javac \
  --release 11 \
  -classpath "$ANDROID_JAR" \
  -d "$ROOT/extension/build/obj" \
  $(find "$ROOT/extension/src/main/java" "$ROOT/extension/stubs" -name "*.java")

# 2. Dex each extension package separately so a patch bundles only its own classes.
dex_extension() {
  local package_path=$1
  local output=$2
  local outdir=$ROOT/extension/build/dex_${output%.mpe}
  rm -rf "$outdir"
  mkdir -p "$outdir"
  $D8 \
    --release \
    --min-api 26 \
    --lib "$ANDROID_JAR" \
    --output "$outdir" \
    $(find "$ROOT/extension/build/obj/app/syncpatches/$package_path" -name "*.class")
  cp "$outdir/classes.dex" "$RES/$output"
  echo "Built $RES/$output ($(wc -c < "$RES/$output" | tr -d ' ') bytes)"
}

dex_extension titlefont titlefont.mpe
dex_extension predictiveback predictiveback.mpe
