from unittest.mock import MagicMock

import pytest
from apk_lab.compatibility_ci import (
    build_error_result,
    get_target_version_for_package,
    parse_requested_roles,
    resolve_matrix_packages,
    run_ci_reconcile_and_test,
)
from apk_lab.fixtures import SlotMetadata
from apk_lab.models import ExitCode, PatchCompatibilityReport


def test_resolve_matrix_packages():
    data = {
        "patches": [
            {
                "compatiblePackages": [
                    {"packageName": "com.app.a"},
                    {"packageName": "com.app.b"},
                ]
            }
        ]
    }

    # All packages default
    assert resolve_matrix_packages(data, "workflow_dispatch") == [
        "com.app.a",
        "com.app.b",
    ]
    assert resolve_matrix_packages(data, "workflow_dispatch", input_pkg="all") == [
        "com.app.a",
        "com.app.b",
    ]

    # Specific valid package
    assert resolve_matrix_packages(
        data, "workflow_dispatch", input_pkg="com.app.a"
    ) == ["com.app.a"]
    assert resolve_matrix_packages(
        data, "repository_dispatch", dispatch_pkg="com.app.b"
    ) == ["com.app.b"]

    # Unknown package must raise ValueError rather than falling back to all
    with pytest.raises(ValueError, match="Unknown package"):
        resolve_matrix_packages(data, "workflow_dispatch", input_pkg="com.unknown.app")
    with pytest.raises(ValueError, match="Unknown package"):
        resolve_matrix_packages(
            data, "repository_dispatch", dispatch_pkg="com.unknown.app"
        )


def test_get_target_version_for_package():
    data = {
        "patches": [
            {
                "compatiblePackages": [
                    {
                        "packageName": "com.app.a",
                        "targets": [{"version": "1.0.0"}, {"version": "1.2.0"}],
                    }
                ]
            }
        ]
    }
    assert get_target_version_for_package(data, "com.app.a") == "1.2.0"
    assert get_target_version_for_package(data, "com.app.b") == ""


def test_reconcile_and_test_uses_updated_target_and_posts_batched(
    monkeypatch, tmp_path
):
    monkeypatch.setenv("DISPATCH_REQUEST_ID", "req-123")
    monkeypatch.setenv("COMPATIBILITY_STATUS_SECRET", "secret-xyz")
    monkeypatch.setenv("WORKER_STATUS_URL", "https://worker.test")
    monkeypatch.setenv("APKEEP_EMAIL", "u@test.com")
    monkeypatch.setattr(
        "apk_lab.compatibility_ci.get_target_version_for_package",
        lambda data, p: "1.0.0",
    )
    runner_temp = tmp_path / "runner_temp"
    runner_temp.mkdir()

    mpp_file = tmp_path / "bundle.mpp"
    mpp_file.write_bytes(b"mpp")

    mock_r2 = MagicMock()
    # Initial slots: target is None, latest is old
    mock_r2.get_slot_metadata.side_effect = lambda pkg, role: None

    # Acquirer returns new artifact
    def mock_acquirer(pkg, out_dir):
        fake_path = out_dir / f"{pkg}.apkm"
        out_dir.mkdir(parents=True, exist_ok=True)
        fake_path.write_bytes(b"fake_latest")
        source = MagicMock()
        source.value = "apkeep"
        return fake_path, source

    # Rotation produces updated latest and target
    latest_meta = SlotMetadata(
        role="latest",
        package_name="com.test.app",
        version_name="2.0.0",
        version_code=200,
        container_type="APKM",
        sha256="sha_latest",
        signer_sha256="sig",
        size_bytes=100,
        acquisition_source="apkeep",
        timestamp="2026-10-06T00:00:00Z",
    )
    target_meta = SlotMetadata(
        role="target",
        package_name="com.test.app",
        version_name="1.0.0",
        version_code=100,
        container_type="APKM",
        sha256="sha_target",
        signer_sha256="sig",
        size_bytes=100,
        acquisition_source="apkeep",
        timestamp="2026-10-06T00:00:00Z",
    )
    mock_r2.rotate_slots_on_new_latest.return_value = (latest_meta, target_meta)

    # Checker records role runs
    checked_roles = []

    def mock_checker(
        apk_path, mpp_path, expected_package=None, all_patches=False, force=False
    ):
        role = "latest" if force else "target"
        checked_roles.append(role)
        ver = "2.0.0" if role == "latest" else "1.0.0"
        status = "compatible"
        report = PatchCompatibilityReport(
            artifact_sha256="sha",
            package_name=expected_package,
            version_name=ver,
            version_code=100,
            patch_bundle_version="1.4.0",
            git_revision="rev1",
            tool_versions={},
            overall_status=status,
            total_cases=5,
            passed_cases=5,
            failed_cases=0,
        )
        return report, 0

    # Poster captures the single batched submission
    posted_submissions = []

    def mock_poster(url, secret, submission):
        posted_submissions.append((url, secret, submission))
        return 200

    exit_code = run_ci_reconcile_and_test(
        pkg="com.test.app",
        mpp_path=mpp_file,
        runner_temp=runner_temp,
        r2_mgr=mock_r2,
        acquirer=mock_acquirer,
        checker=mock_checker,
        poster=mock_poster,
    )

    assert exit_code == ExitCode.SUCCESS
    # Only target is checked
    assert checked_roles == ["target"]
    assert len(posted_submissions) == 1
    url, secret, sub = posted_submissions[0]
    assert url == "https://worker.test"
    assert secret == "secret-xyz"
    assert sub["requestId"] == "req-123"
    assert sub["packageName"] == "com.test.app"
    assert sub["acquiredPlayVersion"] == "2.0.0"
    assert len(sub["results"]) == 1
    assert sub["results"][0]["role"] == "target"

def test_reconcile_and_test_no_fixture_fails(monkeypatch, tmp_path):
    monkeypatch.delenv("APKEEP_EMAIL", raising=False)
    monkeypatch.delenv("R2_ACCESS_KEY_ID", raising=False)

    runner_temp = tmp_path / "runner_temp"
    runner_temp.mkdir()
    mpp_file = tmp_path / "bundle.mpp"
    mpp_file.write_bytes(b"mpp")

    mock_r2 = MagicMock()
    mock_r2.get_slot_metadata.return_value = None

    exit_code = run_ci_reconcile_and_test(
        pkg="com.test.app",
        mpp_path=mpp_file,
        runner_temp=runner_temp,
        r2_mgr=mock_r2,
    )
    # Must exit nonzero because no fixture exists
    assert exit_code == ExitCode.INVALID_ARTIFACT

def test_reconcile_and_test_acquisition_failure_posts_null_acquired_version(
    monkeypatch, tmp_path
):
    monkeypatch.setenv("DISPATCH_REQUEST_ID", "req-failed-acq")
    monkeypatch.setenv("COMPATIBILITY_STATUS_SECRET", "secret-xyz")
    monkeypatch.setenv("WORKER_STATUS_URL", "https://worker.test")
    monkeypatch.setenv("APKEEP_EMAIL", "u@test.com")
    monkeypatch.setattr(
        "apk_lab.compatibility_ci.get_target_version_for_package",
        lambda data, p: "1.0.0",
    )
    runner_temp = tmp_path / "runner_temp"
    runner_temp.mkdir()
    mpp_file = tmp_path / "bundle.mpp"
    mpp_file.write_bytes(b"mpp")

    mock_r2 = MagicMock()
    target_meta = SlotMetadata(
        role="target",
        package_name="com.test.app",
        version_name="1.0.0",
        version_code=100,
        container_type="APKM",
        sha256="sha_target",
        signer_sha256="sig",
        size_bytes=100,
        acquisition_source="apkeep",
        timestamp="2026-10-06T00:00:00Z",
    )
    mock_r2.get_slot_metadata.side_effect = lambda pkg, role: (
        target_meta if role == "target" else None
    )

    def failing_acquirer(pkg, out_dir):
        raise RuntimeError("Acquisition network failure")

    def mock_checker(
        apk_path, mpp_path, expected_package=None, all_patches=False, force=False
    ):
        report = PatchCompatibilityReport(
            artifact_sha256="sha",
            package_name=expected_package,
            version_name="1.0.0",
            version_code=100,
            patch_bundle_version="1.4.0",
            git_revision="rev1",
            tool_versions={},
            overall_status="compatible",
            total_cases=5,
            passed_cases=5,
            failed_cases=0,
        )
        return report, 0

    posted_submissions = []

    def mock_poster(url, secret, submission):
        posted_submissions.append((url, secret, submission))
        return 200

    exit_code = run_ci_reconcile_and_test(
        pkg="com.test.app",
        mpp_path=mpp_file,
        runner_temp=runner_temp,
        r2_mgr=mock_r2,
        acquirer=failing_acquirer,
        checker=mock_checker,
        poster=mock_poster,
    )

    assert exit_code == ExitCode.SUCCESS
    assert len(posted_submissions) == 1
    _, _, sub = posted_submissions[0]
    assert sub["acquiredPlayVersion"] is None
    assert len(sub["results"]) == 1
    assert sub["results"][0]["role"] == "target"


def test_reconcile_and_test_compatibility_failure_surfaced(monkeypatch, tmp_path):
    monkeypatch.delenv("APKEEP_EMAIL", raising=False)
    monkeypatch.delenv("R2_ACCESS_KEY_ID", raising=False)
    monkeypatch.setenv("COMPATIBILITY_STATUS_SECRET", "sec")
    monkeypatch.setenv("DISPATCH_REQUEST_ID", "req-failed-123")
    monkeypatch.setattr(
        "apk_lab.compatibility_ci.get_target_version_for_package",
        lambda data, p: "1.0.0",
    )
    runner_temp = tmp_path / "runner_temp"
    runner_temp.mkdir()
    mpp_file = tmp_path / "bundle.mpp"
    mpp_file.write_bytes(b"mpp")

    mock_r2 = MagicMock()
    target_meta = SlotMetadata(
        role="target",
        package_name="com.test.app",
        version_name="1.0.0",
        version_code=100,
        container_type="APKM",
        sha256="sha_target",
        signer_sha256="sig",
        size_bytes=100,
        acquisition_source="apkeep",
        timestamp="2026-10-06T00:00:00Z",
    )
    mock_r2.get_slot_metadata.side_effect = lambda pkg, role: (
        target_meta if role == "target" else None
    )

    # Checker returns failed compatibility code
    def mock_checker(
        apk_path, mpp_path, expected_package=None, all_patches=False, force=False
    ):
        report = PatchCompatibilityReport(
            artifact_sha256="sha",
            package_name=expected_package,
            version_name="1.0.0",
            version_code=100,
            patch_bundle_version="1.4.0",
            git_revision="rev1",
            tool_versions={},
            overall_status="incompatible",
            total_cases=5,
            passed_cases=4,
            failed_cases=1,
            failure_reason="One patch failed",
        )
        return report, 1

    mock_poster = MagicMock(return_value=200)

    exit_code = run_ci_reconcile_and_test(
        pkg="com.test.app",
        mpp_path=mpp_file,
        runner_temp=runner_temp,
        r2_mgr=mock_r2,
        checker=mock_checker,
        poster=mock_poster,
    )
    # Must exit nonzero on compatibility failure even though posting succeeded
    assert exit_code != 0
    mock_poster.assert_called_once()


def test_parse_requested_roles():
    # Repository dispatch strictly requires at least one valid role
    assert parse_requested_roles("target", "repository_dispatch") == ["target"]
    with pytest.raises(ValueError, match="Invalid requested role"):
        parse_requested_roles("latest", "repository_dispatch")
    with pytest.raises(ValueError, match="Invalid requested role"):
        parse_requested_roles("target,latest", "repository_dispatch")

    with pytest.raises(ValueError, match="at least one expected role"):
        parse_requested_roles(None, "repository_dispatch")
    with pytest.raises(ValueError, match="at least one expected role"):
        parse_requested_roles("", "repository_dispatch")
    with pytest.raises(ValueError, match="Invalid requested role"):
        parse_requested_roles("invalid_role", "repository_dispatch")
    with pytest.raises(ValueError, match="Duplicate requested role"):
        parse_requested_roles("target,target", "repository_dispatch")

    # Workflow dispatch / manual has no restriction if omitted
    assert parse_requested_roles(None, "workflow_dispatch") is None
    assert parse_requested_roles("", "workflow_dispatch") is None
    assert parse_requested_roles("target", "workflow_dispatch") == ["target"]


def test_build_error_result():
    res = build_error_result(
        role="target",
        expected_version="1.54.0",
        reason="Missing target fixture in R2 slot",
        patch_bundle_version="1.4.0",
        git_revision="rev123",
    )
    assert res["role"] == "target"
    assert res["versionName"] == "1.54.0"
    assert res["versionCode"] == 0
    assert res["status"] == "error"
    assert res["passedCount"] == 0
    assert res["failedCount"] == 1
    assert res["failureReason"] == "Missing target fixture in R2 slot"
    assert res["patchBundleVersion"] == "1.4.0"
    assert res["gitRevision"] == "rev123"


def test_reconcile_and_test_target_only(monkeypatch, tmp_path):
    monkeypatch.setenv("DISPATCH_REQUEST_ID", "req-target-only")
    monkeypatch.setenv("COMPATIBILITY_STATUS_SECRET", "secret")
    monkeypatch.setattr(
        "apk_lab.compatibility_ci.get_target_version_for_package",
        lambda data, p: "1.0.0",
    )
    runner_temp = tmp_path / "runner_temp"
    runner_temp.mkdir()
    mpp_file = tmp_path / "bundle.mpp"
    mpp_file.write_bytes(b"mpp")

    mock_r2 = MagicMock()
    target_meta = SlotMetadata(
        role="target",
        package_name="com.test.app",
        version_name="1.0.0",
        version_code=100,
        container_type="APKM",
        sha256="sha_target",
        signer_sha256="sig",
        size_bytes=100,
        acquisition_source="apkeep",
        timestamp="2026-10-06T00:00:00Z",
    )
    latest_meta = SlotMetadata(
        role="latest",
        package_name="com.test.app",
        version_name="2.0.0",
        version_code=200,
        container_type="APKM",
        sha256="sha_latest",
        signer_sha256="sig",
        size_bytes=100,
        acquisition_source="apkeep",
        timestamp="2026-10-06T00:00:00Z",
    )
    mock_r2.get_slot_metadata.side_effect = lambda pkg, role: (
        target_meta if role == "target" else latest_meta
    )

    checked_roles = []

    def mock_checker(
        apk_path, mpp_path, expected_package=None, all_patches=False, force=False
    ):
        role = "latest" if force else "target"
        checked_roles.append(role)
        return (
            PatchCompatibilityReport(
                artifact_sha256="sha",
                package_name=expected_package,
                version_name="1.0.0",
                version_code=100,
                patch_bundle_version="1.4.0",
                git_revision="rev1",
                tool_versions={},
                overall_status="compatible",
                total_cases=5,
                passed_cases=5,
                failed_cases=0,
            ),
            0,
        )

    posted = []

    def mock_poster(url, secret, sub):
        posted.append(sub)
        return 200

    exit_code = run_ci_reconcile_and_test(
        pkg="com.test.app",
        mpp_path=mpp_file,
        runner_temp=runner_temp,
        r2_mgr=mock_r2,
        checker=mock_checker,
        poster=mock_poster,
        requested_roles=["target"],
    )
    assert exit_code == ExitCode.SUCCESS
    assert checked_roles == ["target"]
    assert len(posted) == 1
    assert len(posted[0]["results"]) == 1
    assert posted[0]["results"][0]["role"] == "target"


def test_reconcile_and_test_manual_no_callback_does_not_post(monkeypatch, tmp_path):
    monkeypatch.delenv("DISPATCH_REQUEST_ID", raising=False)
    monkeypatch.setenv("COMPATIBILITY_STATUS_SECRET", "secret")
    monkeypatch.setattr(
        "apk_lab.compatibility_ci.get_target_version_for_package",
        lambda data, p: "1.0.0",
    )
    runner_temp = tmp_path / "runner_temp"
    runner_temp.mkdir()
    mpp_file = tmp_path / "bundle.mpp"
    mpp_file.write_bytes(b"mpp")

    mock_r2 = MagicMock()
    target_meta = SlotMetadata(
        role="target",
        package_name="com.test.app",
        version_name="1.0.0",
        version_code=100,
        container_type="APKM",
        sha256="sha_target",
        signer_sha256="sig",
        size_bytes=100,
        acquisition_source="apkeep",
        timestamp="2026-10-06T00:00:00Z",
    )
    mock_r2.get_slot_metadata.side_effect = lambda pkg, role: (
        target_meta if role == "target" else None
    )

    def mock_checker(
        apk_path, mpp_path, expected_package=None, all_patches=False, force=False
    ):
        return (
            PatchCompatibilityReport(
                artifact_sha256="sha",
                package_name=expected_package,
                version_name="1.0.0",
                version_code=100,
                patch_bundle_version="1.4.0",
                git_revision="rev1",
                tool_versions={},
                overall_status="compatible",
                total_cases=5,
                passed_cases=5,
                failed_cases=0,
            ),
            0,
        )

    mock_poster = MagicMock()
    exit_code = run_ci_reconcile_and_test(
        pkg="com.test.app",
        mpp_path=mpp_file,
        runner_temp=runner_temp,
        r2_mgr=mock_r2,
        checker=mock_checker,
        poster=mock_poster,
    )
    assert exit_code == ExitCode.SUCCESS
    mock_poster.assert_not_called()


def test_reconcile_and_test_missing_target_fixture_posts_error(monkeypatch, tmp_path):
    monkeypatch.setenv("DISPATCH_REQUEST_ID", "req-err-target")
    monkeypatch.setenv("COMPATIBILITY_STATUS_SECRET", "secret")
    monkeypatch.setattr(
        "apk_lab.compatibility_ci.get_target_version_for_package",
        lambda data, p: "1.0.0",
    )
    runner_temp = tmp_path / "runner_temp"
    runner_temp.mkdir()
    mpp_file = tmp_path / "bundle.mpp"
    mpp_file.write_bytes(b"mpp")

    mock_r2 = MagicMock()
    mock_r2.get_slot_metadata.return_value = None  # No slots

    posted = []

    def mock_poster(url, secret, sub):
        posted.append(sub)
        return 200

    exit_code = run_ci_reconcile_and_test(
        pkg="com.test.app",
        mpp_path=mpp_file,
        runner_temp=runner_temp,
        r2_mgr=mock_r2,
        poster=mock_poster,
        requested_roles=["target"],
    )
    assert exit_code == ExitCode.INVALID_ARTIFACT
    assert len(posted) == 1
    res = posted[0]["results"]
    assert len(res) == 1
    assert res[0]["role"] == "target"
    assert res[0]["status"] == "error"
    assert "No fixture slot matches target version" in res[0]["failureReason"]
