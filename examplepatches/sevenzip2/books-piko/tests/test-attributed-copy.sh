#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
test_classes=$(mktemp -d)
trap 'rm -rf "$test_classes"' EXIT
javac --release 8 -encoding UTF-8 -d "$test_classes" \
    extensions/playbooks/src/main/java/app/morphe/extension/playbooks/copy/AttributedCopy.java \
    tests/AttributedCopyTest.java
java -cp "$test_classes" AttributedCopyTest
