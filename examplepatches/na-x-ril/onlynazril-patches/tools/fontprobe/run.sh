#!/usr/bin/env bash
# Typeface-level look at an APK, via the dexlib2 the patcher itself uses.
#
#   tools/fontprobe/run.sh "<apk>" factories|hubs|class:<name>
#
# Needs the morphe-desktop jar: it carries the repackaged dexlib2.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
desktop="${MORPHE_DESKTOP_JAR:-$HOME/Downloads/morphe-desktop-2.0.0-all.jar}"
out="$here/out"

apk="${1:?usage: run.sh <apk> <factories|hubs|class:<name>>}"; shift
[ -f "$apk" ] || { echo "missing $apk" >&2; exit 1; }
[ -f "$desktop" ] || { echo "missing $desktop (set MORPHE_DESKTOP_JAR)" >&2; exit 1; }

mkdir -p "$out"
javac -cp "$desktop" -d "$out" "$here"/*.java

# _JAVA_OPTIONS is cleared: a stray -Xmx caps the heap a full APK needs.
_JAVA_OPTIONS= java -Xmx6g -cp "$desktop:$out" FontProbe "$apk" "$@"
