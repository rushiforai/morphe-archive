//! Native APK acquisition orchestration and deterministic APKM normalization.
//!
//! Provider order: enabled `apkeep` accounts, direct AAS tokens, the dispenser
//! when no direct token qualifies, the configured APKMirror mapping, then the
//! APKPure last resort through `apkeep`. Serialized source labels stay
//! compatible (`apkeep`, `goopdl`, `apkmirror`, `manual`) and gain `apkpure`
//! for the fallback; the `goopdl` label denotes native Play delivery and never
//! implies a Python subprocess.
//!
//! Every provider is a trait so tests can exercise routing, account rotation,
//! retries and cleanup without a network, a device, or a real credential. Each
//! download lands in a temporary attempt directory owned by the provider and is
//! normalized, inspected, and only then promoted to the advertised output path.
//! A failed attempt therefore cannot leave a partial APKM at `out_dir`.
//!
//! Secrets are centralized in [`Redactor`], which runs before diagnostic
//! truncation. Account files are read only from explicit inputs; OAuth and AAS
//! material never appears in a subprocess argv.

use crate::archives;
use crate::error::Error;
use crate::inspection::{self, InspectionOptions};
use crate::models::{AndroidManifestInfo, ContainerType, ExitCode};
pub use crate::play::AccountConfig;
use crate::play::{AccountsFile, AuthContext, GpapiBackend, Mode, PlayBackend};
use crate::process::{self, ProcessSpec};
use crate::tools::{
    default_repo_root, find_build_tools_bin, ToolEnvironment, ToolManager, ToolType,
};
use crate::workspace::validate_package_name;
use serde::Deserialize;

/// Run one complete Play attempt on a runtime this helper creates and destroys.
///
/// `ci run` executes acquisition from inside a multi-thread Tokio runtime, and
/// dropping a runtime from that asynchronous context can panic. When a handle
/// exists, enter `block_in_place` and create, drive, and drop the current-thread
/// runtime inside that blocking scope; otherwise do the same on the caller's
/// thread. The runtime is dropped before the closure returns on both the success
/// and error paths, so an attempt never leaks a background reactor.
fn run_play_attempt<T, F>(operation: F) -> Result<T, Error>
where
    F: FnOnce(&tokio::runtime::Runtime) -> Result<T, Error>,
{
    let build = || {
        tokio::runtime::Builder::new_current_thread()
            .enable_all()
            .build()
            .map_err(|error| {
                Error::infrastructure(format!("could not create the Play runtime: {error}"))
            })
    };

    if tokio::runtime::Handle::try_current().is_ok() {
        tokio::task::block_in_place(|| {
            let runtime = build()?;
            let result = operation(&runtime);
            drop(runtime);
            result
        })
    } else {
        let runtime = build()?;
        let result = operation(&runtime);
        drop(runtime);
        result
    }
}

use serde::Serialize;
use sha2::{Digest, Sha256};
use std::collections::BTreeSet;
use std::fs::{self, File};
use std::io::{self, Read, Write};
#[cfg(unix)]
use std::os::unix::fs::OpenOptionsExt;
use std::path::{Path, PathBuf};
use std::time::{Duration, Instant};
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, DateTime, ZipWriter};

/// Fixed ZIP timestamp required for byte-stable APKM containers.
pub const FIXED_ZIP_YEAR: u16 = 2026;
pub const FIXED_ZIP_MONTH: u8 = 1;
pub const FIXED_ZIP_DAY: u8 = 1;
/// Maximum retained diagnostic characters, applied after redaction.
pub const STDERR_DIAGNOSTIC_LIMIT: usize = 300;

/// Credential-carrying variables that acquisition children never receive.
/// [`crate::process::DEFAULT_REMOVED_ENV`] always removes the account document
/// and file path; these are the provider-specific additions.
pub const CHILD_SECRET_ENV: &[&str] = &["APKEEP_AAS_TOKEN", "APKEEP_OAUTH_TOKEN"];

/// Applies the acquisition environment policy to a child specification.
fn scrub_child_environment(mut spec: ProcessSpec) -> ProcessSpec {
    for variable in CHILD_SECRET_ENV {
        spec = spec.remove_env(*variable);
    }
    spec
}

/// Default bound for one provider subprocess.
pub const DOWNLOAD_TIMEOUT: Duration = Duration::from_secs(180);
/// The one deadline that bounds authentication, details, and download for a
/// single Play attempt. Expiry is an infrastructure failure so account rotation
/// and APKMirror fallback still run.
pub const PLAY_ATTEMPT_TIMEOUT: Duration = Duration::from_secs(180);
/// `apkeep` gives no timeout in the oracle; the native path still bounds it.
pub const APKEEP_TIMEOUT: Duration = Duration::from_secs(600);
/// Android profile sent to `apkeep`, matching the oracle exactly.
pub const APKEEP_DEVICE_OPTION: &str = "device=px_9a,locale=en_US,timezone=UTC,split_apk=true";
/// Aurora dispenser endpoint proven by the native Play probe.
pub const DEFAULT_DISPENSER_URL: &str = "https://auroraoss.com/api/auth";
/// `apkeep` download source for APKPure. Last-resort only: APKPure repackages
/// third-party builds, so a fixture acquired here is never the Play-signed
/// artifact and the serialized source must say so.
pub const APKPURE_SOURCE: &str = "apk-pure";
/// `apkeep` refuses APKPure downloads unless the operator acknowledges the EFF
/// advisory. Only the fallback path passes it, and only as an explicit argv
/// token so the acknowledgement is auditable.
pub const APKPURE_ACKNOWLEDGE_OPTION: &str = "acknowledge_dangers=true";

const STREAM_BUFFER_BYTES: usize = 64 * 1024;
const DISPENSER_ACCOUNT_LABEL: &str = "dispenser";
const DISPENSER_ACCOUNT_EMAIL: &str = "dispenser@localhost";
const ACCOUNTS_CONFIG_DIR: &str = "aidans-patches";
const ACCOUNTS_FILE_NAME: &str = "google-play-accounts.json";

/// Stable acquisition-source labels. The values are serialized by consumers.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum AcquisitionSource {
    Apkeep,
    Goopdl,
    Apkmirror,
    Apkpure,
    Manual,
}

impl AcquisitionSource {
    #[must_use]
    pub const fn label(self) -> &'static str {
        match self {
            Self::Apkeep => "apkeep",
            Self::Goopdl => "goopdl",
            Self::Apkmirror => "apkmirror",
            Self::Apkpure => "apkpure",
            Self::Manual => "manual",
        }
    }
}

/// One normalized acquisition result.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct AcquiredArtifact {
    pub path: PathBuf,
    pub source: AcquisitionSource,
}

/// Expected version constraints. Both fields may be absent.
#[derive(Clone, Copy, Debug)]
pub struct ProviderRequest<'a> {
    pub package_name: &'a str,
    pub out_dir: &'a Path,
    pub expected_version: Option<&'a str>,
    pub expected_version_code: Option<u64>,
}

impl<'a> Default for ProviderRequest<'a> {
    fn default() -> Self {
        Self {
            package_name: "",
            out_dir: Path::new(""),
            expected_version: None,
            expected_version_code: None,
        }
    }
}

/// Bounded retry policy. The oracle performs one attempt per provider/account;
/// callers that opt into retries apply them only to infrastructure failures.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct RetryPolicy {
    pub attempts: u32,
}

impl RetryPolicy {
    #[must_use]
    pub const fn new(attempts: u32) -> Self {
        Self {
            attempts: if attempts == 0 { 1 } else { attempts },
        }
    }
}

impl Default for RetryPolicy {
    fn default() -> Self {
        Self::new(1)
    }
}

/// Manifest reader seam used by normalization.
pub trait ApkBadger {
    fn badging(&self, apk: &Path) -> Result<AndroidManifestInfo, Error>;
}

/// Narrow version-inspection seam used before promotion.
pub trait ArtifactInspector {
    fn version(&self, artifact: &Path) -> Result<ArtifactVersion, Error>;
}

/// The two fields acquisition needs from a full artifact inspection.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ArtifactVersion {
    pub version_name: String,
    pub version_code: u64,
}

/// Subprocess outcome seam. Diagnostics are returned unredacted; providers run
/// them through [`Redactor`] before formatting an error.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct CommandOutcome {
    pub success: bool,
    pub exit_code: Option<i32>,
    pub stdout: String,
    pub stderr: String,
    pub timed_out: bool,
}

pub trait CommandRunner {
    fn run(
        &self,
        program: &Path,
        args: &[String],
        cwd: Option<&Path>,
        timeout: Duration,
        secrets: &[String],
    ) -> Result<CommandOutcome, String>;
}

/// Resolves the `apkeep` executable (and a JAR prefix when the tool is a JAR).
pub trait ApkeepTool {
    fn command(&self) -> Result<(PathBuf, Vec<String>), Error>;
}

/// Resolves `node` or `bun` for the retained APKMirror CJS runner.
pub trait NodeRuntime {
    fn locate(&self) -> Option<PathBuf>;
}

pub trait ApkeepProvider {
    fn is_available(&self) -> bool;
    fn download(
        &self,
        request: &ProviderRequest,
        account: &AccountConfig,
    ) -> Result<PathBuf, Error>;
}

/// Authentication shape for one native Play attempt.
pub enum PlayAuth<'a> {
    Direct(&'a AccountConfig),
    Dispenser,
}

pub trait PlayProvider {
    fn download(&self, request: &ProviderRequest, auth: PlayAuth<'_>) -> Result<PathBuf, Error>;
}

pub trait ApkmirrorProvider {
    fn download(&self, request: &ProviderRequest) -> Result<PathBuf, Error>;
}

/// APKPure fallback provider. Runs only after every first-party source failed.
pub trait ApkpureProvider {
    fn download(&self, request: &ProviderRequest) -> Result<PathBuf, Error>;
}

/// The APKMirror mapping the Python oracle ships. Kept verbatim so existing
/// packages keep their repository and artifact type.
pub const APKMIRROR_APP_MAP: &[(&str, ApkmirrorMapping)] = &[
    (
        "com.sezzle.sezzlemobile",
        ApkmirrorMapping {
            org: "sezzle",
            repo: "sezzle-buy-now-pay-later",
            app_type: "bundle",
        },
    ),
    (
        "com.adobe.scan.android",
        ApkmirrorMapping {
            org: "adobe",
            repo: "adobe-scan-pdf-scanner-ocr",
            app_type: "bundle",
        },
    ),
    (
        "com.aftership.AfterShip",
        ApkmirrorMapping {
            org: "aftership-ltd",
            repo: "aftership-package-tracker",
            app_type: "apk",
        },
    ),
    (
        "com.instructure.candroid",
        ApkmirrorMapping {
            org: "instructure",
            repo: "canvas-student",
            app_type: "bundle",
        },
    ),
    (
        "com.sidelineswap.android",
        ApkmirrorMapping {
            org: "sidelineswap",
            repo: "sidelineswap-buy-sell-sports-gear",
            app_type: "apk",
        },
    ),
    (
        "com.tripledot.blackjack",
        ApkmirrorMapping {
            org: "tripledot-studios-limited",
            repo: "blackjack-2",
            app_type: "bundle",
        },
    ),
];

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct ApkmirrorMapping {
    pub org: &'static str,
    pub repo: &'static str,
    pub app_type: &'static str,
}

/// Looks up the configured APKMirror repository for one package.
#[must_use]
pub fn apkmirror_mapping(package_name: &str) -> Option<ApkmirrorMapping> {
    APKMIRROR_APP_MAP
        .iter()
        .find(|(package, _)| *package == package_name)
        .map(|(_, mapping)| *mapping)
}

/// Resolves the `apkeep` `-a` argument. `apkeep` accepts `app_id@version`, so a
/// requested version is asked for instead of downloading the newest build and
/// failing validation afterwards.
fn apkeep_app_spec(package_name: &str, version: Option<&str>) -> String {
    match version.filter(|value| !value.is_empty()) {
        Some(version) => format!("{package_name}@{version}"),
        None => package_name.to_string(),
    }
}

/// Builds the exact `apkeep` argument list for Google Play (apkeep 1.1.0).
#[must_use]
pub fn build_apkeep_args(
    package_name: &str,
    version: Option<&str>,
    ini_path: &Path,
    out_dir: &Path,
) -> Vec<String> {
    vec![
        "-a".to_string(),
        apkeep_app_spec(package_name, version),
        "-d".to_string(),
        "google-play".to_string(),
        "-i".to_string(),
        ini_path.to_string_lossy().into_owned(),
        "-o".to_string(),
        APKEEP_DEVICE_OPTION.to_string(),
        out_dir.to_string_lossy().into_owned(),
    ]
}

/// Builds the exact `apkeep` argument list for the APKPure fallback. No
/// credential file is passed because APKPure needs none, and the EFF advisory
/// acknowledgement is explicit so the download is auditable.
#[must_use]
pub fn build_apkpure_args(
    package_name: &str,
    version: Option<&str>,
    out_dir: &Path,
) -> Vec<String> {
    vec![
        "-a".to_string(),
        apkeep_app_spec(package_name, version),
        "-d".to_string(),
        APKPURE_SOURCE.to_string(),
        "-o".to_string(),
        APKPURE_ACKNOWLEDGE_OPTION.to_string(),
        out_dir.to_string_lossy().into_owned(),
    ]
}

/// Builds the exact APKMirror CJS runner argument list.
#[must_use]
pub fn build_apkmirror_args(
    runner_script: &Path,
    mapping: ApkmirrorMapping,
    version: &str,
    out_dir: &Path,
) -> Vec<String> {
    vec![
        runner_script.to_string_lossy().into_owned(),
        mapping.org.to_string(),
        mapping.repo.to_string(),
        version.to_string(),
        mapping.app_type.to_string(),
        out_dir.to_string_lossy().into_owned(),
    ]
}

/// Default CJS runner location, resolved from the repository root first and the
/// compiled crate directory second. The runner itself is unchanged.
#[must_use]
pub fn default_apkmirror_runner() -> PathBuf {
    let from_repo = default_repo_root().join("tools/apk-lab/apkmirror_runner.cjs");
    if from_repo.is_file() {
        from_repo
    } else {
        Path::new(env!("CARGO_MANIFEST_DIR")).join("apkmirror_runner.cjs")
    }
}

/// Centralized secret replacement. Longer secrets are applied first so an
/// overlapping shorter secret cannot leave a suffix behind.
#[derive(Clone, Debug, Default)]
pub struct Redactor {
    replacements: Vec<(String, String)>,
}

impl Redactor {
    #[must_use]
    pub fn for_account(account: &AccountConfig) -> Self {
        let mut redactor = Self::default();
        redactor.push_token(&account.aas_token);
        redactor.push_email(&account.email);
        redactor
    }

    pub fn push_token(&mut self, token: &str) {
        self.push_variants(token, "[REDACTED_TOKEN]");
    }

    pub fn push_email(&mut self, email: &str) {
        if !email.is_empty() {
            let replacement = redacted_email(email);
            self.push_variants(email, &replacement);
        }
    }

    pub fn push_secret(&mut self, secret: &str) {
        self.push_variants(secret, "[REDACTED]");
    }

    /// Registers the raw secret plus every normalization an upstream library or
    /// URL builder may produce: RFC 3986 percent-encoding with uppercase and
    /// lowercase hex, and the slash-only form used by AAS tokens
    /// (`aas_et%2F...`). Replacement values never contain a variant.
    fn push_variants(&mut self, secret: &str, replacement: &str) {
        if secret.is_empty() {
            return;
        }
        let mut variants = vec![
            secret.to_string(),
            percent_encode(secret, true),
            percent_encode(secret, false),
            secret.replace('/', "%2F"),
            secret.replace('/', "%2f"),
        ];
        variants.sort_by_key(|variant| std::cmp::Reverse(variant.len()));
        variants.dedup();
        for variant in variants {
            if variant != replacement {
                self.replacements.push((variant, replacement.to_string()));
            }
        }
    }

    #[must_use]
    pub fn redact(&self, text: &str) -> String {
        let mut replacements = self.replacements.clone();
        replacements.sort_by_key(|(secret, _)| std::cmp::Reverse(secret.len()));
        let mut redacted = text.to_string();
        for (secret, replacement) in replacements {
            redacted = redacted.replace(&secret, &replacement);
        }
        redacted
    }
}

/// Percent-encodes every byte outside the RFC 3986 unreserved set
/// (`ALPHA / DIGIT / "-" / "." / "_" / "~"`). Hex digits are uppercase when
/// `uppercase` is true and lowercase otherwise.
#[must_use]
pub fn percent_encode(input: &str, uppercase: bool) -> String {
    const UPPER: &[u8; 16] = b"0123456789ABCDEF";
    const LOWER: &[u8; 16] = b"0123456789abcdef";
    let digits = if uppercase { UPPER } else { LOWER };
    let mut encoded = String::with_capacity(input.len());
    for byte in input.bytes() {
        if byte.is_ascii_alphanumeric() || matches!(byte, b'-' | b'.' | b'_' | b'~') {
            encoded.push(char::from(byte));
        } else {
            encoded.push('%');
            encoded.push(char::from(digits[usize::from(byte >> 4)]));
            encoded.push(char::from(digits[usize::from(byte & 0x0f)]));
        }
    }
    encoded
}

/// Redacts first, then truncates. Truncating first could slice a secret in half
/// and defeat the replacement.
#[must_use]
pub fn sanitize_diagnostic(text: &str, redactor: &Redactor) -> String {
    redactor
        .redact(text)
        .chars()
        .take(STDERR_DIAGNOSTIC_LIMIT)
        .collect()
}

/// Mirrors the oracle's email redaction used in diagnostics.
#[must_use]
pub fn redacted_email(email: &str) -> String {
    let Some((user, domain)) = email.split_once('@') else {
        return "***".to_string();
    };
    let keep = if user.chars().count() <= 2 { 1 } else { 2 };
    let prefix: String = user.chars().take(keep).collect();
    format!("{prefix}***@{domain}")
}

/// Explicit account configuration inputs. Tests pass a synthetic environment
/// instead of mutating process globals.
#[derive(Clone, Debug, Default)]
pub struct AccountsEnvironment {
    pub env_accounts: Option<String>,
    pub explicit_file: Option<PathBuf>,
    pub env_file: Option<PathBuf>,
    pub config_home: Option<PathBuf>,
    pub home: Option<PathBuf>,
}

impl AccountsEnvironment {
    #[must_use]
    pub fn from_process() -> Self {
        Self {
            env_accounts: std::env::var("APKEEP_ACCOUNTS").ok(),
            explicit_file: None,
            env_file: std::env::var_os("APKEEP_ACCOUNTS_FILE").map(PathBuf::from),
            config_home: std::env::var_os("XDG_CONFIG_HOME").map(PathBuf::from),
            home: std::env::var_os("HOME").map(PathBuf::from),
        }
    }
}

/// Loads accounts with the oracle's precedence: inline environment JSON, then
/// an explicit/default file. `Ok(None)` means no configuration source exists.
pub fn load_accounts(
    environment: &AccountsEnvironment,
) -> Result<Option<Vec<AccountConfig>>, Error> {
    if let Some(raw) = environment
        .env_accounts
        .as_deref()
        .filter(|raw| !raw.trim().is_empty())
    {
        return parse_accounts_document(raw.trim(), "APKEEP_ACCOUNTS").map(Some);
    }

    let target = environment
        .explicit_file
        .clone()
        .or_else(|| default_accounts_path(environment));
    let Some(path) = target else {
        return Ok(None);
    };
    let raw = match read_private_file(&path, "Accounts file") {
        Ok(raw) => raw,
        Err(error) if error.kind() == io::ErrorKind::NotFound => return Ok(None),
        Err(error) => return Err(Error::usage(error.to_string())),
    };
    parse_accounts_document(&raw, &path.display().to_string()).map(Some)
}

fn default_accounts_path(environment: &AccountsEnvironment) -> Option<PathBuf> {
    if let Some(path) = environment.env_file.clone() {
        return Some(expand_home(path, environment.home.as_deref()));
    }
    if let Some(base) = environment.config_home.as_ref() {
        let base = expand_home(base.clone(), environment.home.as_deref());
        return Some(base.join(ACCOUNTS_CONFIG_DIR).join(ACCOUNTS_FILE_NAME));
    }
    environment.home.as_ref().map(|home| {
        home.join(".config")
            .join(ACCOUNTS_CONFIG_DIR)
            .join(ACCOUNTS_FILE_NAME)
    })
}

fn expand_home(path: PathBuf, home: Option<&Path>) -> PathBuf {
    let Some(home) = home else {
        return path;
    };
    let Some(text) = path.to_str() else {
        return path;
    };
    match text.strip_prefix("~/") {
        Some(rest) => home.join(rest),
        None => path,
    }
}

/// Opens and validates one private file descriptor without consuming it.
///
/// On Unix the descriptor is opened with `O_NOFOLLOW | O_CLOEXEC` (plus
/// `O_NONBLOCK` so a FIFO cannot stall the open), then `fstat` validates the
/// *opened* object: regular file, owned by the effective uid, and no group or
/// world permission bits. A symlink swapped in after any earlier metadata check
/// is therefore rejected instead of followed.
#[cfg(unix)]
fn open_private_file(path: &Path, label: &str) -> io::Result<File> {
    use std::os::unix::fs::MetadataExt;

    let mut options = std::fs::OpenOptions::new();
    options
        .read(true)
        .custom_flags(libc::O_NOFOLLOW | libc::O_CLOEXEC | libc::O_NONBLOCK);
    let file = match options.open(path) {
        Ok(file) => file,
        Err(error) if error.raw_os_error() == Some(libc::ELOOP) => {
            return Err(io::Error::new(
                io::ErrorKind::PermissionDenied,
                format!("{label} cannot be a symlink: {}", path.display()),
            ))
        }
        Err(error) => return Err(error),
    };
    let metadata = file.metadata()?;
    if !metadata.file_type().is_file() {
        return Err(io::Error::new(
            io::ErrorKind::PermissionDenied,
            format!("{label} must be a regular file: {}", path.display()),
        ));
    }
    // `geteuid` cannot fail and has no side effects.
    let effective_uid = unsafe { libc::geteuid() };
    if metadata.uid() != effective_uid {
        return Err(io::Error::new(
            io::ErrorKind::PermissionDenied,
            format!(
                "{label} {} is owned by uid {} but the effective uid is {effective_uid}",
                path.display(),
                metadata.uid()
            ),
        ));
    }
    let mode = metadata.mode() & 0o777;
    if mode & 0o077 != 0 {
        return Err(io::Error::new(
            io::ErrorKind::PermissionDenied,
            format!(
                "{label} {} has insecure permissions {mode:04o}; must not be group/world readable (expected 0600)",
                path.display()
            ),
        ));
    }
    Ok(file)
}

/// Non-Unix fallback: best-effort regular-file check.
#[cfg(not(unix))]
fn open_private_file(path: &Path, label: &str) -> io::Result<File> {
    let file = File::open(path)?;
    if !file.metadata()?.is_file() {
        return Err(io::Error::new(
            io::ErrorKind::PermissionDenied,
            format!("{label} must be a regular file: {}", path.display()),
        ));
    }
    Ok(file)
}

/// Validates a private file without reading its contents.
///
/// # Errors
///
/// `NotFound` is passed through; policy violations are `PermissionDenied`.
pub fn check_private_file(path: &Path, label: &str) -> io::Result<()> {
    open_private_file(path, label).map(|_| ())
}

/// Reads one private file from a single checked descriptor.
///
/// The descriptor and policy checks are shared with [`check_private_file`]; the
/// same descriptor supplies the bytes, so there is no path-based reopen.
///
/// # Errors
///
/// `NotFound` is passed through so callers can treat a missing configuration as
/// absent. Policy violations are `PermissionDenied` with an actionable message.
pub fn read_private_file(path: &Path, label: &str) -> io::Result<String> {
    let mut file = open_private_file(path, label)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    Ok(content)
}

/// Parses and validates a version-1 accounts document, normalizing emails to
/// lower case and rejecting duplicates exactly as the oracle does.
pub fn parse_accounts_document(raw: &str, source: &str) -> Result<Vec<AccountConfig>, Error> {
    let document: AccountsFile = serde_json::from_str(raw)
        .map_err(|error| Error::usage(format!("Invalid JSON payload from {source}: {error}")))?;
    if document.version != 1 {
        return Err(Error::usage(format!(
            "Unsupported schema version in {source}: {}; only version 1 is supported",
            document.version
        )));
    }

    let mut seen_emails = BTreeSet::new();
    let mut validated = Vec::with_capacity(document.accounts.len());
    for account in document.accounts {
        let label = account.label.trim();
        if label.is_empty() {
            return Err(Error::usage("Account label must be a non-empty string"));
        }
        let email = account.email.trim();
        if email.is_empty() {
            return Err(Error::usage("Account email must be a non-empty string"));
        }
        if !email_is_well_formed(email) {
            return Err(Error::usage(format!(
                "Account email '{email}' is malformed"
            )));
        }
        let email = email.to_ascii_lowercase();
        if !seen_emails.insert(email.clone()) {
            return Err(Error::usage(format!(
                "Duplicate email found in accounts: {email}"
            )));
        }
        let aas_token = account.aas_token.trim();
        if aas_token.is_empty() {
            return Err(Error::usage("Account aasToken must be a non-empty string"));
        }
        let device = account.device.trim();
        if device.is_empty() {
            return Err(Error::usage("Account device must be a non-empty string"));
        }
        let locale = account.locale.trim();
        if locale.is_empty() {
            return Err(Error::usage("Account locale must be a non-empty string"));
        }
        let timezone = account.timezone.trim();
        if timezone.is_empty() {
            return Err(Error::usage("Account timezone must be a non-empty string"));
        }
        for (name, value) in [
            ("label", label),
            ("email", email.as_str()),
            ("aasToken", aas_token),
            ("device", device),
            ("locale", locale),
            ("timezone", timezone),
        ] {
            if value.contains(['\n', '\r', '\0']) {
                return Err(Error::usage(format!(
                    "Account {name} must not contain control characters"
                )));
            }
        }

        validated.push(AccountConfig {
            label: label.to_string(),
            email,
            aas_token: aas_token.to_string(),
            device: device.to_string(),
            locale: locale.to_string(),
            timezone: timezone.to_string(),
            enabled: account.enabled,
        });
    }

    if !validated.iter().any(|account| account.enabled) {
        return Err(Error::usage("No enabled accounts configured"));
    }
    Ok(validated)
}

fn email_is_well_formed(email: &str) -> bool {
    if email.chars().any(char::is_whitespace) {
        return false;
    }
    let mut parts = email.split('@');
    let Some(user) = parts.next() else {
        return false;
    };
    let Some(domain) = parts.next() else {
        return false;
    };
    if parts.next().is_some() || user.is_empty() || domain.is_empty() {
        return false;
    }
    let mut labels = domain.split('.');
    let Some(first) = labels.next() else {
        return false;
    };
    !first.is_empty() && labels.all(|label| !label.is_empty())
}

/// Normalizes split APK files into a deterministic APKM, validates it, and only
/// then persists it at `out_apkm_path`.
pub fn normalize_apks_to_apkm(
    apk_files: &[PathBuf],
    out_apkm_path: &Path,
    badger: &dyn ApkBadger,
) -> Result<PathBuf, Error> {
    if apk_files.is_empty() {
        return Err(Error::invalid_artifact(
            "No APK files supplied for normalization",
        ));
    }

    let mut valid = Vec::new();
    for apk in apk_files {
        let is_apk = apk.extension().is_some_and(|extension| extension == "apk");
        if apk.is_file() && is_apk {
            valid.push(apk.clone());
        }
    }
    if valid.is_empty() {
        return Err(Error::invalid_artifact(
            "No valid APK files found to package into APKM",
        ));
    }

    let mut base: Option<(PathBuf, AndroidManifestInfo)> = None;
    let mut splits: Vec<(PathBuf, AndroidManifestInfo)> = Vec::new();
    let mut common_package: Option<String> = None;
    let mut common_code: Option<u64> = None;

    for apk in valid {
        let name = apk
            .file_name()
            .and_then(|name| name.to_str())
            .ok_or_else(|| {
                Error::invalid_artifact(format!(
                    "APK file name is not valid UTF-8: {}",
                    apk.display()
                ))
            })?
            .to_string();
        let info = badger.badging(&apk).map_err(|error| {
            error_like(
                &error,
                format!(
                    "Failed to inspect APK badging for {name}: {}",
                    error.message()
                ),
            )
        })?;

        match (&common_package, &common_code) {
            (None, None) => {
                common_package = Some(info.package_name.clone());
                common_code = Some(info.version_code);
            }
            (Some(package), Some(code)) => {
                if info.package_name != *package {
                    return Err(Error::invalid_artifact(format!(
                        "Package name mismatch in {name}: '{}' != '{package}'",
                        info.package_name
                    )));
                }
                if info.version_code != *code {
                    return Err(Error::invalid_artifact(format!(
                        "Version code mismatch in {name}: {} != {code}",
                        info.version_code
                    )));
                }
            }
            _ => unreachable!("package name and version code are set together"),
        }

        if info.split_name.is_some() {
            splits.push((apk, info));
        } else if base.is_some() {
            let names: Vec<String> = std::iter::once(
                base.as_ref()
                    .expect("base is present")
                    .0
                    .file_name()
                    .map_or_else(String::new, |name| name.to_string_lossy().into_owned()),
            )
            .chain(std::iter::once(name))
            .collect();
            return Err(Error::invalid_artifact(format!(
                "Multiple base APKs found among acquired files: {names:?}"
            )));
        } else {
            base = Some((apk, info));
        }
    }

    let Some((base_path, _)) = base else {
        return Err(Error::invalid_artifact(
            "No base APK found among acquired files: all files declare split attributes",
        ));
    };

    let mut named: Vec<(String, PathBuf)> = vec![("base.apk".to_string(), base_path)];
    let mut target_names: BTreeSet<String> = BTreeSet::from(["base.apk".to_string()]);
    for (apk, _) in splits {
        let name = apk
            .file_name()
            .and_then(|name| name.to_str())
            .ok_or_else(|| {
                Error::invalid_artifact(format!(
                    "APK file name is not valid UTF-8: {}",
                    apk.display()
                ))
            })?
            .to_string();
        if !target_names.insert(name.clone()) {
            return Err(Error::invalid_artifact(format!(
                "Duplicate entry name {name} in normalization"
            )));
        }
        named.push((name, apk));
    }
    named.sort_by(|left, right| left.0.cmp(&right.0));

    let parent = out_apkm_path.parent().unwrap_or_else(|| Path::new("."));
    fs::create_dir_all(parent)
        .map_err(|error| Error::io(format!("create APKM directory {}", parent.display()), error))?;

    let expected_names: Vec<String> = named.iter().map(|(name, _)| name.clone()).collect();
    let mut source_hashes: Vec<(String, String)> = Vec::with_capacity(named.len());
    let mut temp = tempfile::Builder::new()
        .prefix(".apkm-normalize-")
        .suffix(".tmp")
        .tempfile_in(parent)
        .map_err(|error| Error::io("create APKM staging file", error))?;

    {
        let timestamp =
            DateTime::from_date_and_time(FIXED_ZIP_YEAR, FIXED_ZIP_MONTH, FIXED_ZIP_DAY, 0, 0, 0)
                .expect("fixed ZIP timestamp is representable");
        let options = SimpleFileOptions::default()
            .compression_method(CompressionMethod::Deflated)
            .last_modified_time(timestamp)
            .external_attributes(0o644 << 16);

        let mut writer = ZipWriter::new(temp.as_file_mut());
        let mut buffer = vec![0u8; STREAM_BUFFER_BYTES];
        for (name, source) in &named {
            writer.start_file(name, options).map_err(|error| {
                Error::invalid_artifact(format!("write APKM member {name}: {error}"))
            })?;
            let mut input = File::open(source)
                .map_err(|error| Error::io(format!("open APK {}", source.display()), error))?;
            let mut hasher = Sha256::new();
            loop {
                let read = input
                    .read(&mut buffer)
                    .map_err(|error| Error::io(format!("read APK {}", source.display()), error))?;
                if read == 0 {
                    break;
                }
                writer.write_all(&buffer[..read]).map_err(|error| {
                    Error::invalid_artifact(format!("write APKM member {name}: {error}"))
                })?;
                hasher.update(&buffer[..read]);
            }
            source_hashes.push((name.clone(), format!("{:x}", hasher.finalize())));
        }
        writer
            .finish()
            .map_err(|error| Error::invalid_artifact(format!("finish APKM archive: {error}")))?;
    }
    temp.as_file_mut()
        .sync_all()
        .map_err(|error| Error::io("flush APKM staging file", error))?;

    let report = archives::inspect_safe_zip_path(temp.path()).map_err(|error| {
        Error::invalid_artifact(format!("Produced APKM failed inspection: {error}"))
    })?;
    if report.container_type != ContainerType::Apkm {
        return Err(Error::invalid_artifact(format!(
            "Produced APKM failed inspection: unsupported container {:?}",
            report.container_type
        )));
    }
    let actual_names: Vec<String> = report
        .members
        .iter()
        .map(|member| member.name.clone())
        .collect();
    if actual_names != expected_names {
        return Err(Error::invalid_artifact(format!(
            "Produced APKM member order/name mismatch: {actual_names:?} != {expected_names:?}"
        )));
    }
    for (name, expected_hash) in &source_hashes {
        let actual = archives::compute_zip_member_sha256(temp.path(), name).map_err(|error| {
            Error::invalid_artifact(format!(
                "Produced APKM member {name} is unreadable: {error}"
            ))
        })?;
        if &actual != expected_hash {
            return Err(Error::invalid_artifact(format!(
                "Produced APKM member {name} digest mismatch: {actual} != {expected_hash}"
            )));
        }
    }

    temp.persist(out_apkm_path).map_err(|error| {
        Error::infrastructure(format!(
            "could not promote APKM to {}: {}",
            out_apkm_path.display(),
            error.error
        ))
    })?;
    Ok(out_apkm_path.to_path_buf())
}

/// Host manifest reader. Uses the same pinned `aapt2` resolution as inspection.
#[derive(Debug, Clone)]
pub struct HostApkBadger {
    pub env: ToolEnvironment,
    pub timeout: Duration,
}

impl HostApkBadger {
    #[must_use]
    pub fn from_process() -> Self {
        Self {
            env: ToolEnvironment::from_process(&default_repo_root()),
            timeout: inspection::DEFAULT_TOOL_TIMEOUT,
        }
    }
}

impl ApkBadger for HostApkBadger {
    fn badging(&self, apk: &Path) -> Result<AndroidManifestInfo, Error> {
        let aapt2 = find_build_tools_bin(&self.env, "aapt2")?;
        let spec = scrub_child_environment(
            ProcessSpec::new(aapt2)
                .arg("dump")
                .arg("badging")
                .arg(apk.to_string_lossy().into_owned())
                .timeout(self.timeout),
        );
        let output = process::run(&spec)?;
        if output.timed_out {
            return Err(Error::usage(format!(
                "aapt2 badging timed out after {:?}",
                self.timeout
            )));
        }
        if !output.success() {
            return Err(Error::usage(format!(
                "Failed to dump APK badging with aapt2: {}",
                sanitize_diagnostic(&output.stderr.text_lossy(), &Redactor::default())
            )));
        }
        inspection::parse_badging_text(&output.stdout.text_lossy())
            .map_err(|error| Error::invalid_artifact(format!("Unparseable aapt2 badging: {error}")))
    }
}

/// Host version inspector built on the full artifact inspection pipeline.
#[derive(Debug, Clone)]
pub struct HostArtifactInspector {
    pub options: InspectionOptions,
}

impl HostArtifactInspector {
    #[must_use]
    pub fn from_process() -> Self {
        Self {
            options: InspectionOptions::from_process(),
        }
    }
}

impl ArtifactInspector for HostArtifactInspector {
    fn version(&self, artifact: &Path) -> Result<ArtifactVersion, Error> {
        let inspection = inspection::inspect_artifact_with_options(artifact, &self.options)?;
        Ok(ArtifactVersion {
            version_name: inspection.version_name,
            version_code: inspection.version_code,
        })
    }
}

/// Executes subprocesses through the shared bounded adapter.
pub struct HostCommandRunner;

impl CommandRunner for HostCommandRunner {
    fn run(
        &self,
        program: &Path,
        args: &[String],
        cwd: Option<&Path>,
        timeout: Duration,
        secrets: &[String],
    ) -> Result<CommandOutcome, String> {
        let mut spec = scrub_child_environment(
            ProcessSpec::new(program.to_path_buf())
                .args(args.iter().cloned())
                .timeout(timeout),
        );
        if let Some(cwd) = cwd {
            spec = spec.cwd(cwd);
        }
        for secret in secrets {
            spec = spec.secret(secret.clone());
        }
        let output = process::run(&spec).map_err(|error| error.message())?;
        Ok(CommandOutcome {
            success: output.success(),
            exit_code: output.exit_code(),
            stdout: output.stdout.text_lossy(),
            stderr: output.stderr.text_lossy(),
            timed_out: output.timed_out,
        })
    }
}

/// Resolves `apkeep` from the managed tool cache.
pub struct HostApkeepTool<'a> {
    pub manager: &'a ToolManager,
}

impl<'a> HostApkeepTool<'a> {
    #[must_use]
    pub fn new(manager: &'a ToolManager) -> Self {
        Self { manager }
    }
}

impl ApkeepTool for HostApkeepTool<'_> {
    fn command(&self) -> Result<(PathBuf, Vec<String>), Error> {
        let spec = self.manager.spec("apkeep")?;
        let executable = self.manager.executable_path("apkeep")?;
        if spec.tool_type == ToolType::Jar {
            Ok((
                PathBuf::from("java"),
                vec![
                    "-jar".to_string(),
                    executable.to_string_lossy().into_owned(),
                ],
            ))
        } else {
            Ok((executable, Vec::new()))
        }
    }
}

/// Resolves `node`, then `bun`, from the configured PATH.
pub struct HostNodeRuntime {
    pub env: ToolEnvironment,
}

impl HostNodeRuntime {
    #[must_use]
    pub fn from_process() -> Self {
        Self {
            env: ToolEnvironment::from_process(&default_repo_root()),
        }
    }
}

impl NodeRuntime for HostNodeRuntime {
    fn locate(&self) -> Option<PathBuf> {
        self.env
            .find_in_path("node")
            .or_else(|| self.env.find_in_path("bun"))
    }
}

/// `apkeep` provider with injected tool, runner, manifest reader and inspector.
pub struct ApkeepAcquirer<'a> {
    pub tool: &'a dyn ApkeepTool,
    pub commands: &'a dyn CommandRunner,
    pub badger: &'a dyn ApkBadger,
    pub inspector: &'a dyn ArtifactInspector,
    pub timeout: Duration,
}

impl ApkeepProvider for ApkeepAcquirer<'_> {
    fn is_available(&self) -> bool {
        self.tool.command().is_ok()
    }

    fn download(
        &self,
        request: &ProviderRequest,
        account: &AccountConfig,
    ) -> Result<PathBuf, Error> {
        fs::create_dir_all(request.out_dir).map_err(|error| {
            Error::io(
                format!("create output directory {}", request.out_dir.display()),
                error,
            )
        })?;
        let attempt = tempfile::Builder::new()
            .prefix(&format!("apkeep-acc-{}-", sanitized_label(&account.label)))
            .tempdir_in(request.out_dir)
            .map_err(|error| Error::io("create apkeep attempt directory", error))?;

        let ini_path = attempt.path().join("credentials.ini");
        let contents = apkeep_credentials(account);
        write_private_file(&ini_path, contents.as_bytes())
            .map_err(|error| Error::io("write apkeep credentials file", error))?;

        let (program, mut args) = self.tool.command()?;
        args.extend(build_apkeep_args(
            request.package_name,
            request.expected_version,
            &ini_path,
            attempt.path(),
        ));
        let redactor = Redactor::for_account(account);
        let outcome = self
            .commands
            .run(
                &program,
                &args,
                None,
                self.timeout,
                &[account.aas_token.clone(), account.email.clone()],
            )
            .map_err(|error| {
                Error::infrastructure(format!(
                    "apkeep [{0}] could not be executed: {1}",
                    account.label,
                    sanitize_diagnostic(&error, &redactor)
                ))
            })?;

        if outcome.timed_out {
            return Err(Error::infrastructure(format!(
                "apkeep download timed out for account [{}]: {}",
                account.label,
                sanitize_diagnostic(&outcome.stderr, &redactor)
            )));
        }
        if !outcome.success {
            return Err(Error::infrastructure(format!(
                "apkeep download failed for account [{}]: {}",
                account.label,
                sanitize_diagnostic(&outcome.stderr, &redactor)
            )));
        }

        let apks = collect_apk_files(attempt.path())?;
        if apks.is_empty() {
            return Err(Error::infrastructure(format!(
                "apkeep completed but found no APK files in {}",
                attempt.path().display()
            )));
        }

        let staged = attempt
            .path()
            .join(format!("{}.apkm", request.package_name));
        normalize_apks_to_apkm(&apks, &staged, self.badger)?;
        validate_version(
            self.inspector.version(&staged).map_err(|error| {
                error_like(
                    &error,
                    format!("Failed to inspect downloaded APKM: {}", error.message()),
                )
            })?,
            request,
            VersionLabel::Apkeep,
        )?;
        promote(&staged, &advertised_apkm(request))
    }
}

/// Native Play delivery provider. Reuses the probe's authenticated backend and
/// never puts a token in argv (there is no subprocess at all).
pub struct PlayAcquirer<'a> {
    pub backend: &'a dyn PlayBackend,
    pub badger: &'a dyn ApkBadger,
    pub inspector: &'a dyn ArtifactInspector,
    pub dispenser_url: &'a str,
    /// Total budget shared by authentication, details validation, and download
    /// for one account attempt.
    pub attempt_timeout: Duration,
}

impl PlayProvider for PlayAcquirer<'_> {
    fn download(&self, request: &ProviderRequest, auth: PlayAuth<'_>) -> Result<PathBuf, Error> {
        let (mode, account, label) = match auth {
            PlayAuth::Direct(account) => (Mode::Aas, account.clone(), account.label.clone()),
            PlayAuth::Dispenser => (
                Mode::Dispenser,
                dispenser_account(),
                DISPENSER_ACCOUNT_LABEL.to_string(),
            ),
        };
        let redactor = Redactor::for_account(&account);
        let deadline = Instant::now() + self.attempt_timeout;

        fs::create_dir_all(request.out_dir).map_err(|error| {
            Error::io(
                format!("create output directory {}", request.out_dir.display()),
                error,
            )
        })?;
        let attempt = tempfile::Builder::new()
            .prefix(&format!("goopdl-acc-{}-", sanitized_label(&label)))
            .tempdir_in(request.out_dir)
            .map_err(|error| Error::io("create Play attempt directory", error))?;
        let download_dir = attempt.path().join("download");
        fs::create_dir_all(&download_dir)
            .map_err(|error| Error::io("create Play download directory", error))?;

        let context = AuthContext {
            mode,
            oauth_token: None,
            dispenser_url: self.dispenser_url,
            timeout: deadline.saturating_duration_since(Instant::now()),
        };
        let play_attempt = PlayAttempt {
            request,
            account: &account,
            context: &context,
            label: &label,
            redactor: &redactor,
            download_dir: &download_dir,
            deadline,
        };

        run_play_attempt(|runtime| runtime.block_on(self.play_attempt(&play_attempt)))?;

        let apks = collect_apk_files(&download_dir)?;
        if apks.is_empty() {
            return Err(Error::infrastructure(format!(
                "goopdl finished but no APK files were downloaded in {}",
                download_dir.display()
            )));
        }

        let staged = attempt
            .path()
            .join(format!("{}.apkm", request.package_name));
        normalize_apks_to_apkm(&apks, &staged, self.badger)?;
        validate_version(
            self.inspector.version(&staged).map_err(|error| {
                error_like(
                    &error,
                    format!("Failed to inspect downloaded APKM: {}", error.message()),
                )
            })?,
            request,
            VersionLabel::Goopdl,
        )?;
        promote(&staged, &advertised_apkm(request))
    }
}

/// Inputs shared by every stage of one Play attempt.
#[derive(Clone, Copy)]
struct PlayAttempt<'a> {
    request: &'a ProviderRequest<'a>,
    account: &'a AccountConfig,
    context: &'a AuthContext<'a>,
    label: &'a str,
    redactor: &'a Redactor,
    download_dir: &'a Path,
    deadline: Instant,
}

impl PlayAcquirer<'_> {
    /// Drives authentication, details validation, and download inside the one
    /// runtime owned by [`run_play_attempt`], under a single attempt deadline.
    async fn play_attempt(&self, attempt: &PlayAttempt<'_>) -> Result<(), Error> {
        let PlayAttempt {
            request,
            account,
            context,
            label,
            redactor,
            download_dir,
            deadline,
        } = *attempt;
        let open = self.backend.open(account, context);
        let mut session = match tokio::time::timeout(remaining(deadline), open).await {
            Ok(Ok(session)) => session,
            Ok(Err(error)) => {
                return Err(Error::infrastructure(format!(
                    "goopdl [{label}] authentication failed: {}",
                    sanitize_diagnostic(&error, redactor)
                )))
            }
            Err(_) => return Err(play_timeout(label, "authentication", self.attempt_timeout)),
        };

        let details = session.details(request.package_name);
        let details = match tokio::time::timeout(remaining(deadline), details).await {
            Ok(Ok(details)) => details,
            Ok(Err(error)) => {
                return Err(Error::infrastructure(format!(
                    "goopdl [{label}] details request failed: {}",
                    sanitize_diagnostic(&error, redactor)
                )))
            }
            Err(_) => return Err(play_timeout(label, "details", self.attempt_timeout)),
        };

        // A latest-version name expectation is checked before any bytes move.
        // A requested historical code cannot be cross-checked against details;
        // it is enforced after the download instead.
        if request.expected_version_code.is_none() {
            if let Some(expected) = request.expected_version {
                if details.version_name != expected {
                    return Err(Error::invalid_artifact(format!(
                        "goopdl downloaded version '{}' != expected '{expected}'",
                        details.version_name
                    )));
                }
            }
        }

        let version_code = request
            .expected_version_code
            .map(|code| i64::try_from(code).unwrap_or(i64::MAX));
        let download = session.download(request.package_name, version_code, download_dir);
        match tokio::time::timeout(remaining(deadline), download).await {
            Ok(Ok(())) => Ok(()),
            Ok(Err(error)) => Err(Error::infrastructure(format!(
                "goopdl [{label}] download failed: {}",
                sanitize_diagnostic(&error, redactor)
            ))),
            Err(_) => Err(play_timeout(label, "download", self.attempt_timeout)),
        }
    }
}

fn remaining(deadline: Instant) -> Duration {
    deadline.saturating_duration_since(Instant::now())
}

fn play_timeout(label: &str, stage: &str, timeout: Duration) -> Error {
    Error::infrastructure(format!(
        "goopdl [{label}] {stage} timed out after {timeout:?}"
    ))
}

/// APKMirror provider. The existing CJS runner and mappings are retained; the
/// runner is launched with Node or Bun, never Python.
pub struct ApkmirrorAcquirer<'a> {
    pub runtime: &'a dyn NodeRuntime,
    pub commands: &'a dyn CommandRunner,
    pub badger: &'a dyn ApkBadger,
    pub inspector: &'a dyn ArtifactInspector,
    pub runner_script: PathBuf,
    pub timeout: Duration,
}

impl ApkmirrorProvider for ApkmirrorAcquirer<'_> {
    fn download(&self, request: &ProviderRequest) -> Result<PathBuf, Error> {
        let mapping = apkmirror_mapping(request.package_name).ok_or_else(|| {
            Error::invalid_artifact(format!(
                "No APKMirror repository mapping configured for '{}'",
                request.package_name
            ))
        })?;
        let runtime = self.runtime.locate().ok_or_else(|| {
            Error::infrastructure(
                "Node.js or Bun is required to run apkmirror-downloader".to_string(),
            )
        })?;
        if !self.runner_script.is_file() {
            return Err(Error::infrastructure(format!(
                "APKMirror runner script not found at {}",
                self.runner_script.display()
            )));
        }

        fs::create_dir_all(request.out_dir).map_err(|error| {
            Error::io(
                format!("create output directory {}", request.out_dir.display()),
                error,
            )
        })?;
        let attempt = tempfile::Builder::new()
            .prefix("apkmirror-")
            .tempdir_in(request.out_dir)
            .map_err(|error| Error::io("create APKMirror attempt directory", error))?;

        let version = request.expected_version.unwrap_or("latest");
        let args = build_apkmirror_args(&self.runner_script, mapping, version, attempt.path());
        let redactor = Redactor::default();
        let outcome = self
            .commands
            .run(&runtime, &args, None, self.timeout, &[])
            .map_err(|error| {
                Error::infrastructure(format!(
                    "Failed to execute apkmirror-downloader: {}",
                    sanitize_diagnostic(&error, &redactor)
                ))
            })?;
        if outcome.timed_out {
            return Err(Error::infrastructure(format!(
                "apkmirror-downloader timed out for {} v{version}: {}",
                request.package_name,
                sanitize_diagnostic(&outcome.stderr, &redactor)
            )));
        }
        if !outcome.success {
            return Err(Error::infrastructure(format!(
                "apkmirror-downloader failed for {} v{version}: {}",
                request.package_name,
                sanitize_diagnostic(&outcome.stderr, &redactor)
            )));
        }

        let downloaded = first_downloaded_file(attempt.path())?.ok_or_else(|| {
            Error::infrastructure(format!(
                "apkmirror-downloader reported success but produced no APK/APKM/XAPK in {}",
                attempt.path().display()
            ))
        })?;
        let advertised = if is_bundle_extension(&downloaded) {
            let apks = extract_bundle_apks(&downloaded, attempt.path(), "APKMirror")?;
            stage_apkm(
                &apks,
                request,
                attempt.path(),
                self.badger,
                self.inspector,
                VersionLabel::Apkmirror,
            )?
        } else if mapping.app_type == "bundle" {
            let staged = attempt
                .path()
                .join(format!("{}.apkm", request.package_name));
            normalize_apks_to_apkm(std::slice::from_ref(&downloaded), &staged, self.badger)?;
            validate_version(
                self.inspector.version(&staged).map_err(|error| {
                    error_like(
                        &error,
                        format!("Failed to inspect downloaded APKM: {}", error.message()),
                    )
                })?,
                request,
                VersionLabel::Apkmirror,
            )?;
            promote(&staged, &advertised_apkm(request))?
        } else {
            let staged = attempt.path().join(format!("{}.apk", request.package_name));
            copy_file(&downloaded, &staged)
                .map_err(|error| Error::io("copy downloaded APK", error))?;
            validate_version(
                self.inspector.version(&staged).map_err(|error| {
                    error_like(
                        &error,
                        format!("Failed to inspect downloaded APK: {}", error.message()),
                    )
                })?,
                request,
                VersionLabel::Apkmirror,
            )?;
            let final_path = request
                .out_dir
                .join(format!("{}.apk", request.package_name));
            promote(&staged, &final_path)?
        };
        Ok(advertised)
    }
}

/// APKPure fallback provider. Runs last because APKPure repackages third-party
/// builds; the serialized acquisition source records `apkpure` so a fixture
/// seeded here is never mistaken for a Play-signed artifact.
pub struct ApkpureAcquirer<'a> {
    pub tool: &'a dyn ApkeepTool,
    pub commands: &'a dyn CommandRunner,
    pub badger: &'a dyn ApkBadger,
    pub inspector: &'a dyn ArtifactInspector,
    pub timeout: Duration,
}

impl ApkpureProvider for ApkpureAcquirer<'_> {
    fn download(&self, request: &ProviderRequest) -> Result<PathBuf, Error> {
        fs::create_dir_all(request.out_dir).map_err(|error| {
            Error::io(
                format!("create output directory {}", request.out_dir.display()),
                error,
            )
        })?;
        let attempt = tempfile::Builder::new()
            .prefix("apkpure-")
            .tempdir_in(request.out_dir)
            .map_err(|error| Error::io("create APKPure attempt directory", error))?;

        let (program, mut args) = self.tool.command()?;
        args.extend(build_apkpure_args(
            request.package_name,
            request.expected_version,
            attempt.path(),
        ));
        let redactor = Redactor::default();
        let outcome = self
            .commands
            .run(&program, &args, None, self.timeout, &[])
            .map_err(|error| {
                Error::infrastructure(format!(
                    "apkpure could not be executed: {}",
                    sanitize_diagnostic(&error, &redactor)
                ))
            })?;
        if outcome.timed_out {
            return Err(Error::infrastructure(format!(
                "apkpure download timed out for {}: {}",
                request.package_name,
                sanitize_diagnostic(&outcome.stderr, &redactor)
            )));
        }
        if !outcome.success {
            return Err(Error::infrastructure(format!(
                "apkpure download failed for {}: {}",
                request.package_name,
                sanitize_diagnostic(&outcome.stderr, &redactor)
            )));
        }

        let downloaded = first_downloaded_file(attempt.path())?.ok_or_else(|| {
            Error::infrastructure(format!(
                "apkeep apk-pure produced no artifact for {} v{} in {}; \
                 the version may be absent from APKPure",
                request.package_name,
                request.expected_version.unwrap_or("latest"),
                attempt.path().display()
            ))
        })?;
        let apks = if is_bundle_extension(&downloaded) {
            extract_bundle_apks(&downloaded, attempt.path(), "APKPure")?
        } else {
            vec![downloaded]
        };
        stage_apkm(
            &apks,
            request,
            attempt.path(),
            self.badger,
            self.inspector,
            VersionLabel::Apkpure,
        )
    }
}

/// Orchestrates providers in the oracle's order with account rotation,
/// fallback and typed failure aggregation.
pub struct Acquirer<'a> {
    pub apkeep: Option<&'a dyn ApkeepProvider>,
    pub play: Option<&'a dyn PlayProvider>,
    pub apkmirror: Option<&'a dyn ApkmirrorProvider>,
    pub apkpure: Option<&'a dyn ApkpureProvider>,
    pub retry: RetryPolicy,
}

impl Acquirer<'_> {
    pub fn acquire(
        &self,
        request: &ProviderRequest,
        accounts: Option<&[AccountConfig]>,
        accounts_error: Option<&str>,
    ) -> Result<AcquiredArtifact, Error> {
        validate_acquisition_package_name(request.package_name)?;
        let enabled: Vec<&AccountConfig> = accounts
            .unwrap_or_default()
            .iter()
            .filter(|account| account.enabled)
            .collect();
        let mut failures: Vec<String> = Vec::new();
        let mut last_error: Option<Error> = None;
        if let Some(message) = accounts_error {
            failures.push(message.to_string());
            last_error = Some(Error::usage(message.to_string()));
        }

        if let Some(provider) = self.apkeep {
            if accounts.is_some() && provider.is_available() {
                for account in &enabled {
                    match self.attempt(|| provider.download(request, account)) {
                        Ok(path) => {
                            return Ok(AcquiredArtifact {
                                path,
                                source: AcquisitionSource::Apkeep,
                            })
                        }
                        Err(error) => {
                            failures.push(format!("apkeep [{}]: {error}", account.label));
                            last_error = Some(error);
                        }
                    }
                }
            }
        }

        let direct: Vec<&AccountConfig> = enabled
            .iter()
            .copied()
            .filter(|account| account.aas_token.starts_with("aas_et/"))
            .collect();
        if let Some(provider) = self.play {
            for account in &direct {
                match self.attempt(|| provider.download(request, PlayAuth::Direct(account))) {
                    Ok(path) => {
                        return Ok(AcquiredArtifact {
                            path,
                            source: AcquisitionSource::Goopdl,
                        })
                    }
                    Err(error) => {
                        failures.push(format!("goopdl [{}] direct auth: {error}", account.label));
                        last_error = Some(error);
                    }
                }
            }
            if direct.is_empty() {
                match self.attempt(|| provider.download(request, PlayAuth::Dispenser)) {
                    Ok(path) => {
                        return Ok(AcquiredArtifact {
                            path,
                            source: AcquisitionSource::Goopdl,
                        })
                    }
                    Err(error) => {
                        failures.push(format!("goopdl: {error}"));
                        last_error = Some(error);
                    }
                }
            }
        }

        if let Some(provider) = self.apkmirror {
            match self.attempt(|| provider.download(request)) {
                Ok(path) => {
                    return Ok(AcquiredArtifact {
                        path,
                        source: AcquisitionSource::Apkmirror,
                    })
                }
                Err(error) => {
                    failures.push(format!("apkmirror: {error}"));
                    last_error = Some(error);
                }
            }
        }

        if let Some(provider) = self.apkpure {
            match self.attempt(|| provider.download(request)) {
                Ok(path) => {
                    return Ok(AcquiredArtifact {
                        path,
                        source: AcquisitionSource::Apkpure,
                    })
                }
                Err(error) => {
                    failures.push(format!("apkpure: {error}"));
                    last_error = Some(error);
                }
            }
        }

        let reason = if failures.is_empty() {
            "no acquisition source is available".to_string()
        } else {
            failures.join("; ")
        };
        let message = format!(
            "All acquisition sources failed for {}: {reason}",
            request.package_name
        );
        Err(match last_error {
            Some(error) => error_like(&error, message),
            None => Error::infrastructure(message),
        })
    }

    fn attempt<F>(&self, mut operation: F) -> Result<PathBuf, Error>
    where
        F: FnMut() -> Result<PathBuf, Error>,
    {
        let attempts = self.retry.attempts.max(1);
        let mut last = None;
        for attempt in 0..attempts {
            match operation() {
                Ok(path) => return Ok(path),
                Err(error) => {
                    let retryable = error.exit_code() == ExitCode::InfrastructureFailure;
                    if !retryable || attempt + 1 == attempts {
                        return Err(error);
                    }
                    last = Some(error);
                }
            }
        }
        Err(last.unwrap_or_else(|| {
            Error::infrastructure("acquisition attempt produced no outcome".to_string())
        }))
    }
}

fn validate_acquisition_package_name(package_name: &str) -> Result<(), Error> {
    validate_package_name(package_name).map_err(|error| {
        Error::usage(format!(
            "Invalid package name {package_name:?}: {}. Package names must be a single path component without separators or NUL bytes",
            error.message()
        ))
    })
}

/// Production entry point. Account load failures are recorded but do not stop
/// the dispenser or APKMirror fallbacks, matching the oracle.
pub fn acquire_artifact(
    package_name: &str,
    out_dir: &Path,
    expected_version: Option<&str>,
    expected_version_code: Option<u64>,
) -> Result<AcquiredArtifact, Error> {
    validate_acquisition_package_name(package_name)?;
    fs::create_dir_all(out_dir).map_err(|error| {
        Error::io(
            format!("create output directory {}", out_dir.display()),
            error,
        )
    })?;
    let request = ProviderRequest {
        package_name,
        out_dir,
        expected_version,
        expected_version_code,
    };

    let environment = AccountsEnvironment::from_process();
    let (accounts, accounts_error) = match load_accounts(&environment) {
        Ok(accounts) => (accounts, None),
        Err(error) => (
            None,
            Some(format!("Failed to load Google Play accounts: {error}")),
        ),
    };

    let manager = ToolManager::with_defaults().ok();
    let apkeep_tool = manager.as_ref().map(HostApkeepTool::new);
    let commands = HostCommandRunner;
    let badger = HostApkBadger::from_process();
    let inspector = HostArtifactInspector::from_process();
    let node = HostNodeRuntime::from_process();

    let apkeep = apkeep_tool.as_ref().map(|tool| ApkeepAcquirer {
        tool,
        commands: &commands,
        badger: &badger,
        inspector: &inspector,
        timeout: APKEEP_TIMEOUT,
    });
    let backend = GpapiBackend::new();
    let play = PlayAcquirer {
        backend: &backend,
        badger: &badger,
        inspector: &inspector,
        dispenser_url: DEFAULT_DISPENSER_URL,
        attempt_timeout: PLAY_ATTEMPT_TIMEOUT,
    };
    let apkmirror = ApkmirrorAcquirer {
        runtime: &node,
        commands: &commands,
        badger: &badger,
        inspector: &inspector,
        runner_script: default_apkmirror_runner(),
        timeout: DOWNLOAD_TIMEOUT,
    };
    let apkpure = apkeep_tool.as_ref().map(|tool| ApkpureAcquirer {
        tool,
        commands: &commands,
        badger: &badger,
        inspector: &inspector,
        timeout: APKEEP_TIMEOUT,
    });

    let acquirer = Acquirer {
        apkeep: apkeep
            .as_ref()
            .map(|provider| provider as &dyn ApkeepProvider),
        play: Some(&play),
        apkmirror: Some(&apkmirror),
        apkpure: apkpure
            .as_ref()
            .map(|provider| provider as &dyn ApkpureProvider),
        retry: RetryPolicy::default(),
    };
    acquirer.acquire(&request, accounts.as_deref(), accounts_error.as_deref())
}

#[derive(Clone, Copy)]
enum VersionLabel {
    Apkeep,
    Goopdl,
    Apkmirror,
    Apkpure,
}

fn validate_version(
    actual: ArtifactVersion,
    request: &ProviderRequest,
    label: VersionLabel,
) -> Result<(), Error> {
    if let Some(expected) = request.expected_version {
        if actual.version_name != expected {
            let message = match label {
                VersionLabel::Apkeep => format!(
                    "Downloaded version '{}' does not match expected '{expected}'",
                    actual.version_name
                ),
                VersionLabel::Goopdl => format!(
                    "goopdl downloaded version '{}' != expected '{expected}'",
                    actual.version_name
                ),
                VersionLabel::Apkmirror => format!(
                    "APKMirror downloaded version '{}' != expected '{expected}'",
                    actual.version_name
                ),
                VersionLabel::Apkpure => format!(
                    "APKPure downloaded version '{}' != expected '{expected}'",
                    actual.version_name
                ),
            };
            return Err(Error::invalid_artifact(message));
        }
    }
    if let Some(expected) = request.expected_version_code {
        if actual.version_code != expected {
            let message = match label {
                VersionLabel::Apkeep => format!(
                    "Downloaded version code '{}' does not match expected '{expected}'",
                    actual.version_code
                ),
                VersionLabel::Goopdl => format!(
                    "goopdl downloaded version code '{}' != expected '{expected}'",
                    actual.version_code
                ),
                VersionLabel::Apkmirror => format!(
                    "APKMirror downloaded version code '{}' != expected '{expected}'",
                    actual.version_code
                ),
                VersionLabel::Apkpure => format!(
                    "APKPure downloaded version code '{}' != expected '{expected}'",
                    actual.version_code
                ),
            };
            return Err(Error::invalid_artifact(message));
        }
    }
    Ok(())
}

fn error_like(reference: &Error, message: String) -> Error {
    match reference {
        Error::Compatibility(_) => Error::compatibility(message),
        Error::Usage(_) => Error::usage(message),
        Error::InvalidArtifact(_) => Error::invalid_artifact(message),
        Error::Infrastructure(_) | Error::Io { .. } => Error::infrastructure(message),
        Error::Runtime(_) => Error::runtime(message),
    }
}

fn advertised_apkm(request: &ProviderRequest) -> PathBuf {
    request
        .out_dir
        .join(format!("{}.apkm", request.package_name))
}

fn dispenser_account() -> AccountConfig {
    AccountConfig {
        label: DISPENSER_ACCOUNT_LABEL.to_string(),
        email: DISPENSER_ACCOUNT_EMAIL.to_string(),
        aas_token: String::new(),
        device: "px_9a".to_string(),
        locale: "en_US".to_string(),
        timezone: "UTC".to_string(),
        enabled: true,
    }
}

fn apkeep_credentials(account: &AccountConfig) -> String {
    let mut contents = format!(
        "[google]\nemail = {}\naas_token = {}\n",
        account.email, account.aas_token
    );
    if !account.device.is_empty() {
        contents.push_str(&format!("device = {}\n", account.device));
    }
    if !account.locale.is_empty() {
        contents.push_str(&format!("locale = {}\n", account.locale));
    }
    contents
}

fn write_private_file(path: &Path, contents: &[u8]) -> io::Result<()> {
    let mut options = fs::OpenOptions::new();
    options.write(true).create_new(true);
    #[cfg(unix)]
    options.mode(0o600);
    let mut file = options.open(path)?;
    file.write_all(contents)?;
    file.sync_all()
}

fn sanitized_label(label: &str) -> String {
    let sanitized: String = label
        .chars()
        .map(|character| {
            if character.is_ascii_alphanumeric() || character == '-' || character == '_' {
                character
            } else {
                '-'
            }
        })
        .collect();
    if sanitized.is_empty() {
        "account".to_string()
    } else {
        sanitized
    }
}

fn collect_apk_files(root: &Path) -> Result<Vec<PathBuf>, Error> {
    let mut found = Vec::new();
    walk_apk_files(root, &mut found)?;
    found.sort();
    Ok(found)
}

fn walk_apk_files(directory: &Path, found: &mut Vec<PathBuf>) -> Result<(), Error> {
    let mut entries: Vec<_> = fs::read_dir(directory)
        .map_err(|error| Error::io(format!("read directory {}", directory.display()), error))?
        .collect::<Result<Vec<_>, _>>()
        .map_err(|error| Error::io(format!("read directory {}", directory.display()), error))?;
    entries.sort_by_key(|entry| entry.file_name());
    for entry in entries {
        let file_type = entry
            .file_type()
            .map_err(|error| Error::io(format!("inspect {}", entry.path().display()), error))?;
        if file_type.is_symlink() {
            continue;
        }
        if file_type.is_dir() {
            walk_apk_files(&entry.path(), found)?;
        } else if file_type.is_file()
            && entry
                .path()
                .extension()
                .is_some_and(|extension| extension == "apk")
        {
            found.push(entry.path());
        }
    }
    Ok(())
}

fn first_downloaded_file(attempt: &Path) -> Result<Option<PathBuf>, Error> {
    let mut files: Vec<PathBuf> = fs::read_dir(attempt)
        .map_err(|error| Error::io(format!("read directory {}", attempt.display()), error))?
        .collect::<Result<Vec<_>, _>>()
        .map_err(|error| Error::io(format!("read directory {}", attempt.display()), error))?
        .into_iter()
        .map(|entry| entry.path())
        .filter(|path| {
            path.is_file()
                && path.extension().is_some_and(|extension| {
                    ["apk", "apkm", "xapk", "zip"]
                        .iter()
                        .any(|wanted| extension.eq_ignore_ascii_case(wanted))
                })
        })
        .collect();
    files.sort();
    Ok(files.into_iter().next())
}

fn is_bundle_extension(path: &Path) -> bool {
    path.extension().is_some_and(|extension| {
        ["apkm", "xapk", "zip"]
            .iter()
            .any(|wanted| extension.eq_ignore_ascii_case(wanted))
    })
}

fn extract_bundle_apks(
    downloaded: &Path,
    attempt: &Path,
    source: &str,
) -> Result<Vec<PathBuf>, Error> {
    let extract_dir = attempt.join("extracted");
    archives::safe_extract_all(downloaded, &extract_dir).map_err(|error| match error {
        archives::ArchiveError::Security(message) => {
            Error::invalid_artifact(format!("Unsafe archive member path: {message}"))
        }
        other => {
            Error::invalid_artifact(format!("Corrupt bundle downloaded from {source}: {other}"))
        }
    })?;
    collect_apk_files(&extract_dir)
}

/// Normalizes acquired APKs into the advertised `.apkm`, validates the version
/// constraints, and only then promotes the result into the output directory.
fn stage_apkm(
    apks: &[PathBuf],
    request: &ProviderRequest,
    attempt: &Path,
    badger: &dyn ApkBadger,
    inspector: &dyn ArtifactInspector,
    label: VersionLabel,
) -> Result<PathBuf, Error> {
    let staged = attempt.join(format!("{}.apkm", request.package_name));
    normalize_apks_to_apkm(apks, &staged, badger)?;
    validate_version(
        inspector.version(&staged).map_err(|error| {
            error_like(
                &error,
                format!("Failed to inspect downloaded APKM: {}", error.message()),
            )
        })?,
        request,
        label,
    )?;
    promote(&staged, &advertised_apkm(request))
}

fn copy_file(source: &Path, destination: &Path) -> io::Result<()> {
    let mut input = File::open(source)?;
    let mut output = File::create(destination)?;
    let mut buffer = vec![0u8; STREAM_BUFFER_BYTES];
    loop {
        let read = input.read(&mut buffer)?;
        if read == 0 {
            break;
        }
        output.write_all(&buffer[..read])?;
    }
    output.sync_all()
}

fn promote(staged: &Path, destination: &Path) -> Result<PathBuf, Error> {
    if let Some(parent) = destination.parent() {
        fs::create_dir_all(parent).map_err(|error| {
            Error::io(
                format!("create output directory {}", parent.display()),
                error,
            )
        })?;
    }
    fs::rename(staged, destination).map_err(|error| {
        Error::infrastructure(format!(
            "could not promote {} to {}: {error}",
            staged.display(),
            destination.display()
        ))
    })?;
    Ok(destination.to_path_buf())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn source_labels_are_wire_compatible() {
        for (source, label) in [
            (AcquisitionSource::Apkeep, "apkeep"),
            (AcquisitionSource::Goopdl, "goopdl"),
            (AcquisitionSource::Apkmirror, "apkmirror"),
            (AcquisitionSource::Apkpure, "apkpure"),
            (AcquisitionSource::Manual, "manual"),
        ] {
            let encoded = serde_json::to_string(&source).expect("serialize source");
            assert_eq!(encoded, format!("\"{label}\""));
            let decoded: AcquisitionSource =
                serde_json::from_str(&encoded).expect("deserialize source");
            assert_eq!(decoded, source);
        }
    }

    #[test]
    fn apkeep_argv_contains_no_credentials_or_interpreter() {
        let args = build_apkeep_args(
            "com.test.pkg",
            None,
            Path::new("/tmp/creds.ini"),
            Path::new("/tmp/attempt"),
        );
        let joined = args.join(" ");
        assert!(!joined.contains("python"));
        assert!(!joined.contains("goopdl"));
        assert!(!joined.contains("aas_et/"));
        assert!(!joined.contains('@'));
        assert_eq!(
            args,
            vec![
                "-a",
                "com.test.pkg",
                "-d",
                "google-play",
                "-i",
                "/tmp/creds.ini",
                "-o",
                APKEEP_DEVICE_OPTION,
                "/tmp/attempt",
            ]
        );
    }

    #[test]
    fn requested_versions_are_pinned_per_download_source() {
        let play = build_apkeep_args(
            "com.test.pkg",
            Some("1.2.3"),
            Path::new("/tmp/creds.ini"),
            Path::new("/tmp/attempt"),
        );
        assert_eq!(play[0], "-a");
        assert_eq!(play[1], "com.test.pkg@1.2.3");
        assert_eq!(play[3], "google-play");

        let pure = build_apkpure_args("com.test.pkg", Some("1.2.3"), Path::new("/tmp/attempt"));
        assert_eq!(
            pure,
            vec![
                "-a",
                "com.test.pkg@1.2.3",
                "-d",
                APKPURE_SOURCE,
                "-o",
                APKPURE_ACKNOWLEDGE_OPTION,
                "/tmp/attempt",
            ]
        );
        assert!(!pure.join(" ").contains("-i"));
        assert_eq!(
            build_apkpure_args("com.test.pkg", None, Path::new("/x"))[1],
            "com.test.pkg"
        );
    }

    #[test]
    fn redaction_happens_before_truncation() {
        let token = format!("aas_et/{}", "a".repeat(400));
        let email = "primary@example.com";
        let account = AccountConfig {
            label: "primary".to_string(),
            email: email.to_string(),
            aas_token: token.clone(),
            device: "px_9a".to_string(),
            locale: "en_US".to_string(),
            timezone: "UTC".to_string(),
            enabled: true,
        };
        let redactor = Redactor::for_account(&account);
        let text = format!("{} {email} {token} {}", "x".repeat(20), "y".repeat(400));
        let diagnostic = sanitize_diagnostic(&text, &redactor);
        assert!(diagnostic.contains("[REDACTED_TOKEN]"), "{diagnostic}");
        assert!(diagnostic.contains("pr***@example.com"), "{diagnostic}");
        assert!(!diagnostic.contains(&token), "{diagnostic}");
        assert!(!diagnostic.contains(email), "{diagnostic}");
        assert_eq!(diagnostic.chars().count(), STDERR_DIAGNOSTIC_LIMIT);
    }

    #[test]
    fn account_documents_reject_duplicates_and_disabled_sets() {
        let duplicate = r#"{"version":1,"accounts":[
            {"label":"a","email":"A@example.com","aasToken":"tok"},
            {"label":"b","email":"a@example.com","aasToken":"tok2"}]}"#;
        let error = parse_accounts_document(duplicate, "test")
            .err()
            .expect("duplicate email");
        assert!(error.message().contains("Duplicate email"), "{error}");

        let disabled = r#"{"version":1,"accounts":[
            {"label":"a","email":"a@example.com","aasToken":"tok","enabled":false}]}"#;
        let error = parse_accounts_document(disabled, "test")
            .err()
            .expect("disabled");
        assert!(error.message().contains("No enabled accounts"), "{error}");
    }

    #[test]
    fn apkmirror_mappings_are_preserved() {
        let mapping = apkmirror_mapping("com.sezzle.sezzlemobile").expect("mapping");
        assert_eq!(mapping.org, "sezzle");
        assert_eq!(mapping.repo, "sezzle-buy-now-pay-later");
        assert_eq!(mapping.app_type, "bundle");
        assert!(apkmirror_mapping("com.unmapped.app").is_none());
    }
}
