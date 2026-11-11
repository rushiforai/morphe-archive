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
grep -Fq "1.11.1-dev.2" "$version_classes/PatchVersion237.smali"
grep -Fq "v1.11.1-dev.2 @chikuwadon" "$version_classes/ModernShorts.smali"

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
# Verify the actual shipped SettingsBackupData class, not the Java-only
# source mirror: otherwise direct-write settings silently disappear in backups.
for backup_key in \
  nicoid_single_tap_control_region nicoid_single_tap_region_open_only \
  nicoid_ambient_enabled nicoid_ambient_mode_0 nicoid_ambient_mode_1 nicoid_ambient_mode_2 \
  nicoid_ambient_sides nicoid_ambient_intensity nicoid_ambient_spread \
  nicoid_ambient_softness nicoid_ambient_brightness nicoid_ambient_contrast \
  nicoid_ambient_saturation nicoid_ambient_vibrance nicoid_ambient_response \
  nicoid_ambient_rate nicoid_ambient_resolution; do
  grep -Fq "\"$backup_key\"" "$work/merged-smali/e/e/a/SettingsBackupData.smali" || {
    echo "Missing SettingsBackupData key in assembled DEX: $backup_key" >&2
    exit 1
  }
done
grep -Fq 'AmbientSampling148;->shouldSample(' "$work/merged-smali/e/e/a/AmbientLight\$Layer.smali"
grep -Fq 'AmbientLight;->foreground(' "$work/merged-smali/e/e/a/PlayerControls194.smali"
grep -Fq 'AmbientLight;->fullscreen(' "$work/merged-smali/e/e/a/FullscreenViewport209.smali"
grep -Fq 'AmbientLight;->popup(' "$work/merged-smali/e/e/a/PopupControls193.smali"
grep -Fq 'AmbientLight;->defaultHidden(' "$work/merged-smali/e/e/a/PopupControl222.smali"
grep -Fq 'AmbientSettings;->install(' "$work/merged-smali/e/e/a/Review181.smali"
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
grep -Fq 'TapControls141;->activityTouch(Landroid/app/Activity;Landroid/view/MotionEvent;)V' "$work/native-smali/com/sauzask/nicoid/NicoidVideoActivity.smali"
# The popup's stock single callback must be replaced in the delivered delta.
grep -Fq '.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z' "$work/native-smali/com/sauzask/nicoid/NicoidPopupViewService\$k.smali"
grep -Fq 'PopupTouch125;->doubleTap(Ljava/lang/Object;Landroid/view/MotionEvent;)Z' "$work/native-smali/com/sauzask/nicoid/NicoidPopupViewService\$k.smali"
grep -Fq 'PopupTouch125;->dragging(Ljava/lang/Object;)Z' "$work/native-smali/com/sauzask/nicoid/NicoidPopupViewService.smali"
# Verify account-history URL repair at all three entry points in assembled DEX.
for file in 'MultiTabs227.smali' 'SavedTabs227$Tab.smali' 'TabRoutes228.smali'; do
    grep -Fq 'TabHistory127;->url(ILjava/lang/String;)Ljava/lang/String;' "$work/merged-smali/e/e/a/$file"
done
grep -Fq '.method public static url(ILjava/lang/String;)Ljava/lang/String;' "$work/merged-smali/e/e/a/TabHistory127.smali"
# Ensure the added preference, reset path and both recognizers are present
# in the distributed DEX (not just in the development Java sources).
grep -Fq 'Dev128;->install(Landroid/app/Activity;Landroid/widget/LinearLayout;)V' "$work/merged-smali/e/e/a/GestureControls110.smali"
grep -Fq 'Dev128;->reset(Landroid/content/Context;)V' "$work/merged-smali/e/e/a/GestureControls110.smali"
grep -Fq 'Dev128;->allowClaim(Landroid/content/Context;Ljava/lang/String;)Z' "$work/merged-smali/e/e/a/GestureControls110.smali"
grep -Fq 'Dev128;->allowClaim(Landroid/content/Context;Ljava/lang/String;)Z' "$work/merged-smali/e/e/a/Dev118.smali"
grep -Fq 'gesture_vertical_reversal_enabled' "$work/merged-smali/e/e/a/Dev128.smali"
grep -Fq 'Dev130;->styleSensitivity(Landroid/widget/TextView;)V' "$work/merged-smali/e/e/a/GestureControls110.smali" || { echo "Missing finalized Dev130 hook: step 104" >&2; exit 1; }
grep -Fq 'Dev130;->stripFinalStop(Landroid/widget/TextView;)V' "$work/merged-smali/e/e/a/GestureControls110.smali" || { echo "Missing finalized Dev130 hook: step 105" >&2; exit 1; }
grep -Fq 'Dev131;->installSettings(Landroid/preference/PreferenceActivity;)V' "$work/merged-smali/e/e/a/SettingsTools.smali"
grep -Fq 'Dev132;->decorateBar(Ljava/lang/Object;Landroid/widget/LinearLayout;)V' "$work/merged-smali/e/e/a/MultiTabs227\$Host.smali"
grep -Fq 'Dev132;->show(Landroid/app/Activity;)V' "$work/merged-smali/e/e/a/GestureControls110.smali"
grep -Fq 'Dev132;->installSettings(Landroid/preference/PreferenceActivity;)V' "$work/merged-smali/e/e/a/Dev111.smali"
grep -Fq 'Dev139;->connect(Landroid/view/View;Landroid/view/TextureView;)V' "$work/merged-smali/e/e/a/VideoOutput227.smali"
grep -Fq 'Dev139;->hold(Ljava/lang/Object;)Le/e/a/Dev139$Retention;' "$work/merged-smali/e/e/a/RetainedPlayback137.smali"
grep -Fq 'Dev138;->perform(Landroid/app/Activity;Ljava/lang/String;)Z' "$work/merged-smali/e/e/a/GestureControls110.smali"
grep -Fq 'Dev138;->extend([Ljava/lang/String;)[Ljava/lang/String;' "$work/merged-smali/e/e/a/GestureControls110.smali"
grep -Fq 'Dev111;->singleReturnOwner(Landroid/app/Activity;)Z' "$work/merged-smali/e/e/a/RetainedPlayback137.smali"
grep -Fq 'Dev132;->sameRanking(Ljava/lang/Object;Ljava/lang/Object;)Z' "$work/merged-smali/e/e/a/MultiTabs227.smali"
grep -Fq '0x10000' "$work/merged-smali/e/e/a/RankingPeriod\$1.smali"
grep -Fq 'Dev134;->applyPeriod(Landroid/app/Activity;Landroid/content/Intent;)Z' "$work/merged-smali/e/e/a/RankingPeriod\$1.smali"
grep -Fq 'nicoid_saved_tab_id' "$work/merged-smali/e/e/a/Dev134.smali"
grep -Fq 'e.e.a.Refresh192' "$work/merged-smali/e/e/a/Dev134.smali"
grep -Fq 'overridePendingTransition(II)V' "$work/merged-smali/e/e/a/RankingPeriod\$1.smali"
grep -Fq 'TabPager233;->destroy(Landroid/app/Activity;)V' "$work/merged-smali/e/e/a/MultiTabs227\$Host.smali"
grep -Fq 'Dev132;->rememberClosed(Ljava/lang/Object;Ljava/lang/Object;)V' "$work/merged-smali/e/e/a/MultiTabs227\$Host.smali"
grep -Fq 'nicoid_tab_bar_buttons' "$work/merged-smali/e/e/a/Dev132.smali"
grep -Fq 'RankingTabIdentity133;->same(ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Z' "$work/merged-smali/e/e/a/Dev132.smali" || { echo "Ranking canonical matching missing" >&2; exit 1; }
grep -Fq 'Dev131;->applyToPlayer(Landroid/view/View;)V' "$work/native-smali/com/devbrackets/android/exomedia/ui/widget/VideoView.smali" || { echo "Missing finalized Dev131 hook: step 107" >&2; exit 1; }
grep -Fq 'Dev131;->requestServiceFocus(Landroid/content/Context;Landroid/media/AudioManager;Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I' "$work/native-smali/com/sauzask/nicoid/NicoidPopupViewService.smali" || { echo "Missing finalized Dev131 hook: step 108" >&2; exit 1; }

grep -Fq 'When off, vertical-only gestures' "$work/merged-smali/e/e/a/Dev128.smali"

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

