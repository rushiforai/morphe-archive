//! Contract tests for device selection, monitoring, crash harvesting, Smali
//! frame resolution and UI automation.
//!
//! Every test scripts adb output and uses a fake monotonic clock. Nothing here
//! sleeps for real, spawns adb, or requires a connected device.

use apk_lab::device::{
    click_ui_node, device_sdk_level, dump_ui_hierarchy, extract_logcat_pid, find_ui_nodes,
    get_installed_package_signature, harvest_recent_crashes, monitor_application,
    parse_adb_devices, parse_bounds, parse_crash_logcat, parse_exit_info_records, parse_getprop,
    parse_launcher_activity, parse_pidof_output, parse_proc_stat, parse_proc_system_stat,
    parse_ui_hierarchy, resolve_crash_frames, resolve_crash_report, resolve_device,
    resolve_frame_in_smali, select_device, AdbDevice, AdbLineStream, AdbOutput, AdbRunner,
    CrashReport, MonitorClock, MonitorOutcome, MonitorRequest, MonitorStream, UiFilter, UiNode,
    MONITOR_POLL_INTERVAL,
};
use apk_lab::error::Error;
use apk_lab::models::ExitCode;
use std::cell::{Cell, RefCell};
use std::collections::VecDeque;
use std::fs;
use std::path::PathBuf;
use std::time::Duration;

enum FakeResponse {
    Output(AdbOutput),
    Failure(Error),
}

struct FakeAdb {
    responses: RefCell<VecDeque<FakeResponse>>,
    streams: RefCell<VecDeque<VecDeque<String>>>,
    seen: RefCell<Vec<Vec<String>>>,
}

impl FakeAdb {
    fn new() -> Self {
        Self {
            responses: RefCell::new(VecDeque::new()),
            streams: RefCell::new(VecDeque::new()),
            seen: RefCell::new(Vec::new()),
        }
    }

    fn output(self, stdout: impl AsRef<str>) -> Self {
        self.raw(AdbOutput {
            status: 0,
            stdout: stdout.as_ref().to_string(),
            stderr: String::new(),
            timed_out: false,
        })
    }

    fn raw(self, output: AdbOutput) -> Self {
        self.responses
            .borrow_mut()
            .push_back(FakeResponse::Output(output));
        self
    }

    fn failure(self, error: Error) -> Self {
        self.responses
            .borrow_mut()
            .push_back(FakeResponse::Failure(error));
        self
    }

    fn stream(self, lines: &[&str]) -> Self {
        self.streams.borrow_mut().push_back(
            lines
                .iter()
                .map(|line| (*line).to_string())
                .collect::<VecDeque<_>>(),
        );
        self
    }

    fn seen(&self) -> Vec<Vec<String>> {
        self.seen.borrow().clone()
    }
}

impl AdbRunner for FakeAdb {
    fn run(
        &self,
        args: &[String],
        serial: Option<&str>,
        _timeout: Option<Duration>,
    ) -> Result<AdbOutput, Error> {
        let mut seen = args.to_vec();
        if let Some(serial) = serial {
            seen.insert(0, format!("-s {serial}"));
        }
        self.seen.borrow_mut().push(seen);
        match self.responses.borrow_mut().pop_front() {
            Some(FakeResponse::Output(output)) => Ok(output),
            Some(FakeResponse::Failure(error)) => Err(error),
            None => panic!("unexpected adb run: {args:?}"),
        }
    }

    fn stream(
        &self,
        args: &[String],
        _serial: Option<&str>,
    ) -> Result<Box<dyn AdbLineStream>, Error> {
        self.seen.borrow_mut().push(args.to_vec());
        let lines = self.streams.borrow_mut().pop_front().unwrap_or_default();
        Ok(Box::new(FakeStream { lines }))
    }
}

struct FakeStream {
    lines: VecDeque<String>,
}

impl AdbLineStream for FakeStream {
    fn try_next_line(&mut self) -> Option<String> {
        self.lines.pop_front()
    }
}

struct FakeClock {
    now: Cell<Duration>,
    interrupt: Cell<bool>,
}

impl FakeClock {
    fn new() -> Self {
        Self {
            now: Cell::new(Duration::ZERO),
            interrupt: Cell::new(false),
        }
    }
}

impl MonitorClock for FakeClock {
    fn now(&self) -> Duration {
        self.now.get()
    }

    fn sleep(&self, duration: Duration) -> bool {
        if self.interrupt.get() {
            return false;
        }
        self.now.set(self.now.get() + duration);
        true
    }

    fn unix_epoch_seconds(&self) -> i64 {
        1_710_000_000
    }
}

fn timed_out() -> AdbOutput {
    AdbOutput {
        status: -1,
        stdout: String::new(),
        stderr: String::new(),
        timed_out: true,
    }
}

fn proc_stat(pid: i32, state: &str, utime: u64, stime: u64, starttime: u64) -> String {
    format!(
        "{pid} (app) {state} 1 1 1 0 0 0 0 0 0 0 {utime} {stime} 0 0 20 0 1 0 {starttime} 100 10 0 0 0 0 0 0 0 0 0 0 0 0 0\n"
    )
}

fn system_stat(total: u64) -> String {
    format!("cpu {total} 0 0 0\ncpu0 100\n")
}

fn monitor_request(timeout: Duration) -> MonitorRequest {
    MonitorRequest {
        package: "com.example.app".to_string(),
        serial: Some("emulator-5554".to_string()),
        timeout: Some(timeout),
        dump_threads: false,
        poll_interval: MONITOR_POLL_INTERVAL,
    }
}

fn push_sample(adb: FakeAdb, pid: &str, stat: &str, total_jiffies: u64) -> FakeAdb {
    adb.output(pid)
        .output(stat)
        .output(system_stat(total_jiffies))
}

fn monitor_prefix_stream(lines: &[&str]) -> FakeAdb {
    FakeAdb::new()
        .output("ApplicationExitInfo #0:\n timestamp=1000\n")
        .output("1710000000 +0000\n")
        .stream(lines)
}

fn monitor_prefix() -> FakeAdb {
    monitor_prefix_stream(&[])
}

fn message_text(outcome: &MonitorOutcome, stream: MonitorStream) -> Vec<&str> {
    outcome
        .messages
        .iter()
        .filter(|message| message.stream == stream)
        .map(|message| message.text.as_str())
        .collect()
}

// ---------------------------------------------------------------------------
// Device selection
// ---------------------------------------------------------------------------

#[test]
fn adb_devices_l_parses_serial_state_and_ignores_metadata() {
    let output = "
* daemon not running; starting now at tcp:5037
* daemon started successfully
List of devices attached
emulator-5554\tdevice product:sdk_gphone64 model:Pixel_6 device:emu64xa transport_id:1
emulator-5556\toffline
192.168.1.100:5555\tunauthorized
";
    assert_eq!(
        parse_adb_devices(output),
        vec![
            AdbDevice {
                serial: "emulator-5554".to_string(),
                state: "device".to_string(),
            },
            AdbDevice {
                serial: "emulator-5556".to_string(),
                state: "offline".to_string(),
            },
            AdbDevice {
                serial: "192.168.1.100:5555".to_string(),
                state: "unauthorized".to_string(),
            },
        ]
    );
}

#[test]
fn device_selection_covers_online_offline_multiple_and_explicit_serials() {
    let online = AdbDevice {
        serial: "emulator-5554".to_string(),
        state: "device".to_string(),
    };
    let offline = AdbDevice {
        serial: "emulator-5556".to_string(),
        state: "offline".to_string(),
    };
    let unauthorized = AdbDevice {
        serial: "192.168.1.100:5555".to_string(),
        state: "unauthorized".to_string(),
    };

    assert_eq!(
        select_device(&[online.clone(), offline.clone()], None).expect("single online"),
        "emulator-5554"
    );
    assert_eq!(
        select_device(&[online.clone(), offline], Some("emulator-5554")).expect("explicit"),
        "emulator-5554"
    );

    let multiple = select_device(&[online.clone(), online.clone()], None).expect_err("multiple");
    assert_eq!(multiple.exit_code(), ExitCode::UsageOrToolError);
    assert!(multiple
        .message()
        .contains("Multiple online ADB devices found"));

    let none =
        select_device(std::slice::from_ref(&unauthorized), None).expect_err("unauthorized only");
    assert!(none.message().contains("No online ADB devices found"));

    let offline_explicit = select_device(std::slice::from_ref(&online), Some("emulator-5556"))
        .expect_err("offline explicit");
    assert!(offline_explicit.message().contains("not found"));

    let unauthorized_explicit =
        select_device(&[unauthorized], Some("192.168.1.100:5555")).expect_err("unauthorized");
    assert!(unauthorized_explicit
        .message()
        .contains("is in state 'unauthorized', must be 'device'"));
}

#[test]
fn resolve_device_lists_adb_devices_then_applies_selection_rules() {
    let adb = FakeAdb::new()
        .output("List of devices attached\nemulator-5554\tdevice product:sdk model:Pixel\n");
    assert_eq!(
        resolve_device(&adb, None).expect("select only device"),
        "emulator-5554"
    );
    assert_eq!(adb.seen(), vec![vec!["devices".to_string()]]);

    let adb = FakeAdb::new().output("List of devices attached\nemulator-5554\toffline\n");
    let error = resolve_device(&adb, None).expect_err("offline");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);

    let adb = FakeAdb::new().raw(timed_out());
    let error = resolve_device(&adb, None).expect_err("timeout");
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
}

#[test]
fn getprop_output_exposes_sdk_level_and_ignores_noise() {
    let properties = parse_getprop(
        "[ro.build.version.sdk]: [34]\n[ro.product.model]: [Pixel 6]\nnot a property\n",
    );
    assert_eq!(properties.get("ro.product.model").unwrap(), "Pixel 6");
    assert_eq!(device_sdk_level(&properties), Some(34));
    assert_eq!(device_sdk_level(&parse_getprop("")), None);
}

// ---------------------------------------------------------------------------
// Process, exit-info and logcat parsers
// ---------------------------------------------------------------------------

#[test]
fn proc_stat_parser_handles_spaces_parentheses_and_fields() {
    let stat = "1234 (My (Special) App) R 100 200 300 0 -1 4194304 10 20 0 0 \
150 250 5 10 20 0 4 0 50000 1000000 200";
    let info = parse_proc_stat(stat).expect("proc stat");
    assert_eq!(info.pid, 1234);
    assert_eq!(info.comm, "My (Special) App");
    assert_eq!(info.state, "R");
    assert_eq!(info.utime, 150);
    assert_eq!(info.stime, 250);
    assert_eq!(info.starttime, 50000);
    assert!(parse_proc_stat("garbage").is_err());
}

#[test]
fn proc_system_stat_sums_aggregate_cpu_and_counts_online_cpus() {
    let info = parse_proc_system_stat(
        "cpu  1000 200 300 5000 100 50 20 0 0 0\ncpu0 500\ncpu1 500\nintr 12345\n",
    );
    assert_eq!(info.total_jiffies, 1000 + 200 + 300 + 5000 + 100 + 50 + 20);
    assert_eq!(info.cpu_count, 2);
    assert_eq!(parse_proc_system_stat("no cpus").cpu_count, 1);
    assert_eq!(parse_pidof_output("1234 abc 5678\n"), vec![1234, 5678]);
}

#[test]
fn exit_info_parses_numeric_and_formatted_timestamps_with_offset() {
    let dumpsys = "\
ApplicationExitInfo #0:
  timestamp=1710000005000
  pid=4321
  package=com.example.app
  process=com.example.app
  reason=6 (ANR)
  subreason=34 (BIND APPLICATION ANR)
  status=0
  description=Process failed to complete startup
ApplicationExitInfo #1:
  timestamp=2024-03-09 14:20:05.159
  pid=4320
  package=com.example.app
  process=com.example.app
  reason=5 (CRASH_NATIVE)
  subreason=0
  status=139
  description=SIGSEGV
ApplicationExitInfo #2:
  timestamp=2024-03-09 14:15:00.000
  pid=4310
  package=com.example.app
  process=com.example.app
  reason=4 (CRASH)
  status=1
  description=java.lang.NullPointerException
";
    let records = parse_exit_info_records(dumpsys, 2 * 3600);
    assert_eq!(records.len(), 3);
    assert_eq!(records[0].timestamp, 1_710_000_005_000);
    assert_eq!(records[0].reason_code, 6);
    assert_eq!(records[0].reason_name, "ANR");
    assert_eq!(records[0].subreason_code, Some(34));
    assert_eq!(
        records[0].subreason_name.as_deref(),
        Some("BIND APPLICATION ANR")
    );
    assert_eq!(records[1].timestamp, 1_709_986_805_159);
    assert_eq!(records[1].reason_name, "CRASH_NATIVE");
    assert_eq!(records[2].timestamp, 1_709_986_500_000);
    assert_eq!(records[2].pid, 4310);
    assert_eq!(
        records[0].description.as_deref(),
        Some("Process failed to complete startup")
    );

    let utc = parse_exit_info_records(
        "ApplicationExitInfo #0:\n timestamp=2024-03-09 14:20:05.159\n",
        0,
    );
    assert_eq!(utc[0].timestamp, 1_709_994_005_159);
}

#[test]
fn logcat_crash_blocks_extract_exception_pid_timestamp_and_frames() {
    let logcat = "\
10-15 12:00:00.000  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main
10-15 12:00:00.000  1234  1234 E AndroidRuntime: Process: com.example.app, PID: 1234
10-15 12:00:00.000  1234  1234 E AndroidRuntime: java.lang.VerifyError: Rejecting class com.example.Bad
10-15 12:00:00.000  1234  1234 E AndroidRuntime:     at com.example.app.MainActivity.onCreate(MainActivity.java:20)
10-15 12:00:00.000  1234  1234 E AndroidRuntime:     at com.example.app.Helper.run(Helper.kt:8)
";
    let reports = parse_crash_logcat(logcat, "com.example.app");
    assert_eq!(reports.len(), 1);
    assert_eq!(reports[0].pid, Some(1234));
    assert_eq!(
        reports[0].exception_type, "java.lang.VerifyError",
        "exception regex must capture the full nested class name"
    );
    assert_eq!(reports[0].message, "Rejecting class com.example.Bad");
    assert_eq!(
        reports[0].stack_trace,
        vec![
            "at com.example.app.MainActivity.onCreate(MainActivity.java:20)",
            "at com.example.app.Helper.run(Helper.kt:8)",
        ]
    );
    assert_eq!(reports[0].timestamp.as_deref(), Some("10-15 12:00:00.000"));

    let unrelated = parse_crash_logcat(logcat, "com.example.other");
    assert!(unrelated.is_empty());
    assert!(parse_crash_logcat("10-15 12:00 I nope\n", "com.example.app").is_empty());
}

#[test]
fn identical_consecutive_crash_blocks_are_deduplicated() {
    let logcat = "\
10-15 12:00:00.000  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main
10-15 12:00:00.000  1234  1234 E AndroidRuntime: Process: com.example.app, PID: 1234
10-15 12:00:00.000  1234  1234 E AndroidRuntime: java.lang.IllegalStateException: Broken
10-15 12:00:00.000  1234  1234 E AndroidRuntime:     at com.example.app.W.create(W.java:9)
10-15 12:00:01.000  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main
10-15 12:00:01.000  1234  1234 E AndroidRuntime: Process: com.example.app, PID: 1234
10-15 12:00:01.000  1234  1234 E AndroidRuntime: java.lang.IllegalStateException: Broken
10-15 12:00:01.000  1234  1234 E AndroidRuntime:     at com.example.app.W.create(W.java:9)
";
    let reports = parse_crash_logcat(logcat, "com.example.app");
    assert_eq!(reports.len(), 1);
    assert_eq!(reports[0].exception_type, "java.lang.IllegalStateException");
    assert_eq!(reports[0].message, "Broken");
}

#[test]
fn logcat_pid_formats_are_recognized_directly() {
    assert_eq!(
        extract_logcat_pid("1710000005.123  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main"),
        Some(1234)
    );
    assert_eq!(
        extract_logcat_pid("03-09 14:20:05.123  5678  5678 E AndroidRuntime: FATAL"),
        Some(5678)
    );
    assert_eq!(extract_logcat_pid("E( 9999) Tag: msg"), Some(9999));
    assert_eq!(
        extract_logcat_pid("just some random text without pid"),
        None
    );
}

#[test]
fn logcat_process_line_supplies_pid_when_available() {
    // Exercises the same extraction rules indirectly through a crash report:
    // the threadtime line above must supply the PID when the Process line does
    // not, and the brief/epoch helpers are covered by the module contract.
    let logcat = "\
10-15 12:01:00.000  4567  4567 E AndroidRuntime: FATAL EXCEPTION: main
10-15 12:01:00.000  9999  9999 E AndroidRuntime: Process: com.example.app
10-15 12:01:00.000  4567  4567 E AndroidRuntime: java.lang.RuntimeException: Boom
";
    let reports = parse_crash_logcat(logcat, "com.example.app");
    assert_eq!(reports.len(), 1);
    assert_eq!(reports[0].pid, Some(9999));
    assert_eq!(reports[0].exception_type, "java.lang.RuntimeException");
}

// ---------------------------------------------------------------------------
// Smali resolution
// ---------------------------------------------------------------------------

#[test]
fn smali_frame_resolution_targets_line_method_and_multidex() {
    let root = tempfile::tempdir().expect("tempdir");
    let smali = root.path().join("smali");
    fs::create_dir_all(smali.join("com/example/foo")).expect("dirs");
    fs::write(
        smali.join("com/example/foo/Bar.smali"),
        "\
.class public Lcom/example/foo/Bar;
.super Ljava/lang/Object;

.method public doWork(Ljava/lang/String;)I
    .registers 3
    .line 42
    const/4 v0, 0x1
    return v0
.end method
",
    )
    .expect("write smali");

    let frame = "    at com.example.foo.Bar.doWork(Bar.java:42)";
    let resolved = resolve_frame_in_smali(frame, root.path());
    assert_eq!(resolved.class_name, "com.example.foo.Bar");
    assert_eq!(resolved.method_name, "doWork");
    assert_eq!(
        resolved.smali_path.as_ref().unwrap(),
        &smali.join("com/example/foo/Bar.smali")
    );
    assert_eq!(
        resolved.method_signature.as_deref(),
        Some(".method public doWork(Ljava/lang/String;)I")
    );
    assert_eq!(
        resolved.code_snippet.as_ref().unwrap(),
        &vec![
            ".registers 3".to_string(),
            ".line 42".to_string(),
            "const/4 v0, 0x1".to_string(),
            "return v0".to_string(),
        ]
    );

    let missing = resolve_frame_in_smali(
        "    at com.example.foo.Missing.run(Missing.java:1)",
        root.path(),
    );
    assert!(missing.smali_path.is_none());
    assert!(missing.code_snippet.is_none());

    let multi = root.path().join("smali_classes2/com/example/foo");
    fs::create_dir_all(&multi).expect("multidex dir");
    let multi_file = multi.join("Baz.smali");
    fs::write(
        &multi_file,
        "\
.class public Lcom/example/foo/Baz;
.super Ljava/lang/Object;

.method public static m()V
    .registers 1
    return-void
.end method
",
    )
    .expect("write multidex");
    let resolved =
        resolve_frame_in_smali("    at com.example.foo.Baz.m(SourceFile:1239)", root.path());
    assert_eq!(resolved.smali_path.as_ref().unwrap(), &multi_file);
    assert_eq!(
        resolved.method_signature.as_deref(),
        Some(".method public static m()V")
    );
}

#[test]
fn crash_report_resolution_preserves_frames_and_unresolved_entries() {
    let root = tempfile::tempdir().expect("tempdir");
    let dir = root.path().join("smali");
    fs::create_dir_all(dir.join("com/example")).expect("dir");
    fs::write(
        dir.join("com/example/Foo.smali"),
        "\
.class public Lcom/example/Foo;
.super Ljava/lang/Object;

.method public run()V
    .registers 1
    return-void
.end method
",
    )
    .expect("smali");

    let crash = CrashReport {
        process: "com.example".to_string(),
        pid: Some(42),
        exception_type: "java.lang.RuntimeException".to_string(),
        message: "boom".to_string(),
        stack_trace: vec![
            "    at com.example.Foo.run(Foo.java:3)".to_string(),
            "    at com.example.Missing.go(Missing.java:9)".to_string(),
        ],
        timestamp: None,
        resolved_frames: None,
    };
    let frames = resolve_crash_frames(&crash, root.path());
    assert_eq!(frames.len(), 2);
    assert!(frames[0].smali_path.is_some());
    assert!(frames[1].smali_path.is_none());

    let resolved = resolve_crash_report(crash, root.path());
    assert!(resolved.resolved_frames.is_some());
    assert_eq!(resolved.resolved_frames.as_ref().unwrap().len(), 2);
    assert_eq!(resolved.pid, Some(42));
}

// ---------------------------------------------------------------------------
// Monitoring
// ---------------------------------------------------------------------------

#[test]
fn monitor_reports_high_cpu_spin_after_six_consecutive_samples() {
    let mut adb = monitor_prefix();
    // Sample 1 establishes the previous counters; samples 2..=7 are the six
    // consecutive R/100% intervals required for a spin verdict.
    for sample in 0..8u64 {
        adb = push_sample(
            adb,
            "1234\n",
            &proc_stat(1234, "R", 100 + sample * 100, 0, 100),
            1000 + sample * 100,
        );
    }
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(10)));

    assert_eq!(outcome.exit_code, ExitCode::RuntimeFailure);
    let stderr = message_text(&outcome, MonitorStream::Stderr);
    assert!(stderr
        .iter()
        .any(|line| line.contains("High CPU Spin Warning")));
    assert!(stderr
        .iter()
        .any(|line| line.contains("sustained >=90% CPU") && line.contains("3.0s")));
}

#[test]
fn monitor_below_cpu_threshold_never_reports_spin() {
    let mut adb = monitor_prefix();
    for sample in 0..8u64 {
        // 30 jiffies out of 50 on one CPU is 60%.
        adb = push_sample(
            adb,
            "1234\n",
            &proc_stat(1234, "R", 30 * sample, 0, 100),
            50 * sample,
        );
    }
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(3)));

    assert_eq!(outcome.exit_code, ExitCode::Success);
    assert!(message_text(&outcome, MonitorStream::Stderr).is_empty());
    assert!(message_text(&outcome, MonitorStream::Stdout)
        .iter()
        .any(|line| line.contains("Monitoring completed: process healthy after 3.0s.")));
}

#[test]
fn monitor_spin_counter_resets_when_cpu_drops() {
    let mut adb = monitor_prefix();
    let mut utime = 0u64;
    let mut total = 0u64;
    // Five hot intervals, one cool interval, then five hot intervals: no spin.
    for sample in 0..11u64 {
        let hot = sample != 5;
        utime += if hot { 100 } else { 0 };
        total += 100;
        adb = push_sample(
            adb,
            "1234\n",
            &proc_stat(1234, if hot { "R" } else { "S" }, utime, 0, 100),
            total,
        );
    }
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(5)));

    assert_eq!(outcome.exit_code, ExitCode::Success);
    assert!(!message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("High CPU Spin")));
}

#[test]
fn monitor_start_time_change_treats_pid_as_reused() {
    let mut adb = monitor_prefix();
    for sample in 0..8u64 {
        let starttime = if sample == 0 { 100 } else { 200 };
        let utime = if sample == 0 {
            0
        } else {
            1_000_000 + sample * 10
        };
        adb = push_sample(
            adb,
            "1234\n",
            &proc_stat(1234, "R", utime, 0, starttime),
            100 * sample,
        );
    }
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(3)));

    assert_eq!(outcome.exit_code, ExitCode::Success);
    assert!(!message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("High CPU Spin")));
}

#[test]
fn monitor_reattaches_when_pid_changes() {
    let mut adb = monitor_prefix();
    for sample in 0..5u64 {
        let pid = if sample < 2 { "1234\n" } else { "2222\n" };
        let value = if sample < 2 { 1234 } else { 2222 };
        adb = push_sample(
            adb,
            pid,
            &proc_stat(value, "S", sample * 10, 0, 100),
            50 * sample,
        );
    }
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(2)));

    assert_eq!(outcome.exit_code, ExitCode::Success);
    let attached: Vec<&str> = message_text(&outcome, MonitorStream::Stdout)
        .into_iter()
        .filter(|line| line.starts_with("Attached to process PID"))
        .collect();
    assert_eq!(
        attached,
        vec![
            "Attached to process PID 1234",
            "Attached to process PID 2222"
        ]
    );
}

#[test]
fn monitor_startup_timeout_fails_with_runtime_exit() {
    let adb = monitor_prefix().output("\n").output("\n").output("\n");
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_millis(1)));

    assert_eq!(outcome.exit_code, ExitCode::RuntimeFailure);
    assert!(message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("Startup timeout")));
}

#[test]
fn monitor_process_termination_uses_exit_info_reasons() {
    let cases = [
        (4, "CRASH", ExitCode::RuntimeFailure),
        (5, "CRASH_NATIVE", ExitCode::RuntimeFailure),
        (6, "ANR", ExitCode::RuntimeFailure),
        (1, "EXIT_SELF", ExitCode::Success),
    ];
    for (reason, name, expected) in cases {
        let exit_info = format!(
            "ApplicationExitInfo #0:\n  timestamp=2000\n  pid=1234\n  package=com.example.app\n  process=com.example.app\n  reason={reason} ({name})\n  status=1\n  description=detail\n"
        );
        let adb = monitor_prefix()
            .output("1234\n")
            .output(proc_stat(1234, "S", 10, 20, 100))
            .output(system_stat(100))
            .output("\n")
            .output(exit_info);
        let clock = FakeClock::new();
        let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(5)));

        assert_eq!(outcome.exit_code, expected, "reason {reason}");
        let all: Vec<&str> = outcome
            .messages
            .iter()
            .map(|message| message.text.as_str())
            .collect();
        assert!(all
            .iter()
            .any(|line| line.contains(&format!("reason={reason} ({name})"))));
        assert!(all
            .iter()
            .any(|line| line.contains("Process 1234 terminated.")));
    }
}

#[test]
fn monitor_process_termination_without_exit_info_is_runtime_failure() {
    let adb = monitor_prefix()
        .output("1234\n")
        .output(proc_stat(1234, "S", 10, 20, 100))
        .output(system_stat(100))
        .output("\n")
        .output("ApplicationExitInfo #0:\n timestamp=1000\n");
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(5)));

    assert_eq!(outcome.exit_code, ExitCode::RuntimeFailure);
    assert!(message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("without ApplicationExitInfo record")));
}

#[test]
fn monitor_live_anr_requires_an_exact_package_token() {
    let clock = FakeClock::new();
    let prefix_line = "1710000000.000 9999 9999 E ActivityManager: ANR in com.example.apple\n";
    let adb = monitor_prefix()
        .stream(&[prefix_line])
        .output("1234\n")
        .output(proc_stat(1234, "S", 10, 20, 100))
        .output(system_stat(100))
        .output("1234\n")
        .output(proc_stat(1234, "S", 13, 20, 100))
        .output(system_stat(150));
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_millis(1)));
    assert_eq!(outcome.exit_code, ExitCode::Success);
    assert!(!message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("Live ANR")));

    let clock = FakeClock::new();
    let exact_line = "1710000000.000 9999 9999 E ActivityManager: ANR in com.example.app\n";
    let adb = monitor_prefix_stream(&[exact_line]);
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(5)));
    assert_eq!(outcome.exit_code, ExitCode::RuntimeFailure);
    assert!(message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("Live ANR detected")));
}

#[test]
fn monitor_live_crash_for_active_pid_exits_runtime_failure() {
    let adb = monitor_prefix_stream(&[
        "1710000000.000 1234 1234 E AndroidRuntime: FATAL EXCEPTION: main\n",
    ])
    .output("1234\n")
    .output(proc_stat(1234, "S", 10, 20, 100))
    .output(system_stat(100))
    .output("1234\n")
    .output(proc_stat(1234, "S", 11, 20, 100))
    .output(system_stat(110));
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(5)));
    assert_eq!(outcome.exit_code, ExitCode::RuntimeFailure);
    assert!(message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("Live Crash detected")));
}

#[test]
fn monitor_optional_thread_dump_is_reported_on_spin() {
    let mut adb = monitor_prefix();
    for sample in 0..7u64 {
        adb = push_sample(
            adb,
            "1234\n",
            &proc_stat(1234, "R", 100 + sample * 100, 0, 100),
            1000 + sample * 100,
        );
    }
    adb = adb
        .output("\n")
        .output("tid=1 prio=5\n  at com.example.app.Main.main(Main.java:1)\nignored\n");
    let clock = FakeClock::new();
    let mut request = monitor_request(Duration::from_secs(10));
    request.dump_threads = true;
    let outcome = monitor_application(&adb, &clock, &request);

    assert_eq!(outcome.exit_code, ExitCode::RuntimeFailure);
    let stderr = message_text(&outcome, MonitorStream::Stderr);
    assert!(stderr
        .iter()
        .any(|line| line.contains("High CPU Spin Warning")));
    assert!(stderr.iter().any(|line| line.contains("Thread dump:")));
    assert!(stderr
        .iter()
        .any(|line| line.contains("at com.example.app.Main.main")));
}

#[test]
fn monitor_interrupt_returns_success_before_startup() {
    let adb = monitor_prefix().output("\n");
    let clock = FakeClock::new();
    clock.interrupt.set(true);
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(5)));

    assert_eq!(outcome.exit_code, ExitCode::Success);
    assert!(message_text(&outcome, MonitorStream::Stdout)
        .iter()
        .any(|line| line.contains("Interrupted.")));
}

#[test]
fn monitor_polling_timeout_is_infrastructure_failure() {
    let adb = monitor_prefix().raw(timed_out());
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(5)));

    assert_eq!(outcome.exit_code, ExitCode::InfrastructureFailure);
    assert!(message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("ADB polling operation timed out")));
}

#[test]
fn monitor_adb_timeout_is_infrastructure_failure() {
    let adb = FakeAdb::new().raw(timed_out());
    let clock = FakeClock::new();
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(1)));
    assert_eq!(outcome.exit_code, ExitCode::InfrastructureFailure);
    assert!(message_text(&outcome, MonitorStream::Stderr)
        .iter()
        .any(|line| line.contains("ADB operation timed out")));

    let adb = monitor_prefix().failure(Error::infrastructure("adb crashed"));
    let outcome = monitor_application(&adb, &clock, &monitor_request(Duration::from_secs(1)));
    assert_eq!(outcome.exit_code, ExitCode::InfrastructureFailure);
}

// ---------------------------------------------------------------------------
// Crash harvesting
// ---------------------------------------------------------------------------

#[test]
fn crash_harvest_runs_the_expected_logcat_command() {
    let logcat = "\
10-15 12:00:00.000  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main
10-15 12:00:00.000  1234  1234 E AndroidRuntime: Process: com.example.app, PID: 1234
10-15 12:00:00.000  1234  1234 E AndroidRuntime: java.lang.VerifyError: Rejecting class com.example.Bad
10-15 12:00:00.000  1234  1234 E AndroidRuntime:     at com.example.app.MainActivity.onCreate(MainActivity.java:20)
";
    let adb = FakeAdb::new().output(logcat);
    let reports = harvest_recent_crashes(&adb, "com.example.app", Some("emulator-5554"), 5000)
        .expect("harvest");
    assert_eq!(reports.len(), 1);
    assert_eq!(reports[0].exception_type, "java.lang.VerifyError");
    assert_eq!(reports[0].message, "Rejecting class com.example.Bad");
    assert_eq!(
        adb.seen(),
        vec![vec![
            "-s emulator-5554".to_string(),
            "logcat".to_string(),
            "-d".to_string(),
            "-b".to_string(),
            "main".to_string(),
            "-b".to_string(),
            "crash".to_string(),
            "-b".to_string(),
            "system".to_string(),
            "-t".to_string(),
            "5000".to_string(),
        ]]
    );

    let empty = FakeAdb::new().output("");
    assert!(harvest_recent_crashes(&empty, "com.example.app", None, 10)
        .expect("empty")
        .is_empty());
}

#[test]
fn crash_report_json_uses_python_asdict_names() {
    let report = CrashReport {
        process: "com.example.app".to_string(),
        pid: None,
        exception_type: "java.lang.Error".to_string(),
        message: String::new(),
        stack_trace: Vec::new(),
        timestamp: None,
        resolved_frames: None,
    };
    let value = serde_json::to_value(&report).expect("serialize crash");
    assert_eq!(value["process"], "com.example.app");
    assert_eq!(value["pid"], serde_json::Value::Null);
    assert_eq!(value["exception_type"], "java.lang.Error");
    assert_eq!(value["resolved_frames"], serde_json::Value::Null);
    assert_eq!(value["stack_trace"], serde_json::json!([]));
}

// ---------------------------------------------------------------------------
// UI hierarchy and clicks
// ---------------------------------------------------------------------------

const UI_XML: &str = "<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<hierarchy rotation=\"0\">
  <node index=\"0\" text=\"Must &amp; Watch\" resource-id=\"\" class=\"android.widget.TextView\" package=\"com.nhl\" content-desc=\"\" clickable=\"false\" enabled=\"true\" bounds=\"[32,297][861,361]\" />
  <node index=\"1\" text=\"\" resource-id=\"\" class=\"android.view.View\" package=\"com.nhl\" content-desc=\"media\" clickable=\"true\" enabled=\"true\" bounds=\"[281,2259][360,2290]\" />
  <node index=\"2\" text=\"Save\" resource-id=\"com.nhl:id/save\" class=\"android.widget.Button\" package=\"com.nhl\" content-desc=\"\" clickable=\"true\" enabled=\"true\" bounds=\"[100,200][200,300]\" />
  <node index=\"3\" text=\"Save again\" resource-id=\"\" class=\"android.widget.Button\" package=\"com.nhl\" content-desc=\"\" clickable=\"false\" enabled=\"true\" />
</hierarchy>
UI hierachy dumped to: /dev/tty
";

#[test]
fn ui_dump_filters_text_description_and_clickable_nodes() {
    let adb = FakeAdb::new().output(UI_XML);
    let nodes = dump_ui_hierarchy(&adb, Some("emulator-5554")).expect("dump");
    assert_eq!(nodes.len(), 4);
    assert_eq!(nodes[0].text, "Must & Watch", "XML entities are decoded");
    assert!(!nodes[0].clickable);
    assert_eq!(nodes[0].center(), (446, 329));
    assert_eq!(
        nodes[3].bounds,
        (0, 0, 0, 0),
        "missing bounds default to zero"
    );
    assert_eq!(nodes[3].center(), (0, 0));

    let media = find_ui_nodes(
        &nodes,
        UiFilter {
            desc: Some("media"),
            ..UiFilter::default()
        },
    );
    assert_eq!(media.len(), 1);
    assert_eq!(media[0].content_desc, "media");
    assert!(media[0].clickable);
    assert_eq!(media[0].center(), (320, 2274));

    let save = find_ui_nodes(
        &nodes,
        UiFilter {
            text: Some("save"),
            ..UiFilter::default()
        },
    );
    assert_eq!(
        save.len(),
        2,
        "substring match is case-insensitive and ordered"
    );

    let clickable = find_ui_nodes(
        &nodes,
        UiFilter {
            clickable_only: true,
            ..UiFilter::default()
        },
    );
    assert_eq!(clickable.len(), 2);
    assert_eq!(clickable[0].content_desc, "media");
    assert_eq!(clickable[1].text, "Save");

    let resource = find_ui_nodes(
        &nodes,
        UiFilter {
            resource_id: Some("id/save"),
            ..UiFilter::default()
        },
    );
    assert_eq!(resource.len(), 1);
    assert_eq!(resource[0].text, "Save");

    let json = serde_json::to_value(&nodes[1]).expect("serialize ui node");
    assert_eq!(json["contentDesc"], "media");
    assert_eq!(json["resourceId"], "");
    assert_eq!(json["className"], "android.view.View");
    assert_eq!(json["clickable"], true);
    assert_eq!(json["bounds"], serde_json::json!([281, 2259, 360, 2290]));
    assert_eq!(json["center"], serde_json::json!([320, 2274]));
}

#[test]
fn ui_click_uses_first_match_in_document_order() {
    let adb = FakeAdb::new().output(UI_XML).output("");
    let nodes = dump_ui_hierarchy(&adb, Some("emulator-5554")).expect("dump");
    let matches = find_ui_nodes(
        &nodes,
        UiFilter {
            text: Some("save"),
            ..UiFilter::default()
        },
    );
    assert_eq!(matches.len(), 2);
    click_ui_node(&adb, Some("emulator-5554"), &matches[0]).expect("click");
    let seen = adb.seen();
    assert_eq!(
        seen.last().unwrap(),
        &vec![
            "-s emulator-5554".to_string(),
            "shell".to_string(),
            "input".to_string(),
            "tap".to_string(),
            "150".to_string(),
            "250".to_string(),
        ],
        "multi-match clicks pick the first node and use its center"
    );
}

#[test]
fn ui_empty_hierarchy_is_an_empty_node_list() {
    let nodes = parse_ui_hierarchy("<hierarchy rotation=\"0\"></hierarchy>").expect("empty");
    assert!(nodes.is_empty());
    let nodes = parse_ui_hierarchy(
        "garbage\n<hierarchy><node text=\"x\" bounds=\"[0,0][2,4]\" /></hierarchy>",
    )
    .expect("starts at hierarchy marker");
    assert_eq!(nodes.len(), 1);
    assert_eq!(nodes[0].center(), (1, 2));
}

#[test]
fn ui_invalid_hierarchy_and_bounds_are_usage_errors() {
    let missing = parse_ui_hierarchy("no xml here").expect_err("missing hierarchy");
    assert_eq!(missing.exit_code(), ExitCode::UsageOrToolError);
    assert!(missing.message().contains("Failed to find UI hierarchy"));

    let bad_bounds =
        parse_ui_hierarchy("<hierarchy><node text=\"x\" bounds=\"not-bounds\" /></hierarchy>")
            .expect_err("bad bounds");
    assert_eq!(bad_bounds.exit_code(), ExitCode::UsageOrToolError);
    assert!(bad_bounds.message().contains("Invalid bounds string"));
    assert!(parse_bounds("[1,2][3,4]").is_ok());
    assert!(parse_bounds("[1,2]").is_err());

    let adb = FakeAdb::new().output("nothing");
    assert_eq!(
        dump_ui_hierarchy(&adb, None).unwrap_err().exit_code(),
        ExitCode::UsageOrToolError
    );
}

// ---------------------------------------------------------------------------
// Deployment-facing device helpers
// ---------------------------------------------------------------------------

#[test]
fn launcher_activity_is_normalized_and_unique() {
    let badging = "launchable-activity: name='.ui.SplashActivity' label='A'\n";
    assert_eq!(
        parse_launcher_activity(badging, "com.example.app").expect("launcher"),
        "com.example.app/com.example.app.ui.SplashActivity"
    );
    assert!(parse_launcher_activity("package: name='x'\n", "com.example.app").is_err());
    let multiple =
        "launchable-activity: name='A' label='a'\nlaunchable-activity: name='B' label='b'\n";
    assert!(parse_launcher_activity(multiple, "com.example.app").is_err());
}

#[test]
fn installed_signature_is_normalized_or_absent() {
    let digest = "AA:BB:CC:DD:EE:FF:00:11:22:33:44:55:66:77:88:99:AA:BB:CC:DD:EE:FF:00:11:22:33:44:55:66:77:88:99";
    let adb = FakeAdb::new().output(format!("signatures=PackageSignatures{{ {digest} }}"));
    assert_eq!(
        get_installed_package_signature(&adb, "com.example.app", Some("emu")),
        Some(digest.replace(':', "").to_lowercase())
    );

    let adb = FakeAdb::new().output("package: no signatures");
    assert_eq!(
        get_installed_package_signature(&adb, "com.example.app", None),
        None
    );
}

#[test]
fn ui_node_matching_does_not_treat_empty_filters_as_constraints() {
    let node = UiNode {
        text: "Hello".to_string(),
        content_desc: "world".to_string(),
        resource_id: "id/x".to_string(),
        class_name: "android.view.View".to_string(),
        clickable: true,
        bounds: (0, 0, 10, 10),
    };
    assert!(node.matches(Some(""), Some(""), Some("")));
    assert!(node.matches(Some("ell"), Some("orl"), Some("id/")));
    assert!(!node.matches(Some("missing"), None, None));
    assert!(!node.matches(None, Some("missing"), None));
    assert!(!node.matches(None, None, Some("missing")));
    assert_eq!(PathBuf::from("/tmp"), PathBuf::from("/tmp"));
}
