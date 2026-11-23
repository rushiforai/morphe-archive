#!/usr/bin/env bash
# Runs ./gradlew with the given arguments, up to 3 times when it fails on the network: resolving
# the Morphe or Kotlin Gradle plugin from GitHub Packages or Maven fails now and then on GitHub's
# runners. Any other failure (a compile error, a failing task) fails at once.
#
# Usage: bash .github/scripts/gradle-retry.sh :patches:buildAndroid --no-daemon
set -uo pipefail

log=$(mktemp)
for attempt in 1 2 3; do
  ./gradlew "$@" 2>&1 | tee "$log"
  code=${PIPESTATUS[0]}
  if [ "$code" -eq 0 ]; then exit 0; fi
  # Case-insensitive: Gradle writes "could not resolve" in lower case in some messages.
  if ! grep -qiE "Could not resolve|Could not GET|Could not HEAD|Could not download|Read timed out|Connect timed out|Connection reset|status code 5[0-9][0-9]|Received status code (429|5)" "$log"; then
    exit "$code"
  fi
  if [ "$attempt" -lt 3 ]; then
    echo "::warning::Gradle failed on the network (attempt $attempt of 3); trying again in 30 seconds."
    sleep 30
  fi
done
exit "$code"
