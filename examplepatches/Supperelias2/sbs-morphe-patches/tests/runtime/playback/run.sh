#!/usr/bin/env bash
set -euo pipefail
test_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd -- "$test_dir/../../.." && pwd)"
test_output="$(mktemp -d)"
trap 'rm -rf -- "$test_output"' EXIT
javac -d "$test_output" \
    "$repo_dir/extensions/extension/src/main/java/dev/supperelias2/sbs/morphe/playback/PlaybackHooks.java" \
    "$test_dir/MorpheSettings.java" \
    "$test_dir/PlaybackStreamProvider.java" \
    "$test_dir/PlaybackHooksTest.java"
java -ea -cp "$test_output" PlaybackHooksTest
