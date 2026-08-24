#!/usr/bin/env bash
#
# extract_apk.sh — unzip XAPK/APKM into analysis/<app>/extract/
#
# Usage: scripts/extract_apk.sh <app_id> [path/to/bundle]
#
# If no bundle path is given, uses the newest .xapk/.apkm/.apk in the analysis dir.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage "$(basename "$0")" "[bundle_path]
  Extracts split APK bundles into analysis/<app>/extract/."
  exit 0
fi

[[ $# -ge 1 ]] || { usage "$(basename "$0")"; exit 1; }

load_app_config "$1"
require_cmd unzip

BUNDLE="${2:-}"
if [[ -z "$BUNDLE" ]]; then
  BUNDLE="$(find_latest_bundle "$APP_ANALYSIS_DIR")" || die "no bundle found in $APP_ANALYSIS_DIR (run fetch_apk.sh first?)"
fi
[[ -f "$BUNDLE" ]] || die "bundle not found: $BUNDLE"

rm -rf "$APP_EXTRACT_DIR"
mkdir -p "$APP_EXTRACT_DIR"

log "Extracting $(basename "$BUNDLE") -> $APP_EXTRACT_DIR"
if [[ "$BUNDLE" == *.apk ]]; then
  cp "$BUNDLE" "$APP_EXTRACT_DIR/${APP_PACKAGE}.apk"
else
  unzip -q -o "$BUNDLE" -d "$APP_EXTRACT_DIR"
fi

BASE_APK="$(find_base_apk "$APP_EXTRACT_DIR" "$APP_PACKAGE")"
[[ -n "$BASE_APK" && -f "$BASE_APK" ]] || die "could not find base APK in $APP_EXTRACT_DIR"

log "Base APK: $BASE_APK"
log "Done"
