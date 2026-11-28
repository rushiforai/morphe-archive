#!/usr/bin/env python3
"""Add AppTarget("9.2.4.2644") next to the verified 9.2.0.2053 target in upstream's Constants.kt.

Idempotent: if the target is already present, does nothing.
Exits non-zero with a descriptive message if the anchor block is not found,
so the build fails loudly instead of shipping a bundle without the verified target.
"""
import pathlib
import sys

TARGET = "9.2.4.2644"
ANCHOR = (
    '            AppTarget(\n'
    '                version = "9.2.0.2053"\n'
    '            ),\n'
)
INSERT = ANCHOR + (
    '            // Lyrics blur is verified against this build (Compose lyrics, p.* names).\n'
    '            AppTarget(\n'
    f'                version = "{TARGET}"\n'
    '            ),\n'
)


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: add-app-target.py <path to Constants.kt>", file=sys.stderr)
        return 2
    path = pathlib.Path(sys.argv[1])
    text = path.read_text(encoding="utf-8")

    if f'version = "{TARGET}"' in text:
        print(f"AppTarget {TARGET} already present in {path}; nothing to do")
        return 0

    if ANCHOR not in text:
        print(
            f"error: anchor block not found in {path}.\n"
            f"Upstream layout changed — add AppTarget(\"{TARGET}\") manually "
            "to COMPATIBILITY_SPOTIFY's targets list.",
            file=sys.stderr,
        )
        return 1

    path.write_text(text.replace(ANCHOR, INSERT, 1), encoding="utf-8")
    print(f"Added AppTarget {TARGET} to {path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
