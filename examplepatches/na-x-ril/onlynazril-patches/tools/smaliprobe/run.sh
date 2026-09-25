#!/usr/bin/env bash
# Register-level dump of a class from an APK, via the dexlib2 the patcher itself uses.
#
#   tools/smaliprobe/run.sh "<apk>" <class|scan:package> [method]
#
# Needs the morphe-desktop jar: it carries the repackaged dexlib2. DexKit cannot answer this —
# its MethodData stops at opcodes, and a hook has to know which register holds what.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
desktop="${MORPHE_DESKTOP_JAR:-$HOME/Downloads/morphe-desktop-1.16.0-all.jar}"
out="$here/out"

apk="${1:?usage: run.sh <apk> <class|scan:package> [method]}"; shift
[ -f "$apk" ] || { echo "missing $apk" >&2; exit 1; }
[ -f "$desktop" ] || { echo "missing $desktop (set MORPHE_DESKTOP_JAR)" >&2; exit 1; }

mkdir -p "$out"
javac -cp "$desktop" -d "$out" "$here"/*.java

# _JAVA_OPTIONS is cleared: a stray -Xmx caps the heap a full APK needs, same as tools/dexprobe.
_JAVA_OPTIONS= java -Xmx6g -cp "$desktop:$out" NameRenderProbe "$apk" "$@"
