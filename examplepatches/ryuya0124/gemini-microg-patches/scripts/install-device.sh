#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
: "${ADB_SERIAL:?Set ADB_SERIAL to the target device serial or IP:port}"
ADB="${ADB:-$ANDROID_HOME/platform-tools/adb}"
[[ -x "$ADB" ]] || fail 'Set ADB or install Android SDK platform-tools.'
for name in google-login split_config.xxhdpi gemini-login; do require_file "$DIST_DIR/$name.apk"; done
"$ADB" -s "$ADB_SERIAL" get-state
"$ADB" -s "$ADB_SERIAL" install-multiple --no-incremental -r "$DIST_DIR/google-login.apk" "$DIST_DIR/split_config.xxhdpi.apk"
"$ADB" -s "$ADB_SERIAL" install --no-incremental -r "$DIST_DIR/gemini-login.apk"
printf '%s\n' 'Update installed. Open Gemini (Morphe) inside the desired profile and allow its account permissions.'
if [[ "${LAUNCH:-0}" == 1 ]]; then
  "$ADB" -s "$ADB_SERIAL" shell am start --user "${ANDROID_USER:-0}" \
    -n com.google.android.apps.bard.morphe/com.google.android.apps.bard.shellapp.BardEntryPointActivity
fi
