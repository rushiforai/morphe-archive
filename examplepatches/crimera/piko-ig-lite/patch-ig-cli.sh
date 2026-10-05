#!/usr/bin/env bash
# Patch Instagram with the piko-ig-lite bundle, using the local morphe-patcher CLI.
#
# This runs the morphe-patcher checkout in ../morphe-patcher (`:cli:installDist`) instead of
# the shipped morphe-desktop release jar, so it picks up local patcher changes. Build the
# runner once with:
#
#   (cd ../morphe-patcher && ./gradlew :cli:installDist)
#
# Output goes to OUTPUT_APK (default ~/Downloads/piko-ig-lite-patched-cli.apk). Patch failures
# print full stack traces (--stacktrace) so resolver errors are actionable.
#
# Arguments: a bare name enables a patch (-e), --flags pass through, and an .apk/.apkm/.apks
# path replaces the default target.
set -euo pipefail

ROOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
cd "$ROOT_DIR"

INSTALL=false
PATCHER_MAX_HEAP_MB="${PATCHER_MAX_HEAP_MB:-4096}"
# Local runner built by morphe-patcher's :cli:installDist task.
MORPHE_CLI_BIN="${MORPHE_CLI_BIN:-$ROOT_DIR/../morphe-patcher/cli/build/install/morphe-patcher-cli/bin/morphe-patcher-cli}"
FASTDEPLOY_PLATFORM_TOOLS_VERSION="${FASTDEPLOY_PLATFORM_TOOLS_VERSION:-36.0.0}"
FASTDEPLOY_PLATFORM_TOOLS_DIR="${FASTDEPLOY_PLATFORM_TOOLS_DIR:-${HOME}/.cache/piko/platform-tools-${FASTDEPLOY_PLATFORM_TOOLS_VERSION}}"

if [[ ! "$PATCHER_MAX_HEAP_MB" =~ ^[1-9][0-9]*$ ]]; then
  echo "PATCHER_MAX_HEAP_MB must be a positive integer: $PATCHER_MAX_HEAP_MB" >&2
  exit 1
fi

VER=$(sed -n 's/^version *= *//p' gradle.properties | head -1)
MPP="patches/build/libs/patches-${VER}.mpp"
if [[ ! -f "$MPP" ]]; then
  echo "Missing patch bundle: $MPP" >&2
  echo "Build it first with: ./gradlew :patches:build" >&2
  exit 1
fi

if [[ ! -x "$MORPHE_CLI_BIN" ]]; then
  echo "Missing local patcher CLI: $MORPHE_CLI_BIN" >&2
  echo "Build it first with: (cd \"$ROOT_DIR/../morphe-patcher\" && ./gradlew :cli:installDist)" >&2
  echo "Or point MORPHE_CLI_BIN at another runner." >&2
  exit 1
fi

DEFAULT_APK="./apks/448.0.0.52.84.apk"
OUTPUT_APK="${OUTPUT_APK:-$HOME/Downloads/piko-ig-lite-patched-cli.apk}"
APK="$DEFAULT_APK"
FLAGS=()
for arg in "$@"; do
  case "$arg" in
    --install|--fastdeploy)
      INSTALL=true
      ;;
    *.apk|*.apkm|*.apks)
      APK="$arg"
      ;;
    --*)
      FLAGS+=("$arg")
      ;;
    *)
      FLAGS+=("-e" "$arg")
      ;;
  esac
done

echo "Patcher JVM heap limit: ${PATCHER_MAX_HEAP_MB} MB"
echo "Local patcher CLI: $MORPHE_CLI_BIN"
echo "Patch bundle: $MPP"

# No --striplibs here: the local CLI does not implement architecture stripping yet, and the
# target APK ships arm64-v8a only, so stripping would be a no-op for it.
JAVA_OPTS="-Xmx${PATCHER_MAX_HEAP_MB}m" "$MORPHE_CLI_BIN" patch \
  --patches "$MPP" \
  --keystore Morphe.keystore \
  -f \
  --stacktrace \
  -o "$OUTPUT_APK" \
  ${FLAGS[@]+"${FLAGS[@]}"} \
  "$APK"

echo "Patched APK: $OUTPUT_APK"

if [[ "$INSTALL" != true ]]; then
  exit 0
fi

if [[ -n "${ADB:-}" ]]; then
  ADB_BIN="$ADB"
else
  ADB_BIN="$FASTDEPLOY_PLATFORM_TOOLS_DIR/adb"

  if [[ ! -x "$ADB_BIN" ]]; then
    case "$(uname -s)" in
      Darwin) PLATFORM_TOOLS_OS=darwin ;;
      Linux) PLATFORM_TOOLS_OS=linux ;;
      *)
        echo "Unsupported host OS; set ADB=/path/to/adb" >&2
        exit 1
        ;;
    esac

    if ! command -v curl >/dev/null || ! command -v unzip >/dev/null; then
      echo "curl and unzip are required to download pinned adb" >&2
      exit 1
    fi

    DOWNLOAD_DIR=$(mktemp -d "${TMPDIR:-/tmp}/piko-platform-tools.XXXXXX")
    trap 'rm -rf "$DOWNLOAD_DIR"' EXIT
    mkdir -p "$(dirname "$FASTDEPLOY_PLATFORM_TOOLS_DIR")"

    echo "Downloading platform-tools ${FASTDEPLOY_PLATFORM_TOOLS_VERSION}"
    curl -fsSL --retry 3 \
      -o "$DOWNLOAD_DIR/platform-tools.zip" \
      "https://dl.google.com/android/repository/platform-tools_r${FASTDEPLOY_PLATFORM_TOOLS_VERSION}-${PLATFORM_TOOLS_OS}.zip"
    unzip -q "$DOWNLOAD_DIR/platform-tools.zip" -d "$DOWNLOAD_DIR"
    rm -rf "$FASTDEPLOY_PLATFORM_TOOLS_DIR"
    mv "$DOWNLOAD_DIR/platform-tools" "$FASTDEPLOY_PLATFORM_TOOLS_DIR"
    ADB_BIN="$FASTDEPLOY_PLATFORM_TOOLS_DIR/adb"
  fi
fi

if [[ ! -x "$ADB_BIN" ]]; then
  echo "adb not found or not executable: $ADB_BIN" >&2
  echo "Unset ADB to let the script download platform-tools ${FASTDEPLOY_PLATFORM_TOOLS_VERSION}." >&2
  exit 1
fi

ADB_VERSION=$("$ADB_BIN" version | awk '/^Version / { version=$2; sub(/-.*/, "", version); print version; exit }')
if [[ "$ADB_VERSION" != "$FASTDEPLOY_PLATFORM_TOOLS_VERSION" ]]; then
  echo "Wrong adb version: ${ADB_VERSION:-unknown} (need $FASTDEPLOY_PLATFORM_TOOLS_VERSION)" >&2
  echo "Use ADB=/path/to/adb or unset ADB for the pinned copy." >&2
  exit 1
fi

echo "Checking fast deploy support"
FASTDEPLOY_PROBE=$("$ADB_BIN" install --fastdeploy -r "${OUTPUT_APK}.probe.apk" 2>&1 || true)
if grep -Eq 'Fast Deploy .*ignoring|fastdeploy is disabled' <<<"$FASTDEPLOY_PROBE"; then
  printf '%s\n' "$FASTDEPLOY_PROBE" >&2
  echo "This adb cannot use fast deploy; refusing a full APK transfer." >&2
  exit 1
fi

echo "Installing APK with fast deploy: $OUTPUT_APK"
"$ADB_BIN" install --user 0 --fastdeploy -r "$OUTPUT_APK"
