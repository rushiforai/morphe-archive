//! Subprocess adapter.
//!
//! The adapter is the only place that constructs a [`Command`]. It never
//! invokes a shell: the program and every argument are passed as separate argv
//! elements. Output is captured with a hard byte bound so a hostile or noisy
//! child cannot exhaust memory; excess bytes are drained and discarded.
//!
//! Callers configure secrets; diagnostics built here redact them before they
//! reach stderr or an error message.

use crate::error::Error;
use std::ffi::OsString;
use std::fmt;
use std::io::{self, Read};
use std::path::PathBuf;
use std::process::{Child, Command, ExitStatus, Stdio};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{Arc, Once};
use std::thread;
use std::time::{Duration, Instant};
use wait_timeout::ChildExt;

/// Default retained bytes per captured stream.
pub const DEFAULT_MAX_OUTPUT_BYTES: usize = 1024 * 1024;

/// Environment variables that every child loses unless a caller re-adds them
/// explicitly. They carry account documents or paths to them and must never be
/// inherited by third-party tools.
pub const DEFAULT_REMOVED_ENV: &[&str] = &["APKEEP_ACCOUNTS", "APKEEP_ACCOUNTS_FILE"];

const CANCEL_POLL_INTERVAL: Duration = Duration::from_millis(10);
const TERMINATED_REAP_GRACE: Duration = Duration::from_secs(5);
const READER_DRAIN_GRACE: Duration = Duration::from_secs(2);
const READ_BUFFER_BYTES: usize = 8 * 1024;
const REDACTED: &str = "[REDACTED]";

/// Process-wide termination request, set only by [`install_signal_handlers`]
/// or [`request_termination`].
static TERMINATION: AtomicBool = AtomicBool::new(false);
static SIGNAL_HANDLERS: Once = Once::new();

/// Installs SIGINT/SIGTERM handlers that record a process-wide termination
/// request. Idempotent; intended to be called once at the binary boundary.
///
/// The handler body only stores an atomic flag, which is async-signal-safe. A
/// second signal after the first exits the process immediately so a cleanup
/// path stuck after cancellation can still be interrupted.
pub fn install_signal_handlers() {
    SIGNAL_HANDLERS.call_once(|| {
        #[cfg(unix)]
        unsafe {
            libc::signal(
                libc::SIGINT,
                handle_termination as *const () as libc::sighandler_t,
            );
            libc::signal(
                libc::SIGTERM,
                handle_termination as *const () as libc::sighandler_t,
            );
        }
    });
}

/// Whether a termination signal has been received.
#[must_use]
pub fn termination_requested() -> bool {
    TERMINATION.load(Ordering::SeqCst)
}

/// Requests process-wide termination without a signal. Tests use this to
/// simulate a signal without installing handlers in the test process.
#[doc(hidden)]
pub fn request_termination() {
    TERMINATION.store(true, Ordering::SeqCst);
}

#[cfg(unix)]
extern "C" fn handle_termination(signal: libc::c_int) {
    if TERMINATION.swap(true, Ordering::SeqCst) {
        // A second signal must always stop the process, even when cleanup after
        // the first signal is stuck. `_exit` is async-signal-safe.
        unsafe {
            libc::_exit(128 + signal);
        }
    }
}

#[cfg(test)]
fn clear_termination() {
    TERMINATION.store(false, Ordering::SeqCst);
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum StdinMode {
    Inherit,
    Null,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum OutputMode {
    Inherit,
    Null,
    Captured,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct BoundedOutput {
    pub bytes: Vec<u8>,
    pub truncated: bool,
}

impl BoundedOutput {
    #[must_use]
    pub fn text_lossy(&self) -> String {
        String::from_utf8_lossy(&self.bytes).into_owned()
    }
}

#[derive(Clone)]
pub struct ProcessSpec {
    pub program: OsString,
    pub args: Vec<String>,
    pub cwd: Option<PathBuf>,
    pub timeout: Option<Duration>,
    /// Cooperative cancellation. A set flag kills and reaps the child.
    pub cancel: Option<Arc<AtomicBool>>,
    pub stdin: StdinMode,
    pub stdout: OutputMode,
    pub stderr: OutputMode,
    pub max_output_bytes: usize,
    pub secrets: Vec<String>,
    /// Variables removed from the inherited environment before spawning.
    /// Starts with [`DEFAULT_REMOVED_ENV`]; callers add tool-specific names
    /// with [`ProcessSpec::remove_env`].
    pub remove_env: Vec<OsString>,
}

impl fmt::Debug for ProcessSpec {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let cancel = self.cancel.as_ref().map(|_| ());
        let secrets = if self.secrets.is_empty() {
            "[]"
        } else {
            REDACTED
        };
        f.debug_struct("ProcessSpec")
            .field("command", &self.describe_command())
            .field("cwd", &self.cwd)
            .field("timeout", &self.timeout)
            .field("cancel", &cancel)
            .field("stdin", &self.stdin)
            .field("stdout", &self.stdout)
            .field("stderr", &self.stderr)
            .field("max_output_bytes", &self.max_output_bytes)
            .field("secrets", &secrets)
            .field("remove_env", &self.remove_env)
            .finish()
    }
}

impl ProcessSpec {
    #[must_use]
    pub fn new(program: impl Into<OsString>) -> Self {
        Self {
            program: program.into(),
            args: Vec::new(),
            cwd: None,
            timeout: None,
            cancel: None,
            stdin: StdinMode::Null,
            stdout: OutputMode::Captured,
            stderr: OutputMode::Captured,
            max_output_bytes: DEFAULT_MAX_OUTPUT_BYTES,
            secrets: Vec::new(),
            remove_env: DEFAULT_REMOVED_ENV.iter().map(OsString::from).collect(),
        }
    }

    #[must_use]
    pub fn arg(mut self, arg: impl Into<String>) -> Self {
        self.args.push(arg.into());
        self
    }

    #[must_use]
    pub fn args<I, S>(mut self, args: I) -> Self
    where
        I: IntoIterator<Item = S>,
        S: Into<String>,
    {
        self.args.extend(args.into_iter().map(Into::into));
        self
    }

    #[must_use]
    pub fn cwd(mut self, cwd: impl Into<PathBuf>) -> Self {
        self.cwd = Some(cwd.into());
        self
    }

    #[must_use]
    pub fn timeout(mut self, timeout: Duration) -> Self {
        self.timeout = Some(timeout);
        self
    }

    #[must_use]
    pub fn cancel(mut self, cancel: Arc<AtomicBool>) -> Self {
        self.cancel = Some(cancel);
        self
    }

    #[must_use]
    pub fn stdin(mut self, mode: StdinMode) -> Self {
        self.stdin = mode;
        self
    }

    #[must_use]
    pub fn stdout(mut self, mode: OutputMode) -> Self {
        self.stdout = mode;
        self
    }

    #[must_use]
    pub fn stderr(mut self, mode: OutputMode) -> Self {
        self.stderr = mode;
        self
    }

    #[must_use]
    pub fn max_output_bytes(mut self, limit: usize) -> Self {
        self.max_output_bytes = limit;
        self
    }

    #[must_use]
    pub fn secret(mut self, secret: impl Into<String>) -> Self {
        self.secrets.push(secret.into());
        self
    }

    /// Removes one more variable from the child's inherited environment. The
    /// default account variables are always removed; tools that need PATH,
    /// HOME, JAVA_HOME, ANDROID_*, or TMPDIR keep them because the environment
    /// is never cleared wholesale.
    #[must_use]
    pub fn remove_env(mut self, variable: impl Into<OsString>) -> Self {
        self.remove_env.push(variable.into());
        self
    }

    /// Removes every configured secret from diagnostic text. Longer secrets are
    /// replaced first so an overlapping shorter secret cannot leave a suffix.
    #[must_use]
    pub fn redact(&self, text: &str) -> String {
        let mut secrets: Vec<&str> = self
            .secrets
            .iter()
            .map(String::as_str)
            .filter(|secret| !secret.is_empty())
            .collect();
        secrets.sort_by_key(|secret| std::cmp::Reverse(secret.len()));

        let mut redacted = text.to_string();
        for secret in secrets {
            redacted = redacted.replace(secret, REDACTED);
        }
        redacted
    }

    /// Command line for diagnostics only. Never executed through a shell.
    #[must_use]
    pub fn describe_command(&self) -> String {
        let mut parts = Vec::with_capacity(self.args.len() + 1);
        parts.push(self.program.to_string_lossy().into_owned());
        parts.extend(self.args.iter().cloned());
        self.redact(&parts.join(" "))
    }
}

#[derive(Debug)]
pub struct ProcessOutput {
    pub status: ExitStatus,
    pub stdout: BoundedOutput,
    pub stderr: BoundedOutput,
    /// The child was killed because it exceeded the configured timeout.
    pub timed_out: bool,
    /// The child was killed because a shared cancellation flag was set.
    pub cancelled: bool,
}

impl ProcessOutput {
    #[must_use]
    pub fn success(&self) -> bool {
        !self.timed_out && !self.cancelled && self.status.success()
    }

    #[must_use]
    pub fn exit_code(&self) -> Option<i32> {
        self.status.code()
    }

    /// Redacted stderr suitable for a diagnostic message.
    #[must_use]
    pub fn diagnostics(&self, spec: &ProcessSpec) -> String {
        spec.redact(&self.stderr.text_lossy())
    }
}

/// Runs one process to completion, a timeout, or an I/O failure.
///
/// A non-zero child exit and a timeout are successful adapter outcomes; callers
/// decide whether they are failures. Spawn and wait failures are [`Error`]s.
pub fn run(spec: &ProcessSpec) -> Result<ProcessOutput, Error> {
    if executable_candidate(spec).is_none() {
        return Err(Error::usage(format!(
            "cannot execute '{}': executable not found",
            spec.describe_command()
        )));
    }
    let mut command = Command::new(&spec.program);
    command.args(&spec.args);
    for variable in &spec.remove_env {
        command.env_remove(variable);
    }
    #[cfg(unix)]
    {
        use std::os::unix::process::CommandExt;
        // Keep descendants in a dedicated group so timeout/cancellation can
        // close inherited pipes instead of waiting for an orphaned grandchild.
        command.process_group(0);
    }
    if let Some(cwd) = &spec.cwd {
        command.current_dir(cwd);
    }
    command.stdin(match spec.stdin {
        StdinMode::Inherit => Stdio::inherit(),
        StdinMode::Null => Stdio::null(),
    });
    command.stdout(stdio_for(spec.stdout));
    command.stderr(stdio_for(spec.stderr));

    let mut child = command.spawn().map_err(|error| spawn_error(spec, &error))?;

    let stdout_reader = child
        .stdout
        .take()
        .map(|stream| spawn_reader(stream, spec.max_output_bytes));
    let stderr_reader = child
        .stderr
        .take()
        .map(|stream| spawn_reader(stream, spec.max_output_bytes));

    let started = Instant::now();
    let deadline = spec.timeout.map(|limit| started + limit);
    let mut timed_out = false;
    let mut cancelled = false;
    // Every child polls, because termination is process-wide and can arrive at
    // any moment even when the caller configured no flag or timeout.
    let status = loop {
        if cancellation_requested(spec) {
            cancelled = true;
            terminate_child(&mut child);
            break reap_terminated_child(&mut child, spec, "cancelled")?;
        }

        let slice = match deadline {
            Some(deadline) => {
                let remaining = deadline.saturating_duration_since(Instant::now());
                if remaining.is_zero() {
                    timed_out = true;
                    terminate_child(&mut child);
                    break reap_terminated_child(&mut child, spec, "timed-out")?;
                }
                remaining.min(CANCEL_POLL_INTERVAL)
            }
            None => CANCEL_POLL_INTERVAL,
        };

        match child.wait_timeout(slice) {
            Ok(Some(status)) => break status,
            Ok(None) => {}
            Err(error) => {
                terminate_child(&mut child);
                let _ = reap_terminated_child(&mut child, spec, "terminated");
                return Err(Error::io(
                    format!("failed while waiting for '{}'", spec.describe_command()),
                    error,
                ));
            }
        }
    };

    let (stdout, stderr) = drain_readers(stdout_reader, stderr_reader, child.id(), spec)?;

    Ok(ProcessOutput {
        status,
        stdout,
        stderr,
        timed_out,
        cancelled,
    })
}

/// A set spec flag or a process-wide termination request both cancel.
fn cancellation_requested(spec: &ProcessSpec) -> bool {
    spec.cancel
        .as_ref()
        .is_some_and(|flag| flag.load(Ordering::Relaxed))
        || termination_requested()
}

/// Reaps a child that has just been signalled. Polling keeps `run` free of an
/// unconditional blocking wait, even if the kernel delays the SIGKILL.
fn reap_terminated_child(
    child: &mut Child,
    spec: &ProcessSpec,
    state: &str,
) -> Result<ExitStatus, Error> {
    let deadline = Instant::now() + TERMINATED_REAP_GRACE;
    loop {
        match child.try_wait() {
            Ok(Some(status)) => return Ok(status),
            Ok(None) => {}
            Err(error) => {
                return Err(Error::io(
                    format!("failed to reap {state} '{}'", spec.describe_command()),
                    error,
                ));
            }
        }
        if Instant::now() >= deadline {
            return Err(Error::runtime(format!(
                "{state} child '{}' did not exit after SIGKILL",
                spec.describe_command()
            )));
        }
        thread::sleep(CANCEL_POLL_INTERVAL);
    }
}

/// Joins reader threads with a bounded grace. A descendant that inherited the
/// captured pipes and outlived the direct child cannot hold the adapter open:
/// once the grace expires the process group is killed again and a typed error
/// naming the stream is returned.
fn drain_readers(
    stdout_reader: Option<thread::JoinHandle<io::Result<BoundedOutput>>>,
    stderr_reader: Option<thread::JoinHandle<io::Result<BoundedOutput>>>,
    group_leader: u32,
    spec: &ProcessSpec,
) -> Result<(BoundedOutput, BoundedOutput), Error> {
    let deadline = Instant::now() + READER_DRAIN_GRACE;
    loop {
        let stdout_done = stdout_reader
            .as_ref()
            .is_none_or(thread::JoinHandle::is_finished);
        let stderr_done = stderr_reader
            .as_ref()
            .is_none_or(thread::JoinHandle::is_finished);
        if stdout_done && stderr_done {
            break;
        }
        if Instant::now() >= deadline {
            kill_process_group(group_leader);
            let stream = if stdout_done { "stderr" } else { "stdout" };
            return Err(Error::runtime(format!(
                "child {stream} did not close within the drain grace after '{}' exited",
                spec.describe_command()
            )));
        }
        thread::sleep(CANCEL_POLL_INTERVAL);
    }

    let stdout = join_reader(stdout_reader, "stdout")?;
    let stderr = join_reader(stderr_reader, "stderr")?;
    Ok((stdout, stderr))
}

fn stdio_for(mode: OutputMode) -> Stdio {
    match mode {
        OutputMode::Inherit => Stdio::inherit(),
        OutputMode::Null => Stdio::null(),
        OutputMode::Captured => Stdio::piped(),
    }
}

/// Resolves the program the way `Command` will: an explicit path is checked
/// relative to the configured working directory, while a bare name is searched
/// on `PATH`. Linux may turn an `exec` failure into a silent child exit 127, so
/// detect a missing executable before spawning.
fn executable_candidate(spec: &ProcessSpec) -> Option<PathBuf> {
    let program = std::path::Path::new(&spec.program);
    let has_separator = spec.program.to_string_lossy().contains(['/', '\\']);
    if program.is_absolute() || has_separator {
        let resolved = if program.is_absolute() {
            program.to_path_buf()
        } else if let Some(cwd) = &spec.cwd {
            cwd.join(program)
        } else {
            program.to_path_buf()
        };
        return resolved.is_file().then_some(resolved);
    }
    let paths = std::env::var_os("PATH")?;
    std::env::split_paths(&paths)
        .map(|directory| directory.join(program))
        .find(|candidate| candidate.is_file())
}

fn terminate_child(child: &mut Child) {
    kill_process_group(child.id());
    let _ = child.kill();
}

/// Kills the child's process group. Every child is spawned with
/// `process_group(0)`, so its PID is the group ID.
fn kill_process_group(pid: u32) {
    #[cfg(unix)]
    {
        let pgid = pid as libc::pid_t;
        if pgid > 0 {
            unsafe {
                libc::kill(-pgid, libc::SIGKILL);
            }
        }
    }
    #[cfg(not(unix))]
    {
        let _ = pid;
    }
}

fn spawn_error(spec: &ProcessSpec, error: &io::Error) -> Error {
    if error.kind() == io::ErrorKind::NotFound {
        Error::usage(format!(
            "cannot execute '{}': executable not found",
            spec.describe_command()
        ))
    } else {
        Error::io(
            format!("cannot start '{}'", spec.describe_command()),
            io::Error::new(error.kind(), error.to_string()),
        )
    }
}

fn spawn_reader<R>(mut reader: R, limit: usize) -> thread::JoinHandle<io::Result<BoundedOutput>>
where
    R: Read + Send + 'static,
{
    thread::spawn(move || read_bounded(&mut reader, limit))
}

fn join_reader(
    handle: Option<thread::JoinHandle<io::Result<BoundedOutput>>>,
    stream: &str,
) -> Result<BoundedOutput, Error> {
    let Some(handle) = handle else {
        return Ok(BoundedOutput {
            bytes: Vec::new(),
            truncated: false,
        });
    };
    match handle.join() {
        Ok(Ok(output)) => Ok(output),
        Ok(Err(error)) => Err(Error::io(format!("failed to read child {stream}"), error)),
        Err(_) => Err(Error::infrastructure(format!(
            "child {stream} reader thread panicked"
        ))),
    }
}

fn read_bounded<R: Read>(reader: &mut R, limit: usize) -> io::Result<BoundedOutput> {
    let mut kept = Vec::new();
    let mut truncated = false;
    let mut buffer = vec![0u8; READ_BUFFER_BYTES];

    loop {
        let read = reader.read(&mut buffer)?;
        if read == 0 {
            break;
        }
        let remaining = limit.saturating_sub(kept.len());
        if remaining == 0 {
            truncated = true;
            continue;
        }
        let take = remaining.min(read);
        kept.extend_from_slice(&buffer[..take]);
        if take < read {
            truncated = true;
        }
    }

    Ok(BoundedOutput {
        bytes: kept,
        truncated,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::sync::{Mutex, MutexGuard};

    /// Serializes tests that spawn children or touch the process-global
    /// termination flag, so one test cannot cancel another's child.
    static TEST_CHILD_LOCK: Mutex<()> = Mutex::new(());

    fn test_child_lock() -> MutexGuard<'static, ()> {
        TEST_CHILD_LOCK
            .lock()
            .unwrap_or_else(std::sync::PoisonError::into_inner)
    }

    struct TerminationGuard;

    impl Drop for TerminationGuard {
        fn drop(&mut self) {
            clear_termination();
        }
    }

    #[test]
    fn synthetic_termination_is_observed_by_the_adapter() {
        let _lock = test_child_lock();
        let _guard = TerminationGuard;
        request_termination();
        assert!(termination_requested());
        assert!(cancellation_requested(&ProcessSpec::new("tool")));
    }

    #[test]
    #[cfg(unix)]
    fn cancellation_kills_a_background_descendant() {
        let _lock = test_child_lock();
        let flag = Arc::new(AtomicBool::new(false));
        let signal = Arc::clone(&flag);
        let starter = std::thread::spawn(move || {
            std::thread::sleep(Duration::from_millis(50));
            signal.store(true, Ordering::Relaxed);
        });
        let started = Instant::now();
        let spec = ProcessSpec::new("/bin/sh")
            .args(["-c", "sleep 30 & wait"])
            .cancel(flag);
        let output = run(&spec).expect("sh starts");
        starter.join().expect("signal thread");
        assert!(output.cancelled, "child must be reported as cancelled");
        assert!(!output.success());
        assert!(
            started.elapsed() < Duration::from_secs(5),
            "cancel must kill descendants holding child pipes"
        );
    }

    #[test]
    #[cfg(unix)]
    fn descendant_holding_captured_stdout_is_bounded_by_the_drain_grace() {
        let _lock = test_child_lock();
        let directory = tempfile::tempdir().expect("temp dir");
        let pid_path = directory.path().join("grandchild.pid");
        let script = format!("sleep 30 & echo $! > '{}'; exit 0", pid_path.display());
        let started = Instant::now();
        let error = run(&ProcessSpec::new("/bin/sh").args(["-c", &script]))
            .expect_err("a descendant holding stdout must not be joined forever");
        let elapsed = started.elapsed();
        assert!(
            elapsed >= Duration::from_secs(1),
            "the direct child exits first; drain must wait the grace before failing"
        );
        assert!(elapsed < READER_DRAIN_GRACE + Duration::from_secs(5));
        assert!(
            error.message().contains("stdout"),
            "error must name the stream: {}",
            error.message()
        );

        let pid: libc::pid_t = std::fs::read_to_string(&pid_path)
            .expect("grandchild pid")
            .trim()
            .parse()
            .expect("numeric pid");
        let deadline = Instant::now() + Duration::from_secs(3);
        loop {
            let alive = unsafe { libc::kill(pid, 0) } == 0;
            if !alive {
                break;
            }
            assert!(
                Instant::now() < deadline,
                "process group kill must reap the descendant"
            );
            std::thread::sleep(CANCEL_POLL_INTERVAL);
        }
    }

    #[test]
    fn missing_program_is_a_usage_error() {
        let error = run(&ProcessSpec::new("/definitely/missing/apk-lab-tool"))
            .expect_err("missing program must fail before spawn");
        assert_eq!(error.exit_code(), crate::models::ExitCode::UsageOrToolError);
    }

    #[test]
    fn truncation_boundary_is_exact() {
        let mut input: &[u8] = b"0123456789";
        let output = read_bounded(&mut input, 4).expect("bounded read");
        assert_eq!(output.bytes, b"0123");
        assert!(output.truncated);

        let mut exact: &[u8] = b"0123";
        let output = read_bounded(&mut exact, 4).expect("bounded read");
        assert_eq!(output.bytes, b"0123");
        assert!(!output.truncated);
    }

    #[test]
    #[cfg(unix)]
    fn child_environment_removes_account_material_and_keeps_path() {
        let _lock = test_child_lock();
        std::env::set_var("APKEEP_ACCOUNTS", r#"{"version":1,"accounts":[]}"#);
        std::env::set_var("APKEEP_ACCOUNTS_FILE", "/tmp/accounts.json");
        std::env::set_var("APK_LAB_TEST_REMOVED", "sentinel");
        let spec = ProcessSpec::new("/bin/sh")
            .args(["-c", "env"])
            .remove_env("APK_LAB_TEST_REMOVED");
        let output = run(&spec).expect("env child runs");
        std::env::remove_var("APKEEP_ACCOUNTS");
        std::env::remove_var("APKEEP_ACCOUNTS_FILE");
        std::env::remove_var("APK_LAB_TEST_REMOVED");

        let environment = output.stdout.text_lossy();
        assert!(!environment.contains("APKEEP_ACCOUNTS="), "{environment}");
        assert!(
            !environment.contains("APKEEP_ACCOUNTS_FILE="),
            "{environment}"
        );
        assert!(
            !environment.contains("APK_LAB_TEST_REMOVED="),
            "{environment}"
        );
        assert!(environment.lines().any(|line| line.starts_with("PATH=")));
    }

    #[test]
    fn redaction_removes_every_configured_secret() {
        let spec = ProcessSpec::new("tool")
            .arg("--token")
            .arg("super-secret")
            .secret("super-secret");
        assert!(!spec.describe_command().contains("super-secret"));
        assert!(spec.describe_command().contains(REDACTED));
        assert_eq!(spec.redact("super-secret"), REDACTED);
    }

    #[test]
    fn overlapping_secrets_are_redacted_longest_first() {
        let spec = ProcessSpec::new("tool")
            .secret("abc")
            .secret("abcdef")
            .secret("");
        assert_eq!(spec.redact("abcdef"), REDACTED);
        assert_eq!(spec.redact("abc"), REDACTED);
    }

    #[test]
    fn debug_output_redacts_secrets_and_arguments() {
        let cancel = Arc::new(AtomicBool::new(false));
        let spec = ProcessSpec::new("tool")
            .arg("--token")
            .arg("argv-secret-value")
            .arg("visible")
            .secret("argv-secret-value")
            .secret("unreferenced-secret")
            .cancel(cancel);
        let rendered = format!("{spec:?}");
        assert!(!rendered.contains("argv-secret-value"), "{rendered}");
        assert!(!rendered.contains("unreferenced-secret"), "{rendered}");
        assert!(rendered.contains(REDACTED), "{rendered}");
        assert!(rendered.contains("visible"), "{rendered}");
        assert!(rendered.contains("cancel: Some"), "{rendered}");
    }
}
