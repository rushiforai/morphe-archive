from __future__ import annotations

import io
import struct
import zipfile

import pytest
from apk_lab.cli import build_parser, handle_unity
from apk_lab.models import ExitCode
from apk_lab.unity import (
    UnitySerializedFile,
    find_game_objects,
    inspect_unity_assets,
)


def build_synthetic_gameobject_bytes(
    name: str = "Button_HelpCenter",
    is_active: int = 1,
    tag: int = 0,
    prefix_padding: int = 32,
) -> tuple[bytes, int]:
    """Constructs a binary buffer containing a synthetic Unity GameObject record.

    Returns (buffer, string_offset).
    """
    buf = bytearray(prefix_padding)
    name_bytes = name.encode("utf-8")
    name_len = len(name_bytes)

    # 4-byte string length prefix
    buf.extend(struct.pack("<I", name_len))
    string_offset = len(buf)

    # String bytes
    buf.extend(name_bytes)

    # 4-byte alignment padding
    pad = (4 - (name_len % 4)) % 4
    buf.extend(b"\x00" * pad)

    # m_Tag (uint16)
    buf.extend(struct.pack("<H", tag))

    # m_IsActive (uint8)
    buf.extend(bytes([is_active]))

    # Trailing padding
    buf.extend(b"\x00" * 16)

    return bytes(buf), string_offset


def test_find_game_objects_exact_offset():
    # Construct synthetic "Button_HelpCenter" record
    # Length of "Button_HelpCenter" is 17 (0x11).
    # 4-byte alignment: 17 + 3 padding = 20 bytes.
    # Tag: 2 bytes.
    # 20 + 2 = 22 = 0x16.
    data, str_offset = build_synthetic_gameobject_bytes(
        name="Button_HelpCenter", is_active=1
    )

    records = find_game_objects(data, target_name="Button_HelpCenter")
    assert len(records) == 1
    rec = records[0]

    assert rec.name == "Button_HelpCenter"
    assert rec.is_active_value == 1
    # Verify exact property offset relative to string_offset: string_offset + 0x16
    assert rec.is_active_offset == str_offset + 0x16
    assert data[rec.is_active_offset] == 1


def test_find_game_objects_name_filtering_and_general_scan():
    data, _str_offset = build_synthetic_gameobject_bytes(
        name="Button_HelpCenter", is_active=1
    )

    # Specific name filter match
    match_rec = find_game_objects(data, target_name="Button_HelpCenter")
    assert len(match_rec) == 1

    # Specific name filter non-match
    no_match = find_game_objects(data, target_name="Button_NonExistent")
    assert len(no_match) == 0

    # General scan without target_name finds the record
    all_recs = find_game_objects(data)
    assert any(r.name == "Button_HelpCenter" for r in all_recs)


def test_unity_serialized_file_header_parsing():
    # Construct valid Unity SerializedFile header (20 bytes, big-endian)
    # metadata_size=100, file_size=1000, version=17, data_offset=128, endianness=0
    header_bytes = struct.pack(">IIIIB", 100, 1000, 17, 128, 0) + b"\x00" * 200
    sf = UnitySerializedFile(header_bytes)

    assert sf.header.metadata_size == 100
    assert sf.header.file_size == 1000
    assert sf.header.version == 17
    assert sf.header.data_offset == 128
    assert sf.header.endianness == 0


def test_inspect_unity_assets_split_scanning(tmp_path):
    data, _ = build_synthetic_gameobject_bytes(name="Button_HelpCenter", is_active=1)

    # Create inner APK with assets/bin/Data/sharedassets0.assets.split71
    inner_apk = io.BytesIO()
    with zipfile.ZipFile(inner_apk, "w") as zf:
        zf.writestr("assets/bin/Data/sharedassets0.assets.split71", data)
        zf.writestr("AndroidManifest.xml", b"<manifest/>")

    # Create container APKS
    container = tmp_path / "game.apks"
    with zipfile.ZipFile(container, "w") as zf:
        zf.writestr("splits/base.apk", inner_apk.getvalue())

    # Inspect Unity assets
    results = inspect_unity_assets(container, name_filter="Button_HelpCenter")
    assert len(results) == 1
    assert results[0]["name"] == "Button_HelpCenter"
    assert results[0]["member"] == "assets/bin/Data/sharedassets0.assets.split71"
    assert results[0]["is_active_value"] == 1


def test_cli_unity_integration(tmp_path, capsys):
    data, _ = build_synthetic_gameobject_bytes(name="Button_HelpCenter", is_active=0)

    apk_file = tmp_path / "game.apk"
    with zipfile.ZipFile(apk_file, "w") as zf:
        zf.writestr("assets/bin/Data/sharedassets0.assets", data)

    parser = build_parser()
    # CLI query without --gameobject raises SystemExit code 2
    with pytest.raises(SystemExit) as exc_info:
        parser.parse_args(["unity", str(apk_file)])
    assert exc_info.value.code == 2

    # CLI query formatted table
    args = parser.parse_args(
        ["unity", str(apk_file), "--gameobject", "Button_HelpCenter"]
    )
    code = handle_unity(args)
    assert code == ExitCode.SUCCESS
    out = capsys.readouterr().out
    assert "Button_HelpCenter" in out
    assert "sharedassets0.assets" in out

    # CLI query JSON
    args = parser.parse_args(
        ["unity", str(apk_file), "--gameobject", "Button_HelpCenter", "--json"]
    )
    code = handle_unity(args)
    assert code == ExitCode.SUCCESS
    out = capsys.readouterr().out
    assert '"name": "Button_HelpCenter"' in out
    assert '"is_active_value": 0' in out
