#!/usr/bin/env python3
"""Build the bundled res/values-ja/strings.xml from translation JSON files.

Usage:
    python3 tools/build_values_ja.py analysis/ja_chunk0.json analysis/ja_chunk1.json ... \\
        -o patch/patches/src/main/resources/translations/values-ja-strings.xml

Merges chunk files (later files win on conflicts), sorts by resource name,
escapes XML special chars, and preserves %s / %1$s style placeholders.
"""
import argparse
import json
import sys
import xml.sax.saxutils as sax


def escape(value: str) -> str:
    # Escape & < > first, then single/double quotes for Android string resources.
    out = sax.escape(value, {"\"": "&quot;"})
    out = out.replace("'", "\\'")
    # A leading @ or ? is resource-reference syntax: escape it.
    if out.startswith(("@", "?")):
        out = "\\" + out
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("inputs", nargs="+")
    ap.add_argument("-o", "--output", required=True)
    args = ap.parse_args()

    merged: dict[str, str] = {}
    for path in args.inputs:
        with open(path, encoding="utf-8") as f:
            data = json.load(f)
        if isinstance(data, list):  # tolerate [{name, ja}] shape
            data = {item["name"]: item["ja"] for item in data}
        merged.update(data)

    # Safety: drop empty translations so the app falls back to defaults.
    merged = {k: v for k, v in merged.items() if isinstance(v, str) and v.strip()}

    lines = ['<?xml version="1.0" encoding="utf-8"?>', "<resources>"]
    for name in sorted(merged):
        lines.append(f'    <string name="{name}">{escape(merged[name])}</string>')
    lines.append("</resources>")

    with open(args.output, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines) + "\n")
    print(f"wrote {len(merged)} strings -> {args.output}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
