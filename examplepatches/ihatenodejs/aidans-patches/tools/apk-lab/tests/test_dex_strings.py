from __future__ import annotations

import struct
import zipfile
from pathlib import Path

import pytest
from apk_lab.cli import build_parser, handle_strings
from apk_lab.device import parse_launcher_activity
from apk_lab.dex_strings import (
    extract_strings_from_dex_bytes,
    read_uleb128,
    search_artifact_strings,
)
from apk_lab.models import AndroidManifestInfo, ExitCode


@pytest.fixture(autouse=True)
def mock_apk_inspection(monkeypatch: pytest.MonkeyPatch):
    monkeypatch.setattr(
        "apk_lab.inspection.parse_apk_badging",
        lambda _p: AndroidManifestInfo(
            package_name="com.test.mock",
            version_code=1,
            version_name="1.0",
            min_sdk_version=21,
            target_sdk_version=34,
            split_name=None,
        ),
    )
    monkeypatch.setattr(
        "apk_lab.inspection.extract_signing_cert_sha256",
        lambda _p: None,
    )


def encode_uleb128(val: int) -> bytes:
    """Helper to encode an integer as unsigned LEB128."""
    out = bytearray()
    while True:
        byte = val & 0x7F
        val >>= 7
        if val != 0:
            out.append(byte | 0x80)
        else:
            out.append(byte)
            break
    return bytes(out)


def build_mock_dex(strings: list[str]) -> bytes:
    """Builds a minimal synthetic DEX binary containing the given string table."""
    header_size = 0x70
    string_ids_off = header_size
    string_ids_size = len(strings)

    # string_ids table: 4 bytes per string offset
    data_off = string_ids_off + string_ids_size * 4

    string_data = bytearray()
    offsets = []
    for s in strings:
        offsets.append(data_off + len(string_data))
        encoded = s.encode("utf-8")
        string_data.extend(encode_uleb128(len(s)))
        string_data.extend(encoded)
        string_data.append(0)  # null terminator

    # Build header
    header = bytearray(header_size)
    header[0:4] = b"dex\n"
    header[4:8] = b"035\x00"
    struct.pack_into("<I", header, 0x38, string_ids_size)
    struct.pack_into("<I", header, 0x3C, string_ids_off)

    id_table = bytearray()
    for off in offsets:
        id_table.extend(struct.pack("<I", off))

    return bytes(header + id_table + string_data)


def test_read_uleb128_single_byte():
    data = bytes([0x00, 0x01, 0x7F])
    val, read_len = read_uleb128(data, 0)
    assert val == 0
    assert read_len == 1

    val, read_len = read_uleb128(data, 1)
    assert val == 1
    assert read_len == 1

    val, read_len = read_uleb128(data, 2)
    assert val == 127
    assert read_len == 1


def test_read_uleb128_multi_byte():
    # 128 = 0x80 | 0x00, then 0x01
    data = bytes([0xFF, 0x80, 0x01, 0x00])
    val, read_len = read_uleb128(data, 1)
    assert val == 128
    assert read_len == 2

    # 16256 = 0x80 0x7F
    data2 = bytes([0x80, 0x7F])
    val, read_len = read_uleb128(data2, 0)
    assert val == (0 | (0x7F << 7))
    assert read_len == 2


def test_extract_strings_from_dex_bytes():
    test_strings = ["Hello", "World", "Android_Test_123", ""]
    dex_bytes = build_mock_dex(test_strings)

    extracted = list(extract_strings_from_dex_bytes(dex_bytes))
    assert extracted == test_strings


def test_extract_strings_from_invalid_dex():
    # Too short
    assert list(extract_strings_from_dex_bytes(b"dex\nshort")) == []

    # Bad magic
    assert list(extract_strings_from_dex_bytes(b"bad\n" + b"\x00" * 0x80)) == []


def test_search_artifact_strings(tmp_path: Path):
    apk_path = tmp_path / "mock.apk"
    dex1 = build_mock_dex(["FooBar", "SecretKey", "adobe_connect"])
    dex2 = build_mock_dex(["Classes2String", "SECRET_TOKEN", "AdobeScan"])

    with zipfile.ZipFile(apk_path, "w") as zf:
        zf.writestr("AndroidManifest.xml", b"<manifest/>")
        zf.writestr("classes.dex", dex1)
        zf.writestr("classes2.dex", dex2)
    # 1. Search all without query
    all_matches = search_artifact_strings(apk_path)
    assert len(all_matches) == 6

    # 2. Query filtering case-insensitive (default)
    matches_ci = search_artifact_strings(apk_path, query="secret")
    assert len(matches_ci) == 2
    assert {m.string for m in matches_ci} == {"SecretKey", "SECRET_TOKEN"}

    # 3. Query filtering case-sensitive
    matches_cs = search_artifact_strings(apk_path, query="secret", ignore_case=False)
    assert len(matches_cs) == 0

    matches_cs2 = search_artifact_strings(apk_path, query="Secret", ignore_case=False)
    assert len(matches_cs2) == 1
    assert matches_cs2[0].string == "SecretKey"

    # 4. Filter by dex name
    matches_dex = search_artifact_strings(apk_path, dex_filter="classes2.dex")
    assert len(matches_dex) == 3
    assert all(m.dex_name == "classes2.dex" for m in matches_dex)


def test_cli_strings_subcommand(tmp_path: Path, capsys: pytest.CaptureFixture[str]):
    apk_path = tmp_path / "app.apk"
    dex = build_mock_dex(["AlphaKey", "BetaToken", "GammaID"])
    with zipfile.ZipFile(apk_path, "w") as zf:
        zf.writestr("AndroidManifest.xml", b"<manifest/>")
        zf.writestr("classes.dex", dex)
    parser = build_parser()

    # Plain text output
    args = parser.parse_args(["strings", str(apk_path), "-q", "Alpha"])
    rc = handle_strings(args)
    assert rc == ExitCode.SUCCESS
    captured = capsys.readouterr()
    assert "[base:classes.dex] AlphaKey" in captured.out

    # JSON stdout output
    args_json = parser.parse_args(
        ["strings", str(apk_path), "-q", "Token", "--json", "-"]
    )
    rc_json = handle_strings(args_json)
    assert rc_json == ExitCode.SUCCESS
    captured_json = capsys.readouterr()
    assert '"string": "BetaToken"' in captured_json.out
    assert '"dex": "classes.dex"' in captured_json.out

    # JSON file output
    json_out_file = tmp_path / "out.json"
    args_json_file = parser.parse_args(
        ["strings", str(apk_path), "--json", str(json_out_file)]
    )
    rc_file = handle_strings(args_json_file)
    assert rc_file == ExitCode.SUCCESS
    assert json_out_file.exists()
    assert "GammaID" in json_out_file.read_text(encoding="utf-8")

    # Case sensitive CLI test
    args_cs = parser.parse_args(
        ["strings", str(apk_path), "-q", "beta", "--case-sensitive"]
    )
    rc_cs = handle_strings(args_cs)
    assert rc_cs == ExitCode.SUCCESS
    captured_cs = capsys.readouterr()
    assert captured_cs.out == ""

    # Default case insensitive CLI test
    args_ci = parser.parse_args(["strings", str(apk_path), "-q", "beta"])
    rc_ci = handle_strings(args_ci)
    assert rc_ci == ExitCode.SUCCESS
    captured_ci = capsys.readouterr()
    assert "[base:classes.dex] BetaToken" in captured_ci.out


def test_read_uleb128_truncated():
    with pytest.raises(IndexError, match="Truncated ULEB128 sequence"):
        read_uleb128(b"\x80", 0)
    with pytest.raises(IndexError, match="Truncated ULEB128 sequence"):
        read_uleb128(b"", 0)


def test_extract_strings_from_dex_bytes_truncated():
    valid_dex = build_mock_dex(["Alpha", "Beta"])
    # Truncated string IDs table
    truncated_dex_table = valid_dex[:0x74]
    assert list(extract_strings_from_dex_bytes(truncated_dex_table)) == []

    # String table entry offset pointing out of bounds
    bad_offset_dex = bytearray(valid_dex[:0x70]) + struct.pack("<I", 0xFFFF)
    assert list(extract_strings_from_dex_bytes(bad_offset_dex)) == []

    # String table entry pointing to truncated ULEB128
    truncated_uleb_dex = bytearray(valid_dex[:0x70]) + struct.pack("<I", 0x74) + b"\x80"
    assert list(extract_strings_from_dex_bytes(truncated_uleb_dex)) == []


def test_parse_launcher_activity_no_launchable():
    badging_none = (
        "package: name='com.nhl.gc1112.free' versionCode='1' versionName='1.0'\n"
    )
    with pytest.raises(
        ValueError, match="No launchable activity found in APK badging output"
    ):
        parse_launcher_activity(badging_none, "com.nhl.gc1112.free")
