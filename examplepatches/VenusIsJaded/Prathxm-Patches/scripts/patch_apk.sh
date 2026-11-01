#!/bin/bash
# Patch a real Chess.com APK/APKM with a locally built .mpp (end-to-end check of the bundle).
#
#   scripts/patch_apk.sh <patches.mpp> <chess.apkm|apk> [output.apk] [extra morphe-cli args...]
#
# Prints the "Applied:" / failure lines. With DUMP=1 the patched dex files are disassembled into
# $PATCH_WORK/patched-smali so the injected hooks can be inspected.
#
# morphe-cli unpacks and rebuilds the whole APK in java.io.tmpdir. Where /tmp is a small tmpfs
# that runs out of space ("No space left on device"), so all temporary files go to $PATCH_WORK.
set -euo pipefail

MPP="$(realpath "$1")"; APK="$(realpath "$2")"; OUTAPK="${3:-}"
shift $(( $# >= 3 ? 3 : 2 ))
TOOLS="${TOOLS:-$HOME/mpp-tools}"
WORK="${PATCH_WORK:-$HOME/mpp-patch}"
mkdir -p "$WORK/tmp"
[ -n "$OUTAPK" ] || OUTAPK="$WORK/chess-patched.apk"

# morphe-cli 1.17.0 is compiled for Java 21.
JAVA="${JAVA:-java}"
if ! "$JAVA" -version 2>&1 | grep -qE 'version "(2[1-9]|[3-9][0-9])'; then
  echo "morphe-cli needs Java 21+ (set JAVA=/path/to/java)"; exit 1
fi

rm -rf "$WORK/tmp"/* "$WORK/patch-tmp" "$OUTAPK"
"$JAVA" -Xmx1400m -Djava.io.tmpdir="$WORK/tmp" -jar "$TOOLS/morphe-cli.jar" patch \
  -p "$MPP" -o "$OUTAPK" --unsigned -t "$WORK/patch-tmp" "$@" "$APK" > "$WORK/patch.log" 2>&1 || true
rm -rf "$WORK/tmp"/* "$WORK/patch-tmp" "$WORK"/*-merged.apk
grep -E 'Applied|failed|FAIL|SEVERE' "$WORK/patch.log" || true

if grep -q 'SEVERE' "$WORK/patch.log" || [ ! -s "$OUTAPK" ]; then
  echo "Patching failed (see $WORK/patch.log)"; exit 1
fi
echo "Patched APK: $OUTAPK"

if [ "${DUMP:-0}" = 1 ]; then
  rm -rf "$WORK/patched-dex" "$WORK/patched-smali" && mkdir -p "$WORK/patched-dex"
  (cd "$WORK/patched-dex" && unzip -o -q "$OUTAPK" 'classes*.dex')
  for f in "$WORK"/patched-dex/classes*.dex; do
    "$TOOLS/jdk17/bin/java" -Xmx600m -jar "$TOOLS/baksmali.jar" d -j 2 "$f" -o "$WORK/patched-smali" >/dev/null 2>&1
  done
  rm -rf "$WORK/patched-dex"
  echo "Disassembled into $WORK/patched-smali"
fi
