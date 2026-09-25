#!/usr/bin/env bash
# Reflection-checks a built patch bundle before it is handed to Morphe:
#
#   tools/mppcheck/run.sh patches/build/libs/patches-1.0.0.mpp
#
# Needs the morphe-desktop jar (it provides the shared patcher/smali runtime).
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
desktop="${MORPHE_DESKTOP_JAR:-$HOME/Downloads/morphe-desktop-1.16.0-all.jar}"
out="$here/out"

mpp="${1:?usage: run.sh <patches.mpp>}"
[ -f "$desktop" ] || { echo "missing $desktop (set MORPHE_DESKTOP_JAR)" >&2; exit 1; }

mkdir -p "$out"
javac -cp "$desktop" -d "$out" "$here"/*.java
java -cp "$desktop:$out" MppCheck "$mpp"
