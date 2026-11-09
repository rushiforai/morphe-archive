#!/usr/bin/env bash
set -euo pipefail
source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
baseline="$source_dir/../v1.10.1"
output=${1:?output directory required}
java_smali=${2:?D8-disassembled development helper smali directory required}
tools_dir=${3:-}
version=${4:?patch version required}
validated="$source_dir/../../compat/validated.zip"
test -s "$validated"
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
grep -Fq "1.10.5" "$version_classes/PatchVersion237.smali"
grep -Fq "v1.10.5 @chikuwadon" "$version_classes/ModernShorts.smali"

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
    if ! java -cp "$tools_dir/*" org.jf.smali.Main assemble "$work/payloads/${part%.*}" -o "$output/$part" 2>"$errors"; then
        cat "$errors" >&2
        echo "Smali assembler failed: $part" >&2
        exit 1
    fi
    if [[ -s "$errors" ]]; then cat "$errors" >&2; echo "Smali assembler reported diagnostics: $part" >&2; exit 1; fi
    test -s "$output/$part"
done
# Version-only DEX is authoritative over any stale version classes in baseline.
errors="$work/assemble-version.stderr"
if ! java -cp "$tools_dir/*" org.jf.smali.Main assemble "$work/version-classes" -o "$work/version-classes.dex" 2>"$errors"; then
    cat "$errors" >&2
    echo "Smali version assembler failed" >&2
    exit 1
fi
if [[ -s "$errors" ]]; then cat "$errors" >&2; echo "Smali version assembler reported diagnostics" >&2; exit 1; fi
test -s "$work/version-classes.dex"

# Avoid the previously lossy D8-to-Smali round trip: combine the two actual DEX files.
mkdir -p "$work/merge-classes"
javac -cp "$tools_dir/*" -d "$work/merge-classes" "$source_dir/MergeHelperDex117.java"
java -cp "$work/merge-classes:$tools_dir/*" e.e.a.MergeHelperDex117 \
    "$output/helpers.mpe" "$dev_dex" "$work/version-classes.dex" "$validated" "$work/helpers-merged.mpe"
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
# Assert that the shipped MPP, not only staged sources, contains popup touch arbitration.
grep -Fq 'PopupTouch125;->dispatch(Landroid/view/View;Ljava/lang/Object;Landroid/view/MotionEvent;)Z' "$work/merged-smali/e/e/a/PopupPinchLayout.smali"
grep -Fq '.method public static dispatch(Landroid/view/View;Ljava/lang/Object;Landroid/view/MotionEvent;)Z' "$work/merged-smali/e/e/a/PopupTouch125.smali"
# Verify the actual assembled DEX no longer relies on an unavailable
# VideoControls.isVisible method and recognizes the confirmed second tap.
if grep -Fq '"isVisible"' "$work/merged-smali/e/e/a/PopupTouch125.smali"; then
    echo "Old popup controls reflection regression is present" >&2
    exit 1
fi
grep -Fq 'isShown()Z' "$work/merged-smali/e/e/a/PopupTouch125.smali"
grep -Fq '.method public end(JJ)I' "$work/merged-smali/e/e/a/PopupTouchPolicy125\$State.smali"
grep -Fq 'PopupTouch125;->doubleTap(Ljava/lang/Object;Landroid/view/MotionEvent;)Z' "$work/native-smali/com/sauzask/nicoid/NicoidPopupViewService\$k.smali"
grep -Fq 'PopupTouch125;->dragging(Ljava/lang/Object;)Z' "$work/native-smali/com/sauzask/nicoid/NicoidPopupViewService.smali"
grep -Fq 'Dev126;->publicMylistTitle(Ljava/lang/Object;Ljava/lang/CharSequence;)V' "$work/merged-smali/e/e/a/TabChrome228.smali"
grep -Fq '.method public static publicMylistTitle(Ljava/lang/Object;Ljava/lang/CharSequence;)V' "$work/merged-smali/e/e/a/Dev126.smali"
if grep -Fq 'stopService(Landroid/content/Intent;)Z' "$work/native-smali/com/sauzask/nicoid/NicoidPopupViewService\$k.smali"; then
    echo "Legacy instant double-tap close is still present" >&2
    exit 1
fi

grep -Fq 'Dev113;->infoMenu(Landroid/app/Activity;Landroid/view/Menu;)V' "$work/native-smali/com/sauzask/nicoid/NicoidVideoInfoActivity.smali"
grep -Fq 'Dev113;->infoSelected(Landroid/app/Activity;Landroid/view/MenuItem;)Z' "$work/native-smali/com/sauzask/nicoid/NicoidVideoInfoActivity.smali"
grep -Fq 'setBackgroundTintList(Landroid/content/res/ColorStateList;)V' "$work/merged-smali/e/e/a/CustomTheme119.smali"
grep -Fq '.method public static infoMenu(Landroid/app/Activity;Landroid/view/Menu;)V' "$work/merged-smali/e/e/a/Dev113.smali"
grep -Fq 'Dev113;->infoMenu(Landroid/app/Activity;Landroid/view/Menu;)V' "$work/native-smali/com/sauzask/nicoid/NicoidVideoInfoActivity.smali"
grep -Fq '.method public onMenuOpened(ILandroid/view/Menu;)Z' "$work/native-smali/com/sauzask/nicoid/NicoidVideoInfoActivity.smali"
grep -Fq 'Unable to move local playlist item after watch later' "$work/merged-smali/e/e/a/Dev113.smali"
# Ensure the shipped DEX contains bytecode-equivalent implementations of all
# 22 classes from the validated local payload. A previous merger missed them.
unzip -p "$validated" classes.dex > "$work/validated.dex"
java -cp "$tools_dir/*" org.jf.baksmali.Main disassemble "$work/validated.dex" -o "$work/validated-smali" >/dev/null
validated_count=0
for validated_class in "$work/validated-smali/e/e/a/BikeRun"*.smali; do
    cmp "$validated_class" "$work/merged-smali/e/e/a/$(basename "$validated_class")" || {
        echo "Validated class mismatch: $(basename "$validated_class")" >&2
        exit 1
    }
    validated_count=$((validated_count+1))
done
test "$validated_count" -eq 22 || { echo "Validated class count mismatch: $validated_count" >&2; exit 1; }
grep -RFq "v1.4.3" "$work/merged-smali/e/e/a/BikeRun"*.smali
echo "Verified 22 validated runtime classes: PASS"
echo "Merged runtime menu, native popup, thumbnail and drawer hooks: PASS"

