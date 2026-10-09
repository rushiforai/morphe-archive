import json

import pytest
from apk_lab.workspace import MARKER_FILENAME, WorkspaceError, WorkspaceManager


def test_deterministic_workspace_ids(tmp_path):
    mgr = WorkspaceManager(root=tmp_path)
    config = {"jadx": True, "apktool": False}
    tools = {"morphe": "1.18.0"}

    run1 = mgr.create_run_dir(
        package_name="com.test.app",
        version_code=100,
        input_sha256="abcdef1234567890",
        input_path="/path/to/app.apk",
        command="analyze",
        config=config,
        tool_versions=tools,
    )

    run2 = mgr.create_run_dir(
        package_name="com.test.app",
        version_code=100,
        input_sha256="abcdef1234567890",
        input_path="/path/to/app.apk",
        command="analyze",
        config=config,
        tool_versions=tools,
    )

    assert run1 == run2
    assert (run1 / MARKER_FILENAME).is_file()

    marker = json.loads((run1 / MARKER_FILENAME).read_text())
    assert marker["schemaVersion"] == 1
    assert marker["command"] == "analyze"
    assert marker["inputSha256"] == "abcdef1234567890"


def test_cleanup_refusal_outside_root(tmp_path):
    ws_root = tmp_path / "workspace"
    outside_dir = tmp_path / "outside"
    outside_dir.mkdir(parents=True)

    mgr = WorkspaceManager(root=ws_root)
    with pytest.raises(WorkspaceError, match="outside workspace root"):
        mgr.clean_run(outside_dir)


def test_cleanup_refusal_symlink(tmp_path):
    ws_root = tmp_path / "workspace"
    ws_root.mkdir()
    target_dir = tmp_path / "target"
    target_dir.mkdir()

    symlink_dir = ws_root / "symlinked_run"
    symlink_dir.symlink_to(target_dir)

    mgr = WorkspaceManager(root=ws_root)
    with pytest.raises(WorkspaceError, match="is a symlink"):
        mgr.clean_run(symlink_dir)


def test_cleanup_refusal_missing_marker(tmp_path):
    ws_root = tmp_path / "workspace"
    fake_run = ws_root / "fake_run"
    fake_run.mkdir(parents=True)

    mgr = WorkspaceManager(root=ws_root)
    with pytest.raises(WorkspaceError, match="missing .marker.json"):
        mgr.clean_run(fake_run)


def test_ephemeral_workspace_cleanup(tmp_path):
    mgr = WorkspaceManager(root=tmp_path)
    config = {"patch": "test"}
    tools = {"morphe": "1.18.0"}

    created_path = None
    with mgr.ephemeral_run(
        package_name="com.test.ephemeral",
        version_code=1,
        input_sha256="0123456789abcdef",
        input_path="/app.apk",
        command="check",
        config=config,
        tool_versions=tools,
        keep_workspace=False,
    ) as run_dir:
        created_path = run_dir
        assert created_path.is_dir()
        assert (created_path / MARKER_FILENAME).is_file()

    # After context exit, directory must be removed
    assert not created_path.exists()


def test_cleanup_refusal_prefix_matching_sibling(tmp_path):
    ws_root = tmp_path / "workspace"
    ws_root.mkdir()
    sibling_dir = tmp_path / "workspace-sibling"
    sibling_dir.mkdir()
    fake_run = sibling_dir / "run1"
    fake_run.mkdir()

    mgr = WorkspaceManager(root=ws_root)
    with pytest.raises(WorkspaceError, match="outside workspace root"):
        mgr.clean_run(fake_run)


def test_clean_stale_negative_rejected(tmp_path):
    mgr = WorkspaceManager(root=tmp_path)
    with pytest.raises(WorkspaceError, match="non-negative"):
        mgr.clean_stale(-1.0)
