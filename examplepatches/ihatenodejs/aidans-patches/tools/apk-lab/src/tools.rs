//! Pinned toolchain discovery, cache ownership, and host readiness.
//!
//! `tools.lock.json` is repository data: every entry carries an exact version,
//! download URL, SHA-256 digest, supported hosts, tool type and version probe.
//! The cache layout mirrors the Python oracle exactly:
//! `<home>/.cache/aidans-patches/apk-lab/tools/<name>/<version>/<sha256>`.
//!
//! Only [`ToolManager::install_tool`] (and [`ToolManager::install_from_file`],
//! its verified local seam) writes into the cache. `doctor` calls
//! [`ToolManager::is_tool_installed`] and never creates, repairs or downloads a
//! tool. Every executable launch goes through [`crate::process`]; no shell is
//! involved.

use crate::error::Error;
use crate::models::ExitCode;
use crate::process::{self, ProcessSpec};
use regex::Regex;
use serde::de::{MapAccess, Visitor};
use serde::{Deserialize, Deserializer, Serialize};
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;
use std::ffi::OsString;
use std::fmt;
use std::fs::{self, File};
use std::io::{self, Read, Write};
use std::path::{Component, Path, PathBuf};
use std::time::Duration;
use tempfile::TempDir;

/// Cache path relative to the user's home directory.
pub const CACHE_RELATIVE_PATH: &str = ".cache/aidans-patches/apk-lab/tools";
/// Default managed workspace root, matching the Python CLI.
pub const DEFAULT_WORKSPACE_ROOT: &str = ".apk-lab";
/// Environment variable that can point at the repository root explicitly.
pub const REPO_ROOT_ENV: &str = "APK_LAB_REPO_ROOT";
/// Tool that is only installed for the CI profile where the host supports it.
pub const APKEEP_TOOL: &str = "apkeep";
/// Version probe timeout.
pub const PROBE_TIMEOUT: Duration = Duration::from_secs(30);

/// CI credentials whose presence `doctor --ci` reports.
pub const REQUIRED_CI_CREDENTIALS: [&str; 4] = [
    "APKEEP_ACCOUNTS",
    "R2_ACCOUNT_ID",
    "R2_ACCESS_KEY_ID",
    "R2_SECRET_ACCESS_KEY",
];
/// Optional CI credentials whose presence is still reported.
pub const OPTIONAL_CI_CREDENTIALS: [&str; 1] = ["COMPATIBILITY_STATUS_SECRET"];

/// Toolchain profiles accepted by `setup` and `doctor`.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Profile {
    Analysis,
    Ci,
}

impl Profile {
    #[must_use]
    pub fn parse(text: &str) -> Option<Self> {
        match text {
            "analysis" => Some(Profile::Analysis),
            "ci" => Some(Profile::Ci),
            _ => None,
        }
    }

    #[must_use]
    pub const fn as_str(self) -> &'static str {
        match self {
            Profile::Analysis => "analysis",
            Profile::Ci => "ci",
        }
    }
}

/// How a locked tool is packaged.
#[derive(Debug, Clone, Copy, Default, PartialEq, Eq, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum ToolType {
    #[default]
    Binary,
    Jar,
    Zip,
}

/// Version probe from the lock file. `{executable}` is substituted with the
/// staged or installed executable path.
#[derive(Debug, Clone, Default, PartialEq, Eq, Deserialize)]
pub struct VersionProbe {
    #[serde(default)]
    pub args: Vec<String>,
    #[serde(default, rename = "expectedPattern")]
    pub expected_pattern: String,
}

/// One checksum-pinned tool entry.
#[derive(Debug, Clone, PartialEq, Eq, Deserialize)]
pub struct ToolSpec {
    pub version: String,
    #[serde(default)]
    pub url: String,
    pub sha256: String,
    #[serde(default)]
    pub license: Option<String>,
    #[serde(default, rename = "supportedPlatforms")]
    pub supported_platforms: Vec<String>,
    #[serde(default, rename = "toolType")]
    pub tool_type: ToolType,
    #[serde(rename = "executablePath")]
    pub executable_path: String,
    #[serde(default, rename = "versionProbe")]
    pub version_probe: VersionProbe,
}

/// A named lock entry. The vector preserves document order, which is the
/// order `doctor` reports tools in.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct LockedTool {
    pub name: String,
    pub spec: ToolSpec,
}

/// The repository `tools.lock.json` document.
#[derive(Debug, Clone, PartialEq, Eq, Deserialize)]
pub struct ToolsLock {
    #[serde(rename = "$schema", default)]
    pub schema: Option<String>,
    #[serde(deserialize_with = "deserialize_ordered_tools")]
    pub tools: Vec<LockedTool>,
}

fn deserialize_ordered_tools<'de, D>(deserializer: D) -> Result<Vec<LockedTool>, D::Error>
where
    D: Deserializer<'de>,
{
    struct ToolsVisitor;

    impl<'de> Visitor<'de> for ToolsVisitor {
        type Value = Vec<LockedTool>;

        fn expecting(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
            formatter.write_str("a tools object keyed by tool name")
        }

        fn visit_map<A>(self, mut map: A) -> Result<Self::Value, A::Error>
        where
            A: MapAccess<'de>,
        {
            let mut tools = Vec::new();
            while let Some((name, spec)) = map.next_entry::<String, ToolSpec>()? {
                tools.push(LockedTool { name, spec });
            }
            Ok(tools)
        }
    }

    deserializer.deserialize_map(ToolsVisitor)
}

impl ToolsLock {
    pub fn load(path: impl AsRef<Path>) -> Result<Self, ToolError> {
        let path = path.as_ref();
        let bytes = fs::read(path)
            .map_err(|error| ToolError::io(format!("read tools lock {}", path.display()), error))?;
        serde_json::from_slice(&bytes)
            .map_err(|error| ToolError::Lock(format!("invalid tools lock: {error}")))
    }

    #[must_use]
    pub fn spec(&self, name: &str) -> Option<&ToolSpec> {
        self.tools
            .iter()
            .find(|tool| tool.name == name)
            .map(|tool| &tool.spec)
    }
}

/// Typed tool-chain failures. All are usage/tool errors except filesystem
/// boundary failures, which keep the infrastructure class.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum ToolError {
    Lock(String),
    UnknownTool(String),
    UnsupportedHost {
        name: String,
        host: String,
        supported: Vec<String>,
    },
    InvalidSpec(String),
    Checksum {
        name: String,
        expected: String,
        actual: String,
    },
    Probe(String),
    NotInstalled(String),
    Io {
        context: String,
        kind: io::ErrorKind,
    },
}

impl ToolError {
    fn io(context: impl Into<String>, error: io::Error) -> Self {
        Self::Io {
            context: context.into(),
            kind: error.kind(),
        }
    }

    #[must_use]
    pub fn exit_code(&self) -> ExitCode {
        match self {
            ToolError::Io { .. } => ExitCode::InfrastructureFailure,
            _ => ExitCode::UsageOrToolError,
        }
    }

    #[must_use]
    pub fn message(&self) -> String {
        match self {
            ToolError::Lock(message)
            | ToolError::InvalidSpec(message)
            | ToolError::Probe(message)
            | ToolError::NotInstalled(message) => message.clone(),
            ToolError::UnknownTool(name) => {
                format!("Unknown tool '{name}' in tools lock file")
            }
            ToolError::UnsupportedHost {
                name,
                host,
                supported,
            } => format!(
                "Tool '{name}' does not support host platform '{host}' (supported: {supported:?})"
            ),
            ToolError::Checksum {
                name,
                expected,
                actual,
            } => format!("Checksum mismatch for '{name}': expected {expected}, got {actual}"),
            ToolError::Io { context, kind } => format!("{context}: {kind:?}"),
        }
    }
}

impl fmt::Display for ToolError {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        formatter.write_str(&self.message())
    }
}

impl std::error::Error for ToolError {}

impl From<ToolError> for Error {
    fn from(error: ToolError) -> Self {
        match error {
            ToolError::Io { context, kind } => Error::Io { context, kind },
            other => Error::usage(other.message()),
        }
    }
}

/// Maps a Rust target OS/arch pair to the Python oracle's host id.
#[must_use]
pub fn host_platform_for(os: &str, arch: &str) -> String {
    let os_name = if os.starts_with("linux") {
        "linux".to_string()
    } else if os == "macos" || os == "darwin" {
        "darwin".to_string()
    } else if os == "windows" {
        "windows".to_string()
    } else {
        os.to_string()
    };
    let arch_name = match arch.to_ascii_lowercase().as_str() {
        "aarch64" | "arm64" => "aarch64".to_string(),
        "x86_64" | "amd64" => "x86_64".to_string(),
        other => other.to_string(),
    };
    format!("{os_name}-{arch_name}")
}

/// The host this binary was built for.
#[must_use]
pub fn host_platform() -> String {
    host_platform_for(std::env::consts::OS, std::env::consts::ARCH)
}

/// Whether `spec` lists `host` (or `any`).
#[must_use]
pub fn platform_supported(spec: &ToolSpec, host: &str) -> bool {
    spec.supported_platforms
        .iter()
        .any(|platform| platform == "any" || platform == host)
}

/// Default cache root derived from the process home directory.
pub fn default_cache_root() -> Result<PathBuf, ToolError> {
    let home = home_dir().ok_or_else(|| {
        ToolError::InvalidSpec("cannot resolve the user home directory for the tool cache".into())
    })?;
    Ok(home.join(CACHE_RELATIVE_PATH))
}

fn home_dir() -> Option<PathBuf> {
    if let Some(home) = std::env::var_os("HOME") {
        if !home.is_empty() {
            return Some(PathBuf::from(home));
        }
    }
    if let Some(home) = std::env::var_os("USERPROFILE") {
        if !home.is_empty() {
            return Some(PathBuf::from(home));
        }
    }
    let drive = std::env::var_os("HOMEDRIVE")?;
    let path = std::env::var_os("HOMEPATH")?;
    let mut combined = PathBuf::from(drive);
    combined.push(path);
    (!combined.as_os_str().is_empty()).then_some(combined)
}

/// Repository root: explicit environment override first, then the source
/// tree this binary was compiled from. Never inferred from the process CWD.
#[must_use]
pub fn default_repo_root() -> PathBuf {
    if let Some(explicit) = std::env::var_os(REPO_ROOT_ENV) {
        if !explicit.is_empty() {
            return PathBuf::from(explicit);
        }
    }
    let manifest = Path::new(env!("CARGO_MANIFEST_DIR"));
    let candidate = manifest.join("../..");
    fs::canonicalize(&candidate).unwrap_or(candidate)
}

/// Environment variable that can point at an explicit lock file.
pub const LOCK_PATH_ENV: &str = "APK_LAB_TOOLS_LOCK";

/// The repository lock file path. The lock lives beside the crate, not at the
/// repository root; an explicit override wins for packaged deployments.
#[must_use]
pub fn default_lock_path() -> PathBuf {
    if let Some(explicit) = std::env::var_os(LOCK_PATH_ENV) {
        if !explicit.is_empty() {
            return PathBuf::from(explicit);
        }
    }
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tools.lock.json")
}

/// Explicit host inputs. Keeping these injectable avoids process-global
/// environment mutation in tests and makes the host mapping deterministic.
#[derive(Debug, Clone, Default)]
pub struct ToolEnvironment {
    pub android_home: Option<PathBuf>,
    pub android_sdk_root: Option<PathBuf>,
    pub java_home: Option<PathBuf>,
    pub path: Option<OsString>,
    /// `local.properties` candidates, checked in order when no environment
    /// SDK root is set.
    pub local_properties: Vec<PathBuf>,
    /// Presence-only CI credentials.
    pub credentials: BTreeMap<String, bool>,
}

impl ToolEnvironment {
    #[must_use]
    pub fn from_process(repo_root: &Path) -> Self {
        let credentials = REQUIRED_CI_CREDENTIALS
            .iter()
            .chain(OPTIONAL_CI_CREDENTIALS.iter())
            .map(|name| {
                let present = std::env::var(name)
                    .map(|value| !value.is_empty())
                    .unwrap_or(false);
                ((*name).to_string(), present)
            })
            .collect();
        Self {
            android_home: non_empty_env("ANDROID_HOME").map(PathBuf::from),
            android_sdk_root: non_empty_env("ANDROID_SDK_ROOT").map(PathBuf::from),
            java_home: non_empty_env("JAVA_HOME").map(PathBuf::from),
            path: std::env::var_os("PATH"),
            local_properties: vec![
                PathBuf::from("local.properties"),
                repo_root.join("local.properties"),
            ],
            credentials,
        }
    }

    /// SDK root resolution order matches the Python oracle exactly: a set
    /// `ANDROID_HOME` wins even if it is invalid, then `ANDROID_SDK_ROOT`,
    /// then the first `local.properties` containing `sdk.dir=`.
    #[must_use]
    pub fn sdk_dir(&self) -> Option<PathBuf> {
        if let Some(path) = &self.android_home {
            return Some(path.clone());
        }
        if let Some(path) = &self.android_sdk_root {
            return Some(path.clone());
        }
        for candidate in &self.local_properties {
            if let Ok(text) = fs::read_to_string(candidate) {
                for line in text.lines() {
                    if let Some(value) = line.strip_prefix("sdk.dir=") {
                        return Some(PathBuf::from(value.trim()));
                    }
                }
            }
        }
        None
    }

    /// Resolves `bin_name` in the configured PATH without invoking a shell.
    #[must_use]
    pub fn find_in_path(&self, bin_name: &str) -> Option<PathBuf> {
        let path = self.path.clone().or_else(|| std::env::var_os("PATH"))?;
        for directory in std::env::split_paths(&path) {
            let candidate = directory.join(bin_name);
            if candidate.is_file() && is_executable(&candidate) {
                return Some(candidate);
            }
            #[cfg(windows)]
            {
                for suffix in ["exe", "cmd", "bat"] {
                    let candidate = directory.join(format!("{bin_name}.{suffix}"));
                    if candidate.is_file() {
                        return Some(candidate);
                    }
                }
            }
        }
        None
    }

    /// Resolves the Java launcher, preferring `JAVA_HOME` and then PATH.
    #[must_use]
    pub fn find_java(&self) -> PathBuf {
        if let Some(home) = &self.java_home {
            let candidate = home.join("bin").join(java_executable_name());
            if candidate.is_file() {
                return candidate;
            }
        }
        self.find_in_path("java")
            .unwrap_or_else(|| PathBuf::from("java"))
    }
}

fn non_empty_env(name: &str) -> Option<OsString> {
    match std::env::var_os(name) {
        Some(value) if !value.is_empty() => Some(value),
        _ => None,
    }
}

fn java_executable_name() -> &'static str {
    if cfg!(windows) {
        "java.exe"
    } else {
        "java"
    }
}

/// Locates an Android build-tools binary. `36.0.0` is preferred, then the
/// lexicographically greatest installed version, then PATH.
pub fn find_build_tools_bin(env: &ToolEnvironment, bin_name: &str) -> Result<PathBuf, Error> {
    if let Some(sdk_dir) = env.sdk_dir() {
        if sdk_dir.is_dir() {
            let build_tools = sdk_dir.join("build-tools");
            let preferred = build_tools.join("36.0.0").join(bin_name);
            if preferred.exists() {
                return Ok(preferred);
            }
            if build_tools.is_dir() {
                let mut versions: Vec<PathBuf> = fs::read_dir(&build_tools)
                    .map(|entries| {
                        entries
                            .filter_map(Result::ok)
                            .map(|entry| entry.path())
                            .filter(|path| path.is_dir())
                            .collect()
                    })
                    .unwrap_or_default();
                versions.sort();
                for version in versions.iter().rev() {
                    let candidate = version.join(bin_name);
                    if candidate.exists() {
                        return Ok(candidate);
                    }
                }
            }
        }
    }

    if let Some(found) = env.find_in_path(bin_name) {
        return Ok(found);
    }

    Err(Error::usage(format!(
        "Android build tool '{bin_name}' not found. Check ANDROID_HOME or local.properties"
    )))
}

/// Manages one tool cache and one lock document.
#[derive(Debug, Clone)]
pub struct ToolManager {
    cache_root: PathBuf,
    lock_path: PathBuf,
    lock: ToolsLock,
    host: String,
}

impl ToolManager {
    pub fn new(
        cache_root: impl Into<PathBuf>,
        lock_path: impl Into<PathBuf>,
    ) -> Result<Self, ToolError> {
        let host = host_platform();
        Self::with_host(cache_root, lock_path, host)
    }

    /// Constructor with an injected host id for deterministic platform tests.
    pub fn with_host(
        cache_root: impl Into<PathBuf>,
        lock_path: impl Into<PathBuf>,
        host: impl Into<String>,
    ) -> Result<Self, ToolError> {
        let lock_path = lock_path.into();
        let lock = ToolsLock::load(&lock_path)?;
        Ok(Self {
            cache_root: cache_root.into(),
            lock_path,
            lock,
            host: host.into(),
        })
    }

    /// Uses the default cache root and repository lock file.
    pub fn with_defaults() -> Result<Self, ToolError> {
        Self::new(default_cache_root()?, default_lock_path())
    }

    #[must_use]
    pub fn cache_root(&self) -> &Path {
        &self.cache_root
    }

    #[must_use]
    pub fn lock_path(&self) -> &Path {
        &self.lock_path
    }

    #[must_use]
    pub fn lock(&self) -> &ToolsLock {
        &self.lock
    }

    #[must_use]
    pub fn host(&self) -> &str {
        &self.host
    }

    pub fn spec(&self, name: &str) -> Result<&ToolSpec, ToolError> {
        self.lock
            .spec(name)
            .ok_or_else(|| ToolError::UnknownTool(name.to_string()))
    }

    pub fn install_dir(&self, name: &str) -> Result<PathBuf, ToolError> {
        let spec = self.spec(name)?;
        validate_cache_segment("tool name", name)?;
        validate_cache_segment("tool version", &spec.version)?;
        validate_sha256_text(&spec.sha256)?;
        Ok(self
            .cache_root
            .join(name)
            .join(&spec.version)
            .join(&spec.sha256))
    }

    pub fn executable_path(&self, name: &str) -> Result<PathBuf, ToolError> {
        let spec = self.spec(name)?;
        let relative = validate_executable_path(&spec.executable_path)?;
        Ok(self.install_dir(name)?.join(relative))
    }

    pub fn is_platform_supported(&self, name: &str) -> Result<bool, ToolError> {
        let spec = self.spec(name)?;
        Ok(platform_supported(spec, &self.host))
    }

    /// A cached tool counts as installed only when its executable exists and,
    /// unless it is a JAR, carries executable permission.
    #[must_use]
    pub fn is_tool_installed(&self, name: &str) -> bool {
        let Ok(spec) = self.spec(name) else {
            return false;
        };
        let Ok(executable) = self.executable_path(name) else {
            return false;
        };
        executable.is_file() && (spec.tool_type == ToolType::Jar || is_executable(&executable))
    }

    /// Verifies a file against a pinned digest. The digest is the contract;
    /// the returned actual digest is lower-case hex.
    pub fn verify_file_sha256(
        &self,
        name: &str,
        path: &Path,
        expected: &str,
    ) -> Result<String, ToolError> {
        validate_sha256_text(expected)?;
        let actual = sha256_file(path)?;
        if actual != expected.to_ascii_lowercase() {
            return Err(ToolError::Checksum {
                name: name.to_string(),
                expected: expected.to_ascii_lowercase(),
                actual,
            });
        }
        Ok(actual)
    }

    /// Downloads and installs a tool. This is the only network boundary and is
    /// reached only from an explicit `setup` invocation.
    pub fn install_tool(&self, name: &str) -> Result<PathBuf, ToolError> {
        let spec = self.spec(name)?.clone();
        self.ensure_supported(name, &spec)?;
        let executable = self.executable_path(name)?;
        if self.is_tool_installed(name) {
            return Ok(executable);
        }
        if spec.url.is_empty() {
            return Err(ToolError::InvalidSpec(format!(
                "Tool '{name}' has no download URL"
            )));
        }

        let temp = TempDir::new()
            .map_err(|error| ToolError::io("create tool download directory", error))?;
        let download = temp.path().join("download");
        download_file(&spec.url, &download)?;
        self.install_from_file(name, &download)
    }

    /// Installs from an already-downloaded file after digest verification.
    /// The staging directory is private and the cache is only published after
    /// the checksum and version probe both succeed.
    pub fn install_from_file(&self, name: &str, download: &Path) -> Result<PathBuf, ToolError> {
        let spec = self.spec(name)?.clone();
        self.ensure_supported(name, &spec)?;
        self.verify_file_sha256(name, download, &spec.sha256)?;

        let staging = TempDir::new()
            .map_err(|error| ToolError::io("create tool staging directory", error))?;
        let staged_root = staging.path().join("staged");
        fs::create_dir_all(&staged_root)
            .map_err(|error| ToolError::io("create staged tool directory", error))?;

        let relative = validate_executable_path(&spec.executable_path)?;
        let staged_executable = staged_root.join(&relative);
        stage_tool(&spec, download, &staged_root, &staged_executable)?;

        if !staged_executable.is_file() {
            return Err(ToolError::InvalidSpec(format!(
                "Tool '{name}' is missing executable '{}'",
                spec.executable_path
            )));
        }
        make_executable_if_needed(&spec, &staged_executable)?;

        let _probe = self.probe(name, &staged_executable, &spec)?;

        let target = self.install_dir(name)?;
        if let Some(parent) = target.parent() {
            fs::create_dir_all(parent)
                .map_err(|error| ToolError::io("create tool cache directory", error))?;
        }
        if target.exists() {
            fs::remove_dir_all(&target)
                .map_err(|error| ToolError::io("replace cached tool directory", error))?;
        }
        publish_directory(&staged_root, &target)?;
        Ok(target.join(relative))
    }

    /// Runs the lock's version probe through the shared process adapter.
    pub fn probe(
        &self,
        name: &str,
        executable: &Path,
        spec: &ToolSpec,
    ) -> Result<String, ToolError> {
        if spec.version_probe.args.is_empty() {
            return Ok(String::new());
        }
        let mut args = Vec::with_capacity(spec.version_probe.args.len());
        for argument in &spec.version_probe.args {
            args.push(argument.replace("{executable}", &executable.to_string_lossy()));
        }
        let Some(program) = args.first().cloned() else {
            return Ok(String::new());
        };
        let spec_process = ProcessSpec::new(program)
            .args(args[1..].iter().cloned())
            .timeout(PROBE_TIMEOUT);
        let mut output = None;
        for attempt in 0..3 {
            match process::run(&spec_process) {
                Ok(result) => {
                    output = Some(result);
                    break;
                }
                Err(Error::Io {
                    kind: std::io::ErrorKind::ExecutableFileBusy,
                    ..
                }) if attempt < 2 => {
                    // Linux can briefly report ETXTBSY while another worker
                    // closes a just-written staged file. Retry the probe rather
                    // than turning a transient cache install into a failure.
                    std::thread::sleep(Duration::from_millis(25));
                }
                Err(error) => {
                    return Err(ToolError::Probe(format!(
                        "Version probe failed for '{name}': {error}"
                    )))
                }
            }
        }
        let output = output.ok_or_else(|| {
            ToolError::Probe(format!(
                "Version probe failed for '{name}': executable remained busy"
            ))
        })?;
        let combined = format!(
            "{}\n{}",
            output.stdout.text_lossy(),
            output.stderr.text_lossy()
        );
        if !spec.version_probe.expected_pattern.is_empty() {
            let pattern = Regex::new(&spec.version_probe.expected_pattern).map_err(|error| {
                ToolError::InvalidSpec(format!(
                    "Invalid version probe pattern for '{name}': {error}"
                ))
            })?;
            if !pattern.is_match(&combined) {
                return Err(ToolError::Probe(format!(
                    "Version probe output mismatch for '{name}'. Expected pattern '{}', got: {}",
                    spec.version_probe.expected_pattern,
                    truncate_chars(&combined, 200)
                )));
            }
        }
        Ok(combined.trim().to_string())
    }

    /// Installs every tool in a profile. Per-tool failures are reported in the
    /// result rows rather than aborting the remaining tools, matching Python.
    pub fn setup_profile(&self, profile: Profile) -> Result<Vec<ToolCheckResult>, ToolError> {
        let names = profile_tool_names(profile, |name| {
            self.is_platform_supported(name).unwrap_or(false)
        });
        let mut results = Vec::with_capacity(names.len());
        for name in names {
            let spec = match self.spec(name) {
                Ok(spec) => spec.clone(),
                Err(error) => {
                    results.push(ToolCheckResult {
                        name: name.to_string(),
                        configured_version: String::new(),
                        installed: false,
                        actual_version: None,
                        executable_path: None,
                        error: Some(error.message()),
                    });
                    continue;
                }
            };
            match self.install_tool(name) {
                Ok(executable) => match self.probe(name, &executable, &spec) {
                    Ok(_) => results.push(ToolCheckResult {
                        name: name.to_string(),
                        configured_version: spec.version.clone(),
                        installed: true,
                        actual_version: Some(spec.version.clone()),
                        executable_path: Some(executable.to_string_lossy().into_owned()),
                        error: None,
                    }),
                    Err(error) => results.push(ToolCheckResult {
                        name: name.to_string(),
                        configured_version: spec.version.clone(),
                        installed: false,
                        actual_version: None,
                        executable_path: None,
                        error: Some(error.message()),
                    }),
                },
                Err(error) => results.push(ToolCheckResult {
                    name: name.to_string(),
                    configured_version: spec.version,
                    installed: false,
                    actual_version: None,
                    executable_path: None,
                    error: Some(error.message()),
                }),
            }
        }
        Ok(results)
    }

    fn ensure_supported(&self, name: &str, spec: &ToolSpec) -> Result<(), ToolError> {
        if platform_supported(spec, &self.host) {
            Ok(())
        } else {
            Err(ToolError::UnsupportedHost {
                name: name.to_string(),
                host: self.host.clone(),
                supported: spec.supported_platforms.clone(),
            })
        }
    }
}

/// Ordered tool names for a setup/doctor profile. `apkeep` is CI-only and is
/// included only when the host supports it.
#[must_use]
pub fn profile_tool_names(
    profile: Profile,
    mut supported: impl FnMut(&str) -> bool,
) -> Vec<&'static str> {
    let mut names = vec!["morphe", "jadx", "apktool", "baksmali", "smali"];
    if profile == Profile::Ci && supported(APKEEP_TOOL) {
        names.push(APKEEP_TOOL);
    }
    names
}

fn validate_sha256_text(value: &str) -> Result<(), ToolError> {
    if value.len() != 64 || !value.bytes().all(|byte| byte.is_ascii_hexdigit()) {
        return Err(ToolError::InvalidSpec(format!(
            "Invalid SHA-256 digest in tools lock: {value}"
        )));
    }
    Ok(())
}

/// Cache path components come from repository data but are still validated so
/// a corrupted lock cannot escape the cache root.
fn validate_cache_segment(kind: &str, value: &str) -> Result<(), ToolError> {
    if value.is_empty()
        || value == "."
        || value == ".."
        || value.contains('/')
        || value.contains('\\')
    {
        return Err(ToolError::InvalidSpec(format!(
            "Invalid {kind} in tools lock: {value:?}"
        )));
    }
    Ok(())
}

fn validate_executable_path(text: &str) -> Result<PathBuf, ToolError> {
    let path = Path::new(text);
    if text.is_empty() || path.is_absolute() {
        return Err(ToolError::InvalidSpec(format!(
            "Invalid executable path in tools lock: {text:?}"
        )));
    }
    for component in path.components() {
        match component {
            Component::Normal(_) => {}
            _ => {
                return Err(ToolError::InvalidSpec(format!(
                    "Invalid executable path in tools lock: {text:?}"
                )))
            }
        }
    }
    Ok(path.to_path_buf())
}

fn stage_tool(
    spec: &ToolSpec,
    download: &Path,
    staged_root: &Path,
    staged_executable: &Path,
) -> Result<(), ToolError> {
    match spec.tool_type {
        ToolType::Jar | ToolType::Binary => {
            if let Some(parent) = staged_executable.parent() {
                fs::create_dir_all(parent)
                    .map_err(|error| ToolError::io("create staged executable directory", error))?;
            }
            fs::copy(download, staged_executable).map_err(|error| {
                ToolError::io(
                    format!("stage tool executable {}", staged_executable.display()),
                    error,
                )
            })?;
        }
        ToolType::Zip => {
            crate::archives::safe_extract_all(download, staged_root).map_err(|error| {
                ToolError::Probe(format!("cannot unpack tool archive: {error}"))
            })?;
            let bin_dir = staged_root.join("bin");
            if bin_dir.is_dir() {
                for entry in fs::read_dir(&bin_dir)
                    .map_err(|error| ToolError::io("read staged bin directory", error))?
                {
                    let path = entry
                        .map_err(|error| ToolError::io("read staged bin entry", error))?
                        .path();
                    if path.is_file() {
                        make_executable(&path).map_err(|error| {
                            ToolError::io(
                                format!("mark staged tool executable {}", path.display()),
                                error,
                            )
                        })?;
                    }
                }
            }
        }
    }
    Ok(())
}

fn make_executable_if_needed(spec: &ToolSpec, path: &Path) -> Result<(), ToolError> {
    if spec.tool_type == ToolType::Jar {
        return Ok(());
    }
    make_executable(path).map_err(|error| {
        ToolError::io(
            format!("mark staged tool executable {}", path.display()),
            error,
        )
    })
}

fn publish_directory(source: &Path, target: &Path) -> Result<(), ToolError> {
    match fs::rename(source, target) {
        Ok(()) => Ok(()),
        Err(_) => copy_directory(source, target).map_err(|error| {
            ToolError::io(
                format!("publish cached tool to {}", target.display()),
                error,
            )
        }),
    }
}

fn copy_directory(source: &Path, target: &Path) -> io::Result<()> {
    fs::create_dir_all(target)?;
    for entry in fs::read_dir(source)? {
        let entry = entry?;
        let source_path = entry.path();
        let target_path = target.join(entry.file_name());
        let file_type = entry.file_type()?;
        if file_type.is_dir() {
            copy_directory(&source_path, &target_path)?;
        } else if file_type.is_file() {
            fs::copy(&source_path, &target_path)?;
            let permissions = fs::metadata(&source_path)?.permissions();
            fs::set_permissions(&target_path, permissions)?;
        }
    }
    Ok(())
}

/// Streams a file into a SHA-256 digest without loading it into memory.
pub fn sha256_file(path: impl AsRef<Path>) -> Result<String, ToolError> {
    let path = path.as_ref();
    let mut file = File::open(path)
        .map_err(|error| ToolError::io(format!("read file {}", path.display()), error))?;
    let mut hasher = Sha256::new();
    let mut buffer = [0u8; 64 * 1024];
    loop {
        let read = file
            .read(&mut buffer)
            .map_err(|error| ToolError::io(format!("read file {}", path.display()), error))?;
        if read == 0 {
            break;
        }
        hasher.update(&buffer[..read]);
    }
    Ok(format!("{:x}", hasher.finalize()))
}

fn download_file(url: &str, destination: &Path) -> Result<(), ToolError> {
    let mut response = ureq::get(url)
        .header("user-agent", "apk-lab-toolchain-installer/1.0")
        .call()
        .map_err(|error| ToolError::Probe(format!("download failed for {url}: {error}")))?;
    let mut file = File::create(destination).map_err(|error| {
        ToolError::io(
            format!("create tool download {}", destination.display()),
            error,
        )
    })?;
    let mut reader = response.body_mut().as_reader();
    io::copy(&mut reader, &mut file)
        .map_err(|error| ToolError::io("stream tool download", error))?;
    file.flush()
        .map_err(|error| ToolError::io("flush tool download", error))
}

fn is_executable(path: &Path) -> bool {
    if !path.is_file() {
        return false;
    }
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        fs::metadata(path)
            .map(|metadata| metadata.permissions().mode() & 0o111 != 0)
            .unwrap_or(false)
    }
    #[cfg(not(unix))]
    {
        true
    }
}

fn make_executable(path: &Path) -> io::Result<()> {
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        let mut permissions = fs::metadata(path)?.permissions();
        permissions.set_mode(permissions.mode() | 0o755);
        fs::set_permissions(path, permissions)
    }
    #[cfg(not(unix))]
    {
        let _ = path;
        Ok(())
    }
}

fn truncate_chars(text: &str, limit: usize) -> String {
    text.chars().take(limit).collect()
}

/// One tool row in the doctor report. Field names and order match Python's
/// `ToolCheckResult.to_dict`.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct ToolCheckResult {
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "configuredVersion")]
    pub configured_version: String,
    #[serde(rename = "installed")]
    pub installed: bool,
    #[serde(rename = "actualVersion")]
    pub actual_version: Option<String>,
    #[serde(rename = "executablePath")]
    pub executable_path: Option<String>,
    #[serde(rename = "error")]
    pub error: Option<String>,
}

/// One host prerequisite row.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct HostPrerequisiteResult {
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "satisfied")]
    pub satisfied: bool,
    #[serde(rename = "versionOrPath")]
    pub version_or_path: Option<String>,
    #[serde(rename = "error")]
    pub error: Option<String>,
}

/// The doctor report, serialized exactly like Python's `DoctorReport.to_dict`.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct DoctorReport {
    #[serde(rename = "allReady")]
    pub all_ready: bool,
    #[serde(rename = "workspaceWritable")]
    pub workspace_writable: bool,
    #[serde(rename = "ciMode")]
    pub ci_mode: bool,
    #[serde(rename = "tools")]
    pub tools: Vec<ToolCheckResult>,
    #[serde(rename = "prerequisites")]
    pub prerequisites: Vec<HostPrerequisiteResult>,
    #[serde(rename = "credentialsPresent")]
    pub credentials_present: BTreeMap<String, bool>,
}

/// Inputs for a doctor run.
#[derive(Debug, Clone)]
pub struct DoctorOptions {
    pub ci_mode: bool,
    pub profile: Option<Profile>,
    pub workspace_root: PathBuf,
}

impl Default for DoctorOptions {
    fn default() -> Self {
        Self {
            ci_mode: false,
            profile: None,
            workspace_root: PathBuf::from(DEFAULT_WORKSPACE_ROOT),
        }
    }
}

/// Non-destructive host readiness check. Never installs a tool and never
/// writes into the tool cache.
#[must_use]
pub fn check_host_prerequisites(
    manager: &ToolManager,
    env: &ToolEnvironment,
    options: &DoctorOptions,
) -> DoctorReport {
    let active_profile = options.profile.unwrap_or(if options.ci_mode {
        Profile::Ci
    } else {
        Profile::Analysis
    });
    let ci_mode = options.ci_mode || active_profile == Profile::Ci;

    let prerequisites = vec![check_java(env), check_android_sdk(env)];

    let mut tools = Vec::new();
    for tool in &manager.lock().tools {
        if tool.name == APKEEP_TOOL
            && (active_profile != Profile::Ci
                || !manager.is_platform_supported(&tool.name).unwrap_or(false))
        {
            continue;
        }
        let installed = manager.is_tool_installed(&tool.name);
        let executable_path = if installed {
            manager
                .executable_path(&tool.name)
                .ok()
                .map(|path| canonical_or_absolute(&path).to_string_lossy().into_owned())
        } else {
            None
        };
        tools.push(ToolCheckResult {
            name: tool.name.clone(),
            configured_version: tool.spec.version.clone(),
            installed,
            actual_version: installed.then(|| tool.spec.version.clone()),
            executable_path,
            error: if installed {
                None
            } else {
                Some("Not installed in cache".to_string())
            },
        });
    }

    let workspace_writable = workspace_is_writable(&options.workspace_root);
    let credentials_present = if ci_mode {
        REQUIRED_CI_CREDENTIALS
            .iter()
            .chain(OPTIONAL_CI_CREDENTIALS.iter())
            .map(|name| {
                let present = env.credentials.get(*name).copied().unwrap_or(false);
                ((*name).to_string(), present)
            })
            .collect()
    } else {
        BTreeMap::new()
    };

    let prerequisites_ok = prerequisites.iter().all(|item| item.satisfied);
    let tools_ok = tools.iter().all(|item| item.installed);
    let credentials_ok = if ci_mode {
        REQUIRED_CI_CREDENTIALS
            .iter()
            .all(|name| credentials_present.get(*name).copied().unwrap_or(false))
    } else {
        true
    };

    DoctorReport {
        all_ready: prerequisites_ok && tools_ok && workspace_writable && credentials_ok,
        workspace_writable,
        ci_mode,
        tools,
        prerequisites,
        credentials_present,
    }
}

fn check_java(env: &ToolEnvironment) -> HostPrerequisiteResult {
    let java = env.find_java();
    let spec = ProcessSpec::new(java).arg("-version");
    match process::run(&spec) {
        Ok(output) if output.success() => {
            let text = format!(
                "{}\n{}",
                output.stdout.text_lossy(),
                output.stderr.text_lossy()
            );
            match java_major_version(&text) {
                Some(major) if major >= 21 => HostPrerequisiteResult {
                    name: "Java".to_string(),
                    satisfied: true,
                    version_or_path: Some(format!("Java {major}")),
                    error: None,
                },
                Some(major) => HostPrerequisiteResult {
                    name: "Java".to_string(),
                    satisfied: false,
                    version_or_path: Some(format!("Java {major}")),
                    error: Some("Java 21+ required".to_string()),
                },
                None => HostPrerequisiteResult {
                    name: "Java".to_string(),
                    satisfied: false,
                    version_or_path: None,
                    error: Some("Could not parse java version".to_string()),
                },
            }
        }
        Ok(output) => {
            let stderr = output.stderr.text_lossy();
            let detail = if stderr.trim().is_empty() {
                format!("Exit {}", output.exit_code().unwrap_or(-1))
            } else {
                truncate_chars(stderr.trim(), 200)
            };
            HostPrerequisiteResult {
                name: "Java".to_string(),
                satisfied: false,
                version_or_path: None,
                error: Some(format!("java -version failed: {detail}")),
            }
        }
        Err(error) => HostPrerequisiteResult {
            name: "Java".to_string(),
            satisfied: false,
            version_or_path: None,
            error: Some(error.message()),
        },
    }
}

/// Parses the major Java version from `java -version` text.
#[must_use]
pub fn java_major_version(text: &str) -> Option<u32> {
    let pattern = Regex::new(r#"version\s+"(\d+)(?:\.(\d+))?"#).ok()?;
    let captures = pattern.captures(text)?;
    captures.get(1)?.as_str().parse().ok()
}

fn check_android_sdk(env: &ToolEnvironment) -> HostPrerequisiteResult {
    match env.sdk_dir() {
        Some(sdk_dir) if sdk_dir.is_dir() => {
            let build_tools = sdk_dir.join("build-tools");
            let preferred = build_tools.join("36.0.0");
            if preferred.is_dir() {
                HostPrerequisiteResult {
                    name: "Android Build Tools".to_string(),
                    satisfied: true,
                    version_or_path: Some(format!("36.0.0 ({})", preferred.display())),
                    error: None,
                }
            } else {
                HostPrerequisiteResult {
                    name: "Android Build Tools".to_string(),
                    satisfied: false,
                    version_or_path: Some(sdk_dir.to_string_lossy().into_owned()),
                    error: Some(format!(
                        "Build Tools 36.0.0 not found in {}",
                        build_tools.display()
                    )),
                }
            }
        }
        _ => HostPrerequisiteResult {
            name: "Android SDK".to_string(),
            satisfied: false,
            version_or_path: None,
            error: Some(
                "ANDROID_HOME / ANDROID_SDK_ROOT or local.properties sdk.dir not found".to_string(),
            ),
        },
    }
}

/// Probes workspace writability with a temporary file that is always removed.
/// The tool cache is never touched.
#[must_use]
pub fn workspace_is_writable(root: &Path) -> bool {
    if fs::create_dir_all(root).is_err() {
        return false;
    }
    match tempfile::Builder::new().prefix(".probe_").tempfile_in(root) {
        Ok(probe) => {
            let path = probe.path().to_path_buf();
            drop(probe);
            let _ = fs::remove_file(path);
            true
        }
        Err(_) => false,
    }
}

fn canonical_or_absolute(path: &Path) -> PathBuf {
    fs::canonicalize(path)
        .unwrap_or_else(|_| std::path::absolute(path).unwrap_or_else(|_| path.to_path_buf()))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn lock_with(text: &str) -> TempDir {
        let directory = tempfile::tempdir().expect("tempdir");
        fs::write(directory.path().join("tools.lock.json"), text).expect("write lock");
        directory
    }

    #[test]
    fn host_mapping_normalizes_known_platforms() {
        assert_eq!(host_platform_for("linux", "aarch64"), "linux-aarch64");
        assert_eq!(host_platform_for("macos", "arm64"), "darwin-aarch64");
        assert_eq!(host_platform_for("darwin", "x86_64"), "darwin-x86_64");
        assert_eq!(host_platform_for("windows", "AMD64"), "windows-x86_64");
        assert_eq!(host_platform_for("freebsd", "riscv64"), "freebsd-riscv64");
    }

    #[test]
    fn lock_preserves_document_order_and_rejects_unknown_tools() {
        let digest_a = "a".repeat(64);
        let digest_b = "b".repeat(64);
        let document = format!(
            r#"{{"tools":{{
                "zeta": {{"version":"1","url":"u","sha256":"{digest_a}","supportedPlatforms":["any"],"toolType":"binary","executablePath":"zeta"}},
                "alpha": {{"version":"2","url":"u","sha256":"{digest_b}","supportedPlatforms":["any"],"toolType":"jar","executablePath":"alpha.jar"}}
            }}}}"#
        );
        let directory = lock_with(&document);
        let manager = ToolManager::new(
            directory.path().join("cache"),
            directory.path().join("tools.lock.json"),
        )
        .expect("manager");
        let names: Vec<&str> = manager
            .lock()
            .tools
            .iter()
            .map(|tool| tool.name.as_str())
            .collect();
        assert_eq!(names, ["zeta", "alpha"]);
        assert!(manager.spec("missing").is_err());
    }
}
