from __future__ import annotations

import os
import shutil
import subprocess
import tempfile
import zipfile
from enum import Enum
from pathlib import Path

from apk_lab.google_play_accounts import (
    GooglePlayAccount,
    GooglePlayAccountError,
    load_google_play_accounts,
)
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
    APKMIRROR = "apkmirror"
    MANUAL = "manual"


FIXED_ZIP_DATETIME = (2026, 1, 1, 0, 0, 0)
STDERR_DIAGNOSTIC_LIMIT = 300


def _sanitize_stderr(stderr: str, account: GooglePlayAccount | None) -> str:
    """Redacts account credentials, then truncates the diagnostic output."""
    if account is not None:
        if account.aas_token:
            stderr = stderr.replace(account.aas_token, "[REDACTED_TOKEN]")
        if account.email:
            stderr = stderr.replace(account.email, account.redacted_email)
    return stderr[:STDERR_DIAGNOSTIC_LIMIT]


APKMIRROR_APP_MAP: dict[str, dict[str, str]] = {
    "com.sezzle.sezzlemobile": {
        "org": "sezzle",
        "repo": "sezzle-buy-now-pay-later",
        "type": "bundle",
    },
    "com.adobe.scan.android": {
        "org": "adobe",
        "repo": "adobe-scan-pdf-scanner-ocr",
        "type": "bundle",
    },
    "com.aftership.AfterShip": {
        "org": "aftership-ltd",
        "repo": "aftership-package-tracker",
        "type": "apk",
    },
    "com.instructure.candroid": {
        "org": "instructure",
        "repo": "canvas-student",
        "type": "bundle",
    },
    "com.sidelineswap.android": {
        "org": "sidelineswap",
        "repo": "sidelineswap-buy-sell-sports-gear",
        "type": "apk",
    },
    "com.tripledot.blackjack": {
        "org": "tripledot-studios-limited",
        "repo": "blackjack-2",
        "type": "bundle",
    },
}


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


def build_goopdl_env(
    account: GooglePlayAccount | None = None,
    base_env: dict[str, str] | None = None,
) -> dict[str, str]:
    """Returns a subprocess environment for goopdl direct Google authentication.

    Only aas_et tokens are usable by goopdl; anything else leaves the dispenser path intact.
    """
    env = dict(os.environ if base_env is None else base_env)
    if account is not None and account.aas_token.startswith("aas_et/"):
        env["GOOPDL_ACCOUNT_EMAIL"] = account.email
        env["GOOPDL_AAS_TOKEN"] = account.aas_token
    return env


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
    account: GooglePlayAccount | None = None,
) -> Path:
    """Acquires APK using apkeep."""
    tool_mgr = tool_mgr or ToolManager()
    if not tool_mgr.is_tool_installed("apkeep"):
        raise AcquisitionError("apkeep is not installed", ExitCode.USAGE_OR_TOOL_ERROR)

    if account is None:
        accounts_file = load_google_play_accounts()
        if not accounts_file:
            raise AcquisitionError(
                "No Google Play accounts configured (set APKEEP_ACCOUNTS or configure google-play-accounts.json)",
                ExitCode.USAGE_OR_TOOL_ERROR,
            )
        enabled_accounts = [a for a in accounts_file.accounts if a.enabled]
        if not enabled_accounts:
            raise AcquisitionError(
                "No enabled Google Play accounts configured",
                ExitCode.USAGE_OR_TOOL_ERROR,
            )
        account = enabled_accounts[0]

    email = account.email
    aas_token = account.aas_token
    label = account.label
    out_dir = Path(out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    with tempfile.NamedTemporaryFile("w", suffix=".ini", delete=False) as ini_file:
        ini_path = Path(ini_file.name)
        device_line = f"device = {account.device}\n" if account.device else ""
        locale_line = f"locale = {account.locale}\n" if account.locale else ""
        ini_file.write(
            f"[google]\nemail = {email}\naas_token = {aas_token}\n{device_line}{locale_line}"
        )

    try:
        with tempfile.TemporaryDirectory(dir=out_dir, prefix="apkeep-") as attempt_dir:
            attempt_path = Path(attempt_dir)
            cmd = build_apkeep_cmd(package_name, ini_path, attempt_path)
            res = tool_mgr.run_tool_cmd("apkeep", cmd)
            if res.returncode != 0:
                raise AcquisitionError(
                    f"apkeep download failed for account [{label}]: {_sanitize_stderr(res.stderr, account)}",
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
    account: GooglePlayAccount | None = None,
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
                env=build_goopdl_env(account),
            )
            if res.returncode != 0:
                raise AcquisitionError(
                    f"goopdl failed: {_sanitize_stderr(res.stderr, account)}",
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


def acquire_with_apkmirror(
    package_name: str,
    out_dir: Path,
    expected_version: str | None = None,
    expected_version_code: int | None = None,
    runner_script: Path | None = None,
) -> Path:
    """Acquires a specific app version from APKMirror via apkmirror-downloader fallback."""
    out_dir = Path(out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    mapping = APKMIRROR_APP_MAP.get(package_name)
    if not mapping:
        raise AcquisitionError(
            f"No APKMirror repository mapping configured for '{package_name}'",
            ExitCode.INVALID_ARTIFACT,
        )

    node_bin = shutil.which("node") or shutil.which("bun")
    if not node_bin:
        raise AcquisitionError(
            "Node.js or Bun is required to run apkmirror-downloader",
            ExitCode.INFRASTRUCTURE_FAILURE,
        )

    if runner_script is None:
        runner_script = Path(__file__).parent / "apkmirror_runner.cjs"

    if not runner_script.is_file():
        raise AcquisitionError(
            f"APKMirror runner script not found at {runner_script}",
            ExitCode.INFRASTRUCTURE_FAILURE,
        )

    org = mapping["org"]
    repo = mapping["repo"]
    app_type = mapping.get("type", "apk")
    version = expected_version or "latest"

    with tempfile.TemporaryDirectory(dir=out_dir, prefix="apkmirror-") as attempt_dir:
        attempt_path = Path(attempt_dir)
        cmd = [
            node_bin,
            str(runner_script),
            org,
            repo,
            version,
            app_type,
            str(attempt_path),
        ]

        try:
            res = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                check=False,
                timeout=180,
            )
        except (OSError, subprocess.TimeoutExpired) as e:
            raise AcquisitionError(
                f"Failed to execute apkmirror-downloader: {e}",
                ExitCode.INFRASTRUCTURE_FAILURE,
            ) from e

        if res.returncode != 0:
            raise AcquisitionError(
                f"apkmirror-downloader failed for {package_name} v{version}: {res.stderr[:300]}",
                ExitCode.INFRASTRUCTURE_FAILURE,
            )

        downloaded_files = [
            f
            for f in attempt_path.iterdir()
            if f.is_file() and f.suffix.lower() in (".apk", ".apkm", ".zip")
        ]
        if not downloaded_files:
            raise AcquisitionError(
                f"apkmirror-downloader reported success but no APK/APKM found in {attempt_path}",
                ExitCode.INFRASTRUCTURE_FAILURE,
            )

        raw_artifact = downloaded_files[0]
        apkm_path = out_dir / f"{package_name}.apkm"

        if raw_artifact.suffix.lower() in (".apkm", ".zip"):
            extract_dir = attempt_path / "extracted"
            extract_dir.mkdir(parents=True, exist_ok=True)
            try:
                with zipfile.ZipFile(raw_artifact, "r") as zf:
                    for member in zf.infolist():
                        destination = (extract_dir / member.filename).resolve()
                        if not destination.is_relative_to(extract_dir.resolve()):
                            raise AcquisitionError(
                                f"Unsafe archive member path: {member.filename}",
                                ExitCode.INVALID_ARTIFACT,
                            )
                    zf.extractall(extract_dir)
            except Exception as e:
                raise AcquisitionError(
                    f"Corrupt bundle downloaded from APKMirror: {e}",
                    ExitCode.INVALID_ARTIFACT,
                ) from e
            apks = list(extract_dir.glob("**/*.apk"))
            normalize_apks_to_apkm(apks, apkm_path)
        else:
            if app_type == "bundle":
                normalize_apks_to_apkm([raw_artifact], apkm_path)
            else:
                target_apk = out_dir / f"{package_name}.apk"
                shutil.copyfile(raw_artifact, target_apk)
                apkm_path = target_apk

        try:
            inspection = inspect_artifact(apkm_path)
            if expected_version and inspection.version_name != expected_version:
                raise AcquisitionError(
                    f"APKMirror downloaded version '{inspection.version_name}' != expected '{expected_version}'",
                    ExitCode.INVALID_ARTIFACT,
                )
            if (
                expected_version_code is not None
                and inspection.version_code != expected_version_code
            ):
                raise AcquisitionError(
                    f"APKMirror downloaded version code '{inspection.version_code}' != expected '{expected_version_code}'",
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
    """Tries apkeep, then goopdl, then apkmirror on delivery failure or version mismatch."""
    tool_mgr = tool_mgr or ToolManager()
    failures: list[str] = []
    last_err: AcquisitionError | None = None
    accounts_file = None
    try:
        accounts_file = load_google_play_accounts()
    except GooglePlayAccountError as e:
        last_err = AcquisitionError(f"Failed to load Google Play accounts: {e}")
        failures.append(str(last_err))

    enabled_accounts = (
        [acc for acc in accounts_file.accounts if acc.enabled]
        if accounts_file is not None
        else []
    )

    can_use_apkeep = (
        (
            tool_mgr.is_platform_supported("apkeep")
            or tool_mgr.is_tool_installed("apkeep")
        )
        and tool_mgr.is_tool_installed("apkeep")
        and accounts_file is not None
    )

    if can_use_apkeep:
        out_dir = Path(out_dir).resolve()
        out_dir.mkdir(parents=True, exist_ok=True)
        for account in enabled_accounts:
            try:
                with tempfile.TemporaryDirectory(
                    dir=out_dir, prefix=f"apkeep-acc-{account.label}-"
                ) as acc_temp:
                    apkm = acquire_with_apkeep(
                        package_name,
                        Path(acc_temp),
                        expected_version=expected_version,
                        expected_version_code=expected_version_code,
                        tool_mgr=tool_mgr,
                        account=account,
                    )
                    # Move validated artifact to final destination out_dir
                    final_path = Path(out_dir).resolve() / f"{package_name}.apkm"
                    shutil.move(str(apkm), str(final_path))
                    return final_path, AcquisitionSource.APKEEP
            except AcquisitionError as e:
                last_err = e
                failures.append(f"apkeep [{account.label}]: {e}")

    direct_accounts = [
        account
        for account in enabled_accounts
        if account.aas_token.startswith("aas_et/")
    ]
    for account in direct_accounts:
        try:
            apkm = acquire_with_goopdl(
                package_name,
                out_dir,
                expected_version=expected_version,
                expected_version_code=expected_version_code,
                account=account,
            )
            return apkm, AcquisitionSource.GOOPDL
        except AcquisitionError as e:
            last_err = e
            failures.append(f"goopdl [{account.label}] direct auth: {e}")

    if not direct_accounts:
        try:
            apkm = acquire_with_goopdl(
                package_name,
                out_dir,
                expected_version=expected_version,
                expected_version_code=expected_version_code,
            )
            return apkm, AcquisitionSource.GOOPDL
        except AcquisitionError as e:
            last_err = e
            failures.append(f"goopdl: {e}")

    try:
        apkm = acquire_with_apkmirror(
            package_name,
            out_dir,
            expected_version=expected_version,
            expected_version_code=expected_version_code,
        )
        return apkm, AcquisitionSource.APKMIRROR
    except AcquisitionError as e:
        last_err = e
        failures.append(f"apkmirror: {e}")

    reason = "; ".join(failures) or "no acquisition source is available"
    raise AcquisitionError(
        f"All acquisition sources failed for {package_name}: {reason}",
        last_err.exit_code if last_err is not None else ExitCode.INFRASTRUCTURE_FAILURE,
    )
