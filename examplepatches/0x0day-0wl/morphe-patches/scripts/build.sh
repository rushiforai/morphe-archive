#!/usr/bin/env bash
#
# build.sh — build the Morphe patch bundle (.mpp).
#
# Usage: scripts/build.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  echo "Usage: $(basename "$0")"
  echo "Builds patches/build/libs/patches-*.mpp"
  exit 0
fi

log "Building patch bundle"
cd "$ROOT_DIR"
./gradlew :patches:buildAndroid --console=plain

MPP="$(find "$ROOT_DIR/patches/build/libs" -name 'patches-*.mpp' ! -name '*sources*' ! -name '*javadoc*' | head -1)"
[[ -n "$MPP" ]] || die "build succeeded but no .mpp found"
log "Done: $MPP"
