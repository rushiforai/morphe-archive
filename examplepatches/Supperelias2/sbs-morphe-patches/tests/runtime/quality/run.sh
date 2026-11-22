#!/usr/bin/env bash
set -euo pipefail

# Pure JVM semantics/reflection test. No Android runtime or Gradle is required.
quality_test_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
quality_repo_dir="$(cd -- "$quality_test_dir/../../.." && pwd)"
quality_classes_dir="$(mktemp -d "${TMPDIR:-/tmp}/morphe-quality-tests.XXXXXX")"
trap 'rm -rf -- "$quality_classes_dir"' EXIT

javac --release 8 -d "$quality_classes_dir" \
    "$quality_test_dir/MorpheSettings.java" \
    "$quality_repo_dir/extensions/extension/src/main/java/dev/supperelias2/sbs/morphe/features/QualityHooks.java" \
    "$quality_test_dir/QualityHooksTest.java"
java -cp "$quality_classes_dir" QualityHooksTest
