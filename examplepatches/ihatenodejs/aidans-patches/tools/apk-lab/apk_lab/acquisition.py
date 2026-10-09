from __future__ import annotations

import os
import shutil
import subprocess
import tempfile
import zipfile
from enum import Enum
from pathlib import Path

from apk_lab.inspection import inspect_artifact, parse_apk_badging
from apk_lab.models import AndroidManifestInfo, ExitCode
from apk_lab.tools import ToolManager


class AcquisitionError(Exception):
    """Raised when APK acquisition or normalization fails."""

    def __init__(
        self, message: str, exit_code: ExitCode = ExitCode.INFRASTRUCTURE_FAILURE
    ):
        super().__init__(message)
        self.exit_code = exit_code


class AcquisitionSource(str, Enum):
    APKEEP = "apkeep"
    GOOPDL = "goopdl"
    MANUAL = "manual"


FIXED_ZIP_DATETIME = (2026, 1, 1, 0, 0, 0)


def build_apkeep_cmd(
    package_name: str,
    ini_path: Path | str,
    output_dir: Path | str,
) -> list[str]:
    """Builds the exact argument list for apkeep 1.1.0."""
    return [
        "-a",
        package_name,
        "-d",
        "google-play",
        "-i",
        str(ini_path),
        "-o",
        "device=px_9a,locale=en_US,timezone=UTC,split_apk=true",
        str(output_dir),
    ]


def build_goopdl_cmd(
    package_name: str,
    output_dir: Path | str,
    expected_version: str | None = None,
    expected_version_code: int | None = None,
    python_bin: str = "python",
) -> list[str]:
    """Builds the exact argument list for goopdl 1.2.1."""
    cmd = [
        python_bin,
        "-m",
        "goopdl",
        "download",
        package_name,
        "--output",
        str(output_dir),
        "--no-extras",
    ]
    if expected_version_code is not None:
        cmd.extend(["--version", str(expected_version_code)])
    elif expected_version is not None:
        cmd.extend(["--version", expected_version])
    return cmd


def normalize_apks_to_apkm(apk_files: list[Path], out_apkm_path: Path) -> Path:
    """Normalizes a collection of split APK files into a deterministic APKM container."""
    out_apkm_path = Path(out_apkm_path).resolve()
    out_apkm_path.parent.mkdir(parents=True, exist_ok=True)

    if not apk_files:
        raise AcquisitionError(
            "No APK files supplied for normalization", ExitCode.INVALID_ARTIFACT
        )

    # Determine base.apk vs split names
    valid_apks = [
        f
        for f in apk_files
        if f.is_file()
        and f.name.endswith(".apk")
        and not f.name.endswith(".dm")
        and not f.name.endswith(".obb")
    ]
    if not valid_apks:
        raise AcquisitionError(
            "No valid APK files found to package into APKM", ExitCode.INVALID_ARTIFACT
        )

    base_apks: list[tuple[Path, AndroidManifestInfo]] = []
    split_apks: list[tuple[Path, AndroidManifestInfo]] = []
    common_pkg: str | None = None
    common_code: int | None = None

    for apk in valid_apks:
        try:
            m_info = parse_apk_badging(apk)
        except Exception as e:
            raise AcquisitionError(
                f"Failed to inspect APK badging for {apk.name}: {e}",
                ExitCode.INVALID_ARTIFACT,
            ) from e

        if common_pkg is None:
            common_pkg = m_info.package_name
            common_code = m_info.version_code
        else:
            if m_info.package_name != common_pkg:
                raise AcquisitionError(
                    f"Package name mismatch in {apk.name}: '{m_info.package_name}' != '{common_pkg}'",
                    ExitCode.INVALID_ARTIFACT,
                )
            if m_info.version_code != common_code:
                raise AcquisitionError(
                    f"Version code mismatch in {apk.name}: {m_info.version_code} != {common_code}",
                    ExitCode.INVALID_ARTIFACT,
                )

        if m_info.split_name is None:
            base_apks.append((apk, m_info))
        else:
            split_apks.append((apk, m_info))

    if len(base_apks) == 0:
        raise AcquisitionError(
            "No base APK found among acquired files: all files declare split attributes",
            ExitCode.INVALID_ARTIFACT,
        )
    if len(base_apks) > 1:
        raise AcquisitionError(
            f"Multiple base APKs found among acquired files: {[b[0].name for b in base_apks]}",
            ExitCode.INVALID_ARTIFACT,
        )

    named_apks: list[tuple[str, Path]] = []
    target_names: set[str] = set()

    base_apk_path = base_apks[0][0]
    named_apks.append(("base.apk", base_apk_path))
    target_names.add("base.apk")

    for apk, m_info in split_apks:
        target_name = apk.name
        if target_name in target_names:
            raise AcquisitionError(
                f"Duplicate entry name {target_name} in normalization",
                ExitCode.INVALID_ARTIFACT,
            )
        target_names.add(target_name)
        named_apks.append((target_name, apk))

    named_apks.sort(key=lambda x: x[0])

    tmp_apkm = out_apkm_path.with_suffix(".tmp.apkm")
    with zipfile.ZipFile(tmp_apkm, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for target_name, src_file in named_apks:
            zinfo = zipfile.ZipInfo(filename=target_name, date_time=FIXED_ZIP_DATETIME)
            zinfo.external_attr = 0o644 << 16
            zinfo.compress_type = zipfile.ZIP_DEFLATED
            with zf.open(zinfo, "w") as dst, open(src_file, "rb") as src:
                while chunk := src.read(64 * 1024):
                    dst.write(chunk)

    try:
        inspect_artifact(tmp_apkm)
    except Exception as e:
        tmp_apkm.unlink(missing_ok=True)
        raise AcquisitionError(
            f"Produced APKM failed inspection: {e}", ExitCode.INVALID_ARTIFACT
        ) from e

    shutil.move(str(tmp_apkm), str(out_apkm_path))
    return out_apkm_path


def acquire_with_apkeep(
    package_name: str,
    out_dir: Path,
    expected_version: str | None = None,
    expected_version_code: int | None = None,
    tool_mgr: ToolManager | None = None,
) -> Path:
    """Acquires APK using apkeep."""
    tool_mgr = tool_mgr or ToolManager()
    if not tool_mgr.is_tool_installed("apkeep"):
        raise AcquisitionError("apkeep is not installed", ExitCode.USAGE_OR_TOOL_ERROR)

    email = os.environ.get("APKEEP_EMAIL")
    aas_token = os.environ.get("APKEEP_AAS_TOKEN")
    if not email or not aas_token:
        raise AcquisitionError(
            "APKEEP_EMAIL or APKEEP_AAS_TOKEN missing", ExitCode.USAGE_OR_TOOL_ERROR
        )

    out_dir = Path(out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    with tempfile.NamedTemporaryFile("w", suffix=".ini", delete=False) as ini_file:
        ini_path = Path(ini_file.name)
        ini_file.write(f"[google]\nemail = {email}\naas_token = {aas_token}\n")

    try:
        with tempfile.TemporaryDirectory(dir=out_dir, prefix="apkeep-") as attempt_dir:
            attempt_path = Path(attempt_dir)
            cmd = build_apkeep_cmd(package_name, ini_path, attempt_path)
            res = tool_mgr.run_tool_cmd("apkeep", cmd)
            if res.returncode != 0:
                raise AcquisitionError(
                    f"apkeep download failed: {res.stderr[:300]}",
                    ExitCode.INFRASTRUCTURE_FAILURE,
                )

            downloaded_apks = list(attempt_path.glob("**/*.apk"))
            if not downloaded_apks:
                raise AcquisitionError(
                    f"apkeep completed but found no APK files in {attempt_path}",
                    ExitCode.INFRASTRUCTURE_FAILURE,
                )

            apkm_path = out_dir / f"{package_name}.apkm"
            normalize_apks_to_apkm(downloaded_apks, apkm_path)

            try:
                inspection = inspect_artifact(apkm_path)
                if expected_version and inspection.version_name != expected_version:
                    raise AcquisitionError(
                        f"Downloaded version '{inspection.version_name}' does not match expected '{expected_version}'",
                        ExitCode.INVALID_ARTIFACT,
                    )
                if (
                    expected_version_code is not None
                    and inspection.version_code != expected_version_code
                ):
                    raise AcquisitionError(
                        f"Downloaded version code '{inspection.version_code}' does not match expected '{expected_version_code}'",
                        ExitCode.INVALID_ARTIFACT,
                    )
            except Exception:
                apkm_path.unlink(missing_ok=True)
                raise

            return apkm_path
    finally:
        ini_path.unlink(missing_ok=True)


def acquire_with_goopdl(
    package_name: str,
    out_dir: Path,
    expected_version: str | None = None,
    expected_version_code: int | None = None,
) -> Path:
    """Acquires APK using goopdl fallback."""
    out_dir = Path(out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    with tempfile.TemporaryDirectory(dir=out_dir, prefix="goopdl-") as attempt_dir:
        attempt_path = Path(attempt_dir)
        cmd = build_goopdl_cmd(
            package_name=package_name,
            output_dir=attempt_path,
            expected_version=expected_version,
            expected_version_code=expected_version_code,
        )

        try:
            res = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=180,
                check=False,
            )
            if res.returncode != 0:
                raise AcquisitionError(
                    f"goopdl failed: {res.stderr[:300]}",
                    ExitCode.INFRASTRUCTURE_FAILURE,
                )
        except (subprocess.SubprocessError, OSError) as e:
            raise AcquisitionError(
                f"Failed to execute goopdl: {e}", ExitCode.INFRASTRUCTURE_FAILURE
            ) from e

        downloaded_apks = list(attempt_path.glob("**/*.apk"))
        if not downloaded_apks:
            raise AcquisitionError(
                f"goopdl finished but no APK files were downloaded in {attempt_path}",
                ExitCode.INFRASTRUCTURE_FAILURE,
            )

        apkm_path = out_dir / f"{package_name}.apkm"
        normalize_apks_to_apkm(downloaded_apks, apkm_path)

        try:
            inspection = inspect_artifact(apkm_path)
            if expected_version and inspection.version_name != expected_version:
                raise AcquisitionError(
                    f"goopdl downloaded version '{inspection.version_name}' != expected '{expected_version}'",
                    ExitCode.INVALID_ARTIFACT,
                )
            if (
                expected_version_code is not None
                and inspection.version_code != expected_version_code
            ):
                raise AcquisitionError(
                    f"goopdl downloaded version code '{inspection.version_code}' != expected '{expected_version_code}'",
                    ExitCode.INVALID_ARTIFACT,
                )
        except Exception:
            apkm_path.unlink(missing_ok=True)
            raise

        return apkm_path


def acquire_artifact(
    package_name: str,
    out_dir: Path,
    expected_version: str | None = None,
    expected_version_code: int | None = None,
    tool_mgr: ToolManager | None = None,
) -> tuple[Path, AcquisitionSource]:
    """Tries primary apkeep acquisition, falling back to goopdl on transient delivery failure."""
    tool_mgr = tool_mgr or ToolManager()

    can_use_apkeep = (
        (
            tool_mgr.is_platform_supported("apkeep")
            or tool_mgr.is_tool_installed("apkeep")
        )
        and tool_mgr.is_tool_installed("apkeep")
        and bool(os.environ.get("APKEEP_EMAIL"))
        and bool(os.environ.get("APKEEP_AAS_TOKEN"))
    )

    if can_use_apkeep:
        try:
            apkm = acquire_with_apkeep(
                package_name,
                out_dir,
                expected_version=expected_version,
                expected_version_code=expected_version_code,
                tool_mgr=tool_mgr,
            )
            return apkm, AcquisitionSource.APKEEP
        except AcquisitionError as e:
            if e.exit_code != ExitCode.INFRASTRUCTURE_FAILURE:
                raise

    apkm = acquire_with_goopdl(
        package_name,
        out_dir,
        expected_version=expected_version,
        expected_version_code=expected_version_code,
    )
    return apkm, AcquisitionSource.GOOPDL
