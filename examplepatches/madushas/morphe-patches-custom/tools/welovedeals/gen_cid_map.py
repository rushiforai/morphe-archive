#!/usr/bin/env python3
"""Generate class-id -> Dart class name map from a blutter symbol dump.

Usage: python3 gen_cid_map.py <blutter-out-dir> <out-json>

blutter's per-library .dart disassembly lists every class as:
    // class id: 2157, size: 0x50, field offset: 0x24
    class SubscriptionFunctions extends ChangeNotifier {

The Frida probe reads Dart class ids at runtime from object headers
([obj-1] >> 12 & 0xfffff) and cross-references this map to name live objects.
"""
import glob, json, re, sys

dump_dir, out_json = sys.argv[1], sys.argv[2]
found = {}
for path in glob.glob(f"{dump_dir}/asm/**/*.dart", recursive=True):
    for i, line in enumerate(open(path, encoding="utf-8", errors="ignore")):
        m = re.match(r"//\s*class id:\s*(\d+)", line.strip())
        if m:
            for j in range(i + 1, min(i + 4, len(open(path).readlines()) - i - 1)):
                decl = line  # placeholder, replaced below
                break
    # (single pass below is simpler and correct)
for path in glob.glob(f"{dump_dir}/asm/**/*.dart", recursive=True):
    lines = open(path, encoding="utf-8", errors="ignore").read().splitlines()
    for i, line in enumerate(lines):
        m = re.match(r"//\s*class id:\s*(\d+)", line.strip())
        if not m:
            continue
        for j in range(i + 1, min(i + 4, len(lines))):
            if lines[j].startswith("class "):
                name = lines[j][6:].split(" extends")[0].split("<")[0].strip()
                found[int(m.group(1))] = name
                break
json.dump(found, open(out_json, "w"), indent=0)
print(f"mapped {len(found)} classes -> {out_json}")
