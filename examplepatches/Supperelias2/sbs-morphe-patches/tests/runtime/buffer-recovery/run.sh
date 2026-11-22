#!/usr/bin/env bash
set -euo pipefail
test_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd -- "$test_dir/../../.." && pwd)"
android_jar="${ANDROID_JAR:-}"
if [[ -z "$android_jar" ]]; then
    android_sdk_root="${ANDROID_SDK_ROOT:-${ANDROID_HOME:-/opt/android-sdk}}"
    android_jar="$(find "$android_sdk_root/platforms" -maxdepth 2 -name android.jar -print | sort -V | tail -n 1)"
fi
[[ -f "$android_jar" ]] || { echo "Set ANDROID_JAR to an installed Android SDK platform jar." >&2; exit 2; }
test_output="$(mktemp -d)"
trap 'rm -rf -- "$test_output"' EXIT
javac -cp "$android_jar" -d "$test_output" \
    "$repo_dir/extensions/extension/src/main/java/dev/supperelias2/sbs/morphe/features/BufferRecoveryHooks.java" \
    "$repo_dir/extensions/extension/src/main/java/dev/supperelias2/sbs/morphe/features/Reflect.java" \
    "$test_dir/MorpheSettings.java" \
    "$test_dir/BufferRecoveryHooksTest.java"
java -ea -cp "$test_output:$android_jar" BufferRecoveryHooksTest
