#!/usr/bin/env bash
# Vogelkop harness — first-time setup on a fresh sandbox.
#
# Prerequisite: the GitHub token at $VOGELKOP_TOKEN, <sandbox>/.vault/github.token
# or <sandbox>/upload/'Vogelkop access key.txt'. Then: verify the token, write
# the GIT_ASKPASS helper, clone the repo if absent, set the git identity, and
# run the first backup.
#
# If the clone itself is missing you cannot run this script yet — bootstrap
# manually first (see harness/README.md "Fresh sandbox"), which produces the
# clone containing this file.
set -euo pipefail

SANDBOX="${VOGELKOP_SANDBOX:-/home/z/my-project}"
VAULT="$SANDBOX/.vault"
CLONE="$SANDBOX/.harness/vogelkop"
REPO_URL="${VOGELKOP_REPO:-https://github.com/maniesh-NR/Vogelkop-MorphePatches.git}"

# 1. locate / import the token (always materialize the vault copy:
#    askpass.sh and backup.sh read from $VAULT/github.token)
TOKEN_FILE="${VOGELKOP_TOKEN:-$VAULT/github.token}"
if [ ! -f "$TOKEN_FILE" ]; then
  UP="$SANDBOX/upload/Vogelkop access key.txt"
  [ -f "$UP" ] || { echo "ERROR: no token (looked at '$TOKEN_FILE' and the uploaded key)"; exit 1; }
  TOKEN_FILE="$UP"
fi
mkdir -p "$VAULT"
if [ "$TOKEN_FILE" != "$VAULT/github.token" ]; then
  cp -- "$TOKEN_FILE" "$VAULT/github.token"
fi
chmod 600 "$VAULT/github.token"
TOKEN="$(tr -d '[:space:]' < "$VAULT/github.token")"
[ -n "$TOKEN" ] || { echo "ERROR: token file is empty"; exit 1; }

# 2. verify the token and resolve the login
LOGIN="$(curl -fsS -H "Authorization: Bearer $TOKEN" https://api.github.com/user \
  | python3 -c 'import json,sys; print(json.load(sys.stdin).get("login",""))' || true)"
[ -n "$LOGIN" ] || { echo "ERROR: token invalid, expired, or api.github.com unreachable"; exit 1; }
echo "token OK (login: $LOGIN)"

# 3. write the GIT_ASKPASS helper (no secrets stored inside)
mkdir -p "$VAULT"
cat > "$VAULT/askpass.sh" <<EOF
#!/bin/sh
# GIT_ASKPASS for the Vogelkop harness (no secrets stored here).
case "\$1" in
  *sername*) echo "$LOGIN" ;;
  *) tr -d '[:space:]' < "\${VOGELKOP_TOKEN_FILE:-$VAULT/github.token}" ;;
esac
EOF
chmod 700 "$VAULT/askpass.sh"

# 4. clone if needed
if [ ! -d "$CLONE/.git" ]; then
  mkdir -p "$(dirname "$CLONE")"
  GIT_ASKPASS="$VAULT/askpass.sh" GIT_TERMINAL_PROMPT=0 git clone "$REPO_URL" "$CLONE"
fi

# 5. git identity (matches repo history convention) + first backup
git -C "$CLONE" config user.name  "${VOGELKOP_GIT_NAME:-$LOGIN}"
git -C "$CLONE" config user.email "${VOGELKOP_GIT_EMAIL:-$LOGIN@users.noreply.github.com}"
exec "$CLONE/harness/bin/backup.sh"
