#!/usr/bin/env bash
#
# decompile.sh — decompile base APK with jadx and apktool.
#
# Usage: scripts/decompile.sh <app_id> [path/to/base.apk]
#
# Outputs:
#   analysis/<app>/jadx_out/
#   analysis/<app>/apktool_out/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage "$(basename "$0")" "[base_apk_path]
  Decompiles the base APK with jadx and apktool."
  exit 0
fi

[[ $# -ge 1 ]] || { usage "$(basename "$0")"; exit 1; }

load_app_config "$1"
require_cmd jadx
require_cmd apktool

APK="${2:-}"
if [[ -z "$APK" ]]; then
  APK="$(find_base_apk "$APP_EXTRACT_DIR" "$APP_PACKAGE")" || true
fi
[[ -n "$APK" && -f "$APK" ]] || die "base APK not found (run extract_apk.sh first or pass path)"

JADX_OUT="$APP_ANALYSIS_DIR/jadx_out"
APKTOOL_OUT="$APP_ANALYSIS_DIR/apktool_out"

log "Decompiling with jadx: $APK"
rm -rf "$JADX_OUT"
jadx -d "$JADX_OUT" "$APK" >/dev/null

log "Decompiling with apktool: $APK"
rm -rf "$APKTOOL_OUT"
apktool d -f -o "$APKTOOL_OUT" "$APK" >/dev/null

log "jadx sources: $JADX_OUT/sources"
log "apktool smali: $APKTOOL_OUT/smali"
log "Done"
