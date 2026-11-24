//! Android device selection, process monitoring, crash harvesting, Smali frame
//! resolution and UI inspection.
//!
//! All device interaction goes through [`AdbRunner`], so tests exercise the
//! parsers, selection rules and monitor state machine with scripted adb output
//! and a fake monotonic clock. No test sleeps, spawns adb or touches a device.
//! Real command output uses the bounded [`crate::process`] adapter; the
//! long-lived logcat stream is drained through a reader thread and reaped by
//! [`AdbProcessStream`]'s destructor.

use crate::error::Error;
use crate::models::ExitCode;
use crate::process::{self, ProcessSpec};
use regex::Regex;
use serde::ser::SerializeStruct;
use serde::{Serialize, Serializer};
use std::collections::{BTreeMap, VecDeque};
use std::env;
use std::fs;
use std::io::{BufRead, BufReader};
use std::os::unix::fs::PermissionsExt;
use std::path::{Path, PathBuf};
use std::process::{Child, Command, Stdio};
use std::sync::mpsc::{self, Receiver};
use std::thread::{self, JoinHandle};
use std::time::{Duration, Instant, SystemTime, UNIX_EPOCH};

/// Documented monitor sampling interval.
pub const MONITOR_POLL_INTERVAL: Duration = Duration::from_millis(500);
/// Consecutive spin samples required (6 * 500ms = 3.0s).
pub const MONITOR_SPIN_INTERVALS: u32 = 6;
/// Main-thread CPU percentage that counts as a spin.
pub const MONITOR_SPIN_CPU_PERCENT: f64 = 90.0;
/// `dumpsys activity exit-info` reasons that mean a crash or ANR.
pub const FAILURE_EXIT_REASONS: [i32; 3] = [4, 5, 6];

const ADB_TIMEOUT: Duration = Duration::from_secs(5);
const LOG_QUEUE_CAPACITY: usize = 256;
const THREAD_DUMP_LINES: usize = 100;

/// One `adb devices` row. Extra `adb devices -l` metadata is ignored.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct AdbDevice {
    pub serial: String,
    pub state: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AdbOutput {
    pub status: i32,
    pub stdout: String,
    pub stderr: String,
    pub timed_out: bool,
}

impl AdbOutput {
    #[must_use]
    pub fn success(&self) -> bool {
        !self.timed_out && self.status == 0
    }
}

/// Injectable adb command surface.
pub trait AdbRunner {
    fn run(
        &self,
        args: &[String],
        serial: Option<&str>,
        timeout: Option<Duration>,
    ) -> Result<AdbOutput, Error>;

    /// Start an adb command whose stdout is consumed line by line.
    fn stream(
        &self,
        _args: &[String],
        _serial: Option<&str>,
    ) -> Result<Box<dyn AdbLineStream>, Error> {
        Err(Error::infrastructure(
            "adb streaming is not supported by this runner",
        ))
    }
}

/// Non-blocking line source for the logcat stream.
pub trait AdbLineStream {
    fn try_next_line(&mut self) -> Option<String>;
}

#[derive(Debug, Clone)]
pub struct AdbClient {
    adb_path: PathBuf,
}

impl AdbClient {
    pub fn new() -> Result<Self, Error> {
        Ok(Self {
            adb_path: find_adb()?,
        })
    }

    #[must_use]
    pub fn with_adb_path(path: impl Into<PathBuf>) -> Self {
        Self {
            adb_path: path.into(),
        }
    }

    #[must_use]
    pub fn adb_path(&self) -> &Path {
        &self.adb_path
    }
}

impl AdbRunner for AdbClient {
    fn run(
        &self,
        args: &[String],
        serial: Option<&str>,
        timeout: Option<Duration>,
    ) -> Result<AdbOutput, Error> {
        let mut spec = ProcessSpec::new(&self.adb_path);
        if let Some(serial) = serial {
            spec = spec.arg("-s").arg(serial);
        }
        spec = spec.args(args.iter().cloned());
        if let Some(timeout) = timeout {
            spec = spec.timeout(timeout);
        }
        let output = process::run(&spec)?;
        Ok(AdbOutput {
            status: output.exit_code().unwrap_or(-1),
            stdout: output.stdout.text_lossy(),
            stderr: output.stderr.text_lossy(),
            timed_out: output.timed_out,
        })
    }

    fn stream(
        &self,
        args: &[String],
        serial: Option<&str>,
    ) -> Result<Box<dyn AdbLineStream>, Error> {
        let mut command = Command::new(&self.adb_path);
        if let Some(serial) = serial {
            command.arg("-s").arg(serial);
        }
        command.args(args);
        command
            .stdin(Stdio::null())
            .stdout(Stdio::piped())
            .stderr(Stdio::null());
        let mut child = command.spawn().map_err(|error| {
            Error::infrastructure(format!("cannot start adb logcat stream: {error}"))
        })?;
        let stdout = child.stdout.take().ok_or_else(|| {
            Error::infrastructure("cannot capture adb logcat stream output".to_string())
        })?;
        let (sender, receiver) = mpsc::channel();
        let reader = thread::spawn(move || {
            for line in BufReader::new(stdout).lines() {
                let Ok(line) = line else { break };
                if sender.send(line).is_err() {
                    break;
                }
            }
        });
        Ok(Box::new(AdbProcessStream {
            child,
            lines: receiver,
            reader: Some(reader),
        }))
    }
}

struct AdbProcessStream {
    child: Child,
    lines: Receiver<String>,
    reader: Option<JoinHandle<()>>,
}

impl AdbLineStream for AdbProcessStream {
    fn try_next_line(&mut self) -> Option<String> {
        self.lines.try_recv().ok()
    }
}

impl Drop for AdbProcessStream {
    fn drop(&mut self) {
        let _ = self.child.kill();
        let _ = self.child.wait();
        if let Some(reader) = self.reader.take() {
            let _ = reader.join();
        }
    }
}

/// Locates adb from the Android SDK roots or `PATH`.
pub fn find_adb() -> Result<PathBuf, Error> {
    for variable in ["ANDROID_HOME", "ANDROID_SDK_ROOT"] {
        let Ok(root) = env::var(variable) else {
            continue;
        };
        if root.is_empty() {
            continue;
        }
        let candidate = PathBuf::from(root).join("platform-tools").join("adb");
        if is_executable_file(&candidate) {
            return candidate.canonicalize().map_err(|error| {
                Error::io(
                    format!("cannot resolve adb at {}", candidate.display()),
                    error,
                )
            });
        }
    }

    if let Some(path) = env::var_os("PATH") {
        for directory in env::split_paths(&path) {
            let candidate = directory.join("adb");
            if is_executable_file(&candidate) {
                return candidate.canonicalize().map_err(|error| {
                    Error::io(
                        format!("cannot resolve adb at {}", candidate.display()),
                        error,
                    )
                });
            }
        }
    }

    Err(Error::infrastructure(
        "adb binary not found. Set ANDROID_HOME / ANDROID_SDK_ROOT or ensure adb is on PATH.",
    ))
}

fn is_executable_file(path: &Path) -> bool {
    path.is_file()
        && fs::metadata(path)
            .map(|metadata| metadata.permissions().mode() & 0o111 != 0)
            .unwrap_or(false)
}

fn owned(args: &[&str]) -> Vec<String> {
    args.iter()
        .map(|argument| (*argument).to_string())
        .collect()
}

/// Runs adb and returns stdout, matching the Python `run_adb` contract.
pub fn run_adb(
    runner: &dyn AdbRunner,
    device: Option<&str>,
    args: &[&str],
) -> Result<String, Error> {
    let output = runner.run(&owned(args), device, None)?;
    if output.timed_out {
        return Err(Error::infrastructure("ADB command timed out"));
    }
    if output.status != 0 {
        let detail = if output.stderr.trim().is_empty() {
            output.stdout.trim()
        } else {
            output.stderr.trim()
        };
        return Err(Error::infrastructure(format!(
            "ADB command failed: {detail}"
        )));
    }
    Ok(output.stdout)
}

pub fn parse_adb_devices(output: &str) -> Vec<AdbDevice> {
    output
        .lines()
        .filter_map(|line| {
            let line = line.trim();
            if line.is_empty() || line.starts_with('*') || line.starts_with("List of devices") {
                return None;
            }
            let mut parts = line.split_whitespace();
            let serial = parts.next()?;
            let state = parts.next()?;
            Some(AdbDevice {
                serial: serial.to_string(),
                state: state.to_string(),
            })
        })
        .collect()
}

#[must_use]
pub fn format_devices(devices: &[AdbDevice]) -> String {
    if devices.is_empty() {
        return "none".to_string();
    }
    devices
        .iter()
        .map(|device| format!("{} ({})", device.serial, device.state))
        .collect::<Vec<_>>()
        .join(", ")
}

/// Selects exactly one online device, honouring an explicit serial.
pub fn select_device(
    devices: &[AdbDevice],
    explicit_serial: Option<&str>,
) -> Result<String, Error> {
    if let Some(serial) = explicit_serial {
        let Some(device) = devices.iter().find(|device| device.serial == serial) else {
            return Err(Error::usage(format!(
                "Device '{serial}' not found. Connected devices: {}",
                format_devices(devices)
            )));
        };
        if device.state != "device" {
            return Err(Error::usage(format!(
                "Device '{serial}' is in state '{}', must be 'device'. Connected devices: {}",
                device.state,
                format_devices(devices)
            )));
        }
        return Ok(serial.to_string());
    }

    let online: Vec<&AdbDevice> = devices
        .iter()
        .filter(|device| device.state == "device")
        .collect();
    match online.as_slice() {
        [only] => Ok(only.serial.clone()),
        [] => Err(Error::usage(format!(
            "No online ADB devices found. Connected devices: {}",
            format_devices(devices)
        ))),
        many => {
            let serials = many
                .iter()
                .map(|device| format!("'{}'", device.serial))
                .collect::<Vec<_>>()
                .join(", ");
            Err(Error::usage(format!(
                "Multiple online ADB devices found ([{serials}]). Specify target with --device <serial>. Connected devices: {}",
                format_devices(devices)
            )))
        }
    }
}

/// Lists devices from adb and selects one, matching the Python CLI flow.
pub fn resolve_device(
    runner: &dyn AdbRunner,
    explicit_serial: Option<&str>,
) -> Result<String, Error> {
    let output = runner.run(&owned(&["devices"]), None, None)?;
    if output.timed_out {
        return Err(Error::infrastructure("ADB devices command timed out"));
    }
    select_device(&parse_adb_devices(&output.stdout), explicit_serial)
}

/// Parses `getprop` output (`[ro.build.version.sdk]: [34]`).
pub fn parse_getprop(output: &str) -> BTreeMap<String, String> {
    let mut properties = BTreeMap::new();
    for line in output.lines() {
        let line = line.trim();
        let Some(rest) = line.strip_prefix('[') else {
            continue;
        };
        let Some((key, value)) = rest.split_once("]: [") else {
            continue;
        };
        let Some(value) = value.strip_suffix(']') else {
            continue;
        };
        properties.insert(key.to_string(), value.to_string());
    }
    properties
}

#[must_use]
pub fn device_sdk_level(properties: &BTreeMap<String, String>) -> Option<u32> {
    properties
        .get("ro.build.version.sdk")
        .and_then(|value| value.trim().parse().ok())
}

pub fn query_device_properties(
    runner: &dyn AdbRunner,
    device: Option<&str>,
) -> Result<BTreeMap<String, String>, Error> {
    run_adb(runner, device, &["shell", "getprop"]).map(|output| parse_getprop(&output))
}

pub fn parse_pidof_output(output: &str) -> Vec<i32> {
    output
        .split_whitespace()
        .filter_map(|token| token.parse().ok())
        .collect()
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ProcStatInfo {
    pub pid: i32,
    pub comm: String,
    pub state: String,
    pub utime: u64,
    pub stime: u64,
    pub starttime: u64,
}

pub fn parse_proc_stat(stat_text: &str) -> Result<ProcStatInfo, Error> {
    let Some(rindex) = stat_text.rfind(')') else {
        return Err(Error::runtime(format!(
            "Malformed proc stat line (missing closing parenthesis): {stat_text}"
        )));
    };
    let left = &stat_text[..rindex];
    let Some(first_open) = left.find('(') else {
        return Err(Error::runtime(format!(
            "Malformed proc stat line (missing opening parenthesis): {stat_text}"
        )));
    };
    let pid = left[..first_open].trim().parse::<i32>().map_err(|_| {
        Error::runtime(format!(
            "Malformed proc stat line (invalid pid): {stat_text}"
        ))
    })?;
    let comm = left[first_open + 1..].to_string();

    let fields: Vec<&str> = stat_text[rindex + 1..].split_whitespace().collect();
    if fields.len() < 20 {
        return Err(Error::runtime(format!(
            "Malformed proc stat line (too few fields after comm): {stat_text}"
        )));
    }
    let parse_field = |index: usize| -> Result<u64, Error> {
        fields[index].parse::<u64>().map_err(|_| {
            Error::runtime(format!(
                "Malformed proc stat line (invalid numeric field): {stat_text}"
            ))
        })
    };
    Ok(ProcStatInfo {
        pid,
        comm,
        state: fields[0].to_string(),
        utime: parse_field(11)?,
        stime: parse_field(12)?,
        starttime: parse_field(19)?,
    })
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SystemStatInfo {
    pub total_jiffies: u64,
    pub cpu_count: u32,
}

#[must_use]
pub fn parse_proc_system_stat(stat_text: &str) -> SystemStatInfo {
    let cpu_line_pattern = Regex::new(r"^cpu\d+").expect("static cpu line regex");
    let mut total_jiffies = 0u64;
    let mut cpu_count = 0u32;
    for line in stat_text.lines() {
        let line = line.trim();
        if let Some(rest) = line.strip_prefix("cpu ") {
            for value in rest.split_whitespace() {
                if let Ok(value) = value.parse::<u64>() {
                    total_jiffies = total_jiffies.saturating_add(value);
                }
            }
        } else if cpu_line_pattern.is_match(line) {
            cpu_count += 1;
        }
    }
    SystemStatInfo {
        total_jiffies,
        cpu_count: cpu_count.max(1),
    }
}

/// One `dumpsys activity exit-info` record.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct ExitInfoRecord {
    pub index: u32,
    pub timestamp: i64,
    pub pid: u32,
    pub process: String,
    pub package: Option<String>,
    pub reason_code: i32,
    pub reason_name: String,
    pub subreason_code: Option<i32>,
    pub subreason_name: Option<String>,
    pub status: i32,
    pub description: Option<String>,
    pub raw_text: String,
}

/// Parses exit-info records. `tz_offset_seconds` applies to formatted
/// timestamps exactly as Python's fixed-offset `tzinfo` did.
#[must_use]
pub fn parse_exit_info_records(
    dumpsys_output: &str,
    tz_offset_seconds: i32,
) -> Vec<ExitInfoRecord> {
    let mut records = Vec::new();
    let mut block: Vec<&str> = Vec::new();
    let flush = |block: &[&str], records: &mut Vec<ExitInfoRecord>| {
        if let Some(record) = parse_exit_info_block(block, tz_offset_seconds) {
            records.push(record);
        }
    };
    for line in dumpsys_output.lines() {
        if line.trim_start().starts_with("ApplicationExitInfo #") {
            if !block.is_empty() {
                flush(&block, &mut records);
            }
            block.clear();
        }
        if !block.is_empty() || line.trim_start().starts_with("ApplicationExitInfo #") {
            block.push(line);
        }
    }
    if !block.is_empty() {
        flush(&block, &mut records);
    }
    records.sort_by_key(|record| std::cmp::Reverse(record.timestamp));
    records
}

fn parse_exit_info_block(block: &[&str], tz_offset_seconds: i32) -> Option<ExitInfoRecord> {
    let raw_text = block.join("\n").trim().to_string();
    if !raw_text.starts_with("ApplicationExitInfo") {
        return None;
    }
    let header = Regex::new(r"ApplicationExitInfo\s+#(\d+):").expect("static exit header regex");
    let index = header
        .captures(&raw_text)
        .and_then(|captures| captures.get(1))
        .and_then(|value| value.as_str().parse().ok())
        .unwrap_or(0);

    let timestamp_pattern =
        Regex::new(r"timestamp=(\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2}(?:\.\d+)?|\d+)")
            .expect("static exit timestamp regex");
    let timestamp = timestamp_pattern
        .captures(&raw_text)
        .and_then(|captures| captures.get(1))
        .map(|value| {
            let raw = value.as_str().trim();
            if raw.contains('-') {
                format_timestamp_millis(raw, tz_offset_seconds).unwrap_or(0)
            } else {
                raw.parse::<i64>().unwrap_or(0)
            }
        })
        .unwrap_or(0);

    let value = |pattern: &str| -> Option<String> {
        Regex::new(pattern)
            .expect("valid exit-info regex")
            .captures(&raw_text)
            .and_then(|captures| captures.get(1))
            .map(|value| value.as_str().to_string())
    };

    let pid = value(r"pid=(\d+)")
        .and_then(|raw| raw.parse().ok())
        .unwrap_or(0);
    let process = value(r"process=([^\s]+)").unwrap_or_default();
    let package = value(r"package=([^\s]+)");
    let reason_pattern = Regex::new(r"reason=(\d+)(?:\s*\(([^)]+)\))?").expect("reason regex");
    let reason_captures = reason_pattern.captures(&raw_text);
    let reason_code = reason_captures
        .as_ref()
        .and_then(|captures| captures.get(1))
        .and_then(|value| value.as_str().parse().ok())
        .unwrap_or(0);
    let reason_name = reason_captures
        .as_ref()
        .and_then(|captures| captures.get(2))
        .map_or_else(|| "UNKNOWN".to_string(), |value| value.as_str().to_string());
    let sub_pattern = Regex::new(r"subreason=(\d+)(?:\s*\(([^)]+)\))?").expect("subreason regex");
    let sub_captures = sub_pattern.captures(&raw_text);
    let subreason_code = sub_captures
        .as_ref()
        .and_then(|captures| captures.get(1))
        .and_then(|value| value.as_str().parse().ok());
    let subreason_name = sub_captures
        .as_ref()
        .and_then(|captures| captures.get(2))
        .map(|value| value.as_str().to_string());
    let status = value(r"status=(-?\d+)")
        .and_then(|raw| raw.parse().ok())
        .unwrap_or(0);
    let description = value(r"description=([^\n]+)").map(|value| value.trim().to_string());

    Some(ExitInfoRecord {
        index,
        timestamp,
        pid,
        process,
        package,
        reason_code,
        reason_name,
        subreason_code,
        subreason_name,
        status,
        description,
        raw_text,
    })
}

fn format_timestamp_millis(text: &str, tz_offset_seconds: i32) -> Option<i64> {
    let (date, rest) = text.split_once(|character: char| character.is_whitespace())?;
    let rest = rest.trim_start();
    let (time, fraction) = match rest.split_once('.') {
        Some((time, fraction)) => (time, Some(fraction)),
        None => (rest, None),
    };
    let mut date_parts = date.split('-');
    let year: i64 = date_parts.next()?.parse().ok()?;
    let month: i64 = date_parts.next()?.parse().ok()?;
    let day: i64 = date_parts.next()?.parse().ok()?;
    let mut time_parts = time.split(':');
    let hour: i64 = time_parts.next()?.parse().ok()?;
    let minute: i64 = time_parts.next()?.parse().ok()?;
    let second: i64 = time_parts.next()?.parse().ok()?;
    let micros = fraction
        .map(|fraction| {
            let digits: String = fraction.chars().take(6).collect();
            let padded = format!("{digits:0<6}");
            padded.parse::<i64>().unwrap_or(0)
        })
        .unwrap_or(0);

    let days = days_from_civil(year, month, day);
    let local_seconds = days * 86_400 + hour * 3_600 + minute * 60 + second;
    let utc_seconds = local_seconds - i64::from(tz_offset_seconds);
    Some(utc_seconds * 1_000 + micros / 1_000)
}

/// Days since 1970-01-01 for a proleptic Gregorian civil date.
fn days_from_civil(year: i64, month: i64, day: i64) -> i64 {
    let year = if month <= 2 { year - 1 } else { year };
    let era = if year >= 0 { year } else { year - 399 } / 400;
    let year_of_era = year - era * 400;
    let adjusted_month = month + if month > 2 { -3 } else { 9 };
    let day_of_year = (153 * adjusted_month + 2) / 5 + day - 1;
    let day_of_era = year_of_era * 365 + year_of_era / 4 - year_of_era / 100 + day_of_year;
    era * 146_097 + day_of_era - 719_468
}

/// Extracts the PID from epoch, threadtime or brief logcat formats.
#[must_use]
pub fn extract_logcat_pid(line: &str) -> Option<i32> {
    let parts: Vec<&str> = line.split_whitespace().collect();
    let first = parts.first()?;
    let epoch = Regex::new(r"^\d+\.\d+$").expect("static epoch regex");
    if epoch.is_match(first) && parts.len() >= 2 {
        return parts[1].parse().ok();
    }
    let date = Regex::new(r"^\d{2}-\d{2}$").expect("static date regex");
    let time = Regex::new(r"^\d{2}:\d{2}:\d{2}").expect("static time regex");
    if parts.len() >= 3 && date.is_match(parts[0]) && time.is_match(parts[1]) {
        return parts[2].parse().ok();
    }
    let brief = Regex::new(r"^[A-Z]\(\s*(\d+)\)").expect("static brief regex");
    brief
        .captures(line)
        .and_then(|captures| captures.get(1))
        .and_then(|value| value.as_str().parse().ok())
}

/// One resolved Java stack frame.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct ResolvedFrame {
    pub raw_frame: String,
    pub class_name: String,
    pub method_name: String,
    pub smali_path: Option<PathBuf>,
    pub method_signature: Option<String>,
    pub code_snippet: Option<Vec<String>>,
}

/// One Java crash report harvested from logcat.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct CrashReport {
    pub process: String,
    pub pid: Option<i32>,
    pub exception_type: String,
    pub message: String,
    pub stack_trace: Vec<String>,
    pub timestamp: Option<String>,
    pub resolved_frames: Option<Vec<ResolvedFrame>>,
}

pub fn harvest_recent_crashes(
    runner: &dyn AdbRunner,
    package: &str,
    device: Option<&str>,
    lines: usize,
) -> Result<Vec<CrashReport>, Error> {
    let output = run_adb(
        runner,
        device,
        &[
            "logcat",
            "-d",
            "-b",
            "main",
            "-b",
            "crash",
            "-b",
            "system",
            "-t",
            &lines.to_string(),
        ],
    )?;
    Ok(parse_crash_logcat(&output, package))
}

type LogEntry = (Option<String>, Option<i32>, String);

fn parse_logcat_entry(line: &str) -> Option<LogEntry> {
    let tag = Regex::new(r"\bAndroidRuntime:\s*(.*)$").expect("static tag regex");
    let tag_match = tag.captures(line)?;
    let timestamp = Regex::new(r"^(\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2}\.\d+)")
        .expect("static logcat timestamp regex")
        .captures(line)
        .and_then(|captures| captures.get(1))
        .map(|value| value.as_str().to_string());
    Some((
        timestamp,
        extract_logcat_pid(line),
        tag_match.get(1)?.as_str().to_string(),
    ))
}

#[must_use]
pub fn parse_crash_logcat(logcat: &str, package: &str) -> Vec<CrashReport> {
    let entries: Vec<LogEntry> = logcat.lines().filter_map(parse_logcat_entry).collect();
    let process_pattern =
        Regex::new(r"\bProcess:\s*([^,\s]+)(?:,\s*PID:\s*(\d+))?").expect("static process regex");
    let mut reports = Vec::new();

    for (index, (timestamp, line_pid, text)) in entries.iter().enumerate() {
        let Some(process_match) = process_pattern.captures(text) else {
            continue;
        };
        if process_match.get(1).map(|value| value.as_str()) != Some(package) {
            continue;
        }
        let previous_process = (0..index)
            .rev()
            .find(|prior| entries[*prior].2.contains("Process:"))
            .map_or(-1, |prior| prior as i64);
        let fatal_start = (previous_process + 1..=index as i64)
            .rev()
            .find(|prior| entries[*prior as usize].2.contains("FATAL EXCEPTION:"))
            .unwrap_or(index as i64);
        let end = (index + 1..entries.len())
            .find(|following| {
                let text = &entries[*following].2;
                text.contains("FATAL EXCEPTION:") || text.contains("Process:")
            })
            .unwrap_or(entries.len());
        let block = &entries[fatal_start as usize..end];
        let block_timestamp = entries[fatal_start as usize]
            .0
            .clone()
            .or_else(|| timestamp.clone());
        let pid = process_match
            .get(2)
            .and_then(|value| value.as_str().parse().ok())
            .or(*line_pid);
        if let Some(report) = parse_crash_block(package, block, block_timestamp, pid) {
            reports.push(report);
        }
    }

    let mut deduplicated: Vec<CrashReport> = Vec::new();
    let mut previous_key: Option<(String, String, String)> = None;
    for report in reports {
        let key = (
            report.exception_type.clone(),
            report.message.clone(),
            report.stack_trace.first().cloned().unwrap_or_default(),
        );
        if previous_key.as_ref() != Some(&key) {
            deduplicated.push(report);
        }
        previous_key = Some(key);
    }
    deduplicated
}

fn parse_crash_block(
    package: &str,
    block: &[LogEntry],
    timestamp: Option<String>,
    pid: Option<i32>,
) -> Option<CrashReport> {
    let exception_pattern =
        Regex::new(r"(?:Caused by:\s*)?([\w.$]+(?:Exception|Error|Throwable))(?::\s*(.*))?$")
            .expect("static exception regex");
    let mut exception = None;
    let mut exception_index = 0usize;
    for (index, (_, _, text)) in block.iter().enumerate() {
        if let Some(captures) = exception_pattern.captures(text.trim()) {
            exception = Some(captures);
            exception_index = index;
            break;
        }
    }
    let exception = exception?;

    let process_pattern =
        Regex::new(r"\bProcess:\s*([^,\s]+)(?:,\s*PID:\s*(\d+))?").expect("static process regex");
    let process_match = block
        .iter()
        .find_map(|(_, _, text)| process_pattern.captures(text))?;
    if process_match.get(1).map(|value| value.as_str()) != Some(package) {
        return None;
    }
    let report_pid = process_match
        .get(2)
        .and_then(|value| value.as_str().parse().ok())
        .or(pid);
    let stack_trace = block
        .iter()
        .skip(exception_index + 1)
        .map(|(_, _, text)| text.trim())
        .filter(|text| text.starts_with("at "))
        .map(str::to_string)
        .collect();

    Some(CrashReport {
        process: package.to_string(),
        pid: report_pid,
        exception_type: exception
            .get(1)
            .map(|value| value.as_str().to_string())
            .unwrap_or_default(),
        message: exception
            .get(2)
            .map(|value| value.as_str().to_string())
            .unwrap_or_default(),
        stack_trace,
        timestamp,
        resolved_frames: None,
    })
}

fn find_smali_file(smali_root: &Path, class_rel_path: &Path) -> Option<PathBuf> {
    let direct = smali_root.join(class_rel_path);
    if direct.is_file() {
        return Some(direct);
    }
    if !smali_root.is_dir() {
        return None;
    }

    let mut children: Vec<PathBuf> = fs::read_dir(smali_root)
        .ok()?
        .filter_map(|entry| entry.ok().map(|entry| entry.path()))
        .collect();
    children.sort();
    for child in &children {
        if child.is_dir() {
            let name = child
                .file_name()
                .and_then(|name| name.to_str())
                .unwrap_or("");
            if name == "smali" || name.starts_with("smali_classes") {
                let candidate = child.join(class_rel_path);
                if candidate.is_file() {
                    return Some(candidate);
                }
            }
        }
    }

    let file_name = class_rel_path.file_name()?;
    let mut pending = vec![smali_root.to_path_buf()];
    while let Some(directory) = pending.pop() {
        let mut entries: Vec<PathBuf> = fs::read_dir(&directory)
            .ok()?
            .filter_map(|entry| entry.ok().map(|entry| entry.path()))
            .collect();
        entries.sort();
        entries.reverse();
        for entry in entries {
            if entry.is_dir() {
                pending.push(entry);
            } else if entry.file_name() == Some(file_name) && entry.ends_with(class_rel_path) {
                return Some(entry);
            }
        }
    }
    None
}

/// Resolves one raw Java stack frame against decompiled Smali.
#[must_use]
pub fn resolve_frame_in_smali(frame: &str, smali_root: &Path) -> ResolvedFrame {
    let frame_pattern =
        Regex::new(r"at\s+([\w$.]+)\.([\w$<>]+)\(([^:]+):?(\d+)?\)").expect("static frame regex");
    let Some(captures) = frame_pattern.captures(frame) else {
        return ResolvedFrame {
            raw_frame: frame.to_string(),
            class_name: String::new(),
            method_name: String::new(),
            smali_path: None,
            method_signature: None,
            code_snippet: None,
        };
    };
    let class_name = captures
        .get(1)
        .map(|value| value.as_str().to_string())
        .unwrap_or_default();
    let method_name = captures
        .get(2)
        .map(|value| value.as_str().to_string())
        .unwrap_or_default();
    let line_number = captures
        .get(4)
        .map(|value| value.as_str().to_string())
        .unwrap_or_default();

    let mut relative = PathBuf::new();
    for component in class_name.split('.') {
        relative.push(component);
    }
    relative.set_extension("smali");
    let Some(smali_path) = find_smali_file(smali_root, &relative) else {
        return ResolvedFrame {
            raw_frame: frame.to_string(),
            class_name,
            method_name,
            smali_path: None,
            method_signature: None,
            code_snippet: None,
        };
    };

    let Ok(content) = fs::read_to_string(&smali_path) else {
        return ResolvedFrame {
            raw_frame: frame.to_string(),
            class_name,
            method_name,
            smali_path: Some(smali_path),
            method_signature: None,
            code_snippet: None,
        };
    };

    let method_pattern = Regex::new(&format!(
        r"(?m)^(\.method\b[^\n]*\s+{}\([^\n]*\)[^\n]*)",
        regex::escape(&method_name)
    ))
    .expect("escaped method regex");
    let Some(method_match) = method_pattern.captures(&content) else {
        return ResolvedFrame {
            raw_frame: frame.to_string(),
            class_name,
            method_name,
            smali_path: Some(smali_path),
            method_signature: None,
            code_snippet: None,
        };
    };
    let method_signature = method_match
        .get(1)
        .map(|value| value.as_str().trim().to_string());
    let method_end = method_match.get(0).map(|value| value.end()).unwrap_or(0);
    let mut method_lines: Vec<String> = Vec::new();
    for line in content[method_end..].lines() {
        let stripped = line.trim();
        if stripped == ".end method" {
            break;
        }
        if !stripped.is_empty() {
            method_lines.push(stripped.to_string());
        }
    }

    let mut snippet = Vec::new();
    if !line_number.is_empty() {
        let marker = Regex::new(&format!(r"^\s*\.line\s+{}\b", regex::escape(&line_number)))
            .expect("line marker regex");
        if let Some(index) = method_lines.iter().position(|line| marker.is_match(line)) {
            let start = index.saturating_sub(4);
            let end = (index + 8).min(method_lines.len());
            snippet = method_lines[start..end].to_vec();
        }
    }
    if snippet.is_empty() {
        snippet = method_lines.iter().take(15).cloned().collect();
    }

    ResolvedFrame {
        raw_frame: frame.to_string(),
        class_name,
        method_name,
        smali_path: Some(smali_path),
        method_signature,
        code_snippet: if snippet.is_empty() {
            None
        } else {
            Some(snippet)
        },
    }
}

#[must_use]
pub fn resolve_crash_frames(crash: &CrashReport, smali_dir: &Path) -> Vec<ResolvedFrame> {
    crash
        .stack_trace
        .iter()
        .map(|frame| resolve_frame_in_smali(frame, smali_dir))
        .collect()
}

#[must_use]
pub fn resolve_crash_report(crash: CrashReport, smali_root: &Path) -> CrashReport {
    let resolved_frames = crash
        .stack_trace
        .iter()
        .map(|frame| resolve_frame_in_smali(frame, smali_root))
        .collect();
    CrashReport {
        resolved_frames: Some(resolved_frames),
        ..crash
    }
}

/// Parses `aapt2` badging output into an `am start -n` component.
pub fn parse_launcher_activity(badging_text: &str, package_name: &str) -> Result<String, Error> {
    let pattern =
        Regex::new(r"launchable-activity:\s+name='([^']+)'").expect("static launcher regex");
    let matches: Vec<String> = pattern
        .captures_iter(badging_text)
        .filter_map(|captures| captures.get(1))
        .map(|value| value.as_str().to_string())
        .collect();
    match matches.as_slice() {
        [] => Err(Error::runtime(
            "No launchable activity found in APK badging output",
        )),
        [activity] => {
            let activity = if let Some(relative) = activity.strip_prefix('.') {
                format!("{package_name}.{relative}")
            } else {
                activity.clone()
            };
            Ok(format!("{package_name}/{activity}"))
        }
        many => Err(Error::runtime(format!(
            "Expected exactly one launchable activity, found {}: {:?}",
            many.len(),
            many
        ))),
    }
}

pub fn install_apk(
    runner: &dyn AdbRunner,
    apk_path: &Path,
    package_name: &str,
    serial: Option<&str>,
    clean_install: bool,
) -> Result<(), Error> {
    let apk = apk_path
        .canonicalize()
        .unwrap_or_else(|_| apk_path.to_path_buf());
    let apk = apk.to_string_lossy().into_owned();
    if clean_install {
        let _ = runner.run(&owned(&["uninstall", package_name]), serial, None)?;
        run_install(runner, &["install", &apk], serial, "clean install")
    } else {
        run_install(runner, &["install", "-r", &apk], serial, "reinstall")
    }
}

fn run_install(
    runner: &dyn AdbRunner,
    args: &[&str],
    serial: Option<&str>,
    mode: &str,
) -> Result<(), Error> {
    let output = runner.run(&owned(args), serial, None)?;
    let combined = format!("{}\n{}", output.stdout, output.stderr)
        .trim()
        .to_string();
    if output.status != 0 || combined.contains("Failure") || combined.contains("Exception") {
        return Err(Error::runtime(format!("ADB {mode} failed: {combined}")));
    }
    Ok(())
}

pub fn launch_component_intent(
    runner: &dyn AdbRunner,
    component: &str,
    serial: Option<&str>,
) -> Result<(), Error> {
    let output = runner.run(
        &owned(&["shell", "am", "start", "-n", component]),
        serial,
        None,
    )?;
    let combined = format!("{}\n{}", output.stdout, output.stderr)
        .trim()
        .to_string();
    if output.status != 0 || combined.contains("Error:") {
        return Err(Error::runtime(format!(
            "ADB launch activity failed: {combined}"
        )));
    }
    Ok(())
}

pub fn get_installed_package_signature(
    runner: &dyn AdbRunner,
    package: &str,
    device: Option<&str>,
) -> Option<String> {
    let output = run_adb(runner, device, &["shell", "dumpsys", "package", package]).ok()?;
    let header = Regex::new(r"(?:signatures\s*=|signatures:|PackageSignatures)")
        .expect("static signature header regex");
    let signature_section = header
        .find(&output)
        .map(|header| {
            let rest = &output[header.end()..];
            let end = rest
                .find('\n')
                .map(|newline| &rest[newline + 1..])
                .and_then(|after_line| {
                    Regex::new(r"(?m)^\s*[A-Za-z0-9_-]+[:=]")
                        .expect("static signature key regex")
                        .find(after_line)
                        .map(|next| newline_offset(rest, after_line, next.start()))
                })
                .map_or(output.len(), |offset| header.end() + offset);
            output[header.start()..end].to_string()
        })
        .unwrap_or_else(|| output.clone());
    let digest = Regex::new(r"\b([0-9a-fA-F:]{40,95})\b").expect("static digest regex");
    for target in [&signature_section, &output] {
        if let Some(captures) = digest.captures(target) {
            if let Some(value) = captures.get(1) {
                let normalized = value.as_str().replace(':', "").to_lowercase();
                if normalized.len() == 64 {
                    return Some(normalized);
                }
            }
        }
    }
    None
}

/// Monotonic clock plus a fixed-epoch source for monitor tests.
pub trait MonitorClock {
    fn now(&self) -> Duration;
    /// Returns false when the sleep was interrupted.
    fn sleep(&self, duration: Duration) -> bool;
    fn unix_epoch_seconds(&self) -> i64;
}

#[derive(Debug, Clone)]
pub struct RealClock {
    origin: Instant,
}

impl Default for RealClock {
    fn default() -> Self {
        Self {
            origin: Instant::now(),
        }
    }
}

impl MonitorClock for RealClock {
    fn now(&self) -> Duration {
        self.origin.elapsed()
    }

    fn sleep(&self, duration: Duration) -> bool {
        thread::sleep(duration);
        true
    }

    fn unix_epoch_seconds(&self) -> i64 {
        SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .map(|duration| duration.as_secs() as i64)
            .unwrap_or(0)
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MonitorStream {
    Stdout,
    Stderr,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MonitorMessage {
    pub stream: MonitorStream,
    pub text: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MonitorOutcome {
    pub exit_code: ExitCode,
    pub messages: Vec<MonitorMessage>,
}

impl MonitorOutcome {
    fn new() -> Self {
        Self {
            exit_code: ExitCode::Success,
            messages: Vec::new(),
        }
    }

    fn push(&mut self, stream: MonitorStream, text: impl Into<String>) {
        self.messages.push(MonitorMessage {
            stream,
            text: text.into(),
        });
    }

    fn fail(mut self, exit_code: ExitCode) -> Self {
        self.exit_code = exit_code;
        self
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MonitorRequest {
    pub package: String,
    pub serial: Option<String>,
    pub timeout: Option<Duration>,
    pub dump_threads: bool,
    pub poll_interval: Duration,
}

impl MonitorRequest {
    #[must_use]
    pub fn new(package: impl Into<String>) -> Self {
        Self {
            package: package.into(),
            serial: None,
            timeout: None,
            dump_threads: false,
            poll_interval: MONITOR_POLL_INTERVAL,
        }
    }
}

/// Monitors main-thread CPU, live ANRs/crashes and exit-info reasons.
///
/// The loop samples at `request.poll_interval`, requires six consecutive
/// `R`/`>=90%` samples before reporting a spin, and uses only the injected
/// monotonic clock for deadlines.
pub fn monitor_application(
    runner: &dyn AdbRunner,
    clock: &dyn MonitorClock,
    request: &MonitorRequest,
) -> MonitorOutcome {
    let package = request.package.as_str();
    let serial = request.serial.as_deref();
    let mut outcome = MonitorOutcome::new();

    let baseline = match runner.run(
        &owned(&["shell", "dumpsys", "activity", "exit-info", package]),
        serial,
        Some(ADB_TIMEOUT),
    ) {
        Ok(output) if !output.timed_out => output,
        Ok(_) => {
            outcome.push(
                MonitorStream::Stderr,
                "\nADB operation timed out: exit-info baseline",
            );
            return outcome.fail(ExitCode::InfrastructureFailure);
        }
        Err(error) => {
            outcome.push(
                MonitorStream::Stderr,
                format!("\nADB operation timed out: {}", error.message()),
            );
            return outcome.fail(ExitCode::InfrastructureFailure);
        }
    };

    let epoch = match runner.run(
        &owned(&["shell", "date", "+%s %z"]),
        serial,
        Some(ADB_TIMEOUT),
    ) {
        Ok(output) if !output.timed_out => output,
        Ok(_) => {
            outcome.push(
                MonitorStream::Stderr,
                "\nADB operation timed out: device clock",
            );
            return outcome.fail(ExitCode::InfrastructureFailure);
        }
        Err(error) => {
            outcome.push(
                MonitorStream::Stderr,
                format!("\nADB operation timed out: {}", error.message()),
            );
            return outcome.fail(ExitCode::InfrastructureFailure);
        }
    };
    let (start_epoch_sec, tz_offset_seconds) =
        parse_device_clock(&epoch.stdout, clock.unix_epoch_seconds());

    let baseline_records = parse_exit_info_records(&baseline.stdout, tz_offset_seconds);
    let baseline_timestamp = baseline_records
        .iter()
        .map(|record| record.timestamp)
        .max()
        .unwrap_or(0);

    let logcat_args = owned(&[
        "logcat",
        "-v",
        "epoch",
        "-T",
        &start_epoch_sec.to_string(),
        "ActivityManager:E",
        "AndroidRuntime:E",
        "libc:F",
        "DEBUG:F",
        "crash_dump:F",
        "tombstoned:F",
        "*:S",
    ]);
    let mut logcat = match runner.stream(&logcat_args, serial) {
        Ok(stream) => stream,
        Err(error) => {
            outcome.push(
                MonitorStream::Stderr,
                format!("\nADB logcat stream failed: {}", error.message()),
            );
            return outcome.fail(ExitCode::InfrastructureFailure);
        }
    };

    let mut log_queue: VecDeque<String> = VecDeque::new();
    let mut active_pid: Option<i32> = None;
    let mut last_stat: Option<ProcStatInfo> = None;
    let mut last_system_stat: Option<SystemStatInfo> = None;
    let mut spin_intervals: u32 = 0;
    let mut healthy_intervals: u32 = 0;
    let started = clock.now();
    let deadline = request.timeout.map(|timeout| started + timeout);

    outcome.push(
        MonitorStream::Stdout,
        format!("Monitoring process for package '{package}'..."),
    );

    loop {
        while let Some(line) = logcat.try_next_line() {
            let line = line.trim();
            if !line.is_empty() {
                log_queue.push_back(line.to_string());
                if log_queue.len() > LOG_QUEUE_CAPACITY {
                    log_queue.pop_front();
                }
            }
        }

        let mut live_event: Option<(bool, String)> = None;
        for line in &log_queue {
            let line_pid = extract_logcat_pid(line);
            let pid_match = active_pid.is_some() && line_pid == active_pid;
            let anr_match = line.contains("ActivityManager") && contains_token(line, package);
            if !pid_match && !anr_match {
                continue;
            }
            if line.contains("ANR in") || line.contains("BIND APPLICATION ANR") {
                live_event = Some((true, line.clone()));
                break;
            }
            if line.contains("FATAL EXCEPTION")
                || line.contains("SIGSEGV")
                || line.to_lowercase().contains("fatal signal")
            {
                live_event = Some((false, line.clone()));
                break;
            }
        }
        if let Some((is_anr, line)) = live_event {
            if is_anr {
                outcome.push(
                    MonitorStream::Stderr,
                    format!("\nLive ANR detected: {line}"),
                );
                if request.dump_threads {
                    if let Some(pid) = active_pid {
                        push_thread_dump(runner, clock, pid, serial, &mut outcome);
                    }
                }
            } else {
                outcome.push(
                    MonitorStream::Stderr,
                    format!("\nLive Crash detected: {line}"),
                );
            }
            return outcome.fail(ExitCode::RuntimeFailure);
        }

        let pid_output = match runner.run(
            &owned(&["shell", "pidof", package]),
            serial,
            Some(ADB_TIMEOUT),
        ) {
            Ok(output) if !output.timed_out => output,
            Ok(_) => return polling_timeout(outcome, "pidof"),
            Err(error) => return polling_timeout(outcome, &error.message()),
        };
        let pids = parse_pidof_output(&pid_output.stdout);

        if pids.is_empty() {
            if let Some(pid) = active_pid {
                outcome.push(
                    MonitorStream::Stderr,
                    format!("\nProcess {pid} terminated."),
                );
                let exit_output = match runner.run(
                    &owned(&["shell", "dumpsys", "activity", "exit-info", package]),
                    serial,
                    Some(ADB_TIMEOUT),
                ) {
                    Ok(output) if !output.timed_out => output,
                    Ok(_) => return polling_timeout(outcome, "exit-info"),
                    Err(error) => return polling_timeout(outcome, &error.message()),
                };
                let records = parse_exit_info_records(&exit_output.stdout, tz_offset_seconds);
                let new_record = records.into_iter().find(|record| {
                    record.timestamp > baseline_timestamp
                        && (record.package.as_deref() == Some(package) || record.pid as i32 == pid)
                });
                if let Some(record) = new_record {
                    let description = record
                        .description
                        .as_ref()
                        .map(|description| format!(": {description}"))
                        .unwrap_or_default();
                    let subreason = record
                        .subreason_name
                        .as_ref()
                        .map(|name| {
                            format!(" (subreason {} {name})", record.subreason_code.unwrap_or(0))
                        })
                        .unwrap_or_default();
                    let line = format!(
                        "ApplicationExitInfo: reason={} ({}){subreason}{description}",
                        record.reason_code, record.reason_name
                    );
                    if FAILURE_EXIT_REASONS.contains(&record.reason_code) {
                        outcome.push(MonitorStream::Stderr, line);
                        return outcome.fail(ExitCode::RuntimeFailure);
                    }
                    outcome.push(MonitorStream::Stdout, line);
                    return outcome;
                }
                outcome.push(
                    MonitorStream::Stderr,
                    "Process exited without ApplicationExitInfo record.",
                );
                return outcome.fail(ExitCode::RuntimeFailure);
            }

            if deadline.is_some_and(|deadline| clock.now() >= deadline) {
                outcome.push(
                    MonitorStream::Stderr,
                    format!("Startup timeout: package '{package}' did not start within timeout."),
                );
                return outcome.fail(ExitCode::RuntimeFailure);
            }
            if !clock.sleep(request.poll_interval) {
                outcome.push(MonitorStream::Stdout, "\nInterrupted.");
                return outcome;
            }
            continue;
        }

        let current_pid = pids[0];
        if active_pid != Some(current_pid) {
            active_pid = Some(current_pid);
            last_stat = None;
            last_system_stat = None;
            spin_intervals = 0;
            healthy_intervals = 0;
            outcome.push(
                MonitorStream::Stdout,
                format!("Attached to process PID {current_pid}"),
            );
        }

        let stat_output = match runner.run(
            &owned(&[
                "shell",
                "cat",
                &format!("/proc/{current_pid}/task/{current_pid}/stat"),
            ]),
            serial,
            Some(ADB_TIMEOUT),
        ) {
            Ok(output) if !output.timed_out => output,
            Ok(_) => return polling_timeout(outcome, "proc stat"),
            Err(error) => return polling_timeout(outcome, &error.message()),
        };
        let system_stat_output = match runner.run(
            &owned(&["shell", "cat", "/proc/stat"]),
            serial,
            Some(ADB_TIMEOUT),
        ) {
            Ok(output) if !output.timed_out => output,
            Ok(_) => return polling_timeout(outcome, "system stat"),
            Err(error) => return polling_timeout(outcome, &error.message()),
        };

        let Ok(proc_stat) = parse_proc_stat(&stat_output.stdout) else {
            if !clock.sleep(request.poll_interval) {
                outcome.push(MonitorStream::Stdout, "\nInterrupted.");
                return outcome;
            }
            continue;
        };
        let system_stat = parse_proc_system_stat(&system_stat_output.stdout);

        if let (Some(previous), Some(previous_system)) = (&last_stat, &last_system_stat) {
            if previous.starttime == proc_stat.starttime {
                let thread_delta = (proc_stat.utime as i64 + proc_stat.stime as i64)
                    - (previous.utime as i64 + previous.stime as i64);
                let system_delta =
                    system_stat.total_jiffies as i64 - previous_system.total_jiffies as i64;
                let cpu_percent = if system_delta > 0 {
                    (thread_delta as f64 / system_delta as f64)
                        * f64::from(system_stat.cpu_count)
                        * 100.0
                } else {
                    0.0
                };
                if proc_stat.state == "R" && cpu_percent >= MONITOR_SPIN_CPU_PERCENT {
                    spin_intervals += 1;
                    if spin_intervals >= MONITOR_SPIN_INTERVALS {
                        let pid = active_pid.unwrap_or(current_pid);
                        outcome.push(
                            MonitorStream::Stderr,
                            format!(
                                "\nHigh CPU Spin Warning: main thread TID {pid} sustained >=90% CPU ({cpu_percent:.1}%) in state 'R' for 3.0s"
                            ),
                        );
                        if request.dump_threads {
                            push_thread_dump(runner, clock, pid, serial, &mut outcome);
                        }
                        return outcome.fail(ExitCode::RuntimeFailure);
                    }
                } else {
                    spin_intervals = 0;
                    healthy_intervals += 1;
                }
            } else {
                // Same PID but a new starttime means the PID was reused; never
                // attribute the previous process's CPU counters to it.
                spin_intervals = 0;
                healthy_intervals += 1;
            }
        } else {
            healthy_intervals += 1;
        }

        last_stat = Some(proc_stat);
        last_system_stat = Some(system_stat);

        if deadline.is_some_and(|deadline| clock.now() >= deadline) {
            if healthy_intervals >= 1 {
                let timeout = request.timeout.unwrap_or_default().as_secs_f64();
                outcome.push(
                    MonitorStream::Stdout,
                    format!("Monitoring completed: process healthy after {timeout:?}s."),
                );
                return outcome;
            }
            let timeout = request.timeout.unwrap_or_default().as_secs_f64();
            outcome.push(
                MonitorStream::Stderr,
                format!("Monitoring timeout: no complete healthy sample within {timeout:?}s."),
            );
            return outcome.fail(ExitCode::RuntimeFailure);
        }

        if !clock.sleep(request.poll_interval) {
            outcome.push(MonitorStream::Stdout, "\nInterrupted.");
            return outcome;
        }
    }
}

fn polling_timeout(mut outcome: MonitorOutcome, detail: &str) -> MonitorOutcome {
    outcome.push(
        MonitorStream::Stderr,
        format!("\nADB polling operation timed out: {detail}"),
    );
    outcome.fail(ExitCode::InfrastructureFailure)
}

fn parse_device_clock(output: &str, fallback_epoch: i64) -> (i64, i32) {
    let mut parts = output.split_whitespace();
    let epoch = parts
        .next()
        .and_then(|value| value.parse::<i64>().ok())
        .unwrap_or(fallback_epoch);
    let offset = parts.next().and_then(parse_timezone_offset).unwrap_or(0);
    (epoch, offset)
}

fn parse_timezone_offset(text: &str) -> Option<i32> {
    if !text.is_ascii() || text.len() != 5 {
        return None;
    }
    let bytes = text.as_bytes();
    if !matches!(bytes[0], b'+' | b'-') {
        return None;
    }
    let hours: i32 = text[1..3].parse().ok()?;
    let minutes: i32 = text[3..5].parse().ok()?;
    let magnitude = hours * 3_600 + minutes * 60;
    Some(if bytes[0] == b'-' {
        -magnitude
    } else {
        magnitude
    })
}

fn contains_token(haystack: &str, token: &str) -> bool {
    if token.is_empty() {
        return false;
    }
    let mut offset = 0;
    while let Some(found) = haystack[offset..].find(token) {
        let start = offset + found;
        let end = start + token.len();
        let before_ok = haystack[..start]
            .chars()
            .next_back()
            .is_none_or(|character| !is_package_char(character));
        let after_ok = haystack[end..]
            .chars()
            .next()
            .is_none_or(|character| !is_package_char(character));
        if before_ok && after_ok {
            return true;
        }
        offset = end;
        if offset >= haystack.len() {
            break;
        }
    }
    false
}

fn newline_offset(rest: &str, after_line: &str, next_start: usize) -> usize {
    let after_first_line = rest.len() - after_line.len();
    after_first_line + next_start
}

fn is_package_char(character: char) -> bool {
    character.is_ascii_alphanumeric() || character == '_' || character == '.'
}

fn push_thread_dump(
    runner: &dyn AdbRunner,
    clock: &dyn MonitorClock,
    pid: i32,
    serial: Option<&str>,
    outcome: &mut MonitorOutcome,
) {
    if let Ok(Some(dump)) = capture_thread_dump(runner, clock, pid, serial) {
        outcome.push(MonitorStream::Stderr, format!("\nThread dump:\n{dump}"));
    }
}

pub fn capture_thread_dump(
    runner: &dyn AdbRunner,
    clock: &dyn MonitorClock,
    pid: i32,
    serial: Option<&str>,
) -> Result<Option<String>, Error> {
    let _ = runner.run(
        &owned(&["shell", "kill", "-3", &pid.to_string()]),
        serial,
        None,
    )?;
    let _ = clock.sleep(Duration::from_millis(500));
    let output = runner.run(
        &owned(&["logcat", "-d", "--pid", &pid.to_string(), "-t", "1000"]),
        serial,
        None,
    )?;
    if output.status != 0 || output.stdout.is_empty() {
        return Ok(None);
    }
    let dump: Vec<&str> = output
        .stdout
        .lines()
        .filter(|line| line.contains("tid=") || line.contains("prio=") || line.contains("at "))
        .take(THREAD_DUMP_LINES)
        .collect();
    if dump.is_empty() {
        return Ok(None);
    }
    Ok(Some(dump.join("\n")))
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct UiNode {
    pub text: String,
    pub content_desc: String,
    pub resource_id: String,
    pub class_name: String,
    pub clickable: bool,
    /// left, top, right, bottom
    pub bounds: (i32, i32, i32, i32),
}

impl UiNode {
    #[must_use]
    pub fn center(&self) -> (i32, i32) {
        let (left, top, right, bottom) = self.bounds;
        ((left + right).div_euclid(2), (top + bottom).div_euclid(2))
    }

    #[must_use]
    pub fn matches(
        &self,
        text: Option<&str>,
        desc: Option<&str>,
        resource_id: Option<&str>,
    ) -> bool {
        if let Some(text) = text.filter(|value| !value.is_empty()) {
            if !self.text.to_lowercase().contains(&text.to_lowercase()) {
                return false;
            }
        }
        if let Some(desc) = desc.filter(|value| !value.is_empty()) {
            if !self
                .content_desc
                .to_lowercase()
                .contains(&desc.to_lowercase())
            {
                return false;
            }
        }
        if let Some(resource_id) = resource_id.filter(|value| !value.is_empty()) {
            if !self
                .resource_id
                .to_lowercase()
                .contains(&resource_id.to_lowercase())
            {
                return false;
            }
        }
        true
    }
}

impl Serialize for UiNode {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        let mut state = serializer.serialize_struct("UiNode", 7)?;
        state.serialize_field("text", &self.text)?;
        state.serialize_field("contentDesc", &self.content_desc)?;
        state.serialize_field("resourceId", &self.resource_id)?;
        state.serialize_field("className", &self.class_name)?;
        state.serialize_field("clickable", &self.clickable)?;
        state.serialize_field(
            "bounds",
            &[self.bounds.0, self.bounds.1, self.bounds.2, self.bounds.3],
        )?;
        state.serialize_field("center", &[self.center().0, self.center().1])?;
        state.end()
    }
}

#[derive(Debug, Clone, Copy, Default)]
pub struct UiFilter<'a> {
    pub text: Option<&'a str>,
    pub desc: Option<&'a str>,
    pub resource_id: Option<&'a str>,
    pub clickable_only: bool,
}

#[must_use]
pub fn find_ui_nodes(nodes: &[UiNode], filter: UiFilter<'_>) -> Vec<UiNode> {
    nodes
        .iter()
        .filter(|node| !filter.clickable_only || node.clickable)
        .filter(|node| node.matches(filter.text, filter.desc, filter.resource_id))
        .cloned()
        .collect()
}

/// Parses `[left,top][right,bottom]`.
pub fn parse_bounds(bounds: &str) -> Result<(i32, i32, i32, i32), Error> {
    let pattern =
        Regex::new(r"^\[(-?\d+),(-?\d+)\]\[(-?\d+),(-?\d+)\]").expect("static bounds regex");
    let captures = pattern
        .captures(bounds)
        .ok_or_else(|| Error::usage(format!("Invalid bounds string: {bounds}")))?;
    let parse = |index: usize| -> Result<i32, Error> {
        captures
            .get(index)
            .and_then(|value| value.as_str().parse().ok())
            .ok_or_else(|| Error::usage(format!("Invalid bounds string: {bounds}")))
    };
    Ok((parse(1)?, parse(2)?, parse(3)?, parse(4)?))
}

/// Parses a uiautomator hierarchy, tolerating adb's trailing status text.
pub fn parse_ui_hierarchy(raw: &str) -> Result<Vec<UiNode>, Error> {
    let start = raw.find("<?xml").or_else(|| raw.find("<hierarchy"));
    let end = raw.find("</hierarchy>");
    let (Some(start), Some(end)) = (start, end) else {
        let preview: String = raw.chars().take(200).collect();
        return Err(Error::usage(format!(
            "Failed to find UI hierarchy in output: {preview}"
        )));
    };
    let xml = &raw[start..end + "</hierarchy>".len()];

    let attribute_pattern = Regex::new(r#"([A-Za-z0-9_:-]+)\s*=\s*(?:"([^"]*)"|'([^']*)')"#)
        .expect("static attribute regex");
    let mut nodes = Vec::new();
    let mut offset = 0;
    while let Some(found) = xml[offset..].find("<node") {
        let tag_start = offset + found;
        let after_name = &xml[tag_start + "<node".len()..];
        let valid_boundary = after_name.chars().next().is_some_and(|character| {
            character.is_whitespace() || character == '>' || character == '/'
        });
        if !valid_boundary {
            offset = tag_start + "<node".len();
            continue;
        }
        let Some(relative_end) = xml[tag_start..].find('>') else {
            return Err(Error::usage(
                "Failed to parse UI hierarchy: unterminated node tag",
            ));
        };
        let tag = &xml[tag_start..tag_start + relative_end + 1];
        let mut attributes: BTreeMap<&str, String> = BTreeMap::new();
        for captures in attribute_pattern.captures_iter(tag) {
            let Some(name) = captures.get(1) else {
                continue;
            };
            let raw_value = captures
                .get(2)
                .or_else(|| captures.get(3))
                .map(|value| value.as_str())
                .unwrap_or_default();
            attributes.insert(name.as_str(), decode_entities(raw_value));
        }
        let bounds = parse_bounds(
            attributes
                .get("bounds")
                .map(String::as_str)
                .unwrap_or("[0,0][0,0]"),
        )?;
        nodes.push(UiNode {
            text: attributes.get("text").cloned().unwrap_or_default(),
            content_desc: attributes.get("content-desc").cloned().unwrap_or_default(),
            resource_id: attributes.get("resource-id").cloned().unwrap_or_default(),
            class_name: attributes.get("class").cloned().unwrap_or_default(),
            clickable: attributes
                .get("clickable")
                .is_some_and(|value| value.eq_ignore_ascii_case("true")),
            bounds,
        });
        offset = tag_start + relative_end + 1;
    }
    Ok(nodes)
}

fn decode_entities(raw: &str) -> String {
    let mut decoded = String::with_capacity(raw.len());
    let mut rest = raw;
    while let Some(index) = rest.find('&') {
        decoded.push_str(&rest[..index]);
        let Some(end) = rest[index..].find(';') else {
            decoded.push_str(&rest[index..]);
            return decoded;
        };
        let entity = &rest[index + 1..index + end];
        if let Some(character) = decode_entity(entity) {
            decoded.push(character);
            rest = &rest[index + end + 1..];
        } else {
            decoded.push('&');
            rest = &rest[index + 1..];
        }
    }
    decoded.push_str(rest);
    decoded
}

fn decode_entity(entity: &str) -> Option<char> {
    match entity {
        "amp" => Some('&'),
        "lt" => Some('<'),
        "gt" => Some('>'),
        "quot" => Some('"'),
        "apos" => Some('\''),
        _ => {
            let code = entity
                .strip_prefix("#x")
                .or_else(|| entity.strip_prefix("#X"));
            if let Some(hex) = code {
                return u32::from_str_radix(hex, 16).ok().and_then(char::from_u32);
            }
            let decimal = entity.strip_prefix('#')?;
            decimal.parse::<u32>().ok().and_then(char::from_u32)
        }
    }
}

pub fn dump_ui_hierarchy(
    runner: &dyn AdbRunner,
    device: Option<&str>,
) -> Result<Vec<UiNode>, Error> {
    let raw = run_adb(
        runner,
        device,
        &["exec-out", "uiautomator", "dump", "/dev/tty"],
    )
    .map_err(|error| Error::usage(error.message()))?;
    parse_ui_hierarchy(&raw)
}

pub fn click_ui_node(
    runner: &dyn AdbRunner,
    device: Option<&str>,
    node: &UiNode,
) -> Result<(), Error> {
    let (x, y) = node.center();
    click_ui_coordinates(runner, device, x, y)
}

pub fn click_ui_coordinates(
    runner: &dyn AdbRunner,
    device: Option<&str>,
    x: i32,
    y: i32,
) -> Result<(), Error> {
    run_adb(
        runner,
        device,
        &["shell", "input", "tap", &x.to_string(), &y.to_string()],
    )
    .map(|_| ())
    .map_err(|error| Error::usage(error.message()))
}
