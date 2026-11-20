from __future__ import annotations

import argparse
import collections
import datetime
import logging
import os
import queue
import re
import shutil
import subprocess
import sys
import threading
import time
import xml.etree.ElementTree as ET
from collections.abc import Iterator
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path

from apk_lab.models import ExitCode, UiNode

logger = logging.getLogger(__name__)


@dataclass(frozen=True)
class AdbDevice:
    serial: str
    state: str


@dataclass(frozen=True)
class ProcStatInfo:
    pid: int
    comm: str
    state: str
    utime: int
    stime: int
    starttime: int


@dataclass(frozen=True)
class SystemStatInfo:
    total_jiffies: int
    cpu_count: int


@dataclass(frozen=True)
class ExitInfoRecord:
    index: int
    timestamp: int
    pid: int
    process: str
    package: str | None
    reason_code: int
    reason_name: str
    subreason_code: int | None
    subreason_name: str | None
    status: int
    description: str | None
    raw_text: str


@dataclass(frozen=True)
class ResolvedFrame:
    raw_frame: str
    class_name: str
    method_name: str
    smali_path: Path | None = None
    method_signature: str | None = None
    code_snippet: list[str] | None = None


@dataclass(frozen=True)
class CrashReport:
    process: str
    pid: int | None
    exception_type: str
    message: str
    stack_trace: list[str]
    timestamp: str | None = None
    resolved_frames: list[ResolvedFrame] | None = None


def find_adb() -> Path:
    """Locates the adb binary from the Android SDK or PATH."""
    sdk_roots = [
        os.environ.get("ANDROID_HOME"),
        os.environ.get("ANDROID_SDK_ROOT"),
    ]
    for root in sdk_roots:
        if root:
            candidate = Path(root) / "platform-tools" / "adb"
            if candidate.is_file() and os.access(candidate, os.X_OK):
                return candidate.resolve()

    which_adb = shutil.which("adb")
    if which_adb:
        return Path(which_adb).resolve()

    raise FileNotFoundError(
        "adb binary not found. Set ANDROID_HOME / ANDROID_SDK_ROOT or ensure adb is on PATH."
    )


class AdbClient:
    """Thin, injectable wrapper around the adb CLI executable."""

    def __init__(self, adb_path: Path | str | None = None) -> None:
        self.adb_path = Path(adb_path).resolve() if adb_path else find_adb()

    def run(
        self,
        args: list[str],
        serial: str | None = None,
        timeout: float | None = None,
    ) -> subprocess.CompletedProcess[str]:
        cmd = [str(self.adb_path)]
        if serial:
            cmd.extend(["-s", serial])
        cmd.extend(args)
        return subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            errors="replace",
            timeout=timeout,
            check=False,
        )

    @contextmanager
    def stream(
        self,
        args: list[str],
        serial: str | None = None,
    ) -> Iterator[subprocess.Popen[str]]:
        cmd = [str(self.adb_path)]
        if serial:
            cmd.extend(["-s", serial])
        cmd.extend(args)
        proc = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            errors="replace",
            bufsize=1,
        )
        try:
            yield proc
        finally:
            if proc.poll() is None:
                proc.terminate()
                try:
                    proc.wait(timeout=2.0)
                except subprocess.TimeoutExpired:
                    proc.kill()
                    proc.wait()


def run_adb(device: str | None, args: list[str]) -> str:
    """Runs adb and returns its standard output."""
    result = AdbClient().run(args, serial=device)
    if result.returncode != 0:
        detail = result.stderr.strip() or result.stdout.strip()
        raise RuntimeError(f"ADB command failed: {detail}")
    return result.stdout


def get_installed_package_signature(
    package: str, device: str | None = None
) -> str | None:
    """Inspects the installed package's signing certificate on device using dumpsys.

    Returns the normalized (lowercase, colons removed) SHA-256 hex string, or None if
    not installed or signature cannot be found.
    """
    try:
        output = run_adb(device, ["shell", "dumpsys", "package", package])
    except RuntimeError:
        return None

    # Locate signatures section: e.g. "signatures=PackageSignatures{...}", "signatures:", or "PackageSignatures"
    sig_section_match = re.search(
        r"(?:signatures\s*=|signatures:|PackageSignatures).*?(?=\n\s*[A-Za-z0-9_-]+[:=]|\Z)",
        output,
        re.DOTALL | re.IGNORECASE,
    )
    search_target = sig_section_match.group(0) if sig_section_match else output

    match = re.search(r"\b([0-9a-fA-F:]{40,95})\b", search_target)
    if match:
        normalized = match.group(1).replace(":", "").lower()
        if len(normalized) == 64:
            return normalized

    # Fallback to search anywhere in the full dumpsys output
    match_full = re.search(r"\b([0-9a-fA-F:]{40,95})\b", output)
    if match_full:
        normalized = match_full.group(1).replace(":", "").lower()
        if len(normalized) == 64:
            return normalized

    return None


def harvest_recent_crashes(
    package: str, device: str | None = None, lines: int = 5000
) -> list[CrashReport]:
    """Returns recent Java crashes for *package* from the device log buffers."""
    output = run_adb(
        device,
        [
            "logcat",
            "-d",
            "-b",
            "main",
            "-b",
            "crash",
            "-b",
            "system",
            "-t",
            str(lines),
        ],
    )
    entries = [
        entry
        for line in output.splitlines()
        if (entry := _parse_logcat_entry(line)) is not None
    ]
    reports: list[CrashReport] = []

    for index, entry in enumerate(entries):
        timestamp, line_pid, text = entry
        process_match = re.search(r"\bProcess:\s*([^,\s]+)(?:,\s*PID:\s*(\d+))?", text)
        if not process_match or process_match.group(1) != package:
            continue

        previous_process = max(
            (
                prior
                for prior in range(index)
                if re.search(r"\bProcess:\s*", entries[prior][2])
            ),
            default=-1,
        )
        fatal_start = max(
            (
                prior
                for prior in range(previous_process + 1, index + 1)
                if "FATAL EXCEPTION:" in entries[prior][2]
            ),
            default=index,
        )
        end = next(
            (
                following
                for following in range(index + 1, len(entries))
                if (
                    "FATAL EXCEPTION:" in entries[following][2]
                    or re.search(r"\bProcess:\s*", entries[following][2])
                )
            ),
            len(entries),
        )
        block = entries[fatal_start:end]
        report = _parse_crash_block(
            package, block, timestamp=entries[fatal_start][0] or timestamp, pid=line_pid
        )
        if report:
            reports.append(report)

    deduplicated: list[CrashReport] = []
    previous_key: tuple[str, str, str] | None = None
    for report in reports:
        key = (
            report.exception_type,
            report.message,
            report.stack_trace[0] if report.stack_trace else "",
        )
        if key != previous_key:
            deduplicated.append(report)
        previous_key = key
    return deduplicated


def _parse_logcat_entry(line: str) -> tuple[str | None, int | None, str] | None:
    """Extracts timestamp, PID, and AndroidRuntime payload from one logcat line."""
    tag_match = re.search(r"\bAndroidRuntime:\s*(.*)$", line)
    if not tag_match:
        return None
    timestamp_match = re.match(r"(\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2}\.\d+)", line)
    return (
        timestamp_match.group(1) if timestamp_match else None,
        extract_logcat_pid(line),
        tag_match.group(1),
    )


def _parse_crash_block(
    package: str,
    block: list[tuple[str | None, int | None, str]],
    timestamp: str | None,
    pid: int | None,
) -> CrashReport | None:
    """Converts one AndroidRuntime block into a crash report when it has an exception."""
    exception_match: re.Match[str] | None = None
    exception_index = 0
    for index, (_, _, text) in enumerate(block):
        exception_match = re.search(
            r"(?:Caused by:\s*)?([\w.$]+(?:Exception|Error|Throwable))(?::\s*(.*))?$",
            text.strip(),
        )
        if exception_match:
            exception_index = index
            break
    if not exception_match:
        return None

    process_match = next(
        (
            re.search(r"\bProcess:\s*([^,\s]+)(?:,\s*PID:\s*(\d+))?", text)
            for _, _, text in block
            if re.search(r"\bProcess:\s*", text)
        ),
        None,
    )
    if not process_match or process_match.group(1) != package:
        return None
    report_pid = (
        int(process_match.group(2)) if process_match.group(2) is not None else pid
    )
    stack_trace = [
        text.strip()
        for _, _, text in block[exception_index + 1 :]
        if text.strip().startswith("at ")
    ]
    return CrashReport(
        process=package,
        pid=report_pid,
        exception_type=exception_match.group(1),
        message=exception_match.group(2) or "",
        stack_trace=stack_trace,
        timestamp=timestamp,
    )


def _find_smali_file(smali_root: Path, class_rel_path: Path) -> Path | None:
    """Searches for a smali file in smali_root or nested dex directories."""
    direct = smali_root / class_rel_path
    if direct.is_file():
        return direct

    if smali_root.is_dir():
        # Check immediate subdirectories matching smali/ or smali_classes*/
        for child in sorted(smali_root.iterdir()):
            if child.is_dir() and (
                child.name == "smali" or child.name.startswith("smali_classes")
            ):
                candidate = child / class_rel_path
                if candidate.is_file():
                    return candidate
        # Fallback recursive search if directory structure has additional nesting
        matches = list(smali_root.rglob(class_rel_path.name))
        for match in matches:
            if match.is_file() and str(match).endswith(str(class_rel_path)):
                return match
    return None


def resolve_frame_in_smali(frame_str: str, smali_root: Path) -> ResolvedFrame:
    """Resolves a raw stack frame string against decompiled Smali files."""
    frame_pattern = re.compile(r"at\s+([\w$.]+)\.([\w$<>]+)\(([^:]+):?(\d+)?\)")
    match = frame_pattern.search(frame_str)
    if not match:
        return ResolvedFrame(raw_frame=frame_str, class_name="", method_name="")

    class_name, method_name, _, line_num_str = match.groups()
    # Outer class handling for inner classes (e.g. Foo$Bar -> Foo$Bar.smali)
    rel_path = Path(*class_name.split(".")).with_suffix(".smali")

    found_path = _find_smali_file(smali_root, rel_path)
    if not found_path:
        return ResolvedFrame(
            raw_frame=frame_str,
            class_name=class_name,
            method_name=method_name,
            smali_path=None,
            method_signature=None,
            code_snippet=None,
        )

    try:
        content = found_path.read_text(encoding="utf-8")
    except OSError:
        return ResolvedFrame(
            raw_frame=frame_str,
            class_name=class_name,
            method_name=method_name,
            smali_path=found_path,
            method_signature=None,
            code_snippet=None,
        )

    method_re = re.compile(
        r"^(\.method\b[^\n]*\s+" + re.escape(method_name) + r"\([^\n]*\)[^\n]*)",
        re.MULTILINE,
    )
    m_match = method_re.search(content)
    if not m_match:
        return ResolvedFrame(
            raw_frame=frame_str,
            class_name=class_name,
            method_name=method_name,
            smali_path=found_path,
            method_signature=None,
            code_snippet=None,
        )

    method_sig = m_match.group(1).strip()
    rest_of_text = content[m_match.end() :]
    method_lines: list[str] = []
    for line in rest_of_text.splitlines():
        stripped = line.strip()
        if stripped == ".end method":
            break
        if stripped:
            method_lines.append(stripped)

    snippet_lines: list[str] = []
    if line_num_str:
        marker_re = re.compile(rf"^\s*\.line\s+{re.escape(line_num_str)}\b")
        for idx, line in enumerate(method_lines):
            if marker_re.search(line):
                start = max(0, idx - 4)
                end = min(len(method_lines), idx + 8)
                snippet_lines = method_lines[start:end]
                break
        else:
            snippet_lines = method_lines[:15]
    else:
        snippet_lines = method_lines[:15]
    return ResolvedFrame(
        raw_frame=frame_str,
        class_name=class_name,
        method_name=method_name,
        smali_path=found_path,
        method_signature=method_sig,
        code_snippet=snippet_lines if snippet_lines else None,
    )


def resolve_crash_report(report: CrashReport, smali_root: Path) -> CrashReport:
    """Resolves all stack frames in a CrashReport against smali_root."""
    resolved = [
        resolve_frame_in_smali(frame, smali_root) for frame in report.stack_trace
    ]
    return CrashReport(
        process=report.process,
        pid=report.pid,
        exception_type=report.exception_type,
        message=report.message,
        stack_trace=report.stack_trace,
        timestamp=report.timestamp,
        resolved_frames=resolved,
    )


def resolve_crash_frames(crash: CrashReport, smali_dir: Path) -> list[ResolvedFrame]:
    """Resolves stack frames from crash against smali_dir."""
    return [resolve_frame_in_smali(frame, smali_dir) for frame in crash.stack_trace]


def parse_adb_devices(output: str) -> list[AdbDevice]:
    """Parses adb devices command output into AdbDevice records."""
    devices: list[AdbDevice] = []
    lines = output.splitlines()
    for line in lines:
        line = line.strip()
        if not line or line.startswith(("*", "List of devices")):
            continue
        parts = line.split()
        if len(parts) >= 2:
            devices.append(AdbDevice(serial=parts[0], state=parts[1]))
    return devices


def format_devices(devices: list[AdbDevice]) -> str:
    """Formats connected devices for display in error messages."""
    if not devices:
        return "none"
    return ", ".join(f"{d.serial} ({d.state})" for d in devices)


def select_device(devices: list[AdbDevice], explicit_serial: str | None) -> str:
    """Selects an online device adhering strictly to selection constraints."""
    if explicit_serial:
        match = next((d for d in devices if d.serial == explicit_serial), None)
        if match is None:
            raise ValueError(
                f"Device '{explicit_serial}' not found. Connected devices: {format_devices(devices)}"
            )
        if match.state != "device":
            raise ValueError(
                f"Device '{explicit_serial}' is in state '{match.state}', must be 'device'. Connected devices: {format_devices(devices)}"
            )
        return explicit_serial

    online = [d for d in devices if d.state == "device"]
    if len(online) == 1:
        return online[0].serial
    if not online:
        raise ValueError(
            f"No online ADB devices found. Connected devices: {format_devices(devices)}"
        )
    raise ValueError(
        f"Multiple online ADB devices found ({[d.serial for d in online]}). Specify target with --device <serial>. Connected devices: {format_devices(devices)}"
    )


def parse_launcher_activity(badging_text: str, package_name: str) -> str:
    """Parses and normalizes the single launchable activity from aapt2 badging."""
    matches = re.findall(r"launchable-activity:\s+name='([^']+)'", badging_text)
    if not matches:
        raise ValueError("No launchable activity found in APK badging output")
    if len(matches) > 1:
        raise ValueError(
            f"Expected exactly one launchable activity, found {len(matches)}: {matches}"
        )

    activity = matches[0]
    if activity.startswith("."):
        activity = f"{package_name}{activity}"
    return f"{package_name}/{activity}"


def install_apk(
    client: AdbClient,
    apk_path: Path | str,
    package_name: str,
    serial: str | None = None,
    clean_install: bool = False,
) -> None:
    """Installs an APK using adb install -r or clean install (uninstall + install)."""
    apk_str = str(Path(apk_path).resolve())
    if clean_install:
        client.run(["uninstall", package_name], serial=serial)
        proc = client.run(["install", apk_str], serial=serial)
    else:
        proc = client.run(["install", "-r", apk_str], serial=serial)

    combined = f"{proc.stdout}\n{proc.stderr}".strip()
    if proc.returncode != 0 or "Failure" in combined or "Exception" in combined:
        mode_str = "clean install" if clean_install else "reinstall"
        raise RuntimeError(f"ADB {mode_str} failed: {combined}")


def launch_component_intent(
    client: AdbClient,
    launch_component: str,
    serial: str | None = None,
) -> None:
    """Launches an activity component using am start -n."""
    proc = client.run(["shell", "am", "start", "-n", launch_component], serial=serial)
    combined = f"{proc.stdout}\n{proc.stderr}".strip()
    if proc.returncode != 0 or "Error:" in combined:
        raise RuntimeError(f"ADB launch activity failed: {combined}")


def parse_pidof_output(output: str) -> list[int]:
    """Parses whitespace-separated numeric pidof output."""
    pids: list[int] = []
    for token in output.strip().split():
        try:
            pids.append(int(token))
        except ValueError:
            continue
    return pids


def parse_proc_stat(stat_text: str) -> ProcStatInfo:
    """Parses /proc/<pid>/stat or /proc/<pid>/task/<tid>/stat text handling spaces/parentheses in comm."""
    rindex = stat_text.rfind(")")
    if rindex == -1:
        raise ValueError(
            f"Malformed proc stat line (missing closing parenthesis): {stat_text}"
        )

    left = stat_text[:rindex]
    first_open = left.find("(")
    if first_open == -1:
        raise ValueError(
            f"Malformed proc stat line (missing opening parenthesis): {stat_text}"
        )

    pid_str = left[:first_open].strip()
    pid = int(pid_str)
    comm = left[first_open + 1 :]

    fields = stat_text[rindex + 1 :].strip().split()
    if len(fields) < 20:
        raise ValueError(
            f"Malformed proc stat line (too few fields after comm): {stat_text}"
        )

    state = fields[0]
    utime = int(fields[11])
    stime = int(fields[12])
    starttime = int(fields[19])

    return ProcStatInfo(
        pid=pid,
        comm=comm,
        state=state,
        utime=utime,
        stime=stime,
        starttime=starttime,
    )


def parse_proc_system_stat(stat_text: str) -> SystemStatInfo:
    """Parses /proc/stat lines to calculate total aggregate jiffies and online CPU count."""
    total_jiffies = 0
    cpu_count = 0
    for line in stat_text.splitlines():
        line = line.strip()
        if line.startswith("cpu "):
            parts = line.split()[1:]
            for p in parts:
                try:
                    total_jiffies += int(p)
                except ValueError:
                    continue
        elif re.match(r"^cpu\d+", line):
            cpu_count += 1

    return SystemStatInfo(
        total_jiffies=total_jiffies,
        cpu_count=max(cpu_count, 1),
    )


def get_device_timezone(
    client: AdbClient, serial: str | None = None
) -> datetime.tzinfo:
    """Attempts to determine the device time zone via date +%z."""
    try:
        proc = client.run(["shell", "date", "+%z"], serial=serial, timeout=5.0)
        tz_str = proc.stdout.strip()
        if re.match(r"^[+-]\d{4}$", tz_str):
            dt = datetime.datetime.strptime(tz_str, "%z")
            if dt.tzinfo:
                return dt.tzinfo
    except (subprocess.SubprocessError, OSError, ValueError) as err:
        logger.debug("Failed to query device timezone: %s", err)

    return datetime.UTC


def extract_logcat_pid(line: str) -> int | None:
    """Extracts PID integer from logcat line in epoch, threadtime, or brief format."""
    parts = line.split()
    if not parts:
        return None
    if re.match(r"^\d+\.\d+$", parts[0]) and len(parts) >= 2:
        try:
            return int(parts[1])
        except ValueError:
            return None
    if (
        len(parts) >= 3
        and re.match(r"^\d{2}-\d{2}$", parts[0])
        and re.match(r"^\d{2}:\d{2}:\d{2}", parts[1])
    ):
        try:
            return int(parts[2])
        except ValueError:
            return None
    m = re.match(r"^[A-Z]\(\s*(\d+)\)", line)
    if m:
        try:
            return int(m.group(1))
        except ValueError:
            return None
    return None


def parse_exit_info_records(
    dumpsys_output: str, tz: datetime.tzinfo | None = None
) -> list[ExitInfoRecord]:
    """Parses dumpsys activity exit-info output into structured ExitInfoRecord entries."""
    records: list[ExitInfoRecord] = []
    blocks = re.split(r"(?=ApplicationExitInfo\s+#\d+:)", dumpsys_output)

    for block in blocks:
        block = block.strip()
        if not block.startswith("ApplicationExitInfo"):
            continue

        header_match = re.search(r"ApplicationExitInfo\s+#(\d+):", block)
        index = int(header_match.group(1)) if header_match else len(records)

        timestamp = 0
        ts_match = re.search(
            r"timestamp=(\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2}(?:\.\d+)?|\d+)",
            block,
        )
        if ts_match:
            raw_ts = ts_match.group(1).strip()
            if "-" in raw_ts:
                use_tz = tz or datetime.UTC
                dt = datetime.datetime.fromisoformat(raw_ts).replace(tzinfo=use_tz)
                timestamp = int(dt.timestamp() * 1000)
            else:
                timestamp = int(raw_ts)
        pid = 0
        pid_match = re.search(r"pid=(\d+)", block)
        if pid_match:
            pid = int(pid_match.group(1))

        process = ""
        proc_match = re.search(r"process=([^\s]+)", block)
        if proc_match:
            process = proc_match.group(1)

        pkg_match = re.search(r"package=([^\s]+)", block)
        pkg = pkg_match.group(1) if pkg_match else None

        reason_code = 0
        reason_name = "UNKNOWN"
        reason_match = re.search(r"reason=(\d+)(?:\s*\(([^)]+)\))?", block)
        if reason_match:
            reason_code = int(reason_match.group(1))
            if reason_match.group(2):
                reason_name = reason_match.group(2)

        subreason_code: int | None = None
        subreason_name: str | None = None
        sub_match = re.search(r"subreason=(\d+)(?:\s*\(([^)]+)\))?", block)
        if sub_match:
            subreason_code = int(sub_match.group(1))
            if sub_match.group(2):
                subreason_name = sub_match.group(2)

        status = 0
        st_match = re.search(r"status=(-?\d+)", block)
        if st_match:
            status = int(st_match.group(1))

        desc_match = re.search(r"description=([^\n]+)", block)
        desc = desc_match.group(1).strip() if desc_match else None

        records.append(
            ExitInfoRecord(
                index=index,
                timestamp=timestamp,
                pid=pid,
                process=process,
                package=pkg,
                reason_code=reason_code,
                reason_name=reason_name,
                subreason_code=subreason_code,
                subreason_name=subreason_name,
                status=status,
                description=desc,
                raw_text=block,
            )
        )

    return sorted(records, key=lambda r: r.timestamp, reverse=True)


def capture_thread_dump(
    client: AdbClient, pid: int, serial: str | None = None
) -> str | None:
    """Attempts best-effort thread dump capture via kill -3 and recent logcat."""
    client.run(["shell", "kill", "-3", str(pid)], serial=serial)
    time.sleep(0.5)
    proc = client.run(["logcat", "-d", "--pid", str(pid), "-t", "1000"], serial=serial)
    if proc.returncode == 0 and proc.stdout:
        lines = proc.stdout.splitlines()
        dump_lines = [
            ln for ln in lines if "tid=" in ln or "prio=" in ln or "at " in ln
        ]
        if dump_lines:
            return "\n".join(dump_lines[:100])
    return None


def monitor_application(
    client: AdbClient,
    package: str,
    serial: str | None,
    timeout: float | None = None,
    dump_threads: bool = False,
    poll_interval: float = 0.5,
) -> int:
    """Monitors an application process health, ANRs, crashes, and high CPU spin."""
    start_monotonic = time.monotonic()
    deadline = start_monotonic + timeout if timeout is not None else None

    try:
        # Capture initial exit-info baseline
        init_exit_res = client.run(
            ["shell", "dumpsys", "activity", "exit-info", package],
            serial=serial,
            timeout=5.0,
        )

        # Capture device epoch and timezone offset for logcat and timestamp filtering
        epoch_res = client.run(["shell", "date", "+%s %z"], serial=serial, timeout=5.0)
        device_tz: datetime.tzinfo = datetime.UTC
        parts = epoch_res.stdout.strip().split()
        if parts:
            try:
                start_epoch_sec = int(parts[0])
            except ValueError:
                start_epoch_sec = int(time.time())
            if len(parts) >= 2 and re.match(r"^[+-]\d{4}$", parts[1]):
                try:
                    parsed_tz = datetime.datetime.strptime(parts[1], "%z").tzinfo
                    if parsed_tz:
                        device_tz = parsed_tz
                except ValueError:
                    pass
        else:
            start_epoch_sec = int(time.time())

        baseline_records = parse_exit_info_records(init_exit_res.stdout, tz=device_tz)
        baseline_ts = max((r.timestamp for r in baseline_records), default=0)
    except subprocess.TimeoutExpired as e:
        print(f"\nADB operation timed out: {e}", file=sys.stderr)
        return ExitCode.INFRASTRUCTURE_FAILURE
    logcat_args = [
        "logcat",
        "-v",
        "epoch",
        "-T",
        str(start_epoch_sec),
        "ActivityManager:E",
        "AndroidRuntime:E",
        "libc:F",
        "DEBUG:F",
        "crash_dump:F",
        "tombstoned:F",
        "*:S",
    ]

    log_queue: collections.deque[str] = collections.deque(maxlen=256)

    with client.stream(logcat_args, serial=serial) as logcat_proc:
        active_pid: int | None = None
        last_stat: ProcStatInfo | None = None
        last_sys_stat: SystemStatInfo | None = None
        spin_intervals = 0
        healthy_intervals = 0

        print(f"Monitoring process for package '{package}'...")

        line_queue: queue.Queue[str | None] = queue.Queue()

        def _logcat_reader() -> None:
            if logcat_proc.stdout:
                try:
                    for line in iter(logcat_proc.stdout.readline, ""):
                        if not line:
                            break
                        line_queue.put(line)
                except (OSError, ValueError) as err:
                    logger.debug("Logcat reader stream exception: %s", err)
                finally:
                    line_queue.put(None)

        reader_thread = threading.Thread(target=_logcat_reader, daemon=True)
        reader_thread.start()

        try:
            while True:
                # 1. Drain logcat buffer non-blocking via reader queue
                while True:
                    try:
                        raw_line = line_queue.get_nowait()
                    except queue.Empty:
                        break
                    if raw_line is None:
                        break
                    stripped = raw_line.strip()
                    if stripped:
                        log_queue.append(stripped)

                # Check log lines for immediate live ANR or crash events
                for line in list(log_queue):
                    line_pid = extract_logcat_pid(line)
                    is_pid_match = active_pid is not None and line_pid == active_pid
                    is_am_anr = "ActivityManager" in line and bool(
                        re.search(
                            rf"(?<![a-zA-Z0-9_.]){re.escape(package)}(?![a-zA-Z0-9_.])",
                            line,
                        )
                    )

                    if is_pid_match or is_am_anr:
                        if "ANR in" in line or "BIND APPLICATION ANR" in line:
                            print(f"\nLive ANR detected: {line}", file=sys.stderr)
                            if dump_threads and active_pid:
                                dump = capture_thread_dump(client, active_pid, serial)
                                if dump:
                                    print(f"\nThread dump:\n{dump}", file=sys.stderr)
                            return ExitCode.RUNTIME_FAILURE
                        if (
                            "FATAL EXCEPTION" in line
                            or "SIGSEGV" in line
                            or "fatal signal" in line.lower()
                        ):
                            print(f"\nLive Crash detected: {line}", file=sys.stderr)
                            return ExitCode.RUNTIME_FAILURE

                try:
                    # 2. Check for running PID
                    pid_out = client.run(
                        ["shell", "pidof", package], serial=serial, timeout=5.0
                    ).stdout
                    pids = parse_pidof_output(pid_out)

                    if not pids:
                        if active_pid is not None:
                            # Process was running and just disappeared!
                            print(
                                f"\nProcess {active_pid} terminated.", file=sys.stderr
                            )
                            # Query dumpsys activity exit-info
                            exit_res = client.run(
                                ["shell", "dumpsys", "activity", "exit-info", package],
                                serial=serial,
                                timeout=5.0,
                            )
                            records = parse_exit_info_records(
                                exit_res.stdout, tz=device_tz
                            )
                            new_records = [
                                r
                                for r in records
                                if r.timestamp > baseline_ts
                                and (r.package == package or r.pid == active_pid)
                            ]
                            if new_records:
                                rec = new_records[0]
                                desc = f": {rec.description}" if rec.description else ""
                                sub = (
                                    f" (subreason {rec.subreason_code} {rec.subreason_name})"
                                    if rec.subreason_name
                                    else ""
                                )
                                if rec.reason_code in (4, 5, 6):
                                    print(
                                        f"ApplicationExitInfo: reason={rec.reason_code} ({rec.reason_name}){sub}{desc}",
                                        file=sys.stderr,
                                    )
                                    return ExitCode.RUNTIME_FAILURE
                                print(
                                    f"ApplicationExitInfo: reason={rec.reason_code} ({rec.reason_name}){sub}{desc}"
                                )
                                return ExitCode.SUCCESS

                            print(
                                "Process exited without ApplicationExitInfo record.",
                                file=sys.stderr,
                            )
                            return ExitCode.RUNTIME_FAILURE

                        # Process has not started yet
                        if deadline is not None and time.monotonic() >= deadline:
                            print(
                                f"Startup timeout: package '{package}' did not start within timeout.",
                                file=sys.stderr,
                            )
                            return ExitCode.RUNTIME_FAILURE

                        time.sleep(poll_interval)
                        continue

                    # Discovered PID
                    current_pid = pids[0]
                    if active_pid is None or active_pid != current_pid:
                        active_pid = current_pid
                        last_stat = None
                        last_sys_stat = None
                        spin_intervals = 0
                        healthy_intervals = 0
                        print(f"Attached to process PID {active_pid}")

                    # 3. Sample proc stats
                    stat_out = client.run(
                        ["shell", "cat", f"/proc/{active_pid}/task/{active_pid}/stat"],
                        serial=serial,
                        timeout=5.0,
                    ).stdout
                    sys_stat_out = client.run(
                        ["shell", "cat", "/proc/stat"], serial=serial, timeout=5.0
                    ).stdout
                except subprocess.TimeoutExpired as e:
                    print(f"\nADB polling operation timed out: {e}", file=sys.stderr)
                    return ExitCode.INFRASTRUCTURE_FAILURE
                try:
                    proc_stat = parse_proc_stat(stat_out)
                    sys_stat = parse_proc_system_stat(sys_stat_out)
                except (ValueError, IndexError):
                    time.sleep(poll_interval)
                    continue

                if (
                    last_stat
                    and last_sys_stat
                    and last_stat.starttime == proc_stat.starttime
                ):
                    thread_delta = (proc_stat.utime + proc_stat.stime) - (
                        last_stat.utime + last_stat.stime
                    )
                    sys_delta = sys_stat.total_jiffies - last_sys_stat.total_jiffies

                    cpu_pct = 0.0
                    if sys_delta > 0:
                        cpu_pct = (
                            (thread_delta / sys_delta) * sys_stat.cpu_count * 100.0
                        )

                    # Check spin condition: state R and CPU >= 90%
                    if proc_stat.state == "R" and cpu_pct >= 90.0:
                        spin_intervals += 1
                        if spin_intervals >= 6:  # 6 * 0.5s = 3.0s
                            print(
                                f"\nHigh CPU Spin Warning: main thread TID {active_pid} sustained >=90% CPU ({cpu_pct:.1f}%) in state 'R' for 3.0s",
                                file=sys.stderr,
                            )
                            if dump_threads:
                                dump = capture_thread_dump(client, active_pid, serial)
                                if dump:
                                    print(f"\nThread dump:\n{dump}", file=sys.stderr)
                            return ExitCode.RUNTIME_FAILURE
                    else:
                        spin_intervals = 0
                        healthy_intervals += 1
                else:
                    healthy_intervals += 1

                last_stat = proc_stat
                last_sys_stat = sys_stat

                # Check deadline
                if deadline is not None and time.monotonic() >= deadline:
                    if healthy_intervals >= 1:
                        print(
                            f"Monitoring completed: process healthy after {timeout}s."
                        )
                        return ExitCode.SUCCESS
                    print(
                        f"Monitoring timeout: no complete healthy sample within {timeout}s.",
                        file=sys.stderr,
                    )
                    return ExitCode.RUNTIME_FAILURE

                time.sleep(poll_interval)

        except KeyboardInterrupt:
            print("\nInterrupted.")
            return ExitCode.SUCCESS


def run_monitor(args: argparse.Namespace) -> int:
    """CLI handler for monitor subcommand."""
    client = AdbClient()
    devices = parse_adb_devices(client.run(["devices"]).stdout)
    serial = select_device(devices, args.device)
    return monitor_application(
        client=client,
        package=args.package,
        serial=serial,
        timeout=args.timeout,
        dump_threads=args.dump_threads,
    )


def parse_bounds(bounds_str: str) -> tuple[int, int, int, int]:
    """Parses [left,top][right,bottom] into (left, top, right, bottom)."""
    m = re.match(r"\[(-?\d+),(-?\d+)\]\[(-?\d+),(-?\d+)\]", bounds_str)
    if not m:
        raise ValueError(f"Invalid bounds string: {bounds_str}")
    return int(m.group(1)), int(m.group(2)), int(m.group(3)), int(m.group(4))


def dump_ui_hierarchy(device: str | None = None) -> list[UiNode]:
    """Dumps device UI hierarchy and parses all UI nodes."""
    raw = run_adb(device, ["exec-out", "uiautomator", "dump", "/dev/tty"])
    start = raw.find("<?xml")
    if start == -1:
        start = raw.find("<hierarchy")
    end = raw.find("</hierarchy>")
    if start == -1 or end == -1:
        raise RuntimeError(f"Failed to find UI hierarchy in output: {raw[:200]}")
    xml_content = raw[start : end + len("</hierarchy>")]
    root = ET.fromstring(xml_content)
    nodes: list[UiNode] = []
    for elem in root.iter("node"):
        attrib = elem.attrib
        bounds_str = attrib.get("bounds", "[0,0][0,0]")
        bounds = parse_bounds(bounds_str)
        clickable = attrib.get("clickable", "false").lower() == "true"
        nodes.append(
            UiNode(
                text=attrib.get("text", ""),
                content_desc=attrib.get("content-desc", ""),
                resource_id=attrib.get("resource-id", ""),
                class_name=attrib.get("class", ""),
                clickable=clickable,
                bounds=bounds,
            )
        )
    return nodes


def click_ui_node(device: str | None, node: UiNode) -> None:
    """Clicks on the center coordinates of the given UI node."""
    x, y = node.center
    run_adb(device, ["shell", "input", "tap", str(x), str(y)])


def find_ui_nodes(
    nodes: list[UiNode],
    *,
    text: str | None = None,
    desc: str | None = None,
    resource_id: str | None = None,
    clickable_only: bool = False,
) -> list[UiNode]:
    """Filters UI nodes by text, desc, resource_id, and/or clickable status."""
    results: list[UiNode] = []
    for node in nodes:
        if clickable_only and not node.clickable:
            continue
        if not node.matches(text=text, desc=desc, resource_id=resource_id):
            continue
        results.append(node)
    return results
