#!/usr/bin/env bash
#
# check_patched_apk.sh — verify PairIP / patch hooks in a Morphe-patched APK.
#
# Usage:
#   scripts/check_patched_apk.sh <patched_apk> [app_id]
#
# Compares smali hooks in the patched APK against config/apps/<app_id>.yaml
# verify.smali_assertions (and optional jadx assertions on the primary dex).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"
# shellcheck source=lib/smali_assertions.sh
source "$SCRIPT_DIR/lib/smali_assertions.sh"

show_help() {
  usage "$(basename "$0")" "<patched_apk> [app_id]

  Checks that bytecode patches are present in a Morphe-patched base APK.
  Use this on the APK Morphe produces after patching (not the original)."
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  show_help
  exit 0
fi

[[ $# -ge 1 ]] || { show_help; exit 1; }

APK="$(readlink -f "$1")"
APP_ARG="${2:-}"
[[ -n "$APP_ARG" ]] || die "app_id required (e.g. scripts/check_patched_apk.sh patched.apk meteo3b)"

[[ -f "$APK" ]] || die "APK not found: $APK"

load_app_config "$APP_ARG"
require_cmd rg

SMALI_JSON="$(config_verify_smali_assertions "$APP_ID")"
SMALI_COUNT="$(python3 -c "import json,sys; print(len(json.loads(sys.argv[1])))" "$SMALI_JSON")"
[[ "$SMALI_COUNT" != "0" ]] || die "no verify.smali_assertions in config/apps/${APP_ID}.yaml"

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

log "APK: $APK"
log "Checking smali assertions from config/apps/${APP_ID}.yaml ..."

mapfile -t DEX_FILES < <(extract_dex_from_apk "$APK" "$WORK/dex")
[[ ${#DEX_FILES[@]} -gt 0 ]] || die "no classes*.dex found in $APK"

FAILED=0
if ! run_smali_assertions "$SMALI_JSON" "${DEX_FILES[@]}"; then
  FAILED=1
fi

if [[ "$FAILED" -ne 0 ]]; then
  die "smali assertion check(s) failed — patches may not be in the installed APK"
fi

log "All smali assertions passed."
