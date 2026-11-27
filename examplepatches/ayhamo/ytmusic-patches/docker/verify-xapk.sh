#!/bin/sh
# Prints the signing certificate of every APK inside an XAPK, without changing the XAPK.
# Usage: verify-xapk.sh <file.xapk>
set -e
tmp=$(mktemp -d)
unzip -q "$1" -d "$tmp"
for a in "$tmp"/*.apk; do
  echo "== $(basename "$a")"
  /opt/android-sdk/build-tools/36.0.0/apksigner verify --print-certs "$a" 2>&1 | grep -E "SHA-256|DOES NOT|ERROR" || true
done
rm -rf "$tmp"
