#!/usr/bin/env bash
set -euo pipefail
source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
baseline="$source_dir/../v1.10.1"
output=${1:?output directory required}
java_smali=${2:?D8-disassembled development helper smali directory required}
tools_dir=${3:-}
version=${4:?patch version required}
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
mkdir -p "$work/payloads" "$output"
mkdir -p "$work/url-parser-test"
javac -d "$work/url-parser-test" "$source_dir/java/e/e/a/PlaylistUrlParser.java" "$source_dir/PlaylistUrlParserTest.java"
java -cp "$work/url-parser-test" e.e.a.PlaylistUrlParserTest
cp -a "$baseline/helpers" "$work/payloads/helpers"
cp -a "$baseline/method-delta" "$work/payloads/method-delta"
python3 "$source_dir/patch-payloads.py" "$work/payloads" "$version"
# Assemble version-bearing classes separately so the later DEX merge cannot
# accidentally restore the old published value from recovered helper classes.
version_classes="$work/version-classes/e/e/a"
mkdir -p "$version_classes"
for file in PatchVersion237.smali ModernShorts.smali; do
    cp "$work/payloads/helpers/e/e/a/$file" "$version_classes/$file"
done
grep -Fq "1.10.3-dev.2" "$version_classes/PatchVersion237.smali"
grep -Fq "v1.10.3-dev.2 @chikuwadon" "$version_classes/ModernShorts.smali"

test -f "$java_smali/e/e/a/Dev111.smali"
test -f "$java_smali/e/e/a/Dev116.smali"
dev_dex="$(dirname "$java_smali")/dex/classes.dex"
test -s "$dev_dex"
if [[ -z "$tools_dir" ]]; then
    tools_dir="$work/tools"
    mkdir -p "$tools_dir"
    mvn -q -B -f "$baseline/pom.xml" dependency:copy-dependencies -DoutputDirectory="$tools_dir"
fi
# org.jf.smali.Main has returned zero even after reporting invalid-register
# errors; strict stderr checking ensures an incomplete DEX can NEVER be shipped.
for part in helpers.mpe method-delta.dex; do
    errors="$work/assemble-${part}.stderr"
    java -cp "$tools_dir/*" org.jf.smali.Main assemble "$work/payloads/${part%.*}" -o "$output/$part" 2>"$errors"
    if [[ -s "$errors" ]]; then cat "$errors" >&2; echo "Smali assembler reported diagnostics: $part" >&2; exit 1; fi
    test -s "$output/$part"
done
# Version-only DEX is authoritative over any stale version classes in baseline.
errors="$work/assemble-version.stderr"
java -cp "$tools_dir/*" org.jf.smali.Main assemble "$work/version-classes" -o "$work/version-classes.dex" 2>"$errors"
if [[ -s "$errors" ]]; then cat "$errors" >&2; echo "Smali version assembler reported diagnostics" >&2; exit 1; fi
test -s "$work/version-classes.dex"

# Avoid the previously lossy D8-to-Smali round trip: combine the two actual DEX files.
mkdir -p "$work/merge-classes"
javac -cp "$tools_dir/*" -d "$work/merge-classes" "$source_dir/MergeHelperDex117.java"
java -cp "$work/merge-classes:$tools_dir/*" e.e.a.MergeHelperDex117 \
    "$output/helpers.mpe" "$dev_dex" "$work/version-classes.dex" "$work/helpers-merged.mpe"
mv "$work/helpers-merged.mpe" "$output/helpers.mpe"
# Generated .smali is staged for source/hook verification after assembly.
cp -a "$java_smali/." "$work/payloads/helpers/"
python3 "$source_dir/verify-overlay.py" "$work/payloads" "$output" "$version"
# Confirm that the actual merged runtime DEX contains the critical menu hook.
java -cp "$tools_dir/*" org.jf.baksmali.Main disassemble "$output/helpers.mpe" -o "$work/merged-smali" >/dev/null
grep -Fq 'Dev116;->playlistMenu(Landroid/app/Activity;' "$work/merged-smali/e/e/a/ListActions.smali"
grep -Fq 'Dev115;->thumbnail(Lorg/json/JSONObject;)' "$work/merged-smali/e/e/a/LocalPlaylists\$Page.smali"
grep -Fq 'Dev116;->playlistThumbnail(Landroid/view/View;' "$work/merged-smali/e/e/a/LocalPlaylists\$Page\$2.smali"
grep -Fq '.method public static home(Landroid/app/Activity;Landroid/view/MenuItem;)Z' "$work/merged-smali/e/e/a/LocalPlaylists.smali"
java -cp "$tools_dir/*" org.jf.baksmali.Main disassemble "$output/method-delta.dex" -o "$work/native-smali" >/dev/null
grep -Fq 'Dev116;->nativePlaylistPopup(Ljava/lang/Object;Ljava/lang/Object;)Z' "$work/native-smali/e/e/a/b0\$a.smali"
grep -Fq '.method public static nativePlaylistPopup(' "$work/merged-smali/e/e/a/Dev116.smali"
echo "Merged runtime menu, native popup, thumbnail and drawer hooks: PASS"

