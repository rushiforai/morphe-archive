from __future__ import annotations

import difflib
import hashlib
import tempfile
import zipfile
from pathlib import Path
from typing import Any

from apk_lab.inspection import InspectionError, inspect_artifact
from apk_lab.models import ArtifactComparison, ContainerType, ExitCode
from apk_lab.tools import ToolManager


def compute_zip_member_hash(zf: zipfile.ZipFile, zinfo: zipfile.ZipInfo) -> str:
    """Streams a zip member in chunks to compute its SHA-256 digest."""
    h = hashlib.sha256()
    with zf.open(zinfo) as f:
        while chunk := f.read(64 * 1024):
            h.update(chunk)
    return h.hexdigest()


def extract_artifact_content_hashes(
    artifact_path: Path, inspection: Any, prefix: str
) -> dict[str, tuple[str, ...]]:
    """Extracts SHA-256 hashes of members matching prefix from an APK or split container."""
    hashes_map: dict[str, list[str]] = {}

    if inspection.container_type == ContainerType.APK or not inspection.splits:
        with zipfile.ZipFile(artifact_path, "r") as zf:
            for info in zf.infolist():
                if info.is_dir() or not info.filename.startswith(prefix):
                    continue
                h = compute_zip_member_hash(zf, info)
                hashes_map.setdefault(info.filename, []).append(h)
    else:
        with tempfile.TemporaryDirectory(prefix="apk-lab-cmp-") as tmp_dir:
            tmp_dir_path = Path(tmp_dir)
            with zipfile.ZipFile(artifact_path, "r") as container_zf:
                for split in inspection.splits:
                    split_dest = tmp_dir_path / Path(split.filename).name
                    with (
                        container_zf.open(split.filename) as src,
                        open(split_dest, "wb") as dst,
                    ):
                        while chunk := src.read(64 * 1024):
                            dst.write(chunk)
                    with zipfile.ZipFile(split_dest, "r") as member_zf:
                        for info in member_zf.infolist():
                            if info.is_dir() or not info.filename.startswith(prefix):
                                continue
                            h = compute_zip_member_hash(member_zf, info)
                            hashes_map.setdefault(info.filename, []).append(h)
                    split_dest.unlink(missing_ok=True)

    return {k: tuple(sorted(v)) for k, v in hashes_map.items()}


def materialize_base_apk(artifact_path: Path, inspection: Any, dest_dir: Path) -> Path:
    """Extracts the base APK from an artifact if it is a split container, or returns path directly."""
    if inspection.container_type == ContainerType.APK or not inspection.splits:
        return artifact_path

    base_splits = [s for s in inspection.splits if s.is_base]
    if len(base_splits) != 1:
        raise InspectionError(
            f"Expected exactly 1 base split in {artifact_path}, found {len(base_splits)}",
            ExitCode.INVALID_ARTIFACT,
        )

    base_split = base_splits[0]
    out_path = dest_dir / "base.apk"
    with (
        zipfile.ZipFile(artifact_path, "r") as container_zf,
        container_zf.open(base_split.filename) as src,
        open(out_path, "wb") as dst,
    ):
        while chunk := src.read(64 * 1024):
            dst.write(chunk)
    return out_path


def locate_class_source(sources_dir: Path, fqcn: str) -> Path | None:
    """Locates decompiled Java/Kotlin source file for an FQCN under sources_dir."""
    if not sources_dir.is_dir():
        return None
    rel = fqcn.replace(".", "/")
    for ext in (".java", ".kt"):
        cand = sources_dir / f"{rel}{ext}"
        if cand.is_file():
            return cand
    if "$" in fqcn:
        outer = fqcn.split("$", 1)[0].replace(".", "/")
        for ext in (".java", ".kt"):
            cand = sources_dir / f"{outer}{ext}"
            if cand.is_file():
                return cand
    return None


def compare_class_sources(
    old_file: Path | None, new_file: Path | None, fqcn: str
) -> dict[str, Any]:
    """Compares two decompiled class source files and returns status and bounded diff."""
    if old_file is None and new_file is None:
        return {
            "status": "missing",
            "diff": f"Class {fqcn} not found in old or new artifact",
        }
    if old_file is None and new_file is not None:
        return {"status": "added", "diff": None}
    if old_file is not None and new_file is None:
        return {"status": "removed", "diff": None}

    old_text = old_file.read_text(encoding="utf-8", errors="replace")
    new_text = new_file.read_text(encoding="utf-8", errors="replace")

    if old_text == new_text:
        return {"status": "unchanged", "diff": None}

    diff_lines = list(
        difflib.unified_diff(
            old_text.splitlines(keepends=True),
            new_text.splitlines(keepends=True),
            fromfile=f"a/{fqcn}.java",
            tofile=f"b/{fqcn}.java",
        )
    )
    if len(diff_lines) > 500:
        diff_lines = diff_lines[:500] + ["\n... diff truncated at 500 lines ...\n"]
    return {"status": "modified", "diff": "".join(diff_lines)}


def compare_artifacts(
    old_path: str | Path,
    new_path: str | Path,
    requested_classes: list[str] | None = None,
    tool_mgr: ToolManager | None = None,
) -> ArtifactComparison:
    """Compares two APK/APKM artifacts and returns a structured comparison."""
    old_info = inspect_artifact(old_path)
    new_info = inspect_artifact(new_path)

    version_changed = old_info.version_name != new_info.version_name
    version_code_delta = new_info.version_code - old_info.version_code
    signer_changed = (
        old_info.signing_certificate_sha256 != new_info.signing_certificate_sha256
    )

    # Compare splits
    old_splits_by_name = {s.filename: s for s in old_info.splits}
    new_splits_by_name = {s.filename: s for s in new_info.splits}

    added_splits = sorted(
        set(new_splits_by_name.keys()) - set(old_splits_by_name.keys())
    )
    removed_splits = sorted(
        set(old_splits_by_name.keys()) - set(new_splits_by_name.keys())
    )
    modified_splits: list[str] = []
    for common in sorted(
        set(old_splits_by_name.keys()) & set(new_splits_by_name.keys())
    ):
        if old_splits_by_name[common].sha256 != new_splits_by_name[common].sha256:
            modified_splits.append(common)

    # Compare native libraries using content hashes
    old_lib_hashes = extract_artifact_content_hashes(old_path, old_info, "lib/")
    new_lib_hashes = extract_artifact_content_hashes(new_path, new_info, "lib/")

    added_libs = sorted(set(new_lib_hashes.keys()) - set(old_lib_hashes.keys()))
    removed_libs = sorted(set(old_lib_hashes.keys()) - set(new_lib_hashes.keys()))
    modified_libs = sorted(
        k
        for k in (set(old_lib_hashes.keys()) & set(new_lib_hashes.keys()))
        if old_lib_hashes[k] != new_lib_hashes[k]
    )

    # Compare assets using content hashes
    old_asset_hashes = extract_artifact_content_hashes(old_path, old_info, "assets/")
    new_asset_hashes = extract_artifact_content_hashes(new_path, new_info, "assets/")

    added_assets = sorted(set(new_asset_hashes.keys()) - set(old_asset_hashes.keys()))
    removed_assets = sorted(set(old_asset_hashes.keys()) - set(new_asset_hashes.keys()))
    modified_assets = sorted(
        k
        for k in (set(old_asset_hashes.keys()) & set(new_asset_hashes.keys()))
        if old_asset_hashes[k] != new_asset_hashes[k]
    )

    # Compare requested classes if requested
    classes_diff: dict[str, Any] = {}
    if requested_classes:
        if tool_mgr is None:
            tool_mgr = ToolManager()

        if not tool_mgr.is_tool_installed("jadx"):
            for cls in requested_classes:
                classes_diff[cls] = {
                    "status": "tool_unavailable",
                    "diff": "JADX is not installed in cache",
                }
        else:
            with tempfile.TemporaryDirectory(prefix="apk-lab-cmp-jadx-") as tmp_dir:
                tmp_dir_path = Path(tmp_dir)
                old_base_dir = tmp_dir_path / "old_base"
                old_base_dir.mkdir()
                new_base_dir = tmp_dir_path / "new_base"
                new_base_dir.mkdir()

                old_base_apk = materialize_base_apk(old_path, old_info, old_base_dir)
                new_base_apk = materialize_base_apk(new_path, new_info, new_base_dir)

                old_sources_dir = tmp_dir_path / "old_src"
                new_sources_dir = tmp_dir_path / "new_src"

                pkgs = {
                    cls.rsplit(".", 1)[0] if "." in cls else cls
                    for cls in requested_classes
                }
                pkg_args = []
                for pkg in sorted(pkgs):
                    pkg_args.extend(["--include-pkg", pkg])

                old_jadx_args = (
                    ["-d", str(old_sources_dir), "--no-res"]
                    + pkg_args
                    + [str(old_base_apk)]
                )
                new_jadx_args = (
                    ["-d", str(new_sources_dir), "--no-res"]
                    + pkg_args
                    + [str(new_base_apk)]
                )

                old_res = tool_mgr.run_tool_cmd("jadx", old_jadx_args)
                new_res = tool_mgr.run_tool_cmd("jadx", new_jadx_args)

                if old_res.returncode != 0:
                    for cls in requested_classes:
                        classes_diff[cls] = {
                            "status": "error",
                            "diff": f"JADX failed on old artifact: {old_res.stderr[:300]}",
                        }
                elif new_res.returncode != 0:
                    for cls in requested_classes:
                        classes_diff[cls] = {
                            "status": "error",
                            "diff": f"JADX failed on new artifact: {new_res.stderr[:300]}",
                        }
                else:
                    for cls in requested_classes:
                        old_file = locate_class_source(old_sources_dir / "sources", cls)
                        new_file = locate_class_source(new_sources_dir / "sources", cls)
                        classes_diff[cls] = compare_class_sources(
                            old_file, new_file, cls
                        )

    return ArtifactComparison(
        old_inspection=old_info,
        new_inspection=new_info,
        version_changed=version_changed,
        version_code_delta=version_code_delta,
        signer_changed=signer_changed,
        added_splits=added_splits,
        removed_splits=removed_splits,
        modified_splits=modified_splits,
        dex_classes_delta=new_info.dex_classes_count - old_info.dex_classes_count,
        dex_methods_delta=new_info.dex_methods_count - old_info.dex_methods_count,
        added_native_libraries=added_libs,
        removed_native_libraries=removed_libs,
        modified_native_libraries=modified_libs,
        added_assets=added_assets,
        removed_assets=removed_assets,
        modified_assets=modified_assets,
        classes_diff=classes_diff,
    )


def format_comparison_summary(cmp: ArtifactComparison) -> str:
    """Formats a human-readable comparison summary."""
    lines: list[str] = []
    lines.append("=" * 60)
    lines.append(f"APK COMPARISON: {cmp.old_inspection.package_name}")
    lines.append("=" * 60)

    # Version comparison
    old_ver = f"{cmp.old_inspection.version_name} ({cmp.old_inspection.version_code})"
    new_ver = f"{cmp.new_inspection.version_name} ({cmp.new_inspection.version_code})"
    delta_sign = (
        f"+{cmp.version_code_delta}"
        if cmp.version_code_delta >= 0
        else str(cmp.version_code_delta)
    )
    lines.append(f"Version:      {old_ver} -> {new_ver} [delta: {delta_sign}]")

    # Signer comparison
    old_signer = (cmp.old_inspection.signing_certificate_sha256 or "None")[:16] + "..."
    new_signer = (cmp.new_inspection.signing_certificate_sha256 or "None")[:16] + "..."
    signer_status = "CHANGED (ALERT!)" if cmp.signer_changed else "MATCH"
    lines.append(f"Signer SHA:   {old_signer} -> {new_signer} [{signer_status}]")

    # Splits
    lines.append(
        f"Splits:       {len(cmp.old_inspection.splits)} old, {len(cmp.new_inspection.splits)} new"
    )
    if cmp.added_splits:
        lines.append(f"  + Added:    {', '.join(cmp.added_splits)}")
    if cmp.removed_splits:
        lines.append(f"  - Removed:  {', '.join(cmp.removed_splits)}")
    if cmp.modified_splits:
        lines.append(f"  * Modified: {', '.join(cmp.modified_splits)}")

    # DEX stats
    lines.append(
        f"DEX Classes:  {cmp.old_inspection.dex_classes_count} -> {cmp.new_inspection.dex_classes_count} "
        f"[delta: {cmp.dex_classes_delta:+d}]"
    )
    lines.append(
        f"DEX Methods:  {cmp.old_inspection.dex_methods_count} -> {cmp.new_inspection.dex_methods_count} "
        f"[delta: {cmp.dex_methods_delta:+d}]"
    )

    # Native libs
    if cmp.added_native_libraries:
        lines.append(f"Native Libs (+): {len(cmp.added_native_libraries)} added")
    if cmp.removed_native_libraries:
        lines.append(f"Native Libs (-): {len(cmp.removed_native_libraries)} removed")
    if cmp.modified_native_libraries:
        lines.append(f"Native Libs (*): {len(cmp.modified_native_libraries)} modified")

    # Assets
    if cmp.added_assets:
        lines.append(f"Assets (+):      {len(cmp.added_assets)} added")
    if cmp.removed_assets:
        lines.append(f"Assets (-):      {len(cmp.removed_assets)} removed")
    if cmp.modified_assets:
        lines.append(f"Assets (*):      {len(cmp.modified_assets)} modified")

    if cmp.classes_diff:
        lines.append("\nClass Diffs:")
        for cls, res in sorted(cmp.classes_diff.items()):
            status = res.get("status", "unknown")
            lines.append(f"  [{status.upper()}] {cls}")
            diff_text = res.get("diff")
            if status == "modified" and diff_text:
                for diff_line in diff_text.splitlines():
                    lines.append(f"    {diff_line}")

    lines.append("=" * 60)
    return "\n".join(lines)
