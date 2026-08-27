#!/usr/bin/env bash
#
# device_test.sh — full local loop: build → patch → deploy → smoke.
#
# Usage:
#   scripts/device_test.sh <app_id> [base_apk] [--skip-build] [--skip-patch] [--seconds N]
#
# Does not publish anything. Patched APK stays under analysis/<app>/patched/.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

SKIP_BUILD=0
SKIP_PATCH=0
SECONDS_WAIT=25
BASE_APK=""

show_help() {
  usage "$(basename "$0")" "[base_apk] [--skip-build] [--skip-patch] [--seconds N]

  build.sh → patch_local.sh → device_deploy.sh → device_smoke.sh --screenshot"
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  show_help
  exit 0
fi

[[ $# -ge 1 ]] || { show_help; exit 1; }

APP_ARG="$1"
shift
load_app_config "$APP_ARG"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-build) SKIP_BUILD=1; shift ;;
    --skip-patch) SKIP_PATCH=1; shift ;;
    --seconds) SECONDS_WAIT="$2"; shift 2 ;;
    -*)
      die "unknown arg: $1"
      ;;
    *)
      BASE_APK="$1"
      shift
      ;;
  esac
done

log "=== device_test: $APP_ID ($APP_PACKAGE) ==="

"$SCRIPT_DIR/setup_tools.sh" --check 2>/dev/null || "$SCRIPT_DIR/setup_tools.sh"

if [[ "$SKIP_BUILD" -eq 0 ]]; then
  "$SCRIPT_DIR/build.sh"
else
  log "Skipping build"
fi

if [[ "$SKIP_PATCH" -eq 0 ]]; then
  if [[ -n "$BASE_APK" ]]; then
    "$SCRIPT_DIR/patch_local.sh" "$APP_ID" "$BASE_APK"
  else
    "$SCRIPT_DIR/patch_local.sh" "$APP_ID"
  fi
else
  log "Skipping patch"
fi

"$SCRIPT_DIR/device_deploy.sh" "$APP_ID"
"$SCRIPT_DIR/device_smoke.sh" "$APP_ID" --seconds "$SECONDS_WAIT" --screenshot

log "=== device_test complete ==="
