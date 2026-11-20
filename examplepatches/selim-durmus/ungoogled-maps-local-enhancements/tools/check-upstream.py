#!/usr/bin/env python3
"""Check a bearinmind patches MPP against what Tutto Enhancements needs. Standard library only.

Usage: python tools/check-upstream.py --mpp patches-X.mpp --list patches-list.json
           [--previous-list old-patches-list.json] [--report report.md]

Checks, for Google Maps:
  1. the Maps version the release targets, against config/morphe-source-lock.json;
  2. that every extension member in config/upstream-bindings.json is still defined;
  3. new or renamed Maps patches whose name or description hints at overlap with ours.
Exit code 0: compatible. 1: needs attention (details in the report). 2: could not check.
"""
import argparse
import json
from pathlib import Path
import struct
import sys
import zipfile

ROOT = Path(__file__).resolve().parents[1]
MAPS = "com.google.android.apps.maps"


def uleb(data, at):
    result = shift = 0
    while True:
        b = data[at]; at += 1
        result |= (b & 0x7f) << shift
        if b < 0x80:
            return result, at
        shift += 7


class Dex:
    """Just enough of the DEX format to list defined classes, fields and methods."""

    def __init__(self, data):
        self.d = data
        (self.string_n, self.string_off, self.type_n, self.type_off, self.proto_n, self.proto_off,
         self.field_n, self.field_off, self.method_n, self.method_off, self.class_n,
         self.class_off) = struct.unpack_from("<12I", data, 0x38)

    def string(self, i):
        off = struct.unpack_from("<I", self.d, self.string_off + 4 * i)[0]
        _, at = uleb(self.d, off)
        end = self.d.index(b"\0", at)
        return self.d[at:end].decode("utf-8", "replace")  # MUTF-8; fine for type and member names

    def type(self, i):
        return self.string(struct.unpack_from("<I", self.d, self.type_off + 4 * i)[0])

    def proto(self, i):
        _, ret, params = struct.unpack_from("<3I", self.d, self.proto_off + 12 * i)
        args = ""
        if params:
            n = struct.unpack_from("<I", self.d, params)[0]
            args = "".join(self.type(struct.unpack_from("<H", self.d, params + 4 + 2 * k)[0]) for k in range(n))
        return f"({args}){self.type(ret)}"

    def field(self, i):
        cls, typ, name = struct.unpack_from("<HHI", self.d, self.field_off + 8 * i)
        return f"{self.type(cls)}->{self.string(name)}:{self.type(typ)}"

    def method(self, i):
        cls, proto, name = struct.unpack_from("<HHI", self.d, self.method_off + 8 * i)
        return f"{self.type(cls)}->{self.string(name)}{self.proto(proto)}"

    def defined(self):
        """Members declared by the classes this DEX defines (not ones it only references)."""
        fields, methods = set(), set()
        for c in range(self.class_n):
            data_off = struct.unpack_from("<8I", self.d, self.class_off + 32 * c)[6]
            if not data_off:
                continue
            counts, at = [], data_off
            for _ in range(4):
                n, at = uleb(self.d, at); counts.append(n)
            for k, n in enumerate(counts):
                index = 0
                for _ in range(n):
                    diff, at = uleb(self.d, at); index += diff
                    _, at = uleb(self.d, at)  # access flags
                    if k < 2:
                        fields.add(self.field(index))
                    else:
                        _, at = uleb(self.d, at)  # code offset
                        methods.add(self.method(index))
        return fields, methods


def maps_patches(path):
    data = json.loads(Path(path).read_text(encoding="utf-8"))
    out = {}
    for p in data["patches"]:
        for pkg in p.get("compatiblePackages") or []:
            if pkg.get("packageName") == MAPS:
                out[p["name"]] = (p, [t.get("version") for t in pkg.get("targets") or []])
    return out


def main():
    a = argparse.ArgumentParser(description=__doc__)
    a.add_argument("--mpp", required=True, type=Path)
    a.add_argument("--list", required=True, type=Path)
    a.add_argument("--previous-list", type=Path)
    a.add_argument("--report", type=Path)
    args = a.parse_args()
    lock = json.loads((ROOT / "config/morphe-source-lock.json").read_text(encoding="utf-8"))
    need = json.loads((ROOT / "config/upstream-bindings.json").read_text(encoding="utf-8"))
    lines, problems = [], []

    patches = maps_patches(args.list)
    if not patches:
        print("No Google Maps patches in the list"); return 2
    versions = sorted({v for _, vs in patches.values() for v in vs if v})
    ours = lock["maps_version"]
    lines.append(f"- Google Maps target: {', '.join(versions) or 'any'} (ours: {ours})")
    if versions and ours not in versions:
        problems.append(f"Maps target changed to {', '.join(versions)}. Pull that APK, rerun "
                        "`tools/chip-names.py` (or rely on the name-free chip), update `AppTarget`, "
                        "`maps_version` and the stock APK lock, then rebuild and test.")

    fields, methods = set(), set()
    with zipfile.ZipFile(args.mpp) as z:
        for name in z.namelist():
            if name.endswith((".mpe", ".dex")):
                f, m = Dex(z.read(name)).defined()
                fields |= f; methods |= m
    missing = [x for x in need["fields"] if x not in fields] + [x for x in need["methods"] if x not in methods]
    lines.append(f"- Extension members we call: {len(need['fields']) + len(need['methods']) - len(missing)} of "
                 f"{len(need['fields']) + len(need['methods'])} present")
    if missing:
        problems.append("Missing or changed extension members (our patch would refuse to apply):\n"
                        + "\n".join(f"  - `{x}`" for x in missing))

    if args.previous_list and args.previous_list.is_file():
        before = maps_patches(args.previous_list)
        added = [n for n in patches if n not in before]
        removed = [n for n in before if n not in patches]
        lines.append(f"- Maps patches: {len(patches)} ({len(added)} new, {len(removed)} removed)")
        for n in added:
            text = (n + " " + (patches[n][0].get("description") or "")).lower()
            hits = [k for k in need["overlap_keywords"] if k in text]
            if hits:
                problems.append(f"New Maps patch **{n}** mentions {', '.join(hits)}: check it does not "
                                "duplicate Home and Work shortcuts or Label search suggestions.")
        if removed:
            lines.append("  - Removed: " + ", ".join(removed))

    status = "needs attention" if problems else "compatible"
    report = f"### bearinmind check: {status}\n\n" + "\n".join(lines)
    if problems:
        report += "\n\n#### To do\n" + "\n".join(f"- {p}" for p in problems)
    print(report)
    if args.report:
        args.report.write_text(report + "\n", encoding="utf-8")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
