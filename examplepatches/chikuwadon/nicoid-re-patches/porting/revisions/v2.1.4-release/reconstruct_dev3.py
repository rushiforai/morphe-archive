#!/usr/bin/env python3
"""Reconstruct the exact user-tested dev.3 MPP from audited binary deltas.

Only public nicoid Re patch assets are used: official v2.1.3 MPP and
SHA-pinned zstd patches of the changed nicoid helper and native DEX.
Never use an unverified or JVM-only jar as the Morphe patch payload.
"""
from __future__ import annotations
import argparse
from copy import copy
import hashlib
import subprocess
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
HASHES = {
    "base": "89e3892ad8cf44666e03bc4af6be3632599a320d8817777b4dfdb56f239c932a",
    "helpers_diff": "587da0eea65401ea654377685c53cdc8c6360f91aee460a4c34b5574571b87f0",
    "native_diff": "cfa626733ac8d83993acf05fc7ef1a4fd7c51d715681646ff6bca8c6cb4713d4",
    "helpers": "2880f2127e5f2f41c598d817b58cd0b443778b830bd7859bd9faa403cde7bfcf",
    "native": "36e68a70dc2ee030c7a00ef3de131e7cf805f744c9d4a9fe8a4c5c8bf429b08d",
    "dev3": "37d04536d8bbc4ee94f1a2909ea58b50a3f30c441929373df19e73f0a48f6e76",
}
DELTA = {
    "nicoid/helpers.mpe": ("reviewed-dev3-helpers.zst", "helpers_diff", "helpers"),
    "nicoid/method-delta.dex": ("reviewed-dev3-native.zst", "native_diff", "native"),
}


def check(path: Path, name: str) -> None:
    actual = hashlib.sha256(path.read_bytes()).hexdigest()
    if actual != HASHES[name]:
        raise ValueError(f"SHA-256 mismatch for {name}: expected {HASHES[name]}, got {actual}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    if args.base.resolve() == args.output.resolve():
        raise ValueError("Do not overwrite the original official v2.1.3 MPP")
    check(args.base, "base")
    overrides = {}
    with TemporaryDirectory(prefix="nicoid-reviewed-dev3-") as temp, ZipFile(args.base) as base:
        scratch = Path(temp)
        if base.testzip() is not None:
            raise ValueError("Corrupt official v2.1.3 MPP")
        for key, (patch_name, patch_sha_key, output_sha_key) in DELTA.items():
            patch = HERE / patch_name
            check(patch, patch_sha_key)
            original = scratch / ("original-" + Path(key).name)
            actual = scratch / ("rebuilt-" + Path(key).name)
            original.write_bytes(base.read(key))
            subprocess.run(["zstd", "-q", "-d", "-f", "--patch-from=" + str(original),
                            str(patch), "-o", str(actual)], check=True)
            check(actual, output_sha_key)
            overrides[key] = actual.read_bytes()
        manifest = base.read("META-INF/MANIFEST.MF")
        old = b"Version: 2.1.3\r\n"
        if manifest.count(old) != 1:
            raise ValueError("Expected one official v2.1.3 Manifest-Version entry")
        overrides["META-INF/MANIFEST.MF"] = manifest.replace(old, b"Version: 2.1.4-dev.3\r\n")
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(args.output, "w") as output:
            for entry in base.infolist():
                output.writestr(copy(entry), overrides.get(entry.filename, base.read(entry.filename)))
    check(args.output, "dev3")
    with ZipFile(args.output) as verified:
        if verified.testzip() is not None or verified.namelist().count("classes.dex") != 1:
            raise ValueError("Invalid reconstructed Android MPP")
    print("PASS: reconstructed v2.1.4-dev.3 byte-identical to user-tested MPP")


if __name__ == "__main__":
    main()
