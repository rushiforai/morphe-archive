#!/usr/bin/env bash
#
# init_session.sh — bootstrap scratch workspace for an agent patch session.
#
# Usage:
#   scripts/init_session.sh <app_id> [--goal "description"]...
#
# Creates scratch/<app_id>/ from docs/templates/ (idempotent).
# Updates SESSION HEADER in session.md for resume across chats.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

show_help() {
  usage "$(basename "$0")" "[--goal \"description\"]...

  Bootstrap scratch/<app_id>/ for agent workflow (see AGENTS.md)."
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  show_help
  exit 0
fi

[[ $# -ge 1 ]] || { show_help; exit 1; }

APP_ARG="$1"
shift

if [[ ! -f "$CONFIG_DIR/${APP_ARG}.yaml" ]]; then
  die "no config/apps/${APP_ARG}.yaml — copy config/apps/_template.yaml and fill in package/slug first"
fi

load_app_config "$APP_ARG"

TEMPLATES="$ROOT_DIR/docs/templates"
SCRATCH="$ROOT_DIR/scratch/$APP_ID"
TS="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

GOALS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --goal)
      [[ $# -ge 2 ]] || die "--goal requires a description"
      GOALS+=("$2")
      shift 2
      ;;
    *)
      die "unknown arg: $1"
      ;;
  esac
done

mkdir -p "$SCRATCH"

for f in session.md hypotheses.md analysis-notes.md device-profile.yaml; do
  if [[ ! -f "$SCRATCH/$f" ]]; then
    cp "$TEMPLATES/$f" "$SCRATCH/$f"
    sed -i \
      -e "s/APP_ID_PLACEHOLDER/$APP_ID/g" \
      -e "s/PACKAGE_PLACEHOLDER/$APP_PACKAGE/g" \
      -e "s/TIMESTAMP_PLACEHOLDER/$TS/g" \
      "$SCRATCH/$f" 2>/dev/null || \
      sed -i '' \
        -e "s/APP_ID_PLACEHOLDER/$APP_ID/g" \
        -e "s/PACKAGE_PLACEHOLDER/$APP_PACKAGE/g" \
        -e "s/TIMESTAMP_PLACEHOLDER/$TS/g" \
        "$SCRATCH/$f"
  fi
done

python3 - "$SCRATCH/session.md" "$APP_ID" "$TS" "${GOALS[@]}" <<'PY'
import re
import sys
from pathlib import Path

path = Path(sys.argv[1])
app_id = sys.argv[2]
ts = sys.argv[3]
goals = sys.argv[4:]

text = path.read_text()
phase = "0"
m = re.search(r"^phase:\s*(\d+)", text, re.M)
if m:
    phase = m.group(1)

active = "none"
m = re.search(r"^active_goal:\s*(.+)$", text, re.M)
if m:
    active = m.group(1).strip()

header = (
    "<!--\n"
    "SESSION HEADER — agent: read this block before any tool call.\n"
    f"app_id: {app_id}\n"
    f"phase: {phase}\n"
    f"active_goal: {active}\n"
    f"updated: {ts}\n"
    "-->"
)

if re.search(r"<!--\nSESSION HEADER", text):
    text = re.sub(r"<!--\nSESSION HEADER[\s\S]*?-->", header, text, count=1)
else:
    text = header + "\n\n" + text

if goals:
    block = "\n".join(
        f"1. [ ] {g}\n   - **Local done when:** (add smali assertion after implement)\n"
        f"   - **Device done when:** per acceptance criteria\n"
        for g in goals
    )
    if "1. [ ] Example:" in text:
        text = re.sub(
            r"```markdown\n1\. \[ \] Example:[\s\S]*?```",
            block,
            text,
            count=1,
        )

path.write_text(text)
PY

log "Session ready: $SCRATCH"
log "  session.md        — goals and progress"
log "  hypotheses.md     — debugging hypotheses"
log "  analysis-notes.md — class summaries (read before re-opening smali)"
log "  device-profile.yaml — device + nav cache"
if [[ ${#GOALS[@]} -gt 0 ]]; then
  log "  goals added: ${GOALS[*]}"
fi
