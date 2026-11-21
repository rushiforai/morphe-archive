from __future__ import annotations

import argparse
import glob
import json
import os
import re
import subprocess
import sys
import tempfile
import urllib.error
import urllib.request
from collections.abc import Callable
from pathlib import Path
from typing import Any

from apk_lab.acquisition import AcquisitionError
from apk_lab.fixtures import R2FixtureManager, SlotMetadata
from apk_lab.inspection import InspectionError, inspect_artifact
from apk_lab.models import ExitCode, PatchCompatibilityReport
from apk_lab.morphe import load_patches_list, run_compatibility_check

PACKAGE_NAME_REGEX = re.compile(r'const\s+val\s+\w+_PACKAGE_NAME\s*=\s*"([^"]+)"')


def extract_package_from_constants(app_dir: Path) -> str | None:
    """Extracts package name from single const val *_PACKAGE_NAME in app's Constants.kt."""
    constants_file = app_dir / "shared" / "Constants.kt"
    if not constants_file.is_file():
        return None
    try:
        content = constants_file.read_text(encoding="utf-8")
    except OSError:
        return None
    matches = PACKAGE_NAME_REGEX.findall(content)
    if len(matches) == 1:
        return matches[0].strip()
    return None


def get_changed_patch_files(
    before_sha: str | None = None,
    commit_sha: str | None = None,
    repo_root: Path = Path("."),
) -> list[str] | None:
    """Gets list of changed files under patches/ between before_sha and commit_sha."""
    if not before_sha or not commit_sha:
        return None
    cleaned_before = before_sha.strip()
    if not cleaned_before or cleaned_before.replace("0", "") == "":
        return None
    try:
        res = subprocess.run(
            [
                "git",
                "diff",
                "--name-only",
                cleaned_before,
                commit_sha,
                "--",
                "patches/",
            ],
            cwd=repo_root,
            capture_output=True,
            text=True,
            check=False,
        )
        if res.returncode != 0:
            return None
        return [line.strip() for line in res.stdout.splitlines() if line.strip()]
    except Exception:  # noqa: BLE001
        return None


def resolve_matrix_packages(
    patches_data: dict[str, Any],
    event_name: str,
    dispatch_pkg: str | None = None,
    input_pkg: str | None = None,
    changed_paths: list[str] | None = None,
    patches_root: Path = Path("patches"),
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

    if event_name == "workflow_dispatch":
        pkg = (input_pkg or "all").strip()
        if pkg and pkg != "all":
            if pkg not in known:
                raise ValueError(f"Unknown package in workflow dispatch: {pkg}")
            return [pkg]
        return known

    if event_name == "push":
        if changed_paths is None or len(changed_paths) == 0:
            return known

        selected_packages: set[str] = set()
        app_base = (
            patches_root / "src" / "main" / "kotlin" / "app" / "aidan" / "patches"
        )

        for raw_path in changed_paths:
            norm_path = raw_path.replace("\\", "/").strip().lstrip("/")
            prefix = "patches/src/main/kotlin/app/aidan/patches/"
            if not norm_path.startswith(prefix):
                # Any change outside app directories (build.gradle.kts, util, etc.) fans out to all
                return known

            rel = norm_path[len(prefix) :]
            parts = rel.split("/", 1)
            if not parts[0]:
                return known
            app_slug = parts[0]
            app_dir = app_base / app_slug
            if not app_dir.is_dir():
                return known

            extracted_pkg = extract_package_from_constants(app_dir)
            if not extracted_pkg or extracted_pkg not in known:
                return known

            selected_packages.add(extracted_pkg)

        if not selected_packages:
            return known
        return sorted(selected_packages)

    # Legacy or fallback
    pkg = (dispatch_pkg or "").strip()
    if pkg:
        if pkg not in known:
            raise ValueError(f"Unknown package: {pkg}")
        return [pkg]
    return known


def get_target_version_for_package(
    patches_data: dict[str, Any], package_name: str
) -> str:
    """Finds the highest target version for a package in patches-list.json."""
    meta = get_package_run_metadata(patches_data, package_name)
    return meta["targetVersion"]


def get_package_run_metadata(
    patches_data: dict[str, Any], package_name: str
) -> dict[str, Any]:
    """Extracts appName, latest targetVersion, and supportedVersions for a package."""
    app_name = ""
    target_versions: set[str] = set()
    for p in patches_data.get("patches", []):
        for cp in p.get("compatiblePackages", []):
            if cp.get("packageName") == package_name:
                if not app_name and cp.get("name"):
                    app_name = cp["name"]
                for t in cp.get("targets", []):
                    if t.get("version"):
                        target_versions.add(t["version"])

    def version_key(v: str) -> list[int]:
        clean = re.sub(r"^v", "", v, flags=re.IGNORECASE).split("-")[0].split("+")[0]
        return [int(x) for x in re.findall(r"\d+", clean)] or [0]

    sorted_versions = sorted(target_versions, key=lambda v: (version_key(v), v))
    latest_target = sorted_versions[-1] if sorted_versions else ""
    return {
        "packageName": package_name,
        "appName": app_name or package_name,
        "targetVersion": latest_target,
        "supportedVersions": sorted_versions,
    }


def parse_requested_roles(
    raw_roles: str | None, event_name: str | None = None
) -> list[str] | None:
    """Parses requested roles strictly."""
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
    failure_stage: str = "pipeline",
    patch_bundle_version: str = "unknown",
    git_revision: str = "unknown",
    failed_count: int = 0,
) -> dict[str, Any]:
    """Builds a terminal error result item with exact failureStage."""
    return {
        "role": role,
        "versionName": expected_version,
        "versionCode": 0,
        "patchBundleVersion": patch_bundle_version,
        "gitRevision": git_revision,
        "status": "error",
        "passedCount": 0,
        "failedCount": failed_count,
        "failureReason": reason,
        "failureStage": failure_stage,
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

    res = {
        "role": role,
        "versionName": report.version_name,
        "versionCode": report.version_code,
        "patchBundleVersion": report.patch_bundle_version,
        "gitRevision": report.git_revision,
        "status": status,
        "passedCount": report.passed_cases,
        "failedCount": report.failed_cases,
        "failureReason": report.failure_reason,
        "workflowRunUrl": (
            os.environ.get("GITHUB_SERVER_URL", "https://github.com")
            + f"/{os.environ.get('GITHUB_REPOSITORY', '')}/actions/runs/{os.environ.get('GITHUB_RUN_ID', '')}"
            if os.environ.get("GITHUB_RUN_ID")
            else None
        ),
    }
    if status == "error":
        res["failureStage"] = "compatibility-check"
    return res


def post_run_start(
    worker_url: str,
    status_secret: str,
    payload: dict[str, Any],
) -> int:
    """Posts run-start payload to Worker, returning the HTTP response status."""
    req = urllib.request.Request(
        f"{worker_url.rstrip('/')}/api/compatibility-runs",
        data=json.dumps(payload).encode("utf-8"),
        headers={
            "Content-Type": "application/json",
            "Authorization": f"Bearer {status_secret}",
            "User-Agent": "aidans-patches-ci/1.0",
        },
    )
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.status


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
    patches_data: dict[str, Any] | None = None,
) -> int:
    """Executes CI acquisition, R2 seeding, download, and Morphe target check for a package."""
    if patches_data is None:
        patches_data = load_patches_list()
    target_version = get_target_version_for_package(patches_data, pkg)
    patch_bundle_version = patches_data.get("version", "unknown")
    git_revision = os.environ.get("GITHUB_SHA", "unknown")

    if not target_version:
        print(f"Error: No target version declared for package {pkg}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR

    event_name = os.environ.get("GITHUB_EVENT_NAME", "workflow_dispatch")
    if requested_roles is None and "DISPATCH_EXPECTED_ROLES" in os.environ:
        requested_roles = parse_requested_roles(
            os.environ.get("DISPATCH_EXPECTED_ROLES"), event_name=event_name
        )

    print(
        f"Checking {pkg} with target version {target_version}, "
        f"requested_roles={requested_roles}"
    )

    if r2_mgr is None:
        r2_mgr = R2FixtureManager()
    if checker is None:
        checker = run_compatibility_check
    if poster is None:
        poster = post_compatibility_submission

    dispatch_request_id = (os.environ.get("DISPATCH_REQUEST_ID") or "").strip()
    status_secret = os.environ.get("COMPATIBILITY_STATUS_SECRET")
    worker_url = os.environ.get(
        "WORKER_STATUS_URL",
        "https://aidans-patches-worker.aidan-is-confused.workers.dev",
    )

    results: list[dict[str, Any]] = []
    overall_exit = ExitCode.SUCCESS

    # 1. R2 metadata lookup for target and latest slots
    latest_slot: SlotMetadata | None = None
    target_slot: SlotMetadata | None = None
    try:
        latest_slot = r2_mgr.get_slot_metadata(pkg, "latest")
        target_slot = r2_mgr.get_slot_metadata(pkg, "target")
    except Exception as err:  # noqa: BLE001
        print(f"R2 lookup error for {pkg}: {err}", file=sys.stderr)
        results.append(
            build_error_result(
                "target",
                target_version,
                f"R2 fixture lookup failed: {err}",
                failure_stage="r2-lookup",
                patch_bundle_version=patch_bundle_version,
                git_revision=git_revision,
            )
        )
        overall_exit = ExitCode.INFRASTRUCTURE_FAILURE

    # 2. Check if either slot matches target_version; if not, acquire and upload
    matched_slot_role: str | None = None
    matched_slot_meta: SlotMetadata | None = None
    local_target_artifact: Path | None = None

    if overall_exit == ExitCode.SUCCESS:
        if target_slot and target_slot.version_name == target_version:
            matched_slot_role = "target"
            matched_slot_meta = target_slot
        elif latest_slot and latest_slot.version_name == target_version:
            matched_slot_role = "latest"
            matched_slot_meta = latest_slot

        if matched_slot_role is None:
            # Must acquire exact target_version
            print(
                f"No R2 fixture matches {pkg} v{target_version} "
                f"(target={target_slot.version_name if target_slot else 'absent'}, "
                f"latest={latest_slot.version_name if latest_slot else 'absent'}); "
                "attempting acquisition..."
            )
            if acquirer is None:
                has_creds = bool(os.environ.get("APKEEP_ACCOUNTS")) or bool(
                    os.environ.get("R2_ACCESS_KEY_ID")
                )
                if not has_creds:
                    reason = f"No fixture slot matches target version '{target_version}' and no acquisition credentials configured"
                    print(f"Error: {reason}", file=sys.stderr)
                    results.append(
                        build_error_result(
                            "target",
                            target_version,
                            reason,
                            failure_stage="acquisition",
                            patch_bundle_version=patch_bundle_version,
                            git_revision=git_revision,
                        )
                    )
                    overall_exit = ExitCode.INVALID_ARTIFACT
                else:
                    from apk_lab.acquisition import acquire_artifact

                    acquirer = acquire_artifact

            if overall_exit == ExitCode.SUCCESS and acquirer is not None:
                dl_dir = runner_temp / f"{pkg}-acquire"
                try:
                    acquired_path, src = acquirer(
                        pkg, dl_dir, expected_version=target_version
                    )
                    inspection = inspect_artifact(acquired_path)
                    if inspection.version_name != target_version:
                        raise AcquisitionError(
                            f"Acquired version '{inspection.version_name}' != expected '{target_version}'",
                            ExitCode.INVALID_ARTIFACT,
                        )
                    print(
                        f"Acquired {pkg} v{target_version} via {src}: {acquired_path}"
                    )
                except (
                    AcquisitionError,
                    InspectionError,
                    OSError,
                    ValueError,
                    RuntimeError,
                ) as err:
                    print(
                        f"Acquisition error for {pkg} v{target_version}: {err}",
                        file=sys.stderr,
                    )
                    results.append(
                        build_error_result(
                            "target",
                            target_version,
                            f"Target acquisition failed: {err}",
                            failure_stage="acquisition",
                            patch_bundle_version=patch_bundle_version,
                            git_revision=git_revision,
                        )
                    )
                    overall_exit = ExitCode.INVALID_ARTIFACT

            # 3. Upload acquired artifact to Cloudflare R2 target slot
            if overall_exit == ExitCode.SUCCESS:
                try:
                    uploaded_meta = r2_mgr.seed_fixture(pkg, "target", acquired_path)
                    matched_slot_role = "target"
                    matched_slot_meta = uploaded_meta
                    local_target_artifact = acquired_path
                except Exception as err:  # noqa: BLE001
                    print(
                        f"R2 upload error for {pkg} target slot: {err}",
                        file=sys.stderr,
                    )
                    results.append(
                        build_error_result(
                            "target",
                            target_version,
                            f"R2 fixture upload failed: {err}",
                            failure_stage="r2-upload",
                            patch_bundle_version=patch_bundle_version,
                            git_revision=git_revision,
                        )
                    )
                    overall_exit = ExitCode.INFRASTRUCTURE_FAILURE

    # 4. Download artifact from R2 (or reuse freshly seeded local artifact)
    if overall_exit == ExitCode.SUCCESS:
        if matched_slot_meta is None or matched_slot_role is None:
            reason = f"No fixture slot matches target version '{target_version}'"
            results.append(
                build_error_result(
                    "target",
                    target_version,
                    reason,
                    failure_stage="r2-lookup",
                    patch_bundle_version=patch_bundle_version,
                    git_revision=git_revision,
                )
            )
            overall_exit = ExitCode.INVALID_ARTIFACT
        else:
            if local_target_artifact is None or not local_target_artifact.is_file():
                target_ext = ".apk"
                if matched_slot_meta.container_type:
                    raw_type = matched_slot_meta.container_type.lower().lstrip(".")
                    if raw_type in ("apk", "apkm", "xapk", "apks"):
                        target_ext = f".{raw_type}"
                else:
                    for p in patches_data.get("patches", []):
                        for cp in p.get("compatiblePackages", []):
                            if cp.get("packageName") == pkg and cp.get("apkFileType"):
                                raw_type = cp["apkFileType"].lower().lstrip(".")
                                if raw_type in ("apk", "apkm", "xapk", "apks"):
                                    target_ext = f".{raw_type}"
                                    break

                dest_file = runner_temp / f"{pkg}-target{target_ext}"
                try:
                    r2_mgr.download_slot(pkg, matched_slot_role, dest_file)
                    local_target_artifact = dest_file
                except Exception as err:  # noqa: BLE001
                    print(
                        f"R2 download error for {pkg} slot '{matched_slot_role}': {err}",
                        file=sys.stderr,
                    )
                    results.append(
                        build_error_result(
                            "target",
                            target_version,
                            f"R2 fixture download failed: {err}",
                            failure_stage="r2-download",
                            patch_bundle_version=patch_bundle_version,
                            git_revision=git_revision,
                        )
                    )
                    overall_exit = ExitCode.INFRASTRUCTURE_FAILURE

    # 5. Run Morphe compatibility check
    if overall_exit == ExitCode.SUCCESS:
        assert local_target_artifact is not None
        try:
            t_report, t_code = checker(
                local_target_artifact, mpp_path, expected_package=pkg, all_patches=True
            )
            print(
                f"Target compatibility: {t_report.overall_status} "
                f"({t_report.passed_cases}/{t_report.total_cases})"
            )
            if t_report.failure_reason:
                print(
                    f"Target failure details: {t_report.failure_reason}",
                    file=sys.stderr,
                )
            results.append(build_result_item("target", t_report))
            if t_code != 0 or t_report.overall_status != "compatible":
                overall_exit = t_code or ExitCode.USAGE_OR_TOOL_ERROR
        except Exception as err:  # noqa: BLE001
            print(f"Compatibility check error for {pkg}: {err}", file=sys.stderr)
            results.append(
                build_error_result(
                    "target",
                    target_version,
                    f"Compatibility check execution failed: {err}",
                    failure_stage="compatibility-check",
                    patch_bundle_version=patch_bundle_version,
                    git_revision=git_revision,
                )
            )
            overall_exit = ExitCode.USAGE_OR_TOOL_ERROR

    # 6. Save and post batched results
    submission: dict[str, Any] | None = None
    if dispatch_request_id:
        submission = {
            "requestId": dispatch_request_id,
            "packageName": pkg,
            "results": results,
        }
        submission_path_env = os.environ.get("COMPATIBILITY_SUBMISSION_PATH")
        if submission_path_env:
            sub_path = Path(submission_path_env)
            sub_path.parent.mkdir(parents=True, exist_ok=True)
            tmp_path = sub_path.with_name(f"{sub_path.name}.tmp.{os.getpid()}")
            with open(tmp_path, "w", encoding="utf-8") as f:
                json.dump(submission, f, indent=2)
            os.replace(tmp_path, sub_path)

    if status_secret and worker_url and dispatch_request_id and submission is not None:
        try:
            status_code = poster(worker_url, status_secret, submission)
            if 200 <= status_code < 300:
                print(f"Posted {len(results)} results to worker: HTTP {status_code}")
                marker_path_env = os.environ.get("COMPATIBILITY_CALLBACK_MARKER")
                if marker_path_env:
                    m_path = Path(marker_path_env)
                    m_path.parent.mkdir(parents=True, exist_ok=True)
                    m_path.write_text("ok", encoding="utf-8")
            else:
                print(
                    f"Worker rejected results with status code HTTP {status_code}",
                    file=sys.stderr,
                )
                if overall_exit == ExitCode.SUCCESS:
                    overall_exit = ExitCode.INFRASTRUCTURE_FAILURE
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
    p_matrix.add_argument("--patches-list", help="Path to patches-list.json")
    p_matrix.add_argument(
        "--changed-files", help="Comma- or newline-separated list of changed files"
    )

    p_start = subparsers.add_parser("start", help="Post run-start to Worker")
    p_start.add_argument("--package", required=True, help="Package name")
    p_start.add_argument("--request-id", required=True, help="Request ID")
    p_start.add_argument("--git-revision", required=True, help="Git revision")
    p_start.add_argument("--patches-list", help="Path to patches-list.json")

    p_run = subparsers.add_parser("run", help="Run compatibility check for package")
    p_run.add_argument("--package", required=True, help="Package name")
    p_run.add_argument("--mpp", help="Path to .mpp patch bundle")
    p_run.add_argument("--patches-list", help="Path to patches-list.json")

    args = parser.parse_args(argv)

    if args.subcommand == "matrix":
        patches_path = Path(args.patches_list) if args.patches_list else None
        data = load_patches_list(patches_path) if patches_path else load_patches_list()
        event_name = os.environ.get("GITHUB_EVENT_NAME", "workflow_dispatch")
        dispatch_pkg = os.environ.get("DISPATCH_PACKAGE_NAME")
        input_pkg = os.environ.get("INPUT_PACKAGE_NAME")

        changed_paths: list[str] | None = None
        if args.changed_files:
            changed_paths = [
                f.strip() for f in re.split(r"[,\n]", args.changed_files) if f.strip()
            ]
        elif event_name == "push":
            before_sha = os.environ.get("BEFORE_SHA")
            commit_sha = os.environ.get("COMMIT_SHA") or os.environ.get("GITHUB_SHA")
            changed_paths = get_changed_patch_files(before_sha, commit_sha)

        try:
            selected = resolve_matrix_packages(
                data,
                event_name,
                dispatch_pkg=dispatch_pkg,
                input_pkg=input_pkg,
                changed_paths=changed_paths,
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

    if args.subcommand == "start":
        patches_path = Path(args.patches_list) if args.patches_list else None
        data = load_patches_list(patches_path) if patches_path else load_patches_list()
        meta = get_package_run_metadata(data, args.package)
        status_secret = os.environ.get("COMPATIBILITY_STATUS_SECRET")
        worker_url = os.environ.get(
            "WORKER_STATUS_URL",
            "https://aidans-patches-worker.aidan-is-confused.workers.dev",
        )
        if not status_secret:
            print(
                "Missing COMPATIBILITY_STATUS_SECRET; cannot post run start.",
                file=sys.stderr,
            )
            return ExitCode.USAGE_OR_TOOL_ERROR

        payload = {
            "requestId": args.request_id,
            "packageName": meta["packageName"],
            "appName": meta["appName"],
            "targetVersion": meta["targetVersion"],
            "supportedVersions": meta["supportedVersions"],
            "gitRevision": args.git_revision,
        }
        try:
            status_code = post_run_start(worker_url, status_secret, payload)
            if 200 <= status_code < 300:
                print(f"Registered run start for {args.package}: HTTP {status_code}")
                return ExitCode.SUCCESS
            print(f"Worker rejected run start with HTTP {status_code}", file=sys.stderr)
            return ExitCode.INFRASTRUCTURE_FAILURE
        except Exception as err:  # noqa: BLE001
            print(f"Failed to post run start to Worker: {err}", file=sys.stderr)
            return ExitCode.INFRASTRUCTURE_FAILURE

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

        patches_path = Path(args.patches_list) if args.patches_list else None
        patches_data = (
            load_patches_list(patches_path) if patches_path else load_patches_list()
        )

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
        return run_ci_reconcile_and_test(
            args.package,
            mpp_path,
            runner_temp,
            requested_roles=requested_roles,
            observed_play_version=observed_play_version,
            patches_data=patches_data,
        )

    return ExitCode.SUCCESS


if __name__ == "__main__":
    sys.exit(main())
