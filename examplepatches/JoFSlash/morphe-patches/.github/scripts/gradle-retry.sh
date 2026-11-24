#!/usr/bin/env bash
# Runs ./gradlew with the given arguments, again when it fails on the network: resolving the Morphe
# or Kotlin Gradle plugin from GitHub Packages or Maven fails now and then on GitHub's runners. Any
# other failure (a compile error, a failing task) fails at once. GRADLE_ATTEMPTS sets how many tries
# (default 3); the wait between them doubles from 30 seconds.
#
# Usage: bash .github/scripts/gradle-retry.sh :patches:buildAndroid --no-daemon
set -uo pipefail

log=$(mktemp)
attempts=${GRADLE_ATTEMPTS:-3}
wait=30
for attempt in $(seq 1 "$attempts"); do
  ./gradlew "$@" 2>&1 | tee "$log"
  code=${PIPESTATUS[0]}
  if [ "$code" -eq 0 ]; then exit 0; fi
  # Case-insensitive: Gradle writes "could not resolve" in lower case in some messages.
  if ! grep -qiE "Could not resolve|Could not GET|Could not HEAD|Could not download|Read timed out|Connect timed out|Connection reset|status code 5[0-9][0-9]|Received status code (429|5)" "$log"; then
    exit "$code"
  fi
  if [ "$attempt" -lt "$attempts" ]; then
    echo "::warning::Gradle failed on the network (attempt $attempt of $attempts); trying again in $wait seconds."
    sleep "$wait"
    wait=$((wait * 2))
  fi
done
exit "$code"
