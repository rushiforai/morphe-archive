from __future__ import annotations

import hashlib
import json
import logging
import os
import platform
import re
import shutil
import subprocess
import sys
import tempfile
import urllib.error
import urllib.request
import zipfile
from pathlib import Path
from typing import Any

from apk_lab.models import DoctorReport, HostPrerequisiteResult, ToolCheckResult

LOCK_FILE_PATH = Path(__file__).parent.parent / "tools.lock.json"
DEFAULT_CACHE_ROOT = Path.home() / ".cache" / "aidans-patches" / "apk-lab" / "tools"


REQUIRED_CI_CREDENTIALS = [
    "APKEEP_EMAIL",
    "APKEEP_AAS_TOKEN",
    "R2_ACCOUNT_ID",
    "R2_ACCESS_KEY_ID",
    "R2_SECRET_ACCESS_KEY",
]

OPTIONAL_CI_CREDENTIALS = [
    "COMPATIBILITY_STATUS_SECRET",
]

ALL_CI_CREDENTIALS = REQUIRED_CI_CREDENTIALS + OPTIONAL_CI_CREDENTIALS


logger = logging.getLogger(__name__)


class ToolError(Exception):
    """Raised when tool installation, verification, or execution fails."""


def get_host_platform() -> str:
    system = sys.platform
    machine = platform.machine().lower()
    if system.startswith("linux"):
        os_name = "linux"
    elif system == "darwin":
        os_name = "darwin"
    elif system == "win32":
        os_name = "windows"
    else:
        os_name = system

    if machine in ("arm64", "aarch64"):
        arch = "aarch64"
    elif machine in ("x86_64", "amd64"):
        arch = "x86_64"
    else:
        arch = machine

    return f"{os_name}-{arch}"


def compute_file_sha256(path: Path | str) -> str:
    hasher = hashlib.sha256()
    with open(path, "rb") as f:
        while chunk := f.read(64 * 1024):
            hasher.update(chunk)
    return hasher.hexdigest()


class ToolManager:
    def __init__(self, cache_root: Path | None = None, lock_file: Path | None = None):
        self.cache_root = (cache_root or DEFAULT_CACHE_ROOT).resolve()
        self.lock_file = (lock_file or LOCK_FILE_PATH).resolve()
        self._lock_data = self._load_lock()

    def _load_lock(self) -> dict[str, Any]:
        if not self.lock_file.is_file():
            raise ToolError(f"Tools lock file not found: {self.lock_file}")
        with open(self.lock_file, "r", encoding="utf-8") as f:
            return json.load(f).get("tools", {})

    def get_tool_spec(self, name: str) -> dict[str, Any]:
        spec = self._lock_data.get(name)
        if not spec:
            raise ToolError(f"Unknown tool '{name}' in tools lock file")
        return spec

    def get_tool_install_dir(self, name: str) -> Path:
        spec = self.get_tool_spec(name)
        version = spec["version"]
        sha256 = spec["sha256"]
        return self.cache_root / name / version / sha256

    def get_executable_path(self, name: str) -> Path:
        spec = self.get_tool_spec(name)
        install_dir = self.get_tool_install_dir(name)
        return (install_dir / spec["executablePath"]).resolve()

    def is_tool_installed(self, name: str) -> bool:
        try:
            exe = self.get_executable_path(name)
            return exe.exists()
        except (ToolError, KeyError, OSError):
            return False

    def is_platform_supported(self, name: str) -> bool:
        spec = self.get_tool_spec(name)
        supported = spec.get("supportedPlatforms", [])
        if "any" in supported:
            return True
        host = get_host_platform()
        # Handle mac / linux platform normalization
        return host in supported or any(
            (
                host.startswith("linux")
                and "linux-x86_64" in supported
                and host.endswith("x86_64")
            )
            for s in supported
        )

    def install_tool(self, name: str) -> Path:
        spec = self.get_tool_spec(name)
        if not self.is_platform_supported(name):
            host = get_host_platform()
            raise ToolError(
                f"Tool '{name}' does not support host platform '{host}' "
                f"(supported: {spec.get('supportedPlatforms')})"
            )

        target_dir = self.get_tool_install_dir(name)
        exe_path = target_dir / spec["executablePath"]
        if exe_path.exists():
            return exe_path

        url = spec["url"]
        expected_sha256 = spec["sha256"]
        tool_type = spec.get("toolType", "binary")

        # Download to a temporary directory first
        with tempfile.TemporaryDirectory(prefix=f"apk-lab-tool-{name}-") as tmp_dir:
            tmp_path = Path(tmp_dir)
            download_file = tmp_path / "download"

            # Download with urllib
            req = urllib.request.Request(
                url,
                headers={"User-Agent": "apk-lab-toolchain-installer/1.0"},
            )
            with (
                urllib.request.urlopen(req) as resp,
                open(download_file, "wb") as out_f,
            ):
                while chunk := resp.read(64 * 1024):
                    out_f.write(chunk)

            # Verify checksum
            actual_sha256 = compute_file_sha256(download_file)
            if actual_sha256.lower() != expected_sha256.lower():
                raise ToolError(
                    f"Checksum mismatch for '{name}': expected {expected_sha256}, got {actual_sha256}"
                )

            # Stage unpacked contents
            staged_dir = tmp_path / "staged"
            staged_dir.mkdir(parents=True, exist_ok=True)

            if tool_type == "jar":
                dest_file = staged_dir / spec["executablePath"]
                dest_file.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(download_file, dest_file)
            elif tool_type == "zip":
                with zipfile.ZipFile(download_file, "r") as zf:
                    zf.extractall(staged_dir)
                # Ensure binaries inside bin/ are executable
                for bin_file in staged_dir.glob("bin/*"):
                    if bin_file.is_file():
                        bin_file.chmod(bin_file.stat().st_mode | 0o755)
            elif tool_type == "binary":
                dest_file = staged_dir / spec["executablePath"]
                dest_file.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(download_file, dest_file)
                dest_file.chmod(dest_file.stat().st_mode | 0o755)

            # Probe version on staged executable before publishing
            staged_exe = staged_dir / spec["executablePath"]
            self._probe_tool(name, staged_exe, spec)

            # Atomic move / publish to target directory
            target_dir.parent.mkdir(parents=True, exist_ok=True)
            if target_dir.exists():
                shutil.rmtree(target_dir)
            shutil.move(str(staged_dir), str(target_dir))

        return exe_path

    def _probe_tool(self, name: str, exe_path: Path, spec: dict[str, Any]) -> str:
        probe = spec.get("versionProbe", {})
        args = probe.get("args", [])
        expected_pattern = probe.get("expectedPattern", "")

        resolved_args = [arg.replace("{executable}", str(exe_path)) for arg in args]

        try:
            res = subprocess.run(
                resolved_args,
                capture_output=True,
                text=True,
                timeout=30,
                check=False,
            )
            output = f"{res.stdout}\n{res.stderr}"
        except (subprocess.SubprocessError, OSError) as e:
            raise ToolError(f"Version probe failed for '{name}': {e}") from e

        if expected_pattern and not re.search(expected_pattern, output):
            raise ToolError(
                f"Version probe output mismatch for '{name}'. Expected pattern '{expected_pattern}', got: {output[:200]}"
            )

        return output.strip()

    def setup_profile(self, profile: str) -> list[ToolCheckResult]:
        if profile == "analysis":
            tool_names = ["morphe", "jadx", "apktool", "baksmali"]
        elif profile == "ci":
            tool_names = ["morphe", "jadx", "apktool", "baksmali"]
            # apkeep is only supported on linux-x86_64
            if self.is_platform_supported("apkeep"):
                tool_names.append("apkeep")
        else:
            raise ToolError(
                f"Unknown setup profile '{profile}'. Expected 'analysis' or 'ci'"
            )

        results: list[ToolCheckResult] = []
        for name in tool_names:
            spec = self.get_tool_spec(name)
            try:
                exe = self.install_tool(name)
                self._probe_tool(name, exe, spec)
                results.append(
                    ToolCheckResult(
                        name=name,
                        configured_version=spec["version"],
                        installed=True,
                        actual_version=spec["version"],
                        executable_path=str(exe),
                    )
                )
            except (ToolError, OSError, urllib.error.URLError, zipfile.BadZipFile) as e:
                results.append(
                    ToolCheckResult(
                        name=name,
                        configured_version=spec["version"],
                        installed=False,
                        error=str(e),
                    )
                )

        return results

    def run_tool_cmd(
        self, name: str, extra_args: list[str], **kwargs: Any
    ) -> subprocess.CompletedProcess[str]:
        spec = self.get_tool_spec(name)
        exe = self.get_executable_path(name)
        if not exe.exists():
            raise ToolError(
                f"Tool '{name}' is not installed. Run 'apk-lab setup' first."
            )

        tool_type = spec.get("toolType", "binary")
        if tool_type == "jar":
            cmd = ["java", "-jar", str(exe)] + extra_args
        else:
            cmd = [str(exe)] + extra_args

        check = kwargs.pop("check", False)
        run_kwargs = {
            "capture_output": True,
            "text": True,
        }
        run_kwargs.update(kwargs)
        return subprocess.run(cmd, check=check, **run_kwargs)


def check_host_prerequisites(
    ci_mode: bool = False,
    workspace_root: Path | str = ".apk-lab",
    profile: str | None = None,
) -> DoctorReport:
    active_profile = profile or ("ci" if ci_mode else "analysis")
    ci_mode = ci_mode or (active_profile == "ci")
    tool_mgr = ToolManager()
    prereqs: list[HostPrerequisiteResult] = []
    tools_results: list[ToolCheckResult] = []

    # 1. Check Python version >= 3.12
    py_ver = (
        f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}"
    )
    if sys.version_info >= (3, 12):
        prereqs.append(HostPrerequisiteResult("Python", True, f"Python {py_ver}"))
    else:
        prereqs.append(
            HostPrerequisiteResult(
                "Python", False, f"Python {py_ver}", "Python 3.12+ required"
            )
        )

    # 2. Check Java >= 21
    try:
        res = subprocess.run(
            ["java", "-version"],
            capture_output=True,
            text=True,
            check=False,
        )
        if res.returncode != 0:
            err = res.stderr.strip()[:200] or f"Exit {res.returncode}"
            prereqs.append(
                HostPrerequisiteResult(
                    "Java", False, None, f"java -version failed: {err}"
                )
            )
        else:
            java_out = f"{res.stdout}\n{res.stderr}"
            match = re.search(r'version\s+"(\d+)(?:\.(\d+))?', java_out)
            if match:
                major = int(match.group(1))
                if major >= 21:
                    prereqs.append(
                        HostPrerequisiteResult("Java", True, f"Java {major}")
                    )
                else:
                    prereqs.append(
                        HostPrerequisiteResult(
                            "Java", False, f"Java {major}", "Java 21+ required"
                        )
                    )
            else:
                prereqs.append(
                    HostPrerequisiteResult(
                        "Java", False, None, "Could not parse java version"
                    )
                )
    except (subprocess.SubprocessError, OSError, ValueError) as e:
        prereqs.append(HostPrerequisiteResult("Java", False, None, str(e)))

    # 3. Check uv
    try:
        res = subprocess.run(
            ["uv", "--version"],
            capture_output=True,
            text=True,
            check=False,
        )
        if res.returncode == 0:
            uv_ver = res.stdout.strip()
            prereqs.append(HostPrerequisiteResult("uv", True, uv_ver))
        else:
            err = res.stderr.strip()[:200] or f"Exit {res.returncode}"
            prereqs.append(
                HostPrerequisiteResult("uv", False, None, f"uv --version failed: {err}")
            )
    except (subprocess.SubprocessError, OSError) as e:
        prereqs.append(HostPrerequisiteResult("uv", False, None, str(e)))

    # 4. Check Android SDK Build Tools (36.0.0)
    sdk_dir: Path | None = None
    if os.environ.get("ANDROID_HOME"):
        sdk_dir = Path(os.environ["ANDROID_HOME"])
    elif os.environ.get("ANDROID_SDK_ROOT"):
        sdk_dir = Path(os.environ["ANDROID_SDK_ROOT"])
    else:
        # Check local.properties in current or parent directories
        candidate = Path("local.properties")
        if not candidate.exists():
            candidate = Path(__file__).parent.parent.parent.parent / "local.properties"
        if candidate.exists():
            for line in candidate.read_text().splitlines():
                if line.startswith("sdk.dir="):
                    sdk_dir = Path(line.split("=", 1)[1].strip())
                    break

    if sdk_dir and sdk_dir.is_dir():
        build_tools_36 = sdk_dir / "build-tools" / "36.0.0"
        if build_tools_36.is_dir():
            prereqs.append(
                HostPrerequisiteResult(
                    "Android Build Tools",
                    True,
                    f"36.0.0 ({build_tools_36})",
                )
            )
        else:
            prereqs.append(
                HostPrerequisiteResult(
                    "Android Build Tools",
                    False,
                    str(sdk_dir),
                    f"Build Tools 36.0.0 not found in {sdk_dir / 'build-tools'}",
                )
            )
    else:
        prereqs.append(
            HostPrerequisiteResult(
                "Android SDK",
                False,
                None,
                "ANDROID_HOME / ANDROID_SDK_ROOT or local.properties sdk.dir not found",
            )
        )

    # Check cached tools
    lock_data = tool_mgr._lock_data
    for name, spec in lock_data.items():
        if name == "apkeep" and (
            active_profile != "ci" or not tool_mgr.is_platform_supported("apkeep")
        ):
            continue
        installed = tool_mgr.is_tool_installed(name)
        exe = tool_mgr.get_executable_path(name) if installed else None
        tools_results.append(
            ToolCheckResult(
                name=name,
                configured_version=spec["version"],
                installed=installed,
                actual_version=spec["version"] if installed else None,
                executable_path=str(exe) if exe else None,
                error=None if installed else "Not installed in cache",
            )
        )

    # Check workspace writable using exclusive temporary probe
    ws_path = Path(workspace_root).resolve()
    ws_writable = True
    temp_probe: str | None = None
    try:
        ws_path.mkdir(parents=True, exist_ok=True)
        fd, temp_probe = tempfile.mkstemp(prefix=".probe_", dir=ws_path)
        os.close(fd)
    except OSError:
        ws_writable = False
    finally:
        if temp_probe and os.path.exists(temp_probe):
            try:
                os.unlink(temp_probe)
            except OSError as err:
                logger.debug("Failed to remove temp probe %s: %s", temp_probe, err)

    # Check CI credentials if ci_mode is requested
    creds_present: dict[str, bool] = {}
    if ci_mode:
        for cred_var in ALL_CI_CREDENTIALS:
            creds_present[cred_var] = bool(os.environ.get(cred_var))

    all_prereqs_ok = all(p.satisfied for p in prereqs)
    all_tools_ok = all(t.installed for t in tools_results)
    all_creds_ok = (
        all(creds_present.get(c, False) for c in REQUIRED_CI_CREDENTIALS)
        if ci_mode
        else True
    )
    all_ready = all_prereqs_ok and all_tools_ok and ws_writable and all_creds_ok
    return DoctorReport(
        all_ready=all_ready,
        tools=tools_results,
        prerequisites=prereqs,
        workspace_writable=ws_writable,
        ci_mode=ci_mode,
        credentials_present=creds_present,
    )
