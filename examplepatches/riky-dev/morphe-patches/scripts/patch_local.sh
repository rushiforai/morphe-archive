#!/usr/bin/env bash
#
# patch_local.sh — patch a base APK with the local .mpp via Morphe Desktop CLI.
#
# Usage:
#   scripts/patch_local.sh <app_id> [base_apk] [-- morphe-cli-args...]
#
# Writes analysis/<app>/patched/<package>-patched.apk

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

show_help() {
  usage "$(basename "$0")" "[base_apk] [-- extra morphe args...]

  Patches the base APK with patches/build/libs/patches-*.mpp.
  Requires tools/morphe-desktop.jar (run setup_tools.sh first)."
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  show_help
  exit 0
fi

[[ $# -ge 1 ]] || { show_help; exit 1; }

APP_ARG="$1"
shift
load_app_config "$APP_ARG"

MORPHE_JAR="$ROOT_DIR/tools/morphe-desktop.jar"
[[ -f "$MORPHE_JAR" ]] || die "missing $MORPHE_JAR — run scripts/setup_tools.sh"

MPP="$(find "$ROOT_DIR/patches/build/libs" -name 'patches-*.mpp' ! -name '*sources*' ! -name '*javadoc*' | sort | tail -1)"
[[ -n "$MPP" && -f "$MPP" ]] || die "no .mpp found — run scripts/build.sh first"

APK=""
EXTRA=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --)
      shift
      EXTRA+=("$@")
      break
      ;;
    *)
      if [[ -z "$APK" ]]; then
        APK="$1"
        shift
      else
        EXTRA+=("$1")
        shift
      fi
      ;;
  esac
done

if [[ -z "$APK" ]]; then
  rel="$(config_verify_apk "$APP_ID" 2>/dev/null || true)"
  if [[ -n "${rel:-}" && -f "$ROOT_DIR/$rel" ]]; then
    APK="$ROOT_DIR/$rel"
  else
    APK="$(find_base_apk "$APP_EXTRACT_DIR" "$APP_PACKAGE")" || true
  fi
fi

[[ -n "$APK" && -f "$APK" ]] || die "base APK not found (run extract_apk.sh or pass path)"
APK="$(readlink -f "$APK")"

OUT_DIR="$APP_ANALYSIS_DIR/patched"
mkdir -p "$OUT_DIR"
OUT_APK="$OUT_DIR/${APP_PACKAGE}-patched.apk"

ensure_java21
require_cmd java
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

log "MPP:  $MPP"
log "APK:  $APK"
log "OUT:  $OUT_APK"

# Morphe writes next to the input by default; work in OUT_DIR via copy/link.
WORK_APK="$OUT_DIR/${APP_PACKAGE}-input.apk"
ln -sfn "$APK" "$WORK_APK"

# Clean previous outputs for this package
rm -f "$OUT_APK" "$OUT_DIR"/*-patched.apk 2>/dev/null || true

# Remove prior outputs for a clean result path.
rm -rf "$OUT_DIR/${APP_PACKAGE}-input" "$OUT_APK"

cd "$OUT_DIR"
java -jar "$MORPHE_JAR" patch \
  --patches="$MPP" \
  "$WORK_APK" \
  "${EXTRA[@]+"${EXTRA[@]}"}"

# Morphe Desktop writes under <stem>/<stem>-Morphe-*.apk (or *-patched.apk).
FOUND="$(find "$OUT_DIR" -type f \( -name '*-Morphe-*.apk' -o -name '*-patched.apk' \) ! -name "${APP_PACKAGE}-patched.apk" | sort | tail -1 || true)"
if [[ -n "$FOUND" && -f "$FOUND" ]]; then
  cp -f "$FOUND" "$OUT_APK"
fi

[[ -f "$OUT_APK" ]] || die "patched APK not produced under $OUT_DIR"
rm -f "$WORK_APK"
log "Done: $OUT_APK ($(du -h "$OUT_APK" | cut -f1))"
echo "$OUT_APK"
