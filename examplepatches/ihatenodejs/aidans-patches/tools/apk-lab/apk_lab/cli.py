from __future__ import annotations

import argparse
import json
import re
import shlex
import sys
import tempfile
import zipfile
from pathlib import Path
from typing import Any

from apk_lab.archives import ArchiveSecurityError, is_contained_path
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


def materialize_split_member(
    zf: zipfile.ZipFile, split_filename: str, extracted_dir: Path
) -> Path:
    """Safely extracts a split APK member into extracted_dir, creating parent directories."""
    dest = (extracted_dir / split_filename).resolve()
    if not is_contained_path(dest, extracted_dir, allow_equal=False):
        raise ArchiveSecurityError(
            f"Split member {split_filename} escapes extraction directory {extracted_dir}"
        )
    dest.parent.mkdir(parents=True, exist_ok=True)
    with zf.open(split_filename) as src, open(dest, "wb") as dst:
        while chunk := src.read(64 * 1024):
            dst.write(chunk)
    return dest


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
            tool_mgr.run_tool_cmd("jadx", jadx_args, check=True)

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
        from apk_lab.morphe import run_compatibility_check

        report, exit_code = run_compatibility_check(
            artifact_path=args.artifact,
            mpp_path=args.mpp,
            expected_package=args.package,
            requested_patches=args.patches,
            all_patches=args.all,
            force=args.force,
            keep_workspace=args.keep_workspace,
            workspace_root=args.workspace_root,
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
        "--mpp", required=True, help="Path to compiled .mpp patch bundle"
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

    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    if hasattr(args, "handler"):
        return args.handler(args)
    return ExitCode.SUCCESS


if __name__ == "__main__":
    sys.exit(main())
