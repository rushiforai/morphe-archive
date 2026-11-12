#!/usr/bin/env bash
# Vogelkop harness — restore sandbox state from GitHub after a recycle.
# Overlays harness/backup/sandbox/ back into the sandbox (never deletes).
# Set VOGELKOP_RESTORE_DELETE=1 to make the sandbox exactly match the backup.
set -euo pipefail

SANDBOX="${VOGELKOP_SANDBOX:-/home/z/my-project}"
VAULT="$SANDBOX/.vault"
CLONE="$SANDBOX/.harness/vogelkop"
MIRROR="$CLONE/harness/backup/sandbox"

if [ ! -d "$CLONE/.git" ]; then
  echo "ERROR: no clone at $CLONE — run harness/bin/install.sh first (needs the token)"
  exit 1
fi

if [ -x "$VAULT/askpass.sh" ]; then
  export GIT_ASKPASS="$VAULT/askpass.sh" GIT_TERMINAL_PROMPT=0
  git -C "$CLONE" pull --rebase --autostash origin HEAD \
    || echo "WARN: pull failed (offline / expired token?) — restoring local state only"
fi

[ -d "$MIRROR" ] || { echo "ERROR: no mirror at $MIRROR"; exit 1; }

ARGS=(-a)
[ "${VOGELKOP_RESTORE_DELETE:-0}" = "1" ] && ARGS+=(--delete)
rsync "${ARGS[@]}" "$MIRROR/" "$SANDBOX/"

echo "restored $(find "$MIRROR" -type f | wc -l) files into $SANDBOX"
echo "reminders:"
echo "  - big binaries (APKs, keystores, rung builds) are in the 'sandbox-storage' prerelease:"
echo "      gh release download sandbox-storage --repo maniesh-NR/Vogelkop-MorphePatches"
echo "    (or fetch assets via the GitHub API with the vault token)"
echo "  - no cron job to re-create: backups are event-driven — every execution"
echo "    plan ends with harness/bin/backup.sh (ADR 0004)"
echo "  - verify $VAULT/github.token exists and is current (7-day PAT convention)"
