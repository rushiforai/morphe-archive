#!/usr/bin/env python3
"""Validate the metadata Morphe downloads before it installs a remote patch bundle."""

import argparse
import json
import re
import sys
from datetime import datetime
from pathlib import Path

TIMESTAMP_FORMAT = "%Y-%m-%dT%H:%M:%S"
TIMESTAMP_PATTERN = re.compile(r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$")


def normalize_timestamp(value: str) -> str:
    """Return the timezone-free, whole-second timestamp Morphe's LocalDateTime expects."""
    without_timezone = value.removesuffix("Z")
    without_fraction = re.sub(r"\.\d+$", "", without_timezone)
    datetime.strptime(without_fraction, TIMESTAMP_FORMAT)
    return without_fraction


def verify_source(path: Path, expected_version: str | None = None, normalize: bool = False) -> None:
    source = json.loads(path.read_text(encoding="utf-8"))

    for field in ("created_at", "description", "download_url", "version"):
        if not isinstance(source.get(field), str) or not source[field]:
            raise ValueError(f"Missing or invalid string field: {field}")

    created_at = source["created_at"]
    if normalize:
        source["created_at"] = created_at = normalize_timestamp(created_at)

    if not TIMESTAMP_PATTERN.fullmatch(created_at):
        raise ValueError(
            "created_at must use YYYY-MM-DDTHH:MM:SS without a timezone suffix; "
            f"got {created_at!r}"
        )
    datetime.strptime(created_at, TIMESTAMP_FORMAT)

    version = source["version"]
    if expected_version is not None and version != expected_version:
        raise ValueError(f"Source version is {version!r}, expected {expected_version!r}")

    expected_suffix = f"/v{version}/patches-{version}.mpp"
    if not source["download_url"].endswith(expected_suffix):
        raise ValueError(f"download_url must end with {expected_suffix}")

    if normalize:
        path.write_text(json.dumps(source, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("version", nargs="?", help="Require this bundle version")
    parser.add_argument(
        "--normalize",
        action="store_true",
        help="Rewrite created_at to Morphe's timezone-free, whole-second format before validating",
    )
    args = parser.parse_args()

    try:
        verify_source(args.source, args.version, args.normalize)
    except (OSError, ValueError, json.JSONDecodeError) as error:
        print(f"Patch source verification failed: {error}", file=sys.stderr)
        raise SystemExit(1) from error

    print(f"Verified Morphe patch source {args.source}")


if __name__ == "__main__":
    main()
