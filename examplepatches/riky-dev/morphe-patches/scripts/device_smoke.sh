#!/usr/bin/env bash
#
# device_smoke.sh — launch app and fail on early crash / ANR in logcat.
#
# Usage:
#   scripts/device_smoke.sh <app_id> [--seconds N] [--screenshot] [--restore-sleep]
#
# Clears logcat, (re)launches the app, waits, greps for fatal signals /
# AndroidRuntime exceptions / ANR. Optionally saves a screenshot under
# analysis/<app>/patched/. Keeps the screen awake during the wait.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

SECONDS_WAIT=25
DO_SHOT=0
RESTORE_SLEEP=0

show_help() {
  usage "$(basename "$0")" "[--seconds N] [--screenshot] [--restore-sleep]

  Smoke-tests the installed package over adb (crash/ANR + optional screenshot)."
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

while [[ $# -gt 0 ]]; do
  case "$1" in
    --seconds)
      SECONDS_WAIT="$2"
      shift 2
      ;;
    --screenshot)
      DO_SHOT=1
      shift
      ;;
    --restore-sleep)
      RESTORE_SLEEP=1
      shift
      ;;
    *)
      die "unknown arg: $1"
      ;;
  esac
done

SERIAL="$(pick_adb_serial)"
ADB=(adb -s "$SERIAL")

"${ADB[@]}" shell pm path "$APP_PACKAGE" >/dev/null 2>&1 || die "$APP_PACKAGE not installed"

OUT_DIR="$APP_ANALYSIS_DIR/patched"
mkdir -p "$OUT_DIR"
LOG_FILE="$OUT_DIR/smoke-logcat.txt"
SHOT_FILE="$OUT_DIR/smoke-screenshot.png"

device_keep_awake ADB

log "Clearing logcat..."
"${ADB[@]}" logcat -c || true

log "Launching $APP_PACKAGE..."
"${ADB[@]}" shell cmd statusbar collapse >/dev/null 2>&1 || true
"${ADB[@]}" shell monkey -p "$APP_PACKAGE" -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1 || true

log "Waiting ${SECONDS_WAIT}s..."
# Nudge awake halfway so Doze / shade quirks don't blank the shot
if [[ "$SECONDS_WAIT" -gt 10 ]]; then
  sleep $((SECONDS_WAIT / 2))
  "${ADB[@]}" shell input keyevent KEYCODE_WAKEUP >/dev/null 2>&1 || true
  "${ADB[@]}" shell cmd statusbar collapse >/dev/null 2>&1 || true
  sleep $((SECONDS_WAIT - SECONDS_WAIT / 2))
else
  sleep "$SECONDS_WAIT"
fi

"${ADB[@]}" logcat -d -v time >"$LOG_FILE"

PID="$("${ADB[@]}" shell pidof "$APP_PACKAGE" 2>/dev/null | tr -d '\r' || true)"
FG="$("${ADB[@]}" shell dumpsys window 2>/dev/null | rg -m1 'mCurrentFocus|mFocusedApp' || true)"

FAILED=0
if [[ -z "$PID" ]]; then
  echo "FAIL: process not running after ${SECONDS_WAIT}s"
  FAILED=1
else
  echo "OK:   pid $PID"
fi

if rg -q "FATAL EXCEPTION|AndroidRuntime.*FATAL|Process: ${APP_PACKAGE}|ANR in ${APP_PACKAGE}|Fatal signal" "$LOG_FILE"; then
  echo "FAIL: crash/ANR signatures in logcat (see $LOG_FILE)"
  rg -n "FATAL EXCEPTION|AndroidRuntime|ANR in|Fatal signal|${APP_PACKAGE}" "$LOG_FILE" | tail -40
  FAILED=1
else
  echo "OK:   no FATAL/ANR signatures matched"
fi

# CapCut / integrity signal (non-fatal but important)
if rg -q "image_lynx_global_unsafe_pkg_modal|unsafe_pkg_modal" "$LOG_FILE"; then
  echo "WARN: unsafe-package / integrity modal requested in logcat"
fi

echo "FG:   ${FG:-'(unknown)'}"

if [[ "$DO_SHOT" -eq 1 ]]; then
  "${ADB[@]}" shell cmd statusbar collapse >/dev/null 2>&1 || true
  sleep 1
  log "Screenshot → $SHOT_FILE"
  "${ADB[@]}" exec-out screencap -p >"$SHOT_FILE" || warn "screencap failed"
  [[ -s "$SHOT_FILE" ]] && log "Saved $(du -h "$SHOT_FILE" | cut -f1)"
fi

if [[ "$RESTORE_SLEEP" -eq 1 ]]; then
  device_restore_awake ADB
  log "Restored previous sleep settings"
fi

[[ "$FAILED" -eq 0 ]] || die "smoke test failed"
log "Smoke OK"
