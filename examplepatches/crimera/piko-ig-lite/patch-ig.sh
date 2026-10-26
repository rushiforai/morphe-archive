#!/usr/bin/env bash
# Patch Instagram with the piko-ig-lite bundle using the Morphe Desktop CLI.
# Defaults to the newly detected 452.1.0.53.64 APKM; an APK/APKM/APKS argument overrides it.
set -euo pipefail

ROOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
cd "$ROOT_DIR"

MORPHE_CLI_JAR="${MORPHE_CLI_JAR:-$ROOT_DIR/../piko/morphe-desktop-1.19.1-all.jar}"
PATCHER_MAX_HEAP_MB="${PATCHER_MAX_HEAP_MB:-4096}"
DEFAULT_APK="$ROOT_DIR/apks/com.instagram.android_452.1.0.53.64-385811006_2dpi_ef1463427f7ba9af16e529ecbf7563e8_apkmirror.com.apkm"
OUTPUT_APK="${OUTPUT_APK:-$HOME/Downloads/piko-ig-lite-452.1.0.53.64-patched.apk}"

if [[ ! "$PATCHER_MAX_HEAP_MB" =~ ^[1-9][0-9]*$ ]]; then
  echo "PATCHER_MAX_HEAP_MB must be a positive integer: $PATCHER_MAX_HEAP_MB" >&2
  exit 1
fi

if [[ ! -f "$MORPHE_CLI_JAR" ]]; then
  echo "Morphe Desktop CLI jar not found: $MORPHE_CLI_JAR" >&2
  echo "Set MORPHE_CLI_JAR or download Morphe Desktop v1.19.1." >&2
  exit 1
fi

HAS_INPUT=false
for arg in "$@"; do
  case "$arg" in
    *.apk|*.apkm|*.apks)
      HAS_INPUT=true
      break
      ;;
  esac
done

if [[ "$HAS_INPUT" == true ]]; then
  INPUT_ARGS=("$@")
else
  if [[ ! -f "$DEFAULT_APK" ]]; then
    echo "Default APKM not found: $DEFAULT_APK" >&2
    exit 1
  fi
  INPUT_ARGS=("$@" "$DEFAULT_APK")
fi

echo "Building current piko-ig-lite patch bundle"
./gradlew :patches:build --no-daemon

VER=$(sed -n 's/^version *= *//p' gradle.properties | head -1)
MPP="patches/build/libs/patches-${VER}.mpp"
if [[ ! -f "$MPP" ]]; then
  echo "Missing patch bundle: $MPP" >&2
  echo "Build it first with: ./gradlew :patches:build --no-daemon" >&2
  exit 1
fi

APK="./apks/com.instagram.android_452.1.0.53.64-385811006_2dpi_ef1463427f7ba9af16e529ecbf7563e8_apkmirror.com.apkm"
FLAGS=()
TRAILING_FLAGS=()
for arg in "${INPUT_ARGS[@]}"; do
  case "$arg" in
    *.apk|*.apkm|*.apks)
      APK="$arg"
      ;;
    --install|-i|--verify-with-sdk)
      # Picocli treats these optional values as the next token, so keep them after the APK.
      TRAILING_FLAGS+=("$arg")
      ;;
    *)
      FLAGS+=("$arg")
      ;;
  esac
done

echo "Morphe Desktop CLI: $MORPHE_CLI_JAR"
echo "Patch bundle: $MPP"
java "-Xmx${PATCHER_MAX_HEAP_MB}m" -jar "$MORPHE_CLI_JAR" patch \
  --patches "$MPP" \
  --keystore Morphe.keystore \
  --out "$OUTPUT_APK" \
  ${FLAGS[@]+"${FLAGS[@]}"} \
  "$APK" \
  ${TRAILING_FLAGS[@]+"${TRAILING_FLAGS[@]}"}

echo "Patched APK: $OUTPUT_APK"
