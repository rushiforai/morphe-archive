#!/bin/sh
# Lists the native-library ABIs inside each APK of an XAPK (read-only).
tmp=$(mktemp -d)
unzip -q "$1" -d "$tmp"
for a in "$tmp"/*.apk; do
  abis=$(unzip -Z1 "$a" 'lib/*' 2>/dev/null | cut -d/ -f2 | sort -u | tr '\n' ' ')
  [ -n "$abis" ] && echo "$(basename "$a"): $abis"
done
echo "split_apks: $(grep -o '"split_apks":\[[^]]*\]' "$tmp/manifest.json" | grep -o '"id":"[^"]*"' | tr '\n' ' ')"
rm -rf "$tmp"
