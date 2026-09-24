#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-or-later
"""
apksigcert.py - print the SHA-256 fingerprint of an APK's signing certificate.

Parses the APK Signing Block (v2 id 0x7109871a / v3 id 0xf05368c0 / v3.1 id
0x1b93ad61) directly, so it works on APKs that carry no legacy v1 (JAR)
signature - which is the case for the official Pixel Camera base.apk, where
`keytool -printcert -jarfile` prints nothing.

Falls back to the v1 META-INF/*.(RSA|DSA|EC) PKCS#7 block when no signing block
is present.

The resulting hex digest is what Morphe's `Compatibility(signatures = setOf(...))`
field expects, and what you use to prove an acquired APK is the genuine
Google-signed article before patching it.

Usage:
    python tools/apksigcert.py base.apk
    python tools/apksigcert.py PixelCamera.apkm      # archives-of-APKs are fine
"""

from __future__ import annotations

import hashlib
import io
import os
import struct
import sys
import zipfile
from typing import Dict, Iterable, List, Optional, Tuple

APK_SIG_BLOCK_MAGIC = b"APK Sig Block 42"
BLOCK_IDS = {
    0x7109871A: "v2",
    0xF05368C0: "v3",
    0x1B93AD61: "v3.1",
}

EOCD_SIG = b"PK\x05\x06"


def find_eocd(data: bytes) -> int:
    """Offset of the End Of Central Directory record."""
    start = max(0, len(data) - (0xFFFF + 22))
    idx = data.rfind(EOCD_SIG, start)
    if idx < 0:
        raise ValueError("no EOCD record; not a zip file")
    return idx


def central_directory_offset(data: bytes) -> int:
    eocd = find_eocd(data)
    cd_offset = struct.unpack_from("<I", data, eocd + 16)[0]
    if cd_offset != 0xFFFFFFFF:
        return cd_offset
    # Zip64: locate the Zip64 EOCD locator immediately before the EOCD.
    loc = data.rfind(b"PK\x06\x07", 0, eocd)
    if loc < 0:
        raise ValueError("Zip64 EOCD locator not found")
    z64_eocd = struct.unpack_from("<Q", data, loc + 8)[0]
    return struct.unpack_from("<Q", data, z64_eocd + 48)[0]


def signing_block(data: bytes) -> Optional[bytes]:
    """Return the APK Signing Block payload (without the outer size fields)."""
    cd = central_directory_offset(data)
    if cd < 24:
        return None
    if data[cd - 16:cd] != APK_SIG_BLOCK_MAGIC:
        return None
    size_at_end = struct.unpack_from("<Q", data, cd - 24)[0]
    block_start = cd - 8 - size_at_end
    if block_start < 0:
        return None
    size_at_start = struct.unpack_from("<Q", data, block_start)[0]
    if size_at_start != size_at_end:
        return None
    return data[block_start + 8:cd - 24]


def iter_id_value(payload: bytes) -> Iterable[Tuple[int, bytes]]:
    pos = 0
    n = len(payload)
    while pos + 12 <= n:
        length = struct.unpack_from("<Q", payload, pos)[0]
        if length < 4 or pos + 8 + length > n:
            break
        pid = struct.unpack_from("<I", payload, pos + 8)[0]
        yield pid, payload[pos + 12:pos + 8 + length]
        pos += 8 + length


def _u32_prefixed(buf: bytes) -> Iterable[bytes]:
    """Iterate a sequence of uint32-length-prefixed elements."""
    pos = 0
    n = len(buf)
    while pos + 4 <= n:
        ln = struct.unpack_from("<I", buf, pos)[0]
        if pos + 4 + ln > n:
            break
        yield buf[pos + 4:pos + 4 + ln]
        pos += 4 + ln


def certificates_from_scheme_block(block: bytes) -> List[bytes]:
    """Extract DER certificates from a v2/v3 signature scheme block."""
    certs: List[bytes] = []
    # block := length-prefixed sequence of signers
    for signers in _u32_prefixed(block):
        for signer in _u32_prefixed(signers):
            # signer := signed data | (minSdk,maxSdk for v3) | signatures | public key
            parts = list(_u32_prefixed(signer))
            if not parts:
                continue
            signed_data = parts[0]
            sd_parts = list(_u32_prefixed(signed_data))
            if len(sd_parts) < 2:
                continue
            # signed data := digests | certificates | additional attributes
            for cert in _u32_prefixed(sd_parts[1]):
                if cert and cert[0] == 0x30:  # DER SEQUENCE
                    certs.append(cert)
    return certs


def certificates_from_pkcs7(blob: bytes) -> List[bytes]:
    """Very small DER walk that pulls X.509 certs out of a PKCS#7 blob."""
    certs: List[bytes] = []
    i = 0
    n = len(blob)
    while i < n - 4:
        if blob[i] != 0x30:
            i += 1
            continue
        ln_byte = blob[i + 1]
        if ln_byte & 0x80:
            nbytes = ln_byte & 0x7F
            if nbytes == 0 or nbytes > 4 or i + 2 + nbytes > n:
                i += 1
                continue
            length = int.from_bytes(blob[i + 2:i + 2 + nbytes], "big")
            header = 2 + nbytes
        else:
            length = ln_byte
            header = 2
        end = i + header + length
        if end > n or length < 64:
            i += 1
            continue
        candidate = blob[i:end]
        # An X.509 Certificate is SEQUENCE { tbsCertificate SEQUENCE, ... }
        if candidate[header] == 0x30:
            try:
                if _looks_like_cert(candidate):
                    certs.append(candidate)
                    i = end
                    continue
            except Exception:  # noqa: BLE001 - best effort scan
                pass
        i += 1
    return certs


def _looks_like_cert(der: bytes) -> bool:
    # Cheap heuristic: certificates carry an OID for a signature algorithm.
    return b"\x2a\x86\x48\x86\xf7\x0d\x01\x01" in der or b"\x2a\x86\x48\xce\x3d\x04" in der


def analyse(name: str, blob: bytes) -> Dict[str, object]:
    result: Dict[str, object] = {"name": name, "schemes": {}, "v1": []}
    sb = signing_block(blob)
    if sb:
        for pid, value in iter_id_value(sb):
            label = BLOCK_IDS.get(pid)
            if not label:
                continue
            certs = certificates_from_scheme_block(value)
            result["schemes"][label] = [  # type: ignore[index]
                hashlib.sha256(c).hexdigest() for c in certs
            ]
    try:
        zf = zipfile.ZipFile(io.BytesIO(blob))
    except zipfile.BadZipFile:
        return result
    for n in zf.namelist():
        up = n.upper()
        if up.startswith("META-INF/") and up.endswith((".RSA", ".DSA", ".EC")):
            for c in certificates_from_pkcs7(zf.read(n)):
                result["v1"].append((n, hashlib.sha256(c).hexdigest()))  # type: ignore[union-attr]
    return result


def main(argv: List[str]) -> int:
    if len(argv) != 2:
        print(__doc__)
        return 2
    path = argv[1]
    with open(path, "rb") as fh:
        blob = fh.read()

    targets: List[Tuple[str, bytes]] = []
    try:
        zf = zipfile.ZipFile(io.BytesIO(blob))
        inner = [n for n in zf.namelist() if n.lower().endswith(".apk")]
        if inner and "AndroidManifest.xml" not in zf.namelist():
            for n in sorted(inner):
                targets.append((n, zf.read(n)))
        else:
            targets.append((os.path.basename(path), blob))
    except zipfile.BadZipFile:
        print(f"{path}: not a zip/APK", file=sys.stderr)
        return 1

    seen = set()
    for name, data in targets:
        r = analyse(name, data)
        print(f"== {name} ==")
        if not r["schemes"] and not r["v1"]:
            print("  (no signature found)")
        for scheme, digests in sorted(r["schemes"].items()):  # type: ignore[union-attr]
            for d in digests:
                seen.add(d)
                print(f"  {scheme:5s} cert SHA-256: {d}")
        for entry, d in r["v1"]:  # type: ignore[union-attr]
            seen.add(d)
            print(f"  v1    cert SHA-256: {d}   ({entry})")
    if len(seen) == 1:
        print(f"\nAll parts share one signing certificate:\n  {next(iter(seen))}")
    elif len(seen) > 1:
        print(f"\nWARNING: {len(seen)} distinct signing certificates across parts.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
