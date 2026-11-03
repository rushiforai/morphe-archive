#!/usr/bin/env bash
set -euo pipefail

project_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ -z ${GITHUB_ACTOR:-} || -z ${GITHUB_TOKEN:-} ]]; then
    if ! command -v gh >/dev/null 2>&1; then
        printf '%s\n' 'Install GitHub CLI and authenticate with read:packages, or set GITHUB_ACTOR and GITHUB_TOKEN.' >&2
        exit 1
    fi
fi

if [[ -z ${GITHUB_ACTOR:-} ]]; then
    GITHUB_ACTOR="$(gh api --hostname github.com user --jq .login)"
fi
if [[ -z ${GITHUB_TOKEN:-} ]]; then
    GITHUB_TOKEN="$(gh auth token --hostname github.com)"
fi

export GITHUB_ACTOR GITHUB_TOKEN
export GRADLE_USER_HOME="${GRADLE_USER_HOME:-${TMPDIR:-/tmp}/nich87-patches-gradle-${UID}}"
umask 077
mkdir -p -- "$GRADLE_USER_HOME"

cd -- "$project_root"
exec ./gradlew --no-daemon --console=plain "$@"
