#!/usr/bin/env python3
"""
Downloads, transforms, and caches Apple Color Emoji for Fizz.
Prunes redundant strikes down to a single 96x96 strike, preserves 2048 UPM metrics,
injects the cmap Format 14 Unicode Variation Sequences subtable, and recomputes OpenType checksums.
"""

import argparse
import base64
import hashlib
import os
import shutil
import struct
import sys
import urllib.request

DEFAULT_URL = (
    "https://github.com/samuelngs/apple-emoji-ttf/releases/download/"
    "macos-26-20260722-484daf4e/AppleColorEmoji-Linux.ttf"
)
EXPECTED_RAW_SHA256 = "e37c7af6265ac4a0af6d57bc65e86109a776d9966e8343334557f63da482516f"
EXPECTED_PROCESSED_SIZE = 38369120
EXPECTED_PROCESSED_SHA256 = (
    "c75b8bb062f4001ecacfd62ec843918096e1dcd12a0260be9e13168021fa2208"
)
OPENTYPE_CHECKSUM_MAGIC = 0xB1B0AFBA

# 757-byte Format 14 (Unicode Variation Sequences) subtable for \uFE0F emoji presentation
FMT14_B64 = (
    "AA4AAAL1AAAAAQD+DwAAABUAAAAAAAAAtwAAIwAAACoAAAAwCQAAqQAAAK4AACA8AAAgSQAAISIA"
    "ACE5AAAhlAUAIakBACMaAQAjKAAAI88AACPpCgAj+AIAJMIAACWqAQAltgAAJcAAACX7AwAmAAQA"
    "Jg4AACYRAAAmFAEAJhgAACYdAAAmIAAAJiIBACYmAAAmKgAAJi4BACY4AgAmQAAAJkIAACZICwAm"
    "XwEAJmMAACZlAQAmaAAAJnsAACZ+AQAmkgUAJpkAACabAQAmoAEAJqcAACaqAQAmsAEAJr0BACbE"
    "AQAmyAAAJs4BACbRAAAm0wEAJukBACbwBQAm9wMAJv0AACcCAAAnBQAAJwgFACcPAAAnEgAAJxQA"
    "ACcWAAAnHQAAJyEAACcoAAAnMwEAJ0QAACdHAAAnTAAAJ04AACdTAgAnVwAAJ2MBACeVAgAnoQAA"
    "J7AAACe/AAApNAEAKwUCACsbAQArUAAAK1UAADAwAAAwPQAAMpcAADKZAAHwBAAB8XABAfF+AQHy"
    "AgAB8hoAAfIvAAHyNwAB8w0CAfMVAAHzHAAB8yEAAfMkCAHzNgAB83gAAfN9AAHzkwAB85YBAfOZ"
    "AgHzngEB86cAAfOsAgHzwgAB88QAAfPGAAHzygQB89QMAfPtAAHz8wAB8/UAAfP3AAH0CAAB9BUA"
    "AfQfAAH0JgAB9D8AAfRBAQH0RgMB9E0BAfRTAAH0agAB9H0AAfSjAAH0sAAB9LMAAfS7AAH0vwAB"
    "9MsAAfTaAAH03wAB9OQCAfTqAwH09wAB9PkCAfT9AAH1CAAB9Q0AAfUSAQH1SQEB9VAXAfVvAQH1"
    "cwYB9YcAAfWKAwH1kAAB9aUAAfWoAAH1sQEB9bwAAfXCAgH10QIB9dwCAfXhAAH14wAB9egAAfXv"
    "AAH18wAB9foAAfYQAAH2hwAB9o0AAfaRAAH2lAAB9pgAAfatAAH2sgAB9rkBAfa8AAH2ywAB9s0C"
    "AfbgBQH26QAB9vAAAfbzAA=="
)
FMT14_DATA = base64.b64decode(FMT14_B64)


def calc_table_checksum(data: bytes) -> int:
    padding = (4 - (len(data) % 4)) % 4
    padded = data + (b"\x00" * padding)
    return sum(struct.unpack(f">{len(padded) // 4}I", padded)) & 0xFFFFFFFF


def verify_processed_font(path: str) -> bool:
    if not os.path.exists(path) or os.path.getsize(path) != EXPECTED_PROCESSED_SIZE:
        return False
    try:
        with open(path, "rb") as f:
            data = f.read()
        if hashlib.sha256(data).hexdigest() != EXPECTED_PROCESSED_SHA256:
            return False
        total_chk = sum(struct.unpack(f">{len(data) // 4}I", data)) & 0xFFFFFFFF
        return total_chk == OPENTYPE_CHECKSUM_MAGIC
    except (OSError, struct.error):
        return False


def download_file(url: str, dest_path: str, expected_sha256: str) -> None:
    print(f"Downloading upstream font from {url}...")
    temp_path = dest_path + ".tmp"
    h = hashlib.sha256()

    req = urllib.request.Request(url, headers={"User-Agent": "AidanPatchesBuild/1.0"})
    with urllib.request.urlopen(req) as resp, open(temp_path, "wb") as out:
        total = int(resp.headers.get("Content-Length", 0))
        downloaded = 0
        while True:
            chunk = resp.read(1024 * 1024)
            if not chunk:
                break
            out.write(chunk)
            h.update(chunk)
            downloaded += len(chunk)
            if total > 0:
                percent = downloaded * 100 // total
                sys.stdout.write(
                    f"\r  {downloaded // (1024 * 1024)}MB / {total // (1024 * 1024)}MB ({percent}%)"
                )
                sys.stdout.flush()
    print()

    digest = h.hexdigest()
    if digest != expected_sha256:
        os.remove(temp_path)
        raise ValueError(
            f"Checksum mismatch for {url}: expected {expected_sha256}, got {digest}"
        )

    os.replace(temp_path, dest_path)
    print(f"Downloaded and verified {dest_path}")


def transform_linux_ttf(input_path: str, output_path: str) -> None:
    print(f"Transforming {input_path} into single-strike optimized font...")
    with open(input_path, "rb") as f:
        font_data = f.read()

    sfnt_version = font_data[:4]
    (num_tables,) = struct.unpack(">H", font_data[4:6])

    tables = {}
    for i in range(num_tables):
        tag, _check_sum, offset, length = struct.unpack(
            ">4sIII", font_data[12 + i * 16 : 28 + i * 16]
        )
        tag_str = tag.decode("ascii", errors="replace")
        tables[tag_str] = {
            "tag": tag,
            "data": bytearray(font_data[offset : offset + length]),
        }

    # 1. Update head table: unitsPerEm = 2048, checkSumAdjustment = 0
    head = tables["head"]["data"]
    struct.pack_into(">I", head, 8, 0)
    struct.pack_into(">H", head, 18, 2048)

    # 2. Update hhea table: ascender = 2048, descender = -640
    hhea = tables["hhea"]["data"]
    struct.pack_into(">h", hhea, 4, 2048)
    struct.pack_into(">h", hhea, 6, -640)

    # 3. Update OS/2 table: sTypoAscender = 1920, sTypoDescender = -640, usWinAscent = 2048, usWinDescent = 640
    os2 = tables["OS/2"]["data"]
    struct.pack_into(">h", os2, 68, 1920)
    struct.pack_into(">h", os2, 70, -640)
    struct.pack_into(">H", os2, 74, 2048)
    struct.pack_into(">H", os2, 76, 640)

    # 4. Transform cmap table: inject Format 14 Unicode Variation Sequences subtable
    old_cmap = tables["cmap"]["data"]
    subtables_body = old_cmap[28:]
    new_cmap = bytearray()
    new_cmap.extend(struct.pack(">HH", 0, 4))
    new_cmap.extend(struct.pack(">HHI", 0, 4, 36))
    new_cmap.extend(struct.pack(">HHI", 3, 1, 3604))
    new_cmap.extend(struct.pack(">HHI", 3, 10, 36))
    fmt14_off = 36 + len(subtables_body)
    new_cmap.extend(struct.pack(">HHI", 0, 5, fmt14_off))
    new_cmap.extend(subtables_body)
    new_cmap.extend(FMT14_DATA)
    pad_cmap = (4 - (len(new_cmap) % 4)) % 4
    if pad_cmap > 0:
        new_cmap.extend(b"\x00" * pad_cmap)
    tables["cmap"]["data"] = new_cmap

    # 5. Prune CBLC and CBDT to single Strike 7 (96x96)
    cblc = tables["CBLC"]["data"]
    cbdt = tables["CBDT"]["data"]

    strike7_size_data = bytearray(cblc[8 + 7 * 48 : 8 + 8 * 48])
    sub_off, sub_size, num_sub, _color_ref = struct.unpack(
        ">IIII", strike7_size_data[:16]
    )
    strike7_subtables = bytearray(cblc[sub_off : sub_off + sub_size])

    (first_sub_add_off,) = struct.unpack(">I", strike7_subtables[4:8])
    _idx_fmt, _img_fmt, original_first_img_off = struct.unpack(
        ">HHI", strike7_subtables[first_sub_add_off : first_sub_add_off + 8]
    )
    delta = original_first_img_off - 4

    for s in range(num_sub):
        (add_off,) = struct.unpack(">I", strike7_subtables[s * 8 + 4 : s * 8 + 8])
        _idx_fmt, _img_fmt, img_off = struct.unpack(
            ">HHI", strike7_subtables[add_off : add_off + 8]
        )
        struct.pack_into(">I", strike7_subtables, add_off + 4, img_off - delta)

    new_cblc = bytearray()
    new_cblc.extend(struct.pack(">HHI", 3, 0, 1))
    struct.pack_into(">I", strike7_size_data, 0, 8 + 48)
    new_cblc.extend(strike7_size_data)
    new_cblc.extend(strike7_subtables)

    new_cbdt = bytearray()
    new_cbdt.extend(cbdt[:4])
    new_cbdt.extend(cbdt[original_first_img_off:])

    tables["CBLC"]["data"] = new_cblc
    tables["CBDT"]["data"] = new_cbdt

    # 6. Reassemble font with 4-byte aligned tables
    sorted_tags = sorted(tables.keys())
    n = len(sorted_tags)
    entry_selector = 0
    while (1 << (entry_selector + 1)) <= n:
        entry_selector += 1
    search_range = (1 << entry_selector) * 16
    range_shift = n * 16 - search_range

    out = bytearray()
    out.extend(sfnt_version)
    out.extend(struct.pack(">HHHH", n, search_range, entry_selector, range_shift))

    dir_offset = len(out)
    out.extend(b"\x00" * (n * 16))

    current_offset = len(out)
    table_records = []
    head_offset = None
    for tag_str in sorted_tags:
        t = tables[tag_str]
        data = t["data"]
        chk = calc_table_checksum(data)
        if tag_str == "head":
            head_offset = current_offset
        table_records.append((t["tag"], chk, current_offset, len(data)))
        out.extend(data)
        pad = (4 - (len(data) % 4)) % 4
        if pad > 0:
            out.extend(b"\x00" * pad)
        current_offset = len(out)

    for i, (tag, chk, offset, length) in enumerate(table_records):
        struct.pack_into(">4sIII", out, dir_offset + i * 16, tag, chk, offset, length)

    total_chk = calc_table_checksum(out)
    chk_adjustment = (OPENTYPE_CHECKSUM_MAGIC - total_chk) & 0xFFFFFFFF
    struct.pack_into(">I", out, head_offset + 8, chk_adjustment)

    temp_out = output_path + ".tmp"
    with open(temp_out, "wb") as f:
        f.write(out)
    os.replace(temp_out, output_path)
    print(f"Transformed font saved to {output_path} ({len(out) / 1024 / 1024:.2f} MB)")


def main() -> None:
    parser = argparse.ArgumentParser(description="Prepare Apple Color Emoji font")
    parser.add_argument(
        "--output", required=True, help="Destination path for transformed TTF"
    )
    parser.add_argument(
        "--cache-dir", required=True, help="Directory to cache raw and processed fonts"
    )
    parser.add_argument("--url", default=DEFAULT_URL, help="Upstream font download URL")
    args = parser.parse_args()

    os.makedirs(args.cache_dir, exist_ok=True)
    os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)

    cached_processed = os.path.join(args.cache_dir, "AppleColorEmoji-96.ttf")
    cached_raw = os.path.join(args.cache_dir, "AppleColorEmoji-Linux.ttf")

    if verify_processed_font(cached_processed):
        print(f"Found cached processed font at {cached_processed}")
    else:
        # Check raw upstream font
        has_valid_raw = False
        if os.path.exists(cached_raw):
            with open(cached_raw, "rb") as f:
                has_valid_raw = (
                    hashlib.sha256(f.read()).hexdigest() == EXPECTED_RAW_SHA256
                )
        if not has_valid_raw:
            download_file(args.url, cached_raw, EXPECTED_RAW_SHA256)
        transform_linux_ttf(cached_raw, cached_processed)

    shutil.copyfile(cached_processed, args.output)
    print(f"Successfully staged font to {args.output}")


if __name__ == "__main__":
    main()
