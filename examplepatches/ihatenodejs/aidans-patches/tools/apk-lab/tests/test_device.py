from __future__ import annotations

import subprocess
from unittest.mock import MagicMock

import pytest
from apk_lab.device import (
    AdbClient,
    AdbDevice,
    CrashReport,
    click_ui_node,
    dump_ui_hierarchy,
    find_ui_nodes,
    harvest_recent_crashes,
    monitor_application,
    parse_adb_devices,
    parse_bounds,
    parse_exit_info_records,
    parse_launcher_activity,
    parse_proc_stat,
    parse_proc_system_stat,
    resolve_crash_frames,
    resolve_crash_report,
    resolve_frame_in_smali,
    select_device,
)
from apk_lab.models import ExitCode, UiNode


def test_parse_adb_devices():
    output = """
* daemon not running; starting now at tcp:5037
* daemon started successfully
List of devices attached
emulator-5554	device
emulator-5556	offline
192.168.1.100:5555	unauthorized
"""
    devices = parse_adb_devices(output)
    assert len(devices) == 3
    assert devices[0] == AdbDevice("emulator-5554", "device")
    assert devices[1] == AdbDevice("emulator-5556", "offline")
    assert devices[2] == AdbDevice("192.168.1.100:5555", "unauthorized")


def test_select_device_single_online():
    devices = [
        AdbDevice("emulator-5554", "device"),
        AdbDevice("emulator-5556", "offline"),
    ]
    assert select_device(devices, None) == "emulator-5554"


def test_select_device_multiple_online_fails_without_serial():
    devices = [
        AdbDevice("emulator-5554", "device"),
        AdbDevice("emulator-5556", "device"),
    ]
    with pytest.raises(ValueError, match="Multiple online ADB devices"):
        select_device(devices, None)


def test_select_device_no_online_fails():
    devices = [AdbDevice("emulator-5556", "offline")]
    with pytest.raises(ValueError, match="No online ADB devices found"):
        select_device(devices, None)


def test_select_device_explicit_serial_valid():
    devices = [
        AdbDevice("emulator-5554", "device"),
        AdbDevice("emulator-5556", "offline"),
    ]
    assert select_device(devices, "emulator-5554") == "emulator-5554"


def test_select_device_explicit_serial_offline_rejected():
    devices = [
        AdbDevice("emulator-5554", "device"),
        AdbDevice("emulator-5556", "offline"),
    ]
    with pytest.raises(ValueError, match="is in state 'offline', must be 'device'"):
        select_device(devices, "emulator-5556")


def test_select_device_explicit_serial_not_found():
    devices = [AdbDevice("emulator-5554", "device")]
    with pytest.raises(ValueError, match="Device 'emulator-9999' not found"):
        select_device(devices, "emulator-9999")


def test_adb_client_run_and_stream(monkeypatch):
    mock_run = MagicMock(return_value=subprocess.CompletedProcess(["adb"], 0, "ok", ""))
    monkeypatch.setattr(subprocess, "run", mock_run)

    client = AdbClient(adb_path="/usr/bin/adb")
    res = client.run(["shell", "getprop"], serial="emulator-5554", timeout=5.0)
    assert res.stdout == "ok"
    mock_run.assert_called_once_with(
        ["/usr/bin/adb", "-s", "emulator-5554", "shell", "getprop"],
        capture_output=True,
        text=True,
        errors="replace",
        timeout=5.0,
        check=False,
    )


def test_parse_proc_stat_with_spaces_and_parentheses():
    # comm with spaces and parentheses: (My (Special) App)
    stat_line = (
        "1234 (My (Special) App) R 100 200 300 0 -1 4194304 10 20 0 0 "
        "150 250 5 10 20 0 4 0 50000 1000000 200 18446744073709551615 0 0 0 0 0 0 0 0 0 0 0 0 17 0 0 0"
    )
    info = parse_proc_stat(stat_line)
    assert info.pid == 1234
    assert info.comm == "My (Special) App"
    assert info.state == "R"
    assert info.utime == 150
    assert info.stime == 250
    assert info.starttime == 50000


def test_parse_proc_system_stat():
    stat_text = """
cpu  1000 200 300 5000 100 50 20 0 0 0
cpu0 500 100 150 2500 50 25 10 0 0 0
cpu1 500 100 150 2500 50 25 10 0 0 0
intr 12345
"""
    info = parse_proc_system_stat(stat_text)
    assert info.total_jiffies == 1000 + 200 + 300 + 5000 + 100 + 50 + 20
    assert info.cpu_count == 2


def test_parse_exit_info_records():
    dumpsys = """
ApplicationExitInfo #0:
  timestamp=1710000005000
  pid=4321
  realUid=10100
  package=com.example.app
  process=com.example.app
  reason=6 (ANR)
  subreason=34 (BIND APPLICATION ANR)
  status=0
  description=Process failed to complete startup
ApplicationExitInfo #1:
  timestamp=1710000001000
  pid=4320
  realUid=10100
  package=com.example.app
  process=com.example.app
  reason=5 (CRASH_NATIVE)
  subreason=0
  status=139
  description=SIGSEGV
ApplicationExitInfo #2:
  timestamp=1709000000000
  pid=4310
  realUid=10100
  package=com.example.app
  process=com.example.app
  reason=4 (CRASH)
  status=1
  description=java.lang.NullPointerException
"""
    records = parse_exit_info_records(dumpsys)
    assert len(records) == 3
    assert records[0].reason_code == 6
    assert records[0].reason_name == "ANR"
    assert records[0].subreason_code == 34
    assert records[0].subreason_name == "BIND APPLICATION ANR"
    assert records[0].description == "Process failed to complete startup"

    assert records[1].reason_code == 5
    assert records[1].reason_name == "CRASH_NATIVE"

    assert records[2].reason_code == 4
    assert records[2].reason_name == "CRASH"


def test_parse_launcher_activity():
    badging_normal = """
package: name='com.example.app' versionCode='1' versionName='1.0'
launchable-activity: name='com.example.app.MainActivity'  label='App' icon='res/icon.png'
"""
    assert (
        parse_launcher_activity(badging_normal, "com.example.app")
        == "com.example.app/com.example.app.MainActivity"
    )

    badging_relative = """
launchable-activity: name='.ui.SplashActivity'  label='App' icon='res/icon.png'
"""
    assert (
        parse_launcher_activity(badging_relative, "com.example.app")
        == "com.example.app/com.example.app.ui.SplashActivity"
    )

    badging_none = "package: name='com.example.app'"
    with pytest.raises(ValueError, match="No launchable activity found"):
        parse_launcher_activity(badging_none, "com.example.app")

    badging_multiple = """
launchable-activity: name='com.example.app.Act1' label='A1'
launchable-activity: name='com.example.app.Act2' label='A2'
"""
    with pytest.raises(ValueError, match="Expected exactly one launchable activity"):
        parse_launcher_activity(badging_multiple, "com.example.app")


def test_monitor_healthy_completion():
    client = MagicMock()
    calls = 0

    def mock_run(args, **kwargs):
        nonlocal calls
        calls += 1
        if "exit-info" in args:
            return subprocess.CompletedProcess(
                [], 0, "ApplicationExitInfo #0:\n timestamp=1000\n", ""
            )
        if "date" in args:
            return subprocess.CompletedProcess([], 0, "1710000000\n", "")
        if "pidof" in args:
            return subprocess.CompletedProcess([], 0, "1234\n", "")
        if "/task/" in " ".join(args):
            return subprocess.CompletedProcess(
                [],
                0,
                f"1234 (app) S 1 1 1 0 0 0 0 0 0 0 {10 + calls} {20 + calls} 0 0 20 0 1 0 100 100 10 0 0 0 0 0 0 0 0 0 0 0 0 0",
                "",
            )
        if "/proc/stat" in " ".join(args):
            return subprocess.CompletedProcess(
                [], 0, f"cpu {1000 + calls * 100} 0 0 5000\ncpu0 500\n", ""
            )
        return subprocess.CompletedProcess([], 0, "", "")

    client.run.side_effect = mock_run
    mock_proc = MagicMock()
    mock_proc.stdout = None
    mock_proc.poll.return_value = 0
    cm = MagicMock()
    cm.__enter__.return_value = mock_proc
    cm.__exit__.return_value = False
    client.stream.return_value = cm

    code = monitor_application(
        client=client,
        package="com.example.app",
        serial="emulator-5554",
        timeout=0.01,
        poll_interval=0.002,
    )
    assert code == ExitCode.SUCCESS


def test_monitor_high_cpu_spin_detection(monkeypatch):
    client = MagicMock()
    # Mock sequence: baseline exit, date, pidof, then 6 consecutive intervals with R state and high CPU
    responses = [
        subprocess.CompletedProcess([], 0, "", ""),  # baseline exit-info
        subprocess.CompletedProcess([], 0, "1710000000\n", ""),  # date
    ]
    # For 7 samples: pidof + stat + sys_stat
    for i in range(8):
        responses.append(subprocess.CompletedProcess([], 0, "1234\n", ""))  # pidof
        # utime increases by 100 each time, state is R
        responses.append(
            subprocess.CompletedProcess(
                [],
                0,
                f"1234 (app) R 1 1 1 0 0 0 0 0 0 0 {100 + i * 100} 0 0 0 20 0 1 0 100 100 10 0 0 0 0 0 0 0 0 0 0 0 0 0",
                "",
            )
        )
        # total jiffies increases by 100 each time (100% of 1 CPU)
        responses.append(
            subprocess.CompletedProcess(
                [],
                0,
                f"cpu {1000 + i * 100} 0 0 0\ncpu0 100\n",
                "",
            )
        )

    client.run.side_effect = responses

    mock_proc = MagicMock()
    mock_proc.stdout = None
    mock_proc.poll.return_value = 0
    cm = MagicMock()
    cm.__enter__.return_value = mock_proc
    cm.__exit__.return_value = False
    client.stream.return_value = cm

    code = monitor_application(
        client=client,
        package="com.example.app",
        serial="emulator-5554",
        timeout=10.0,
        poll_interval=0.001,
    )
    assert code == ExitCode.RUNTIME_FAILURE


def test_monitor_process_disappears_with_crash_exit_info(monkeypatch):
    client = MagicMock()
    client.run.side_effect = [
        subprocess.CompletedProcess(
            [], 0, "ApplicationExitInfo #0:\n timestamp=1000\n", ""
        ),  # baseline
        subprocess.CompletedProcess([], 0, "1710000000\n", ""),  # date
        subprocess.CompletedProcess([], 0, "1234\n", ""),  # pidof attached
        subprocess.CompletedProcess(
            [],
            0,
            "1234 (app) S 1 1 1 0 0 0 0 0 0 0 10 20 0 0 20 0 1 0 100 100 10 0 0 0 0 0 0 0 0 0 0 0 0 0",
            "",
        ),
        subprocess.CompletedProcess([], 0, "cpu 1000 0 0 5000\ncpu0 500\n", ""),
        subprocess.CompletedProcess([], 0, "", ""),  # pidof empty -> disappeared!
        subprocess.CompletedProcess(  # exit-info query
            [],
            0,
            """
ApplicationExitInfo #0:
  timestamp=2000
  pid=1234
  package=com.example.app
  process=com.example.app
  reason=4 (CRASH)
  status=1
  description=NullPointerException
""",
            "",
        ),
    ]

    mock_proc = MagicMock()
    mock_proc.stdout = None
    mock_proc.poll.return_value = 0
    cm = MagicMock()
    cm.__enter__.return_value = mock_proc
    cm.__exit__.return_value = False
    client.stream.return_value = cm

    code = monitor_application(
        client=client,
        package="com.example.app",
        serial="emulator-5554",
        timeout=5.0,
        poll_interval=0.001,
    )
    assert code == ExitCode.RUNTIME_FAILURE


def test_monitor_startup_timeout():
    client = MagicMock()

    def mock_run(args, **kwargs):
        if "date" in args:
            return subprocess.CompletedProcess([], 0, "1710000000\n", "")
        return subprocess.CompletedProcess([], 0, "", "")

    client.run.side_effect = mock_run
    mock_proc = MagicMock()
    mock_proc.stdout = None
    mock_proc.poll.return_value = 0
    cm = MagicMock()
    cm.__enter__.return_value = mock_proc
    cm.__exit__.return_value = False
    client.stream.return_value = cm

    code = monitor_application(
        client=client,
        package="com.example.app",
        serial="emulator-5554",
        timeout=0.01,
        poll_interval=0.002,
    )
    assert code == ExitCode.RUNTIME_FAILURE


def test_monitor_ctrl_c():
    client = MagicMock()
    calls = 0

    def mock_run(args, **kwargs):
        nonlocal calls
        calls += 1
        if calls >= 3:
            raise KeyboardInterrupt()
        if "date" in args:
            return subprocess.CompletedProcess([], 0, "1710000000\n", "")
        return subprocess.CompletedProcess([], 0, "", "")

    client.run.side_effect = mock_run
    mock_proc = MagicMock()
    mock_proc.stdout = None
    mock_proc.poll.return_value = 0
    cm = MagicMock()
    cm.__enter__.return_value = mock_proc
    cm.__exit__.return_value = False
    client.stream.return_value = cm

    code = monitor_application(
        client=client,
        package="com.example.app",
        serial="emulator-5554",
        timeout=10.0,
        poll_interval=0.001,
    )
    assert code == ExitCode.SUCCESS


def test_parse_exit_info_formatted_timestamp_fixture():
    dumpsys_real = """
ApplicationExitInfo #0:
  timestamp=2024-03-09 14:20:05.159
  pid=12345
  realUid=10123
  package=com.example.app
  process=com.example.app
  reason=5 (CRASH_NATIVE)
  subreason=0
  status=139
  description=SIGSEGV
ApplicationExitInfo #1:
  timestamp=2024-03-09 14:15:00.000
  pid=12300
  realUid=10123
  package=com.example.app
  process=com.example.app
  reason=4 (CRASH)
  status=1
  description=java.lang.RuntimeException
"""
    from datetime import UTC, datetime

    tz = UTC
    records = parse_exit_info_records(dumpsys_real, tz=tz)
    assert len(records) == 2
    expected_ts_0 = int(
        datetime(2024, 3, 9, 14, 20, 5, 159000, tzinfo=tz).timestamp() * 1000
    )
    expected_ts_1 = int(
        datetime(2024, 3, 9, 14, 15, 0, 0, tzinfo=tz).timestamp() * 1000
    )
    assert records[0].timestamp == expected_ts_0
    assert records[1].timestamp == expected_ts_1
    assert records[0].timestamp > records[1].timestamp
    assert records[0].reason_code == 5
    assert records[0].pid == 12345


def test_monitor_adb_timeout_expired():
    client = MagicMock()
    client.run.side_effect = subprocess.TimeoutExpired(
        cmd=["adb", "shell"], timeout=5.0
    )

    code = monitor_application(
        client=client,
        package="com.example.app",
        serial="emulator-5554",
        timeout=10.0,
    )
    assert code == ExitCode.INFRASTRUCTURE_FAILURE


def test_extract_logcat_pid():
    from apk_lab.device import extract_logcat_pid

    epoch_line = "1710000005.123  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main"
    assert extract_logcat_pid(epoch_line) == 1234

    threadtime_line = "03-09 14:20:05.123  5678  5678 E AndroidRuntime: FATAL"
    assert extract_logcat_pid(threadtime_line) == 5678

    brief_line = "E( 9999) Tag: msg"
    assert extract_logcat_pid(brief_line) == 9999

    invalid_line = "just some random text without pid"
    assert extract_logcat_pid(invalid_line) is None


def test_monitor_activity_manager_anr_token_matching():
    import io

    calls = 0

    def mock_run(args, **kwargs):
        nonlocal calls
        calls += 1
        if "exit-info" in args:
            return subprocess.CompletedProcess(
                [], 0, "ApplicationExitInfo #0:\n timestamp=1000\n", ""
            )
        if "date" in args:
            return subprocess.CompletedProcess([], 0, "1710000000 +0000\n", "")
        if "pidof" in args:
            return subprocess.CompletedProcess([], 0, "1234\n", "")
        if "/task/" in " ".join(args):
            return subprocess.CompletedProcess(
                [],
                0,
                f"1234 (app) S 1 1 1 0 0 0 0 0 0 0 {10 + calls} {20 + calls} 0 0 20 0 1 0 100 100 10 0 0 0 0 0 0 0 0 0 0 0 0 0",
                "",
            )
        if "/proc/stat" in " ".join(args):
            return subprocess.CompletedProcess(
                [], 0, f"cpu {1000 + calls * 100} 0 0 5000\ncpu0 500\n", ""
            )
        return subprocess.CompletedProcess([], 0, "", "")

    # 1. ANR line for 'com.example.apple' must NOT match monitored 'com.example.app'
    client_prefix = MagicMock()
    client_prefix.run.side_effect = mock_run
    mock_proc_prefix = MagicMock()
    mock_proc_prefix.stdout = io.StringIO(
        "1710000000.000 9999 9999 E ActivityManager: ANR in com.example.apple\n"
    )
    mock_proc_prefix.poll.return_value = 0
    cm_prefix = MagicMock()
    cm_prefix.__enter__.return_value = mock_proc_prefix
    cm_prefix.__exit__.return_value = False
    client_prefix.stream.return_value = cm_prefix

    code_prefix = monitor_application(
        client=client_prefix,
        package="com.example.app",
        serial="emulator-5554",
        timeout=0.01,
        poll_interval=0.002,
    )
    assert code_prefix == ExitCode.SUCCESS

    # 2. ANR line for exact 'com.example.app' MUST match
    calls = 0
    client_exact = MagicMock()
    client_exact.run.side_effect = mock_run
    mock_proc_exact = MagicMock()
    mock_proc_exact.stdout = io.StringIO(
        "1710000000.000 9999 9999 E ActivityManager: ANR in com.example.app\n"
    )
    mock_proc_exact.poll.return_value = 0
    cm_exact = MagicMock()
    cm_exact.__enter__.return_value = mock_proc_exact
    cm_exact.__exit__.return_value = False
    client_exact.stream.return_value = cm_exact

    code_exact = monitor_application(
        client=client_exact,
        package="com.example.app",
        serial="emulator-5554",
        timeout=0.01,
        poll_interval=0.002,
    )
    assert code_exact == ExitCode.RUNTIME_FAILURE


def test_harvest_crashes_verify_error(monkeypatch):
    logcat = """
10-15 12:00:00.000  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main
10-15 12:00:00.000  1234  1234 E AndroidRuntime: Process: com.example.app, PID: 1234
10-15 12:00:00.000  1234  1234 E AndroidRuntime: java.lang.VerifyError: Rejecting class com.example.Bad
10-15 12:00:00.000  1234  1234 E AndroidRuntime:     at com.example.app.MainActivity.onCreate(MainActivity.java:20)
"""
    monkeypatch.setattr("apk_lab.device.run_adb", lambda _device, _args: logcat)

    reports = harvest_recent_crashes("com.example.app", device="emulator-5554")

    assert len(reports) == 1
    assert reports[0].process == "com.example.app"
    assert reports[0].pid == 1234
    assert reports[0].exception_type == "java.lang.VerifyError"
    assert reports[0].message == "Rejecting class com.example.Bad"
    assert reports[0].stack_trace == [
        "at com.example.app.MainActivity.onCreate(MainActivity.java:20)"
    ]


def test_harvest_crashes_fatal_exception(monkeypatch):
    logcat = """
10-15 12:01:00.000  4567  4567 E AndroidRuntime: FATAL EXCEPTION: main
10-15 12:01:00.000  4567  4567 E AndroidRuntime: Process: com.example.app, PID: 4567
10-15 12:01:00.000  4567  4567 E AndroidRuntime: java.lang.IllegalStateException: Broken state
10-15 12:01:00.000  4567  4567 E AndroidRuntime:     at com.example.app.Widget.create(Widget.java:9)
"""
    monkeypatch.setattr("apk_lab.device.run_adb", lambda _device, _args: logcat)

    reports = harvest_recent_crashes("com.example.app")

    assert len(reports) == 1
    assert reports[0].exception_type == "java.lang.IllegalStateException"
    assert reports[0].message == "Broken state"
    assert reports[0].timestamp == "10-15 12:01:00.000"


def test_harvest_crashes_no_matches(monkeypatch):
    logcat = """
10-15 12:02:00.000   100   100 I ActivityManager: Start proc 100:com.example.app/u0a1
10-15 12:02:01.000   100   100 I com.example.app: Application started
"""
    monkeypatch.setattr("apk_lab.device.run_adb", lambda _device, _args: logcat)

    assert harvest_recent_crashes("com.example.app") == []


def test_resolve_frame_in_smali(tmp_path):
    smali_dir = tmp_path / "smali"
    smali_dir.mkdir()
    target_smali = smali_dir / "ie4.smali"
    target_smali.write_text(
        """.class public Lie4;
.super Ljava/lang/Object;

.method public static final m()V
    .registers 1

    const/4 v0, 0x0
    return-void
.end method
""",
        encoding="utf-8",
    )

    frame = "    at ie4.m(SourceFile:1239)"
    resolved = resolve_frame_in_smali(frame, smali_dir)

    assert resolved.raw_frame == frame
    assert resolved.class_name == "ie4"
    assert resolved.method_name == "m"
    assert resolved.smali_path == target_smali
    assert resolved.method_signature == ".method public static final m()V"
    assert resolved.code_snippet is not None
    assert ".registers 1" in resolved.code_snippet
    assert "const/4 v0, 0x0" in resolved.code_snippet
    assert "return-void" in resolved.code_snippet


def test_resolve_frame_in_smali_targets_line_number(tmp_path):
    smali_dir = tmp_path / "smali"
    smali_pkg = smali_dir / "com" / "example"
    smali_pkg.mkdir(parents=True)
    target_smali = smali_pkg / "Foo.smali"

    smali_lines = [
        ".class public Lcom/example/Foo;",
        ".super Ljava/lang/Object;",
        "",
        ".method public testMethod()V",
        "    .registers 16",
        "    .line 10",
        "    const/4 v0, 0x0",
        "    const/4 v1, 0x1",
        "    const/4 v2, 0x2",
        "    const/4 v3, 0x3",
        "    .line 20",
        "    const/4 v4, 0x4",
        "    const/4 v5, 0x5",
        "    const/4 v6, 0x6",
        "    const/4 v7, 0x7",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    .line 641",
        "    invoke-virtual {v11, v12}, Lgw7;->t(Z)V",
        "    move-result v8",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    .line 700",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    nop",
        "    return-void",
        ".end method",
    ]
    target_smali.write_text("\n".join(smali_lines) + "\n", encoding="utf-8")

    frame = "    at com.example.Foo.testMethod(Foo.kt:641)"
    resolved = resolve_frame_in_smali(frame, smali_dir)

    assert resolved.code_snippet is not None
    assert ".line 641" in resolved.code_snippet
    assert "invoke-virtual {v11, v12}, Lgw7;->t(Z)V" in resolved.code_snippet
    assert not resolved.code_snippet[0].startswith((".line 1", ".line 10"))

    missing_frame = "    at com.example.Foo.testMethod(Foo.kt:9999)"
    resolved_missing = resolve_frame_in_smali(missing_frame, smali_dir)

    assert resolved_missing.code_snippet is not None
    assert len(resolved_missing.code_snippet) == 15
    assert resolved_missing.code_snippet[0] == ".registers 16"

    no_line_frame = "    at com.example.Foo.testMethod(Foo.kt)"
    resolved_no_line = resolve_frame_in_smali(no_line_frame, smali_dir)
    assert resolved_no_line.code_snippet is not None
    assert len(resolved_no_line.code_snippet) == 15
    assert resolved_no_line.code_snippet[0] == ".registers 16"


def test_resolve_frame_missing_smali(tmp_path):
    smali_dir = tmp_path / "smali"
    smali_dir.mkdir()

    frame = "    at ie4.m(SourceFile:1239)"
    resolved = resolve_frame_in_smali(frame, smali_dir)

    assert resolved.raw_frame == frame
    assert resolved.class_name == "ie4"
    assert resolved.method_name == "m"
    assert resolved.smali_path is None
    assert resolved.method_signature is None
    assert resolved.code_snippet is None


def test_resolve_crash_report_and_multidex(tmp_path):
    root_dir = tmp_path / "workspace"
    classes2_smali = root_dir / "smali_classes2" / "com" / "example" / "foo"
    classes2_smali.mkdir(parents=True)
    bar_smali = classes2_smali / "Bar.smali"
    bar_smali.write_text(
        """.class public Lcom/example/foo/Bar;
.super Ljava/lang/Object;

.method public doWork(Ljava/lang/String;)I
    .registers 3
    const/4 v0, 0x1
    return v0
.end method
""",
        encoding="utf-8",
    )

    crash = CrashReport(
        process="com.example.foo",
        pid=1234,
        exception_type="java.lang.NullPointerException",
        message="attempt to read from null",
        stack_trace=[
            "    at com.example.foo.Bar.doWork(Bar.java:42)",
            "    at com.example.foo.Missing.run(Missing.java:10)",
        ],
    )

    resolved_crash = resolve_crash_report(crash, root_dir)
    assert resolved_crash.resolved_frames is not None
    assert len(resolved_crash.resolved_frames) == 2

    f1 = resolved_crash.resolved_frames[0]
    assert f1.class_name == "com.example.foo.Bar"
    assert f1.method_name == "doWork"
    assert f1.smali_path == bar_smali
    assert f1.method_signature == ".method public doWork(Ljava/lang/String;)I"
    assert f1.code_snippet == [".registers 3", "const/4 v0, 0x1", "return v0"]

    f2 = resolved_crash.resolved_frames[1]
    assert f2.class_name == "com.example.foo.Missing"
    assert f2.method_name == "run"
    assert f2.smali_path is None

    frames_only = resolve_crash_frames(crash, root_dir)
    assert len(frames_only) == 2
    assert frames_only[0].smali_path == bar_smali


def test_parse_bounds_and_node_center():
    bounds = parse_bounds("[32,103][251,192]")
    assert bounds == (32, 103, 251, 192)
    node = UiNode(
        text="Test",
        content_desc="",
        resource_id="com.example:id/btn",
        class_name="android.widget.Button",
        clickable=True,
        bounds=bounds,
    )
    assert node.center == (141, 147)
    assert node.matches(text="test")
    assert node.matches(resource_id="btn")
    assert not node.matches(text="missing")


def test_dump_ui_hierarchy_handles_trailing_stdout_noise(monkeypatch):
    xml_output = """<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<hierarchy rotation="0">
  <node index="0" text="Must Watch" resource-id="" class="android.widget.TextView" package="com.nhl" content-desc="" checkable="false" checked="false" clickable="false" enabled="true" focusable="false" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[32,297][861,361]" />
  <node index="1" text="" resource-id="" class="android.view.View" package="com.nhl" content-desc="media" checkable="false" checked="false" clickable="true" enabled="true" focusable="false" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[281,2259][360,2290]" />
</hierarchy>
UI hierachy dumped to: /dev/tty
"""
    monkeypatch.setattr("apk_lab.device.run_adb", lambda dev, args: xml_output)

    nodes = dump_ui_hierarchy(device="emulator-5554")
    assert len(nodes) == 2
    assert nodes[0].text == "Must Watch"
    assert not nodes[0].clickable

    media_nodes = find_ui_nodes(nodes, desc="media")
    assert len(media_nodes) == 1
    media_node = media_nodes[0]
    assert media_node.content_desc == "media"
    assert media_node.matches(desc="media")
    assert media_node.clickable
    assert media_node.center == (320, 2274)

    clickable_nodes = find_ui_nodes(nodes, clickable_only=True)
    assert len(clickable_nodes) == 1
    assert clickable_nodes[0] == media_node


def test_click_ui_node(monkeypatch):
    mock_run_adb = MagicMock()
    monkeypatch.setattr("apk_lab.device.run_adb", mock_run_adb)

    node = UiNode(
        text="",
        content_desc="media",
        resource_id="",
        class_name="android.view.View",
        clickable=True,
        bounds=(281, 2259, 360, 2290),
    )
    click_ui_node("emulator-5554", node)
    mock_run_adb.assert_called_once_with(
        "emulator-5554", ["shell", "input", "tap", "320", "2274"]
    )
