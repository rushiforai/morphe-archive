#!/usr/bin/env python3
"""Map obfuscated resource ids of one Gboard build to another.

Gboard's resource names are obfuscated, so apktool names them APKTOOL_RENAMED_0x7f......, and the
ids shift between builds. This tool decodes neither APK itself: it takes two apktool output
directories and matches their resources by content.

How it matches:
  - Every resource gets a skeleton: its XML (or the bytes of a binary file, or the values entry)
    with each obfuscated reference replaced by a placeholder, plus the ordered list of the ids
    it refers to.
  - Repeatedly: an old and a new resource are matched when they are the only unmatched pair of
    their type whose skeleton is the same and whose references point to the same matched
    resources (unmatched references count as unknown). Then, for every matched pair with the same
    skeleton, the references are matched position by position. That is how ids, which have no
    content of their own, are matched.

Usage:
  map_resource_ids.py OLD_DIR NEW_DIR [--ids 0x7f0e0241,0x7f150710 | --ids-from PATH ...]
                      [--table OUT]
With --ids-from, every 0x7f...... in the given files (patch sources, bundled XML) is mapped.
Prints one line per id: old id, new id or "?", type and how the match was found. "content
differs" means the resource was found through a resource that refers to it, but its own content
changed: check that the change does not matter to the patches.
With --table, also writes the "old new" pairs to OUT, the id table the patches read for the new
build. Nothing is written when an id is not found, or when every id is the same in both builds.

To support a new Gboard build, first compare resources.arsc with that of 18.5.4. When it is the
same (as for 18.5.6, 18.5.9 and 18.5.10), the build needs no table: map its version to null in
Constants.GBOARD_VERSIONS.
  unzip -p new.apk resources.arsc | sha1sum
Otherwise, decode it and generate the table (OLD_DIR decoded from 18.5.4, the build the ids in
the patches come from). When the tool reports that every id is unchanged (as for 18.5.11, whose
resources.arsc differs elsewhere), map the version to null too. Otherwise map it to the table's
name in Constants.GBOARD_VERSIONS:
  java -jar apktool.jar d -s -o _decoded/new new.apk
  python -I tools/map_resource_ids.py _decoded/apktool _decoded/new \\
      --ids-from patches/src/main/kotlin/app patches/src/main/resources/gboardios \\
      --table patches/src/main/resources/gboardios/ids/<version name without the ABI>.txt
"""
import argparse
import hashlib
import os
import re
import sys
import xml.etree.ElementTree as ET
from collections import defaultdict

RENAMED = re.compile(r"APKTOOL_RENAMED_(0x7f[0-9a-f]{6})")
ID_LITERAL = re.compile(r"0x7f[0-9a-fA-F]{6}")

VALUE_TAGS = {
    "string": "string", "dimen": "dimen", "color": "color", "bool": "bool", "integer": "integer",
    "style": "style", "attr": "attr", "plurals": "plurals", "fraction": "fraction",
    "string-array": "array", "integer-array": "array", "array": "array", "declare-styleable": "styleable",
}


class Apk:
    def __init__(self, root):
        self.root = root
        self.type_of = {}      # id -> type
        self.name_of = {}      # id -> name
        self.by_name = {}      # (type, name) -> id
        public = os.path.join(root, "res", "values", "public.xml")
        for el in ET.parse(public).getroot():
            i = int(el.get("id"), 16)
            self.type_of[i] = el.get("type")
            self.name_of[i] = el.get("name")
            self.by_name[(el.get("type"), el.get("name"))] = i
        self.parts = defaultdict(list)  # id -> [(config, text)]
        self._read_files()
        self._read_values()
        self.skeleton = {}
        self.refs = {}
        for i in self.type_of:
            parts = sorted(self.parts.get(i, []))
            text = "\n".join(f"[{c}]{t}" for c, t in parts)
            # A resource's own name is not a reference.
            own = self.name_of[i]
            text = text.replace(f'name="{own}"', 'name="SELF"')
            refs = [int(m, 16) for m in RENAMED.findall(text)]
            skel = RENAMED.sub("#", text)
            self.skeleton[i] = hashlib.sha1(skel.encode("utf-8", "surrogatepass")).hexdigest()
            self.refs[i] = refs

    def _read_files(self):
        res = os.path.join(self.root, "res")
        for d in os.listdir(res):
            if d.startswith("values"):
                continue
            rtype, _, config = d.partition("-")
            for f in os.listdir(os.path.join(res, d)):
                name = f.split(".")[0]
                i = self.by_name.get((rtype, name))
                if i is None:
                    continue
                path = os.path.join(res, d, f)
                with open(path, "rb") as fh:
                    data = fh.read()
                if f.endswith(".xml"):
                    text = data.decode("utf-8", "replace")
                else:
                    text = "bin:" + hashlib.sha1(data).hexdigest()
                self.parts[i].append((config, text))

    def _read_values(self):
        res = os.path.join(self.root, "res")
        for d in os.listdir(res):
            if not d.startswith("values"):
                continue
            config = d.partition("-")[2]
            for f in os.listdir(os.path.join(res, d)):
                if f == "public.xml" or not f.endswith(".xml"):
                    continue
                for el in ET.parse(os.path.join(res, d, f)).getroot():
                    rtype = el.get("type") if el.tag == "item" else VALUE_TAGS.get(el.tag)
                    name = el.get("name")
                    i = self.by_name.get((rtype, name))
                    if i is None:
                        continue
                    self.parts[i].append((config, ET.tostring(el, encoding="unicode").strip()))


def match(old, new):
    m = {}      # old id -> new id
    inv = {}    # new id -> old id
    how = {}
    conflicts = defaultdict(set)

    def add(o, n, why):
        if o in m or n in inv or old.type_of[o] != new.type_of[n]:
            if o in m and m[o] != n:
                conflicts[o].add(n)
            return False
        m[o] = n
        inv[n] = o
        how[o] = why
        return True

    # Readable names are kept by the obfuscator.
    for (t, name), o in old.by_name.items():
        if not name.startswith("APKTOOL_RENAMED_"):
            n = new.by_name.get((t, name))
            if n is not None:
                add(o, n, "name")

    changed = True
    rnd = 0
    while changed:
        changed = False
        rnd += 1
        # 1. Unique keys.
        groups = defaultdict(lambda: ([], []))
        for o in old.type_of:
            if o in m:
                continue
            key = (old.type_of[o], old.skeleton[o], tuple(m.get(r, -1) for r in old.refs[o]))
            groups[key][0].append(o)
        for n in new.type_of:
            if n in inv:
                continue
            key = (new.type_of[n], new.skeleton[n], tuple(r if r in inv else -1 for r in new.refs[n]))
            if key in groups:
                groups[key][1].append(n)
        for key, (os_, ns) in groups.items():
            if len(os_) == 1 and len(ns) == 1 and key[0] != "id":
                changed |= add(os_[0], ns[0], f"content r{rnd}")
        # 2. Positional propagation through pairs with the same skeleton.
        for o, n in list(m.items()):
            if old.skeleton[o] != new.skeleton[n]:
                continue
            ro, rn = old.refs[o], new.refs[n]
            if len(ro) != len(rn):
                continue
            for a, b in zip(ro, rn):
                if a not in m and b not in inv:
                    changed |= add(a, b, f"position r{rnd}")
                elif a in m and m[a] != b:
                    conflicts[a].add(b)
    return m, how, conflicts


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("old")
    ap.add_argument("new")
    ap.add_argument("--ids", default="")
    ap.add_argument("--ids-from", nargs="*", default=[])
    ap.add_argument("--table")
    args = ap.parse_args()

    wanted = [int(x, 16) for x in args.ids.split(",") if x]
    for path in args.ids_from:
        for dirpath, dirs, files in os.walk(path) if os.path.isdir(path) else [("", [], [path])]:
            dirs[:] = [d for d in dirs if d != "ids"]  # the id tables themselves
            for f in files:
                with open(os.path.join(dirpath, f), encoding="utf-8") as fh:
                    wanted += [int(x, 16) for x in ID_LITERAL.findall(fh.read())]
    wanted = sorted(set(wanted))

    old, new = Apk(args.old), Apk(args.new)
    m, how, conflicts = match(old, new)
    print(f"# matched {len(m)} of {len(old.type_of)} old resources", file=sys.stderr)
    found = 0
    for o in wanted:
        t = old.type_of.get(o, "?")
        n = m.get(o)
        same = n is not None and old.skeleton[o] == new.skeleton[n]
        note = how.get(o, "unmatched")
        if n is not None and not same:
            note += ", content differs"
        if conflicts.get(o):
            note += ", conflicts " + ",".join(f"0x{c:08x}" for c in sorted(conflicts[o]))
        found += n is not None
        print(f"0x{o:08x} {('0x%08x' % n) if n else '?':10} {t:7} {note}")
    print(f"# {found}/{len(wanted)} wanted ids mapped", file=sys.stderr)
    if args.table:
        if found < len(wanted):
            sys.exit("Not all ids were found, so no table was written.")
        if all(m[o] == o for o in wanted):
            print("# every id is unchanged: the build needs no table, so none was written", file=sys.stderr)
            return
        with open(args.table, "w", encoding="utf-8", newline="\n") as fh:
            fh.write("# Resource ids of this Gboard build for the ids of 18.5.4 used by the patches.\n")
            fh.write("# Generated by tools/map_resource_ids.py.\n")
            for o in wanted:
                fh.write(f"0x{o:08x} 0x{m[o]:08x}\n")
        print(f"# wrote {args.table}", file=sys.stderr)


if __name__ == "__main__":
    main()
