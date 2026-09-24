#!/usr/bin/env python3
"""Fail fast when Morphe patch-source metadata is not Manager-compatible."""

from __future__ import annotations

import json
from datetime import datetime
import os
import re
import sys
from pathlib import Path

LOCAL_DATETIME_RE = re.compile(
    r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{1,9})?\Z"
)


def fail(message: str) -> "NoReturn":
    raise SystemExit(f"Morphe metadata validation failed: {message}")


def load_json(path: str) -> dict:
    try:
        value = json.loads(Path(path).read_text(encoding="utf-8"))
    except Exception as exc:
        fail(f"{path} is not valid JSON: {exc}")
    if not isinstance(value, dict):
        fail(f"{path} must contain a JSON object")
    return value


def normalize_version(value: object) -> str:
    text = str(value or "").strip()
    return text[1:] if text.startswith("v") else text


def gradle_version() -> str:
    text = Path("gradle.properties").read_text(encoding="utf-8")
    values = re.findall(r"^\s*version\s*=\s*(\S+)\s*$", text, re.MULTILINE)
    if len(values) != 1:
        fail("gradle.properties must contain exactly one version property")
    return normalize_version(values[0])


def validate_text_files() -> None:
    for name in ("gradle.properties", "patches-bundle.json", "patches-list.json", "CHANGELOG.md"):
        text = Path(name).read_text(encoding="utf-8")
        if re.search(r"^(?:<{7}|={7}|>{7})(?:\s|$)", text, re.MULTILINE):
            fail(f"unresolved merge conflict in {name}")


def main() -> None:
    validate_text_files()
    expected = normalize_version(sys.argv[1]) if len(sys.argv) > 1 else ""
    bundle = load_json("patches-bundle.json")
    patch_list = load_json("patches-list.json")

    required = ("created_at", "description", "download_url", "version")
    missing = [key for key in required if key not in bundle]
    if missing:
        fail(f"patches-bundle.json is missing: {', '.join(missing)}")

    timestamp = str(bundle["created_at"])
    if not LOCAL_DATETIME_RE.fullmatch(timestamp):
        fail(
            "created_at must be a timezone-free kotlinx.datetime.LocalDateTime "
            f"(YYYY-MM-DDTHH:MM:SS[.fraction]); got {timestamp!r}"
        )

    try:
        datetime.fromisoformat(timestamp)
    except ValueError:
        fail("created_at is not a valid calendar date")

    version = normalize_version(bundle["version"])
    if not re.fullmatch(r"\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?", version):
        fail("patches-bundle.json version is not a release version")
    if expected and version != expected:
        fail(f"expected version {expected!r}, got {version!r}")

    list_version = normalize_version(patch_list.get("version"))
    gradle = gradle_version()
    if list_version != version or gradle != version:
        fail(
            "version mismatch: "
            f"bundle={version!r}, patches-list={list_version!r}, gradle={gradle!r}"
        )

    patches = patch_list.get("patches")
    if not isinstance(patches, list) or not patches:
        fail("patches-list.json must contain at least one patch")

    names = [patch.get("name") for patch in patches if isinstance(patch, dict)]
    if len(names) != len(patches) or len(set(names)) != len(names) or any(not isinstance(name, str) or not name for name in names):
        fail("patch names must be nonempty and unique")
    if tuple(map(int, version.split("-")[0].split("."))) >= (1, 2, 0):
        if set(names) != {"AI caption translator", "Add Simplified Chinese to auto-translate", "Remember caption selection"}:
            fail("modular release must contain exactly the three declared public patches")

    if not isinstance(bundle["description"], str):
        fail("description must be a string")

    if "`n" in bundle["description"] or "`r" in bundle["description"]:
        fail("description contains unexpanded PowerShell newline escapes")
    changelog = Path("CHANGELOG.md").read_text(encoding="utf-8")
    heading = re.search(r"^## \[([^\]]+)\]", changelog, re.MULTILINE)
    if not heading or heading.group(1) != version:
        fail("CHANGELOG.md latest release does not match bundle version")
    if not bundle["description"].startswith(f"## [{version}]"):
        fail("bundle description does not describe its version")

    signature = bundle.get("signature_download_url")
    if signature is not None and not isinstance(signature, str):
        fail("signature_download_url must be a string, null, or omitted")

    repository = os.environ.get("GITHUB_REPOSITORY", "YYDarlinker/morphe-ai-caption-translator")
    expected_url = (
        f"https://github.com/{repository}/releases/download/"
        f"v{version}/patches-{version}.mpp"
    )
    download_url = str(bundle["download_url"])
    if download_url != expected_url:
        fail(f"download_url must be {expected_url!r}; got {download_url!r}")

    print(f"Morphe metadata OK: {version} @ {timestamp}")


if __name__ == "__main__":
    main()
