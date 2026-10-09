import io
import zipfile

import pytest
from apk_lab.archives import (
    ArchiveSecurityError,
    inspect_safe_zip,
    safe_extract_all,
)
from apk_lab.models import ContainerType


def create_in_memory_zip(entries: dict[str, bytes]) -> io.BytesIO:
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for name, data in entries.items():
            zf.writestr(name, data)
    buf.seek(0)
    return buf


def test_safe_zip_normal():
    buf = create_in_memory_zip(
        {
            "AndroidManifest.xml": b"<manifest></manifest>",
            "classes.dex": b"dex\n035\x00" + b"\x00" * 100,
        }
    )
    report = inspect_safe_zip(buf)
    assert report.container_type == ContainerType.APK
    assert report.entry_count == 2
    assert report.total_uncompressed_bytes > 0


def test_safe_zip_traversal_rejected(tmp_path):
    bad_zip = tmp_path / "bad.zip"
    with zipfile.ZipFile(bad_zip, "w") as zf:
        zf.writestr("../escaped.txt", b"evil")

    with pytest.raises(ArchiveSecurityError, match="Path traversal detected"):
        inspect_safe_zip(bad_zip)


def test_safe_zip_absolute_path_rejected(tmp_path):
    bad_zip = tmp_path / "bad_abs.zip"
    with zipfile.ZipFile(bad_zip, "w") as zf:
        zf.writestr("/absolute/path.txt", b"evil")

    with pytest.raises(ArchiveSecurityError, match="Absolute path in archive"):
        inspect_safe_zip(bad_zip)


def test_safe_zip_duplicate_rejected(tmp_path):
    bad_zip = tmp_path / "dup.zip"
    # Write duplicate entries using lower-level zipfile
    with zipfile.ZipFile(bad_zip, "w") as zf:
        zf.writestr("file.txt", b"one")
        zf.writestr("file.txt", b"two")

    with pytest.raises(ArchiveSecurityError, match="Duplicate entry in archive"):
        inspect_safe_zip(bad_zip)


def test_container_classification_apkm():
    buf = create_in_memory_zip(
        {
            "base.apk": b"PK\x03\x04...",
            "split_config.arm64_v8a.apk": b"PK\x03\x04...",
        }
    )
    report = inspect_safe_zip(buf)
    assert report.container_type == ContainerType.APKM
    assert len(report.apk_members) == 2


def test_container_classification_xapk():
    buf = create_in_memory_zip(
        {
            "manifest.json": b"{}",
            "com.app.apk": b"PK\x03\x04...",
        }
    )
    report = inspect_safe_zip(buf)
    assert report.container_type == ContainerType.XAPK


def test_container_classification_apks():
    buf = create_in_memory_zip(
        {
            "toc.pb": b"\x08\x01",
            "base-master.apk": b"PK\x03\x04...",
        }
    )
    report = inspect_safe_zip(buf)
    assert report.container_type == ContainerType.APKS


def test_safe_extract_all_success(tmp_path):
    zip_path = tmp_path / "test.zip"
    with zipfile.ZipFile(zip_path, "w") as zf:
        zf.writestr("a/b.txt", b"hello world")

    dest_dir = tmp_path / "extracted"
    extracted = safe_extract_all(zip_path, dest_dir)
    assert len(extracted) == 1
    assert (dest_dir / "a" / "b.txt").read_text() == "hello world"


def test_container_classification_apk_with_embedded_apk_asset():
    buf = create_in_memory_zip(
        {
            "AndroidManifest.xml": b"manifest_bytes",
            "classes.dex": b"dex_bytes",
            "assets/helper.apk": b"nested_apk_bytes",
        }
    )
    report = inspect_safe_zip(buf)
    assert report.container_type == ContainerType.APK


def test_safe_extract_all_preexisting_symlink_sibling_rejected(tmp_path):
    dest_dir = tmp_path / "dest"
    dest_dir.mkdir()
    sibling_dir = tmp_path / "dest-sibling"
    sibling_dir.mkdir()
    outside_file = sibling_dir / "target.txt"
    outside_file.write_text("outside safe data")

    # Create symlink inside dest_dir that points to outside_file with prefix-matching dest directory name
    symlink_file = dest_dir / "pwn.txt"
    symlink_file.symlink_to(outside_file)

    zip_path = tmp_path / "malicious.zip"
    with zipfile.ZipFile(zip_path, "w") as zf:
        zf.writestr("pwn.txt", b"evil content")

    with pytest.raises(ArchiveSecurityError, match="escapes target directory"):
        safe_extract_all(zip_path, dest_dir)

    # Outside file must remain untouched
    assert outside_file.read_text() == "outside safe data"
