#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-or-later
"""
Regenerate patches-bundle.json for a release.

Morphe Manager reads this file from the source repository's default branch to
find out where the bundle for the current version lives. It is committed as an
empty skeleton and filled in by the release workflow, matching the layout of
the official morphe-patches-template.

Environment:
    TAG                 release tag, e.g. v1.0.0
    ASSET               released asset filename, e.g. patches-1.0.0.mpp
    GITHUB_REPOSITORY   owner/repo, provided by GitHub Actions
    DESCRIPTION         optional; falls back to the value below
"""

from __future__ import annotations

import datetime
import json
import os
import sys

DEFAULT_DESCRIPTION = (
    "Patches for the official Pixel Camera: open captured media in any installed "
    "gallery instead of requiring Google Photos, and keep Add Me working in a "
    "re-signed build."
)


def main() -> int:
    try:
        tag = os.environ["TAG"]
        asset = os.environ["ASSET"]
        repo = os.environ["GITHUB_REPOSITORY"]
    except KeyError as missing:
        print(f"missing required environment variable: {missing}", file=sys.stderr)
        return 1

    data = {
        # Matches the format upstream morphe-patches publishes: no trailing Z.
        "created_at": datetime.datetime.now(datetime.timezone.utc)
        .strftime("%Y-%m-%dT%H:%M:%S"),
        "description": os.environ.get("DESCRIPTION") or DEFAULT_DESCRIPTION,
        "download_url": f"https://github.com/{repo}/releases/download/{tag}/{asset}",
        # This project does not sign its releases; Morphe treats the signature
        # as optional. Set this if you start publishing a .asc alongside.
        "signature_download_url": "",
        "version": tag[1:] if tag.startswith("v") else tag,
    }

    with open("patches-bundle.json", "w", encoding="utf-8", newline="\n") as fh:
        json.dump(data, fh, indent=2)
        fh.write("\n")

    print(json.dumps(data, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
