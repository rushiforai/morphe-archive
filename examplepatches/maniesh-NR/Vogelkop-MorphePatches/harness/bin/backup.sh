#!/usr/bin/env bash
# Vogelkop harness — frequent sandbox backup to GitHub.
#
# Mirrors the sandbox into harness/backup/sandbox/ (filtered for a PUBLIC
# repo), records a manifest, guards against secret leaks, then commits and
# pushes EVERYTHING pending in the clone (uncommitted project work included).
#
# Env overrides:
#   VOGELKOP_SANDBOX   sandbox root            (default /home/z/my-project)
#   VOGELKOP_TOKEN     path to the GitHub PAT  (default <sandbox>/.vault/github.token,
#                                               fallback <sandbox>/upload/Vogelkop access key.txt)
#   VOGELKOP_DRY_RUN   1 = everything except commit/push
# Exit codes: 0 = pushed or clean no-op; 1 = error; 2 = secret guard tripped; 3 = oversize file
set -euo pipefail

SANDBOX="${VOGELKOP_SANDBOX:-/home/z/my-project}"
VAULT="$SANDBOX/.vault"
CLONE="$SANDBOX/.harness/vogelkop"
MIRROR="$CLONE/harness/backup/sandbox"
RUNLOG="$SANDBOX/.harness/backup.log"
UPLOAD_KEY="$SANDBOX/upload/Vogelkop access key.txt"

log() {
  local line="[$(date -u +%Y-%m-%dT%H:%M:%SZ)] $*"
  mkdir -p "$SANDBOX/.harness"
  echo "$line"
  printf '%s\n' "$line" >> "$RUNLOG"
}

import_token() { # $1 = source file
  mkdir -p "$VAULT"; cp -- "$1" "$VAULT/github.token"; chmod 600 "$VAULT/github.token"
}

# ---- 1. token ----------------------------------------------------------------
TOKEN_FILE="${VOGELKOP_TOKEN:-$VAULT/github.token}"
if [ ! -f "$TOKEN_FILE" ]; then
  if [ -f "$UPLOAD_KEY" ]; then
    import_token "$UPLOAD_KEY"; TOKEN_FILE="$VAULT/github.token"
    log "token: imported from upload/ into vault"
  else
    log "ERROR: no token at $TOKEN_FILE (and no uploaded key)"; exit 1
  fi
fi
# materialize the vault copy (askpass.sh reads from there)
if [ "$TOKEN_FILE" != "$VAULT/github.token" ]; then
  mkdir -p "$VAULT"; cp -- "$TOKEN_FILE" "$VAULT/github.token"; chmod 600 "$VAULT/github.token"
fi
TOKEN="$(tr -d '[:space:]' < "$TOKEN_FILE")"
[ -n "$TOKEN" ] || { log "ERROR: token file is empty"; exit 1; }

# ---- 2. preflight --------------------------------------------------------------
[ -d "$CLONE/.git" ] || { log "ERROR: $CLONE missing — run harness/bin/install.sh"; exit 1; }
command -v rsync >/dev/null 2>&1 || { log "ERROR: rsync not installed"; exit 1; }
command -v git   >/dev/null 2>&1 || { log "ERROR: git not installed"; exit 1; }
mkdir -p "$SANDBOX/.harness"

gc() { git -C "$CLONE" "$@"; }

# single-instance lock (concurrent end-of-prompt backups)
if command -v flock >/dev/null 2>&1; then
  exec 9>"$SANDBOX/.harness/backup.lock"
  flock -n 9 || { log "another backup is running — skipping"; exit 0; }
fi

# git identity (local to the clone; matches repo history convention)
[ -n "$(gc config user.email 2>/dev/null || true)" ] || gc config user.email "maniesh-NR@users.noreply.github.com"
[ -n "$(gc config user.name  2>/dev/null || true)" ] || gc config user.name  "maniesh-NR"

# ---- 3. mirror the sandbox (public-repo-safe filters) ---------------------------
# upload/    : user APKs (copyrighted binaries), pasted screenshots, token files
# skills/    : agent-platform internals
# secrets/binaries/caches: repo .gitignore is the second layer (see ADR 0002)
rsync -a --delete --delete-excluded --max-size=95m \
  --exclude='/.harness' --exclude='/.vault' --exclude='/.git' \
  --exclude='/.tools' \
  --exclude='/upload'   --exclude='/skills' \
  --exclude='node_modules' --exclude='__pycache__' --exclude='.cache' \
  --exclude='.venv' --exclude='.next' --exclude='*.pyc' --exclude='.DS_Store' \
  --exclude='.env' --exclude='*.local' \
  --exclude='morphe.keystore' --exclude='morphe-signing.key' \
  --exclude='*.apk' --exclude='*.apkm' --exclude='*.xapk' --exclude='*.zip' \
  "$SANDBOX/" "$MIRROR/"

# manifest: paths + sizes of the WHOLE sandbox (names only, no content),
# so a post-recycle session knows what existed even for excluded files
( cd "$SANDBOX" && find . -path ./.git -prune -o -path ./.harness -prune -o \
    -path ./.vault -prune -o -type f -printf '%10s  %p\n' | sort -k2 ) \
  > "$CLONE/harness/state/MANIFEST.txt"

# ---- 4. oversize guard (GitHub blocks files > 100 MiB) ---------------------------
BIG="$(cd "$CLONE" && git ls-files --others --exclude-standard -z \
      | xargs -0 -r stat -c '%s %n' 2>/dev/null \
      | awk -v m=$((95*1024*1024)) '$1 > m {print $2}')"
if [ -n "$BIG" ]; then
  log "OVERSIZE: untracked file(s) >95MiB would fail the push:"
  printf '%s\n' "$BIG" | sed 's/^/  /'
  log "move them out of the clone, or upload with harness/bin/storage_upload.py"
  exit 3
fi

# ---- 5. secret guard (hard backstop before every push) ----------------------------
hit() { grep -raFl --exclude-dir=.git -- "$1" "$CLONE" 2>/dev/null || true; }
HITS="$(hit "$TOKEN")"
if [ -f "$UPLOAD_KEY" ] && ! cmp -s "$UPLOAD_KEY" "$VAULT/github.token"; then
  ALT="$(tr -d '[:space:]' < "$UPLOAD_KEY")"
  [ -n "$ALT" ] && HITS="${HITS:+$HITS$'\n'}$(hit "$ALT")"
fi
if [ -n "$HITS" ]; then
  log "SECRET GUARD TRIPPED — token string found in:"
  printf '%s\n' "$HITS" | sed 's/^/  /' | tee -a "$RUNLOG"
  log "refusing to commit/push; remove the secret, then re-run"
  exit 2
fi

# ---- 6. commit ---------------------------------------------------------------------
TS="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
gc add -A

if gc diff --cached --quiet && [ "$(gc rev-list --count '@{u}..HEAD' 2>/dev/null || echo 1)" = "0" ]; then
  log "clean — nothing to back up"; exit 0
fi

FILES="$(find "$MIRROR" -type f 2>/dev/null | wc -l)"
SIZE="$(du -sh "$MIRROR" 2>/dev/null | cut -f1)"
CHANGED="$(gc diff --cached --name-status | sed -n '1,60p')"
cat > "$CLONE/harness/state/LATEST.md" <<EOF
# Last backup manifest

- Backup (UTC): $TS
- Sandbox root: $SANDBOX
- Mirror: $FILES files, $SIZE (filtered; see decisions/0002)
- Trigger: last step of every execution plan (see AGENTS.md)

## Changed since the previous backup (first 60)
\`\`\`
$CHANGED
\`\`\`
EOF
gc add -A

if [ "${VOGELKOP_DRY_RUN:-0}" = "1" ]; then
  log "DRY RUN — would commit and push now"; exit 0
fi

gc commit -q -m "chore(backup): sandbox snapshot $TS"

# ---- 7. push (token rotation + rebase recovery) -------------------------------------
export GIT_ASKPASS="$VAULT/askpass.sh" GIT_TERMINAL_PROMPT=0
[ -x "$GIT_ASKPASS" ] || { log "ERROR: $VAULT/askpass.sh missing — run harness/bin/install.sh"; exit 1; }

push_once() { gc push origin HEAD >>"$RUNLOG" 2>&1; }

if push_once; then
  log "backup pushed: $(gc rev-parse --short HEAD) | mirror $FILES files, $SIZE"
else
  # maybe the vault token went stale and the user re-uploaded a fresh key
  if [ -f "$UPLOAD_KEY" ] && ! cmp -s "$UPLOAD_KEY" "$VAULT/github.token"; then
    log "push failed — trying the re-uploaded key from upload/"
    import_token "$UPLOAD_KEY"
    if push_once; then
      log "backup pushed with refreshed token: $(gc rev-parse --short HEAD)"
      exit 0
    fi
  fi
  log "push failed — trying pull --rebase once"
  if gc pull --rebase --autostash origin HEAD >>"$RUNLOG" 2>&1 && push_once; then
    log "backup pushed after rebase: $(gc rev-parse --short HEAD)"
  else
    log "ERROR: push failed. If auth-related: the PAT expired — re-issue (fine-grained, Contents: Read & Write on maniesh-NR/Vogelkop-MorphePatches) and upload the new key as 'Vogelkop access key.txt'. Log tail:"
    tail -n 5 "$RUNLOG"
    exit 1
  fi
fi
