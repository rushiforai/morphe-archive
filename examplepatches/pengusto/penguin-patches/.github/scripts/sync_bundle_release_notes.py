#!/usr/bin/env python3
"""Regenerate a bundle description from its published GitHub release notes.

Usage: gh release view v1.7.0 --json tagName,body,isDraft | \
       python3 .github/scripts/sync_bundle_release_notes.py patches-bundle.json
"""

import json
import sys
from pathlib import Path


def synchronize(bundle, release):
    if release.get("isDraft") is not False:
        raise ValueError("Release must be published")
    if release.get("tagName") != f'v{bundle["version"]}':
        raise ValueError("Release tag does not match the bundle version")
    body = release.get("body")
    if not isinstance(body, str) or not body.strip():
        raise ValueError("Release notes must not be empty")
    return {**bundle, "description": body.strip()}


def main():
    path = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("patches-bundle.json")
    bundle = json.loads(path.read_text(encoding="utf-8"))
    release = json.load(sys.stdin)
    updated = synchronize(bundle, release)
    path.write_text(json.dumps(updated, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
