#!/usr/bin/env bash
#
# check_env.sh — report development environment readiness.
#
# Usage: scripts/check_env.sh
#
# Exits 0 if all required tools are present; exits 1 with a summary otherwise.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

missing=()
warned=()

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "OK   $cmd"
  else
    echo "MISS $cmd"
    missing+=("$cmd")
  fi
}

check_java() {
  if [[ -n "${JAVA_HOME:-}" && -x "${JAVA_HOME}/bin/java" ]]; then
    local ver
    ver="$("${JAVA_HOME}/bin/java" -version 2>&1 | head -1)"
    echo "OK   JAVA_HOME ($ver)"
    if ! "${JAVA_HOME}/bin/java" -version 2>&1 | grep -qE 'version "1[7-9]|version "[2-9]'; then
      warned+=("JAVA_HOME should be JDK 17+")
      echo "WARN JDK 17+ recommended"
    fi
  else
    echo "MISS JAVA_HOME (JDK 17+)"
    missing+=("JAVA_HOME")
  fi
}

check_gpr() {
  local props="$HOME/.gradle/gradle.properties"
  if [[ -f "$props" ]] && grep -q 'gpr\.user' "$props" && grep -q 'gpr\.key' "$props"; then
    echo "OK   gpr credentials (~/.gradle/gradle.properties)"
  elif [[ -n "${GITHUB_TOKEN:-}" && -n "${GITHUB_ACTOR:-}" ]]; then
    echo "OK   gpr credentials (GITHUB_ACTOR + GITHUB_TOKEN env)"
  else
    echo "MISS gpr credentials (gpr.user/gpr.key in ~/.gradle/gradle.properties)"
    missing+=("gpr credentials")
  fi
}

check_android() {
  local sdk="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
  if [[ -n "$sdk" && -d "$sdk" ]]; then
    echo "OK   ANDROID_HOME ($sdk)"
  else
    echo "WARN ANDROID_HOME not set (needed for extensions build)"
    warned+=("ANDROID_HOME")
  fi
}

echo "=== Environment check ==="
check_java
check_gpr
check_android
echo ""
echo "=== Commands ==="
for cmd in curl unzip rg jadx apktool python3; do
  check_cmd "$cmd"
done
echo ""
echo "=== Gradle wrapper ==="
if [[ -x "$ROOT_DIR/gradlew" ]]; then
  echo "OK   ./gradlew"
else
  echo "MISS ./gradlew"
  missing+=("gradlew")
fi

if ((${#warned[@]})); then
  echo ""
  echo "Warnings:"
  printf '  - %s\n' "${warned[@]}"
fi

if ((${#missing[@]})); then
  echo ""
  echo "Missing (${#missing[@]}):"
  printf '  - %s\n' "${missing[@]}"
  exit 1
fi

echo ""
echo "Environment looks good."
