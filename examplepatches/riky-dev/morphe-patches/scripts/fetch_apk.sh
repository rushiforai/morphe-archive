#!/usr/bin/env bash
#
# fetch_apk.sh — deterministic download of the latest working 3B Meteo XAPK.
#
# Source: apkpure.net CDN (d.apkpure.net) which serves XAPK (split APK bundle)
# without JS/CAPTCHA for the direct `?version=latest` endpoint.
#
# Outputs into ./analysis/ with a versioned filename and writes a metadata
# dump (analysis/metadata.txt).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
ANALYSIS_DIR="$ROOT_DIR/analysis"
PKG="com.Meteosolutions.Meteo3b"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"

mkdir -p "$ANALYSIS_DIR"

echo "==> Fetching latest XAPK info for $PKG"
# The download page embeds links like:
#   https://d.apkpure.net/b/XAPK/com.Meteosolutions.Meteo3b?version=latest
DL_PAGE="https://apkpure.net/vn/3b-meteo-weather-forecasts/$PKG/download"
curl -fsSL -A "$UA" "$DL_PAGE" -o /tmp/fetch_dlpage.html

VERSION_CODE=$(grep -oP 'versionCode=[0-9]+' /tmp/fetch_dlpage.html | head -1 | grep -oP '[0-9]+')
# version string shown on download page
VERSION_LABEL=$(grep -oP 'version-name" content="[^"]*"' /tmp/fetch_dlpage.html | head -1 | sed 's/.*content="//;s/"//')
if [ -z "$VERSION_CODE" ]; then
  echo "ERROR: could not determine versionCode from download page" >&2
  exit 1
fi

echo "==> versionCode=$VERSION_CODE versionLabel=${VERSION_LABEL:-unknown}"

XAPK_URL="https://d.apkpure.net/b/XAPK/$PKG?version=latest"
OUT="$ANALYSIS_DIR/${PKG}_${VERSION_LABEL:-latest}_vc${VERSION_CODE}.xapk"

echo "==> Downloading $XAPK_URL"
curl -fL -A "$UA" -e "https://apkpure.net/" "$XAPK_URL" -o "$OUT"

echo "==> Recording metadata"
cat > "$ANALYSIS_DIR/metadata.txt" <<EOF
package: $PKG
source: apkpure.net (d.apkpure.net CDN)
version: ${VERSION_LABEL:-latest}
versionCode: $VERSION_CODE
xapk: $(basename "$OUT")
size: $(stat -c%s "$OUT") bytes
fetched: $(date -u +%Y-%m-%dT%H:%M:%SZ)
EOF

echo "==> Done: $OUT"