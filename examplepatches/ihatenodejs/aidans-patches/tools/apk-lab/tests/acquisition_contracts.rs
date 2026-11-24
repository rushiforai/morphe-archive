//! Acquisition contracts: routing, account rotation, retries, version
//! validation, deterministic normalization and failed-attempt cleanup.
//!
//! Every provider, command, and inspector is a fake. No test invokes Python,
//! `uv`, `goopdl`, a real device, a network service, or an Android build tool.

use apk_lab::acquisition::{
    acquire_artifact, apkmirror_mapping, build_apkeep_args, build_apkmirror_args, load_accounts,
    normalize_apks_to_apkm, parse_accounts_document, percent_encode, sanitize_diagnostic,
    AccountConfig, AccountsEnvironment, AcquiredArtifact, Acquirer, ApkBadger, ApkeepAcquirer,
    ApkeepProvider, ApkeepTool, ApkmirrorAcquirer, ApkmirrorProvider, ArtifactInspector,
    ArtifactVersion, CommandOutcome, CommandRunner, NodeRuntime, PlayAcquirer, PlayAuth,
    PlayProvider, ProviderRequest, Redactor, RetryPolicy, STDERR_DIAGNOSTIC_LIMIT,
};
use apk_lab::error::Error;
use apk_lab::models::{AndroidManifestInfo, ExitCode};
use apk_lab::play::{
    read_dispenser_response, AccountConfig as PlayAccountConfig, AuthContext, PlayBackend,
    PlaySession, VersionInfo, MAX_DISPENSER_RESPONSE_BYTES,
};
use apk_lab::process::ProcessSpec;
use apk_lab::workspace::validate_package_name;
use std::cell::{Cell, RefCell};
use std::collections::HashMap;
use std::fs;
use std::future::Future;
use std::io::{Cursor, Read, Write};
use std::path::{Path, PathBuf};
use std::pin::Pin;
use std::time::{Duration, Instant};
use tempfile::TempDir;
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipArchive, ZipWriter};

const TOKEN: &str = "aas_et/super-secret-token-value";
const EMAIL: &str = "Primary.User@Example.com";
const PACKAGE: &str = "com.test.pkg";

fn account(label: &str, token: &str, enabled: bool) -> AccountConfig {
    AccountConfig {
        label: label.to_string(),
        email: format!("{label}@example.com"),
        aas_token: token.to_string(),
        device: "px_9a".to_string(),
        locale: "en_US".to_string(),
        timezone: "UTC".to_string(),
        enabled,
    }
}

fn request<'a>(out_dir: &'a Path) -> ProviderRequest<'a> {
    ProviderRequest {
        package_name: PACKAGE,
        out_dir,
        expected_version: None,
        expected_version_code: None,
    }
}

fn write_apk(path: &Path, bytes: &[u8]) {
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent).expect("create apk parent");
    }
    fs::write(path, bytes).expect("write apk");
}

fn zip_bytes(entries: &[(&str, &[u8])]) -> Vec<u8> {
    let mut writer = ZipWriter::new(Cursor::new(Vec::new()));
    for (name, bytes) in entries {
        writer
            .start_file(*name, SimpleFileOptions::default())
            .expect("start zip entry");
        writer.write_all(bytes).expect("write zip entry");
    }
    writer.finish().expect("finish zip").into_inner()
}

fn sha256(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    let mut hasher = Sha256::new();
    hasher.update(bytes);
    format!("{:x}", hasher.finalize())
}

fn entry_names(path: &Path) -> Vec<String> {
    let mut archive = ZipArchive::new(fs::File::open(path).expect("open zip")).expect("read zip");
    (0..archive.len())
        .map(|index| {
            archive
                .by_index(index)
                .expect("zip member")
                .name()
                .expect("zip member name")
                .to_string()
        })
        .collect()
}

fn read_member(path: &Path, name: &str) -> Vec<u8> {
    let mut archive = ZipArchive::new(fs::File::open(path).expect("open zip")).expect("read zip");
    let mut member = archive.by_name(name).expect("member exists");
    let mut bytes = Vec::new();
    member.read_to_end(&mut bytes).expect("read member");
    bytes
}

fn dir_entries(path: &Path) -> Vec<String> {
    let mut names: Vec<String> = fs::read_dir(path)
        .map(|entries| {
            entries
                .filter_map(Result::ok)
                .map(|entry| entry.file_name().to_string_lossy().into_owned())
                .collect()
        })
        .unwrap_or_default();
    names.sort();
    names
}

// ---------------------------------------------------------------------------
// Fakes
// ---------------------------------------------------------------------------

#[derive(Default)]
struct FakeBadger {
    infos: HashMap<String, AndroidManifestInfo>,
    failures: HashMap<String, Error>,
}

impl FakeBadger {
    fn base(name: &str) -> Self {
        let mut infos = HashMap::new();
        infos.insert(
            name.to_string(),
            AndroidManifestInfo {
                package_name: PACKAGE.to_string(),
                version_code: 100,
                version_name: "1.0.0".to_string(),
                min_sdk_version: None,
                target_sdk_version: None,
                permissions: Vec::new(),
                components: Vec::new(),
                split_name: None,
            },
        );
        Self {
            infos,
            ..Self::default()
        }
    }

    fn with_split(mut self, name: &str, split: &str) -> Self {
        self.infos.insert(
            name.to_string(),
            AndroidManifestInfo {
                package_name: PACKAGE.to_string(),
                version_code: 100,
                version_name: "1.0.0".to_string(),
                min_sdk_version: None,
                target_sdk_version: None,
                permissions: Vec::new(),
                components: Vec::new(),
                split_name: Some(split.to_string()),
            },
        );
        self
    }
}

impl ApkBadger for FakeBadger {
    fn badging(&self, apk: &Path) -> Result<AndroidManifestInfo, Error> {
        let name = apk
            .file_name()
            .map(|name| name.to_string_lossy().into_owned())
            .unwrap_or_default();
        if let Some(error) = self.failures.get(&name) {
            return Err(error.clone());
        }
        self.infos
            .get(&name)
            .cloned()
            .ok_or_else(|| Error::invalid_artifact(format!("no fake badging for {name}")))
    }
}

struct FakeInspector {
    version: ArtifactVersion,
    failure: Option<Error>,
    seen: RefCell<Vec<PathBuf>>,
}

impl FakeInspector {
    fn new(name: &str, code: u64) -> Self {
        Self {
            version: ArtifactVersion {
                version_name: name.to_string(),
                version_code: code,
            },
            failure: None,
            seen: RefCell::new(Vec::new()),
        }
    }
}

impl ArtifactInspector for FakeInspector {
    fn version(&self, artifact: &Path) -> Result<ArtifactVersion, Error> {
        self.seen.borrow_mut().push(artifact.to_path_buf());
        match &self.failure {
            Some(error) => Err(error.clone()),
            None => Ok(self.version.clone()),
        }
    }
}

impl FakeInspector {
    fn failing(mut self, error: Error) -> Self {
        self.failure = Some(error);
        self
    }
}

#[derive(Clone)]
enum RunnerBehavior {
    WriteBase,
    WriteBundle,
    Fail(String),
    Timeout,
}

#[derive(Default)]
struct RecordingRunner {
    behavior: Option<RunnerBehavior>,
    programs: RefCell<Vec<String>>,
    args: RefCell<Vec<Vec<String>>>,
    timeouts: RefCell<Vec<Duration>>,
    #[cfg(unix)]
    private_modes: RefCell<Vec<u32>>,
}

impl RecordingRunner {
    fn new(behavior: RunnerBehavior) -> Self {
        Self {
            behavior: Some(behavior),
            ..Self::default()
        }
    }
}

impl CommandRunner for RecordingRunner {
    fn run(
        &self,
        program: &Path,
        args: &[String],
        _cwd: Option<&Path>,
        timeout: Duration,
        _secrets: &[String],
    ) -> Result<CommandOutcome, String> {
        self.programs
            .borrow_mut()
            .push(program.to_string_lossy().into_owned());
        self.args.borrow_mut().push(args.to_vec());
        self.timeouts.borrow_mut().push(timeout);
        let attempt = Path::new(args.last().expect("attempt arg"));
        #[cfg(unix)]
        {
            use std::os::unix::fs::PermissionsExt;
            if let Ok(entries) = fs::read_dir(attempt) {
                for entry in entries.filter_map(Result::ok) {
                    if entry.file_name() == "credentials.ini" {
                        let mode = entry
                            .metadata()
                            .expect("credentials metadata")
                            .permissions()
                            .mode()
                            & 0o777;
                        self.private_modes.borrow_mut().push(mode);
                    }
                }
            }
        }
        let behavior = self.behavior.clone().expect("runner behavior");
        match behavior {
            RunnerBehavior::WriteBase => {
                let attempt = Path::new(args.last().expect("attempt arg"));
                write_apk(&attempt.join("base.apk"), b"base-bytes");
                Ok(success())
            }
            RunnerBehavior::WriteBundle => {
                let attempt = Path::new(args.last().expect("attempt arg"));
                fs::create_dir_all(attempt).expect("attempt dir");
                fs::write(
                    attempt.join("download.apkm"),
                    zip_bytes(&[("nested/base.apk", b"nested-base")]),
                )
                .expect("write bundle");
                Ok(success())
            }
            RunnerBehavior::Fail(stderr) => Ok(CommandOutcome {
                success: false,
                exit_code: Some(1),
                stdout: String::new(),
                stderr,
                timed_out: false,
            }),
            RunnerBehavior::Timeout => Ok(CommandOutcome {
                success: false,
                exit_code: None,
                stdout: String::new(),
                stderr: String::new(),
                timed_out: true,
            }),
        }
    }
}

fn success() -> CommandOutcome {
    CommandOutcome {
        success: true,
        exit_code: Some(0),
        stdout: String::new(),
        stderr: String::new(),
        timed_out: false,
    }
}

struct FakeApkeepTool {
    available: bool,
}

impl ApkeepTool for FakeApkeepTool {
    fn command(&self) -> Result<(PathBuf, Vec<String>), Error> {
        if self.available {
            Ok((PathBuf::from("/fake/bin/apkeep"), Vec::new()))
        } else {
            Err(Error::usage("apkeep is not installed"))
        }
    }
}

struct FakeNode {
    path: Option<PathBuf>,
}

impl NodeRuntime for FakeNode {
    fn locate(&self) -> Option<PathBuf> {
        self.path.clone()
    }
}

struct ScriptedApkeep {
    available: bool,
    outcomes: RefCell<Vec<Result<(), Error>>>,
    calls: RefCell<Vec<String>>,
}

impl ScriptedApkeep {
    fn new(outcomes: Vec<Result<(), Error>>) -> Self {
        Self {
            available: true,
            outcomes: RefCell::new(outcomes),
            calls: RefCell::new(Vec::new()),
        }
    }
}

impl ApkeepProvider for ScriptedApkeep {
    fn is_available(&self) -> bool {
        self.available
    }

    fn download(
        &self,
        request: &ProviderRequest,
        account: &AccountConfig,
    ) -> Result<PathBuf, Error> {
        self.calls.borrow_mut().push(account.label.clone());
        let outcome = self.outcomes.borrow_mut().remove(0);
        outcome?;
        let path = request
            .out_dir
            .join(format!("{}.apkm", request.package_name));
        write_apk(&path, b"scripted");
        Ok(path)
    }
}

struct ScriptedPlay {
    outcomes: RefCell<Vec<Result<(), Error>>>,
    calls: RefCell<Vec<String>>,
}

impl ScriptedPlay {
    fn new(outcomes: Vec<Result<(), Error>>) -> Self {
        Self {
            outcomes: RefCell::new(outcomes),
            calls: RefCell::new(Vec::new()),
        }
    }
}

impl PlayProvider for ScriptedPlay {
    fn download(&self, request: &ProviderRequest, auth: PlayAuth<'_>) -> Result<PathBuf, Error> {
        self.calls.borrow_mut().push(match auth {
            PlayAuth::Direct(account) => format!("direct:{}", account.label),
            PlayAuth::Dispenser => "dispenser".to_string(),
        });
        let outcome = self.outcomes.borrow_mut().remove(0);
        outcome?;
        let path = request
            .out_dir
            .join(format!("{}.apkm", request.package_name));
        write_apk(&path, b"scripted");
        Ok(path)
    }
}

struct FailingApkmirror;

impl ApkmirrorProvider for FailingApkmirror {
    fn download(&self, _request: &ProviderRequest) -> Result<PathBuf, Error> {
        Err(Error::invalid_artifact("no mapping configured"))
    }
}

struct ScriptedApkmirror {
    outcome: Result<(), Error>,
    calls: Cell<usize>,
}

impl ApkmirrorProvider for ScriptedApkmirror {
    fn download(&self, request: &ProviderRequest) -> Result<PathBuf, Error> {
        self.calls.set(self.calls.get() + 1);
        self.outcome.clone()?;
        let path = request
            .out_dir
            .join(format!("{}.apkm", request.package_name));
        write_apk(&path, b"mirror");
        Ok(path)
    }
}

// ---------------------------------------------------------------------------
// Native Play fake
// ---------------------------------------------------------------------------

#[derive(Clone)]
enum DownloadBehavior {
    WriteBase,
    WriteNothing,
}

struct FakePlayBackend {
    details: Result<VersionInfo, String>,
    behavior: DownloadBehavior,
    download_calls: Cell<usize>,
    open_calls: Cell<usize>,
    open_pending: bool,
    pending_open_attempt: Option<usize>,
    details_pending: bool,
    download_pending: bool,
}

impl FakePlayBackend {
    fn new(version_name: &str, version_code: u64, behavior: DownloadBehavior) -> Self {
        Self {
            details: Ok(VersionInfo {
                version_name: version_name.to_string(),
                version_code,
            }),
            behavior,
            download_calls: Cell::new(0),
            open_calls: Cell::new(0),
            open_pending: false,
            pending_open_attempt: None,
            details_pending: false,
            download_pending: false,
        }
    }

    fn pending_open(mut self) -> Self {
        self.open_pending = true;
        self
    }

    fn pending_open_attempt(mut self, attempt: usize) -> Self {
        self.pending_open_attempt = Some(attempt);
        self
    }

    fn pending_details(mut self) -> Self {
        self.details_pending = true;
        self
    }

    fn pending_download(mut self) -> Self {
        self.download_pending = true;
        self
    }

    fn open_calls(&self) -> usize {
        self.open_calls.get()
    }
}

struct FakePlaySession<'a> {
    backend: &'a FakePlayBackend,
}

impl PlayBackend for FakePlayBackend {
    fn open<'a>(
        &'a self,
        _account: &'a PlayAccountConfig,
        _auth: &'a AuthContext<'a>,
    ) -> Pin<Box<dyn Future<Output = Result<Box<dyn PlaySession + 'a>, String>> + 'a>> {
        Box::pin(async move {
            let attempt = self.open_calls.get();
            self.open_calls.set(attempt + 1);
            if self.open_pending || self.pending_open_attempt == Some(attempt) {
                tokio::time::sleep(Duration::from_secs(3600)).await;
            }
            Ok(Box::new(FakePlaySession { backend: self }) as Box<dyn PlaySession + 'a>)
        })
    }
}

impl PlaySession for FakePlaySession<'_> {
    fn details<'a>(
        &'a mut self,
        _package: &'a str,
    ) -> Pin<Box<dyn Future<Output = Result<VersionInfo, String>> + 'a>> {
        Box::pin(async move {
            if self.backend.details_pending {
                tokio::time::sleep(Duration::from_secs(3600)).await;
            }
            self.backend.details.clone()
        })
    }

    fn download<'a>(
        &'a mut self,
        _package: &'a str,
        _version_code: Option<i64>,
        dest: &'a Path,
    ) -> Pin<Box<dyn Future<Output = Result<(), String>> + 'a>> {
        Box::pin(async move {
            self.backend
                .download_calls
                .set(self.backend.download_calls.get() + 1);
            if self.backend.download_pending {
                tokio::time::sleep(Duration::from_secs(3600)).await;
            }
            fs::create_dir_all(dest).map_err(|error| error.to_string())?;
            match &self.backend.behavior {
                DownloadBehavior::WriteBase => fs::write(dest.join("base.apk"), b"play-base")
                    .map_err(|error| error.to_string()),
                DownloadBehavior::WriteNothing => Ok(()),
            }
        })
    }
}

// ---------------------------------------------------------------------------
// Tests: sources and accounts
// ---------------------------------------------------------------------------

#[test]
fn source_labels_stay_compatible() {
    for (value, label) in [
        ("apkeep", "apkeep"),
        ("goopdl", "goopdl"),
        ("apkmirror", "apkmirror"),
        ("manual", "manual"),
    ] {
        let source: apk_lab::acquisition::AcquisitionSource =
            serde_json::from_str(&format!("\"{value}\"")).expect("source");
        assert_eq!(source.label(), label);
        assert_eq!(
            source,
            serde_json::from_str(&format!("\"{value}\"")).unwrap()
        );
    }
}

#[test]
fn missing_account_sources_are_not_an_error() {
    let environment = AccountsEnvironment::default();
    assert!(load_accounts(&environment).expect("load").is_none());
}

#[test]
fn disabled_and_duplicate_accounts_are_rejected() {
    let duplicate = r#"{"version":1,"accounts":[
        {"label":"a","email":"A@Example.com","aasToken":"token"},
        {"label":"b","email":"a@example.com","aasToken":"token2"}]}"#;
    let error = parse_accounts_document(duplicate, "test")
        .err()
        .expect("duplicate email");
    assert!(error.message().contains("Duplicate email"), "{error}");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);

    let disabled = r#"{"version":1,"accounts":[
        {"label":"a","email":"a@example.com","aasToken":"token","enabled":false}]}"#;
    let error = parse_accounts_document(disabled, "test")
        .err()
        .expect("disabled");
    assert!(error.message().contains("No enabled accounts"), "{error}");
}

#[test]
fn accounts_file_permissions_are_enforced() {
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        let dir = TempDir::new().expect("temp dir");
        let path = dir.path().join("accounts.json");
        fs::write(
            &path,
            r#"{"version":1,"accounts":[{"label":"a","email":"a@example.com","aasToken":"t"}]}"#,
        )
        .expect("write accounts");
        fs::set_permissions(&path, fs::Permissions::from_mode(0o644)).expect("chmod");
        let environment = AccountsEnvironment {
            explicit_file: Some(path),
            ..AccountsEnvironment::default()
        };
        let error = load_accounts(&environment)
            .err()
            .expect("insecure permissions");
        assert!(error.message().contains("insecure permissions"), "{error}");
    }
}

#[test]
fn account_rotation_uses_enabled_order_and_stops_on_success() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let accounts = vec![
        account("primary", "token-1", true),
        account("secondary", "token-2", true),
    ];
    let apkeep = ScriptedApkeep::new(vec![
        Err(Error::infrastructure("primary unavailable")),
        Ok(()),
    ]);
    let acquirer = Acquirer {
        apkeep: Some(&apkeep),
        play: None,
        apkmirror: None,
        retry: RetryPolicy::default(),
    };
    let acquired: AcquiredArtifact = acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect("secondary succeeds");
    assert_eq!(*apkeep.calls.borrow(), vec!["primary", "secondary"]);
    assert_eq!(acquired.source.label(), "apkeep");
}

#[test]
fn disabled_accounts_are_skipped() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let accounts = vec![
        account("disabled", "token-1", false),
        account("enabled", "token-2", true),
    ];
    let apkeep = ScriptedApkeep::new(vec![Ok(())]);
    let acquirer = Acquirer {
        apkeep: Some(&apkeep),
        play: None,
        apkmirror: None,
        retry: RetryPolicy::default(),
    };
    acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect("enabled account");
    assert_eq!(*apkeep.calls.borrow(), vec!["enabled"]);
}

#[test]
fn direct_tokens_rotate_and_dispenser_runs_only_without_direct_tokens() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let accounts = vec![
        account("primary", "aas_et/one", true),
        account("secondary", "aas_et/two", true),
    ];
    let play = ScriptedPlay::new(vec![Err(Error::infrastructure("token expired")), Ok(())]);
    let acquirer = Acquirer {
        apkeep: None,
        play: Some(&play),
        apkmirror: None,
        retry: RetryPolicy::default(),
    };
    let acquired = acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect("second direct token succeeds");
    assert_eq!(
        *play.calls.borrow(),
        vec!["direct:primary", "direct:secondary"]
    );
    assert_eq!(acquired.source.label(), "goopdl");

    let dispenser_accounts = vec![account("oauth", "oauth2_4/token", true)];
    let play = ScriptedPlay::new(vec![Ok(())]);
    let acquirer = Acquirer {
        apkeep: None,
        play: Some(&play),
        apkmirror: None,
        retry: RetryPolicy::default(),
    };
    acquirer
        .acquire(&request(&out), Some(&dispenser_accounts), None)
        .expect("dispenser succeeds");
    assert_eq!(*play.calls.borrow(), vec!["dispenser"]);
}

// ---------------------------------------------------------------------------
// Tests: native Play provider behavior
// ---------------------------------------------------------------------------

#[test]
fn wrong_version_from_play_details_is_rejected_before_download() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("2.0.0", 200);
    let backend = FakePlayBackend::new("2.0.0", 200, DownloadBehavior::WriteBase);
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: Duration::from_secs(5),
    };
    let mut request = request(&out);
    request.expected_version = Some("1.0.0");
    let error = provider
        .download(&request, PlayAuth::Dispenser)
        .expect_err("version mismatch");
    assert!(error
        .message()
        .contains("goopdl downloaded version '2.0.0'"));
    assert_eq!(backend.download_calls.get(), 0);
    assert_eq!(dir_entries(&out), Vec::<String>::new());
}

#[test]
fn partial_download_leaves_no_advertised_output() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteNothing);
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: Duration::from_secs(5),
    };
    let error = provider
        .download(&request(&out), PlayAuth::Dispenser)
        .expect_err("no apk");
    assert!(error.message().contains("no APK files"), "{error}");
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
    assert_eq!(dir_entries(&out), Vec::<String>::new());
}

#[test]
fn malformed_download_fails_and_is_removed() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let mut badger = FakeBadger::default();
    badger.failures.insert(
        "base.apk".to_string(),
        Error::invalid_artifact("bad manifest"),
    );
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase);
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: Duration::from_secs(5),
    };
    let error = provider
        .download(&request(&out), PlayAuth::Dispenser)
        .expect_err("bad badging");
    assert!(
        error.message().contains("Failed to inspect APK badging"),
        "{error}"
    );
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
    assert_eq!(dir_entries(&out), Vec::<String>::new());
}

const TEST_ATTEMPT_TIMEOUT: Duration = Duration::from_millis(50);

#[test]
fn play_download_completes_inside_an_existing_tokio_runtime() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase);
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: Duration::from_secs(5),
    };
    let account = account("primary", "aas_et/token", true);
    let runtime = tokio::runtime::Builder::new_multi_thread()
        .enable_all()
        .build()
        .expect("tokio runtime");
    let path = runtime
        .block_on(async { provider.download(&request(&out), PlayAuth::Direct(&account)) })
        .expect("download inside runtime");
    assert_eq!(path, out.join(format!("{PACKAGE}.apkm")));
    assert_eq!(backend.open_calls(), 1);
}

#[test]
fn authentication_deadline_returns_infrastructure_with_stage() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase).pending_open();
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: TEST_ATTEMPT_TIMEOUT,
    };
    let account = account("primary", "aas_et/token", true);
    let started = Instant::now();
    let error = provider
        .download(&request(&out), PlayAuth::Direct(&account))
        .expect_err("authentication hangs");
    assert!(started.elapsed() < Duration::from_secs(1));
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
    assert!(error.message().contains("authentication"), "{error}");
    assert!(error.message().contains("timed out"), "{error}");
    assert_eq!(backend.open_calls(), 1);
    assert_eq!(backend.download_calls.get(), 0);
}

#[test]
fn details_deadline_returns_infrastructure_with_stage() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase).pending_details();
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: TEST_ATTEMPT_TIMEOUT,
    };
    let account = account("primary", "aas_et/token", true);
    let started = Instant::now();
    let error = provider
        .download(&request(&out), PlayAuth::Direct(&account))
        .expect_err("details hangs");
    assert!(started.elapsed() < Duration::from_secs(1));
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
    assert!(error.message().contains("details"), "{error}");
    assert!(error.message().contains("timed out"), "{error}");
    assert_eq!(backend.download_calls.get(), 0);
}

#[test]
fn download_deadline_returns_infrastructure_with_stage() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend =
        FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase).pending_download();
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: TEST_ATTEMPT_TIMEOUT,
    };
    let account = account("primary", "aas_et/token", true);
    let started = Instant::now();
    let error = provider
        .download(&request(&out), PlayAuth::Direct(&account))
        .expect_err("download hangs");
    assert!(started.elapsed() < Duration::from_secs(1));
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
    assert!(error.message().contains("download"), "{error}");
    assert!(error.message().contains("timed out"), "{error}");
    assert_eq!(backend.download_calls.get(), 1);
}

#[test]
fn timed_out_first_account_rotates_to_the_second() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend =
        FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase).pending_open_attempt(0);
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: TEST_ATTEMPT_TIMEOUT,
    };
    let accounts = vec![
        account("primary", "aas_et/one", true),
        account("secondary", "aas_et/two", true),
    ];
    let acquirer = Acquirer {
        apkeep: None,
        play: Some(&provider),
        apkmirror: None,
        retry: RetryPolicy::default(),
    };
    let acquired = acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect("second account succeeds");
    assert_eq!(acquired.source.label(), "goopdl");
    assert_eq!(backend.open_calls(), 2);
    assert_eq!(backend.download_calls.get(), 1);
}

#[test]
fn timed_out_play_attempt_falls_back_to_apkmirror() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase).pending_open();
    let provider = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: TEST_ATTEMPT_TIMEOUT,
    };
    let mirror = ScriptedApkmirror {
        outcome: Ok(()),
        calls: Cell::new(0),
    };
    let accounts = vec![account("primary", "aas_et/one", true)];
    let acquirer = Acquirer {
        apkeep: None,
        play: Some(&provider),
        apkmirror: Some(&mirror),
        retry: RetryPolicy::default(),
    };
    let acquired = acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect("apkmirror fallback succeeds");
    assert_eq!(acquired.source.label(), "apkmirror");
    assert_eq!(backend.open_calls(), 1);
    assert_eq!(mirror.calls.get(), 1);
}

// ---------------------------------------------------------------------------
// Tests: apkeep provider, redaction, cleanup
// ---------------------------------------------------------------------------

#[test]
fn apkeep_redacts_credentials_before_truncation() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let account = AccountConfig {
        label: "primary".to_string(),
        email: EMAIL.to_string(),
        aas_token: format!("{TOKEN}{}", "x".repeat(400)),
        device: "px_9a".to_string(),
        locale: "en_US".to_string(),
        timezone: "UTC".to_string(),
        enabled: true,
    };
    let leaked = format!(
        "{} {} {} {}",
        "a".repeat(20),
        EMAIL,
        account.aas_token,
        "b".repeat(400)
    );
    let runner = RecordingRunner::new(RunnerBehavior::Fail(leaked));
    let tool = FakeApkeepTool { available: true };
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let provider = ApkeepAcquirer {
        tool: &tool,
        commands: &runner,
        badger: &badger,
        inspector: &inspector,
        timeout: Duration::from_secs(5),
    };
    let error = provider
        .download(&request(&out), &account)
        .expect_err("apkeep fails");
    let message = error.message();
    assert!(message.contains("[REDACTED_TOKEN]"), "{message}");
    assert!(message.contains("Pr***@Example.com"), "{message}");
    assert!(!message.contains(EMAIL), "{message}");
    assert!(!message.contains(&account.aas_token), "{message}");
    assert!(message.chars().count() <= STDERR_DIAGNOSTIC_LIMIT + 120);
    assert_eq!(dir_entries(&out), Vec::<String>::new());
}

#[test]
fn redactor_removes_raw_and_percent_encoded_credentials_before_truncation() {
    let token = "aas_et/SECRET+Value/=";
    let mut redactor = Redactor::default();
    redactor.push_token(token);
    redactor.push_email(EMAIL);

    let uppercase = percent_encode(token, true);
    let lowercase = percent_encode(token, false);
    let slash_only = token.replace('/', "%2F");
    let text =
        format!("raw {token} upper {uppercase} lower {lowercase} slash {slash_only} email {EMAIL}");
    let diagnostic = sanitize_diagnostic(&text, &redactor);
    for secret in [
        token,
        uppercase.as_str(),
        lowercase.as_str(),
        slash_only.as_str(),
        EMAIL,
    ] {
        assert!(
            !diagnostic.contains(secret),
            "leaked {secret:?} in {diagnostic}"
        );
    }
    assert!(diagnostic.contains("[REDACTED_TOKEN]"), "{diagnostic}");
    assert!(diagnostic.contains("Pr***@Example.com"), "{diagnostic}");

    // The secret begins just before the truncation boundary; redaction must
    // happen first or the replacement would be sliced in half.
    let boundary = format!("{} {token} {}", "a".repeat(280), "b".repeat(400));
    let diagnostic = sanitize_diagnostic(&boundary, &redactor);
    assert!(
        !diagnostic.contains(token),
        "leaked across boundary: {diagnostic}"
    );
    assert!(diagnostic.chars().count() <= STDERR_DIAGNOSTIC_LIMIT);
}

#[test]
fn apkeep_version_mismatch_cleans_the_attempt_and_keeps_secrets_out_of_argv() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let account = account("primary", TOKEN, true);
    let runner = RecordingRunner::new(RunnerBehavior::WriteBase);
    let tool = FakeApkeepTool { available: true };
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("2.0.0", 200);
    let provider = ApkeepAcquirer {
        tool: &tool,
        commands: &runner,
        badger: &badger,
        inspector: &inspector,
        timeout: Duration::from_secs(5),
    };
    let mut request = request(&out);
    request.expected_version = Some("1.0.0");
    let error = provider
        .download(&request, &account)
        .expect_err("version mismatch");
    assert!(
        error.message().contains("Downloaded version '2.0.0'"),
        "{error}"
    );
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
    assert_eq!(dir_entries(&out), Vec::<String>::new());

    let args = runner.args.borrow();
    let joined = args[0].join(" ");
    assert!(!joined.contains("python"));
    assert!(!joined.contains("goopdl"));
    assert!(!joined.contains(TOKEN));
    assert!(!joined.contains("primary@example.com"));
    assert!(joined.contains("credentials.ini"));
    assert_eq!(
        *runner.programs.borrow(),
        vec!["/fake/bin/apkeep".to_string()]
    );
}

#[test]
fn apkeep_credentials_file_is_private_and_contains_expected_fields() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let account = account("primary", TOKEN, true);
    let runner = RecordingRunner::new(RunnerBehavior::WriteBase);
    let tool = FakeApkeepTool { available: true };
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let provider = ApkeepAcquirer {
        tool: &tool,
        commands: &runner,
        badger: &badger,
        inspector: &inspector,
        timeout: Duration::from_secs(5),
    };
    provider
        .download(&request(&out), &account)
        .expect("apkeep succeeds");
    assert!(out.join(format!("{PACKAGE}.apkm")).is_file());
    let args = &runner.args.borrow()[0];
    let ini_path = Path::new(&args[args.iter().position(|arg| arg == "-i").unwrap() + 1]);
    assert!(
        !ini_path.exists(),
        "credential file must be removed with the attempt"
    );
    #[cfg(unix)]
    assert_eq!(*runner.private_modes.borrow(), vec![0o600]);
    assert_eq!(build_apkeep_args(PACKAGE, ini_path, &out).len(), 9);
}

// ---------------------------------------------------------------------------
// Tests: APKMirror provider
// ---------------------------------------------------------------------------

#[test]
fn apkmirror_uses_node_runner_and_keeps_mapping() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let runner = RecordingRunner::new(RunnerBehavior::WriteBase);
    let node = FakeNode {
        path: Some(PathBuf::from("/fake/bin/node")),
    };
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let script = dir.path().join("apkmirror_runner.cjs");
    fs::write(&script, "// runner").expect("script");
    let provider = ApkmirrorAcquirer {
        runtime: &node,
        commands: &runner,
        badger: &badger,
        inspector: &inspector,
        runner_script: script.clone(),
        timeout: Duration::from_secs(5),
    };
    let mut request = ProviderRequest {
        package_name: "com.sidelineswap.android",
        out_dir: &out,
        expected_version: None,
        expected_version_code: None,
    };
    let path = provider.download(&request).expect("mirror apk");
    assert_eq!(path.file_name().unwrap(), "com.sidelineswap.android.apk");
    assert!(path.is_file());
    assert_eq!(
        *runner.programs.borrow(),
        vec!["/fake/bin/node".to_string()]
    );
    let args = &runner.args.borrow()[0];
    assert_eq!(
        args,
        &build_apkmirror_args(
            &script,
            apkmirror_mapping("com.sidelineswap.android").unwrap(),
            "latest",
            Path::new(args.last().unwrap())
        )
    );

    let bundle_runner = RecordingRunner::new(RunnerBehavior::WriteBundle);
    let provider = ApkmirrorAcquirer {
        runtime: &node,
        commands: &bundle_runner,
        badger: &badger,
        inspector: &inspector,
        runner_script: script,
        timeout: Duration::from_secs(5),
    };
    request = ProviderRequest {
        package_name: "com.sezzle.sezzlemobile",
        out_dir: &out,
        expected_version: None,
        expected_version_code: None,
    };
    let bundle = provider.download(&request).expect("mirror bundle");
    assert_eq!(entry_names(&bundle), vec!["base.apk".to_string()]);
    assert_eq!(read_member(&bundle, "base.apk"), b"nested-base");
    for call in bundle_runner.calls() {
        assert!(!call.contains("python"));
    }
}

impl RecordingRunner {
    fn calls(&self) -> Vec<String> {
        self.args
            .borrow()
            .iter()
            .map(|args| args.join(" "))
            .collect()
    }
}

#[test]
fn apkmirror_rejects_unmapped_package_and_unsafe_bundle() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let runner = RecordingRunner::new(RunnerBehavior::WriteBundle);
    let node = FakeNode {
        path: Some(PathBuf::from("/fake/bin/bun")),
    };
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let script = dir.path().join("runner.cjs");
    fs::write(&script, "// runner").expect("script");
    let provider = ApkmirrorAcquirer {
        runtime: &node,
        commands: &runner,
        badger: &badger,
        inspector: &inspector,
        runner_script: script,
        timeout: Duration::from_secs(5),
    };
    let error = provider
        .download(&ProviderRequest {
            package_name: "com.unmapped.app",
            out_dir: &out,
            expected_version: None,
            expected_version_code: None,
        })
        .expect_err("unmapped");
    assert!(
        error.message().contains("No APKMirror repository mapping"),
        "{error}"
    );

    let unsafe_runner = UnsafeBundleRunner;
    let provider = ApkmirrorAcquirer {
        runtime: &node,
        commands: &unsafe_runner,
        badger: &badger,
        inspector: &inspector,
        runner_script: dir.path().join("runner.cjs"),
        timeout: Duration::from_secs(5),
    };
    let error = provider
        .download(&ProviderRequest {
            package_name: "com.sezzle.sezzlemobile",
            out_dir: &out,
            expected_version: None,
            expected_version_code: None,
        })
        .expect_err("unsafe bundle");
    assert!(
        error.message().contains("Unsafe archive member path"),
        "{error}"
    );
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
    assert_eq!(dir_entries(&out), Vec::<String>::new());
}

struct UnsafeBundleRunner;

impl CommandRunner for UnsafeBundleRunner {
    fn run(
        &self,
        _program: &Path,
        args: &[String],
        _cwd: Option<&Path>,
        _timeout: Duration,
        _secrets: &[String],
    ) -> Result<CommandOutcome, String> {
        let attempt = Path::new(args.last().expect("attempt arg"));
        fs::create_dir_all(attempt).expect("attempt");
        fs::write(
            attempt.join("download.apkm"),
            zip_bytes(&[("base.apk", b"base"), ("../escape.apk", b"bad")]),
        )
        .expect("bundle");
        Ok(success())
    }
}

#[test]
fn apkmirror_version_mismatch_leaves_no_output() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let runner = RecordingRunner::new(RunnerBehavior::WriteBase);
    let node = FakeNode {
        path: Some(PathBuf::from("/fake/bin/node")),
    };
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("9.9.9", 999);
    let script = dir.path().join("runner.cjs");
    fs::write(&script, "// runner").expect("script");
    let provider = ApkmirrorAcquirer {
        runtime: &node,
        commands: &runner,
        badger: &badger,
        inspector: &inspector,
        runner_script: script,
        timeout: Duration::from_secs(5),
    };
    let error = provider
        .download(&ProviderRequest {
            package_name: "com.sidelineswap.android",
            out_dir: &out,
            expected_version: Some("4.2.1"),
            expected_version_code: Some(100),
        })
        .expect_err("wrong version");
    assert!(
        error
            .message()
            .contains("APKMirror downloaded version '9.9.9'"),
        "{error}"
    );
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
    assert_eq!(dir_entries(&out), Vec::<String>::new());
}

#[test]
fn apkmirror_timeout_is_infrastructure_failure_and_leaves_no_output() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let runner = RecordingRunner::new(RunnerBehavior::Timeout);
    let node = FakeNode {
        path: Some(PathBuf::from("/fake/bin/node")),
    };
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);
    let script = dir.path().join("runner.cjs");
    fs::write(&script, "// runner").expect("script");
    let provider = ApkmirrorAcquirer {
        runtime: &node,
        commands: &runner,
        badger: &badger,
        inspector: &inspector,
        runner_script: script,
        timeout: Duration::from_secs(5),
    };
    let error = provider
        .download(&ProviderRequest {
            package_name: "com.sezzle.sezzlemobile",
            out_dir: &out,
            expected_version: None,
            expected_version_code: None,
        })
        .expect_err("timeout");
    assert!(error.message().contains("timed out"), "{error}");
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
    assert_eq!(dir_entries(&out), Vec::<String>::new());
}

// ---------------------------------------------------------------------------
// Tests: normalization
// ---------------------------------------------------------------------------

#[test]
fn normalization_is_deterministic_with_fixed_metadata_and_member_hashes() {
    let dir = TempDir::new().expect("temp dir");
    let apks = dir.path().join("apks");
    fs::create_dir_all(&apks).expect("apks");
    let base = apks.join("base-master.apk");
    let split = apks.join("config.arm64.apk");
    write_apk(&base, b"base-payload");
    write_apk(&split, b"split-payload");
    let badger = FakeBadger::base("base-master.apk").with_split("config.arm64.apk", "config.arm64");
    let out = dir.path().join("out").join(format!("{PACKAGE}.apkm"));
    let first =
        normalize_apks_to_apkm(&[split.clone(), base.clone()], &out, &badger).expect("normalize");
    assert_eq!(entry_names(&first), vec!["base.apk", "config.arm64.apk"]);

    let mut archive = ZipArchive::new(fs::File::open(&first).expect("open")).expect("zip");
    {
        let member = archive.by_name("base.apk").expect("base member");
        let modified = member.last_modified().expect("timestamp");
        assert_eq!(modified.year(), 2026);
        assert_eq!(modified.month(), 1);
        assert_eq!(modified.day(), 1);
        assert_eq!(modified.hour(), 0);
        assert_eq!(modified.minute(), 0);
        assert_eq!(modified.second(), 0);
        assert_eq!(member.unix_mode(), Some(0o644));
        assert_eq!(member.compression(), CompressionMethod::Deflated);
    }
    assert_eq!(read_member(&first, "base.apk"), b"base-payload");
    assert_eq!(read_member(&first, "config.arm64.apk"), b"split-payload");
    assert_eq!(
        apk_lab::archives::compute_zip_member_sha256(&first, "base.apk").expect("hash"),
        sha256(b"base-payload")
    );

    let second_path = dir.path().join("second.apkm");
    let second = normalize_apks_to_apkm(&[base, split], &second_path, &badger).expect("normalize");
    assert_eq!(
        fs::read(&first).expect("first bytes"),
        fs::read(&second).expect("second bytes"),
        "fixed metadata must make the outer APKM byte-identical"
    );
}

#[test]
fn normalization_rejects_missing_base_and_duplicate_names() {
    let dir = TempDir::new().expect("temp dir");
    let apks = dir.path().join("apks");
    fs::create_dir_all(&apks).expect("apks");
    let split = apks.join("config.apk");
    write_apk(&split, b"split");
    let mut badger = FakeBadger::default();
    badger.infos.insert(
        "config.apk".to_string(),
        AndroidManifestInfo {
            package_name: PACKAGE.to_string(),
            version_code: 100,
            version_name: "1.0.0".to_string(),
            min_sdk_version: None,
            target_sdk_version: None,
            permissions: Vec::new(),
            components: Vec::new(),
            split_name: Some("config".to_string()),
        },
    );
    let error = normalize_apks_to_apkm(
        std::slice::from_ref(&split),
        &dir.path().join("o.apkm"),
        &badger,
    )
    .expect_err("no base");
    assert!(error.message().contains("No base APK found"), "{error}");

    let other_dir = apks.join("nested");
    fs::create_dir_all(&other_dir).expect("nested");
    let duplicate = other_dir.join("config.apk");
    write_apk(&duplicate, b"split2");
    let badger = FakeBadger::base("base.apk").with_split("config.apk", "config");
    let base = apks.join("base.apk");
    write_apk(&base, b"base");
    let mut files = vec![base, split];
    // Two different paths with the same basename are only possible through
    // separate directories; use the second directory directly.
    files.push(duplicate);
    let error = normalize_apks_to_apkm(&files, &dir.path().join("dup.apkm"), &badger)
        .expect_err("duplicate");
    assert!(error.message().contains("Duplicate entry name"), "{error}");
    assert!(!dir.path().join("dup.apkm").exists());
}

#[test]
fn normalization_rejects_cross_package_and_cross_version_sets() {
    let dir = TempDir::new().expect("temp dir");
    let base = dir.path().join("base.apk");
    let split = dir.path().join("split.apk");
    write_apk(&base, b"base");
    write_apk(&split, b"split");
    let mut badger = FakeBadger::base("base.apk").with_split("split.apk", "config");
    badger.infos.insert(
        "split.apk".to_string(),
        AndroidManifestInfo {
            package_name: "com.other.pkg".to_string(),
            version_code: 100,
            version_name: "1.0.0".to_string(),
            min_sdk_version: None,
            target_sdk_version: None,
            permissions: Vec::new(),
            components: Vec::new(),
            split_name: Some("config".to_string()),
        },
    );
    let error = normalize_apks_to_apkm(
        &[base.clone(), split.clone()],
        &dir.path().join("out.apkm"),
        &badger,
    )
    .expect_err("package mismatch");
    assert!(error.message().contains("Package name mismatch"), "{error}");
    assert!(!dir.path().join("out.apkm").exists());

    let mut version_badger = FakeBadger::base("base.apk").with_split("split.apk", "config");
    version_badger
        .infos
        .get_mut("split.apk")
        .expect("split info")
        .version_code = 101;
    let error = normalize_apks_to_apkm(
        &[base, split],
        &dir.path().join("out.apkm"),
        &version_badger,
    )
    .expect_err("version mismatch");
    assert!(error.message().contains("Version code mismatch"), "{error}");
    assert!(!dir.path().join("out.apkm").exists());
}

// ---------------------------------------------------------------------------
// Tests: orchestration failure, retries, no Python trace
// ---------------------------------------------------------------------------

#[test]
fn all_provider_failures_are_aggregated_with_last_class() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let accounts = vec![account("primary", "aas_et/token", true)];
    let apkeep = ScriptedApkeep::new(vec![Err(Error::invalid_artifact("latest != expected"))]);
    let play = ScriptedPlay::new(vec![Err(Error::infrastructure(
        "dispenser returned HTTP 403",
    ))]);
    let acquirer = Acquirer {
        apkeep: Some(&apkeep),
        play: Some(&play),
        apkmirror: Some(&FailingApkmirror),
        retry: RetryPolicy::default(),
    };
    let error = acquirer
        .acquire(
            &request(&out),
            Some(&accounts),
            Some("Failed to load Google Play accounts: broken"),
        )
        .expect_err("all fail");
    let message = error.message();
    assert!(
        message.contains("Failed to load Google Play accounts: broken"),
        "{message}"
    );
    assert!(message.contains("apkeep [primary]"), "{message}");
    assert!(
        message.contains("goopdl [primary] direct auth"),
        "{message}"
    );
    assert!(message.contains("apkmirror:"), "{message}");
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
    assert_eq!(dir_entries(&out), Vec::<String>::new());
}

#[test]
fn retry_policy_retries_only_infrastructure_failures() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let accounts = vec![account("primary", "token", true)];

    let apkeep = ScriptedApkeep::new(vec![Err(Error::infrastructure("transient")), Ok(())]);
    let acquirer = Acquirer {
        apkeep: Some(&apkeep),
        play: None,
        apkmirror: None,
        retry: RetryPolicy::new(2),
    };
    acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect("retry succeeds");
    assert_eq!(apkeep.calls.borrow().len(), 2);

    let apkeep = ScriptedApkeep::new(vec![Err(Error::invalid_artifact("permanent")), Ok(())]);
    let acquirer = Acquirer {
        apkeep: Some(&apkeep),
        play: None,
        apkmirror: None,
        retry: RetryPolicy::new(2),
    };
    let error = acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect_err("invalid artifact is not retried");
    assert!(error.message().contains("permanent"), "{error}");
    assert_eq!(apkeep.calls.borrow().len(), 1);
}

#[test]
fn routing_prefers_apkeep_then_play_then_apkmirror() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let accounts = vec![account("primary", "aas_et/token", true)];

    let apkmirror_calls = Cell::new(0);
    let apkmirror = ScriptedApkmirror {
        outcome: Ok(()),
        calls: apkmirror_calls,
    };
    let apkeep = ScriptedApkeep::new(vec![Err(Error::infrastructure("apkeep down"))]);
    let play = ScriptedPlay::new(vec![Ok(())]);
    let acquirer = Acquirer {
        apkeep: Some(&apkeep),
        play: Some(&play),
        apkmirror: Some(&apkmirror),
        retry: RetryPolicy::default(),
    };
    let acquired = acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect("play fallback");
    assert_eq!(acquired.source.label(), "goopdl");
    assert_eq!(apkmirror.calls.get(), 0);

    let apkeep = ScriptedApkeep::new(vec![Err(Error::infrastructure("down"))]);
    let play = ScriptedPlay::new(vec![Err(Error::infrastructure("down"))]);
    let acquirer = Acquirer {
        apkeep: Some(&apkeep),
        play: Some(&play),
        apkmirror: Some(&apkmirror),
        retry: RetryPolicy::default(),
    };
    let acquired = acquirer
        .acquire(&request(&out), Some(&accounts), None)
        .expect("mirror fallback");
    assert_eq!(acquired.source.label(), "apkmirror");
    assert_eq!(apkmirror.calls.get(), 1);
}

#[test]
fn no_python_uv_or_goopdl_program_is_ever_invoked() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let account = account("primary", TOKEN, true);
    let badger = FakeBadger::base("base.apk");
    let inspector = FakeInspector::new("1.0.0", 100);

    let apkeep_runner = RecordingRunner::new(RunnerBehavior::WriteBase);
    let tool = FakeApkeepTool { available: true };
    let apkeep = ApkeepAcquirer {
        tool: &tool,
        commands: &apkeep_runner,
        badger: &badger,
        inspector: &inspector,
        timeout: Duration::from_secs(5),
    };
    apkeep.download(&request(&out), &account).expect("apkeep");

    let mirror_runner = RecordingRunner::new(RunnerBehavior::WriteBase);
    let node = FakeNode {
        path: Some(PathBuf::from("/fake/bin/bun")),
    };
    let script = dir.path().join("runner.cjs");
    fs::write(&script, "// runner").expect("script");
    let mirror = ApkmirrorAcquirer {
        runtime: &node,
        commands: &mirror_runner,
        badger: &badger,
        inspector: &inspector,
        runner_script: script,
        timeout: Duration::from_secs(5),
    };
    mirror
        .download(&ProviderRequest {
            package_name: "com.sidelineswap.android",
            out_dir: &out,
            expected_version: None,
            expected_version_code: None,
        })
        .expect("mirror");

    let mut programs: Vec<String> = apkeep_runner.programs.borrow().clone();
    programs.extend(mirror_runner.programs.borrow().clone());
    assert!(!programs.is_empty());
    for program in &programs {
        let lower = program.to_ascii_lowercase();
        assert!(!lower.contains("python"), "{program}");
        assert!(!lower.contains("uv"), "{program}");
        assert!(!lower.contains("goopdl"), "{program}");
        assert!(
            lower.ends_with("apkeep") || lower.ends_with("node") || lower.ends_with("bun"),
            "{program}"
        );
    }
}

// ---------------------------------------------------------------------------
// Tests: typed inspection seams
// ---------------------------------------------------------------------------

fn play_provider<'a>(
    badger: &'a FakeBadger,
    inspector: &'a FakeInspector,
    backend: &'a FakePlayBackend,
) -> PlayAcquirer<'a> {
    PlayAcquirer {
        backend,
        badger,
        inspector,
        dispenser_url: "https://dispenser.invalid/api/auth",
        attempt_timeout: Duration::from_secs(5),
    }
}

#[test]
fn missing_badging_tool_is_a_usage_failure_not_an_invalid_artifact() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let mut badger = FakeBadger::default();
    badger.failures.insert(
        "base.apk".to_string(),
        Error::usage("Android build tool 'aapt2' not found"),
    );
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase);
    let provider = play_provider(&badger, &inspector, &backend);

    let error = provider
        .download(&request(&out), PlayAuth::Dispenser)
        .expect_err("missing aapt2");
    assert!(
        error.message().contains("Failed to inspect APK badging"),
        "{error}"
    );
    assert!(error.message().contains("aapt2"), "{error}");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert_ne!(error.exit_code(), ExitCode::InvalidArtifact);

    let acquirer = Acquirer {
        apkeep: None,
        play: Some(&provider),
        apkmirror: None,
        retry: RetryPolicy::default(),
    };
    let error = acquirer
        .acquire(&request(&out), Some(&[] as &[AccountConfig]), None)
        .expect_err("aggregate keeps usage class");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(error.message().contains("aapt2"), "{error}");
}

#[test]
fn host_inspection_failure_stays_infrastructure() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let badger = FakeBadger::base("base.apk");
    let inspector =
        FakeInspector::new("1.0.0", 100).failing(Error::infrastructure("inspection host crashed"));
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase);
    let provider = play_provider(&badger, &inspector, &backend);

    let error = provider
        .download(&request(&out), PlayAuth::Dispenser)
        .expect_err("host inspection failure");
    assert!(
        error
            .message()
            .contains("Failed to inspect downloaded APKM"),
        "{error}"
    );
    assert!(
        error.message().contains("inspection host crashed"),
        "{error}"
    );
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);

    let acquirer = Acquirer {
        apkeep: None,
        play: Some(&provider),
        apkmirror: None,
        retry: RetryPolicy::default(),
    };
    let error = acquirer
        .acquire(&request(&out), Some(&[] as &[AccountConfig]), None)
        .expect_err("aggregate keeps infrastructure class");
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
}

#[test]
fn malformed_artifact_stays_invalid_artifact() {
    let dir = TempDir::new().expect("temp dir");
    let out = dir.path().join("out");
    fs::create_dir_all(&out).expect("out dir");
    let mut badger = FakeBadger::default();
    badger.failures.insert(
        "base.apk".to_string(),
        Error::invalid_artifact("malformed AndroidManifest.xml"),
    );
    let inspector = FakeInspector::new("1.0.0", 100);
    let backend = FakePlayBackend::new("1.0.0", 100, DownloadBehavior::WriteBase);
    let provider = play_provider(&badger, &inspector, &backend);

    let error = provider
        .download(&request(&out), PlayAuth::Dispenser)
        .expect_err("malformed artifact");
    assert!(
        error.message().contains("malformed AndroidManifest.xml"),
        "{error}"
    );
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
}

// ---------------------------------------------------------------------------
// Tests: package-name validation
// ---------------------------------------------------------------------------

#[test]
fn package_names_are_validated_before_output_paths_are_created() {
    let dir = TempDir::new().expect("temp dir");
    for (index, name) in [
        "../../x",
        "/abs",
        "a/b",
        "a\\b",
        "..",
        ".",
        "",
        "nul\0",
        "nested/../../escape",
    ]
    .into_iter()
    .enumerate()
    {
        assert!(
            validate_package_name(name).is_err(),
            "{name:?} must be rejected"
        );
        let out = dir.path().join(format!("rejected-{index}"));
        let error = acquire_artifact(name, &out, None, None)
            .expect_err("invalid package name must fail before path creation");
        assert_eq!(error.exit_code(), ExitCode::UsageOrToolError, "{name:?}");
        assert!(error.message().contains("Invalid package name"), "{error}");
        assert!(!out.exists(), "{name:?} created {}", out.display());
    }
    assert!(validate_package_name("com.example.app").is_ok());

    let out = dir.path().join("acquirer-rejected");
    let acquirer = Acquirer {
        apkeep: None,
        play: None,
        apkmirror: None,
        retry: RetryPolicy::default(),
    };
    let invalid = ProviderRequest {
        package_name: "../../x",
        out_dir: &out,
        expected_version: None,
        expected_version_code: None,
    };
    let error = acquirer
        .acquire(&invalid, None, None)
        .expect_err("acquirer validates before routing");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(!out.exists());
}

// ---------------------------------------------------------------------------
// Tests: dispenser response bound
// ---------------------------------------------------------------------------

struct EndlessStream {
    served: usize,
}

impl Read for EndlessStream {
    fn read(&mut self, buffer: &mut [u8]) -> std::io::Result<usize> {
        buffer.fill(b'x');
        self.served += buffer.len();
        Ok(buffer.len())
    }
}

#[test]
fn dispenser_response_is_hard_bounded() {
    let limit = MAX_DISPENSER_RESPONSE_BYTES;

    let exact = vec![b'x'; limit];
    let body = read_dispenser_response(Cursor::new(exact), limit).expect("exact limit is allowed");
    assert_eq!(body.len(), limit);

    let oversized = vec![b'x'; limit + 1];
    let error =
        read_dispenser_response(Cursor::new(oversized), limit).expect_err("limit + 1 must fail");
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
    assert!(
        error.message().contains(&format!("{limit}-byte limit")),
        "{error}"
    );

    let mut endless = EndlessStream { served: 0 };
    let error = read_dispenser_response(&mut endless, limit).expect_err("endless stream must fail");
    assert_eq!(error.exit_code(), ExitCode::InfrastructureFailure);
    assert!(error.message().contains("exceeded"), "{error}");
    assert_eq!(
        endless.served,
        limit + 1,
        "reader must stop after the limit and a single probe byte"
    );
}

// ---------------------------------------------------------------------------
// Tests: ProcessSpec Debug redaction
// ---------------------------------------------------------------------------

#[test]
fn process_spec_debug_output_redacts_secrets() {
    let spec = ProcessSpec::new("tool")
        .arg("--token")
        .arg("argv-secret-value")
        .arg("visible")
        .secret("argv-secret-value")
        .secret("unreferenced-secret");
    let rendered = format!("{spec:?}");
    assert!(!rendered.contains("argv-secret-value"), "{rendered}");
    assert!(!rendered.contains("unreferenced-secret"), "{rendered}");
    assert!(rendered.contains("[REDACTED]"), "{rendered}");
    assert!(rendered.contains("visible"), "{rendered}");
}
