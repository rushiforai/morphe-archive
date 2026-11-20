from __future__ import annotations

import argparse
import json
import re
import shlex
import subprocess
import sys
import tempfile
import zipfile
from dataclasses import asdict
from pathlib import Path
from typing import Any

from apk_lab.archives import (
    ArchiveSecurityError,
    is_contained_path,
    materialize_split_member,
)
from apk_lab.code_inspection import CodeInspectionError
from apk_lab.comparison import compare_artifacts, format_comparison_summary
from apk_lab.inspection import InspectionError, inspect_artifact
from apk_lab.models import ContainerType, ExitCode
from apk_lab.tools import ToolManager, check_host_prerequisites
from apk_lab.workspace import WorkspaceError, WorkspaceManager


def non_negative_float(val: str) -> float:
    try:
        f = float(val)
    except ValueError:
        raise argparse.ArgumentTypeError(f"Invalid float value: {val}")
    if f < 0:
        raise argparse.ArgumentTypeError(f"Stale age must be non-negative, got {val}")
    return f


def non_negative_int(val: str) -> int:
    try:
        n = int(val, 0)
    except ValueError:
        raise argparse.ArgumentTypeError(f"Invalid integer value: {val}")
    if n < 0:
        raise argparse.ArgumentTypeError(f"Value must be non-negative, got {val}")
    return n


def parse_int_auto(val: str) -> int:
    try:
        return int(val, 0)
    except ValueError:
        raise argparse.ArgumentTypeError(f"Invalid integer or hex value: {val}")


def validate_dex_entry_name(name: str) -> str:
    """Validates that a DEX member name is a safe top-level classes*.dex file."""
    if not re.match(r"^classes\d*\.dex$", name):
        raise ArchiveSecurityError(f"Invalid or unsafe DEX entry name: {name}")
    return name


def extract_native_libraries(
    apk_paths: list[Path], lib_dir: Path
) -> dict[str, list[str]]:
    """Extracts all native shared libraries from candidate APK paths into lib_dir/<arch>/."""
    extracted: dict[str, list[str]] = {}
    so_pattern = re.compile(r"^lib/([^/]+)/([^/]+\.so)$")

    for apk_path in apk_paths:
        if not apk_path.is_file():
            continue
        with zipfile.ZipFile(apk_path, "r") as zf:
            for info in zf.infolist():
                name = info.filename
                if name.startswith("lib/") and name.endswith(".so"):
                    dest = (lib_dir / name.removeprefix("lib/")).resolve()
                    if not is_contained_path(dest, lib_dir, allow_equal=False):
                        raise ArchiveSecurityError(
                            f"Native library {name} escapes library directory {lib_dir}"
                        )
                    match = so_pattern.match(name)
                    if not match:
                        raise ArchiveSecurityError(
                            f"Invalid native library entry name: {name}"
                        )
                    arch, filename = match.groups()
                    if dest.exists():
                        with zf.open(info) as src, open(dest, "rb") as existing:
                            while True:
                                chunk1 = src.read(64 * 1024)
                                chunk2 = existing.read(64 * 1024)
                                if chunk1 != chunk2:
                                    raise ArchiveSecurityError(
                                        f"Conflicting native library content for {name}"
                                    )
                                if not chunk1:
                                    break
                    else:
                        dest.parent.mkdir(parents=True, exist_ok=True)
                        with zf.open(info) as src, open(dest, "wb") as dst:
                            while chunk := src.read(64 * 1024):
                                dst.write(chunk)
                    arch_libs = extracted.setdefault(arch, [])
                    if filename not in arch_libs:
                        arch_libs.append(filename)

    return extracted


def print_json_or_file(data: Any, path: str | None = None) -> None:
    text = json.dumps(data, indent=2, sort_keys=True)
    if not path or path == "-":
        print(text)
    else:
        out_path = Path(path).resolve()
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(text, encoding="utf-8")


def handle_setup(args: argparse.Namespace) -> int:
    profile = args.profile
    tool_mgr = ToolManager()
    print(f"Setting up apk-lab toolchain (profile: {profile})...")
    results = tool_mgr.setup_profile(profile)
    failed = False
    for r in results:
        if r.installed:
            print(
                f"  [OK] {r.name} v{r.configured_version} installed: {r.executable_path}"
            )
        else:
            print(f"  [FAILED] {r.name}: {r.error}")
            failed = True
    return ExitCode.USAGE_OR_TOOL_ERROR if failed else ExitCode.SUCCESS


def handle_doctor(args: argparse.Namespace) -> int:
    profile = getattr(args, "profile", None)
    ci_mode = bool(args.ci) or (profile == "ci")
    report = check_host_prerequisites(
        ci_mode=ci_mode,
        workspace_root=args.workspace_root,
        profile=profile,
    )
    if args.json is not None:
        print_json_or_file(report.to_dict(), args.json)
        return ExitCode.SUCCESS if report.all_ready else ExitCode.USAGE_OR_TOOL_ERROR

    print("=" * 60)
    print("APK-LAB DOCTOR REPORT")
    print("=" * 60)
    print("Host Prerequisites:")
    for p in report.prerequisites:
        status = "[OK]" if p.satisfied else "[MISSING]"
        info = f": {p.version_or_path}" if p.version_or_path else ""
        err = f" ({p.error})" if p.error else ""
        print(f"  {status} {p.name}{info}{err}")

    print("\nTools in Cache:")
    for t in report.tools:
        status = "[OK]" if t.installed else "[MISSING]"
        path_str = f" ({t.executable_path})" if t.executable_path else ""
        err_str = f" - {t.error}" if t.error else ""
        print(f"  {status} {t.name} v{t.configured_version}{path_str}{err_str}")

    print(f"\nWorkspace writable: {'YES' if report.workspace_writable else 'NO'}")
    if report.ci_mode:
        print("\nCI Credentials (presence only):")
        for cred, present in sorted(report.credentials_present.items()):
            print(f"  {cred}: {'SET' if present else 'UNSET'}")

    print("=" * 60)
    if report.all_ready:
        print("Status: ALL READY")
        return ExitCode.SUCCESS
    else:
        print("Status: PREREQUISITES OR TOOLS MISSING")
        return ExitCode.USAGE_OR_TOOL_ERROR


def handle_inspect(args: argparse.Namespace) -> int:
    try:
        inspection = inspect_artifact(args.artifact)
        if args.json is not None:
            print_json_or_file(inspection.to_dict(), args.json)
            return ExitCode.SUCCESS

        print(f"Artifact:          {inspection.file_path}")
        print(f"Container Type:    {inspection.container_type.value}")
        print(f"Size:              {inspection.file_size:,} bytes")
        print(f"SHA-256:           {inspection.sha256}")
        print(f"Package Name:      {inspection.package_name}")
        print(f"Version Name:      {inspection.version_name}")
        print(f"Version Code:      {inspection.version_code}")
        print(f"Min / Target SDK:  {inspection.min_sdk} / {inspection.target_sdk}")
        print(f"Signer SHA-256:    {inspection.signing_certificate_sha256}")
        print(f"Splits:            {len(inspection.splits)}")
        for s in inspection.splits:
            role = " [BASE]" if s.is_base else ""
            print(f"  - {s.filename} ({s.size:,} bytes){role}")
        print(
            f"DEX Stats:         {inspection.dex_classes_count:,} classes, {inspection.dex_methods_count:,} methods ({len(inspection.dex_files)} dex files)"
        )
        print(f"Native Libraries:  {len(inspection.native_libraries)}")
        print(f"Assets:            {len(inspection.assets)}")
        if inspection.warnings:
            print(f"Warnings ({len(inspection.warnings)}):")
            for w in inspection.warnings[:5]:
                print(f"  ! {w}")
        return ExitCode.SUCCESS
    except InspectionError as e:
        print(f"Inspection error: {e}", file=sys.stderr)
        return e.exit_code
    except ArchiveSecurityError as e:
        print(f"Archive security error: {e}", file=sys.stderr)
        return ExitCode.INVALID_ARTIFACT
    except Exception as e:  # noqa: BLE001
        print(f"Unexpected error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_compare(args: argparse.Namespace) -> int:
    try:
        tool_mgr = ToolManager()
        cmp = compare_artifacts(
            args.old_artifact,
            args.new_artifact,
            requested_classes=args.classes,
            tool_mgr=tool_mgr,
        )
        if args.json is not None:
            print_json_or_file(cmp.to_dict(), args.json)
        else:
            print(format_comparison_summary(cmp))
        if args.classes and any(
            c.get("status") in ("error", "tool_unavailable")
            for c in cmp.classes_diff.values()
        ):
            return ExitCode.USAGE_OR_TOOL_ERROR
        return ExitCode.SUCCESS
    except InspectionError as e:
        print(f"Comparison inspection error: {e}", file=sys.stderr)
        return e.exit_code
    except Exception as e:  # noqa: BLE001
        print(f"Unexpected error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_clean(args: argparse.Namespace) -> int:
    mgr = WorkspaceManager(root=args.workspace_root)
    dry_run = args.dry_run

    try:
        if args.run:
            mgr.clean_run(args.run, dry_run=dry_run)
            action = "Would remove" if dry_run else "Removed"
            print(f"{action} run: {args.run}")
            return ExitCode.SUCCESS

        if args.package:
            runs = mgr.clean_package(args.package, dry_run=dry_run)
            action = "Would remove" if dry_run else "Removed"
            print(f"{action} {len(runs)} runs for package {args.package}")
            for r in runs:
                print(f"  - {r}")
            return ExitCode.SUCCESS

        if args.stale is not None:
            runs = mgr.clean_stale(args.stale, dry_run=dry_run)
            action = "Would remove" if dry_run else "Removed"
            print(f"{action} {len(runs)} stale runs (older than {args.stale} days)")
            for r in runs:
                print(f"  - {r}")
            return ExitCode.SUCCESS

        print("Error: Specify --run, --package, or --stale", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except WorkspaceError as e:
        print(f"Workspace error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR


def handle_analyze(args: argparse.Namespace) -> int:
    try:
        inspection = inspect_artifact(args.artifact)
        tool_mgr = ToolManager()
        ws_mgr = WorkspaceManager(root=args.workspace_root)

        # Gather tool versions
        tool_versions = {
            name: tool_mgr.get_tool_spec(name)["version"]
            for name in ["morphe", "jadx", "apktool", "baksmali"]
        }

        config = {
            "jadx": bool(args.jadx),
            "apktool": bool(args.apktool),
            "smali": bool(args.smali),
            "classes": args.classes or [],
        }

        run_dir = ws_mgr.create_run_dir(
            package_name=inspection.package_name,
            version_code=inspection.version_code,
            input_sha256=inspection.sha256,
            input_path=args.artifact,
            command="analyze",
            config=config,
            tool_versions=tool_versions,
        )

        extracted_dir = run_dir / "apks"
        extracted_dir.mkdir(parents=True, exist_ok=True)

        # Extract target APKs or single APK
        target_apk = run_dir / "base.apk"
        if inspection.container_type == ContainerType.APK:
            import shutil

            shutil.copy2(args.artifact, target_apk)
        else:
            with zipfile.ZipFile(args.artifact, "r") as zf:
                for split in inspection.splits:
                    dest = materialize_split_member(zf, split.filename, extracted_dir)
                    if split.is_base:
                        target_apk = dest
        # Extract native shared libraries across splits
        lib_out = run_dir / "lib"
        if inspection.container_type == ContainerType.APK:
            candidate_apks = [target_apk]
        else:
            candidate_apks = [
                extracted_dir / split.filename for split in inspection.splits
            ]
        extracted_libs = extract_native_libraries(candidate_apks, lib_out)

        # 1. Smali disassembly (default or explicit)
        run_smali = args.smali or (not args.jadx and not args.apktool)
        if run_smali:
            smali_out = run_dir / "smali"
            smali_out.mkdir(parents=True, exist_ok=True)

            with zipfile.ZipFile(target_apk, "r") as zf:
                for name in zf.namelist():
                    if re.fullmatch(r"classes\d*\.dex", name):
                        validate_dex_entry_name(name)
                        dex_dest = (run_dir / name).resolve()
                        if not is_contained_path(dex_dest, run_dir, allow_equal=False):
                            raise ArchiveSecurityError(
                                f"DEX destination {name} escapes run directory {run_dir}"
                            )
                        with zf.open(name) as src, open(dex_dest, "wb") as dst:
                            while chunk := src.read(64 * 1024):
                                dst.write(chunk)
                        tool_mgr.run_tool_cmd(
                            "baksmali",
                            ["d", str(dex_dest), "-o", str(smali_out)],
                            check=True,
                        )
                        dex_dest.unlink(missing_ok=True)
        # 2. JADX decompilation (if requested)
        if args.jadx:
            jadx_out = run_dir / "jadx"
            jadx_args = ["-d", str(jadx_out), str(target_apk)]
            if args.classes:
                for cls in args.classes:
                    jadx_args.extend(["--include-pkg", cls])
            res = tool_mgr.run_tool_cmd("jadx", jadx_args, check=False)
            if res.returncode not in (0, 3):
                raise subprocess.CalledProcessError(
                    res.returncode, res.args, res.stdout, res.stderr
                )

        # 3. Apktool decode (if requested)
        if args.apktool:
            apktool_out = run_dir / "apktool"
            tool_mgr.run_tool_cmd(
                "apktool",
                ["d", "-f", "-o", str(apktool_out), str(target_apk)],
                check=True,
            )

        print("Analysis workspace created successfully:")
        print(f"  Workspace: {run_dir}")
        if extracted_libs:
            libs_summary = ", ".join(
                f"{arch} ({len(libs)})" for arch, libs in sorted(extracted_libs.items())
            )
            print(f"  Libraries: {libs_summary}")
        cleanup_cmd = ["uv", "run", "--project", "tools/apk-lab", "apk-lab"]
        if str(args.workspace_root) != ".apk-lab":
            cleanup_cmd.extend(["--workspace-root", str(args.workspace_root)])
        cleanup_cmd.extend(["clean", "--run", str(run_dir)])
        print(f"  Cleanup:   {shlex.join(cleanup_cmd)}")
        return ExitCode.SUCCESS
    except ArchiveSecurityError as e:
        print(f"Archive security error: {e}", file=sys.stderr)
        return ExitCode.INVALID_ARTIFACT
    except InspectionError as e:
        print(f"Inspection error: {e}", file=sys.stderr)
        return e.exit_code
    except Exception as e:  # noqa: BLE001
        print(f"Analysis error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_check(args: argparse.Namespace) -> int:
    try:
        from apk_lab.deployment import find_repo_root
        from apk_lab.morphe import run_compatibility_check

        mpp_path = args.mpp
        if mpp_path is None:
            try:
                repo_root = find_repo_root()
            except Exception as e:
                raise FileNotFoundError(
                    "No compiled .mpp found in patches/build/libs/. Run ./gradlew :patches:buildAndroid first."
                ) from e
            libs_dir = repo_root / "patches" / "build" / "libs"
            if not libs_dir.is_dir():
                raise FileNotFoundError(
                    "No compiled .mpp found in patches/build/libs/. Run ./gradlew :patches:buildAndroid first."
                )
            mpp_files = list(libs_dir.glob("*.mpp"))
            if not mpp_files:
                raise FileNotFoundError(
                    "No compiled .mpp found in patches/build/libs/. Run ./gradlew :patches:buildAndroid first."
                )
            mpp_files.sort(key=lambda p: p.stat().st_mtime, reverse=True)
            mpp_path = mpp_files[0]

        jobs = getattr(args, "jobs", None)
        report, exit_code = run_compatibility_check(
            artifact_path=args.artifact,
            mpp_path=mpp_path,
            expected_package=args.package,
            requested_patches=args.patches,
            all_patches=args.all,
            force=args.force,
            keep_workspace=args.keep_workspace,
            workspace_root=args.workspace_root,
            jobs=jobs,
        )

        if args.json is not None:
            print_json_or_file(report.to_dict(), args.json)
            return exit_code

        print("=" * 60)
        print(f"PATCH COMPATIBILITY CHECK: {report.package_name}")
        print("=" * 60)
        print(f"Version:       {report.version_name} ({report.version_code})")
        print(f"Artifact SHA:  {report.artifact_sha256[:16]}...")
        print(
            f"Patch Bundle:  {report.patch_bundle_version} (rev: {report.git_revision[:8]})"
        )
        print(f"Results:       {report.passed_cases}/{report.total_cases} passed")
        print("-" * 60)
        for tc in report.test_cases:
            status = "[PASS]" if tc.success else "[FAIL]"
            opts_str = f" (opts: {tc.options})" if tc.options else ""
            inj_str = (
                f" [injected: {len(tc.injected_classes)} classes]"
                if tc.injected_classes
                else ""
            )
            dur_str = f" ({tc.duration_seconds}s)"
            print(f"  {status} {tc.patch_name}{opts_str}{inj_str}{dur_str}")
            if not tc.success and tc.error_message:
                print(f"         Reason: {tc.error_message}")
        print("=" * 60)
        print(f"Overall Status: {report.overall_status.upper()}")
        return exit_code
    except FileNotFoundError as e:
        print(f"Check error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except ValueError as e:
        print(f"Check error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except Exception as e:  # noqa: BLE001
        print(f"Check unexpected error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_fixtures_seed(args: argparse.Namespace) -> int:
    try:
        from apk_lab.fixtures import R2FixtureManager

        mgr = R2FixtureManager()
        print(f"Seeding fixture for {args.package} (role: {args.role})...")
        meta = mgr.seed_fixture(args.package, args.role, args.artifact)
        print(
            f"[OK] Seeded {meta.package_name} v{meta.version_name} ({meta.version_code}) to slot {args.role}"
        )
        return ExitCode.SUCCESS
    except Exception as e:  # noqa: BLE001
        print(f"Fixtures error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_fixtures_info(args: argparse.Namespace) -> int:
    try:
        from apk_lab.fixtures import R2FixtureManager

        mgr = R2FixtureManager()
        roles = [args.role] if args.role else ["latest", "target"]
        for r in roles:
            meta = mgr.get_slot_metadata(args.package, r)
            if meta:
                print(
                    f"Slot {r}: {meta.version_name} ({meta.version_code}), SHA: {meta.sha256[:16]}..., src: {meta.acquisition_source}"
                )
            else:
                print(f"Slot {r}: [EMPTY]")
        return ExitCode.SUCCESS
    except Exception as e:  # noqa: BLE001
        print(f"Fixtures info error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_fixtures_download(args: argparse.Namespace) -> int:
    try:
        from apk_lab.fixtures import R2FixtureManager

        mgr = R2FixtureManager()
        dest = mgr.download_slot(args.package, args.role, args.out)
        print(f"[OK] Downloaded slot {args.role} to {dest}")
        return ExitCode.SUCCESS
    except Exception as e:  # noqa: BLE001
        print(f"Fixtures download error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_acquire(args: argparse.Namespace) -> int:
    try:
        from apk_lab.acquisition import acquire_artifact

        out_dir = Path(args.out_dir or tempfile.gettempdir())
        print(
            f"Acquiring artifact for {args.package} (expected version: {args.version or 'latest'})..."
        )
        apkm, source = acquire_artifact(
            package_name=args.package,
            out_dir=out_dir,
            expected_version=args.version,
            expected_version_code=getattr(args, "version_code", None),
        )
        print(f"[OK] Acquired {args.package} via {source.value}: {apkm}")
        return ExitCode.SUCCESS
    except Exception as e:  # noqa: BLE001
        print(f"Acquisition error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_asm(args: argparse.Namespace) -> int:
    try:
        from apk_lab.asm import assemble_statement, format_instruction

        opcode = assemble_statement(
            statement=args.statement,
            pc=args.pc,
            explicit_target=args.target,
        )
        formatted = format_instruction(opcode, fmt=args.format)
        print(formatted)
        return ExitCode.SUCCESS
    except ValueError as e:
        print(f"Assembly error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except Exception as e:  # noqa: BLE001
        print(f"Assembly error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_il2cpp(args: argparse.Namespace) -> int:
    try:
        from apk_lab.il2cpp import analyze_il2cpp

        records = analyze_il2cpp(Path(args.artifact), args.query)
        if args.json:
            print_json_or_file(records, args.json)
        else:
            if not records:
                print("No matching IL2CPP symbols found.")
            else:
                print(f"Found {len(records)} matching IL2CPP symbols:")
                print(f"{'Namespace':<25} {'Type':<35} {'Method':<35} {'Params':<6}")
                print("-" * 105)
                for r in records[:100]:
                    ns = r.get("namespace") or "<global>"
                    print(
                        f"{ns:<25} {r['type']:<35} {r['method']:<35} {r['parameters_count']:<6}"
                    )
                if len(records) > 100:
                    print(f"... and {len(records) - 100} more (use --json to see all)")
        return ExitCode.SUCCESS
    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except ValueError as e:
        print(f"IL2CPP metadata error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except Exception as e:  # noqa: BLE001
        print(f"IL2CPP analysis error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_unity(args: argparse.Namespace) -> int:
    try:
        from apk_lab.unity import inspect_unity_assets

        records = inspect_unity_assets(
            artifact_path=Path(args.artifact),
            name_filter=args.gameobject,
        )
        if args.json:
            print_json_or_file(records, args.json)
        else:
            if not records:
                print("No matching Unity GameObjects found.")
            else:
                print(f"Found {len(records)} matching Unity GameObjects:")
                print(
                    f"{'Member':<45} {'Name':<30} {'Offset':<10} {'Active Offset':<15} {'Active':<6}"
                )
                print("-" * 110)
                for r in records[:100]:
                    print(
                        f"{r['member']:<45} {r['name']:<30} 0x{r['file_offset']:x}     "
                        f"{r['is_active_offset_hex']:<15} {r['is_active_value']:<6}"
                    )
                if len(records) > 100:
                    print(f"... and {len(records) - 100} more (use --json to see all)")
        return ExitCode.SUCCESS
    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except ValueError as e:
        print(f"Unity asset error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except Exception as e:  # noqa: BLE001
        print(f"Unity asset inspection error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_deploy(args: argparse.Namespace) -> int:
    try:
        from apk_lab.deployment import run_deploy

        artifact_path = Path(args.artifact)
        if getattr(args, "package", None) is None:
            from apk_lab.inspection import inspect_artifact

            args.package = inspect_artifact(artifact_path).package_name
        if not getattr(args, "all", False) and not getattr(args, "enable", None):
            args.all = True

        return run_deploy(args)
    except FileNotFoundError as e:
        print(f"Deployment error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except ValueError as e:
        print(f"Deployment error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except Exception as e:  # noqa: BLE001
        print(f"Deployment error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_dev(args: argparse.Namespace) -> int:
    try:
        from apk_lab.deployment import (
            build_patch_bundle,
            deploy_artifact,
            find_app_artifact,
            find_repo_root,
        )
        from apk_lab.inspection import inspect_artifact

        repo_root = find_repo_root()
        print(f"Repository root: {repo_root}")

        # 1. Build or locate patch bundle
        if getattr(args, "no_build", False):
            libs_dir = repo_root / "patches" / "build" / "libs"
            mpp_files = list(libs_dir.glob("*.mpp"))
            if not mpp_files:
                raise RuntimeError(f"No .mpp bundle found in {libs_dir}")
            mpp_files.sort(key=lambda p: p.stat().st_mtime, reverse=True)
            mpp_path = mpp_files[0]
            print(f"Using existing bundle: {mpp_path}")
        else:
            print("Building patch bundle via Gradle...")
            mpp_path = build_patch_bundle(repo_root)
            print(f"Built bundle: {mpp_path}")

        # 2. Locate target artifact
        artifact_path: Path | None = None
        if getattr(args, "artifact", None):
            explicit_path = Path(args.artifact).resolve()
            if not explicit_path.is_file():
                print(
                    f"Error: Artifact not found: {explicit_path}",
                    file=sys.stderr,
                )
                return ExitCode.USAGE_OR_TOOL_ERROR
            artifact_path = explicit_path
        elif getattr(args, "app", None):
            artifact_path = find_app_artifact(args.app, repo_root)
            if not artifact_path:
                print(
                    f"Error: Could not find matching artifact for '{args.app}'",
                    file=sys.stderr,
                )
                return ExitCode.USAGE_OR_TOOL_ERROR
        else:
            print(
                "Error: Either app or --artifact must be specified",
                file=sys.stderr,
            )
            return ExitCode.USAGE_OR_TOOL_ERROR
        assert artifact_path is not None
        print(f"Found artifact: {artifact_path}")
        # 3. Resolve package name
        insp = inspect_artifact(artifact_path)
        package_name = insp.package_name
        print(f"Resolved package: {package_name}")

        # 4. Deploy
        clean_install = getattr(args, "clean_install", False)
        device_serial = getattr(args, "device", None)
        launch = getattr(args, "launch", True)
        all_defaults = getattr(args, "all", True)

        result = deploy_artifact(
            artifact_path=artifact_path,
            mpp_path=mpp_path,
            package_name=package_name,
            all_defaults=all_defaults,
            enabled_patches=[],
            raw_options=[],
            device_serial=device_serial,
            launch=launch,
            clean_install=clean_install,
        )
        print(result.format_human())
        return ExitCode.SUCCESS
    except FileNotFoundError as e:
        print(f"Dev iteration error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except ValueError as e:
        print(f"Dev iteration error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except RuntimeError as e:
        print(f"Dev iteration error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE
    except Exception as e:  # noqa: BLE001
        print(f"Dev iteration error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_monitor(args: argparse.Namespace) -> int:
    try:
        from apk_lab.device import run_monitor

        return run_monitor(args)
    except ValueError as e:
        print(f"Monitor error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except Exception as e:  # noqa: BLE001
        print(f"Monitor error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def _find_package_smali_dir(
    workspace_root: str | Path, package_name: str
) -> Path | None:
    pkg_dir = Path(workspace_root) / package_name
    if not pkg_dir.is_dir():
        return None
    # Find all directories named smali under pkg_dir
    smali_dirs = [d for d in pkg_dir.rglob("smali") if d.is_dir()]
    if not smali_dirs:
        return None
    # Pick the most recently modified smali directory
    return max(smali_dirs, key=lambda p: p.stat().st_mtime)


def handle_crash_trace(args: argparse.Namespace) -> int:
    try:
        from apk_lab.device import harvest_recent_crashes, resolve_crash_report

        reports = harvest_recent_crashes(args.package, args.device, args.lines)
        smali_dir = _find_package_smali_dir(
            getattr(args, "workspace_root", ".apk-lab"), args.package
        )
        if smali_dir:
            reports = [resolve_crash_report(report, smali_dir) for report in reports]
    except Exception as e:  # noqa: BLE001
        print(f"Crash trace error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE

    if args.json:
        print(json.dumps([asdict(report) for report in reports], indent=2, default=str))
        return ExitCode.SUCCESS
    if not reports:
        print(f"No recent crashes detected for package {args.package}")
        return ExitCode.SUCCESS

    for index, report in enumerate(reports):
        if index:
            print()
        print(f"Process: {report.process}")
        if report.pid is not None:
            print(f"PID: {report.pid}")
        if report.timestamp:
            print(f"Timestamp: {report.timestamp}")
        print(f"Exception: {report.exception_type}")
        print(f"Message: {report.message}")
        if report.stack_trace:
            print("Stack trace:")
            if report.resolved_frames:
                for frame in report.resolved_frames:
                    print(frame.raw_frame)
                    if frame.smali_path:
                        print(f"  -> Smali: {frame.smali_path}")
                    if frame.method_signature:
                        print(f"  -> Method: {frame.method_signature}")
                    if frame.code_snippet:
                        for line in frame.code_snippet:
                            print(f"       {line}")
            else:
                print("\n".join(report.stack_trace))
    return ExitCode.SUCCESS


def handle_inspect_code(args: argparse.Namespace) -> int:
    try:
        from apk_lab.code_inspection import run_inspect_code

        return run_inspect_code(args)
    except BrokenPipeError:
        # Suppress broken pipe error when piping to head/tail/less
        try:
            sys.stdout.close()
        except Exception:  # noqa: BLE001, S110
            pass
        return ExitCode.SUCCESS
    except FileNotFoundError as e:
        print(f"Code inspection error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except ValueError as e:
        print(f"Code inspection error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except CodeInspectionError as e:
        print(f"Code inspection error: {e}", file=sys.stderr)
        return e.exit_code
    except InspectionError as e:
        print(f"Inspection error: {e}", file=sys.stderr)
        return e.exit_code
    except ArchiveSecurityError as e:
        print(f"Archive security error: {e}", file=sys.stderr)
        return ExitCode.INVALID_ARTIFACT
    except Exception as e:  # noqa: BLE001
        print(f"Code inspection error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_validate_smali(args: argparse.Namespace) -> int:
    try:
        from apk_lab.smali import run_validate_smali

        return run_validate_smali(args)
    except ValueError as e:
        print(f"Smali validation error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except Exception as e:  # noqa: BLE001
        print(f"Smali validation error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_res(args: argparse.Namespace) -> int:
    try:
        from apk_lab.resources import run_res

        if getattr(args, "text", None) and not getattr(args, "query", None):
            args.query = f"text:{args.text}"
        elif not getattr(args, "query", None) and not getattr(args, "text", None):
            print(
                "Resource inspection error: either --query or --text/--value is required",
                file=sys.stderr,
            )
            return ExitCode.USAGE_OR_TOOL_ERROR

        return run_res(args)
    except FileNotFoundError as e:
        print(f"Resource inspection error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except ValueError as e:
        print(f"Resource inspection error: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR
    except CodeInspectionError as e:
        print(f"Code inspection error: {e}", file=sys.stderr)
        return e.exit_code
    except InspectionError as e:
        print(f"Inspection error: {e}", file=sys.stderr)
        return e.exit_code
    except ArchiveSecurityError as e:
        print(f"Archive security error: {e}", file=sys.stderr)
        return ExitCode.INVALID_ARTIFACT
    except Exception as e:  # noqa: BLE001
        print(f"Resource inspection error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_strings(args: argparse.Namespace) -> int:
    try:
        from apk_lab.dex_strings import search_artifact_strings

        matches = search_artifact_strings(
            args.artifact,
            query=args.query,
            dex_filter=args.dex,
            ignore_case=args.ignore_case,
        )
        if args.json:
            import json

            data = [
                {"split": m.split, "dex": m.dex_name, "string": m.string}
                for m in matches
            ]
            content = json.dumps(data, indent=2)
            if args.json == "-":
                print(content)
            else:
                Path(args.json).write_text(content, encoding="utf-8")
        else:
            for m in matches:
                print(f"[{m.split}:{m.dex_name}] {m.string}")
        return ExitCode.SUCCESS
    except BrokenPipeError:
        return ExitCode.SUCCESS
    except Exception as e:  # noqa: BLE001
        print(f"Strings search error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_manifest(args: argparse.Namespace) -> int:
    try:
        import re

        from apk_lab.manifest_inspection import inspect_artifact_components

        components = inspect_artifact_components(
            args.artifact, component_type=args.type
        )
        if args.filter:
            pat = re.compile(args.filter, re.IGNORECASE)
            components = [c for c in components if pat.search(c.name)]

        if args.json:
            import json

            data = [
                {
                    "type": c.component_type,
                    "name": c.name,
                    "exported": c.exported,
                    "permission": c.permission,
                    "authorities": c.authorities,
                    "intent_actions": c.intent_actions,
                }
                for c in components
            ]
            content = json.dumps(data, indent=2)
            if args.json == "-":
                print(content)
            else:
                Path(args.json).write_text(content, encoding="utf-8")
        else:
            for c in components:
                exp = f" [exported={c.exported}]" if c.exported is not None else ""
                actions = (
                    f" (actions: {', '.join(c.intent_actions)})"
                    if c.intent_actions
                    else ""
                )
                print(f"[{c.component_type.upper()}] {c.name}{exp}{actions}")
        return ExitCode.SUCCESS
    except BrokenPipeError:
        return ExitCode.SUCCESS
    except Exception as e:  # noqa: BLE001
        print(f"Manifest inspection error: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE


def handle_ui_dump(args: argparse.Namespace) -> int:
    try:
        from apk_lab.device import dump_ui_hierarchy, find_ui_nodes

        nodes = dump_ui_hierarchy(device=args.device)
        matched = find_ui_nodes(
            nodes,
            text=args.text,
            desc=args.desc,
            clickable_only=args.clickable,
        )
        if args.json:
            print(json.dumps([n.to_dict() for n in matched], indent=2))
        else:
            for node in matched:
                text_part = f' text="{node.text}"' if node.text else ""
                desc_part = f' desc="{node.content_desc}"' if node.content_desc else ""
                id_part = f' id="{node.resource_id}"' if node.resource_id else ""
                clickable_str = " [clickable]" if node.clickable else ""
                print(
                    f"{node.class_name} center={node.center} bounds={node.bounds}{clickable_str}{text_part}{desc_part}{id_part}"
                )
        return ExitCode.SUCCESS
    except Exception as e:  # noqa: BLE001
        print(f"Error dumping UI hierarchy: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR


def handle_ui_click(args: argparse.Namespace) -> int:
    try:
        from apk_lab.device import (
            click_ui_node,
            dump_ui_hierarchy,
            find_ui_nodes,
            run_adb,
        )

        if args.coords:
            parts = [p.strip() for p in args.coords.split(",")]
            if len(parts) != 2 or not all(p.lstrip("-").isdigit() for p in parts):
                print(
                    f"Error: Invalid coords format '{args.coords}', expected 'X,Y'",
                    file=sys.stderr,
                )
                return ExitCode.USAGE_OR_TOOL_ERROR
            x, y = int(parts[0]), int(parts[1])
            run_adb(args.device, ["shell", "input", "tap", str(x), str(y)])
            print(f"Clicked coordinates: ({x}, {y})")
            return ExitCode.SUCCESS

        if not (args.text or args.desc):
            print(
                "Error: Must specify --text, --desc, or --coords for click",
                file=sys.stderr,
            )
            return ExitCode.USAGE_OR_TOOL_ERROR

        nodes = dump_ui_hierarchy(device=args.device)
        matched = find_ui_nodes(nodes, text=args.text, desc=args.desc)
        if not matched:
            print(
                f"Error: No matching UI node found (text='{args.text}', desc='{args.desc}')",
                file=sys.stderr,
            )
            return ExitCode.USAGE_OR_TOOL_ERROR

        node = matched[0]
        click_ui_node(args.device, node)
        print(f"Clicked node at {node.center}: {node}")
        return ExitCode.SUCCESS
    except Exception as e:  # noqa: BLE001
        print(f"Error clicking UI node: {e}", file=sys.stderr)
        return ExitCode.USAGE_OR_TOOL_ERROR


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="apk-lab",
        description="Deterministic APK update lifecycle and compatibility automation toolkit",
    )
    parser.add_argument(
        "--workspace-root",
        default=".apk-lab",
        help="Root directory for managed workspaces (default: .apk-lab)",
    )

    subparsers = parser.add_subparsers(dest="subcommand", required=True)

    # setup
    p_setup = subparsers.add_parser("setup", help="Download and verify toolchain")
    p_setup.add_argument(
        "--profile",
        choices=["analysis", "ci"],
        default="analysis",
        help="Toolchain profile to set up (default: analysis)",
    )
    p_setup.set_defaults(handler=handle_setup)

    # doctor
    p_doctor = subparsers.add_parser(
        "doctor", help="Verify host prerequisites and cached tools"
    )
    p_doctor.add_argument(
        "--ci", action="store_true", help="Include CI credential checks"
    )
    p_doctor.add_argument(
        "--profile",
        choices=["analysis", "ci"],
        default=None,
        help="Prerequisite profile to verify (defaults to ci if --ci else analysis)",
    )
    p_doctor.add_argument(
        "--json", nargs="?", const="-", help="Output doctor report as JSON"
    )
    p_doctor.set_defaults(handler=handle_doctor)

    # inspect
    p_inspect = subparsers.add_parser(
        "inspect", help="Inspect an APK/APKM/XAPK/APKS artifact"
    )
    p_inspect.add_argument("artifact", help="Path to APK/APKM/XAPK/APKS file")
    p_inspect.add_argument(
        "--json", nargs="?", const="-", help="Output inspection as JSON"
    )
    p_inspect.set_defaults(handler=handle_inspect)
    # analyze
    p_analyze = subparsers.add_parser(
        "analyze", help="Extract and analyze artifact into a managed run"
    )
    p_analyze.add_argument("artifact", help="Path to APK/APKM/XAPK/APKS file")
    p_analyze.add_argument("--jadx", action="store_true", help="Run JADX decompiler")
    p_analyze.add_argument("--apktool", action="store_true", help="Run Apktool decoder")
    p_analyze.add_argument(
        "--smali", action="store_true", help="Disassemble DEX with baksmali"
    )
    p_analyze.add_argument(
        "--class",
        dest="classes",
        action="append",
        help="Filter analysis to class pattern",
    )
    p_analyze.set_defaults(handler=handle_analyze)

    # compare
    p_compare = subparsers.add_parser("compare", help="Compare two APK artifacts")
    p_compare.add_argument("old_artifact", help="Path to old artifact")
    p_compare.add_argument("new_artifact", help="Path to new artifact")
    p_compare.add_argument(
        "--class", dest="classes", action="append", help="Decompile and diff class"
    )
    p_compare.add_argument(
        "--json", nargs="?", const="-", help="Output comparison as JSON"
    )
    p_compare.set_defaults(handler=handle_compare)

    # clean
    p_clean = subparsers.add_parser("clean", help="Clean managed workspaces")
    p_clean.add_argument("--run", help="Clean a specific run directory")
    p_clean.add_argument("--package", help="Clean all runs for a package")
    p_clean.add_argument(
        "--stale", type=non_negative_float, help="Clean runs older than N days"
    )
    p_clean.add_argument(
        "--dry-run", action="store_true", help="List candidates without deleting"
    )
    p_clean.set_defaults(handler=handle_clean)

    # check (placeholder handler, full morphe logic in morphe.py)
    p_check = subparsers.add_parser(
        "check", help="Apply and verify patches with Morphe Desktop"
    )
    p_check.add_argument("artifact", help="Path to target artifact")
    p_check.add_argument(
        "--mpp",
        required=False,
        default=None,
        help="Path to compiled .mpp patch bundle (defaults to latest bundle in patches/build/libs/)",
    )
    p_check.add_argument("--package", help="Expected package name")
    p_check.add_argument(
        "--all", action="store_true", help="Test all compatible patches"
    )
    p_check.add_argument(
        "--patch", dest="patches", action="append", help="Specific patch name to test"
    )
    p_check.add_argument(
        "--force",
        action="store_true",
        help="Force patch application regardless of version",
    )
    p_check.add_argument(
        "--keep-workspace",
        action="store_true",
        help="Keep workspace directory after check",
    )
    p_check.add_argument(
        "--json", nargs="?", const="-", help="Output compatibility report as JSON"
    )
    p_check.add_argument(
        "-j",
        "--jobs",
        type=int,
        default=None,
        help="Number of concurrent test case worker threads (default: min(CPU count, 8))",
    )
    p_check.set_defaults(handler=handle_check)

    # fixtures (placeholder handler)
    # fixtures
    p_fixtures = subparsers.add_parser("fixtures", help="Manage R2 fixture slots")
    p_fixtures_sub = p_fixtures.add_subparsers(dest="fixture_subcommand", required=True)

    p_seed = p_fixtures_sub.add_parser("seed", help="Seed a fixture slot")
    p_seed.add_argument("--package", required=True, help="Package name")
    p_seed.add_argument(
        "--role", choices=["target", "latest"], required=True, help="Slot role"
    )
    p_seed.add_argument("--artifact", required=True, help="Path to artifact")
    p_seed.set_defaults(handler=handle_fixtures_seed)

    p_info = p_fixtures_sub.add_parser("info", help="Inspect fixture slot metadata")
    p_info.add_argument("--package", required=True, help="Package name")
    p_info.add_argument(
        "--role", choices=["target", "latest"], help="Slot role (default: both)"
    )
    p_info.set_defaults(handler=handle_fixtures_info)

    p_dl = p_fixtures_sub.add_parser("download", help="Download a fixture slot")
    p_dl.add_argument("--package", required=True, help="Package name")
    p_dl.add_argument(
        "--role", choices=["target", "latest"], required=True, help="Slot role"
    )
    p_dl.add_argument("--out", required=True, help="Destination file path")
    p_dl.set_defaults(handler=handle_fixtures_download)

    # acquire
    p_acquire = subparsers.add_parser(
        "acquire", help="Download and normalize an APK from Google Play"
    )
    p_acquire.add_argument("package", help="Package name to acquire")
    p_acquire.add_argument("--version", help="Expected version name")
    p_acquire.add_argument("--out-dir", help="Output directory")
    p_acquire.add_argument("--version-code", type=int, help="Expected version code")
    p_acquire.set_defaults(handler=handle_acquire)
    # asm
    p_asm = subparsers.add_parser(
        "asm", help="Encode ARM64 instruction and calculate branch relocations"
    )
    p_asm.add_argument(
        "statement",
        help="ARM64 instruction statement (e.g. 'bl 0x3c98ce4', 'ret', 'mov w1, #1')",
    )
    p_asm.add_argument(
        "--pc",
        type=parse_int_auto,
        default=0,
        help="Program counter address (default: 0)",
    )
    p_asm.add_argument(
        "--target",
        type=parse_int_auto,
        default=None,
        help="Target address override",
    )
    p_asm.add_argument(
        "--format",
        choices=["hex", "kotlin", "int", "bytes"],
        default="hex",
        help="Output format (default: hex)",
    )
    p_asm.set_defaults(handler=handle_asm)
    # il2cpp
    p_il2cpp = subparsers.add_parser(
        "il2cpp", help="Extract and query Unity IL2CPP symbols from artifact"
    )
    p_il2cpp.add_argument("artifact", help="Path to APK/APKM/APKS file")
    p_il2cpp.add_argument(
        "--query",
        "-q",
        default=None,
        help="Filter symbol or type name (substring or regex)",
    )
    p_il2cpp.add_argument(
        "--json",
        nargs="?",
        const="-",
        help="Output symbols as JSON (optionally to file path or '-' for stdout)",
    )
    p_il2cpp.set_defaults(handler=handle_il2cpp)
    # unity
    p_unity = subparsers.add_parser(
        "unity", help="Inspect Unity serialized assets and locate GameObject properties"
    )
    p_unity.add_argument("artifact", help="Path to APK/APKM/APKS file")
    p_unity.add_argument(
        "--gameobject",
        "-g",
        required=True,
        help="Target GameObject name to search (e.g. Button_HelpCenter)",
    )
    p_unity.add_argument(
        "--json",
        nargs="?",
        const="-",
        help="Output results as JSON (optionally to file path or '-' for stdout)",
    )
    p_unity.set_defaults(handler=handle_unity)

    # deploy
    p_deploy = subparsers.add_parser(
        "deploy", help="Apply patches, sign with debug key, and install to device"
    )
    p_deploy.add_argument("artifact", help="Path to APK/APKM/XAPK/APKS artifact")
    p_deploy.add_argument("--mpp", default=None, help="Path to patches .mpp file")
    p_deploy.add_argument(
        "--build",
        action="store_true",
        help="Automatically compile newest .mpp patch bundle via Gradle",
    )
    p_deploy.add_argument(
        "--package",
        default=None,
        help="Expected package name (auto-detected if omitted)",
    )
    g_patch = p_deploy.add_mutually_exclusive_group(required=False)
    g_patch.add_argument(
        "--all", action="store_true", help="Apply all default-compatible patches"
    )
    g_patch.add_argument(
        "-e",
        "--enable",
        action="append",
        default=[],
        dest="enable",
        help="Explicit patch name to enable (can be repeated)",
    )
    p_deploy.add_argument(
        "-O",
        "--option",
        action="append",
        default=[],
        dest="options",
        help="Patch option in KEY=VALUE format (can be repeated)",
    )
    p_deploy.add_argument("--device", help="Target ADB device serial")
    p_deploy.add_argument(
        "--launch", action="store_true", help="Launch main activity after installation"
    )
    g_install = p_deploy.add_mutually_exclusive_group()
    g_install.add_argument(
        "--reinstall",
        action="store_true",
        help="Reinstall preserving data (-r, default)",
    )
    g_install.add_argument(
        "--clean-install",
        action="store_true",
        help="Clean install by uninstalling first",
    )
    p_deploy.add_argument("--out", help="Path to write signed output APK")
    p_deploy.add_argument("--keystore", help="Path to custom keystore for signing")
    p_deploy.add_argument(
        "--ks-alias",
        default=None,
        help="Keystore key alias (defaults to androiddebugkey or auto-detected)",
    )
    p_deploy.add_argument(
        "--ks-pass",
        default=None,
        help="Keystore password (defaults to android or auto-detected)",
    )
    p_deploy.add_argument(
        "--key-pass",
        default=None,
        help="Key password (defaults to android or auto-detected)",
    )
    p_deploy.set_defaults(handler=handle_deploy)
    # dev
    p_dev = subparsers.add_parser(
        "dev", help="Build patches, locate artifact, deploy to device, and launch"
    )
    p_dev.add_argument(
        "app",
        nargs="?",
        default=None,
        help="Application name or package (e.g. 'geocaching')",
    )
    p_dev.add_argument(
        "--artifact",
        default=None,
        help="Explicit path to APK/APKM/XAPK artifact (bypasses auto-search)",
    )
    p_dev.add_argument(
        "--no-build",
        action="store_true",
        help="Skip building patch bundle and use newest existing .mpp",
    )
    p_dev.add_argument("--device", help="Target ADB device serial")
    p_dev.add_argument(
        "--launch",
        action="store_true",
        default=True,
        help="Launch main activity after installation",
    )
    p_dev.add_argument(
        "--all",
        action="store_true",
        default=True,
        help="Apply all compatible patches",
    )
    g_dev_install = p_dev.add_mutually_exclusive_group()
    g_dev_install.add_argument(
        "--reinstall",
        action="store_true",
        help="Reinstall preserving data (-r, default)",
    )
    g_dev_install.add_argument(
        "--clean-install",
        action="store_true",
        help="Clean install by uninstalling first",
    )
    p_dev.set_defaults(handler=handle_dev)

    # monitor
    p_monitor = subparsers.add_parser(
        "monitor", help="Monitor application process health, ANRs, and crashes"
    )
    p_monitor.add_argument("--package", required=True, help="Package name to monitor")
    p_monitor.add_argument("--device", help="Target ADB device serial")
    p_monitor.add_argument(
        "--timeout",
        type=non_negative_float,
        default=None,
        help="Monitoring timeout in seconds",
    )
    p_monitor.add_argument(
        "--dump-threads",
        action="store_true",
        help="Capture thread dump on ANR or spin",
    )
    p_monitor.set_defaults(handler=handle_monitor)

    # crash-trace
    p_crash_trace = subparsers.add_parser(
        "crash-trace", help="Harvest recent Java crash reports from logcat"
    )
    p_crash_trace.add_argument(
        "--package", required=True, help="Package name to inspect"
    )
    p_crash_trace.add_argument("--device", help="Target ADB device serial")
    p_crash_trace.add_argument(
        "--lines",
        type=non_negative_int,
        default=5000,
        help="Number of recent logcat lines to inspect (default: 5000)",
    )
    p_crash_trace.add_argument(
        "--json", action="store_true", help="Output crash reports as JSON"
    )
    p_crash_trace.set_defaults(handler=handle_crash_trace)

    # inspect-code
    p_inspect_code = subparsers.add_parser(
        "inspect-code",
        help="Targeted class and method disassembly/decompilation and diff",
    )
    p_inspect_code.add_argument(
        "artifact", help="Path to target APK/APKM/XAPK/APKS artifact"
    )
    p_inspect_code.add_argument(
        "--class",
        dest="class_name",
        required=True,
        help="Fully qualified class name (FQCN)",
    )
    p_inspect_code.add_argument("--method", help="Method name or descriptor")
    p_inspect_code.add_argument(
        "--format",
        choices=["smali", "java"],
        default="smali",
        help="Output format (default: smali)",
    )
    p_inspect_code.add_argument(
        "--compare", help="Path to unpatched artifact for side-by-side diff"
    )
    p_inspect_code.set_defaults(handler=handle_inspect_code)

    # validate-smali
    p_validate_smali = subparsers.add_parser(
        "validate-smali",
        help="Validate Smali instruction snippet registers, opcodes, and CFG",
    )
    p_validate_smali.add_argument(
        "--snippet", required=True, help="Smali instruction snippet"
    )
    p_validate_smali.add_argument(
        "--locals",
        type=non_negative_int,
        required=True,
        help="Number of locals (.locals N)",
    )
    p_validate_smali.add_argument(
        "--params",
        type=non_negative_int,
        default=None,
        help="Number of declared single-width parameters (assumes 1 register per param; use --descriptor for wide types)",
    )
    p_validate_smali.add_argument(
        "--descriptor",
        help="Method descriptor (e.g. '(IJLjava/lang/String;)V') defining exact parameter types and 64-bit wide register widths",
    )
    p_validate_smali.add_argument(
        "--is-static", action="store_true", help="Whether the method is static"
    )
    p_validate_smali.set_defaults(handler=handle_validate_smali)

    # res
    p_res = subparsers.add_parser(
        "res", help="Inspect and query resources across split APK containers"
    )
    p_res.add_argument("artifact", help="Path to APK/APKM/XAPK/APKS artifact")
    p_res.add_argument(
        "--query",
        "-q",
        default=None,
        help="Resource name, ID, path, or text: query (or use --text/--value)",
    )
    p_res.add_argument(
        "--text",
        "--value",
        dest="text",
        default=None,
        help="Search resource string/text values (shorthand for --query text:<str>)",
    )
    p_res.add_argument("--extract", help="Directory to extract matched file resources")
    p_res.set_defaults(handler=handle_res)

    # play-accounts
    p_play_accounts = subparsers.add_parser(
        "play-accounts",
        help="Manage Google Play accounts for authenticated acquisition and metadata",
    )
    p_play_accounts.set_defaults(
        handler=lambda _args: __import__(
            "apk_lab.play_accounts_tui", fromlist=["run_play_accounts_tui"]
        ).run_play_accounts_tui()
    )
    # strings
    p_strings = subparsers.add_parser(
        "strings",
        help="Search string literal pools across all DEX files in an artifact",
    )
    p_strings.add_argument("artifact", help="Path to APK/APKM/XAPK")
    p_strings.add_argument("-q", "--query", help="Regex query to filter strings")
    p_strings.add_argument(
        "--dex", help="Filter by specific DEX filename (e.g. classes2.dex)"
    )
    p_strings.add_argument(
        "-i",
        "--ignore-case",
        action="store_true",
        default=True,
        help="Case-insensitive regex (default: True)",
    )
    p_strings.add_argument(
        "-s",
        "--case-sensitive",
        dest="ignore_case",
        action="store_false",
        help="Case-sensitive regex",
    )
    p_strings.add_argument(
        "--json", nargs="?", const="-", help="Output matches as JSON"
    )
    p_strings.set_defaults(handler=handle_strings)

    # manifest
    p_manifest = subparsers.add_parser(
        "manifest",
        help="Inspect AndroidManifest.xml components, providers, receivers, and permissions",
    )
    p_manifest.add_argument("artifact", help="Path to APK/APKM/XAPK")
    p_manifest.add_argument(
        "--type",
        choices=["activity", "service", "receiver", "provider"],
        help="Filter by component type",
    )
    p_manifest.add_argument(
        "--filter",
        help="Regex filter for component name",
    )
    p_manifest.add_argument(
        "--json", nargs="?", const="-", help="Output components as JSON"
    )
    p_manifest.set_defaults(handler=handle_manifest)
    # ui
    p_ui = subparsers.add_parser(
        "ui", help="Device UI hierarchy inspection and click automation"
    )
    p_ui_sub = p_ui.add_subparsers(dest="ui_subcommand", required=True)

    # ui dump
    p_ui_dump = p_ui_sub.add_parser("dump", help="Dump and filter UI hierarchy nodes")
    p_ui_dump.add_argument("--device", help="Target ADB device serial")
    p_ui_dump.add_argument(
        "--clickable", action="store_true", help="Filter to clickable nodes only"
    )
    p_ui_dump.add_argument("--text", help="Filter by text substring")
    p_ui_dump.add_argument("--desc", help="Filter by content-description substring")
    p_ui_dump.add_argument(
        "--json", action="store_true", help="Output JSON array of nodes"
    )
    p_ui_dump.set_defaults(handler=handle_ui_dump)

    # ui click
    p_ui_click = p_ui_sub.add_parser(
        "click", help="Click first matching UI node or direct coordinates"
    )
    p_ui_click.add_argument("--device", help="Target ADB device serial")
    p_ui_click.add_argument("--text", help="Click first node matching text substring")
    p_ui_click.add_argument(
        "--desc", help="Click first node matching content-desc substring"
    )
    p_ui_click.add_argument("--coords", help="Direct X,Y click")
    p_ui_click.set_defaults(handler=handle_ui_click)
    return parser


def main(argv: list[str] | None = None) -> int:
    try:
        parser = build_parser()
        args = parser.parse_args(argv)
        if hasattr(args, "handler"):
            return args.handler(args)
        return ExitCode.SUCCESS
    except BrokenPipeError:
        try:
            sys.stdout.close()
        except Exception:  # noqa: BLE001, S110
            pass
        return ExitCode.SUCCESS


if __name__ == "__main__":
    sys.exit(main())
