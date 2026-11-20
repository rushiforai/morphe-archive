from __future__ import annotations

import json
import logging
import os
import re
import subprocess
import tempfile
import time
import zipfile
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from apk_lab.archives import (
    ArchiveSecurityError,
    compute_zip_member_sha256,
    inspect_safe_zip,
)
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

# Backward-compatible alias for test_cases attribute
PatchCompatibilityReport.test_case_results = property(lambda self: self.test_cases)  # type: ignore[attr-defined]
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
class PatchSelection:
    definition: PatchDef
    options: dict[str, Any]


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


def parse_all_compatible_patches(
    package_name: str,
    patches_list_data: dict[str, Any],
) -> list[PatchDef]:
    """Parses all patches compatible with a package in patches-list.json metadata order."""
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

        compatible.append(
            PatchDef(
                name=p["name"],
                description=p.get("description", ""),
                default=p.get("default", True),
                dependencies=p.get("dependencies", []),
                options=opts,
            )
        )
    return compatible


def get_compatible_patches(
    package_name: str,
    patches_list_data: dict[str, Any],
    requested_patches: list[str] | None = None,
    all_patches: bool = False,
) -> list[PatchDef]:
    """Finds all patches compatible with a package and filters by request."""
    all_compat = parse_all_compatible_patches(package_name, patches_list_data)
    if requested_patches:
        return [p for p in all_compat if p.name in requested_patches]
    if all_patches:
        return all_compat
    return [p for p in all_compat if p.default]


def resolve_patch_selections(
    package_name: str,
    requested_patches: list[str] | None,
    all_defaults: bool,
    raw_options: list[str] | None,
    patches_list_data: dict[str, Any],
) -> list[PatchSelection]:
    """Resolves and validates patch selections, dependencies, and option bindings.

    --all means every compatible default: true patch.
    Explicit names must resolve for the package.
    Expands dependencies transitively, rejects cycles/missing dependencies.
    Parses KEY=VALUE options against selected closure, fills defaults.
    """
    compat_list = parse_all_compatible_patches(package_name, patches_list_data)
    compat_map: dict[str, PatchDef] = {p.name: p for p in compat_list}

    if all_defaults:
        initial_names = [p.name for p in compat_list if p.default]
    else:
        initial_names = requested_patches or []
        for name in initial_names:
            if name not in compat_map:
                raise ValueError(
                    f"Patch '{name}' is not compatible with or not found for package '{package_name}'"
                )

    # Transitive dependency expansion with cycle detection
    selected_set: set[str] = set()
    visiting: set[str] = set()

    def visit(patch_name: str, chain: list[str]) -> None:
        if patch_name in visiting:
            cycle = " -> ".join(chain + [patch_name])
            raise ValueError(f"Circular dependency detected: {cycle}")
        if patch_name in selected_set:
            return
        if patch_name not in compat_map:
            parent = chain[-1] if chain else "root"
            raise ValueError(
                f"Dependency '{patch_name}' required by '{parent}' is not found or not compatible with package '{package_name}'"
            )
        visiting.add(patch_name)
        p_def = compat_map[patch_name]
        for dep in p_def.dependencies:
            visit(dep, chain + [patch_name])
        visiting.remove(patch_name)
        selected_set.add(patch_name)

    for name in initial_names:
        visit(name, [])

    # Preserve metadata order, emit every patch once
    ordered_patches = [p for p in compat_list if p.name in selected_set]

    # Initialize option defaults for each selected patch
    patch_options: dict[str, dict[str, Any]] = {}
    for p in ordered_patches:
        patch_options[p.name] = {opt.key: opt.default for opt in p.options}

    # Parse raw options: KEY=VALUE
    if raw_options:
        for raw in raw_options:
            if "=" not in raw:
                raise ValueError(f"Invalid option format '{raw}', expected KEY=VALUE")
            key, val_str = raw.split("=", 1)
            matching = [
                p for p in ordered_patches if any(opt.key == key for opt in p.options)
            ]
            if not matching:
                raise ValueError(f"Unknown patch option '{key}'")
            if len(matching) > 1:
                names = [p.name for p in matching]
                raise ValueError(
                    f"Ambiguous patch option '{key}': declared by multiple selected patches ({names})"
                )
            p = matching[0]
            opt_def = next(opt for opt in p.options if opt.key == key)
            is_bool = isinstance(opt_def.default, bool) or "Boolean" in opt_def.type
            if is_bool:
                v_clean = val_str.strip().lower()
                if v_clean == "true":
                    coerced: Any = True
                elif v_clean == "false":
                    coerced = False
                else:
                    raise ValueError(
                        f"Invalid boolean value '{val_str}' for option '{key}', must be 'true' or 'false'"
                    )
            else:
                coerced = val_str
            patch_options[p.name][key] = coerced

    return [
        PatchSelection(definition=p, options=patch_options[p.name])
        for p in ordered_patches
    ]


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
                hashes[info.filename] = compute_zip_member_sha256(zf, info)
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
                            hashes_map.setdefault(m_info.filename, set()).add(
                                compute_zip_member_sha256(member_zf, m_info)
                            )
                split_path.unlink(missing_ok=True)
    return hashes_map


def build_morphe_patch_set_cmd(
    mpp_path: Path | str,
    selections: list[PatchSelection],
    artifact_path: Path | str,
    out_apk: Path | str,
    result_json: Path | str,
    scratch_dir: Path | str,
    force: bool = False,
) -> list[str]:
    """Builds the exact argument list for morphe patch command applying multiple patches."""
    cmd = [
        "patch",
        "-p",
        str(Path(mpp_path).resolve()),
        "--exclusive",
    ]
    for sel in selections:
        for k, v in sorted(sel.options.items()):
            if v is None:
                continue
            if isinstance(v, bool):
                val_str = "true" if v else "false"
            else:
                val_str = str(v)
            cmd.extend(["-O", f"{k}={val_str}"])
        cmd.extend(["-e", sel.definition.name])

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
    selections = [
        PatchSelection(
            definition=PatchDef(
                name=patch_name,
                description="",
                default=True,
                dependencies=dependencies,
                options=[],
            ),
            options=options,
        )
    ]
    for dep in dependencies:
        selections.append(
            PatchSelection(
                definition=PatchDef(
                    name=dep,
                    description="",
                    default=True,
                    dependencies=[],
                    options=[],
                ),
                options={},
            )
        )
    return build_morphe_patch_set_cmd(
        mpp_path=mpp_path,
        selections=selections,
        artifact_path=artifact_path,
        out_apk=out_apk,
        result_json=result_json,
        scratch_dir=scratch_dir,
        force=force,
    )


def apply_patch_set(
    tool_manager: ToolManager,
    mpp_path: Path | str,
    artifact_path: Path | str,
    package_name: str,
    selections: list[PatchSelection],
    output_apk: Path | str,
    scratch_dir: Path | str,
    force: bool = False,
) -> list[str]:
    """Applies a resolved set of patches to an artifact using pinned Morphe.

    Inspects input artifact, verifies package, runs Morphe, checks result.json,
    verifies standalone output APK and its DEX files. Returns list of applied patch names.
    """
    in_path = Path(artifact_path).resolve()
    mpp = Path(mpp_path).resolve()
    out_apk = Path(output_apk).resolve()
    scratch = Path(scratch_dir).resolve()
    scratch.mkdir(parents=True, exist_ok=True)
    result_json = scratch / "result.json"

    inspection = inspect_artifact(in_path)
    if inspection.package_name != package_name:
        raise ValueError(
            f"Artifact package '{inspection.package_name}' does not match expected '{package_name}'"
        )

    cmd = build_morphe_patch_set_cmd(
        mpp_path=mpp,
        selections=selections,
        artifact_path=in_path,
        out_apk=out_apk,
        result_json=result_json,
        scratch_dir=scratch,
        force=force,
    )

    proc = tool_manager.run_tool_cmd(
        "morphe",
        cmd,
        cwd=scratch,
        capture_output=True,
        check=False,
    )

    if not result_json.is_file():
        err = (
            proc.stderr[:500]
            if proc.stderr
            else (proc.stdout[:500] if proc.stdout else "")
        )
        raise RuntimeError(
            f"Morphe result.json was not generated (exit code {proc.returncode}): {err}"
        )

    try:
        result_data = json.loads(result_json.read_text(encoding="utf-8"))
    except (json.JSONDecodeError, OSError) as e:
        raise RuntimeError(f"Corrupt Morphe result JSON: {e}")

    failed_patches = result_data.get("failedPatches", [])
    if proc.returncode != 0 or failed_patches:
        err = (
            "; ".join(f"{fp.get('name')}: {fp.get('reason')}" for fp in failed_patches)
            or proc.stderr[:300]
        )
        raise RuntimeError(f"Morphe patching failed: {err}")

    applied = [p.get("name") for p in result_data.get("appliedPatches", [])]
    for sel in selections:
        if sel.definition.name not in applied:
            raise RuntimeError(
                f"Patch '{sel.definition.name}' was not reported in applied patches: {applied}"
            )

    if not out_apk.is_file():
        raise RuntimeError("Morphe reported success but output APK was not created")

    out_inspection = inspect_artifact(out_apk)
    if out_inspection.package_name != package_name:
        raise RuntimeError(
            f"Patched output package '{out_inspection.package_name}' does not match expected '{package_name}'"
        )
    if out_inspection.version_code != inspection.version_code:
        raise RuntimeError(
            f"Patched output version code '{out_inspection.version_code}' does not match input '{inspection.version_code}'"
        )

    dex_valid, dex_err = verify_sdk_dex(out_apk)
    if not dex_valid:
        raise RuntimeError(f"Patched APK DEX verification failed: {dex_err}")

    return applied


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
    jobs: int | None = None,
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
    pkg = expected_package.strip() if expected_package else None
    if pkg and input_inspection.package_name != pkg:
        raise ValueError(
            f"Artifact package '{input_inspection.package_name}' does not match requested '{expected_package}'"
        )
    target_package = pkg or input_inspection.package_name

    # Load patches metadata
    patches_list_data = load_patches_list()
    patch_defs = get_compatible_patches(
        package_name=target_package,
        patches_list_data=patches_list_data,
        requested_patches=requested_patches,
        all_patches=all_patches,
    )

    if not patch_defs:
        raise ValueError(f"No compatible patches found for {target_package}")

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

    default_workers = min(os.cpu_count() or 4, 8)
    max_workers = max(1, jobs if jobs is not None else default_workers)

    all_cases = [
        (idx, case)
        for idx, case in enumerate(
            case for p_def in patch_defs for case in generate_test_cases(p_def)
        )
    ]

    test_case_results: list[PatchTestCaseResult] = []
    failed_reasons: list[str] = []

    if max_workers == 1 or len(all_cases) <= 1:
        for _idx, case in all_cases:
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
    else:
        with ThreadPoolExecutor(
            max_workers=min(max_workers, len(all_cases))
        ) as executor:
            future_to_idx = {
                executor.submit(
                    run_single_patch_case,
                    artifact_path=art_path,
                    mpp_path=m_path,
                    test_case=case,
                    input_inspection=input_inspection,
                    force=force,
                    keep_workspace=keep_workspace,
                    ws_mgr=ws_mgr,
                    tool_mgr=tool_mgr,
                ): idx
                for idx, case in all_cases
            }
            results_by_idx: dict[int, PatchTestCaseResult] = {}
            for future in as_completed(future_to_idx):
                idx = future_to_idx[future]
                results_by_idx[idx] = future.result()

        test_case_results = [results_by_idx[i] for i in range(len(all_cases))]

    for res in test_case_results:
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
