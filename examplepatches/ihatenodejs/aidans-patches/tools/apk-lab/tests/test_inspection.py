import struct

from apk_lab.inspection import (
    parse_dex_header,
)


def test_parse_dex_header():
    # Construct minimal synthetic DEX header
    # 0x00..0x08: magic
    # 0x58..0x5C: method_ids_size (uint32)
    # 0x60..0x64: class_defs_size (uint32)
    data = bytearray(0x80)
    data[0:8] = b"dex\n035\x00"
    struct.pack_into("<I", data, 0x58, 42)  # 42 methods
    struct.pack_into("<I", data, 0x60, 15)  # 15 classes

    class_cnt, method_cnt = parse_dex_header(bytes(data))
    assert class_cnt == 15
    assert method_cnt == 42


def test_parse_dex_header_invalid_magic():
    data = bytearray(0x80)
    data[0:8] = b"not_dex!"
    class_cnt, method_cnt = parse_dex_header(bytes(data))
    assert class_cnt == 0
    assert method_cnt == 0


import io
import zipfile

import pytest
from apk_lab.inspection import (
    InspectionError,
    inspect_artifact,
    parse_badging_text,
)
from apk_lab.models import AndroidManifestInfo


def test_parse_badging_text_base_and_split():
    base_out = (
        "package: name='com.example.app' versionCode='100' versionName='1.0.0' compileSdkVersion='34'\n"
        "sdkVersion:'21'\n"
        "targetSdkVersion:'34'\n"
        "uses-permission: name='android.permission.INTERNET'\n"
    )
    info = parse_badging_text(base_out)
    assert info.package_name == "com.example.app"
    assert info.version_code == 100
    assert info.version_name == "1.0.0"
    assert info.split_name is None
    assert info.target_sdk_version == 34
    assert info.permissions == ["android.permission.INTERNET"]

    split_out = (
        "package: name='com.example.app' versionCode='100' versionName='1.0.0' split='config.arm64_v8a'\n"
        "targetSdkVersion:'34'\n"
    )
    split_info = parse_badging_text(split_out)
    assert split_info.package_name == "com.example.app"
    assert split_info.version_code == 100
    assert split_info.split_name == "config.arm64_v8a"


def test_parse_badging_text_missing_package_rejected():
    with pytest.raises(InspectionError, match="Could not parse package name"):
        parse_badging_text("invalid badging output without package line")


def create_minimal_apk_bytes() -> bytes:
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w") as zf:
        zf.writestr("AndroidManifest.xml", b"manifest")
    return buf.getvalue()


def test_split_inspection_selects_base_by_manifest(tmp_path, monkeypatch):
    apk_bytes = create_minimal_apk_bytes()
    # Create synthetic split container
    container_path = tmp_path / "app.apks"
    with zipfile.ZipFile(container_path, "w") as zf:
        zf.writestr("splits/config.arm64.apk", apk_bytes)
        zf.writestr("splits/base-master.apk", apk_bytes)

    def mock_inspect_single_apk_zip(zf, apk_file):
        filename = apk_file.name
        if filename == "base-master.apk":
            manifest = AndroidManifestInfo(
                package_name="com.example.app",
                version_code=100,
                version_name="1.0.0",
                min_sdk_version=21,
                target_sdk_version=34,
                split_name=None,  # Real base!
            )
        else:
            manifest = AndroidManifestInfo(
                package_name="com.example.app",
                version_code=100,
                version_name="1.0.0",
                split_name="config.arm64",  # Split!
            )
        return (
            manifest,
            "abcdef" * 10 + "1234",
            10,
            20,
            ["classes.dex"],
            [],
            [],
            [],
            [],
        )

    monkeypatch.setattr(
        "apk_lab.inspection.inspect_single_apk_zip", mock_inspect_single_apk_zip
    )

    insp = inspect_artifact(container_path)
    assert insp.package_name == "com.example.app"
    assert insp.version_code == 100
    assert insp.min_sdk == 21
    assert insp.target_sdk == 34

    # Exactly one split has is_base = True, which is base-master.apk
    bases = [s for s in insp.splits if s.is_base]
    assert len(bases) == 1
    assert bases[0].filename == "splits/base-master.apk"
    assert bases[0].split_name == "base-master"

    arm64 = next(s for s in insp.splits if s.filename == "splits/config.arm64.apk")
    assert arm64.is_base is False
    assert arm64.split_name == "config.arm64"


def test_split_inspection_zero_base_rejected(tmp_path, monkeypatch):
    apk_bytes = create_minimal_apk_bytes()
    container_path = tmp_path / "nobase.apkm"
    with zipfile.ZipFile(container_path, "w") as zf:
        zf.writestr("split1.apk", apk_bytes)
        zf.writestr("split2.apk", apk_bytes)

    def mock_inspect(zf, apk_file):
        manifest = AndroidManifestInfo(
            package_name="com.example.app",
            version_code=100,
            version_name="1.0.0",
            split_name=apk_file.stem,
        )
        return (manifest, "abcdef" * 10 + "1234", 1, 1, [], [], [], [], [])

    monkeypatch.setattr("apk_lab.inspection.inspect_single_apk_zip", mock_inspect)

    with pytest.raises(InspectionError, match="No base APK found"):
        inspect_artifact(container_path)


def test_split_inspection_multiple_bases_rejected(tmp_path, monkeypatch):
    apk_bytes = create_minimal_apk_bytes()
    container_path = tmp_path / "multibase.apkm"
    with zipfile.ZipFile(container_path, "w") as zf:
        zf.writestr("base1.apk", apk_bytes)
        zf.writestr("base2.apk", apk_bytes)

    def mock_inspect(zf, apk_file):
        manifest = AndroidManifestInfo(
            package_name="com.example.app",
            version_code=100,
            version_name="1.0.0",
            split_name=None,  # Both pretend to be base!
        )
        return (manifest, "abcdef" * 10 + "1234", 1, 1, [], [], [], [], [])

    monkeypatch.setattr("apk_lab.inspection.inspect_single_apk_zip", mock_inspect)

    with pytest.raises(InspectionError, match="Multiple base APKs found"):
        inspect_artifact(container_path)


def test_split_inspection_signer_consistency(tmp_path, monkeypatch):
    apk_bytes = create_minimal_apk_bytes()
    container_path = tmp_path / "app.apkm"
    with zipfile.ZipFile(container_path, "w") as zf:
        zf.writestr("base.apk", apk_bytes)
        zf.writestr("split.apk", apk_bytes)

    # Case 1: All identical digests pass
    def mock_inspect_same(zf, apk_file):
        split_name = None if apk_file.name == "base.apk" else "split"
        manifest = AndroidManifestInfo("com.app", 1, "1", split_name=split_name)
        return (manifest, "a" * 64, 1, 1, [], [], [], [], [])

    monkeypatch.setattr("apk_lab.inspection.inspect_single_apk_zip", mock_inspect_same)
    insp = inspect_artifact(container_path)
    assert insp.signing_certificate_sha256 == "a" * 64

    # Case 2: All None pass (tools unavailable)
    def mock_inspect_none(zf, apk_file):
        split_name = None if apk_file.name == "base.apk" else "split"
        manifest = AndroidManifestInfo("com.app", 1, "1", split_name=split_name)
        return (manifest, None, 1, 1, [], [], [], [], [])

    monkeypatch.setattr("apk_lab.inspection.inspect_single_apk_zip", mock_inspect_none)
    insp_none = inspect_artifact(container_path)
    assert insp_none.signing_certificate_sha256 is None

    # Case 3: First None, second digest fails
    def mock_inspect_none_then_digest(zf, apk_file):
        split_name = None if apk_file.name == "base.apk" else "split"
        cert = None if apk_file.name == "base.apk" else "b" * 64
        manifest = AndroidManifestInfo("com.app", 1, "1", split_name=split_name)
        return (manifest, cert, 1, 1, [], [], [], [], [])

    monkeypatch.setattr(
        "apk_lab.inspection.inspect_single_apk_zip", mock_inspect_none_then_digest
    )
    with pytest.raises(InspectionError, match="Mismatched signer in split"):
        inspect_artifact(container_path)

    # Case 4: First digest, second None fails
    def mock_inspect_digest_then_none(zf, apk_file):
        split_name = None if apk_file.name == "base.apk" else "split"
        cert = "a" * 64 if apk_file.name == "base.apk" else None
        manifest = AndroidManifestInfo("com.app", 1, "1", split_name=split_name)
        return (manifest, cert, 1, 1, [], [], [], [], [])

    monkeypatch.setattr(
        "apk_lab.inspection.inspect_single_apk_zip", mock_inspect_digest_then_none
    )
    with pytest.raises(InspectionError, match="Mismatched signer in split"):
        inspect_artifact(container_path)

    # Case 5: Two different digests fail
    def mock_inspect_different(zf, apk_file):
        split_name = None if apk_file.name == "base.apk" else "split"
        cert = "a" * 64 if apk_file.name == "base.apk" else "b" * 64
        manifest = AndroidManifestInfo("com.app", 1, "1", split_name=split_name)
        return (manifest, cert, 1, 1, [], [], [], [], [])

    monkeypatch.setattr(
        "apk_lab.inspection.inspect_single_apk_zip", mock_inspect_different
    )
    with pytest.raises(InspectionError, match="Mismatched signer in split"):
        inspect_artifact(container_path)
