from __future__ import annotations

import hashlib
import json
import logging
import re
import subprocess
import tempfile
import time
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from apk_lab.archives import ArchiveSecurityError, inspect_safe_zip
from apk_lab.inspection import (
    InspectionError,
    find_build_tools_bin,
    inspect_artifact,
)
from apk_lab.models import (
    ArtifactInspection,
    ExitCode,
    PatchCompatibilityReport,
    PatchTestCaseResult,
)
from apk_lab.tools import ToolManager
from apk_lab.workspace import WorkspaceManager

logger = logging.getLogger(__name__)


DEFAULT_PATCHES_LIST_PATH = (
    Path(__file__).parent.parent.parent.parent / "patches-list.json"
)


def is_patchable_member(name: str) -> bool:
    """Whether a member can be changed by a patch and must count toward the check postcondition."""
    return (
        name == "AndroidManifest.xml"
        or name == "resources.arsc"
        or name.endswith(".dex")
        or name.startswith(("res/", "assets/", "lib/"))
    )


@dataclass
class PatchOptionDef:
    key: str
    title: str
    description: str
    required: bool
    default: Any
    type: str


@dataclass
class PatchDef:
    name: str
    description: str
    default: bool
    dependencies: list[str]
    options: list[PatchOptionDef]


@dataclass
class PatchTestCase:
    patch_name: str
    options: dict[str, Any]
    dependencies: list[str]


def load_patches_list(path: Path | None = None) -> dict[str, Any]:
    file_path = (path or DEFAULT_PATCHES_LIST_PATH).resolve()
    if not file_path.is_file():
        raise FileNotFoundError(f"patches-list.json not found at {file_path}")
    with open(file_path, "r", encoding="utf-8") as f:
        return json.load(f)


def get_compatible_patches(
    package_name: str,
    patches_list_data: dict[str, Any],
    requested_patches: list[str] | None = None,
    all_patches: bool = False,
) -> list[PatchDef]:
    """Finds all patches compatible with a package and filters by request."""
    compatible: list[PatchDef] = []
    raw_patches = patches_list_data.get("patches", [])

    for p in raw_patches:
        is_compat = any(
            cp.get("packageName") == package_name
            for cp in p.get("compatiblePackages", [])
        )
        if not is_compat:
            continue

        opts: list[PatchOptionDef] = []
        for o in p.get("options", []):
            opts.append(
                PatchOptionDef(
                    key=o["key"],
                    title=o.get("title", ""),
                    description=o.get("description", ""),
                    required=o.get("required", False),
                    default=o.get("default"),
                    type=o.get("type", "String"),
                )
            )

        p_def = PatchDef(
            name=p["name"],
            description=p.get("description", ""),
            default=p.get("default", True),
            dependencies=p.get("dependencies", []),
            options=opts,
        )

        if requested_patches:
            if p_def.name in requested_patches:
                compatible.append(p_def)
        elif all_patches or p_def.default:
            compatible.append(p_def)

    return compatible


def generate_test_cases(patch: PatchDef) -> list[PatchTestCase]:
    """Generates default test case plus one boundary case per boolean option."""
    default_options: dict[str, Any] = {}
    for opt in patch.options:
        default_options[opt.key] = opt.default

    cases: list[PatchTestCase] = [
        PatchTestCase(
            patch_name=patch.name,
            options=dict(default_options),
            dependencies=patch.dependencies,
        )
    ]

    # Boundary cases: invert each boolean option independently
    for opt in patch.options:
        is_bool = isinstance(opt.default, bool) or "Boolean" in opt.type
        if is_bool and isinstance(opt.default, bool):
            boundary_opts = dict(default_options)
            boundary_opts[opt.key] = not opt.default
            cases.append(
                PatchTestCase(
                    patch_name=patch.name,
                    options=boundary_opts,
                    dependencies=patch.dependencies,
                )
            )

    return cases


def verify_sdk_dex(apk_path: Path) -> tuple[bool, str | None]:
    """Runs dexdump -c on every DEX inside the APK to verify structural validity."""
    try:
        dexdump = find_build_tools_bin("dexdump")
    except InspectionError as e:
        return False, f"Could not locate dexdump: {e}"

    with zipfile.ZipFile(apk_path, "r") as zf:
        dex_entries = [name for name in zf.namelist() if name.endswith(".dex")]
        if not dex_entries:
            return False, "No DEX files found in patched output"

        with tempfile.TemporaryDirectory(prefix="apk-lab-dex-verify-") as td:
            for dex_name in dex_entries:
                dex_bytes = zf.read(dex_name)
                tmp_dex = Path(td) / dex_name.replace("/", "_")
                tmp_dex.write_bytes(dex_bytes)

                res = subprocess.run(
                    [str(dexdump), "-c", str(tmp_dex)],
                    capture_output=True,
                    text=True,
                    errors="replace",
                    check=False,
                )
                if res.returncode != 0:
                    return (
                        False,
                        f"dexdump verification failed for {dex_name}: {res.stderr[:200]}",
                    )

    return True, None


def parse_dexdump_class_descriptors(output: str) -> set[str]:
    """Parses class descriptor strings from dexdump plain output."""
    matches = re.findall(r"Class descriptor\s+:\s+'([^']+)'", output)
    return set(matches)


def extract_dex_class_descriptors(apk_path: Path) -> set[str]:
    """Extracts all class descriptor strings from DEX files in an APK."""
    classes: set[str] = set()
    try:
        dexdump = find_build_tools_bin("dexdump")
    except InspectionError:
        return classes

    with (
        zipfile.ZipFile(apk_path, "r") as zf,
        tempfile.TemporaryDirectory() as td,
    ):
        for name in zf.namelist():
            if name.endswith(".dex"):
                tmp_dex = Path(td) / name.replace("/", "_")
                with zf.open(name) as src, open(tmp_dex, "wb") as dst:
                    while chunk := src.read(64 * 1024):
                        dst.write(chunk)
                res = subprocess.run(
                    [str(dexdump), str(tmp_dex)],
                    capture_output=True,
                    text=True,
                    errors="replace",
                    check=False,
                )
                if res.returncode != 0:
                    raise RuntimeError(
                        f"dexdump failed on {name} (exit {res.returncode}): {res.stderr[:300]}"
                    )
                classes.update(parse_dexdump_class_descriptors(res.stdout))
    return classes


def get_member_hashes(apk_path: Path) -> dict[str, str]:
    """Returns a map of entry filename to uncompressed SHA-256 for all members."""
    hashes: dict[str, str] = {}
    with zipfile.ZipFile(apk_path, "r") as zf:
        for info in zf.infolist():
            if not info.is_dir():
                h = hashlib.sha256()
                with zf.open(info) as f:
                    while chunk := f.read(64 * 1024):
                        h.update(chunk)
                hashes[info.filename] = h.hexdigest()
    return hashes


def get_split_container_input_member_hashes(
    container_path: Path,
) -> dict[str, set[str]]:
    """Inspects each split in a container and maps logical path to the set of uncompressed SHA-256 hashes."""
    hashes_map: dict[str, set[str]] = {}
    with (
        zipfile.ZipFile(container_path, "r") as container_zf,
        tempfile.TemporaryDirectory(prefix="apk-lab-morphe-split-") as tmp_dir,
    ):
        tmp_dir_path = Path(tmp_dir)
        for zinfo in container_zf.infolist():
            if zinfo.filename.endswith(".apk"):
                split_path = tmp_dir_path / Path(zinfo.filename).name
                with container_zf.open(zinfo) as src, open(split_path, "wb") as dst:
                    while chunk := src.read(64 * 1024):
                        dst.write(chunk)
                with zipfile.ZipFile(split_path, "r") as member_zf:
                    for m_info in member_zf.infolist():
                        if not m_info.is_dir():
                            h = hashlib.sha256()
                            with member_zf.open(m_info) as f:
                                while chunk := f.read(64 * 1024):
                                    h.update(chunk)
                            hashes_map.setdefault(m_info.filename, set()).add(
                                h.hexdigest()
                            )
                split_path.unlink(missing_ok=True)
    return hashes_map


def build_morphe_patch_cmd(
    mpp_path: Path | str,
    patch_name: str,
    options: dict[str, Any],
    dependencies: list[str],
    artifact_path: Path | str,
    out_apk: Path | str,
    result_json: Path | str,
    scratch_dir: Path | str,
    force: bool = False,
) -> list[str]:
    """Builds the exact argument list for morphe patch command with correct option binding."""
    cmd = [
        "patch",
        "-p",
        str(Path(mpp_path).resolve()),
        "--exclusive",
    ]
    # Target patch options must precede target patch selection so options bind to target
    for k, v in sorted(options.items()):
        if isinstance(v, bool):
            val_str = "true" if v else "false"
        else:
            val_str = str(v)
        cmd.extend(["-O", f"{k}={val_str}"])

    cmd.extend(["-e", patch_name])

    for dep in dependencies:
        cmd.extend(["-e", dep])

    cmd.extend(
        [
            "--unsigned",
            "-t",
            str(Path(scratch_dir).resolve()),
            "-o",
            str(Path(out_apk).resolve()),
            "-r",
            str(Path(result_json).resolve()),
        ]
    )

    if force:
        cmd.append("-f")

    cmd.append(str(Path(artifact_path).resolve()))
    return cmd


def run_single_patch_case(
    artifact_path: Path,
    mpp_path: Path,
    test_case: PatchTestCase,
    input_inspection: ArtifactInspection,
    force: bool = False,
    keep_workspace: bool = False,
    ws_mgr: WorkspaceManager | None = None,
    tool_mgr: ToolManager | None = None,
) -> PatchTestCaseResult:
    """Executes a single patch test case and validates postconditions."""
    tool_mgr = tool_mgr or ToolManager()
    ws_mgr = ws_mgr or WorkspaceManager()

    start_time = time.time()
    tool_versions = {
        name: tool_mgr.get_tool_spec(name)["version"]
        for name in ["morphe", "jadx", "apktool", "baksmali"]
    }

    config = {
        "patchName": test_case.patch_name,
        "options": test_case.options,
        "force": force,
    }

    with ws_mgr.ephemeral_run(
        package_name=input_inspection.package_name,
        version_code=input_inspection.version_code,
        input_sha256=input_inspection.sha256,
        input_path=artifact_path,
        command="check",
        config=config,
        tool_versions=tool_versions,
        keep_workspace=keep_workspace,
    ) as run_dir:
        out_apk = run_dir / "patched.apk"
        result_json = run_dir / "result.json"
        scratch_dir = run_dir / "scratch"
        scratch_dir.mkdir(parents=True, exist_ok=True)
        patch_input_path = artifact_path

        cmd = build_morphe_patch_cmd(
            mpp_path=mpp_path,
            patch_name=test_case.patch_name,
            options=test_case.options,
            dependencies=test_case.dependencies,
            artifact_path=patch_input_path,
            out_apk=out_apk,
            result_json=result_json,
            scratch_dir=scratch_dir,
            force=force,
        )

        proc = tool_mgr.run_tool_cmd("morphe", cmd)
        duration = time.time() - start_time

        # 1. Parse result.json
        if not result_json.is_file():
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Morphe failed to write result file. Exit {proc.returncode}. Output: {proc.stderr[:300]}",
                duration_seconds=duration,
            )

        try:
            result_data = json.loads(result_json.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, OSError) as e:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Corrupt Morphe result JSON: {e}",
                duration_seconds=duration,
            )

        failed_patches = result_data.get("failedPatches", [])
        if failed_patches or proc.returncode != 0:
            err = (
                "; ".join(
                    f"{fp.get('name')}: {fp.get('reason')}" for fp in failed_patches
                )
                or proc.stderr[:300]
            )
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Morphe reported failure: {err}",
                duration_seconds=duration,
            )

        applied = [p.get("name") for p in result_data.get("appliedPatches", [])]
        if test_case.patch_name not in applied:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Target patch '{test_case.patch_name}' was not reported in applied patches: {applied}",
                applied_patches=applied,
                duration_seconds=duration,
            )

        # Check declared dependencies
        for dep in test_case.dependencies:
            if dep not in applied:
                return PatchTestCaseResult(
                    patch_name=test_case.patch_name,
                    options=test_case.options,
                    success=False,
                    error_message=f"Declared dependency '{dep}' was not applied. Applied: {applied}",
                    applied_patches=applied,
                    duration_seconds=duration,
                )

        # 2. Postcondition checks
        if not out_apk.is_file():
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message="Morphe reported success but output APK was not created",
                applied_patches=applied,
                duration_seconds=duration,
            )

        # Postcondition: valid zip
        try:
            inspect_safe_zip(out_apk)
        except (ArchiveSecurityError, zipfile.BadZipFile, OSError) as e:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Output is not a valid zip archive: {e}",
                applied_patches=applied,
                duration_seconds=duration,
            )

        # Postcondition: inspect output APK
        try:
            out_info = inspect_artifact(out_apk)
        except (InspectionError, OSError) as e:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Failed to inspect output APK: {e}",
                applied_patches=applied,
                duration_seconds=duration,
            )

        # Package and version unchanged
        if out_info.package_name != input_inspection.package_name:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Package name changed: {input_inspection.package_name} -> {out_info.package_name}",
                applied_patches=applied,
                duration_seconds=duration,
            )

        if out_info.version_code != input_inspection.version_code:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Version code changed: {input_inspection.version_code} -> {out_info.version_code}",
                applied_patches=applied,
                duration_seconds=duration,
            )

        # Postcondition: SDK DEX verification
        dex_ok, dex_err = verify_sdk_dex(out_apk)
        if not dex_ok:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"SDK DEX verification failed: {dex_err}",
                applied_patches=applied,
                duration_seconds=duration,
            )

        # Postcondition: Inventory injected extension classes
        injected_classes: list[str] = []
        try:
            out_classes = extract_dex_class_descriptors(out_apk)
            for cls in sorted(out_classes):
                if "Lapp/aidan/extension/" in cls:
                    injected_classes.append(cls)
        except (RuntimeError, OSError, zipfile.BadZipFile) as e:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message=f"Postcondition failed: dexdump extraction error: {e}",
                applied_patches=applied,
                duration_seconds=duration,
            )

        # Postcondition: Member hash changes & sentinel check
        out_hashes = get_member_hashes(out_apk)
        has_changed_member = False

        if input_inspection.container_type.value == "APK":
            in_hashes = get_member_hashes(artifact_path)
            for name, in_h in in_hashes.items():
                out_h = out_hashes.get(name)
                if out_h and out_h != in_h and is_patchable_member(name):
                    has_changed_member = True
            for name in out_hashes:
                if name.endswith(".dex") and name not in in_hashes and injected_classes:
                    has_changed_member = True
        else:
            in_hashes_map = get_split_container_input_member_hashes(artifact_path)
            for name, out_h in out_hashes.items():
                if not is_patchable_member(name):
                    continue

                if name in in_hashes_map:
                    if out_h not in in_hashes_map[name]:
                        has_changed_member = True
                elif name.endswith(".dex") and injected_classes:
                    has_changed_member = True

        if not has_changed_member:
            return PatchTestCaseResult(
                patch_name=test_case.patch_name,
                options=test_case.options,
                success=False,
                error_message="Postcondition failed: no DEX/resource/native/asset member changed in output",
                applied_patches=applied,
                duration_seconds=duration,
            )

        return PatchTestCaseResult(
            patch_name=test_case.patch_name,
            options=test_case.options,
            success=True,
            applied_patches=applied,
            injected_classes=injected_classes,
            duration_seconds=duration,
        )


def run_compatibility_check(
    artifact_path: str | Path,
    mpp_path: str | Path,
    expected_package: str | None = None,
    requested_patches: list[str] | None = None,
    all_patches: bool = False,
    force: bool = False,
    keep_workspace: bool = False,
    workspace_root: str | Path = ".apk-lab",
) -> tuple[PatchCompatibilityReport, ExitCode]:
    """Runs full patch compatibility check against an artifact."""
    art_path = Path(artifact_path).resolve()
    m_path = Path(mpp_path).resolve()

    if not art_path.is_file():
        raise FileNotFoundError(f"Artifact not found: {art_path}")
    if not m_path.is_file():
        raise FileNotFoundError(f"MPP bundle not found: {m_path}")

    # Inspect input artifact
    input_inspection = inspect_artifact(art_path)
    if expected_package and input_inspection.package_name != expected_package:
        raise ValueError(
            f"Artifact package '{input_inspection.package_name}' does not match requested '{expected_package}'"
        )

    # Load patches metadata
    patches_list_data = load_patches_list()
    patch_defs = get_compatible_patches(
        package_name=input_inspection.package_name,
        patches_list_data=patches_list_data,
        requested_patches=requested_patches,
        all_patches=all_patches,
    )

    if not patch_defs:
        raise ValueError(
            f"No compatible patches found for {input_inspection.package_name}"
        )

    # Tool versions & git revision
    tool_mgr = ToolManager()
    tool_versions = {
        name: tool_mgr.get_tool_spec(name)["version"]
        for name in ["morphe", "jadx", "apktool", "baksmali"]
    }

    git_rev = "unknown"
    try:
        r = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            capture_output=True,
            text=True,
            check=False,
        )
        if r.returncode == 0:
            git_rev = r.stdout.strip()
    except (subprocess.SubprocessError, OSError) as err:
        logger.debug("Failed to determine git rev: %s", err)

    ws_mgr = WorkspaceManager(root=workspace_root)

    test_case_results: list[PatchTestCaseResult] = []
    failed_reasons: list[str] = []

    for p_def in patch_defs:
        cases = generate_test_cases(p_def)
        for case in cases:
            res = run_single_patch_case(
                artifact_path=art_path,
                mpp_path=m_path,
                test_case=case,
                input_inspection=input_inspection,
                force=force,
                keep_workspace=keep_workspace,
                ws_mgr=ws_mgr,
                tool_mgr=tool_mgr,
            )
            test_case_results.append(res)
            if not res.success:
                failed_reasons.append(f"[{res.patch_name}] {res.error_message}")

    total_cases = len(test_case_results)
    passed_cases = sum(1 for r in test_case_results if r.success)
    failed_cases = total_cases - passed_cases

    if failed_cases == 0:
        overall_status = "compatible"
        exit_code = ExitCode.SUCCESS
    else:
        overall_status = "incompatible"
        exit_code = ExitCode.COMPATIBILITY_FAILURE

    report = PatchCompatibilityReport(
        artifact_sha256=input_inspection.sha256,
        package_name=input_inspection.package_name,
        version_name=input_inspection.version_name,
        version_code=input_inspection.version_code,
        patch_bundle_version=patches_list_data.get("version", "unknown"),
        git_revision=git_rev,
        tool_versions=tool_versions,
        overall_status=overall_status,
        total_cases=total_cases,
        passed_cases=passed_cases,
        failed_cases=failed_cases,
        test_cases=test_case_results,
        failure_reason="; ".join(failed_reasons) if failed_reasons else None,
    )

    return report, exit_code
