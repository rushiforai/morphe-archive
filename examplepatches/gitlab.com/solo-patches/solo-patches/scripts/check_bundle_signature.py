#!/usr/bin/env python3
"""Exercise the real compiled Morphe verifier against signed and altered bundles.

Build first, then pass its runtime classpath, including the patch bundle.
This check uses temporary copies and never reads the private signing key.
"""

import argparse
import base64
import hashlib
import os
import subprocess
import tempfile
import zipfile
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("classpath", help="JVM classpath containing util.VerifyBundleSignatureKt and patcher dependencies")
    args = parser.parse_args()
    repo = Path(__file__).resolve().parents[1]
    bundles = [path for path in (repo / "patches/build/libs").glob("*.mpp")
               if not any(part in path.name for part in ("sources", "javadoc"))]
    assert len(bundles) == 1, "Expected exactly one Android patch bundle"
    bundle = bundles[0]
    key = repo / "morphe-signing.pub"
    java = str(Path(os.environ["JAVA_HOME"]) / "bin/java") if os.environ.get("JAVA_HOME") else "java"
    classpath = os.pathsep.join(str(Path(part).resolve()) for part in args.classpath.split(os.pathsep))

    def verify(candidate, public_key):
        return subprocess.run(
            [java, "-Xmx512m", "-XX:ActiveProcessorCount=2", "-cp", classpath,
             "util.VerifyBundleSignatureKt", str(candidate), str(public_key)],
            capture_output=True, text=True, timeout=45,
        ).returncode

    assert verify(bundle, key) == 0, "Original signed bundle failed verification"
    with tempfile.TemporaryDirectory(prefix="solo-signature-check-") as directory:
        folder = Path(directory)
        content = bytearray(bundle.read_bytes())
        with zipfile.ZipFile(bundle) as archive:
            comment_size = len(archive.comment)
            entry = next(info for info in archive.infolist() if info.compress_size)
            offset = entry.header_offset
        assert comment_size, "Expected an embedded signature"
        name_length = int.from_bytes(content[offset + 26:offset + 28], "little")
        extra_length = int.from_bytes(content[offset + 28:offset + 30], "little")
        content[offset + 30 + name_length + extra_length] ^= 1
        altered = folder / "altered.mpp"
        altered.write_bytes(content)
        assert verify(altered, key) != 0, "Tampered bundle passed verification"
        unsigned = folder / "unsigned.mpp"
        unsigned_content = bytearray(bundle.read_bytes()[:-comment_size])
        unsigned_content[-2:] = b"\0\0"
        unsigned.write_bytes(unsigned_content)
        assert verify(unsigned, key) != 0, "Unsigned bundle passed verification"
        other_key = folder / "other.pub"
        other_key.write_bytes(base64.b64encode(hashlib.sha256(key.read_bytes()).digest()) + b"\n")
        assert verify(bundle, other_key) != 0, "Unexpected publisher key passed verification"
    print("PASS: real verifier accepts signed bundle and rejects tampered, unsigned and wrong-key inputs")


if __name__ == "__main__":
    main()
