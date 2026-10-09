from __future__ import annotations

import io
import struct
import zipfile

import pytest
from apk_lab.cli import build_parser, handle_il2cpp
from apk_lab.il2cpp import (
    IL2CPP_METADATA_MAGIC,
    Il2CppMetadata,
    Il2CppSymbolMap,
    analyze_il2cpp,
    extract_il2cpp_metadata_from_artifact,
)
from apk_lab.models import ExitCode


def build_synthetic_metadata(
    version: int = 29,
    *,
    corrupt_methods_size: int | None = None,
    corrupt_types_size: int | None = None,
) -> bytes:
    """Builds a minimal valid synthetic global-metadata.dat buffer."""
    string_data = (
        b"\x00TestNamespace\x00BlackjackApplication\x00OpenShop\x00OtherMethod\x00"
    )
    string_offset = 256
    string_size = len(string_data)

    if version == 29:
        # Method definitions table (32 bytes per method)
        # struct format: "<iiiiiIHHHH"
        # name_idx, decl_type, return_type, param_start, gen_container, token, flags, iflags, slot, param_count
        method0 = struct.pack("<iiiiiIHHHH", 36, 0, 0, 0, -1, 0, 0, 0, 0, 1)
        method1 = struct.pack("<iiiiiIHHHH", 45, 0, 0, 0, -1, 0, 0, 0, 0, 0)
        methods_data = method0 + method1
    elif version == 31:
        # Method definitions table (36 bytes per method)
        # struct format: "<iiiiiiIHHHH"
        # name_idx, decl_type, return_type, returnParameterToken, param_start, gen_container, token, flags, iflags, slot, param_count
        # Nonzero sentinel 0x12345678 at offset 12 proves param_start comes from offset 16 (0) and param_count from 34 (1)
        method0 = struct.pack(
            "<iiiiiiIHHHH", 36, 0, 0, 0x12345678, 0, -1, 0, 0, 0, 0, 1
        )
        method1 = struct.pack(
            "<iiiiiiIHHHH", 45, 0, 0, 0x12345678, 0, -1, 0, 0, 0, 0, 0
        )
        methods_data = method0 + method1
    else:
        # Dummy method data for unsupported version testing
        methods_data = b"\x00" * 64

    methods_offset = string_offset + string_size + 4
    methods_size = (
        corrupt_methods_size if corrupt_methods_size is not None else len(methods_data)
    )

    # Type definitions table (88 bytes per type)
    # Type 0: "BlackjackApplication", namespace="TestNamespace", methodStart=0, methodCount=2
    types_offset = methods_offset + len(methods_data) + 4
    type0_buf = bytearray(88)
    struct.pack_into("<i", type0_buf, 0, 15)  # nameIndex: "BlackjackApplication"
    struct.pack_into("<i", type0_buf, 4, 1)  # namespaceIndex: "TestNamespace"
    struct.pack_into("<i", type0_buf, 36, 0)  # methodStart = 0
    struct.pack_into("<H", type0_buf, 64, 2)  # methodCount = 2
    types_data = bytes(type0_buf)
    types_size = (
        corrupt_types_size if corrupt_types_size is not None else len(types_data)
    )

    total_len = types_offset + len(types_data) + 16
    buf = bytearray(total_len)

    # Header
    struct.pack_into("<I", buf, 0, IL2CPP_METADATA_MAGIC)
    struct.pack_into("<I", buf, 4, version)
    struct.pack_into("<I", buf, 24, string_offset)
    struct.pack_into("<I", buf, 28, string_size)
    struct.pack_into("<I", buf, 48, methods_offset)
    struct.pack_into("<I", buf, 52, methods_size)
    struct.pack_into("<I", buf, 160, types_offset)
    struct.pack_into("<I", buf, 164, types_size)

    # Copy section data
    buf[string_offset : string_offset + string_size] = string_data
    buf[methods_offset : methods_offset + len(methods_data)] = methods_data
    buf[types_offset : types_offset + len(types_data)] = types_data

    return bytes(buf)


def test_il2cpp_metadata_parsing_v29():
    raw = build_synthetic_metadata(29)
    meta = Il2CppMetadata(raw)

    assert meta.sanity == IL2CPP_METADATA_MAGIC
    assert meta.version == 29
    assert meta.get_string_from_index(1) == "TestNamespace"
    assert meta.get_string_from_index(15) == "BlackjackApplication"
    assert meta.get_string_from_index(36) == "OpenShop"

    assert len(meta.method_definitions) == 2
    assert meta.method_definitions[0].name == "OpenShop"
    assert meta.method_definitions[0].parameter_start_index == 0
    assert meta.method_definitions[0].parameter_count == 1
    assert meta.method_definitions[1].name == "OtherMethod"

    assert len(meta.type_definitions) == 1
    assert meta.type_definitions[0].name == "BlackjackApplication"
    assert meta.type_definitions[0].namespace == "TestNamespace"
    assert meta.type_definitions[0].method_start_index == 0
    assert meta.type_definitions[0].method_count == 2

    # Symbol map join finds BlackjackApplication.OpenShop
    smap = Il2CppSymbolMap(meta)
    matches = smap.search("OpenShop")
    assert len(matches) == 1
    assert matches[0].namespace == "TestNamespace"
    assert matches[0].type_name == "BlackjackApplication"
    assert matches[0].method_name == "OpenShop"
    assert matches[0].parameter_count == 1


def test_il2cpp_metadata_parsing_v31():
    raw = build_synthetic_metadata(31)
    meta = Il2CppMetadata(raw)

    assert meta.sanity == IL2CPP_METADATA_MAGIC
    assert meta.version == 31
    assert meta.get_string_from_index(1) == "TestNamespace"
    assert meta.get_string_from_index(15) == "BlackjackApplication"
    assert meta.get_string_from_index(36) == "OpenShop"

    assert len(meta.method_definitions) == 2
    assert meta.method_definitions[0].name == "OpenShop"
    # Parameter start comes from offset 16 (0), not offset 12 sentinel (0x12345678)
    assert meta.method_definitions[0].parameter_start_index == 0
    # Parameter count comes from offset 34 (1), not offset 30 (0)
    assert meta.method_definitions[0].parameter_count == 1
    assert meta.method_definitions[1].name == "OtherMethod"

    assert len(meta.type_definitions) == 1
    assert meta.type_definitions[0].name == "BlackjackApplication"
    assert meta.type_definitions[0].namespace == "TestNamespace"
    assert meta.type_definitions[0].method_start_index == 0
    assert meta.type_definitions[0].method_count == 2

    # Symbol map join finds BlackjackApplication.OpenShop
    smap = Il2CppSymbolMap(meta)
    matches = smap.search("OpenShop")
    assert len(matches) == 1
    assert matches[0].namespace == "TestNamespace"
    assert matches[0].type_name == "BlackjackApplication"
    assert matches[0].method_name == "OpenShop"
    assert matches[0].parameter_count == 1


def test_il2cpp_unsupported_version_or_subversion():
    raw_v28 = build_synthetic_metadata(28)
    with pytest.raises(ValueError, match="Unsupported IL2CPP metadata layout: 28.0"):
        Il2CppMetadata(raw_v28)

    raw_v29 = build_synthetic_metadata(29)
    with pytest.raises(ValueError, match="Unsupported IL2CPP metadata layout: 29.1"):
        Il2CppMetadata(raw_v29, metadata_subversion=1)


def test_il2cpp_table_size_not_whole_record():
    raw_bad_methods = build_synthetic_metadata(29, corrupt_methods_size=33)
    with pytest.raises(
        ValueError, match="Methods table size .* not a multiple of record size"
    ):
        Il2CppMetadata(raw_bad_methods)

    raw_bad_types = build_synthetic_metadata(29, corrupt_types_size=89)
    with pytest.raises(
        ValueError, match="Type definitions table size .* not a multiple of record size"
    ):
        Il2CppMetadata(raw_bad_types)


def test_il2cpp_symbol_map_query():
    raw = build_synthetic_metadata()
    meta = Il2CppMetadata(raw)
    smap = Il2CppSymbolMap(meta)

    # All symbols
    all_matches = smap.search()
    assert len(all_matches) == 2

    # Query matching method substring
    query_shop = smap.search("OpenShop")
    assert len(query_shop) == 1
    assert query_shop[0].method_name == "OpenShop"
    assert query_shop[0].type_name == "BlackjackApplication"

    # Query matching type name
    query_type = smap.search("Blackjack")
    assert len(query_type) == 2

    # Query with no matches
    query_none = smap.search("NonExistentMethod")
    assert len(query_none) == 0

    # Regex query
    query_regex = smap.search(r"^Open.*")
    assert len(query_regex) == 1
    assert query_regex[0].method_name == "OpenShop"


def test_il2cpp_invalid_magic_rejected():
    raw = bytearray(build_synthetic_metadata())
    struct.pack_into("<I", raw, 0, 0x12345678)
    with pytest.raises(ValueError, match="Invalid metadata file magic"):
        Il2CppMetadata(bytes(raw))

    # Too small buffer
    with pytest.raises(ValueError, match="too small"):
        Il2CppMetadata(b"short")


def test_extract_il2cpp_metadata_from_split_artifact(tmp_path):
    raw_meta = build_synthetic_metadata()

    # Create base APK with metadata
    base_apk = io.BytesIO()
    with zipfile.ZipFile(base_apk, "w") as zf:
        zf.writestr("assets/bin/Data/Managed/Metadata/global-metadata.dat", raw_meta)
        zf.writestr("AndroidManifest.xml", b"<manifest/>")

    # Create split APK with native library
    split_apk = io.BytesIO()
    with zipfile.ZipFile(split_apk, "w") as zf:
        zf.writestr("lib/arm64-v8a/libil2cpp.so", b"il2cpp_arm64_bytes")

    # Create outer APKS container
    container_file = tmp_path / "game.apks"
    with zipfile.ZipFile(container_file, "w") as zf:
        zf.writestr("splits/base.apk", base_apk.getvalue())
        zf.writestr("splits/split.arm64_v8a.apk", split_apk.getvalue())

    meta_bytes, native_libs = extract_il2cpp_metadata_from_artifact(container_file)
    assert meta_bytes == raw_meta
    assert "lib/arm64-v8a/libil2cpp.so" in native_libs
    assert native_libs["lib/arm64-v8a/libil2cpp.so"] == b"il2cpp_arm64_bytes"

    # analyze_il2cpp integration
    records = analyze_il2cpp(container_file, query="OpenShop")
    assert len(records) == 1
    assert records[0]["type"] == "BlackjackApplication"
    assert records[0]["method"] == "OpenShop"

    # Artifact without metadata raises FileNotFoundError
    empty_apk = tmp_path / "empty.apk"
    with zipfile.ZipFile(empty_apk, "w") as zf:
        zf.writestr("AndroidManifest.xml", b"<manifest/>")

    with pytest.raises(FileNotFoundError, match="global-metadata.dat not found"):
        extract_il2cpp_metadata_from_artifact(empty_apk)


def test_cli_il2cpp_integration(tmp_path, capsys):
    raw_meta = build_synthetic_metadata()
    apk_file = tmp_path / "game.apk"
    with zipfile.ZipFile(apk_file, "w") as zf:
        zf.writestr("assets/bin/Data/Managed/Metadata/global-metadata.dat", raw_meta)

    parser = build_parser()

    # CLI query with formatted table
    args = parser.parse_args(["il2cpp", str(apk_file), "--query", "OpenShop"])
    code = handle_il2cpp(args)
    assert code == ExitCode.SUCCESS
    out = capsys.readouterr().out
    assert "OpenShop" in out
    assert "BlackjackApplication" in out

    # CLI query with JSON stdout
    args = parser.parse_args(["il2cpp", str(apk_file), "--query", "OpenShop", "--json"])
    code = handle_il2cpp(args)
    assert code == ExitCode.SUCCESS
    out = capsys.readouterr().out
    assert '"method": "OpenShop"' in out

    # CLI on artifact with missing metadata returns USAGE_OR_TOOL_ERROR
    empty_apk = tmp_path / "empty.apk"
    with zipfile.ZipFile(empty_apk, "w") as zf:
        zf.writestr("AndroidManifest.xml", b"<manifest/>")

    args = parser.parse_args(["il2cpp", str(empty_apk)])
    code = handle_il2cpp(args)
    assert code == ExitCode.USAGE_OR_TOOL_ERROR
