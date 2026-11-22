#!/usr/bin/env python3
"""Relocate the v1.3.1 game classes for coexistence with v1.4.3.

The original archived files are NEVER modified. Output is ignored by Git.
"""
from pathlib import Path
import argparse
import re

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT.parent / "v1.10.1/helpers/e/e/a"
TARGET = ROOT / "work/classic131-src/e/e/a/internal/classic131"
OLD = "Le/e/a/BikeRun"
NEW = "Le/e/a/internal/classic131/BikeRun"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=TARGET)
    target = parser.parse_args().output
    files = sorted(SOURCE.glob("BikeRun*.smali"))
    if len(files) != 22:
        raise SystemExit("Expected 22 archived v1.3.1 classes, found %d" % len(files))
    if target.exists():
        raise SystemExit("Refusing to overwrite existing relocated classic source")
    target.mkdir(parents=True)
    for source in files:
        original = source.read_text(encoding="utf-8")
        if "const-string" in original:
            for line in original.splitlines():
                if "const-string" in line and OLD in line:
                    raise ValueError("Descriptor-like string literal requires manual inspection: " + source.name)
        rewritten = original.replace(OLD, NEW)
        # Keep shared v1.x record keys; versions are carried by each record.
        header = re.search(r"^\.class\b[^\n]*\s+(L[^;\s]+;)$", rewritten, re.MULTILINE)
        expected = NEW + source.stem[len("BikeRun"):] + ";"
        if not header or header.group(1) != expected:
            raise ValueError("Unexpected declared class in " + source.name)
        if OLD in rewritten:
            raise ValueError("Unrelocated type reference in " + source.name)
        (target / source.name).write_text(rewritten, encoding="utf-8")
    print("PASS: 22 original v1.3.1 classes relocated with shared record keys")
    print("Namespace: Le/e/a/internal/classic131/BikeRun*")


if __name__ == "__main__":
    main()
