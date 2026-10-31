#!/usr/bin/env bash
# ==============================================================================
# PixelBoard + Clipboard History (.mpp)
#
#   ./scripts/build-gboard-clipboard-pixelboard.sh
#
# Input : Gboard base APK + PixelBoard patch bundle (auto-downloaded)
# Output: output/PixelBoard-Clipboard-History.apk (package com.akshaykadam.pixelboard)
#
# Two stage build on purpose:
#   stage 1  Gboard + PixelBoard .mpp   -> package renamed to com.akshaykadam.pixelboard
#   stage 2  stage 1 + our .mpp         -> clipboard history entry binds to the renamed package
# (Single stage leaves res/xml/setting_clipboard.xml pointing at the old package,
#  because PixelBoard renames the package in the patcher finalize phase.)
# ==============================================================================

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

init_tools
[[ -f "$MPP_OUT" ]] || { log "patch bundle missing, building it"; "$SCRIPTS_DIR/build-mpp.sh"; }

GBOARD_APK_PATH="$(ensure_gboard_apk)"
PB_MPP="$(ensure_pixelboard_mpp)"

log "Gboard base : $GBOARD_APK_PATH"
log "pixelboard  : $PB_MPP"
log "patch bundle: $MPP_OUT"

BASE_APK="$OUTPUT_DIR/B1-PixelBoard-base.apk"
RESULT1="$OUTPUT_DIR/result-pixelboard-base.json"
OUT_APK="$OUTPUT_DIR/PixelBoard-Clipboard-History.apk"
RESULT2="$OUTPUT_DIR/result-gboard-pixelboard-clipboard.json"

log "stage 1/2: Gboard + PixelBoard .mpp (package rename)"
run_patcher "$BASE_APK" "$RESULT1" "$GBOARD_APK_PATH" \
    -p="$PB_MPP" -O "app_display_name=PixelBoard" -e "Package Rename"

log "stage 2/2: + Clipboard History .mpp"
run_patcher "$OUT_APK" "$RESULT2" "$BASE_APK" \
    -p="$MPP_OUT"

log "done: $OUT_APK ($(du -h "$OUT_APK" | cut -f1))"
cat "$RESULT2"; echo
