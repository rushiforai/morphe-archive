#!/usr/bin/env bash
set -euo pipefail
test_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd -- "$test_dir/../../.." && pwd)"
mockable_jar="${1:-${MOCKABLE_ANDROID_JAR:-}}"
test_output="$(mktemp -d)"
trap 'rm -rf -- "$test_output"' EXIT
runtime_dir="$repo_dir/extensions/extension/src/main/java/dev/supperelias2/sbs/morphe"
android_sources=()
compile_options=()
java_classpath="$test_output"
if [[ -n "$mockable_jar" ]]; then
    [[ -f "$mockable_jar" ]] || { echo "Mockable Android jar not found: $mockable_jar" >&2; exit 2; }
    compile_options=(-cp "$mockable_jar")
    java_classpath="$java_classpath:$mockable_jar"
else
    while IFS= read -r -d '' source; do android_sources+=("$source"); done < <(find "$test_dir/stubs/android" -name '*.java' -print0)
fi
javac "${compile_options[@]}" -d "$test_output" \
    "${android_sources[@]}" \
    "$test_dir/stubs/dev/supperelias2/sbs/morphe/MorpheSettingsActivity.java" \
    "$runtime_dir/MorpheSettings.java" \
    "$runtime_dir/features/Reflect.java" \
    "$runtime_dir/features/GeneralHooks.java" \
    "$test_dir/InMemoryPreferences.java" \
    "$test_dir/SettingsRuntimeTest.java"
java -ea -cp "$java_classpath" SettingsRuntimeTest
