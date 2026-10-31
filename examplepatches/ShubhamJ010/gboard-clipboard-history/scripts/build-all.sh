#!/usr/bin/env bash
# ==============================================================================
# Build patched APKs in this repository.
#
#   ./scripts/build-all.sh
#
#   1. patches/GboardClipboardHistory.mpp
#   2. output/Gboard-Clipboard-History.apk      (Gboard + Clipboard History)
#   3. output/PixelBoard-Clipboard-History.apk  (PixelBoard + Clipboard History)
#   4. output/PixelBoard-clipboard-poc.apk      (PoC: direct patch of released APK)
# ==============================================================================

set -euo pipefail

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPTS_DIR/build-mpp.sh"
"$SCRIPTS_DIR/build-gboard-clipboard.sh"
"$SCRIPTS_DIR/build-gboard-clipboard-pixelboard.sh"
"$SCRIPTS_DIR/build-pixelboard-clipboard.sh"

echo
echo "=== outputs ==="
ls -la "$(cd "$SCRIPTS_DIR/.." && pwd)/output"/*.apk
