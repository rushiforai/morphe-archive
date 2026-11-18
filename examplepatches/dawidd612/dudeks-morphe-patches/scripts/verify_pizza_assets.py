"""Verify every native library and asset from a clean APKM survives patching.

Usage: python scripts/verify_pizza_assets.py original.apkm patched.apk
Unlike comparison with base.apk alone, this also covers asset/native splits.
"""
import argparse
import gzip
import hashlib
import json
import zipfile
from verify_apkm import apk_inputs


def digest(stream):
    return hashlib.file_digest(stream, "sha256").hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original_apkm")
    parser.add_argument("patched_apk")
    parser.add_argument("--bootstrap-delta", help="Exact ARM64 initialization delta from the reviewed patch resources")
    parser.add_argument("--native-delta", action="append", default=[], metavar="APK_PATH=DELTA",
                        help="Reviewed reconstruction for a native library; may be repeated")
    parser.add_argument("--store-visibility", help="Reviewed native visibility manifest (after bootstrap restoration)")
    args = parser.parse_args()
    expected = {}
    split_count = 0
    for _, split in apk_inputs(args.original_apkm):
        split_count += 1
        for item in split.infolist():
            if item.is_dir() or not item.filename.startswith(("lib/", "assets/")):
                continue
            with split.open(item) as stream:
                value = digest(stream)
            if item.filename in expected and expected[item.filename] != value:
                raise AssertionError(f"Conflicting input asset: {item.filename}")
            expected[item.filename] = value
    if not split_count or not any(name.startswith("lib/") for name in expected):
        raise AssertionError("Input has no APK splits/native libraries")
    if not any(name.startswith("assets/") for name in expected):
        raise AssertionError("Input has no game assets")
    native_deltas = dict(item.split("=", 1) for item in args.native_delta)
    if args.bootstrap_delta:
        native_deltas["lib/arm64-v8a/libcocos2dcpp.so"] = args.bootstrap_delta
    for name, path in native_deltas.items():
        with gzip.open(path, "rb") as delta:
            header = delta.read(68)
        if len(header) != 68 or header[:4] != b"PZB2":
            raise AssertionError("Invalid bootstrap delta")
        if expected.get(name) != header[4:36].hex():
            raise AssertionError("Bootstrap input library does not match the original APKM")
        expected[name] = header[36:68].hex()
    if args.store_visibility:
        with open(args.store_visibility, encoding="utf-8") as source:
            visibility = json.load(source)
        name = "lib/arm64-v8a/libcocos2dcpp.so"
        if expected.get(name) != visibility["input_sha256"]:
            raise AssertionError("Store visibility input does not match the restored library")
        expected[name] = visibility["output_sha256"]
    with zipfile.ZipFile(args.patched_apk) as patched:
        for name, value in expected.items():
            with patched.open(name) as stream:
                if digest(stream) != value:
                    raise AssertionError(f"Native library/asset changed: {name}")
    print(json.dumps({"status": "PASS", "input_apks": split_count,
                      "verified_native_libraries": sum(name.startswith("lib/") for name in expected),
                      "verified_assets": sum(name.startswith("assets/") for name in expected)}, indent=2))


if __name__ == "__main__":
    main()
