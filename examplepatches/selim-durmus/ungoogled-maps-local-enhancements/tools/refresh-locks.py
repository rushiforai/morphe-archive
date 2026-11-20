#!/usr/bin/env python3
"""Point the build at a Tutto bundle and a bearinmind release that are already in vendor/artifacts.

Usage: python tools/refresh-locks.py --tutto 1.7.0 --upstream 2.10.0 --upstream-commit <sha>

Copies dist/tutto-enhancements-<v>.mpp (and .sources.json) into vendor/artifacts when needed, then
rewrites config/morphe-source-lock.json and the "meta" of config/morphe-combined-options.json.
Patch selections in the options file are kept. Reads and writes local files only.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parents[1]
VENDOR = ROOT / "vendor/artifacts"


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--tutto", required=True)
    p.add_argument("--upstream", required=True)
    p.add_argument("--upstream-commit", required=True)
    args = p.parse_args()
    tutto = VENDOR / f"tutto-enhancements-{args.tutto}.mpp"
    for suffix in (".mpp", ".sources.json"):
        built = ROOT / "dist" / f"tutto-enhancements-{args.tutto}{suffix}"
        if built.is_file():
            shutil.copy2(built, VENDOR / built.name)
    upstream = VENDOR / f"patches-{args.upstream}.mpp"
    source = VENDOR / f"morphe-patches-{args.upstream}-source.tar.gz"
    for f in (tutto, tutto.with_suffix(".sources.json"), upstream, source):
        if not f.is_file():
            raise SystemExit(f"Missing {f.relative_to(ROOT)}")

    lock_path = ROOT / "config/morphe-source-lock.json"
    lock = json.loads(lock_path.read_text(encoding="utf-8"))
    lock.update(bundle_version=args.tutto, upstream_release=f"v{args.upstream}",
                upstream_commit=args.upstream_commit)
    lock["files"] = {f.relative_to(ROOT).as_posix(): sha256(f) for f in (upstream, tutto, source)}
    lock_path.write_text(json.dumps(lock, indent=2) + "\n", encoding="utf-8")

    options_path = ROOT / "config/morphe-combined-options.json"
    options = json.loads(options_path.read_text(encoding="utf-8"))
    for bundle in options:
        is_tutto = bundle["meta"]["source"].startswith("tutto-enhancements-")
        f = tutto if is_tutto else upstream
        bundle["meta"] = {"source": f.name, "sha256": sha256(f)}
    options_path.write_text(json.dumps(options, indent=2) + "\n", encoding="utf-8")
    print(f"Locked Tutto {args.tutto} with bearinmind {args.upstream} ({args.upstream_commit[:7]}).")


if __name__ == "__main__":
    main()
