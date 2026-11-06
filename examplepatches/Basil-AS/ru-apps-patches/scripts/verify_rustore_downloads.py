#!/usr/bin/env python3
"""Validate RuStore downloader output without executing downloaded files."""

import argparse
import csv
import hashlib
import json
import re
import sys
import zipfile
from pathlib import Path


REQUIRED_COLUMNS = {
    "package",
    "app_name",
    "source_version",
    "version_code",
    "split_set",
    "sha256",
    "acquisition_status",
}
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")
VERSION_CODE_RE = re.compile(r"^[0-9]+$")
PACKAGE_KEYS = ("packageName", "package", "package_name", "applicationPackageName")
VERSION_KEYS = ("versionName", "version_name", "appVersionName")
VERSION_CODE_KEYS = ("versionCode", "version_code", "appVersionCode")


class MatrixError(ValueError):
    """Raised when the matrix or downloader evidence is invalid."""


def load_matrix(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        columns = set(reader.fieldnames or ())
        missing = REQUIRED_COLUMNS - columns
        if missing:
            raise MatrixError("missing required columns: " + ", ".join(sorted(missing)))

        rows = []
        packages = set()
        for line_number, row in enumerate(reader, start=2):
            package = row["package"].strip()
            if not package:
                raise MatrixError(f"line {line_number}: package is empty")
            if package in packages:
                raise MatrixError(f"line {line_number}: duplicate package {package}")
            packages.add(package)
            status = row["acquisition_status"].strip()
            version_code = row["version_code"].strip()
            if version_code and not VERSION_CODE_RE.fullmatch(version_code):
                raise MatrixError(f"line {line_number}: invalid version_code")
            if status == "verified" and not version_code:
                raise MatrixError(f"line {line_number}: verified row has invalid version_code")
            digest = row["sha256"].strip().lower()
            if status == "verified" and not SHA256_RE.fullmatch(digest):
                raise MatrixError(f"line {line_number}: verified row has invalid sha256")
            if status != "verified" and digest and not SHA256_RE.fullmatch(digest):
                raise MatrixError(f"line {line_number}: invalid sha256")
            rows.append({key: value.strip() for key, value in row.items()})
        return rows


def _value(info: dict, keys: tuple[str, ...]) -> str | None:
    for key in keys:
        value = info.get(key)
        if value is not None and str(value).strip():
            return str(value).strip()
    return None


def _artifact_digest(apk_files: list[Path]) -> tuple[str, dict[str, str]]:
    file_hashes = {
        file.name: hashlib.sha256(file.read_bytes()).hexdigest()
        for file in apk_files
    }
    if len(file_hashes) == 1:
        return next(iter(file_hashes.values())), file_hashes
    manifest = "".join(f"{name}\t{file_hashes[name]}\n" for name in sorted(file_hashes))
    return hashlib.sha256(manifest.encode("utf-8")).hexdigest(), file_hashes


def verify_download(row: dict[str, str], downloads_root: Path) -> dict:
    package = row["package"]
    package_dir = downloads_root / package
    info_path = package_dir / "info.json"
    if not info_path.is_file():
        raise MatrixError(f"{package}: missing info.json")
    try:
        info = json.loads(info_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise MatrixError(f"{package}: invalid info.json: {exc}") from exc
    identity = _value(info, PACKAGE_KEYS)
    if identity != package:
        raise MatrixError(f"{package}: package identity mismatch ({identity!r})")
    expected_version = row["source_version"]
    actual_version = _value(info, VERSION_KEYS)
    if not expected_version or not actual_version or expected_version != actual_version:
        raise MatrixError(
            f"{package}: version mismatch ({actual_version!r} != {expected_version!r})"
        )
    expected_version_code = row["version_code"]
    actual_version_code = _value(info, VERSION_CODE_KEYS)
    if (
        not actual_version_code
        or not VERSION_CODE_RE.fullmatch(actual_version_code)
        or expected_version_code != actual_version_code
    ):
        raise MatrixError(
            f"{package}: versionCode mismatch "
            f"({actual_version_code!r} != {expected_version_code!r})"
        )

    apk_files = sorted(package_dir.glob("*.apk"))
    if not apk_files:
        raise MatrixError(f"{package}: no APK files")
    for apk_file in apk_files:
        if not zipfile.is_zipfile(apk_file):
            raise MatrixError(f"{package}: {apk_file.name} is not a valid ZIP/APK")
        try:
            with zipfile.ZipFile(apk_file) as archive:
                broken_member = archive.testzip()
        except (OSError, zipfile.BadZipFile) as exc:
            raise MatrixError(f"{package}: invalid APK archive {apk_file.name}: {exc}") from exc
        if broken_member is not None:
            raise MatrixError(f"{package}: corrupted APK member {apk_file.name}:{broken_member}")
    digest, file_hashes = _artifact_digest(apk_files)
    if row["sha256"] != digest:
        raise MatrixError(f"{package}: sha256 mismatch ({digest} != {row['sha256']})")
    expected_splits = [part for part in row["split_set"].split(",") if part]
    actual_splits = [file.stem for file in apk_files]
    if expected_splits and expected_splits != actual_splits:
        raise MatrixError(
            f"{package}: split set mismatch ({actual_splits!r} != {expected_splits!r})"
        )
    return {
        "package": package,
        "version": actual_version,
        "version_code": int(actual_version_code),
        "sha256": digest,
        "apk_files": [file.name for file in apk_files],
        "file_sha256": file_hashes,
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--matrix", type=Path, default=Path("research/ru_apps_expansion.tsv"))
    parser.add_argument("--downloads", type=Path, default=Path("/tmp/rustore-downloads"))
    parser.add_argument("--strict", action="store_true", help="fail for pending/unavailable rows")
    args = parser.parse_args(argv)

    try:
        rows = load_matrix(args.matrix)
    except (OSError, MatrixError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2

    evidence = []
    failures = 0
    for row in rows:
        status = row["acquisition_status"]
        if status != "verified":
            evidence.append({"package": row["package"], "status": status})
            if args.strict:
                failures += 1
            continue
        try:
            evidence.append({"status": "verified", **verify_download(row, args.downloads)})
        except MatrixError as exc:
            print(f"ERROR: {exc}", file=sys.stderr)
            failures += 1
    print(json.dumps(evidence, ensure_ascii=False, indent=2))
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
