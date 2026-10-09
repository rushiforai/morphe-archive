from __future__ import annotations

import io
import struct
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any

# Unity ClassID for GameObject
UNITY_CLASS_ID_GAMEOBJECT = 1


@dataclass
class UnitySerializedFileHeader:
    metadata_size: int
    file_size: int
    version: int
    data_offset: int
    endianness: int


@dataclass
class UnityObjectEntry:
    path_id: int
    offset: int
    size: int
    type_id: int


@dataclass
class GameObjectRecord:
    name: str
    path_id: int
    file_offset: int
    is_active_offset: int
    is_active_value: int
    string_offset: int = 0


class UnitySerializedFile:
    """Parser for Unity Serialized File headers and object tables."""

    def __init__(self, data: bytes) -> None:
        if len(data) < 20:
            raise ValueError(
                f"Serialized file data too small ({len(data)} bytes, minimum 20)"
            )

        self.data = data
        # SerializedFile header is big-endian
        (
            metadata_size,
            file_size,
            version,
            data_offset,
            endianness,
        ) = struct.unpack_from(">IIIIB", data, 0)

        self.header = UnitySerializedFileHeader(
            metadata_size=metadata_size,
            file_size=file_size,
            version=version,
            data_offset=data_offset,
            endianness=endianness,
        )
        self.objects: list[UnityObjectEntry] = []
        self._parse_objects()

    def _parse_objects(self) -> None:
        """Attempts to parse object table entries if version is supported."""
        # Typically in versions 14-22, metadata follows header
        # If metadata is out of bounds or unsupported, skip without crashing
        if self.header.data_offset <= 0 or self.header.data_offset >= len(self.data):
            return


def _scan_for_gameobject_at_name(
    data: bytes, str_idx: int, name_len: int, name: str, path_id: int = 0
) -> GameObjectRecord | None:
    """Inspects candidate string at str_idx to verify GameObject fields and m_IsActive."""
    # 4-byte aligned padding for string bytes
    pad = (4 - (name_len % 4)) % 4
    tag_offset = str_idx + name_len + pad
    is_active_offset = tag_offset + 2  # 2 bytes for m_Tag (uint16)

    if is_active_offset >= len(data):
        return None

    # m_IsActive must be uint8 boolean (0 or 1)
    is_active_val = data[is_active_offset]
    if is_active_val not in (0, 1):
        return None

    # Length prefix is at str_idx - 4
    length_prefix_offset = str_idx - 4
    file_offset = max(0, length_prefix_offset)

    return GameObjectRecord(
        name=name,
        path_id=path_id,
        file_offset=file_offset,
        is_active_offset=is_active_offset,
        is_active_value=is_active_val,
        string_offset=str_idx,
    )


def find_game_objects(
    data: bytes, target_name: str | None = None
) -> list[GameObjectRecord]:
    """Scans binary asset data for GameObject records and computes exact m_IsActive offsets."""
    records: list[GameObjectRecord] = []
    seen_offsets: set[int] = set()

    if target_name:
        # Search specifically for target_name
        target_bytes = target_name.encode("utf-8")
        target_len = len(target_bytes)
        start = 0
        while True:
            idx = data.find(target_bytes, start)
            if idx == -1:
                break

            # Check if 4 bytes before idx is the length prefix
            if idx >= 4:
                prefix_len = struct.unpack_from("<I", data, idx - 4)[0]
                if prefix_len == target_len:
                    rec = _scan_for_gameobject_at_name(
                        data=data,
                        str_idx=idx,
                        name_len=target_len,
                        name=target_name,
                    )
                    if rec and rec.is_active_offset not in seen_offsets:
                        seen_offsets.add(rec.is_active_offset)
                        records.append(rec)

            start = idx + 1
    else:
        # Scan general ASCII/UTF-8 string candidates with valid length prefixes
        # String lengths typically between 2 and 128 characters
        for idx in range(4, len(data) - 8):
            prefix_len = struct.unpack_from("<I", data, idx - 4)[0]
            if 2 <= prefix_len <= 128 and idx + prefix_len + 3 < len(data):
                candidate_bytes = data[idx : idx + prefix_len]
                # Fast check: all printable characters
                if all(32 <= b <= 126 for b in candidate_bytes):
                    try:
                        cand_name = candidate_bytes.decode("utf-8")
                        rec = _scan_for_gameobject_at_name(
                            data=data,
                            str_idx=idx,
                            name_len=prefix_len,
                            name=cand_name,
                        )
                        if rec and rec.is_active_offset not in seen_offsets:
                            seen_offsets.add(rec.is_active_offset)
                            records.append(rec)
                    except UnicodeDecodeError:
                        continue

    return records


def is_unity_asset_path(filename: str) -> bool:
    """Checks if a zip member path is a Unity serialized asset or asset split."""
    if not filename.startswith("assets/bin/Data/"):
        return False
    name_lower = filename.lower()
    return (
        name_lower.endswith((".assets", "globalgamemanagers", "data.unity3d"))
        or ".assets.split" in name_lower
    )


def inspect_unity_assets(
    artifact_path: Path, name_filter: str | None = None
) -> list[dict[str, Any]]:
    """Inspects an artifact (single APK or container) for Unity assets and matching GameObjects."""
    if not artifact_path.is_file():
        raise FileNotFoundError(f"Artifact file not found: {artifact_path}")

    results: list[dict[str, Any]] = []

    with zipfile.ZipFile(artifact_path, "r") as zf:
        namelist = zf.namelist()

        # Check if direct APK
        direct_assets = [m for m in namelist if is_unity_asset_path(m)]
        if direct_assets:
            for member in sorted(direct_assets):
                data = zf.read(member)
                records = find_game_objects(data, target_name=name_filter)
                for rec in records:
                    results.append(
                        {
                            "member": member,
                            "name": rec.name,
                            "path_id": rec.path_id,
                            "file_offset": rec.file_offset,
                            "is_active_offset": rec.is_active_offset,
                            "is_active_offset_hex": f"0x{rec.is_active_offset:x}",
                            "is_active_value": rec.is_active_value,
                        }
                    )
            return results

        # Check for split containers (APKM, APKS, XAPK)
        apk_members = [m for m in namelist if m.endswith(".apk")]
        for apk_member in apk_members:
            inner_bytes = zf.read(apk_member)
            with zipfile.ZipFile(io.BytesIO(inner_bytes), "r") as inner_zf:
                inner_assets = [
                    m for m in inner_zf.namelist() if is_unity_asset_path(m)
                ]
                for member in sorted(inner_assets):
                    data = inner_zf.read(member)
                    records = find_game_objects(data, target_name=name_filter)
                    for rec in records:
                        results.append(
                            {
                                "member": member,
                                "name": rec.name,
                                "path_id": rec.path_id,
                                "file_offset": rec.file_offset,
                                "is_active_offset": rec.is_active_offset,
                                "is_active_offset_hex": f"0x{rec.is_active_offset:x}",
                                "is_active_value": rec.is_active_value,
                            }
                        )

    return results
