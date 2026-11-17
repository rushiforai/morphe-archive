#!/usr/bin/env python3
"""Shared patch-application engine.

Design goals (the 'never lose a patch again' mechanism):
  * Every patch is a declarative entry in a registry with a strict anchor.
  * The engine applies patches to smali trees and FAILS THE BUILD if any
    anchor does not match exactly the expected number of times.
  * After reassembly, the engine re-disassembles the produced dex and
    re-verifies every patch's postcondition on the REAL output (with
    label-number normalization, since baksmali renumbers labels).
  * The registry is dumped to patches/manifest.json + patches/PATCHES.md so
    the full patch set travels with every build and every release upload.
"""
import json
import os
import re
import sys

W = "work"
RESULTS = []
FAILURES = []

_LABEL_RE = re.compile(r":(?:cond|goto|pswitch|sswitch|catch|catchall|try_start|try_end)_[0-9a-zA-Z]+")


def _norm(s):
    """Normalize smali text for verification: labels are renumbered by
    baksmali after reassembly, so compare with label numbers stripped."""
    return _LABEL_RE.sub(":LABEL", s)


class Patch:
    def __init__(self, pid, category, title, version, target, old, new, count=1,
                 verify=None, verify_absent=None, note="", optional=False, enabled=True):
        self.pid = pid            # stable patch id, e.g. "P1"
        self.category = category  # core / privacy / adblock / vpn / ...
        self.title = title
        self.version = version    # version introduced, e.g. "v6" / "v11"
        self.target = target      # smali tree path, relative to work/
        self.old = old
        self.new = new
        self.count = count
        self.verify = verify if verify is not None else new  # must be present afterwards
        # verify_absent: text that must NOT remain afterwards. Pass "old"
        # for replacement patches (the replaced code must be gone); pass
        # None (default) for insertion patches whose anchor legitimately
        # remains in the output.
        self.verify_absent = old if verify_absent == "old" else verify_absent
        self.note = note
        self.optional = optional
        self.enabled = enabled

    def as_dict(self):
        return {
            "id": self.pid, "category": self.category, "title": self.title,
            "version_introduced": self.version, "target": self.target,
            "anchor_count": self.count, "note": self.note,
            "optional": self.optional, "enabled": self.enabled,
            "anchor_sha": _sha(self.old)[:16], "replacement_sha": _sha(self.new)[:16],
        }


def _sha(s):
    import hashlib
    return hashlib.sha256(s.encode()).hexdigest()


def patch_file(tree_root, p: Patch):
    """Apply one Patch to a smali tree root (e.g. work/v11/build-c3)."""
    path = os.path.join(tree_root, p.target)
    try:
        with open(path, encoding="utf-8") as f:
            txt = f.read()
    except FileNotFoundError:
        FAILURES.append(f"{p.pid}: target file missing: {path}")
        return
    n = txt.count(p.old)
    if n != p.count:
        FAILURES.append(
            f"{p.pid}: expected {p.count} anchor match(es) in {p.target}, found {n}")
        return
    if p.old != p.new:
        txt = txt.replace(p.old, p.new)
        with open(path, "w", encoding="utf-8") as f:
            f.write(txt)
    RESULTS.append(p)
    print(f"OK   {p.pid:8s} {p.title}")


def verify_tree(tree_root, p: Patch):
    """Post-assembly verification (label-number normalized):
    replacement present; explicitly-declared absent text really absent."""
    path = os.path.join(tree_root, p.target)
    try:
        with open(path, encoding="utf-8") as f:
            txt = _norm(f.read())
    except FileNotFoundError:
        FAILURES.append(f"{p.pid} VERIFY: file missing: {path}")
        return False
    ok = True
    if p.verify and txt.count(_norm(p.verify)) < 1:
        FAILURES.append(f"{p.pid} VERIFY: replacement not found in {p.target}")
        ok = False
    if p.verify_absent and txt.count(_norm(p.verify_absent)) >= p.count:
        FAILURES.append(f"{p.pid} VERIFY: original code still present in {p.target}")
        ok = False
    return ok


def write_manifest(path, patches, build_version):
    doc = {
        "build": build_version,
        "base_apk": "Opera Beta 104.0.5262.91143 (APKMirror apkm)",
        "patch_count": len(patches),
        "patches": [p.as_dict() for p in patches],
    }
    with open(path, "w", encoding="utf-8") as f:
        json.dump(doc, f, indent=2, ensure_ascii=False)
    print(f"manifest written: {path} ({len(patches)} patches)")


def finish():
    if FAILURES:
        print("\nPATCH FAILURES:")
        for f_ in FAILURES:
            print("  -", f_)
        sys.exit(1)
    print(f"\nall {len(RESULTS)} patches applied cleanly")
