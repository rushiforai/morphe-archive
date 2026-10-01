#!/usr/bin/env bash
#
# setup_tools.sh — download Morphe Desktop CLI jar into tools/ (gitignored).
#
# Usage: scripts/setup_tools.sh [--check]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

TOOLS_DIR="$ROOT_DIR/tools"
MORPHE_JAR="$TOOLS_DIR/morphe-desktop.jar"
CHECK_ONLY=0

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  echo "Usage: $(basename "$0") [--check]
Downloads the latest Morphe Desktop all.jar into tools/morphe-desktop.jar."
  exit 0
fi

[[ "${1:-}" == "--check" ]] && CHECK_ONLY=1

require_cmd curl
require_cmd adb
require_cmd python3

log "adb:  $(adb version 2>&1 | head -1)"

JDK_DIR="$TOOLS_DIR/jdk-21"
ensure_portable_jdk21() {
  if [[ -x "$JDK_DIR/bin/java" ]]; then
    return 0
  fi
  log "Fetching portable Temurin JDK 21 into tools/jdk-21 ..."
  mkdir -p "$TOOLS_DIR"
  local tmp="$TOOLS_DIR/temurin21.tar.gz"
  curl -fL --progress-bar \
    'https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jdk/hotspot/normal/eclipse?project=jdk' \
    -o "$tmp"
  tar -xzf "$tmp" -C "$TOOLS_DIR"
  rm -f "$tmp"
  local extracted
  extracted="$(find "$TOOLS_DIR" -maxdepth 1 -type d -name 'jdk-21*' ! -name 'jdk-21' | head -1)"
  [[ -n "$extracted" ]] || die "JDK 21 extract failed"
  ln -sfn "$(basename "$extracted")" "$JDK_DIR"
  "$JDK_DIR/bin/java" -version
}

if [[ "$CHECK_ONLY" -eq 1 ]]; then
  [[ -f "$MORPHE_JAR" ]] || die "missing $MORPHE_JAR (run without --check)"
  [[ -x "$JDK_DIR/bin/java" ]] || die "missing $JDK_DIR (run without --check)"
  ensure_java21
  log "java: $(java -version 2>&1 | head -1)"
  log "OK: $MORPHE_JAR"
  exit 0
fi

mkdir -p "$TOOLS_DIR"
ensure_portable_jdk21
ensure_java21
log "java: $(java -version 2>&1 | head -1)"

API="https://api.github.com/repos/MorpheApp/morphe-desktop/releases/latest"
log "Resolving latest Morphe Desktop release..."
ASSET_URL="$(curl -fsSL "$API" | python3 -c '
import json, sys
data = json.load(sys.stdin)
for a in data.get("assets", []):
    name = a.get("name", "")
    if name.endswith("-all.jar"):
        print(a["browser_download_url"], file=sys.stderr)
        print(a["browser_download_url"])
        break
else:
    raise SystemExit("no *-all.jar asset found")
')"

[[ -n "$ASSET_URL" ]] || die "could not resolve Morphe Desktop download URL"

TMP="$TOOLS_DIR/morphe-desktop.jar.partial"
log "Downloading Morphe Desktop..."
curl -fL --progress-bar -o "$TMP" "$ASSET_URL"
mv "$TMP" "$MORPHE_JAR"
log "Done: $MORPHE_JAR ($(du -h "$MORPHE_JAR" | cut -f1))"
