from __future__ import annotations

import os
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import BinaryIO

from apk_lab.models import ContainerType, MemberInfo


class ArchiveSecurityError(Exception):
    """Raised when an archive violates safety limits or structure invariants."""


DEFAULT_MAX_ENTRIES = 100_000
DEFAULT_MAX_EXPANDED_BYTES = 4 * 1024 * 1024 * 1024  # 4 GiB
DEFAULT_MAX_RATIO = 100.0  # 100:1 max compression ratio


def is_contained_path(
    candidate: Path | str, parent: Path | str, allow_equal: bool = True
) -> bool:
    """Verifies that candidate is contained within parent using path components."""
    try:
        cand_path = Path(candidate).resolve()
        parent_path = Path(parent).resolve()
        if not allow_equal and cand_path == parent_path:
            return False
        return cand_path.is_relative_to(parent_path)
    except (ValueError, RuntimeError):
        return False


@dataclass
class SafeArchiveReport:
    container_type: ContainerType
    entry_count: int
    total_uncompressed_bytes: int
    total_compressed_bytes: int
    members: list[MemberInfo]
    apk_members: list[str]


def inspect_safe_zip(
    file_or_path: str | Path | BinaryIO,
    max_entries: int = DEFAULT_MAX_ENTRIES,
    max_expanded_bytes: int = DEFAULT_MAX_EXPANDED_BYTES,
    max_ratio: float = DEFAULT_MAX_RATIO,
) -> SafeArchiveReport:
    """Inspects a zip archive enforcing safety constraints without full extraction."""
    try:
        zf = zipfile.ZipFile(file_or_path, "r")
    except zipfile.BadZipFile as e:
        raise ArchiveSecurityError(f"Corrupt or invalid zip archive: {e}") from e

    try:
        infolist = zf.infolist()
        if len(infolist) > max_entries:
            raise ArchiveSecurityError(
                f"Archive contains {len(infolist)} entries, exceeding limit of {max_entries}"
            )

        seen_names: set[str] = set()
        total_uncompressed = 0
        total_compressed = 0
        members: list[MemberInfo] = []
        apk_members: list[str] = []
        has_android_manifest = False
        has_toc_pb = False
        has_xapk_manifest = False
        has_info_json = False

        for info in infolist:
            name = info.filename

            # 1. Reject duplicate names
            if name in seen_names:
                raise ArchiveSecurityError(f"Duplicate entry in archive: {name}")
            seen_names.add(name)

            # 2. Reject absolute paths and directory traversal
            if name.startswith(("/", "\\")):
                raise ArchiveSecurityError(f"Absolute path in archive entry: {name}")
            normalized = os.path.normpath(name)
            if normalized == ".." or normalized.startswith(("../", "..\\")):
                raise ArchiveSecurityError(
                    f"Path traversal detected in archive entry: {name}"
                )

            # 3. Reject encrypted members
            if info.is_dir():
                continue

            if info.flag_bits & 0x1:
                raise ArchiveSecurityError(f"Encrypted entry detected: {name}")

            # 4. Check for symlinks (POSIX external_attr high bits)
            mode = info.external_attr >> 16
            if mode & 0o120000 == 0o120000:
                raise ArchiveSecurityError(f"Symlink entry detected in archive: {name}")

            # 5. Check size and compression ratio
            total_uncompressed += info.file_size
            total_compressed += info.compress_size

            if total_uncompressed > max_expanded_bytes:
                raise ArchiveSecurityError(
                    f"Uncompressed size exceeds limit of {max_expanded_bytes} bytes"
                )

            if info.compress_size > 0:
                ratio = info.file_size / info.compress_size
                if ratio > max_ratio and info.file_size > 1024 * 1024:
                    raise ArchiveSecurityError(
                        f"Zip bomb detected: entry {name} has compression ratio {ratio:.1f}:1"
                    )

            if name == "AndroidManifest.xml":
                has_android_manifest = True
            elif name == "toc.pb":
                has_toc_pb = True
            elif name == "manifest.json":
                has_xapk_manifest = True
            elif name == "info.json":
                has_info_json = True
            elif name.endswith(".apk"):
                apk_members.append(name)

            members.append(
                MemberInfo(
                    name=name,
                    size=info.file_size,
                    compressed_size=info.compress_size,
                    crc=info.CRC,
                    sha256="",  # calculated when needed
                )
            )

        # Detect container type
        if has_toc_pb:
            container_type = ContainerType.APKS
        elif has_xapk_manifest:
            container_type = ContainerType.XAPK
        elif has_android_manifest:
            container_type = ContainerType.APK
        elif has_info_json or apk_members:
            container_type = ContainerType.APKM
        else:
            container_type = ContainerType.UNKNOWN
        return SafeArchiveReport(
            container_type=container_type,
            entry_count=len(infolist),
            total_uncompressed_bytes=total_uncompressed,
            total_compressed_bytes=total_compressed,
            members=members,
            apk_members=sorted(apk_members),
        )
    finally:
        zf.close()


def safe_extract_all(
    archive_path: Path | str,
    dest_dir: Path | str,
    max_entries: int = DEFAULT_MAX_ENTRIES,
    max_expanded_bytes: int = DEFAULT_MAX_EXPANDED_BYTES,
) -> list[Path]:
    """Safely extracts all entries from a zip archive into dest_dir."""
    dest_dir = Path(dest_dir).resolve()
    dest_dir.mkdir(parents=True, exist_ok=True)

    # First validate the archive safely
    inspect_safe_zip(
        archive_path, max_entries=max_entries, max_expanded_bytes=max_expanded_bytes
    )

    extracted_files: list[Path] = []
    with zipfile.ZipFile(archive_path, "r") as zf:
        for info in zf.infolist():
            # Resolve target path
            target_path = (dest_dir / info.filename).resolve()
            if not is_contained_path(target_path, dest_dir):
                raise ArchiveSecurityError(
                    f"Extraction path {target_path} escapes target directory {dest_dir}"
                )

            if info.is_dir():
                target_path.mkdir(parents=True, exist_ok=True)
            else:
                target_path.parent.mkdir(parents=True, exist_ok=True)
                with zf.open(info) as src, open(target_path, "wb") as dst:
                    while chunk := src.read(64 * 1024):
                        dst.write(chunk)
                extracted_files.append(target_path)

    return extracted_files


def safe_extract_member(
    archive_path: Path | str,
    member_name: str,
    dest_path: Path | str,
) -> Path:
    """Safely extracts a single member to dest_path."""
    dest_path = Path(dest_path).resolve()
    dest_path.parent.mkdir(parents=True, exist_ok=True)

    with zipfile.ZipFile(archive_path, "r") as zf:
        try:
            info = zf.getinfo(member_name)
        except KeyError:
            raise FileNotFoundError(f"Member {member_name} not found in {archive_path}")

        # Check safety of this entry
        if member_name.startswith("/") or ".." in member_name:
            raise ArchiveSecurityError(f"Unsafe member name: {member_name}")

        with zf.open(info) as src, open(dest_path, "wb") as dst:
            while chunk := src.read(64 * 1024):
                dst.write(chunk)

    return dest_path


def read_member_bytes(archive_path: Path | str, member_name: str) -> bytes:
    """Reads a single member's bytes into memory."""
    with zipfile.ZipFile(archive_path, "r") as zf:
        return zf.read(member_name)
