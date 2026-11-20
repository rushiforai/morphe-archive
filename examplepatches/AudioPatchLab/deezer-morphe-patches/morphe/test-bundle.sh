#!/usr/bin/env bash
set -euo pipefail

usage() {
    printf 'Usage: %s [--patch "Exact name"] [--install <serial>] [--open <Deezer URL>]\n' "$0" >&2
    exit 2
}

project_dir=$(cd -- "$(dirname -- "$0")" && pwd)
workspace=$(dirname -- "$project_dir")
test_dir="$workspace/.local/test"
sdk_root=${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Android/Sdk}}
java_bin=${JAVA_HOME:+$JAVA_HOME/bin/}java
desktop_jar=${MORPHE_DESKTOP_JAR:-"$workspace/.local/tools/morphe-desktop.jar"}
archive=${DEEZER_ARCHIVE:?Set DEEZER_ARCHIVE to the original supported APKM archive}
version=$(<"$project_dir/VERSION")
bundle="$project_dir/build/deezer-local-$version.mpp"
keystore="$test_dir/test-keystore.p12"
package=deezer.android.app.morphe

selected_patch=
serial=
uri=
while [[ $# -gt 0 ]]; do
    [[ $# -ge 2 && -n $2 ]] || usage
    case $1 in
        --patch) selected_patch=$2 ;;
        --install) serial=$2 ;;
        --open) uri=$2 ;;
        *) usage ;;
    esac
    shift 2
done
[[ -z $uri || -n $serial ]] || usage

for file in "$desktop_jar" "$archive" "$bundle" "$keystore"; do
    if [[ ! -r $file ]]; then
        printf 'Required file missing or unreadable: %s\n' "$file" >&2
        exit 1
    fi
done

selection=()
if [[ -n $selected_patch ]]; then selection=(-e "$selected_patch" --exclusive); fi

adb="$sdk_root/platform-tools/adb"
if [[ -n $serial ]]; then
    # Keep this helper on a test emulator. Refuse any unqualified installation.
    if [[ $serial != emulator-* || $("$adb" -s "$serial" get-state) != device ]]; then
        printf 'Test emulator unavailable: %s\n' "$serial" >&2
        exit 1
    fi
fi

output=$(mktemp -d "$test_dir/run.XXXXXXXX")
"$java_bin" -jar "$desktop_jar" patch -p "$bundle" "${selection[@]}" \
    --keystore "$keystore" --striplibs x86_64 \
    -t "$output/work" -r "$output/result.json" -o "$output/deezer.apk" "$archive" \
    2>&1 | tee "$output/patch.log"

# Desktop may report success after rebuilding an APK even when patching failed.
# Never install that output or treat an unchanged APK as a successful test.
python3 - "$output/result.json" "$selected_patch" <<'PY'
import json
import sys

with open(sys.argv[1]) as report:
    result = json.load(report)
if (not result.get("success") or not result.get("appliedPatches")
        or result.get("failedPatches")
        or any(not step.get("success") for step in result.get("stepResults", []))):
    raise SystemExit("Patching failed; inspect result.json and patch.log. Output will not be installed.")
if not sys.argv[2] and len(result["appliedPatches"]) != 8:
    raise SystemExit("Expected all eight public patches; output will not be installed.")
PY

"$sdk_root/build-tools/36.1.0/apksigner" verify "$output/deezer.apk"
rm -rf -- "$output/work"
if [[ -n $serial ]]; then
    "$adb" -s "$serial" install -r "$output/deezer.apk"
    if [[ -n $uri ]]; then
        launch=$("$adb" -s "$serial" shell am start -W -a android.intent.action.VIEW \
            -d "$uri" -p "$package")
    else
        launch=$("$adb" -s "$serial" shell am start -W \
            -n "$package/com.deezer.android.ui.activity.LauncherActivity")
    fi
    printf '%s\n' "$launch"
    [[ $launch == *'Status: ok'* ]]
fi
printf '%s\n' "$output"
