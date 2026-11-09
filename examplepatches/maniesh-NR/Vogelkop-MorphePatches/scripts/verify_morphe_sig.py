#!/usr/bin/env python3
"""Verify the MorpheSig1 Ed25519 signature of a .mpp patches bundle.

Recreated for v1.2.4 (the original was lost with a recycled sandbox).
Usage:
    python3 scripts/verify_morphe_sig.py <bundle.mpp> [morphe-signing.pub]

The signing scheme (app.morphe.patches.gradle.BundleSigning):
  - Ed25519 over "MorpheSig1" + SHA-256(bundle bytes up to and including the
    EOCD, with the EOCD comment-length field still 0x0000);
  - ZIP comment = "MorpheSig1 <base64-pubkey> <base64-signature>" appended
    after the EOCD.
Exits 0 on a valid signature, 1 otherwise.
"""
import base64
import hashlib
import struct
import sys
from pathlib import Path

MAGIC = b"MorpheSig1"


def verify(bundle_path: str, pub_path: str) -> bool:
    data = Path(bundle_path).read_bytes()
    pos = data.rfind(b"PK\x05\x06")
    if pos < 0:
        print("FAIL: not a zip archive (no EOCD)")
        return False
    _sig, _disk, _cdisk, _nent, _ntot, _cdsz, _cdoff, clen = struct.unpack(
        "<4sHHHHIIH", data[pos : pos + 22]
    )
    if clen <= 0:
        print("FAIL: bundle has no MorpheSig1 comment (unsigned)")
        return False
    comment = data[pos + 22 : pos + 22 + clen]
    parts = comment.split(b" ")
    if len(parts) != 3 or parts[0] != MAGIC:
        print("FAIL: comment is not a MorpheSig1 signature block")
        return False
    pub = base64.b64decode(parts[1])
    signature = base64.b64decode(parts[2])

    if pub_path and Path(pub_path).exists():
        expected = Path(pub_path).read_text().strip()
        if parts[1].decode() != expected:
            print(f"FAIL: embedded public key != {pub_path}")
            return False
        print(f"public key matches {pub_path}")

    # the signed image is the file with the EOCD comment-length field still 0
    pre = bytearray(data[: pos + 22])
    pre[pos + 20] = 0
    pre[pos + 21] = 0
    message = MAGIC + hashlib.sha256(bytes(pre)).digest()

    from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PublicKey

    try:
        Ed25519PublicKey.from_public_bytes(pub).verify(signature, message)
    except Exception as e:
        print(f"FAIL: Ed25519 signature invalid: {e}")
        return False
    print(f"VALID: {bundle_path} signed by {base64.b64encode(pub).decode()}")
    return True


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(2)
    bundle = sys.argv[1]
    pub = sys.argv[2] if len(sys.argv) > 2 else "morphe-signing.pub"
    sys.exit(0 if verify(bundle, pub) else 1)
