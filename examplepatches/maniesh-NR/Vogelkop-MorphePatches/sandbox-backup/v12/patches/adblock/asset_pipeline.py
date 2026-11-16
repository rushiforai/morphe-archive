#!/usr/bin/env python3
"""Adblock asset pipeline for the v11+ builds.

1. Parse assets/op/abp.manifest (stock).
2. Fetch every region-A list from https://blocklists.operacdn.com/<sha256>
   and verify the SHA-256 (content-addressed CDN).
3. Rebuild the manifest WITHOUT:
     - opera_fixes        ("Opera site fixes" - user wants it gone from menu)
     - tier1_allow_rules  (acceptable ads whitelist)
     - tier2_allow_rules  (acceptable ads whitelist)
   Same binary format, entry-by-entry copy for everything else.
4. Emit the fresh list files (named by their sha256) for assets/abp_files/op/.

Output dir: work/v11/abp-out/
  - abp.manifest          (surgical rebuild)
  - files/<sha256>        (all remaining lists, fresh)
  - report.txt            (what was fetched/removed/skipped)
"""
import hashlib
import os
import re
import struct
import sys
import urllib.request

STOCK = "work/v11/abp-stock.bin"
OUT = "work/v11/abp-out"
REMOVE = {b"opera_fixes", b"tier1_allow_rules", b"tier2_allow_rules"}
BASE = "https://blocklists.operacdn.com/"


def parse_manifest(data):
    """Return (header_bytes, base_url, entries) where entries =
    [(id_bytes, hash_hex_bytes, raw_entry_bytes)] for BOTH regions in
    file order, plus offsets so we can rebuild."""
    p = 5
    base_len = data[p]
    base = data[p + 1:p + 1 + base_len]
    p = p + 1 + base_len
    (cnt,) = struct.unpack_from(">H", data, p)
    p += 2
    entries = []
    for _ in range(cnt):
        start = p
        flag = data[p]; p += 1
        nl = data[p]; p += 1
        name = data[p:p + nl]; p += nl
        flag2 = data[p]; p += 1
        hl = data[p]; p += 1
        h = data[p:p + hl]; p += hl
        entries.append((name, h, data[start:p]))
    return data[:5], base, entries, p


def main():
    os.makedirs(f"{OUT}/files", exist_ok=True)
    data = open(STOCK, "rb").read()
    header, base, entries, entries_end = parse_manifest(data)
    tail = data[entries_end:]  # region B + metadata region (opaque)

    print(f"stock manifest: {len(entries)} catalog entries, base={base.decode()}")
    removed = [e for e in entries if e[0] in REMOVE]
    kept = [e for e in entries if e[0] not in REMOVE]
    print(f"removing: {[e[0].decode() for e in removed]}")
    print(f"keeping: {len(kept)} entries")

    # 1. fetch each kept list, verify sha256, write file
    report = []
    files = {}
    for name, h, raw in kept:
        hid = h.decode()
        url = BASE + hid
        try:
            req = urllib.request.Request(url, headers={"User-Agent": " opera-adblock-pipeline"})
            with urllib.request.urlopen(req, timeout=60) as r:
                blob = r.read()
        except Exception as e:
            report.append(f"FETCH-FAIL {name.decode()}: {e}")
            continue
        sha = hashlib.sha256(blob).hexdigest()
        if sha != hid:
            report.append(f"HASH-MISMATCH {name.decode()}: cdn={hid[:16]} got={sha[:16]}")
            continue
        files[name] = blob
        with open(f"{OUT}/files/{sha}", "wb") as f:
            f.write(blob)
        report.append(f"OK {name.decode():34s} {len(blob):>9d} B  {sha[:16]}")

    # 2. rebuild manifest: header + base + count(kept) + kept entries
    #    + tail with region-B entries and metadata entries excised.
    #
    # Tail structure (reverse-engineered, validated against the v6 build):
    #   region B: N entries of  00 <idlen> <id> 00 40 <64 hex chars>
    #   metadata: 00 01 | 00 00 00 <count> | repeated:
    #       00 00 00 <entry_len> 00 <idlen> <id> 00 00 00 <x> 00 00 00 07
    #       00 00 <tlen> <title> [00 00 00 <ulen> <url>] <pad zeros>
    #       (entry_len covers id..padding, excludes the 4-byte length field)
    out = bytearray()
    out += header
    out += bytes([len(base)]) + base
    out += struct.pack(">H", len(kept))
    for name, h, raw in kept:
        out += raw
    new_tail = bytearray(tail)

    # 2a. region-B entries for removed ids (not every id has one; only
    # ids whose bundled asset ships in the APK get a region-B entry)
    for name, _, _ in removed:
        pat = b"\x00" + bytes([len(name)]) + name + b"\x00\x40"
        i = bytes(new_tail).find(pat)
        if i >= 0:
            del new_tail[i:i + len(pat) + 64]
        else:
            report.append(f"note: no region-B entry for {name.decode()}")

    # 2b. metadata entries for removed ids + count fixup
    meta_marker = b"\x00\x01\x00\x00\x00"
    mi = bytes(new_tail).find(meta_marker)
    assert mi >= 0, "metadata region marker not found"
    (meta_count,) = struct.unpack_from(">I", new_tail, mi + 2)
    assert meta_count == len(entries), \
        f"unexpected metadata count {meta_count} vs catalog {len(entries)}"
    new_count = meta_count - len(removed)
    struct.pack_into(">I", new_tail, mi + 2, new_count)
    for name, _, _ in removed:
        blob = bytes(new_tail)
        pat = b"\x00\x00\x00"  # u32 len field high 3 bytes
        idpat = b"\x00" + bytes([len(name)]) + name
        # find the metadata entry: an idpat preceded by a u32 length field
        # (i.e. '00 00 00 <len>' right before '00 <idlen> <id>').
        search_from = mi
        while True:
            j = blob.find(idpat, search_from)
            if j < 0:
                raise AssertionError(f"metadata id not found: {name}")
            # candidate entry start: j-4 (the u32 length field)
            if j >= 4 and blob[j - 4] == 0 and blob[j - 3] == 0 and blob[j - 2] == 0:
                (elen,) = struct.unpack_from(">I", blob, j - 4)
                # sanity: entry must contain the id and end before file end
                if 0 < elen <= len(blob) - (j - 4) and elen > len(name):
                    del new_tail[j - 4: j - 4 + 4 + elen]
                    break
            search_from = j + 1
    out += new_tail

    with open(f"{OUT}/abp.manifest", "wb") as f:
        f.write(bytes(out))
    report.append(f"manifest: {len(out)} bytes (stock {len(data)})")
    report.append(f"files written: {len(files)}")

    with open(f"{OUT}/report.txt", "w") as f:
        f.write("\n".join(report) + "\n")
    print("\n".join(report))

    if len(files) != len(kept):
        print(f"\nWARNING: {len(kept) - len(files)} lists failed to fetch", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
