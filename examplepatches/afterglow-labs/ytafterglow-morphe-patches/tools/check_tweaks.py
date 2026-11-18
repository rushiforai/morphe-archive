#!/usr/bin/env python3
"""Checks the tweak split for consistency. Fails (exit 1) when:

- a registry key (internal keys excepted) belongs to no tweak and not to base,
  or to more than one of them;
- a named patch marks a tweak id that is not in tools/tweaks.json, or its name
  differs from that tweak's name;
- two named patches mark the same tweak id;
- a named patch never calls markTweakInstalled;
- settings/TweakCatalog.java is stale (see tools/generate_tweaks.py).
"""
import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATCHES = os.path.join(ROOT, "patches", "src", "main", "kotlin")
NAMED_PATCH = re.compile(r'\b(?:bytecodePatch|resourcePatch|rawResourcePatch)\(\s*name\s*=\s*"([^"]+)"')
MARK = re.compile(r'markTweakInstalled\(\s*"([^"]+)"\s*\)')


def main():
    errors = []
    with open(os.path.join(ROOT, "tools", "tweaks.json")) as fh:
        tweaks = json.load(fh)
    with open(os.path.join(ROOT, "tools", "ios-registry.json")) as fh:
        registry = json.load(fh)

    owners = {}
    for key in tweaks["base"]:
        owners.setdefault(key, []).append("base")
    names = {}
    for tweak in tweaks["tweaks"]:
        if tweak["id"] in names:
            errors.append(f"tweaks.json: duplicate tweak id {tweak['id']}")
        names[tweak["id"]] = tweak["name"]
        for key in tweak["keys"]:
            owners.setdefault(key, []).append(tweak["id"])

    internal = set(registry.get("internalKeys", []))
    for entry in registry["entries"]:
        key = entry["key"]
        if key in internal:
            continue
        found = owners.get(key, [])
        if not found:
            errors.append(f"key {key} belongs to no tweak and not to base")
        elif len(found) > 1:
            errors.append(f"key {key} belongs to several: {', '.join(found)}")
    # Internal keys (theme colors, scrubber image, the tab list) have settings rows too,
    # so a tweak may own them; they just aren't required to have an owner.
    known = {entry["key"] for entry in registry["entries"]} | internal
    for key, implementation in tweaks.get("implementedInternalKeys", {}).items():
        if key not in internal:
            errors.append(f"implementedInternalKeys lists non-internal key {key}; use parity.json")
        elif key not in owners or len(owners[key]) != 1:
            errors.append(f"implemented internal key {key} must have one tweak owner")
        if not isinstance(implementation, str) or not implementation.strip():
            errors.append(f"implemented internal key {key} needs an implementation reference")
    for key in owners:
        if key not in known:
            errors.append(f"tweaks.json lists {key}, which is neither a registry nor an internal key")
        elif key in internal and len(owners[key]) > 1:
            errors.append(f"key {key} belongs to several: {', '.join(owners[key])}")

    marked = {}
    for folder, _, files in os.walk(PATCHES):
        for name in sorted(files):
            if not name.endswith(".kt"):
                continue
            path = os.path.join(folder, name)
            source = open(path).read()
            matches = list(NAMED_PATCH.finditer(source))
            for index, match in enumerate(matches):
                end = matches[index + 1].start() if index + 1 < len(matches) else len(source)
                block = source[match.end():end]
                patch_name = match.group(1)
                where = f"{os.path.relpath(path, ROOT)}: patch \"{patch_name}\""
                ids = MARK.findall(block)
                if not ids:
                    errors.append(f"{where} never calls markTweakInstalled")
                    continue
                for tweak_id in ids:
                    if tweak_id not in names:
                        errors.append(f"{where} marks unknown tweak id {tweak_id}")
                    elif names[tweak_id] != patch_name:
                        errors.append(f"{where} marks {tweak_id}, whose name is \"{names[tweak_id]}\"")
                    if tweak_id in marked:
                        errors.append(f"{where} marks {tweak_id}, already marked by {marked[tweak_id]}")
                    marked[tweak_id] = where

    stale = subprocess.run([sys.executable, os.path.join(ROOT, "tools", "generate_tweaks.py"), "--check"],
                           capture_output=True, text=True)
    if stale.returncode != 0:
        errors.append(stale.stdout.strip() or stale.stderr.strip())

    for error in errors:
        print("FAIL:", error)
    print(f"{len(marked)} named tweak patches; " + ("OK" if not errors else f"{len(errors)} problem(s)"))
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
