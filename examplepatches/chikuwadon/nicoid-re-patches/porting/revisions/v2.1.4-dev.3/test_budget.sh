#!/usr/bin/env bash
set -euo pipefail
here=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
base="$here/../v2.1.4-dev.1"
classes=$(mktemp -d)
trap 'rm -rf "$classes"' EXIT
javac -encoding UTF-8 -d "$classes" \
  "$base/stubs/e/e/a/q.java" \
  "$here/java/e/e/a/CommentSource280.java" \
  "$here/java/e/e/a/ScrollingTimeline267.java" \
  "$base/tests/CommentPerformanceTest.java" \
  "$here/tests/CommentBudgetRegression.java"
java -cp "$classes" e.e.a.CommentPerformanceTest
java -cp "$classes" e.e.a.CommentBudgetRegression
