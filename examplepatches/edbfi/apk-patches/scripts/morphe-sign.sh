#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later
# Signs a Morphe patch bundle the way Morphe's PatchBundleSignature.verify checks it, in two steps, so the
# private key never meets the bundle. Needs only bash, coreutils and openssl.
#
#   MORPHE_SIGNING_KEY=<key> morphe-sign.sh signature <sha256> <morphe-signing.pub>
#       prints the signature for an unsigned bundle with that SHA-256, checked against the .pub file
#   morphe-sign.sh attach <bundle.mpp> <signature>
#       writes the signature into the bundle's zip comment
#
# The key is a Base64 raw Ed25519 private key. The signature, and so the zip comment, is
# `MorpheSig1 <public key> <Ed25519 signature>`, both Base64, where the signed message is `MorpheSig1` followed by
# the SHA-256 of the bundle as built, with an empty comment.
set -euo pipefail

die() {
    echo "::error::$*" >&2
    exit 1
}

usage="usage: MORPHE_SIGNING_KEY=<key> $0 signature <sha256> <morphe-signing.pub> | $0 attach <bundle.mpp> <signature>"

signature() {
    local digest=$1 pub_file=$2 tmp public_key signature bytes i
    [[ "$digest" =~ ^[0-9a-f]{64}$ ]] || die "Not a SHA-256: $digest"
    [[ -f "$pub_file" ]] || die "$pub_file is missing"
    [[ -n "${MORPHE_SIGNING_KEY:-}" ]] || die "MORPHE_SIGNING_KEY is not set"

    umask 077
    tmp=$(mktemp -d)
    # shellcheck disable=SC2064 # expand now: $tmp is local
    trap "rm -rf '$tmp'" EXIT

    # OpenSSL reads the raw key as PKCS#8 DER: a fixed 16-byte Ed25519 header, then the 32 key bytes. printf is a
    # builtin, so the key never appears in a process's arguments.
    {
        printf '\x30\x2e\x02\x01\x00\x30\x05\x06\x03\x2b\x65\x70\x04\x22\x04\x20'
        printf '%s' "${MORPHE_SIGNING_KEY//[[:space:]]/}" | base64 -d
    } >"$tmp/key.der" 2>/dev/null || die "MORPHE_SIGNING_KEY is not Base64"
    unset MORPHE_SIGNING_KEY # so no command below inherits it
    [[ $(stat -c %s "$tmp/key.der") -eq 48 ]] || die "MORPHE_SIGNING_KEY is not a raw 32-byte Ed25519 key"

    openssl pkey -inform DER -in "$tmp/key.der" -pubout -outform DER -out "$tmp/pub.der"
    public_key=$(tail -c 32 "$tmp/pub.der" | base64 -w0)
    [[ "$public_key" == "$(tr -d '[:space:]' <"$pub_file")" ]] || die "The signing key does not match $pub_file"

    bytes=""
    for ((i = 0; i < 64; i += 2)); do bytes+="\\x${digest:i:2}"; done
    printf "MorpheSig1%b" "$bytes" >"$tmp/message"
    openssl pkeyutl -sign -rawin -inkey "$tmp/key.der" -keyform DER -in "$tmp/message" -out "$tmp/signature"
    # Check the signature with the public key alone, as users' clients will.
    openssl pkeyutl -verify -rawin -pubin -inkey "$tmp/pub.der" -keyform DER -in "$tmp/message" \
        -sigfile "$tmp/signature" >/dev/null || die "The signature does not verify against $pub_file"
    signature=$(base64 -w0 <"$tmp/signature")
    [[ ${#signature} -eq 88 ]] || die "openssl did not make an Ed25519 signature"
    echo "MorpheSig1 $public_key $signature"
}

attach() {
    local bundle=$1 comment=$2
    [[ -f "$bundle" && ! -L "$bundle" ]] || die "$bundle is not a regular file"
    [[ "$comment" =~ ^MorpheSig1\ [A-Za-z0-9+/]{43}=\ [A-Za-z0-9+/]{86}==$ ]] || die "Malformed signature: $comment"
    # A zip without a comment ends with its 22-byte end of central directory record, whose last two bytes, the
    # comment length, are zero.
    [[ "$(tail -c 22 "$bundle" | od -An -tx1 | tr -d ' \n')" =~ ^504b0506[0-9a-f]{32}0000$ ]] ||
        die "$bundle is already signed or not a zip archive"
    truncate -s -2 "$bundle"
    printf "\\$(printf %03o $((${#comment} & 255)))\\$(printf %03o $((${#comment} >> 8)))%s" "$comment" >>"$bundle"
}

case "${1:-}" in
    signature) [[ $# -eq 3 ]] || die "$usage"; signature "$2" "$3" ;;
    attach) [[ $# -eq 3 ]] || die "$usage"; attach "$2" "$3" ;;
    *) die "$usage" ;;
esac
