#!/usr/bin/env bash
# ==============================================================================
# PoC - Direct Patching of Pre-Built PixelBoard Release APK
#
#   ./scripts/build-pixelboard-clipboard.sh
#
# Note: This script serves as a Proof of Concept (PoC) demonstrating that the
#       Clipboard History .mpp patch can directly patch an existing pre-built
#       PixelBoard release APK without rebuilding from Gboard base.
#
# Input : latest released PixelBoard APK (auto-downloaded into input/)
# Patch : patches/GboardClipboardHistory.mpp
# Output: output/PixelBoard-clipboard-poc.apk
#         (package stays com.akshaykadam.pixelboard)
# ==============================================================================

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

init_tools
[[ -f "$MPP_OUT" ]] || { log "patch bundle missing, building it"; "$SCRIPTS_DIR/build-mpp.sh"; }

PIXELBOARD_APK="$(ensure_pixelboard_apk)"

log "pixelboard  : $PIXELBOARD_APK"
log "patch bundle: $MPP_OUT"

OUT_APK="$OUTPUT_DIR/PixelBoard-clipboard-poc.apk"
RESULT="$OUTPUT_DIR/result-pixelboard-clipboard-poc.json"

run_patcher "$OUT_APK" "$RESULT" "$PIXELBOARD_APK" \
    -p="$MPP_OUT"

log "done: $OUT_APK ($(du -h "$OUT_APK" | cut -f1))"
cat "$RESULT"; echo
