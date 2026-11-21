#!/usr/bin/env python3
"""Verify a Morphe patch bundle: archive layout, embedded version and optional signature."""
import base64
import struct
import sys
import zipfile


def fail(message):
    print(f"verify_bundle: {message}", file=sys.stderr)
    sys.exit(1)


def parse_manifest(text):
    fields, key = {}, None
    for line in text.splitlines():
        if line.startswith(" ") and key:
            fields[key] += line[1:]
        elif ": " in line:
            key, value = line.split(": ", 1)
            fields[key.strip()] = value.strip()
    return fields


def read_signature_comment(bundle):
    data = open(bundle, "rb").read()
    index = data.rfind(b"PK\x05\x06")
    if index < 0:
        fail("no end of central directory record")
    comment_length = struct.unpack("<H", data[index + 20:index + 22])[0]
    return data[index + 22:index + 22 + comment_length].decode("ascii", "replace")


def main():
    if len(sys.argv) < 2:
        fail("usage: verify_bundle.py <bundle.mpp> [expected_version] [signed]")

    bundle = sys.argv[1]
    expected_version = sys.argv[2] if len(sys.argv) > 2 else None
    expect_signature = len(sys.argv) > 3 and sys.argv[3].lower() == "true"

    with zipfile.ZipFile(bundle) as archive:
        names = archive.namelist()
        if "classes.dex" not in names:
            fail("classes.dex is missing")
        if "META-INF/MANIFEST.MF" not in names:
            fail("META-INF/MANIFEST.MF is missing")
        if not any(name.startswith("extensions/") and name.endswith(".mpe") for name in names):
            fail("extension dex is missing")
        manifest = parse_manifest(archive.read("META-INF/MANIFEST.MF").decode("utf-8"))

    version = manifest.get("Version")
    if not version:
        fail("the manifest has no Version field")
    if expected_version and version != expected_version:
        fail(f"manifest Version is {version}, expected {expected_version}")
    if not manifest.get("Patcher-Version"):
        fail("the manifest has no Patcher-Version field")

    comment = read_signature_comment(bundle)
    parts = comment.split(" ")
    if expect_signature:
        if parts[0] != "MorpheSig1" or len(parts) < 3:
            fail("the bundle is not signed")
        try:
            base64.b64decode(parts[1], validate=True)
            base64.b64decode(parts[2], validate=True)
        except ValueError:
            fail("the signature comment is malformed")
        public_key = open("morphe-signing.pub").read().strip()
        if parts[1] != public_key:
            fail("the bundle is signed with a key that does not match morphe-signing.pub")
    elif comment.startswith("MorpheSig1"):
        fail("expected an unsigned bundle, but it is signed")

    print(f"verify_bundle: ok, version={version}, signed={expect_signature}")


if __name__ == "__main__":
    main()
