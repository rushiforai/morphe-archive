#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
: "${GEMINIPATCH_STORE_PASS:?Set a signing password in .env first}"
export GEMINIPATCH_STORE_PASS
KEYSTORE_PATH="${KEYSTORE_PATH:-local/keys/gemini-debug.p12}"
[[ "$KEYSTORE_PATH" = /* ]] || KEYSTORE_PATH="$ROOT/$KEYSTORE_PATH"
[[ ! -e "$KEYSTORE_PATH" ]] || fail 'Key already exists; refusing to replace it.'
mkdir -p "$(dirname "$KEYSTORE_PATH")"
umask 077
keytool -genkeypair -storetype PKCS12 -keystore "$KEYSTORE_PATH" \
  -alias "${KEY_ALIAS:-geminipatch}" -keyalg RSA -keysize 2048 -validity 10000 \
  -dname 'CN=GeminiPatch Local' -storepass:env GEMINIPATCH_STORE_PASS -keypass:env GEMINIPATCH_STORE_PASS
