#!/bin/bash
# Publish the Vogelkop patches release: push, tag, create the GitHub release
# and upload the bundle asset. Requires a GitHub PAT with repo contents:write.
#
#   export GITHUB_ACTOR=maniesh-NR
#   export GITHUB_TOKEN=ghp_xxx        # new PAT — never paste tokens in chats
#   tools/release.sh 1.2.2
#
set -euo pipefail
cd "$(dirname "$0")/.."

VER="${1:?usage: tools/release.sh <version>}"
REPO_SLUG="maniesh-NR/Vogelkop-MorphePatches"
BUNDLE="patches/build/libs/patches-$VER.mpp"
API="https://api.github.com/repos/$REPO_SLUG"

[ -f "$BUNDLE" ] || { echo "missing $BUNDLE — run the gradle build first" >&2; exit 1; }
[ -n "${GITHUB_ACTOR:-}" ] && [ -n "${GITHUB_TOKEN:-}" ] || {
    echo "export GITHUB_ACTOR and GITHUB_TOKEN first" >&2; exit 1; }

# Guard against the (real, bit us in v1.2.5) failure mode where a later
# `build`-dependent gradle task re-runs `jar` AFTER buildAndroid and rewrites
# the bundle as a plain unsigned jar without classes.dex. buildAndroid must
# be the LAST gradle task; verify the artifact is actually the signed one.
python3 - "$BUNDLE" <<'PYEOF'
import struct, sys, zipfile, io
data = open(sys.argv[1], 'rb').read()
eocd = data.rfind(b'PK\x05\x06')
clen = struct.unpack_from('<H', data, eocd + 20)[0]
comment = data[eocd + 22:eocd + 22 + clen]
if not comment.startswith(b'MorpheSig1 '):
    sys.exit(f"{sys.argv[1]} is NOT signed (no MorpheSig1 comment) — "
             "run `./gradlew buildAndroid` as the LAST gradle task, then retry")
names = zipfile.ZipFile(io.BytesIO(data)).namelist()
if not any(n.endswith('classes.dex') for n in names):
    sys.exit(f"{sys.argv[1]} has no classes.dex — the jar task overwrote the "
             "buildAndroid output; re-run `./gradlew buildAndroid` last")
print(f"bundle OK: signed ({clen}-byte comment), classes.dex present, {len(data)} bytes")
PYEOF

auth=(-H "Authorization: Bearer $GITHUB_TOKEN" -H "Accept: application/vnd.github+json")

# retry wrapper: uploads.github.com occasionally drops a connection (curl 22/56)
gh_upload() {  # gh_upload <release-id> <file> <name> [content-type]
    local rid="$1" file="$2" name="$3" ct="${4:-application/octet-stream}" n
    for n in 1 2 3 4 5; do
        if curl -sS -o /dev/null -w '%{http_code}' -X POST "${auth[@]}" \
            -H "Content-Type: $ct" --data-binary "@$file" \
            "https://uploads.github.com/repos/$REPO_SLUG/releases/$rid/assets?name=$name" \
            | grep -qE '^(201|200)$'; then
            echo "  uploaded $name"
            return 0
        fi
        echo "  upload $name failed (attempt $n/5), retrying in $((n*3))s…" >&2
        sleep $((n*3))
    done
    echo "upload of $name failed after 5 attempts" >&2
    return 1
}

echo "== push main =="
git push origin main

echo "== create tag v$VER =="
git tag -f "v$VER" >/dev/null
git push -f origin "refs/tags/v$VER"

echo "== create release v$VER =="
NOTES=$(python3 -c "import json;print(json.load(open('patches-bundle.json'))['description'])")
PAYLOAD=$(python3 -c \
    "import json,sys;print(json.dumps({'tag_name':'v$VER','name':'v$VER','body':sys.argv[1],'draft':False,'prerelease':False}))" \
    "$NOTES")
RELEASE_ID=$(curl -sf "${auth[@]}" -X POST "$API/releases" -d "$PAYLOAD" \
    | python3 -c "import json,sys;print(json.load(sys.stdin)['id'])")

echo "== upload assets (release $RELEASE_ID) =="
gh_upload "$RELEASE_ID" "$BUNDLE" "patches-$VER.mpp"
for kind in sources javadoc; do
    f="patches/build/libs/patches-$VER-$kind.mpp"
    [ -f "$f" ] && gh_upload "$RELEASE_ID" "$f" "$(basename "$f")"
done
if [ -f SHA256SUMS.txt ]; then
    gh_upload "$RELEASE_ID" SHA256SUMS.txt SHA256SUMS.txt text/plain
fi

echo "done: https://github.com/$REPO_SLUG/releases/tag/v$VER"
