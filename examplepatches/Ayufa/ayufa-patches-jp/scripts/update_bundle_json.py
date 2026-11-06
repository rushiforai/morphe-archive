#!/usr/bin/env python3
"""Update patches-bundle.json after a release (sibling-repo format)."""

import argparse
import json
from datetime import datetime, timezone
from pathlib import Path

REPO = "Ayufa/ayufa-patches-jp"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", required=True)
    parser.add_argument("--notes", required=True, help="Release notes file")
    parser.add_argument(
        "--path", default="patches-bundle.json", help="Output path"
    )
    args = parser.parse_args()

    version = args.version.lstrip("v")
    data = {
        "created_at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S"),
        "description": Path(args.notes).read_text(encoding="utf-8"),
        "download_url": (
            f"https://github.com/{REPO}/releases/download/"
            f"v{version}/patches-{version}.mpp"
        ),
        "signature_download_url": "",
        "version": version,
    }
    Path(args.path).write_text(
        json.dumps(data, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    print(f"patches-bundle.json updated for v{version}")


if __name__ == "__main__":
    main()
