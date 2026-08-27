#!/usr/bin/env bash
#
# device_deploy.sh — uninstall stock app, install patched APK, launch.
#
# Usage:
#   scripts/device_deploy.sh <app_id> [patched_apk]
#
# Requires an authorized adb device (USB or wireless). Prefers Wi‑Fi when both
# are present. Keeps the screen awake for the duration of install/launch.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

show_help() {
  usage "$(basename "$0")" "[patched_apk]

  Uninstalls the package (wipes that app's data only), installs the patched
  APK, and launches the default launcher activity."
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  show_help
  exit 0
fi

[[ $# -ge 1 ]] || { show_help; exit 1; }

APP_ARG="$1"
shift
load_app_config "$APP_ARG"
prefer_sdk_adb

APK="${1:-}"
if [[ -z "$APK" ]]; then
  APK="$APP_ANALYSIS_DIR/patched/${APP_PACKAGE}-patched.apk"
fi
[[ -f "$APK" ]] || die "patched APK not found: $APK (run patch_local.sh first)"
APK="$(readlink -f "$APK")"

SERIAL="$(pick_adb_serial)"
ADB=(adb -s "$SERIAL")

log "Device: $SERIAL"
log "APK:    $APK"
log "Pkg:    $APP_PACKAGE"

device_keep_awake ADB

if "${ADB[@]}" shell pm path "$APP_PACKAGE" >/dev/null 2>&1; then
  log "Uninstalling existing $APP_PACKAGE (app data for this package only)..."
  "${ADB[@]}" uninstall "$APP_PACKAGE" || warn "uninstall returned non-zero; trying install -r"
fi

log "Installing..."
# Prefer push+pm for large APKs (more reliable than streamed install over flaky USB).
REMOTE="/data/local/tmp/${APP_PACKAGE}-patched.apk"
log "Pushing to $REMOTE ..."
"${ADB[@]}" push "$APK" "$REMOTE"
log "pm install..."
if ! "${ADB[@]}" shell pm install -r -d "$REMOTE"; then
  "${ADB[@]}" shell rm -f "$REMOTE" >/dev/null 2>&1 || true
  die "pm install failed"
fi
"${ADB[@]}" shell rm -f "$REMOTE" >/dev/null 2>&1 || true

log "Launching..."
"${ADB[@]}" shell cmd statusbar collapse >/dev/null 2>&1 || true
if ! "${ADB[@]}" shell monkey -p "$APP_PACKAGE" -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1; then
  warn "monkey launch failed; trying am start"
  "${ADB[@]}" shell am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER "$APP_PACKAGE" || true
fi

log "Deployed $APP_PACKAGE on $SERIAL"
