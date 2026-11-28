#!/usr/bin/env bash
# Disassemble an APK into build/decoded with apktool.
#
#   scripts/decompile.sh /path/to/app.apk [output-dir]
#
# Resources are decoded with aapt2; if apktool trips over this application's resource
# table (it does on 2.6.2, while serialising one value), fall back to decoding the
# manifest and smali only. The build never rebuilds resources, so that is enough.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APK="${1:?usage: decompile.sh <apk> [output-dir]}"
OUT="${2:-$ROOT/build/decoded}"
JAVA="$ROOT/tools/jdk/bin/java"

[ -x "$JAVA" ] || { echo "error: run scripts/bootstrap.sh first" >&2; exit 1; }
[ -f "$APK" ] || { echo "error: no such APK: $APK" >&2; exit 1; }

echo "== decoding $APK -> $OUT"
rm -rf "$OUT"
if "$JAVA" -jar "$ROOT/tools/apktool.jar" d -f --use-aapt2 -o "$OUT" "$APK"; then
    echo "== decoded with resources"
else
    echo "== resource decoding failed; retrying without re-encoding resources" >&2
    rm -rf "$OUT"
    "$JAVA" -jar "$ROOT/tools/apktool.jar" d -f -r -o "$OUT" "$APK"
    echo "== decoded (manifest + smali only)"
fi

# `apktool d -r` still writes the raw resource files; verify what we got.
test -d "$OUT" || { echo "error: apktool produced no output" >&2; exit 1; }
printf '== smali dirs: %s\n' "$(find "$OUT" -maxdepth 1 -type d -name 'smali*' -printf '%f ' )"
