from __future__ import annotations

import argparse
import hashlib
import re
import subprocess
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Literal

from apk_lab.archives import (
    ArchiveSecurityError,
    MaterializedApk,
    compute_zip_member_sha256,
    is_contained_path,
    materialize_artifact_apks,
)
from apk_lab.inspection import find_build_tools_bin, inspect_artifact
from apk_lab.models import (
    ExitCode,
    ResourceMatch,
    ResourceQueryReport,
)


@dataclass(frozen=True)
class ParsedQuery:
    kind: Literal["id", "type_name", "path", "bare_name", "value"]
    raw_query: str
    resource_id: str | None = None
    package_name: str | None = None
    resource_type: str | None = None
    resource_name: str | None = None
    path: str | None = None
    text_value: str | None = None


def normalize_resource_query(query: str) -> ParsedQuery:
    """Normalizes and validates resource query, rejecting control characters, traversal, and invalid syntax."""
    clean = query.strip()
    if not clean:
        raise ValueError("Resource query cannot be empty")

    # Reject control characters
    if any(ord(c) < 32 for c in clean):
        raise ValueError(
            f"Resource query contains invalid control characters: {clean!r}"
        )

    # 0. Text / value query: text:<str>, val:<str>, value:<str>
    if clean.startswith(("text:", "val:", "value:")) or clean.lower().startswith(
        ("text:", "val:", "value:")
    ):
        _prefix, rest = clean.split(":", 1)
        search_text = rest.strip()
        if not search_text:
            raise ValueError("Text/value query string cannot be empty")
        return ParsedQuery(kind="value", raw_query=clean, text_value=search_text)

    # Reject path traversal or leading slashes
    if ".." in clean or clean.startswith("/"):
        raise ValueError(
            f"Resource query contains path traversal or absolute path: '{clean}'"
        )

    # 1. Hex ID: 0x7f08028e or 7f08028e
    if re.match(r"^(?:0x)?[0-9a-fA-F]{8}$", clean):
        val = int(clean, 16)
        norm_id = f"0x{val:08x}"
        return ParsedQuery(kind="id", raw_query=clean, resource_id=norm_id)

    # 2. Direct paths: res/..., assets/..., lib/..., AndroidManifest.xml
    if clean.startswith(("res/", "assets/", "lib/")) or clean == "AndroidManifest.xml":
        return ParsedQuery(kind="path", raw_query=clean, path=clean)

    # 3. @+id/name or @type/name or package:type/name or type/name
    type_name_str = clean
    if type_name_str.startswith("@+id/"):
        type_name_str = "id/" + type_name_str[5:]
    elif type_name_str.startswith("@"):
        type_name_str = type_name_str[1:]

    pkg: str | None = None
    if ":" in type_name_str:
        pkg, type_name_str = type_name_str.split(":", 1)

    if "/" in type_name_str:
        parts = type_name_str.split("/", 1)
        res_type = parts[0].strip()
        res_name = parts[1].strip()
        if not res_type or not res_name:
            raise ValueError(f"Malformed resource type/name query: '{clean}'")
        return ParsedQuery(
            kind="type_name",
            raw_query=clean,
            package_name=pkg,
            resource_type=res_type,
            resource_name=res_name,
        )

    # 4. Bare name (e.g. 'map_preview_trails' or 'app_name')
    return ParsedQuery(kind="bare_name", raw_query=clean, resource_name=clean)


def parse_aapt2_resource_dump(
    dump_text: str,
    split_name: str,
    container_member: str | None,
) -> list[dict[str, Any]]:
    """Parses aapt2 dump resources text output into structured resource entries."""
    entries: list[dict[str, Any]] = []

    current_pkg: str | None = None
    current_res_id: str | None = None
    current_type: str | None = None
    current_name: str | None = None

    lines = dump_text.splitlines()

    for line in lines:
        pkg_match = re.search(r"Package\s+name=([^\s]+)", line)
        if pkg_match:
            current_pkg = pkg_match.group(1)
            continue

        res_match = re.search(r"resource\s+(0x[0-9a-fA-F]+)\s+([^\s/]+)/([^\s]+)", line)
        if res_match:
            current_res_id = f"0x{int(res_match.group(1), 16):08x}"
            current_type = res_match.group(2)
            current_name = res_match.group(3)
            continue

        # Configuration line (indented under resource)
        # e.g.: (xxhdpi) (file) res/drawable-xxhdpi/foo.webp
        # or: () "My App"
        # or: (fr) "Mon App"
        if current_res_id and line.startswith("    "):
            content = line.strip()
            qual_match = re.match(r"\(([^)]*)\)\s*(.*)", content)
            if qual_match:
                qual_str = qual_match.group(1).strip()
                rest = qual_match.group(2).strip()

                file_path: str | None = None
                scalar_val: str | None = None

                if qual_str == "file":
                    qualifier = None
                    f_parts = rest.split()
                    if f_parts:
                        file_path = f_parts[0]
                else:
                    qualifier = qual_str if qual_str else None
                    if rest.startswith("(file)"):
                        f_parts = rest[6:].strip().split()
                        if f_parts:
                            file_path = f_parts[0]
                    else:
                        scalar_val = rest

                entries.append(
                    {
                        "split_name": split_name,
                        "container_member": container_member,
                        "package_name": current_pkg,
                        "resource_id": current_res_id,
                        "resource_type": current_type,
                        "resource_name": current_name,
                        "qualifier": qualifier,
                        "path": file_path,
                        "value": scalar_val,
                    }
                )

    return entries


def enumerate_raw_zip_members(
    mat_apk: MaterializedApk,
) -> list[dict[str, Any]]:
    """Enumerates manifest, res/, assets/, and lib/ entries directly from APK zip."""
    entries: list[dict[str, Any]] = []
    with zipfile.ZipFile(mat_apk.path, "r") as zf:
        for info in zf.infolist():
            if info.is_dir():
                continue
            name = info.filename
            kind: Literal["resource", "asset", "library", "manifest"] | None = None
            if name == "AndroidManifest.xml":
                kind = "manifest"
            elif name.startswith("res/"):
                kind = "resource"
            elif name.startswith("assets/"):
                kind = "asset"
            elif name.startswith("lib/"):
                kind = "library"

            if kind:
                entries.append(
                    {
                        "split_name": mat_apk.split_name,
                        "container_member": mat_apk.container_member,
                        "package_name": None,
                        "resource_id": None,
                        "resource_type": None,
                        "resource_name": Path(name).stem,
                        "qualifier": None,
                        "path": name,
                        "value": None,
                        "kind": kind,
                        "sha256": None,
                    }
                )
    return entries


def query_apk_resources(
    materialized_apks: list[MaterializedApk],
    parsed_query: ParsedQuery,
) -> tuple[list[ResourceMatch], list[str]]:
    """Queries resources across all splits using aapt2 dump resources and raw member enumeration."""
    aapt2 = find_build_tools_bin("aapt2")

    arsc_entries: list[dict[str, Any]] = []
    raw_entries: list[dict[str, Any]] = []
    warnings: list[str] = []

    for mat in materialized_apks:
        has_arsc = False
        try:
            with zipfile.ZipFile(mat.path, "r") as zf:
                has_arsc = "resources.arsc" in zf.namelist()
        except zipfile.BadZipFile:
            has_arsc = False

        if not has_arsc:
            # Still enumerate raw zip members (e.g. assets, lib, manifest)
            raw_entries.extend(enumerate_raw_zip_members(mat))
            continue

        # 1. Run aapt2 dump resources
        res = subprocess.run(
            [str(aapt2), "dump", "resources", str(mat.path)],
            capture_output=True,
            text=True,
            errors="replace",
            check=False,
        )
        if res.returncode == 0:
            parsed = parse_aapt2_resource_dump(
                res.stdout, mat.split_name, mat.container_member
            )
            arsc_entries.extend(parsed)
        else:
            stderr_excerpt = res.stderr.strip()[:200]
            warnings.append(
                f"aapt2 dump resources returned code {res.returncode} on split '{mat.split_name}': {stderr_excerpt}"
            )

        # 2. Raw member enumeration
        raw_list = enumerate_raw_zip_members(mat)
        raw_entries.extend(raw_list)

    # Assign kind to arsc entries
    for e in arsc_entries:
        e["kind"] = "resource"
        e["sha256"] = None
    # Merge matching entries
    candidates: list[dict[str, Any]] = []

    if parsed_query.kind == "id":
        target_id = parsed_query.resource_id
        candidates = [e for e in arsc_entries if e["resource_id"] == target_id]

    elif parsed_query.kind == "type_name":
        for e in arsc_entries:
            if (
                e["resource_type"] == parsed_query.resource_type
                and e["resource_name"] == parsed_query.resource_name
                and (
                    parsed_query.package_name is None
                    or e["package_name"] == parsed_query.package_name
                )
            ):
                candidates.append(e)

    elif parsed_query.kind == "path":
        target_path = parsed_query.path
        # Look in ARSC entries first
        matching_arsc = [e for e in arsc_entries if e["path"] == target_path]
        if matching_arsc:
            candidates.extend(matching_arsc)
        else:
            # Fall back to raw entries
            matching_raw = [e for e in raw_entries if e["path"] == target_path]
            candidates.extend(matching_raw)
    elif parsed_query.kind == "value":
        target_lower = (parsed_query.text_value or "").lower()
        for e in arsc_entries:
            val = e.get("value")
            if val and target_lower in val.lower():
                candidates.append(e)

    elif parsed_query.kind == "bare_name":
        target_name = parsed_query.resource_name
        # Match ARSC by resource_name
        matching_arsc = [e for e in arsc_entries if e["resource_name"] == target_name]
        candidates.extend(matching_arsc)
        # Match raw entries where stem or filename equals target_name
        for r in raw_entries:
            if r["path"]:
                p = Path(r["path"])
                if (p.stem == target_name or p.name == target_name) and not any(
                    c.get("path") == r["path"]
                    and c.get("split_name") == r["split_name"]
                    for c in candidates
                ):
                    candidates.append(r)

    # Hash only the matched split-and-path pairs needed for duplicate_status and sha256
    split_apk_map = {mat.split_name: mat.path for mat in materialized_apks}
    file_hashes: dict[tuple[str, str], str] = {}

    for c in candidates:
        c_path = c.get("path")
        c_split = c.get("split_name")
        if c_path and c_split:
            key = (c_split, c_path)
            if key not in file_hashes:
                apk_path = split_apk_map.get(c_split)
                if apk_path and apk_path.is_file():
                    with zipfile.ZipFile(apk_path, "r") as zf:
                        try:
                            file_hashes[key] = compute_zip_member_sha256(zf, c_path)
                        except KeyError:
                            pass
            c["sha256"] = file_hashes.get(key)

    # Grouping to calculate duplicate_status
    # Group ARSC by (package_name, resource_type, resource_name, qualifier)
    # Group raw by (kind, path)
    groups: dict[Any, list[dict[str, Any]]] = {}
    for c in candidates:
        grp_key: tuple[Any, ...]
        if c.get("resource_type") and c.get("resource_name"):
            grp_key = (
                "arsc",
                c.get("package_name"),
                c.get("resource_type"),
                c.get("resource_name"),
                c.get("qualifier"),
            )
        elif c.get("resource_id"):
            grp_key = ("id", c.get("resource_id"), c.get("qualifier"))
        else:
            grp_key = ("raw", c.get("kind"), c.get("path"))
        groups.setdefault(grp_key, []).append(c)

    # Compute duplicate_status per row
    results: list[ResourceMatch] = []
    for grp_key, rows in groups.items():
        if len(rows) == 1:
            dup_status: Literal["unique", "equivalent", "conflict"] = "unique"
        else:
            # Multiple rows across splits
            # If all rows have same sha256 (for file) or same value (for scalar): equivalent, else conflict
            all_hashes = [r.get("sha256") for r in rows]
            all_values = [r.get("value") for r in rows]
            if rows[0].get("path") is not None:
                if len(set(all_hashes)) == 1 and all_hashes[0] is not None:
                    dup_status = "equivalent"
                else:
                    dup_status = "conflict"
            else:
                if len(set(all_values)) == 1:
                    dup_status = "equivalent"
                else:
                    dup_status = "conflict"

        for r in rows:
            p_val = r.get("path")
            kind_val: Literal["resource", "asset", "library", "manifest"]
            if r.get("kind"):
                kind_val = r["kind"]
            elif p_val and p_val.startswith("assets/"):
                kind_val = "asset"
            elif p_val and p_val.startswith("lib/"):
                kind_val = "library"
            elif p_val and p_val == "AndroidManifest.xml":
                kind_val = "manifest"
            else:
                kind_val = "resource"

            # Determine Morphe mode
            morphe_mode: Literal["resourcePatch", "rawResourcePatch"]
            if kind_val in ("asset", "library"):
                morphe_mode = "rawResourcePatch"
            else:
                # manifest and resources use resourcePatch
                morphe_mode = "resourcePatch"

            results.append(
                ResourceMatch(
                    container_member=r.get("container_member"),
                    split_name=r["split_name"],
                    package_name=r.get("package_name"),
                    resource_id=r.get("resource_id"),
                    resource_type=r.get("resource_type"),
                    resource_name=r.get("resource_name"),
                    qualifier=r.get("qualifier"),
                    value=r.get("value"),
                    path=r.get("path"),
                    kind=kind_val,
                    morphe_mode=morphe_mode,
                    sha256=r.get("sha256"),
                    duplicate_status=dup_status,
                )
            )

    # Sort deterministically by (logical_name, split_name, qualifier, path)
    def sort_key(m: ResourceMatch) -> tuple[str, str, str, str]:
        if m.resource_type and m.resource_name:
            logical = f"{m.resource_type}/{m.resource_name}"
        elif m.resource_name:
            logical = m.resource_name
        elif m.path:
            logical = m.path
        else:
            logical = ""
        return (
            logical,
            m.split_name,
            m.qualifier or "",
            m.path or "",
        )

    return sorted(results, key=sort_key), warnings


def derive_split_dir_name(split_name: str, container_member: str | None) -> str:
    """Derives slug-hash8 directory name for extraction."""
    slug = re.sub(r"[^A-Za-z0-9._-]", "_", split_name)
    if slug in ("", ".", ".."):
        slug = "split"
    if container_member:
        hash8 = hashlib.sha256(container_member.encode()).hexdigest()[:8]
    else:
        hash8 = "base"
    return f"{slug}-{hash8}"


def extract_matched_resources(
    extract_dir: Path,
    materialized_apks: list[MaterializedApk],
    matches: list[ResourceMatch],
) -> tuple[list[str], list[str]]:
    """Extracts file-backed matched resources with strict preflight validation.

    Returns (extracted_paths, warnings).
    """
    dest_root = extract_dir.resolve()
    if dest_root.is_symlink():
        raise ArchiveSecurityError(
            f"Extraction directory root cannot be a symlink: {dest_root}"
        )
    if dest_root.is_file():
        raise ArchiveSecurityError(
            f"Extraction directory root is a regular file: {dest_root}"
        )

    warnings: list[str] = []
    file_matches = [m for m in matches if m.path is not None]
    value_matches = [m for m in matches if m.path is None]

    if value_matches:
        warnings.append(
            f"Skipped extracting {len(value_matches)} scalar resource(s) without file payload."
        )

    if not file_matches:
        return [], warnings

    # Map materialized splits by split_name
    split_map = {mat.split_name: mat for mat in materialized_apks}

    # Preflight phase: precompute destinations and check safety
    planned_writes: list[tuple[MaterializedApk, str, Path]] = []
    dest_seen: dict[Path, str] = {}

    for m in file_matches:
        mat = split_map.get(m.split_name)
        if not mat or not m.path:
            continue

        split_dir_name = derive_split_dir_name(m.split_name, m.container_member)
        dest_path = (dest_root / split_dir_name / m.path).resolve()

        # 1. Contained check
        if not is_contained_path(dest_path, dest_root, allow_equal=False):
            raise ArchiveSecurityError(
                f"Extracted file escapes target directory: {dest_path}"
            )

        # 2. Reject existing destination before any write
        if dest_path.is_file():
            raise ArchiveSecurityError(f"Destination file already exists: {dest_path}")

        # 3. Collision check
        if dest_path in dest_seen:
            raise ArchiveSecurityError(
                f"Conflicting duplicate extraction destination: {dest_path}"
            )
        dest_seen[dest_path] = m.split_name

        planned_writes.append((mat, m.path, dest_path))

    # Execution phase: write all files safely
    dest_root.mkdir(parents=True, exist_ok=True)
    extracted_paths: list[str] = []

    for mat, zip_path, dest in planned_writes:
        dest.parent.mkdir(parents=True, exist_ok=True)
        with (
            zipfile.ZipFile(mat.path, "r") as zf,
            zf.open(zip_path) as src,
            open(dest, "wb") as dst,
        ):
            while chunk := src.read(64 * 1024):
                dst.write(chunk)
        extracted_paths.append(str(dest))

    return extracted_paths, warnings


def inspect_resources_cli(
    artifact_path: Path,
    query_str: str,
    extract_dir: Path | None = None,
) -> int:
    """Main CLI function for res subcommand."""
    parsed_query = normalize_resource_query(query_str)
    inspection = inspect_artifact(artifact_path)

    with materialize_artifact_apks(artifact_path, inspection) as apks:
        matches, query_warnings = query_apk_resources(apks, parsed_query)

        extracted_paths: list[str] = []
        warnings: list[str] = list(query_warnings)

        if extract_dir:
            ext_paths, ext_warnings = extract_matched_resources(
                extract_dir=extract_dir,
                materialized_apks=apks,
                matches=matches,
            )
            extracted_paths.extend(ext_paths)
            warnings.extend(ext_warnings)

        report = ResourceQueryReport(
            query=query_str,
            matches=matches,
            extracted_paths=extracted_paths,
            warnings=warnings,
        )
        print(report.format_human())

    return ExitCode.SUCCESS


def run_res(args: argparse.Namespace) -> int:
    """CLI handler for res subcommand."""
    return inspect_resources_cli(
        artifact_path=Path(args.artifact),
        query_str=args.query,
        extract_dir=Path(args.extract) if args.extract else None,
    )
