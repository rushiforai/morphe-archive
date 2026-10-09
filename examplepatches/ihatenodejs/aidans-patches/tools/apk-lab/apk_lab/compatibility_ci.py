from __future__ import annotations

import argparse
import glob
import json
import os
import sys
import tempfile
import urllib.error
import urllib.request
from collections.abc import Callable
from pathlib import Path
from typing import Any

from apk_lab.acquisition import AcquisitionError
from apk_lab.fixtures import R2FixtureManager, SlotMetadata
from apk_lab.inspection import InspectionError
from apk_lab.models import ExitCode, PatchCompatibilityReport
from apk_lab.morphe import load_patches_list, run_compatibility_check


def resolve_matrix_packages(
    patches_data: dict[str, Any],
    event_name: str,
    dispatch_pkg: str | None = None,
    input_pkg: str | None = None,
) -> list[str]:
    """Resolves target packages for the CI matrix, rejecting unknown packages."""
    known = sorted(
        {
            cp["packageName"]
            for p in patches_data.get("patches", [])
            for cp in p.get("compatiblePackages", [])
            if cp.get("packageName")
        }
    )

    if event_name == "repository_dispatch":
        pkg = (dispatch_pkg or "").strip()
        if pkg:
            if pkg not in known:
                raise ValueError(f"Unknown package in repository dispatch: {pkg}")
            return [pkg]
        return known

    if event_name == "workflow_dispatch":
        pkg = (input_pkg or "all").strip()
        if pkg and pkg != "all":
            if pkg not in known:
                raise ValueError(f"Unknown package in workflow dispatch: {pkg}")
            return [pkg]
        return known

    return known


def get_target_version_for_package(
    patches_data: dict[str, Any], package_name: str
) -> str:
    """Finds the highest target version for a package in patches-list.json."""
    target_versions: set[str] = set()
    for p in patches_data.get("patches", []):
        for cp in p.get("compatiblePackages", []):
            if cp.get("packageName") == package_name:
                for t in cp.get("targets", []):
                    if t.get("version"):
                        target_versions.add(t["version"])
    return max(target_versions) if target_versions else ""


def parse_requested_roles(
    raw_roles: str | None, event_name: str | None = None
) -> list[str] | None:
    """Parses requested roles strictly.

    For repository_dispatch: requires at least one role from {'target', 'latest'}, no duplicates.
    For workflow_dispatch or manual: if raw_roles is None or empty, returns None (no restriction).
    If raw_roles is provided, validates strictly.
    """
    if raw_roles is None or not raw_roles.strip():
        if event_name == "repository_dispatch":
            raise ValueError(
                "Repository dispatch must specify at least one expected role in DISPATCH_EXPECTED_ROLES"
            )
        return None

    tokens = [r.strip() for r in raw_roles.split(",") if r.strip()]
    if not tokens:
        if event_name == "repository_dispatch":
            raise ValueError(
                "Repository dispatch must specify at least one expected role in DISPATCH_EXPECTED_ROLES"
            )
        return None

    valid_roles = {"target"}
    seen: set[str] = set()
    result: list[str] = []
    for token in tokens:
        if token not in valid_roles:
            raise ValueError(
                f"Invalid requested role '{token}'; must be one of {sorted(valid_roles)}"
            )
        if token in seen:
            raise ValueError(f"Duplicate requested role '{token}'")
        seen.add(token)
        result.append(token)

    return result


def build_error_result(
    role: str,
    expected_version: str,
    reason: str,
    patch_bundle_version: str = "unknown",
    git_revision: str = "unknown",
) -> dict[str, Any]:
    """Builds a terminal error result item for a role when fixture is missing or mismatched."""
    return {
        "role": role,
        "versionName": expected_version,
        "versionCode": 0,
        "patchBundleVersion": patch_bundle_version,
        "gitRevision": git_revision,
        "status": "error",
        "passedCount": 0,
        "failedCount": 1,
        "failureReason": reason,
        "workflowRunUrl": (
            os.environ.get("GITHUB_SERVER_URL", "https://github.com")
            + f"/{os.environ.get('GITHUB_REPOSITORY', '')}/actions/runs/{os.environ.get('GITHUB_RUN_ID', '')}"
            if os.environ.get("GITHUB_RUN_ID")
            else None
        ),
    }


def build_result_item(role: str, report: PatchCompatibilityReport) -> dict[str, Any]:
    """Builds a single role result item matching CompatibilityResultInput."""
    status = report.overall_status
    if status not in ("compatible", "incompatible", "error"):
        status = "error" if report.failed_cases > 0 else "compatible"

    return {
        "role": role,
        "versionName": report.version_name,
        "versionCode": report.version_code,
        "patchBundleVersion": report.patch_bundle_version,
        "gitRevision": report.git_revision,
        "status": status,
        "passedCount": report.passed_cases,
        "failedCount": report.failed_cases,
        "workflowRunUrl": os.environ.get("GITHUB_SERVER_URL", "https://github.com")
        + f"/{os.environ.get('GITHUB_REPOSITORY', '')}/actions/runs/{os.environ.get('GITHUB_RUN_ID', '')}"
        if os.environ.get("GITHUB_RUN_ID")
        else None,
    }


def post_compatibility_submission(
    worker_url: str,
    status_secret: str,
    submission: dict[str, Any],
) -> int:
    """Posts a batched submission to the Worker, returning the HTTP response status."""
    req = urllib.request.Request(
        f"{worker_url.rstrip('/')}/api/compatibility-results",
        data=json.dumps(submission).encode("utf-8"),
        headers={
            "Content-Type": "application/json",
            "Authorization": f"Bearer {status_secret}",
            "User-Agent": "aidans-patches-ci/1.0",
        },
    )
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.status


def run_ci_reconcile_and_test(
    pkg: str,
    mpp_path: Path,
    runner_temp: Path,
    r2_mgr: Any = None,
    acquirer: Callable[..., Any] | None = None,
    checker: Callable[..., Any] | None = None,
    poster: Callable[..., Any] | None = None,
    requested_roles: list[str] | None = None,
    observed_play_version: str | None = None,
) -> int:
    """Executes CI acquisition, rotation, target check, and latest check for a package."""
    patches_data = load_patches_list()
    target_version = get_target_version_for_package(patches_data, pkg)
    patch_bundle_version = patches_data.get("version", "unknown")
    git_revision = os.environ.get("GITHUB_SHA", "unknown")

    event_name = os.environ.get("GITHUB_EVENT_NAME", "workflow_dispatch")
    if requested_roles is None and "DISPATCH_EXPECTED_ROLES" in os.environ:
        requested_roles = parse_requested_roles(
            os.environ.get("DISPATCH_EXPECTED_ROLES"), event_name=event_name
        )
    if observed_play_version is None:
        observed_play_version = (
            os.environ.get("DISPATCH_PLAY_VERSION") or ""
        ).strip() or None

    print(
        f"Checking {pkg} with target version {target_version}, "
        f"requested_roles={requested_roles}, observed_play_version={observed_play_version}"
    )

    if r2_mgr is None:
        r2_mgr = R2FixtureManager()
    if checker is None:
        checker = run_compatibility_check
    if poster is None:
        poster = post_compatibility_submission

    dispatch_request_id = (os.environ.get("DISPATCH_REQUEST_ID") or "").strip()
    status_secret = os.environ.get("COMPATIBILITY_STATUS_SECRET")
    worker_url = os.environ.get("WORKER_STATUS_URL", "https://worker.patch.p0ntus.com")

    latest_slot: SlotMetadata | None = r2_mgr.get_slot_metadata(pkg, "latest")
    target_slot: SlotMetadata | None = r2_mgr.get_slot_metadata(pkg, "target")

    # 1. Acquire new latest if credentials present
    acquired_play_version: str | None = None
    acquired_artifact_path: Path | None = None
    has_creds = bool(os.environ.get("APKEEP_EMAIL")) or bool(
        os.environ.get("R2_ACCESS_KEY_ID")
    )
    if has_creds:
        try:
            if acquirer is None:
                from apk_lab.acquisition import acquire_artifact

                acquirer = acquire_artifact

            dl_dir = runner_temp / f"{pkg}-acquire"
            new_latest_path, src = acquirer(pkg, dl_dir)
            print(f"Acquired {pkg} via {src}: {new_latest_path}")
            acquired_artifact_path = new_latest_path
            new_latest_meta, updated_target_meta = r2_mgr.rotate_slots_on_new_latest(
                pkg,
                new_latest_path,
                target_version,
                source=getattr(src, "value", str(src)),
            )
            latest_slot = new_latest_meta
            if new_latest_meta and new_latest_meta.version_name:
                acquired_play_version = new_latest_meta.version_name
            if updated_target_meta:
                target_slot = updated_target_meta
        except (
            AcquisitionError,
            InspectionError,
            OSError,
            ValueError,
            RuntimeError,
        ) as e:
            print(f"Acquisition or rotation warning: {e}", file=sys.stderr)

    results: list[dict[str, Any]] = []
    overall_exit = ExitCode.SUCCESS

    # Determine roles to test: only target is tested
    should_test_target = (
        True if requested_roles is None else ("target" in requested_roles)
    )

    # 2. Target check
    if should_test_target:
        target_slot_role: str | None = None
        if target_slot and target_slot.version_name == target_version:
            target_slot_role = "target"
        elif latest_slot and latest_slot.version_name == target_version:
            target_slot_role = "latest"

        if target_slot_role is not None:
            target_file = runner_temp / f"{pkg}-target.apk"
            try:
                if (
                    acquired_artifact_path
                    and acquired_play_version == target_version
                    and acquired_artifact_path.exists()
                ):
                    target_file = acquired_artifact_path
                else:
                    r2_mgr.download_slot(pkg, target_slot_role, target_file)
                t_report, t_code = checker(
                    target_file, mpp_path, expected_package=pkg, all_patches=True
                )
                print(
                    f"Target compatibility: {t_report.overall_status} "
                    f"({t_report.passed_cases}/{t_report.total_cases})"
                )
                results.append(build_result_item("target", t_report))
                if t_code != 0 or t_report.overall_status != "compatible":
                    overall_exit = t_code or ExitCode.USAGE_OR_TOOL_ERROR
            except Exception as err:  # noqa: BLE001
                print(f"Error checking target fixture: {err}", file=sys.stderr)
                results.append(
                    build_error_result(
                        "target",
                        target_version,
                        f"Target check execution failed: {err}",
                        patch_bundle_version=patch_bundle_version,
                        git_revision=git_revision,
                    )
                )
                overall_exit = ExitCode.USAGE_OR_TOOL_ERROR
        else:
            reason = (
                f"No fixture slot matches target version '{target_version}': "
                f"target_slot={getattr(target_slot, 'version_name', None)}, "
                f"latest_slot={getattr(latest_slot, 'version_name', None)}"
            )
            print(f"Error: {reason}", file=sys.stderr)
            results.append(
                build_error_result(
                    "target",
                    target_version,
                    reason,
                    patch_bundle_version=patch_bundle_version,
                    git_revision=git_revision,
                )
            )
            overall_exit = ExitCode.INVALID_ARTIFACT
    # 4. Post batched results only when both status_secret and dispatch_request_id are present
    if status_secret and worker_url and dispatch_request_id:
        submission = {
            "requestId": dispatch_request_id,
            "packageName": pkg,
            "acquiredPlayVersion": acquired_play_version,
            "results": results,
        }
        try:
            status_code = poster(worker_url, status_secret, submission)
            print(f"Posted {len(results)} results to worker: HTTP {status_code}")
        except (urllib.error.URLError, TimeoutError, OSError, ValueError) as err:
            print(f"Failed to post results to worker: {err}", file=sys.stderr)
            if overall_exit == ExitCode.SUCCESS:
                overall_exit = ExitCode.INFRASTRUCTURE_FAILURE
    else:
        if not dispatch_request_id:
            print("No DISPATCH_REQUEST_ID provided; skipping worker callback.")

    return overall_exit


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="APK Lab CI Orchestration Helper")
    subparsers = parser.add_subparsers(dest="subcommand", required=True)

    p_matrix = subparsers.add_parser("matrix", help="Compute package matrix")
    p_matrix.add_argument("--output-file", help="File to write GITHUB_OUTPUT to")

    p_run = subparsers.add_parser("run", help="Run compatibility check for package")
    p_run.add_argument("--package", required=True, help="Package name")
    p_run.add_argument("--mpp", help="Path to .mpp patch bundle")

    args = parser.parse_args(argv)

    if args.subcommand == "matrix":
        data = load_patches_list()
        event_name = os.environ.get("GITHUB_EVENT_NAME", "workflow_dispatch")
        dispatch_pkg = os.environ.get("DISPATCH_PACKAGE_NAME")
        input_pkg = os.environ.get("INPUT_PACKAGE_NAME")

        try:
            selected = resolve_matrix_packages(
                data, event_name, dispatch_pkg=dispatch_pkg, input_pkg=input_pkg
            )
        except ValueError as e:
            print(f"Matrix resolution error: {e}", file=sys.stderr)
            return ExitCode.USAGE_OR_TOOL_ERROR

        matrix_json = json.dumps(selected)
        print(f"packages={matrix_json}")
        if args.output_file:
            with open(args.output_file, "a", encoding="utf-8") as f:
                f.write(f"packages={matrix_json}\n")
        return ExitCode.SUCCESS

    if args.subcommand == "run":
        mpp_path = None
        if args.mpp:
            mpp_path = Path(args.mpp).resolve()
        else:
            mpp_files = sorted(glob.glob("patches/build/libs/patches-*.mpp"))
            if mpp_files:
                mpp_path = Path(mpp_files[-1]).resolve()

        if not mpp_path or not mpp_path.is_file():
            print("Error: No MPP bundle found in patches/build/libs/", file=sys.stderr)
            return ExitCode.USAGE_OR_TOOL_ERROR

        runner_temp = Path(os.environ.get("RUNNER_TEMP", tempfile.gettempdir()))
        event_name = os.environ.get("GITHUB_EVENT_NAME", "workflow_dispatch")
        raw_roles = os.environ.get("DISPATCH_EXPECTED_ROLES")
        try:
            requested_roles = parse_requested_roles(raw_roles, event_name=event_name)
        except ValueError as e:
            print(f"Role parsing error: {e}", file=sys.stderr)
            return ExitCode.USAGE_OR_TOOL_ERROR

        observed_play_version = (
            os.environ.get("DISPATCH_PLAY_VERSION") or ""
        ).strip() or None
        runner_temp = Path(os.environ.get("RUNNER_TEMP", tempfile.gettempdir()))
        return run_ci_reconcile_and_test(
            args.package,
            mpp_path,
            runner_temp,
            requested_roles=requested_roles,
            observed_play_version=observed_play_version,
        )

    return ExitCode.SUCCESS


if __name__ == "__main__":
    sys.exit(main())
