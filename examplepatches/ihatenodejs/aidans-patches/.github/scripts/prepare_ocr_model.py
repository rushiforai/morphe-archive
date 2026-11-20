#!/usr/bin/env python3
from __future__ import annotations

"""
Downloads and caches the verified tessdata_fast eng.traineddata for Adobe Scan offline OCR.
"""

import argparse
import hashlib
import os
import shutil
import sys
import urllib.error
import urllib.request

DEFAULT_URL = (
    "https://raw.githubusercontent.com/tesseract-ocr/tessdata_fast/"
    "65727574dfcd264acbb0c3e07860e4e9e9b22185/eng.traineddata"
)
EXPECTED_SHA256 = "7d4322bd2a7749724879683fc3912cb542f19906c83bcc1a52132556427170b2"
EXPECTED_SIZE = 4113088


def sha256_of_file(path: str) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description="Prepare Tesseract OCR model")
    parser.add_argument("--output", required=True, help="Destination model path")
    parser.add_argument("--cache-dir", required=True, help="Cache directory")
    args = parser.parse_args()

    os.makedirs(args.cache_dir, exist_ok=True)
    cache_file = os.path.join(args.cache_dir, "eng.traineddata")

    if os.path.exists(cache_file):
        actual_hash = sha256_of_file(cache_file)
        if actual_hash == EXPECTED_SHA256:
            os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)
            shutil.copyfile(cache_file, args.output)
            print(f"Used cached OCR model at {cache_file}")
            return 0
        print("Cached model SHA-256 mismatch, re-downloading...", file=sys.stderr)
        os.remove(cache_file)

    print(f"Downloading OCR model from {DEFAULT_URL}...")
    temp_file = cache_file + ".tmp"
    try:
        req = urllib.request.Request(
            DEFAULT_URL, headers={"User-Agent": "AidansPatches/1.0"}
        )
        with (
            urllib.request.urlopen(req, timeout=60) as resp,
            open(temp_file, "wb") as out,
        ):
            shutil.copyfileobj(resp, out)
    except (urllib.error.URLError, OSError) as e:
        if os.path.exists(temp_file):
            os.remove(temp_file)
        print(f"Download failed: {e}", file=sys.stderr)
        return 1

    actual_hash = sha256_of_file(temp_file)
    if actual_hash != EXPECTED_SHA256:
        os.remove(temp_file)
        print(
            f"Downloaded OCR model SHA-256 mismatch: got {actual_hash}, expected {EXPECTED_SHA256}",
            file=sys.stderr,
        )
        return 1

    os.rename(temp_file, cache_file)
    os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)
    shutil.copyfile(cache_file, args.output)
    print(f"Prepared OCR model: {args.output}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
