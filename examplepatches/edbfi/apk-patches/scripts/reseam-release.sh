#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later
set -euo pipefail

read_public_key() {
    local key_file=$1
    if [[ ! -f "$key_file" ]]; then
        echo 'Missing Reseam publisher key. Add the authorized public key to keys/reseam-signing.pub in the release commit.' >&2
        return 1
    fi
    public_key=$(cat "$key_file")
    [[ "$public_key" =~ ^[0-9a-f]{64}$ ]] ||
        { echo 'The Reseam publisher key must be 64 lowercase hexadecimal characters.' >&2; return 1; }
}

case "${1:-}" in
  download)
    cli=$2
    curl -fsSL --retry 3 -o "$cli" \
      https://github.com/Reseam/reseam/releases/download/v1.0.1/reseam-linux-x64
    printf '%s  %s\n' 7c52bfba91e56aae7c3117840f2e76d37ab433b259aa605a40d35e5920c0c224 "$cli" |
      sha256sum -c --quiet -
    chmod +x "$cli"
    ;;
  sign)
    cli=$2 unsigned=$3 signed=$4
    read_public_key "$5"
    : "${RESEAM_SIGNING_KEY_B64:?Set the base64-encoded Reseam key file}"
    umask 077
    key=$(mktemp)
    trap 'rm -f "$key"' EXIT
    printf '%s' "$RESEAM_SIGNING_KEY_B64" | base64 --decode > "$key"
    unset RESEAM_SIGNING_KEY_B64
    [[ "$("$cli" bundle pubkey --key "$key")" == "$public_key" ]] ||
      { echo 'Reseam signing key does not match the reviewed publisher public key' >&2; exit 1; }
    "$cli" bundle sign "$unsigned" --key "$key" --out "$signed"
    ;;
  index)
    cli=$2 signed=$3 tag=$4 repo=$5 notes=$6 site=$7
    read_public_key "$8"
    catalog=$(mktemp)
    trap 'rm -f "$catalog"' EXIT
    "$cli" bundle list "$signed" --trust "$public_key" --json > "$catalog"
    jq -e --arg version "${tag#v}" --arg key "$public_key" '
        (.bundles | length == 1) and
        (.bundles[0] | has("problem") and .problem == null and .trusted == true and
          .name == "edbfi-patches" and .version == $version and .public_key == $key)
      ' "$catalog" >/dev/null ||
      { echo 'Reseam bundle signer, signature, name or version did not verify.' >&2; exit 1; }
    "$cli" release patches "$signed" --tag "$tag" --to "$site" \
      --public-url "$repo/releases/download" --homepage "$repo" --notes "$notes"
    file=$(basename "$signed")
    cmp -- "$signed" "$site/$tag/$file"
    jq -e --slurpfile catalog "$catalog" --arg homepage "$repo" \
      --arg url "$repo/releases/download/$tag/$file" --rawfile notes "$notes" '
        # bundle list enriches the patch spec with CLI-only selection data.
        def patches: map(del(.fingerprint, .incompatibility, .presets)
          | with_entries(select(.value != null))) | sort_by(.id);
        $catalog[0].bundles[0] as $bundle
        | .bundle == ($bundle | {name, author, description, public_key, homepage: $homepage})
        and (.releases | map(select(.version == $bundle.version)) |
          length == 1 and (.[0] |
            .download_url == $url and .prerelease == false and .description == $notes
            and (.patches | patches) == ($catalog[0].patches | patches)))
      ' "$site/patches.json" >/dev/null ||
      { echo 'Generated Reseam index does not describe the verified bundle.' >&2; exit 1; }
    ;;
  *)
    echo 'Usage: reseam-release.sh download|sign|index ...' >&2
    exit 2
    ;;
esac
