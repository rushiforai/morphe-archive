import json

import pytest
from apk_lab.tools import ToolError, ToolManager, check_host_prerequisites


def test_tools_lock_loading(tmp_path):
    lock_file = tmp_path / "tools.lock.json"
    lock_file.write_text(
        json.dumps(
            {
                "tools": {
                    "dummy": {
                        "version": "1.0.0",
                        "url": "https://example.com/dummy.jar",
                        "sha256": "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                        "license": "MIT",
                        "supportedPlatforms": ["any"],
                        "toolType": "jar",
                        "executablePath": "dummy.jar",
                    }
                }
            }
        )
    )

    mgr = ToolManager(cache_root=tmp_path / "cache", lock_file=lock_file)
    spec = mgr.get_tool_spec("dummy")
    assert spec["version"] == "1.0.0"
    assert mgr.is_platform_supported("dummy")


def test_tool_unknown_raises(tmp_path):
    lock_file = tmp_path / "tools.lock.json"
    lock_file.write_text(json.dumps({"tools": {}}))
    mgr = ToolManager(cache_root=tmp_path / "cache", lock_file=lock_file)

    with pytest.raises(ToolError, match="Unknown tool"):
        mgr.get_tool_spec("nonexistent")


def test_doctor_credentials_masking(monkeypatch, tmp_path):
    monkeypatch.setenv("APKEEP_EMAIL", "secret_user@example.com")
    monkeypatch.setenv("APKEEP_AAS_TOKEN", "super_secret_token_12345")

    report = check_host_prerequisites(ci_mode=True, workspace_root=tmp_path)
    d = report.to_dict()

    assert d["credentialsPresent"]["APKEEP_EMAIL"] is True
    assert d["credentialsPresent"]["APKEEP_AAS_TOKEN"] is True
    # Values MUST never appear in report output
    assert "secret_user@example.com" not in json.dumps(d)
    assert "super_secret_token_12345" not in json.dumps(d)


def test_doctor_profile_apkeep_handling(monkeypatch, tmp_path):
    # Mock platform as linux-x86_64 where apkeep is supported
    monkeypatch.setattr(
        "apk_lab.tools.ToolManager.is_platform_supported", lambda self, name: True
    )
    monkeypatch.setattr(
        "apk_lab.tools.ToolManager.is_tool_installed", lambda self, name: False
    )

    # Analysis profile ignores apkeep even when supported
    rep_analysis = check_host_prerequisites(
        ci_mode=False, profile="analysis", workspace_root=tmp_path
    )
    tool_names_analysis = [t.name for t in rep_analysis.tools]
    assert "apkeep" not in tool_names_analysis

    # CI profile includes apkeep when supported
    rep_ci = check_host_prerequisites(
        ci_mode=True, profile="ci", workspace_root=tmp_path
    )
    tool_names_ci = [t.name for t in rep_ci.tools]
    assert "apkeep" in tool_names_ci


def test_doctor_uv_probe_failure(monkeypatch, tmp_path):
    import subprocess

    orig_run = subprocess.run

    def mock_run(cmd, *args, **kwargs):
        if cmd[0] == "uv":
            return subprocess.CompletedProcess(
                cmd, returncode=1, stdout="", stderr="command not found"
            )
        return orig_run(cmd, *args, **kwargs)

    monkeypatch.setattr("subprocess.run", mock_run)
    report = check_host_prerequisites(workspace_root=tmp_path)
    uv_prereq = next(p for p in report.prerequisites if p.name == "uv")
    assert uv_prereq.satisfied is False
    assert report.all_ready is False


def test_doctor_non_destructive_workspace_probe(tmp_path):
    sentinel = tmp_path / ".test_write"
    sentinel.write_text("pre-existing sentinel data")

    check_host_prerequisites(workspace_root=tmp_path)

    assert sentinel.exists()
    assert sentinel.read_text() == "pre-existing sentinel data"
    # Check that no temporary probe files were left behind
    remaining_probe_files = list(tmp_path.glob(".probe_*"))
    assert len(remaining_probe_files) == 0


def test_doctor_ci_credentials_readiness(monkeypatch, tmp_path):
    from apk_lab.tools import REQUIRED_CI_CREDENTIALS

    # When CI mode is active and any required credential is missing
    for cred in REQUIRED_CI_CREDENTIALS:
        monkeypatch.delenv(cred, raising=False)

    report = check_host_prerequisites(ci_mode=True, workspace_root=tmp_path)
    assert report.all_ready is False
    assert report.to_dict()["allReady"] is False

    # When all required credentials are set, and dummy prereqs/tools pass
    for cred in REQUIRED_CI_CREDENTIALS:
        monkeypatch.setenv(cred, "dummy_secret_value")
    monkeypatch.setattr(
        "apk_lab.tools.ToolManager.is_tool_installed", lambda self, name: True
    )
    monkeypatch.setattr(
        "apk_lab.tools.ToolManager.get_executable_path",
        lambda self, name: tmp_path / name,
    )

    report_ok = check_host_prerequisites(ci_mode=True, workspace_root=tmp_path)
    # Check credentialsPresent has booleans only
    creds_dict = report_ok.to_dict()["credentialsPresent"]
    for cred in REQUIRED_CI_CREDENTIALS:
        assert creds_dict[cred] is True
    assert "dummy_secret_value" not in json.dumps(report_ok.to_dict())


def test_run_tool_cmd_allows_callers_to_override_defaults(monkeypatch, tmp_path):
    import subprocess

    lock_file = tmp_path / "tools.lock.json"
    lock_file.write_text(
        json.dumps(
            {
                "tools": {
                    "dummy": {
                        "version": "1.0.0",
                        "url": "https://example.com/dummy",
                        "sha256": "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                        "license": "MIT",
                        "supportedPlatforms": ["any"],
                        "toolType": "binary",
                        "executablePath": "dummy",
                    }
                }
            }
        )
    )
    cache_root = tmp_path / "cache"
    mgr = ToolManager(cache_root=cache_root, lock_file=lock_file)
    dummy_exe = mgr.get_executable_path("dummy")
    dummy_exe.parent.mkdir(parents=True)
    dummy_exe.write_text("#!/bin/sh\n")

    captured = {}

    def mock_run(cmd, **kwargs):
        captured["cmd"] = cmd
        captured["kwargs"] = kwargs
        return subprocess.CompletedProcess(cmd, returncode=0, stdout="", stderr="")

    monkeypatch.setattr("subprocess.run", mock_run)

    mgr.run_tool_cmd("dummy", ["--version"], check=True, capture_output=False)

    assert captured["cmd"] == [str(dummy_exe), "--version"]
    assert captured["kwargs"]["check"] is True
    assert captured["kwargs"]["capture_output"] is False
    assert captured["kwargs"]["text"] is True
