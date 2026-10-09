import io
import subprocess
import zipfile
from pathlib import Path
from unittest.mock import MagicMock

import pytest
from apk_lab.acquisition import (
    AcquisitionError,
    AcquisitionSource,
    acquire_with_apkeep,
    acquire_with_goopdl,
    build_apkeep_cmd,
    build_goopdl_cmd,
    normalize_apks_to_apkm,
)
from apk_lab.models import (
    AndroidManifestInfo,
    ArtifactInspection,
    ContainerType,
    ExitCode,
)


def create_test_apk_bytes(manifest: AndroidManifestInfo) -> bytes:
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w") as zf:
        zf.writestr("AndroidManifest.xml", b"manifest_bytes")
        zf.writestr("classes.dex", b"dex_bytes")
    return buf.getvalue()


def test_command_builders():
    apkeep_cmd = build_apkeep_cmd("com.test.pkg", "/tmp/creds.ini", "/tmp/attempt")
    assert apkeep_cmd == [
        "-a",
        "com.test.pkg",
        "-d",
        "google-play",
        "-i",
        "/tmp/creds.ini",
        "-o",
        "device=px_9a,locale=en_US,timezone=UTC,split_apk=true",
        "/tmp/attempt",
    ]

    goopdl_cmd_both = build_goopdl_cmd(
        "com.test.pkg",
        "/tmp/attempt",
        expected_version="1.2.3",
        expected_version_code=123,
    )
    assert goopdl_cmd_both == [
        "python",
        "-m",
        "goopdl",
        "download",
        "com.test.pkg",
        "--output",
        "/tmp/attempt",
        "--no-extras",
        "--version",
        "123",
    ]

    goopdl_cmd_ver = build_goopdl_cmd(
        "com.test.pkg", "/tmp/attempt", expected_version="1.2.3"
    )
    assert goopdl_cmd_ver[-2:] == ["--version", "1.2.3"]


def test_apkeep_credentials_ini_and_isolation(monkeypatch, tmp_path):
    monkeypatch.setenv("APKEEP_EMAIL", "my_user@test.org")
    monkeypatch.setenv("APKEEP_AAS_TOKEN", "super_secret_token_val")

    out_dir = tmp_path / "out"
    out_dir.mkdir()

    # Pre-seed a stale APK in out_dir that should be ignored because it's outside the attempt dir
    stale_apk = out_dir / "stale.apk"
    stale_apk.write_bytes(b"stale")

    captured_cmds = []
    created_ini_contents = []

    mock_tool_mgr = MagicMock()
    mock_tool_mgr.is_tool_installed.return_value = True

    def mock_run_tool(name, cmd):
        captured_cmds.append(cmd)
        ini_path = Path(cmd[cmd.index("-i") + 1])
        if ini_path.exists():
            created_ini_contents.append(ini_path.read_text())

        attempt_dir = Path(cmd[-1])
        base_apk = attempt_dir / "base.apk"
        base_apk.write_bytes(b"apk")

        return subprocess.CompletedProcess(cmd, returncode=0, stdout="", stderr="")

    mock_tool_mgr.run_tool_cmd = mock_run_tool

    # Mock normalize and inspect
    monkeypatch.setattr(
        "apk_lab.acquisition.normalize_apks_to_apkm",
        lambda apks, out: out.write_bytes(b"apkm"),
    )
    monkeypatch.setattr(
        "apk_lab.acquisition.inspect_artifact",
        lambda p: ArtifactInspection(
            file_path=str(p),
            container_type=ContainerType.APKM,
            file_size=10,
            sha256="abc",
            package_name="com.test.pkg",
            version_name="1.0.0",
            version_code=100,
        ),
    )

    result_apkm = acquire_with_apkeep(
        "com.test.pkg",
        out_dir,
        expected_version="1.0.0",
        expected_version_code=100,
        tool_mgr=mock_tool_mgr,
    )

    assert result_apkm.exists()
    assert len(created_ini_contents) == 1
    assert "email = my_user@test.org" in created_ini_contents[0]
    assert "aas_token = super_secret_token_val" in created_ini_contents[0]
    # Secrets must not be in command arguments
    for c in captured_cmds[0]:
        assert "super_secret_token_val" not in c
        assert "my_user@test.org" not in c


def test_normalization_base_selection_order_and_rejection(tmp_path, monkeypatch):
    dir_path = tmp_path / "apks"
    dir_path.mkdir()

    config_apk = dir_path / "config.arm64.apk"
    config_apk.write_bytes(b"cfg")
    base_apk = dir_path / "base-master.apk"
    base_apk.write_bytes(b"base")

    def mock_badging(apk_path):
        if apk_path.name == "config.arm64.apk":
            return AndroidManifestInfo("com.test", 1, "1", split_name="config.arm64")
        return AndroidManifestInfo("com.test", 1, "1", split_name=None)

    monkeypatch.setattr("apk_lab.acquisition.parse_apk_badging", mock_badging)
    monkeypatch.setattr(
        "apk_lab.acquisition.inspect_artifact",
        lambda p: ArtifactInspection(
            file_path=str(p),
            container_type=ContainerType.APKM,
            file_size=10,
            sha256="abc",
            package_name="com.test",
            version_name="1",
            version_code=1,
        ),
    )

    out_apkm = tmp_path / "result.apkm"
    # Even if config.arm64 is listed first, base.apk must be the manifest-base
    normalize_apks_to_apkm([config_apk, base_apk], out_apkm)
    assert out_apkm.exists()

    with zipfile.ZipFile(out_apkm, "r") as zf:
        names = zf.namelist()
        assert "base.apk" in names
        assert "config.arm64.apk" in names

    # Rejection of zero base
    def mock_badging_all_splits(p):
        return AndroidManifestInfo("com.test", 1, "1", split_name="split1")

    monkeypatch.setattr(
        "apk_lab.acquisition.parse_apk_badging", mock_badging_all_splits
    )
    with pytest.raises(AcquisitionError, match="No base APK found"):
        normalize_apks_to_apkm([config_apk], tmp_path / "out2.apkm")


def test_version_validation_both_providers(monkeypatch, tmp_path):
    out_dir = tmp_path / "out"
    out_dir.mkdir()

    # Mock normalize to produce dummy APKM
    monkeypatch.setattr(
        "apk_lab.acquisition.normalize_apks_to_apkm",
        lambda apks, out: out.write_bytes(b"dummy"),
    )

    # Mock inspection to return version mismatch
    monkeypatch.setattr(
        "apk_lab.acquisition.inspect_artifact",
        lambda p: ArtifactInspection(
            file_path=str(p),
            container_type=ContainerType.APKM,
            file_size=10,
            sha256="abc",
            package_name="com.test.pkg",
            version_name="2.0.0",
            version_code=200,
        ),
    )

    # 1. Apkeep with version code mismatch
    monkeypatch.setenv("APKEEP_EMAIL", "u@test.com")
    monkeypatch.setenv("APKEEP_AAS_TOKEN", "tok")

    mock_tool_mgr = MagicMock()
    mock_tool_mgr.is_tool_installed.return_value = True

    def mock_run(name, cmd):
        attempt_dir = Path(cmd[-1])
        (attempt_dir / "a.apk").write_bytes(b"a")
        return subprocess.CompletedProcess(cmd, returncode=0)

    mock_tool_mgr.run_tool_cmd = mock_run

    with pytest.raises(
        AcquisitionError,
        match="Downloaded version code '200' does not match expected '100'",
    ):
        acquire_with_apkeep(
            "com.test.pkg",
            out_dir,
            expected_version="2.0.0",
            expected_version_code=100,
            tool_mgr=mock_tool_mgr,
        )

    # 2. Goopdl with version name mismatch
    def mock_subp(cmd, **kwargs):
        attempt_dir = Path(cmd[cmd.index("--output") + 1])
        (attempt_dir / "a.apk").write_bytes(b"a")
        return subprocess.CompletedProcess(cmd, returncode=0)

    monkeypatch.setattr("subprocess.run", mock_subp)

    with pytest.raises(
        AcquisitionError, match="goopdl downloaded version '2.0.0' != expected '1.0.0'"
    ):
        acquire_with_goopdl(
            "com.test.pkg",
            out_dir,
            expected_version="1.0.0",
            expected_version_code=200,
        )


def test_cli_acquire_default_out_dir(monkeypatch, tmp_path):
    import argparse

    from apk_lab.cli import handle_acquire

    called_out_dirs = []

    def mock_acquire(
        package_name, out_dir, expected_version=None, expected_version_code=None
    ):
        called_out_dirs.append(out_dir)
        return Path("/tmp/fake.apkm"), AcquisitionSource.GOOPDL

    monkeypatch.setattr("apk_lab.acquisition.acquire_artifact", mock_acquire)

    args = argparse.Namespace(
        package="com.test.pkg",
        version=None,
        version_code=None,
        out_dir=None,  # default None triggers tempfile.gettempdir()
    )

    exit_code = handle_acquire(args)
    assert exit_code == ExitCode.SUCCESS
    assert len(called_out_dirs) == 1
    assert called_out_dirs[0].is_dir()
