from __future__ import annotations

import hashlib
import os
import re
import struct
import subprocess
import tempfile
import zipfile
from pathlib import Path

from apk_lab.archives import ArchiveSecurityError, inspect_safe_zip
from apk_lab.models import (
    AndroidManifestInfo,
    ArtifactInspection,
    ContainerType,
    ExitCode,
    SplitInfo,
)


class InspectionError(Exception):
    """Raised when an artifact is invalid, malformed, or has mismatched splits."""

    def __init__(self, message: str, exit_code: ExitCode = ExitCode.INVALID_ARTIFACT):
        super().__init__(message)
        self.exit_code = exit_code


def find_build_tools_bin(bin_name: str) -> Path:
    """Finds an Android build-tools binary (e.g., aapt2, apksigner, zipalign)."""
    sdk_dir: Path | None = None
    if os.environ.get("ANDROID_HOME"):
        sdk_dir = Path(os.environ["ANDROID_HOME"])
    elif os.environ.get("ANDROID_SDK_ROOT"):
        sdk_dir = Path(os.environ["ANDROID_SDK_ROOT"])
    else:
        # Check local.properties
        candidates = [
            Path("local.properties"),
            Path(__file__).parent.parent.parent.parent / "local.properties",
        ]
        for candidate in candidates:
            if candidate.exists():
                for line in candidate.read_text().splitlines():
                    if line.startswith("sdk.dir="):
                        sdk_dir = Path(line.split("=", 1)[1].strip())
                        break
                if sdk_dir:
                    break

    if sdk_dir and sdk_dir.is_dir():
        # Look for 36.0.0 first, then any latest build-tools
        bt_36 = sdk_dir / "build-tools" / "36.0.0" / bin_name
        if bt_36.exists():
            return bt_36
        bt_root = sdk_dir / "build-tools"
        if bt_root.is_dir():
            for version_dir in sorted(bt_root.iterdir(), reverse=True):
                candidate = version_dir / bin_name
                if candidate.exists():
                    return candidate

    # Fallback to PATH
    import shutil

    which = shutil.which(bin_name)
    if which:
        return Path(which)

    raise InspectionError(
        f"Android build tool '{bin_name}' not found. Check ANDROID_HOME or local.properties",
        ExitCode.USAGE_OR_TOOL_ERROR,
    )


def compute_bytes_sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def compute_file_sha256(path: Path | str) -> str:
    hasher = hashlib.sha256()
    with open(path, "rb") as f:
        while chunk := f.read(64 * 1024):
            hasher.update(chunk)
    return hasher.hexdigest()


def parse_dex_header(dex_bytes: bytes) -> tuple[int, int]:
    """Parses DEX class and method count from header bytes."""
    if len(dex_bytes) < 0x70:
        return 0, 0
    magic = dex_bytes[:8]
    if not magic.startswith((b"dex\n", b"cdex")):
        return 0, 0

    method_count = struct.unpack_from("<I", dex_bytes, 0x58)[0]
    class_count = struct.unpack_from("<I", dex_bytes, 0x60)[0]
    return class_count, method_count


def parse_badging_text(out: str) -> AndroidManifestInfo:
    """Parses aapt2 dump badging text output into AndroidManifestInfo."""
    package_line = ""
    for line in out.splitlines():
        if line.startswith("package:"):
            package_line = line
            break

    pkg_match = re.search(r"\bname='([^']+)'", package_line)
    if not pkg_match:
        raise InspectionError(
            "Could not parse package name from aapt2 badging output",
            ExitCode.INVALID_ARTIFACT,
        )
    pkg_name = pkg_match.group(1)
    vc_match = re.search(r"\bversionCode='(\d+)'", package_line)
    version_code = int(vc_match.group(1)) if vc_match else 0
    vn_match = re.search(r"\bversionName='([^']*)'", package_line)
    version_name = vn_match.group(1) if vn_match else ""
    split_match = re.search(r"\bsplit='([^']+)'", package_line)
    split_name = split_match.group(1) if split_match else None

    min_sdk_match = re.search(r"minSdkVersion:'(\d+)'", out)
    min_sdk = int(min_sdk_match.group(1)) if min_sdk_match else None

    target_sdk_match = re.search(r"targetSdkVersion:'(\d+)'", out)
    target_sdk = int(target_sdk_match.group(1)) if target_sdk_match else None

    permissions = re.findall(r"uses-permission:\s+name='([^']+)'", out)

    return AndroidManifestInfo(
        package_name=pkg_name,
        version_code=version_code,
        version_name=version_name,
        min_sdk_version=min_sdk,
        target_sdk_version=target_sdk,
        permissions=sorted(set(permissions)),
        split_name=split_name,
    )


def parse_apk_badging(apk_path: Path) -> AndroidManifestInfo:
    """Uses aapt2 dump badging to extract manifest info."""
    aapt2 = find_build_tools_bin("aapt2")
    res = subprocess.run(
        [str(aapt2), "dump", "badging", str(apk_path)],
        capture_output=True,
        text=True,
        check=False,
    )
    if res.returncode != 0:
        raise InspectionError(
            f"Failed to dump APK badging with aapt2: {res.stderr[:300]}",
            ExitCode.INVALID_ARTIFACT,
        )
    try:
        return parse_badging_text(res.stdout)
    except InspectionError as e:
        raise InspectionError(
            f"{e}: {apk_path}",
            ExitCode.INVALID_ARTIFACT,
        ) from e


def extract_signing_cert_sha256(apk_path: Path) -> str | None:
    """Uses apksigner verify --print-certs to extract certificate SHA-256."""
    try:
        apksigner = find_build_tools_bin("apksigner")
    except InspectionError:
        return None

    res = subprocess.run(
        [str(apksigner), "verify", "--print-certs", str(apk_path)],
        capture_output=True,
        text=True,
        check=False,
    )

    # Note: apksigner verify might exit nonzero on warnings or unsigned APKs
    out = f"{res.stdout}\n{res.stderr}"
    match = re.search(r"Signer #1 certificate SHA-256 digest:\s+([0-9a-fA-F]{64})", out)
    if match:
        return match.group(1).lower()

    # Generic signer SHA-256 fallback
    match_fallback = re.search(r"certificate SHA-256 digest:\s+([0-9a-fA-F]{64})", out)
    if match_fallback:
        return match_fallback.group(1).lower()

    return None


def inspect_single_apk_zip(
    zf: zipfile.ZipFile,
    apk_path_for_tools: Path,
) -> tuple[
    AndroidManifestInfo,
    str | None,
    int,
    int,
    list[str],
    list[str],
    list[str],
    list[str],
    list[str],
]:
    """Inspects a single APK given an open ZipFile and a physical file path for CLI tools."""
    manifest_info = parse_apk_badging(apk_path_for_tools)
    cert_sha256 = extract_signing_cert_sha256(apk_path_for_tools)

    total_classes = 0
    total_methods = 0
    dex_files: list[str] = []
    native_libs: list[str] = []
    resources: list[str] = []
    assets: list[str] = []
    warnings: list[str] = []

    for name in zf.namelist():
        if name.endswith(".dex"):
            dex_files.append(name)
            try:
                dex_bytes = zf.read(name)
                c_cnt, m_cnt = parse_dex_header(dex_bytes)
                total_classes += c_cnt
                total_methods += m_cnt
            except (zipfile.BadZipFile, KeyError, struct.error, OSError) as e:
                warnings.append(f"Failed to parse DEX header for {name}: {e}")
        elif name.startswith("lib/") and name.endswith(".so"):
            native_libs.append(name)
        elif name.startswith("res/"):
            resources.append(name)
        elif name.startswith("assets/"):
            assets.append(name)

    return (
        manifest_info,
        cert_sha256,
        total_classes,
        total_methods,
        sorted(dex_files),
        sorted(native_libs),
        sorted(resources),
        sorted(assets),
        warnings,
    )


def inspect_artifact(artifact_path: str | Path) -> ArtifactInspection:
    """Inspects an APK, APKM, XAPK, or APKS artifact comprehensively."""
    path = Path(artifact_path).resolve()
    if not path.is_file():
        raise InspectionError(
            f"Artifact not found: {path}", ExitCode.USAGE_OR_TOOL_ERROR
        )

    file_size = path.stat().st_size
    file_sha256 = compute_file_sha256(path)

    # 1. Safe zip inspection
    try:
        safe_report = inspect_safe_zip(path)
    except ArchiveSecurityError as e:
        raise InspectionError(
            f"Security validation failed: {e}", ExitCode.INVALID_ARTIFACT
        ) from e

    if safe_report.container_type == ContainerType.UNKNOWN:
        raise InspectionError(
            f"Unsupported or unrecognized Android container format: {path}",
            ExitCode.INVALID_ARTIFACT,
        )

    # 2. Handle Single APK
    if safe_report.container_type == ContainerType.APK:
        with zipfile.ZipFile(path, "r") as zf:
            (
                manifest_info,
                cert_sha256,
                total_classes,
                total_methods,
                dex_files,
                native_libs,
                resources,
                assets,
                warnings,
            ) = inspect_single_apk_zip(zf, path)

        return ArtifactInspection(
            file_path=str(path),
            container_type=ContainerType.APK,
            file_size=file_size,
            sha256=file_sha256,
            package_name=manifest_info.package_name,
            version_name=manifest_info.version_name,
            version_code=manifest_info.version_code,
            min_sdk=manifest_info.min_sdk_version,
            target_sdk=manifest_info.target_sdk_version,
            signing_certificate_sha256=cert_sha256,
            splits=[],
            dex_classes_count=total_classes,
            dex_methods_count=total_methods,
            dex_files=dex_files,
            native_libraries=native_libs,
            resources=resources,
            assets=assets,
            warnings=warnings,
        )

    # 3. Handle Split Container (APKM, XAPK, APKS)
    apk_members = safe_report.apk_members
    if not apk_members:
        raise InspectionError(
            f"Split container {path} contains no .apk files",
            ExitCode.INVALID_ARTIFACT,
        )

    with tempfile.TemporaryDirectory(prefix="apk-lab-inspect-splits-") as tmp_dir:
        tmp_path = Path(tmp_dir)

        # Extract all APK members safely
        with zipfile.ZipFile(path, "r") as container_zf:
            for apk_name in apk_members:
                dest = tmp_path / apk_name
                dest.parent.mkdir(parents=True, exist_ok=True)
                with container_zf.open(apk_name) as src, open(dest, "wb") as dst:
                    while chunk := src.read(64 * 1024):
                        dst.write(chunk)

        # Inspect all split APK members
        inspected_splits: list[
            tuple[
                str,
                Path,
                str,
                int,
                AndroidManifestInfo,
                str | None,
                int,
                int,
                list[str],
                list[str],
                list[str],
                list[str],
                list[str],
            ]
        ] = []
        base_candidates: list[str] = []

        common_pkg: str | None = None
        common_code: int | None = None
        common_signer: str | None = None
        signer_initialized = False

        all_dex_files: set[str] = set()
        all_native_libs: set[str] = set()
        all_resources: set[str] = set()
        all_assets: set[str] = set()
        total_classes = 0
        total_methods = 0
        all_warnings: list[str] = []

        for apk_name in sorted(apk_members):
            apk_file = tmp_path / apk_name
            apk_sha256 = compute_file_sha256(apk_file)
            apk_size = apk_file.stat().st_size

            with zipfile.ZipFile(apk_file, "r") as member_zf:
                (
                    m_info,
                    c_sha256,
                    c_cnt,
                    m_cnt,
                    dexs,
                    libs,
                    res,
                    asts,
                    warns,
                ) = inspect_single_apk_zip(member_zf, apk_file)

            if m_info.split_name is None:
                base_candidates.append(apk_name)

            total_classes += c_cnt
            total_methods += m_cnt
            all_dex_files.update(f"{apk_name}:{d}" for d in dexs)
            all_native_libs.update(libs)
            all_resources.update(res)
            all_assets.update(asts)
            all_warnings.extend(warns)

            # Invariant: Validate every split has the same package and version code
            if common_pkg is None:
                common_pkg = m_info.package_name
                common_code = m_info.version_code
            else:
                if m_info.package_name != common_pkg:
                    raise InspectionError(
                        f"Mismatched package name in split {apk_name}: '{m_info.package_name}' != '{common_pkg}'",
                        ExitCode.INVALID_ARTIFACT,
                    )
                if m_info.version_code != common_code:
                    raise InspectionError(
                        f"Mismatched version code in split {apk_name}: {m_info.version_code} != {common_code}",
                        ExitCode.INVALID_ARTIFACT,
                    )

            # Invariant: Validate signer presence and digest consistency without truthiness bypass
            if not signer_initialized:
                common_signer = c_sha256
                signer_initialized = True
            else:
                if c_sha256 != common_signer:
                    raise InspectionError(
                        f"Mismatched signer in split {apk_name}: '{c_sha256}' != '{common_signer}'",
                        ExitCode.INVALID_ARTIFACT,
                    )

            inspected_splits.append(
                (
                    apk_name,
                    apk_file,
                    apk_sha256,
                    apk_size,
                    m_info,
                    c_sha256,
                    c_cnt,
                    m_cnt,
                    dexs,
                    libs,
                    res,
                    asts,
                    warns,
                )
            )

        # Enforce exactly one base APK
        if len(base_candidates) == 0:
            raise InspectionError(
                f"No base APK found in split container {path}: all members declare split attributes",
                ExitCode.INVALID_ARTIFACT,
            )
        if len(base_candidates) > 1:
            raise InspectionError(
                f"Multiple base APKs found in split container {path}: {base_candidates}",
                ExitCode.INVALID_ARTIFACT,
            )

        base_apk_name = base_candidates[0]
        base_manifest: AndroidManifestInfo | None = None
        splits_info: list[SplitInfo] = []

        for item in inspected_splits:
            (
                apk_name,
                apk_file,
                apk_sha256,
                apk_size,
                m_info,
                c_sha256,
                c_cnt,
                m_cnt,
                dexs,
                libs,
                res,
                asts,
                warns,
            ) = item
            is_base = apk_name == base_apk_name
            if is_base:
                base_manifest = m_info

            split_name = (
                m_info.split_name
                if m_info.split_name is not None
                else Path(apk_name).stem
            )
            splits_info.append(
                SplitInfo(
                    filename=apk_name,
                    split_name=split_name,
                    sha256=apk_sha256,
                    size=apk_size,
                    is_base=is_base,
                )
            )

        return ArtifactInspection(
            file_path=str(path),
            container_type=safe_report.container_type,
            file_size=file_size,
            sha256=file_sha256,
            package_name=base_manifest.package_name,
            version_name=base_manifest.version_name,
            version_code=base_manifest.version_code,
            min_sdk=base_manifest.min_sdk_version,
            target_sdk=base_manifest.target_sdk_version,
            signing_certificate_sha256=common_signer,
            splits=splits_info,
            dex_classes_count=total_classes,
            dex_methods_count=total_methods,
            dex_files=sorted(all_dex_files),
            native_libraries=sorted(all_native_libs),
            resources=sorted(all_resources),
            assets=sorted(all_assets),
            warnings=all_warnings,
        )
