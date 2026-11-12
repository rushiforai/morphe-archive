#!/usr/bin/env bash
# Vogelkop harness — create today's episode file for the session log.
# Usage: session-log.sh "short session title"
# Prints the path of the created file; fill in its sections afterwards.
set -euo pipefail

CLONE="${VOGELKOP_SANDBOX:-/home/z/my-project}/.harness/vogelkop"
title="${1:-untitled session}"
slug="$(printf '%s' "$title" | tr '[:upper:] ' '[:lower:]-' | tr -cd '[:alnum:]-')"
d="$(date -u +%Y-%m-%d)"
dir="$CLONE/harness/memory/episodes"
mkdir -p "$dir"

f="$dir/$d-$slug.md"
n=1
while [ -e "$f" ]; do n=$((n+1)); f="$dir/$d-$slug-$n.md"; done

cat > "$f" <<EOF
# Episode: $title ($d)

## Context
-

## What happened
-

## Outcome / handoff
-
EOF
echo "$f"
