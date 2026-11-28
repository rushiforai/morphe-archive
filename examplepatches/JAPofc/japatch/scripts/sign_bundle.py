#!/usr/bin/env python3
"""Sign a Morphe patch bundle (.mpp) the way Morphe Manager checks it.

The format is the one morphe-patcher implements (PatchBundleSignature.kt):

  * A signed bundle ends with the zip comment  `MorpheSig1 <publicKey> <signature>`  (both Base64).
  * The public key is a **raw Ed25519 key** (32 bytes, Base64).
  * The signature is Ed25519 over  `b"MorpheSig1" + SHA-256(bundle up to the comment, with the
    2-byte comment length zeroed)`.
  * Signing only writes the comment, so readers of the archive ignore it and an unsigned reader
    loads a signed bundle like any other.

The key pair is made once and kept out of the repository:

    python3 scripts/sign_bundle.py --keygen          # writes ~/.japatch-signing-key (never commit it)
    python3 scripts/sign_bundle.py --key patches/build/libs/patches-1.0.10.mpp

The public key is printed and written next to the bundle as `<bundle>.pub`; it is the value for
"public_key" in patches-bundle.json, which is how Manager knows which key this source is signed with.
"""

import argparse
import base64
import hashlib
import os
import pathlib
import struct
import sys

MAGIC = b"MorpheSig1"
EOCD_SIGNATURE = 0x06054B50
EOCD_SIZE = 22
MAX_COMMENT = 0xFFFF
KEY_FILE = pathlib.Path.home() / ".japatch-signing-key"


# --------------------------------------------------------------------------- Ed25519, no dependency
# RFC 8032 reference arithmetic. Slow and tiny rather than fast and vendored: this runs once per
# release on a 2 MB file, and a signing key should not need a pip install to work.

_P = 2**255 - 19
_L = 2**252 + 27742317777372353535851937790883648493
_D = -121665 * pow(121666, _P - 2, _P) % _P
_I = pow(2, (_P - 1) // 4, _P)


def _sha512_int(data):
    return int.from_bytes(hashlib.sha512(data).digest(), "little")


def _inv(x):
    return pow(x, _P - 2, _P)


def _add(P, Q):
    x1, y1, z1, t1 = P
    x2, y2, z2, t2 = Q
    a = (y1 - x1) * (y2 - x2) % _P
    b = (y1 + x1) * (y2 + x2) % _P
    c = 2 * t1 * t2 * _D % _P
    d = 2 * z1 * z2 % _P
    e, f, g, h = b - a, d - c, d + c, b + a
    return (e * f % _P, g * h % _P, f * g % _P, e * h % _P)


def _mul(s, P):
    Q = (0, 1, 1, 0)
    while s > 0:
        if s & 1:
            Q = _add(Q, P)
        P = _add(P, P)
        s >>= 1
    return Q


def _equal(P, Q):
    x1, y1, z1, _ = P
    x2, y2, z2, _ = Q
    return (x1 * z2 - x2 * z1) % _P == 0 and (y1 * z2 - y2 * z1) % _P == 0


def _recover_x(y, sign):
    if y >= _P:
        return None
    x2 = (y * y - 1) * _inv(_D * y * y + 1) % _P
    if x2 == 0:
        return None if sign else 0
    x = pow(x2, (_P + 3) // 8, _P)
    if (x * x - x2) % _P != 0:
        x = x * _I % _P
    if (x * x - x2) % _P != 0:
        return None
    if (x & 1) != sign:
        x = _P - x
    return x


_GY = 4 * _inv(5) % _P
_GX = _recover_x(_GY, 0)
_G = (_GX, _GY, 1, _GX * _GY % _P)


def _encode_point(P):
    zinv = _inv(P[2])
    x, y = P[0] * zinv % _P, P[1] * zinv % _P
    return int.to_bytes(y | ((x & 1) << 255), 32, "little")


def _decode_point(s):
    if len(s) != 32:
        return None
    y = int.from_bytes(s, "little")
    sign = y >> 255
    y &= (1 << 255) - 1
    x = _recover_x(y, sign)
    if x is None:
        return None
    return (x, y, 1, x * y % _P)


def _expand(seed):
    h = hashlib.sha512(seed).digest()
    a = int.from_bytes(h[:32], "little")
    a &= (1 << 254) - 8
    a |= 1 << 254
    return a, h[32:]


def public_key(seed):
    a, _ = _expand(seed)
    return _encode_point(_mul(a, _G))


def sign(seed, message):
    a, prefix = _expand(seed)
    A = _encode_point(_mul(a, _G))
    r = _sha512_int(prefix + message) % _L
    R = _encode_point(_mul(r, _G))
    k = _sha512_int(R + A + message) % _L
    s = (r + k * a) % _L
    return R + int.to_bytes(s, 32, "little")


def verify(public, message, signature):
    if len(signature) != 64:
        return False
    A = _decode_point(public)
    if A is None:
        return False
    R = _decode_point(signature[:32])
    if R is None:
        return False
    s = int.from_bytes(signature[32:], "little")
    if s >= _L:
        return False
    k = _sha512_int(signature[:32] + public + message) % _L
    return _equal(_mul(s, _G), _add(R, _mul(k, A)))


# --------------------------------------------------------------------------- zip comment plumbing

def comment_range(blob):
    """Where the archive comment starts, or None when this is not a zip archive."""
    length = len(blob)
    if length < EOCD_SIZE:
        return None
    tail_size = min(length, EOCD_SIZE + MAX_COMMENT)
    tail = blob[length - tail_size:]
    for start in range(tail_size - EOCD_SIZE, -1, -1):
        if struct.unpack_from("<I", tail, start)[0] != EOCD_SIGNATURE:
            continue
        if struct.unpack_from("<H", tail, start + EOCD_SIZE - 2)[0] == tail_size - start - EOCD_SIZE:
            return length - tail_size + start + EOCD_SIZE
    return None


def signed_message(blob, offset):
    digest = hashlib.sha256(blob[:offset - 2])
    digest.update(b"\x00\x00")
    return MAGIC + digest.digest()


def sign_file(path, seed):
    blob = pathlib.Path(path).read_bytes()
    offset = comment_range(blob)
    if offset is None:
        raise SystemExit(f"{path}: not a zip archive")
    if offset != len(blob):
        raise SystemExit(f"{path}: already has a comment (signed before?) — rebuild the bundle first")

    pub = public_key(seed)
    signature = sign(seed, signed_message(blob, offset))
    comment = MAGIC + b" " + base64.b64encode(pub) + b" " + base64.b64encode(signature)
    if len(comment) > MAX_COMMENT:
        raise SystemExit("comment does not fit in the archive")

    out = bytearray(blob)
    out[-2:] = struct.pack("<H", len(comment))
    out += comment
    pathlib.Path(path).write_bytes(bytes(out))
    return base64.b64encode(pub).decode()


def verify_file(path):
    blob = pathlib.Path(path).read_bytes()
    offset = comment_range(blob)
    if offset is None or offset == len(blob):
        return None
    comment = blob[offset:].decode("ascii", "replace")
    if not comment.startswith(MAGIC.decode() + " "):
        return None
    parts = comment.split(" ")
    if len(parts) != 3:
        raise SystemExit("malformed signature comment")
    pub = base64.b64decode(parts[1])
    signature = base64.b64decode(parts[2])
    if not verify(pub, signed_message(blob, offset), signature):
        raise SystemExit("signature does not match the bundle")
    return base64.b64encode(pub).decode()


def fingerprint(public_b64):
    raw = base64.b64decode(public_b64)
    return " ".join(hashlib.sha256(raw).hexdigest()[:16][i:i + 4] for i in range(0, 16, 4))


# --------------------------------------------------------------------------- command line

def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("bundle", nargs="?", help="the .mpp to sign")
    parser.add_argument("--keygen", action="store_true", help="make a signing key (once)")
    parser.add_argument("--key", metavar="PRIVATE_KEY", help="sign with this key instead of the stored one")
    parser.add_argument("--verify", action="store_true", help="check a bundle's signature and stop")
    parser.add_argument("--public", action="store_true", help="print the stored key's public half and stop")
    args = parser.parse_args()

    if args.keygen:
        if KEY_FILE.exists():
            raise SystemExit(f"{KEY_FILE} already exists — refusing to overwrite a signing key")
        seed = os.urandom(32)
        KEY_FILE.write_text(base64.b64encode(seed).decode() + "\n")
        KEY_FILE.chmod(0o600)
        pub = base64.b64encode(public_key(seed)).decode()
        (KEY_FILE.with_suffix(".pub")).write_text(pub + "\n")
        print(f"key written to {KEY_FILE} (keep it; losing it means a new identity)")
        print(f"public key : {pub}")
        print(f"fingerprint: {fingerprint(pub)}")
        return

    if args.key:
        seed = base64.b64decode(args.key)
    elif KEY_FILE.exists():
        seed = base64.b64decode(KEY_FILE.read_text().strip())
    else:
        seed = None

    if args.public:
        if seed is None:
            raise SystemExit(f"no key at {KEY_FILE} — run --keygen first")
        pub = base64.b64encode(public_key(seed)).decode()
        print(f"public key : {pub}")
        print(f"fingerprint: {fingerprint(pub)}")
        return

    if not args.bundle:
        parser.error("give a bundle, or use --keygen / --public")

    if args.verify:
        pub = verify_file(args.bundle)
        print(f"{args.bundle}: signed by {pub} ({fingerprint(pub)})" if pub else f"{args.bundle}: not signed")
        return

    if seed is None:
        raise SystemExit(f"no key at {KEY_FILE} — run --keygen first")
    pub = sign_file(args.bundle, seed)
    pathlib.Path(args.bundle + ".pub").write_text(pub + "\n")
    print(f"signed {args.bundle}")
    print(f"public key : {pub}")
    print(f"fingerprint: {fingerprint(pub)}")


if __name__ == "__main__":
    main()
