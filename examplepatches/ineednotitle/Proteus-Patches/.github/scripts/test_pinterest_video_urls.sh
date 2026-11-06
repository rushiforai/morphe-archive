#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."
test_dir=$(mktemp -d)
trap 'rm -rf "$test_dir"' EXIT
javac -d "$test_dir" extensions/extension/src/main/java/app/template/extension/pinterest/PinterestVideoUrls.java .github/scripts/PinterestVideoUrlsTest.java
java -cp "$test_dir" app.template.extension.pinterest.PinterestVideoUrlsTest
