#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Compares the patch names of the Reseam bundle with those of the Morphe bundle, in a two-repo session: the clones of
# baconreader-reseam-patches and baconreader-morphe-patches side by side (/home/user). Same file in both repos.
#   tools/compare-patch-lists.sh
# It lists each bundle as patcher-specific-build.md, "Two-repo sessions", does (reseam bundle list with JDK 17, Morphe
# Desktop's list-patches -o -p -v with JDK 21), so build both bundles first. It prints each side's count and the names
# only in one of them. "Patches entry in settings" is expected only in Reseam: Morphe has it as its internal
# settingsPatch, without a name.
# Exits 0 when that is the only difference, 1 when there is another, 2 when a bundle can't be listed.
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
reseam_repo="$root/baconreader-reseam-patches"
morphe_repo="$root/baconreader-morphe-patches"
jdk17=/opt/patch-tools/jdk17
jdk21=/opt/patch-tools/jdk21
morphe_desktop=/opt/patch-tools/morphe-desktop.jar
expected="Patches entry in settings"

fail() { echo "compare-patch-lists: $*" >&2; exit 2; }

for d in "$reseam_repo" "$morphe_repo" "$jdk17" "$jdk21"; do
  [ -d "$d" ] || fail "$d is missing (patcher-specific-build.md, \"Two-repo sessions\")"
done
[ -f "$morphe_desktop" ] || fail "$morphe_desktop is missing: run baconreader-morphe-patches/tools/morphe-desktop.sh"
reseam_bin="${RESEAM_BIN:-$(command -v reseam || true)}"
[ -n "$reseam_bin" ] || fail "no reseam CLI: set RESEAM_BIN or put reseam on PATH"
reseam_bundle="$reseam_repo/build/reseam/baconreader-patches.reseam"
[ -f "$reseam_bundle" ] || fail "no Reseam bundle: build it (./gradlew bundle --no-daemon) in $reseam_repo"
morphe_bundle="$(ls -t "$morphe_repo"/patches/build/libs/patches-*.mpp 2> /dev/null | head -1)"
[ -n "$morphe_bundle" ] || fail "no Morphe bundle: build it (./gradlew buildAndroid --no-daemon) in $morphe_repo"

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

# Runs a list command, its output in $work/<name>.out; on failure, shows its stderr without Java's proxy line.
list() {
  local name="$1"
  shift
  if ! "$@" > "$work/$name.out" 2> "$work/$name.err"; then
    grep -v '^Picked up JAVA_TOOL_OPTIONS' "$work/$name.err" >&2 || true
    fail "listing the $name bundle failed"
  fi
}

list Reseam env JAVA_HOME="$jdk17" PATH="$jdk17/bin:$PATH" "$reseam_bin" bundle list "$reseam_bundle"
list Morphe env JAVA_HOME="$jdk21" PATH="$jdk21/bin:$PATH" "$jdk21/bin/java" -jar "$morphe_desktop" \
  list-patches -o -p -v --patches "$morphe_bundle"

# Reseam: "   8. [on] Patches entry in settings - Adds a Patches entry…". Morphe: "Name: Spoof client".
awk '/^ *[0-9]+\. \[[a-z]+\] / { sub(/^ *[0-9]+\. \[[a-z]+\] /, ""); i = index($0, " - "); print (i ? substr($0, 1, i - 1) : $0) }' \
  "$work/Reseam.out" | LC_ALL=C sort > "$work/reseam"
sed -n 's/^Name: //p' "$work/Morphe.out" | LC_ALL=C sort > "$work/morphe"
[ -s "$work/reseam" ] || fail "no patch names in reseam bundle list's output"
[ -s "$work/morphe" ] || fail "no patch names in Morphe Desktop list-patches' output"

echo "Reseam: $(wc -l < "$work/reseam") patches ($reseam_bundle)"
echo "Morphe: $(wc -l < "$work/morphe") patches ($morphe_bundle)"

status=0
only_reseam="$(LC_ALL=C comm -23 "$work/reseam" "$work/morphe")"
only_morphe="$(LC_ALL=C comm -13 "$work/reseam" "$work/morphe")"
if grep -qxF "$expected" <<< "$only_reseam"; then
  echo "Only in Reseam, expected: $expected (Morphe's internal settingsPatch)"
  only_reseam="$(grep -vxF "$expected" <<< "$only_reseam" || true)"
elif grep -qxF "$expected" "$work/reseam"; then
  echo "Expected only in Reseam, but Morphe has it too: $expected"
  status=1
else
  echo "Expected in Reseam, but missing: $expected"
  status=1
fi
while IFS= read -r name; do
  if [ -n "$name" ]; then
    echo "Only in Reseam: $name"
    status=1
  fi
done <<< "$only_reseam"
while IFS= read -r name; do
  if [ -n "$name" ]; then
    echo "Only in Morphe: $name"
    status=1
  fi
done <<< "$only_morphe"
if [ "$status" -eq 0 ]; then
  echo "Same patches, apart from the expected one."
fi
exit "$status"
