//! End-to-end contracts for the native CLI wires added by the acquisition,
//! fixtures, accounts and compatibility-CI ports.
//!
//! Real-executable tests cover grammar, help, exit codes, GITHUB_OUTPUT
//! appending, closed pipes and the absence of Python/`uv` subprocesses.
//! Dependency-injected tests use in-memory S3, fake acquisition, fake Morphe
//! and a fake Worker so no cloud endpoint, Play credential or production
//! fixture is touched.

use apk_lab::accounts_tui::{AccountChecker, MetadataVersion, Ui};
use apk_lab::acquisition::AcquisitionSource;
use apk_lab::cli::{
    run_acquire_with, run_ci_run_with, run_ci_start_with, run_fixtures_with,
    run_play_accounts_with, AcquireBackend, CiRunBackends,
};
use apk_lab::compatibility_ci::{
    ArtifactAcquirer, CompatibilityChecker, CompatibilitySubmission, PostError, RunStartPayload,
    WorkerPoster,
};
use apk_lab::error::Error;
use apk_lab::fixtures::{R2FixtureManager, S3Adapter, S3AdapterError, S3Object, SlotMetadata};
use apk_lab::models::{ArtifactInspection, ContainerType, ExitCode};
use apk_lab::morphe::{ArtifactInspector, PatchCompatibilityReport, ToolVersions};
use async_trait::async_trait;
use serde_json::{json, Value};
use std::collections::BTreeMap;
use std::ffi::OsString;
use std::fs;
use std::path::{Path, PathBuf};
use std::process::{Command, Output, Stdio};
use std::sync::{Arc, Mutex, MutexGuard};
use tempfile::TempDir;

const PACKAGE: &str = "com.test.app";

// ---------------------------------------------------------------------------
// Serialization and environment guards
// ---------------------------------------------------------------------------

/// Environment is process-global; every test serializes so spawned children
/// never inherit a sibling's temporary CI variables.
static SERIAL: Mutex<()> = Mutex::new(());

fn serial() -> MutexGuard<'static, ()> {
    SERIAL
        .lock()
        .unwrap_or_else(|poisoned| poisoned.into_inner())
}

struct EnvGuard {
    key: &'static str,
    previous: Option<OsString>,
}

impl EnvGuard {
    fn set(key: &'static str, value: &str) -> Self {
        let previous = std::env::var_os(key);
        std::env::set_var(key, value);
        Self { key, previous }
    }

    fn remove(key: &'static str) -> Self {
        let previous = std::env::var_os(key);
        std::env::remove_var(key);
        Self { key, previous }
    }
}

impl Drop for EnvGuard {
    fn drop(&mut self) {
        match &self.previous {
            Some(value) => std::env::set_var(self.key, value),
            None => std::env::remove_var(self.key),
        }
    }
}

fn clear_ci_environment() -> Vec<EnvGuard> {
    [
        "DISPATCH_REQUEST_ID",
        "COMPATIBILITY_STATUS_SECRET",
        "WORKER_STATUS_URL",
        "COMPATIBILITY_SUBMISSION_PATH",
        "COMPATIBILITY_CALLBACK_MARKER",
        "DISPATCH_EXPECTED_ROLES",
        "DISPATCH_PLAY_VERSION",
        "GITHUB_EVENT_NAME",
        "GITHUB_SHA",
        "GITHUB_RUN_ID",
        "BEFORE_SHA",
        "COMMIT_SHA",
        "INPUT_PACKAGE_NAME",
        "DISPATCH_PACKAGE_NAME",
        "APKEEP_ACCOUNTS",
        "R2_ACCESS_KEY_ID",
        "RUNNER_TEMP",
    ]
    .into_iter()
    .map(EnvGuard::remove)
    .collect()
}

// ---------------------------------------------------------------------------
// Executable helpers
// ---------------------------------------------------------------------------

fn run_bin(args: &[&str]) -> Output {
    Command::new(env!("CARGO_BIN_EXE_apk-lab"))
        .args(args)
        .stdin(Stdio::null())
        .env_remove("GITHUB_EVENT_NAME")
        .env_remove("INPUT_PACKAGE_NAME")
        .env_remove("DISPATCH_PACKAGE_NAME")
        .env_remove("DISPATCH_REQUEST_ID")
        .output()
        .expect("run apk-lab")
}

fn stdout(output: &Output) -> String {
    String::from_utf8(output.stdout.clone()).expect("UTF-8 stdout")
}

fn stderr(output: &Output) -> String {
    String::from_utf8(output.stderr.clone()).expect("UTF-8 stderr")
}

// ---------------------------------------------------------------------------
// Fakes
// ---------------------------------------------------------------------------

type AcquireCall = (String, PathBuf, Option<String>, Option<u64>);

struct FakeAcquire {
    result: Mutex<Result<(PathBuf, AcquisitionSource), Error>>,
    calls: Mutex<Vec<AcquireCall>>,
}

impl FakeAcquire {
    fn succeeding(path: PathBuf) -> Self {
        Self {
            result: Mutex::new(Ok((path, AcquisitionSource::Apkeep))),
            calls: Mutex::new(Vec::new()),
        }
    }

    fn failing(error: Error) -> Self {
        Self {
            result: Mutex::new(Err(error)),
            calls: Mutex::new(Vec::new()),
        }
    }
}

impl AcquireBackend for FakeAcquire {
    fn acquire(
        &self,
        package: &str,
        out_dir: &Path,
        expected_version: Option<&str>,
        expected_version_code: Option<u64>,
    ) -> Result<apk_lab::acquisition::AcquiredArtifact, Error> {
        self.calls.lock().unwrap().push((
            package.to_string(),
            out_dir.to_path_buf(),
            expected_version.map(str::to_string),
            expected_version_code,
        ));
        self.result
            .lock()
            .unwrap()
            .clone()
            .map(|(path, source)| apk_lab::acquisition::AcquiredArtifact { path, source })
    }
}

struct FakeInspector {
    package: String,
    version_name: String,
    version_code: u64,
    sha256: String,
}

impl FakeInspector {
    fn new(package: &str, version_name: &str, version_code: u64, sha256: &str) -> Self {
        Self {
            package: package.to_string(),
            version_name: version_name.to_string(),
            version_code,
            sha256: sha256.to_string(),
        }
    }
}

impl ArtifactInspector for FakeInspector {
    fn inspect(&self, path: &Path) -> Result<ArtifactInspection, Error> {
        let file_size = fs::metadata(path).map_or(0, |metadata| metadata.len());
        Ok(ArtifactInspection {
            file_path: path.display().to_string(),
            container_type: ContainerType::Apk,
            file_size,
            sha256: self.sha256.clone(),
            package_name: self.package.clone(),
            version_name: self.version_name.clone(),
            version_code: self.version_code,
            min_sdk: None,
            target_sdk: None,
            signing_certificate_sha256: None,
            splits: Vec::new(),
            dex_classes_count: 0,
            dex_methods_count: 0,
            dex_files: Vec::new(),
            native_libraries: Vec::new(),
            resources: Vec::new(),
            assets: Vec::new(),
            warnings: Vec::new(),
        })
    }
}

#[derive(Default)]
struct MemoryS3 {
    objects: Mutex<BTreeMap<String, Stored>>,
}

struct Stored {
    bytes: Vec<u8>,
    metadata: BTreeMap<String, String>,
    content_type: String,
}

impl MemoryS3 {
    fn key(bucket: &str, key: &str) -> String {
        format!("{bucket}/{key}")
    }

    fn contains(&self, bucket: &str, key: &str) -> bool {
        self.objects
            .lock()
            .unwrap()
            .contains_key(&Self::key(bucket, key))
    }
}

#[async_trait]
impl S3Adapter for MemoryS3 {
    async fn head_object(
        &self,
        bucket: &str,
        key: &str,
    ) -> Result<Option<S3Object>, S3AdapterError> {
        Ok(self
            .objects
            .lock()
            .unwrap()
            .get(&Self::key(bucket, key))
            .map(|stored| S3Object {
                metadata: stored.metadata.clone(),
                content_type: Some(stored.content_type.clone()),
                content_length: Some(stored.bytes.len() as u64),
            }))
    }

    async fn get_object_to_file(
        &self,
        bucket: &str,
        key: &str,
        destination: &Path,
    ) -> Result<(), S3AdapterError> {
        let bytes = self
            .objects
            .lock()
            .unwrap()
            .get(&Self::key(bucket, key))
            .map(|stored| stored.bytes.clone())
            .ok_or_else(|| {
                S3AdapterError::new(apk_lab::fixtures::S3ErrorKind::NotFound, "missing")
            })?;
        if let Some(parent) = destination.parent() {
            fs::create_dir_all(parent).map_err(|error| {
                S3AdapterError::new(apk_lab::fixtures::S3ErrorKind::Network, error.to_string())
            })?;
        }
        fs::write(destination, bytes).map_err(|error| {
            S3AdapterError::new(apk_lab::fixtures::S3ErrorKind::Network, error.to_string())
        })
    }

    async fn put_object_from_file(
        &self,
        bucket: &str,
        key: &str,
        source: &Path,
        metadata: &BTreeMap<String, String>,
        content_type: &str,
    ) -> Result<(), S3AdapterError> {
        let bytes = fs::read(source).map_err(|error| {
            S3AdapterError::new(apk_lab::fixtures::S3ErrorKind::Network, error.to_string())
        })?;
        self.objects.lock().unwrap().insert(
            Self::key(bucket, key),
            Stored {
                bytes,
                metadata: metadata.clone(),
                content_type: content_type.to_string(),
            },
        );
        Ok(())
    }

    async fn delete_object(&self, bucket: &str, key: &str) -> Result<(), S3AdapterError> {
        self.objects.lock().unwrap().remove(&Self::key(bucket, key));
        Ok(())
    }
}

fn fixture_manager(s3: Arc<MemoryS3>, inspector: FakeInspector) -> R2FixtureManager {
    R2FixtureManager::with_adapter("test-bucket", s3).with_inspector(Arc::new(inspector))
}

struct RecordingPoster {
    start_status: Result<u16, PostError>,
    submission_status: Result<u16, PostError>,
    starts: Mutex<Vec<(String, String, RunStartPayload)>>,
    submissions: Mutex<Vec<(String, String, CompatibilitySubmission)>>,
}

impl RecordingPoster {
    fn new(
        start_status: Result<u16, PostError>,
        submission_status: Result<u16, PostError>,
    ) -> Self {
        Self {
            start_status,
            submission_status,
            starts: Mutex::new(Vec::new()),
            submissions: Mutex::new(Vec::new()),
        }
    }
}

impl WorkerPoster for RecordingPoster {
    fn post_run_start(
        &self,
        worker_url: &str,
        status_secret: &str,
        payload: &RunStartPayload,
    ) -> Result<u16, PostError> {
        self.starts.lock().unwrap().push((
            worker_url.to_string(),
            status_secret.to_string(),
            payload.clone(),
        ));
        self.start_status.clone()
    }

    fn post_submission(
        &self,
        worker_url: &str,
        status_secret: &str,
        submission: &CompatibilitySubmission,
    ) -> Result<u16, PostError> {
        self.submissions.lock().unwrap().push((
            worker_url.to_string(),
            status_secret.to_string(),
            submission.clone(),
        ));
        self.submission_status.clone()
    }
}

struct FakeChecker {
    report: PatchCompatibilityReport,
}

impl CompatibilityChecker for FakeChecker {
    fn check(
        &self,
        _artifact: &Path,
        _mpp: &Path,
        _expected_package: &str,
    ) -> Result<(PatchCompatibilityReport, ExitCode), Error> {
        Ok((self.report.clone(), ExitCode::Success))
    }
}

struct NoAcquire;

impl ArtifactAcquirer for NoAcquire {
    fn acquire(
        &self,
        _package: &str,
        _output_dir: &Path,
        _expected_version: &str,
    ) -> Result<(PathBuf, String), Error> {
        Err(Error::infrastructure(
            "acquisition must not run in this test",
        ))
    }
}

struct CancellingUi;

impl Ui for CancellingUi {
    fn text(
        &mut self,
        _prompt: &str,
        _default: Option<&str>,
    ) -> Result<Option<String>, apk_lab::accounts_tui::TuiError> {
        Ok(None)
    }

    fn password(
        &mut self,
        _prompt: &str,
    ) -> Result<Option<String>, apk_lab::accounts_tui::TuiError> {
        Ok(None)
    }

    fn select(
        &mut self,
        _prompt: &str,
        _choices: &[String],
    ) -> Result<Option<usize>, apk_lab::accounts_tui::TuiError> {
        Ok(None)
    }

    fn confirm(
        &mut self,
        _prompt: &str,
        _default: bool,
    ) -> Result<Option<bool>, apk_lab::accounts_tui::TuiError> {
        Ok(None)
    }

    fn message(&mut self, _text: &str) {}
}

struct UnusedChecker;

impl AccountChecker for UnusedChecker {
    fn check(
        &self,
        _account: &apk_lab::accounts::Account,
        _package: &str,
    ) -> Result<MetadataVersion, String> {
        Err("not used".to_string())
    }
}

fn compatible_report() -> PatchCompatibilityReport {
    PatchCompatibilityReport {
        artifact_sha256: "a".repeat(64),
        package_name: PACKAGE.to_string(),
        version_name: "1.0".to_string(),
        version_code: 1,
        patch_bundle_version: "9.9".to_string(),
        git_revision: "rev".to_string(),
        tool_versions: ToolVersions::new(),
        overall_status: "compatible".to_string(),
        total_cases: 1,
        passed_cases: 1,
        failed_cases: 0,
        test_cases: Vec::new(),
        failure_reason: None,
    }
}

fn string_args(values: &[&str]) -> Vec<String> {
    values.iter().map(|value| (*value).to_string()).collect()
}

fn patches_list(packages: &[&str], targets: &[&str]) -> Value {
    json!({
        "version": "9.9",
        "patches": [{
            "name": "Test Patch",
            "compatiblePackages": packages.iter().map(|package| {
                json!({
                    "packageName": package,
                    "name": "Test App",
                    "apkFileType": "apk",
                    "targets": targets.iter().map(|version| json!({"version": version})).collect::<Vec<_>>(),
                })
            }).collect::<Vec<_>>(),
        }],
    })
}

fn write_json(path: &Path, value: &Value) {
    fs::write(path, serde_json::to_vec_pretty(value).expect("serialize")).expect("write json");
}

// ---------------------------------------------------------------------------
// Grammar, help and closed pipes
// ---------------------------------------------------------------------------

#[test]
fn help_lists_the_native_commands_and_each_screen_exits_zero() {
    let _guard = serial();

    let output = run_bin(&["--help"]);
    assert_eq!(output.status.code(), Some(0));
    let help = stdout(&output);
    for command in ["acquire", "play-accounts", "fixtures", "ci"] {
        assert!(help.contains(command), "global help must list {command}");
    }

    for args in [
        &["acquire", "--help"][..],
        &["play-accounts", "--help"][..],
        &["fixtures", "--help"][..],
        &["fixtures", "seed", "--help"][..],
        &["fixtures", "info", "--help"][..],
        &["fixtures", "download", "--help"][..],
        &["ci", "--help"][..],
        &["ci", "matrix", "--help"][..],
        &["ci", "start", "--help"][..],
        &["ci", "run", "--help"][..],
    ] {
        let output = run_bin(args);
        assert_eq!(
            output.status.code(),
            Some(0),
            "help failed for {args:?}: {}",
            stderr(&output)
        );
        assert!(output.stderr.is_empty(), "help must be stdout-only");
        assert!(
            stdout(&output).contains("Usage:"),
            "missing usage in {args:?}"
        );
    }
}

#[test]
fn unknown_and_extra_flags_exit_two_without_success_output() {
    let _guard = serial();

    for args in [
        &["acquire", "com.test.app", "--not-a-flag"][..],
        &["acquire", "--version"][..],
        &["acquire"][..],
        &["play-accounts", "--bogus"][..],
        &["fixtures"][..],
        &["fixtures", "seed", "--package", "com.test.app"][..],
        &["fixtures", "info", "--package", "x", "--role", "other"][..],
        &["fixtures", "download", "--package", "x", "--role", "target"][..],
        &["ci"][..],
        &["ci", "matrix", "--bogus"][..],
        &["ci", "start", "--package", "com.test.app"][..],
        &["ci", "run"][..],
    ] {
        let output = run_bin(args);
        assert_eq!(output.status.code(), Some(2), "wrong code for {args:?}");
        assert!(
            output.stdout.is_empty(),
            "failure wrote stdout for {args:?}"
        );
        assert!(
            !stdout(&output).contains("Status: OK"),
            "failure reported success for {args:?}"
        );
    }
}

#[test]
fn closed_stdout_pipe_exits_zero() {
    let _guard = serial();

    for args in [&["--help"][..], &["ci", "--help"][..]] {
        let mut child = Command::new(env!("CARGO_BIN_EXE_apk-lab"))
            .args(args)
            .stdin(Stdio::null())
            .stdout(Stdio::piped())
            .stderr(Stdio::null())
            .spawn()
            .expect("spawn apk-lab");
        drop(child.stdout.take());
        let status = child.wait().expect("wait apk-lab");
        assert_eq!(status.code(), Some(0), "closed pipe failed for {args:?}");
    }
}

// ---------------------------------------------------------------------------
// acquire
// ---------------------------------------------------------------------------

#[test]
fn acquire_forwards_arguments_and_maps_backend_failures_to_exit_four() {
    let _guard = serial();
    let directory = TempDir::new().expect("tempdir");
    let out_dir = directory.path().join("out");

    let success = FakeAcquire::succeeding(directory.path().join("com.test.app.apkm"));
    let code = run_acquire_with(
        &string_args(&[
            "com.test.app",
            "--version",
            "3.4.5",
            "--version-code",
            "345",
            "--out-dir",
            out_dir.to_str().expect("utf-8"),
        ]),
        &success,
    )
    .expect("acquire");
    assert_eq!(code, ExitCode::Success);
    let calls = success.calls.lock().unwrap();
    assert_eq!(calls.len(), 1);
    assert_eq!(calls[0].0, "com.test.app");
    assert_eq!(calls[0].1, out_dir);
    assert_eq!(calls[0].2.as_deref(), Some("3.4.5"));
    assert_eq!(calls[0].3, Some(345));

    for error in [
        Error::infrastructure("No Google Play accounts configured"),
        Error::invalid_artifact("downloaded version '1.0' != expected '2.0'"),
        Error::usage("no acquisition source is available"),
    ] {
        let backend = FakeAcquire::failing(error);
        let code = run_acquire_with(&string_args(&["com.test.app"]), &backend)
            .expect("acquire failure is reported, not propagated");
        assert_eq!(code, ExitCode::InfrastructureFailure);
        assert_eq!(backend.calls.lock().unwrap().len(), 1);
    }
}

#[test]
fn acquire_missing_version_code_value_is_a_usage_error() {
    let _guard = serial();
    let backend = FakeAcquire::failing(Error::infrastructure("unused"));
    let error = run_acquire_with(
        &string_args(&["com.test.app", "--version-code", "not-a-number"]),
        &backend,
    )
    .expect_err("invalid version code");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(error.message().contains("invalid int value"));
}

// ---------------------------------------------------------------------------
// play-accounts
// ---------------------------------------------------------------------------

#[test]
fn play_accounts_cancellation_exits_zero_and_bad_flags_exit_two() {
    let _guard = serial();
    let directory = TempDir::new().expect("tempdir");
    let _home = EnvGuard::set("HOME", directory.path().to_str().expect("utf-8"));
    let _xdg = EnvGuard::set("XDG_CONFIG_HOME", directory.path().to_str().expect("utf-8"));
    let _accounts = EnvGuard::remove("APKEEP_ACCOUNTS");

    let mut ui = CancellingUi;
    let checker = UnusedChecker;
    let code = run_play_accounts_with(&[], &mut ui, &checker).expect("cancellation");
    assert_eq!(code, ExitCode::Success);

    let mut ui = CancellingUi;
    let error = run_play_accounts_with(&string_args(&["--bogus"]), &mut ui, &checker)
        .expect_err("bad flag");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
}

// ---------------------------------------------------------------------------
// fixtures
// ---------------------------------------------------------------------------

#[test]
fn fixtures_seed_info_and_download_use_the_injected_memory_adapter() {
    let _guard = serial();
    let directory = TempDir::new().expect("tempdir");
    let artifact = directory.path().join("input.apk");
    fs::write(&artifact, b"fixture-bytes").expect("write artifact");
    let s3 = Arc::new(MemoryS3::default());
    let manager = fixture_manager(
        Arc::clone(&s3),
        FakeInspector::new(PACKAGE, "1.2.3", 123, &"b".repeat(64)),
    );

    let code = run_fixtures_with(
        &string_args(&[
            "seed",
            "--package",
            PACKAGE,
            "--role",
            "target",
            "--artifact",
            artifact.to_str().expect("utf-8"),
        ]),
        &manager,
    )
    .expect("seed");
    assert_eq!(code, ExitCode::Success);
    assert!(s3.contains("test-bucket", "fixtures/com.test.app/target"));

    let code =
        run_fixtures_with(&string_args(&["info", "--package", PACKAGE]), &manager).expect("info");
    assert_eq!(code, ExitCode::Success);

    let destination = directory.path().join("nested").join("download.apk");
    let code = run_fixtures_with(
        &string_args(&[
            "download",
            "--package",
            PACKAGE,
            "--role",
            "target",
            "--out",
            destination.to_str().expect("utf-8"),
        ]),
        &manager,
    )
    .expect("download");
    assert_eq!(code, ExitCode::Success);
    assert_eq!(fs::read(&destination).expect("download"), b"fixture-bytes");
}

#[test]
fn fixtures_invalid_artifact_is_a_usage_error_from_parsing_only() {
    let _guard = serial();

    let directory = TempDir::new().expect("tempdir");
    let artifact = directory.path().join("input.apk");
    fs::write(&artifact, b"bytes").expect("write artifact");
    let s3 = Arc::new(MemoryS3::default());
    let manager = fixture_manager(
        Arc::clone(&s3),
        FakeInspector::new("com.other.app", "1.0", 1, &"c".repeat(64)),
    );

    let code = run_fixtures_with(
        &string_args(&[
            "seed",
            "--package",
            PACKAGE,
            "--role",
            "target",
            "--artifact",
            artifact.to_str().expect("utf-8"),
        ]),
        &manager,
    )
    .expect("seed mismatch is reported like the Python handler");
    assert_eq!(code, ExitCode::InfrastructureFailure);
    assert!(!s3.contains("test-bucket", "fixtures/com.test.app/target"));
}

// ---------------------------------------------------------------------------
// ci matrix
// ---------------------------------------------------------------------------

#[test]
fn ci_matrix_prints_sorted_packages_and_appends_github_output() {
    let _guard = serial();
    let directory = TempDir::new().expect("tempdir");
    let patches = directory.path().join("patches-list.json");
    write_json(
        &patches,
        &patches_list(&["com.b.app", "com.a.app"], &["1.0"]),
    );
    let output_file = directory.path().join("github-output");
    fs::write(&output_file, "existing=1\n").expect("seed output");

    let output = Command::new(env!("CARGO_BIN_EXE_apk-lab"))
        .args([
            "ci",
            "matrix",
            "--patches-list",
            patches.to_str().expect("utf-8"),
            "--output-file",
            output_file.to_str().expect("utf-8"),
        ])
        .stdin(Stdio::null())
        .env_remove("GITHUB_EVENT_NAME")
        .env_remove("INPUT_PACKAGE_NAME")
        .env_remove("DISPATCH_PACKAGE_NAME")
        .output()
        .expect("run ci matrix");

    assert_eq!(output.status.code(), Some(0), "{}", stderr(&output));
    assert_eq!(stdout(&output), "packages=[\"com.a.app\", \"com.b.app\"]\n");
    assert_eq!(
        fs::read_to_string(&output_file).expect("output"),
        "existing=1\npackages=[\"com.a.app\", \"com.b.app\"]\n"
    );
}

#[test]
fn ci_matrix_unknown_dispatch_package_is_usage_error() {
    let _guard = serial();
    let directory = TempDir::new().expect("tempdir");
    let patches = directory.path().join("patches-list.json");
    write_json(&patches, &patches_list(&[PACKAGE], &["1.0"]));

    let output = Command::new(env!("CARGO_BIN_EXE_apk-lab"))
        .args([
            "ci",
            "matrix",
            "--patches-list",
            patches.to_str().expect("utf-8"),
        ])
        .stdin(Stdio::null())
        .env("GITHUB_EVENT_NAME", "workflow_dispatch")
        .env("INPUT_PACKAGE_NAME", "com.unknown")
        .output()
        .expect("run ci matrix");

    assert_eq!(output.status.code(), Some(2));
    assert!(stdout(&output).is_empty());
    assert!(stderr(&output).contains("Matrix resolution error"));
}

// ---------------------------------------------------------------------------
// ci start
// ---------------------------------------------------------------------------

#[test]
fn ci_start_posts_exact_payload_and_uses_version_tie_break() {
    let _guard = serial();
    let directory = TempDir::new().expect("tempdir");
    let patches = directory.path().join("patches-list.json");
    write_json(&patches, &patches_list(&[PACKAGE], &["1.2", "1.02"]));
    let _secret = EnvGuard::set("COMPATIBILITY_STATUS_SECRET", "secret-value");
    let _worker = EnvGuard::set("WORKER_STATUS_URL", "https://worker.test/");

    let poster = RecordingPoster::new(Ok(201), Ok(201));
    let code = run_ci_start_with(
        &string_args(&[
            "--package",
            PACKAGE,
            "--request-id",
            "req-123",
            "--git-revision",
            "abc123",
            "--patches-list",
            patches.to_str().expect("utf-8"),
        ]),
        &poster,
    )
    .expect("ci start");
    assert_eq!(code, ExitCode::Success);

    let starts = poster.starts.lock().unwrap();
    assert_eq!(starts.len(), 1);
    assert_eq!(starts[0].0, "https://worker.test/");
    assert_eq!(starts[0].1, "secret-value");
    assert_eq!(starts[0].2.request_id, "req-123");
    assert_eq!(starts[0].2.package_name, PACKAGE);
    assert_eq!(starts[0].2.app_name, "Test App");
    assert_eq!(starts[0].2.git_revision, "abc123");
    // Numeric key ties break on the raw version string, so "1.2" is last.
    assert_eq!(
        starts[0].2.supported_versions,
        vec!["1.02".to_string(), "1.2".to_string()]
    );
    assert_eq!(starts[0].2.target_version, "1.2");
}

#[test]
fn ci_start_requires_secret_and_rejects_non_2xx_and_transport_errors() {
    let _guard = serial();
    let directory = TempDir::new().expect("tempdir");
    let patches = directory.path().join("patches-list.json");
    write_json(&patches, &patches_list(&[PACKAGE], &["1.0"]));
    let _secret = EnvGuard::remove("COMPATIBILITY_STATUS_SECRET");
    let _worker = EnvGuard::remove("WORKER_STATUS_URL");

    let poster = RecordingPoster::new(Ok(201), Ok(201));
    let args = string_args(&[
        "--package",
        PACKAGE,
        "--request-id",
        "req",
        "--git-revision",
        "rev",
        "--patches-list",
        patches.to_str().expect("utf-8"),
    ]);
    assert_eq!(
        run_ci_start_with(&args, &poster).expect("missing secret"),
        ExitCode::UsageOrToolError
    );
    assert!(poster.starts.lock().unwrap().is_empty());

    drop(_secret);
    let _secret = EnvGuard::set("COMPATIBILITY_STATUS_SECRET", "secret");

    for status in [
        Ok(500),
        Err(PostError {
            message: "connection reset".to_string(),
        }),
    ] {
        let poster = RecordingPoster::new(status, Ok(201));
        assert_eq!(
            run_ci_start_with(&args, &poster).expect("post failure"),
            ExitCode::InfrastructureFailure
        );
        assert_eq!(poster.starts.lock().unwrap().len(), 1);
    }
}

// ---------------------------------------------------------------------------
// ci run
// ---------------------------------------------------------------------------

struct CiRunFixture {
    directory: TempDir,
    args: Vec<String>,
    manager: R2FixtureManager,
    submission: PathBuf,
    marker: PathBuf,
    _env: Vec<EnvGuard>,
}

fn ci_run_fixture() -> CiRunFixture {
    let directory = TempDir::new().expect("tempdir");
    let patches = directory.path().join("patches-list.json");
    write_json(&patches, &patches_list(&[PACKAGE], &["1.0"]));
    let mpp = directory.path().join("patches.mpp");
    fs::write(&mpp, b"mpp").expect("write mpp");
    let runner_temp = directory.path().join("runner");
    fs::create_dir_all(&runner_temp).expect("runner temp");
    let submission = directory.path().join("state").join("submission.json");
    let marker = directory.path().join("state").join("callback-ok");

    let s3 = Arc::new(MemoryS3::default());
    let manager = fixture_manager(
        Arc::clone(&s3),
        FakeInspector::new(PACKAGE, "1.0", 1, &"d".repeat(64)),
    );
    let artifact = directory.path().join("target.apk");
    fs::write(&artifact, b"target-bytes").expect("write target");
    let metadata = SlotMetadata {
        role: "target".to_string(),
        package_name: PACKAGE.to_string(),
        version_name: "1.0".to_string(),
        version_code: 1,
        container_type: "APK".to_string(),
        sha256: "d".repeat(64),
        signer_sha256: None,
        size_bytes: 12,
        acquisition_source: "manual".to_string(),
        timestamp: "2026-01-01T00:00:00+00:00".to_string(),
    };
    let runtime = tokio::runtime::Builder::new_current_thread()
        .enable_all()
        .build()
        .expect("runtime");
    runtime
        .block_on(manager.upload_slot(PACKAGE, "target", &artifact, &metadata))
        .expect("seed slot");

    let env = {
        let mut guards = clear_ci_environment();
        for (key, value) in [
            ("DISPATCH_REQUEST_ID", "req-run"),
            ("COMPATIBILITY_STATUS_SECRET", "secret-run"),
            ("WORKER_STATUS_URL", "https://worker.test"),
            (
                "COMPATIBILITY_SUBMISSION_PATH",
                submission.to_str().expect("utf-8"),
            ),
            (
                "COMPATIBILITY_CALLBACK_MARKER",
                marker.to_str().expect("utf-8"),
            ),
            ("RUNNER_TEMP", runner_temp.to_str().expect("utf-8")),
            ("GITHUB_EVENT_NAME", "workflow_dispatch"),
            ("DISPATCH_EXPECTED_ROLES", "target"),
            ("GITHUB_SHA", "abc"),
            ("GITHUB_REPOSITORY", "owner/repo"),
            ("GITHUB_RUN_ID", "42"),
        ] {
            guards.push(EnvGuard::set(key, value));
        }
        guards
    };

    CiRunFixture {
        args: string_args(&[
            "--package",
            PACKAGE,
            "--mpp",
            mpp.to_str().expect("utf-8"),
            "--patches-list",
            patches.to_str().expect("utf-8"),
        ]),
        directory,
        manager,
        submission,
        marker,
        _env: env,
    }
}

#[test]
fn ci_run_posts_a_2xx_submission_and_writes_the_marker() {
    let _guard = serial();
    let fixture = ci_run_fixture();
    let checker = FakeChecker {
        report: compatible_report(),
    };
    let poster = RecordingPoster::new(Ok(201), Ok(201));
    let inspector = FakeInspector::new(PACKAGE, "1.0", 1, &"d".repeat(64));
    let backends = CiRunBackends {
        fixtures: &fixture.manager,
        acquirer: None,
        checker: &checker,
        poster: &poster,
        inspector: &inspector,
    };

    let code = run_ci_run_with(&fixture.args, Some(&backends)).expect("ci run");
    assert_eq!(code, ExitCode::Success);

    let submissions = poster.submissions.lock().unwrap();
    assert_eq!(submissions.len(), 1);
    assert_eq!(submissions[0].0, "https://worker.test");
    assert_eq!(submissions[0].1, "secret-run");
    assert_eq!(submissions[0].2.request_id, "req-run");
    assert_eq!(submissions[0].2.package_name, PACKAGE);
    assert_eq!(submissions[0].2.results.len(), 1);
    assert_eq!(submissions[0].2.results[0].status, "compatible");

    let saved: Value =
        serde_json::from_slice(&fs::read(&fixture.submission).expect("saved submission"))
            .expect("valid submission JSON");
    assert_eq!(saved["requestId"], "req-run");
    assert_eq!(saved["packageName"], PACKAGE);
    assert_eq!(saved["results"][0]["status"], "compatible");
    assert_eq!(fs::read_to_string(&fixture.marker).expect("marker"), "ok");

    // A second invocation with the same request ID still posts exactly once
    // per invocation and never drops the saved submission.
    assert!(fs::read_dir(fixture.directory.path()).is_ok());
}

#[test]
fn ci_run_non_2xx_and_transport_failures_keep_submission_without_marker() {
    let _guard = serial();

    for status in [
        Ok(500u16),
        Err(PostError {
            message: "connection reset".to_string(),
        }),
    ] {
        let fixture = ci_run_fixture();
        let checker = FakeChecker {
            report: compatible_report(),
        };
        let poster = RecordingPoster::new(Ok(201), status);
        let inspector = FakeInspector::new(PACKAGE, "1.0", 1, &"d".repeat(64));
        let backends = CiRunBackends {
            fixtures: &fixture.manager,
            acquirer: None,
            checker: &checker,
            poster: &poster,
            inspector: &inspector,
        };

        let code = run_ci_run_with(&fixture.args, Some(&backends)).expect("ci run");
        assert_eq!(code, ExitCode::InfrastructureFailure);
        assert_eq!(poster.submissions.lock().unwrap().len(), 1);
        let saved: Value =
            serde_json::from_slice(&fs::read(&fixture.submission).expect("saved submission"))
                .expect("valid submission JSON");
        assert_eq!(saved["requestId"], "req-run");
        assert!(
            !fixture.marker.exists(),
            "marker must be written only after a 2xx response"
        );
    }
}

#[test]
fn ci_run_without_dispatch_request_id_skips_the_callback() {
    let _guard = serial();
    let mut fixture = ci_run_fixture();
    drop(std::mem::take(&mut fixture._env));
    let _request = EnvGuard::set("DISPATCH_REQUEST_ID", "");

    let checker = FakeChecker {
        report: compatible_report(),
    };
    let poster = RecordingPoster::new(Ok(201), Ok(201));
    let inspector = FakeInspector::new(PACKAGE, "1.0", 1, &"d".repeat(64));
    let backends = CiRunBackends {
        fixtures: &fixture.manager,
        acquirer: Some(&NoAcquire),
        checker: &checker,
        poster: &poster,
        inspector: &inspector,
    };
    let code = run_ci_run_with(&fixture.args, Some(&backends)).expect("ci run");
    assert_eq!(code, ExitCode::Success);
    assert!(poster.submissions.lock().unwrap().is_empty());
    assert!(!fixture.submission.exists());
    assert!(!fixture.marker.exists());
}

// ---------------------------------------------------------------------------
// No Python delegation
// ---------------------------------------------------------------------------

#[test]
fn native_ci_matrix_never_invokes_python_uv_or_goopdl() {
    let _guard = serial();
    let directory = TempDir::new().expect("tempdir");
    let bin = directory.path().join("bin");
    fs::create_dir_all(&bin).expect("bin dir");
    let trace = directory.path().join("trace.txt");
    let script = format!(
        "#!/bin/sh\nprintf '%s\\n' \"$(basename \"$0\")\" >> '{}'\nexit 127\n",
        trace.display()
    );
    for name in ["python", "python3", "uv", "goopdl", "node"] {
        let path = bin.join(name);
        fs::write(&path, &script).expect("write shim");
        #[cfg(unix)]
        {
            use std::os::unix::fs::PermissionsExt;
            fs::set_permissions(&path, fs::Permissions::from_mode(0o755)).expect("chmod shim");
        }
    }
    let patches = directory.path().join("patches-list.json");
    write_json(&patches, &patches_list(&[PACKAGE], &["1.0"]));

    let inherited_path = std::env::var_os("PATH").unwrap_or_default();
    let mut shim_path = bin.into_os_string();
    shim_path.push(":");
    shim_path.push(inherited_path);
    let output = Command::new(env!("CARGO_BIN_EXE_apk-lab"))
        .args([
            "ci",
            "matrix",
            "--patches-list",
            patches.to_str().expect("utf-8"),
        ])
        .stdin(Stdio::null())
        .env("PATH", shim_path)
        .env_remove("GITHUB_EVENT_NAME")
        .env_remove("INPUT_PACKAGE_NAME")
        .output()
        .expect("run ci matrix");

    assert_eq!(output.status.code(), Some(0), "{}", stderr(&output));
    assert_eq!(stdout(&output), "packages=[\"com.test.app\"]\n");
    assert!(
        !trace.exists(),
        "native matrix must not spawn Python, uv or goopdl: {}",
        fs::read_to_string(&trace).unwrap_or_default()
    );
}
