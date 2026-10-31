#!/usr/bin/env bash
# ==============================================================================
# Standalone Gboard + Clipboard History (.mpp)
#
#   ./scripts/build-gboard-clipboard.sh
#
# Input : Gboard base APK (input/gboard-merged.apk, input/splits/ or $GBOARD_APK)
# Patch : patches/GboardClipboardHistory.mpp
# Output: output/Gboard-Clipboard-History.apk   (package com.sj010.gboard)
#
# Two stage build on purpose:
#   stage 1  clipboard history on the stock package
#   stage 2  package rename to com.sj010.gboard
# The rename patch normalises the provider authority and the signature
# permission afterwards, so both stages stay compatible with the stock Gboard
# package and the patch only declares Gboard and PixelBoard as targets.
# ==============================================================================

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

init_tools
[[ -f "$MPP_OUT" ]] || { log "patch bundle missing, building it"; "$SCRIPTS_DIR/build-mpp.sh"; }

GBOARD_APK_PATH="$(ensure_gboard_apk)"

log "Gboard base : $GBOARD_APK_PATH"
log "patch bundle: $MPP_OUT"

BASE_APK="$OUTPUT_DIR/A1-Gboard-clipboard-base.apk"
RESULT1="$OUTPUT_DIR/result-gboard-clipboard-base.json"
OUT_APK="$OUTPUT_DIR/Gboard-Clipboard-History.apk"
RESULT2="$OUTPUT_DIR/result-gboard-clipboard.json"

log "stage 1/2: clipboard history"
run_patcher "$BASE_APK" "$RESULT1" "$GBOARD_APK_PATH" \
    -p="$MPP_OUT" \
    -d "Package Rename to com.sj010.gboard"

log "stage 2/2: package rename (com.sj010.gboard)"
run_patcher "$OUT_APK" "$RESULT2" "$BASE_APK" \
    -p="$MPP_OUT" \
    -d "Clipboard Foreground Sync" \
    -d "Gboard Clipboard History"

log "done: $OUT_APK ($(du -h "$OUT_APK" | cut -f1))"
cat "$RESULT2"; echo
