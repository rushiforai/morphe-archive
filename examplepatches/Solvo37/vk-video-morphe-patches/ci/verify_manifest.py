#!/usr/bin/env python3
"""Validate that re-signed VK Video does not redeclare stock VK signature permissions."""

from __future__ import annotations

import argparse
from pathlib import Path
import re
import sys

CONFLICTING = {
    "com.vkontakte.android.permission.ACCESS_DATA",
    "com.vkontakte.android.permission.APP_REDIRECT",
}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("xmltree")
    args = parser.parse_args()

    lines = Path(args.xmltree).read_text(encoding="utf-8", errors="replace").splitlines()
    declarations: set[str] = set()

    current_tag = None
    current_indent = -1

    for line in lines:
        stripped = line.lstrip()
        indent = len(line) - len(stripped)

        if stripped.startswith("E: "):
            current_tag = stripped[3:].split()[0]
            current_indent = indent
            continue

        if current_tag == "permission" and indent > current_indent and "android:name" in stripped:
            for permission in CONFLICTING:
                if permission in stripped:
                    declarations.add(permission)

    if declarations:
        print(
            "ERROR: conflicting stock-VK permission declaration(s) remain: "
            + ", ".join(sorted(declarations)),
            file=sys.stderr,
        )
        return 1

    print("Manifest coexistence gate passed: no conflicting stock-VK permission declarations.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
