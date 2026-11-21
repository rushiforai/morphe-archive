import io
import json
import subprocess
import zipfile
from pathlib import Path
from unittest.mock import MagicMock

import pytest
from apk_lab.acquisition import (
    AcquisitionError,
    AcquisitionSource,
    acquire_artifact,
    acquire_with_apkeep,
    acquire_with_apkmirror,
    acquire_with_goopdl,
    build_apkeep_cmd,
    build_goopdl_cmd,
    build_goopdl_env,
    normalize_apks_to_apkm,
)
from apk_lab.google_play_accounts import GooglePlayAccount
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


def test_build_goopdl_env_uses_aas_token_only():
    base = {"PATH": "/usr/bin", "GOOPDL_ACCOUNT_EMAIL": "stale@example.com"}
    account = GooglePlayAccount(
        label="primary",
        email="primary@example.com",
        aas_token="aas_et/token-value",
    )

    env = build_goopdl_env(account, base)
    assert env["GOOPDL_ACCOUNT_EMAIL"] == "primary@example.com"
    assert env["GOOPDL_AAS_TOKEN"] == "aas_et/token-value"
    assert env["PATH"] == "/usr/bin"
    assert base["GOOPDL_ACCOUNT_EMAIL"] == "stale@example.com"

    unsupported = GooglePlayAccount(
        label="legacy",
        email="legacy@example.com",
        aas_token="oauth2_4/token-value",
    )
    unsupported_env = build_goopdl_env(unsupported, base)
    assert unsupported_env == base


def test_goopdl_failure_redacts_credentials_before_truncation(monkeypatch, tmp_path):
    token = "aas_et/" + "a" * 400
    account = GooglePlayAccount(
        label="primary",
        email="primary@example.com",
        aas_token=token,
    )
    # The token starts before the 300-character limit and ends after it.
    stderr = "x" * 20 + f"{account.email} {token}\n" + "y" * 400

    def mock_run(*_args, **_kwargs):
        return subprocess.CompletedProcess([], returncode=1, stdout="", stderr=stderr)

    monkeypatch.setattr("subprocess.run", mock_run)

    with pytest.raises(AcquisitionError) as exc_info:
        acquire_with_goopdl("com.test.pkg", tmp_path, account=account)

    message = str(exc_info.value)
    assert "[REDACTED_TOKEN]" in message
    assert token[:20] not in message
    assert account.email not in message
    assert account.redacted_email in message


def test_apkeep_credentials_ini_and_isolation(monkeypatch, tmp_path):
    accounts_json = json.dumps(
        {
            "version": 1,
            "accounts": [
                {
                    "label": "my-account",
                    "email": "my_user@test.org",
                    "aasToken": "super_secret_token_val",
                    "device": "px_9a",
                    "locale": "en_US",
                }
            ],
        }
    )
    monkeypatch.setenv("APKEEP_ACCOUNTS", accounts_json)
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
    accounts_json = json.dumps(
        {
            "version": 1,
            "accounts": [
                {
                    "label": "u",
                    "email": "u@test.com",
                    "aasToken": "tok",
                }
            ],
        }
    )
    monkeypatch.setenv("APKEEP_ACCOUNTS", accounts_json)
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


def test_acquire_with_apkmirror_unmapped_package_raises(tmp_path):
    out_dir = tmp_path / "out"
    with pytest.raises(AcquisitionError, match="No APKMirror repository mapping"):
        acquire_with_apkmirror("com.unmapped.app", out_dir)


@pytest.mark.parametrize("bundle", [False, True])
def test_acquire_with_apkmirror_success(monkeypatch, tmp_path, bundle):
    out_dir = tmp_path / "out"
    runner = tmp_path / "dummy_runner.cjs"
    runner.write_text("// dummy runner", encoding="utf-8")

    def mock_run(cmd, **kwargs):
        attempt_dir = Path(cmd[6])
        if bundle:
            with zipfile.ZipFile(attempt_dir / "download.apkm", "w") as zf:
                zf.writestr("nested/base.apk", b"dummy_base")
        else:
            (attempt_dir / "base.apk").write_bytes(b"dummy_base")
        return subprocess.CompletedProcess(cmd, returncode=0, stdout="{}", stderr="")

    monkeypatch.setattr("subprocess.run", mock_run)
    monkeypatch.setattr(
        "apk_lab.acquisition.normalize_apks_to_apkm",
        lambda apks, out: out.write_bytes(b"apkm_content"),
    )
    monkeypatch.setattr(
        "apk_lab.acquisition.inspect_artifact",
        lambda p: ArtifactInspection(
            file_path=str(p),
            container_type=ContainerType.APKM,
            file_size=10,
            sha256="sha",
            package_name="com.sezzle.sezzlemobile",
            version_name="5.3.9",
            version_code=100,
            min_sdk=23,
            target_sdk=34,
            signing_certificate_sha256="sig",
            splits=[],
            dex_classes_count=1,
            dex_methods_count=1,
            dex_files=["classes.dex"],
            native_libraries=[],
            resources=[],
            assets=[],
            warnings=[],
        ),
    )

    res = acquire_with_apkmirror(
        "com.sezzle.sezzlemobile",
        out_dir,
        expected_version="5.3.9",
        runner_script=runner,
    )
    assert res.name == "com.sezzle.sezzlemobile.apkm"
    assert res.is_file()


def test_acquire_artifact_fallback_to_apkmirror(monkeypatch, tmp_path):
    out_dir = tmp_path / "out"

    def mock_goopdl(*args, **kwargs):
        raise AcquisitionError("goopdl failed", ExitCode.INFRASTRUCTURE_FAILURE)

    def mock_apkmirror(pkg, dest, **kwargs):
        fake_path = dest / f"{pkg}.apkm"
        dest.mkdir(parents=True, exist_ok=True)
        fake_path.write_bytes(b"fake_apkm")
        return fake_path

    monkeypatch.setattr("apk_lab.acquisition.acquire_with_goopdl", mock_goopdl)
    monkeypatch.setattr("apk_lab.acquisition.acquire_with_apkmirror", mock_apkmirror)

    artifact, source = acquire_artifact("com.sezzle.sezzlemobile", out_dir)
    assert source == AcquisitionSource.APKMIRROR
    assert artifact.is_file()


def test_acquire_artifact_reports_every_source_failure(monkeypatch, tmp_path):
    accounts_json = json.dumps(
        {
            "version": 1,
            "accounts": [
                {
                    "label": "primary",
                    "email": "primary@example.com",
                    "aasToken": "aas_et/token",
                    "enabled": True,
                }
            ],
        }
    )
    monkeypatch.setenv("APKEEP_ACCOUNTS", accounts_json)

    tool_mgr = MagicMock()
    tool_mgr.is_tool_installed.return_value = True

    monkeypatch.setattr(
        "apk_lab.acquisition.acquire_with_apkeep",
        MagicMock(
            side_effect=AcquisitionError(
                "latest 2.0.0 != expected 1.0.0", ExitCode.INVALID_ARTIFACT
            )
        ),
    )
    monkeypatch.setattr(
        "apk_lab.acquisition.acquire_with_goopdl",
        MagicMock(
            side_effect=AcquisitionError(
                "dispenser returned HTTP 403", ExitCode.INFRASTRUCTURE_FAILURE
            )
        ),
    )
    monkeypatch.setattr(
        "apk_lab.acquisition.acquire_with_apkmirror",
        MagicMock(
            side_effect=AcquisitionError(
                "no mapping configured", ExitCode.INVALID_ARTIFACT
            )
        ),
    )

    with pytest.raises(AcquisitionError) as exc:
        acquire_artifact(
            "com.example", tmp_path, expected_version="1.0.0", tool_mgr=tool_mgr
        )

    message = str(exc.value)
    assert "apkeep [primary]" in message
    assert "goopdl [primary] direct auth" in message
    assert "apkmirror" in message
    assert exc.value.exit_code == ExitCode.INVALID_ARTIFACT


def test_apkmirror_timeout_is_acquisition_failure(monkeypatch, tmp_path):
    def stalled_download(cmd, **kwargs):
        assert 0 < kwargs["timeout"] <= 300
        raise subprocess.TimeoutExpired(cmd, kwargs["timeout"])

    monkeypatch.setattr("subprocess.run", stalled_download)
    with pytest.raises(AcquisitionError, match="timed out") as exc:
        acquire_with_apkmirror("com.sezzle.sezzlemobile", tmp_path)
    assert exc.value.exit_code == ExitCode.INFRASTRUCTURE_FAILURE
    assert list(tmp_path.iterdir()) == []


@pytest.mark.parametrize(
    "member", ["../escape.apk", "nested/../../escape.apk", "/escape.apk"]
)
def test_apkmirror_rejects_unsafe_bundle_before_extraction(
    monkeypatch, tmp_path, member
):
    def download_bundle(cmd, **kwargs):
        with zipfile.ZipFile(Path(cmd[-1]) / "download.apkm", "w") as zf:
            zf.writestr("base.apk", b"base")
            zf.writestr(member, b"unsafe")
        return subprocess.CompletedProcess(cmd, returncode=0)

    extract = MagicMock()
    monkeypatch.setattr("subprocess.run", download_bundle)
    monkeypatch.setattr(zipfile.ZipFile, "extractall", extract)
    with pytest.raises(AcquisitionError, match="Unsafe archive member") as exc:
        acquire_with_apkmirror("com.sezzle.sezzlemobile", tmp_path)
    assert exc.value.exit_code == ExitCode.INVALID_ARTIFACT
    extract.assert_not_called()
    assert list(tmp_path.iterdir()) == []


def test_acquire_artifact_ordered_account_fallback(monkeypatch, tmp_path):
    out_dir = tmp_path / "out"
    out_dir.mkdir()

    accounts_json = json.dumps(
        {
            "version": 1,
            "accounts": [
                {
                    "label": "primary",
                    "email": "primary@example.com",
                    "aasToken": "tok_prim",
                    "enabled": True,
                },
                {
                    "label": "secondary",
                    "email": "secondary@example.com",
                    "aasToken": "tok_sec",
                    "enabled": True,
                },
            ],
        }
    )
    monkeypatch.setenv("APKEEP_ACCOUNTS", accounts_json)

    mock_tool_mgr = MagicMock()
    mock_tool_mgr.is_tool_installed.return_value = True

    attempted_accounts = []

    def mock_acquire_with_apkeep(package_name, attempt_out_dir, **kwargs):
        acc = kwargs.get("account")
        attempted_accounts.append(acc.label)
        if acc.label == "primary":
            raise AcquisitionError(
                "primary account unavailable", ExitCode.INFRASTRUCTURE_FAILURE
            )
        # secondary succeeds
        target_apkm = Path(attempt_out_dir) / f"{package_name}.apkm"
        target_apkm.write_bytes(b"content")
        return target_apkm

    monkeypatch.setattr(
        "apk_lab.acquisition.acquire_with_apkeep", mock_acquire_with_apkeep
    )

    res_path, source = acquire_artifact("com.example", out_dir, tool_mgr=mock_tool_mgr)
    assert source == AcquisitionSource.APKEEP
    assert attempted_accounts == ["primary", "secondary"]
    assert res_path.exists()
