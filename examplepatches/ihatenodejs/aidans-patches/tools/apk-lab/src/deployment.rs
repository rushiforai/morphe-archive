//! Transactional deployment and the developer loop.
//!
//! Native port of the deployment half of the retired Python implementation. Patch selection
//! and application stay behind [`PatchEngine`] because that is Morphe's
//! contract; everything else (bundle/artifact discovery, signing negotiation,
//! alignment, reinspection, data-preserving install and launch) lives here.
//!
//! The externally visible transaction is ordered deliberately:
//!
//! 1. the input and output are resolved and proven distinct *before* any
//!    staging directory or device command exists,
//! 2. patches are applied into a private staging directory inside the final
//!    parent,
//! 3. native libraries are stored uncompressed, the APK is page-aligned when
//!    that happened, signed and verified,
//! 4. the signed APK is re-inspected,
//! 5. only then is it atomically renamed over the final path,
//! 6. install and launch run last.
//!
//! A failure before step 5 leaves an existing output byte-for-byte untouched.
//! A failure in step 6 reports the already-replaced output exactly.
//!
//! Secrets are never passed on a command line. `apksigner` receives
//! `--ks-pass file:`/`--key-pass file:` and `keytool` receives
//! `-storepass:file`/`-keypass:file`; the files are created private and removed
//! as soon as the tool exits. Diagnostics redact before truncating so a secret
//! straddling the truncation boundary cannot leak.

use crate::acquisition::read_private_file;
use crate::device::{self, AdbClient, AdbRunner};
use crate::error::Error;
use crate::inspection::{self, InspectionOptions};
use crate::models::ArtifactInspection;
use crate::process::{self, ProcessOutput, ProcessSpec};
use crate::tools::{self, ToolEnvironment, ToolManager};
use serde::{Deserialize, Serialize};
use std::fs::{self, File};
use std::io::{Read, Write};
use std::path::{Path, PathBuf};
use std::sync::atomic::AtomicBool;
use std::sync::Arc;
use tempfile::NamedTempFile;
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipArchive, ZipWriter};

/// Signer digest of the keystore Morphe installs for Morphe-compatible builds.
pub const MORPHE_KEYSTORE_SHA256: &str =
    "6959a7790bff42cc28fbe41c20d457401e32f4854f414dbc390de9f1529c9295";

/// Characters retained from a failing external tool's diagnostics.
pub const DIAGNOSTIC_CHAR_LIMIT: usize = 500;

const DEFAULT_DEBUG_ALIAS: &str = "androiddebugkey";
const DEFAULT_DEBUG_PASSWORD: &str = "android";
const MORPHE_ALIAS: &str = "Morphe";
const MORPHE_PASSWORD: &str = "Morphe";
const STAGE_PREFIX: &str = "apk-lab-stage-";

/// Prefix identifying a password supplied as a private file path through
/// `--ks-pass-file`/`--key-pass-file`. The value is `file:` plus the path; the
/// secret itself is read from that file only when signing starts.
pub const PASSWORD_FILE_PREFIX: &str = "file:";

/// One-line notice emitted when an inline password flag is used.
pub const INLINE_PASSWORD_DEPRECATION: &str = "warning: --ks-pass/--key-pass values are visible in process listings; prefer --ks-pass-file/--key-pass-file";

/// Credential-carrying variables deployment children never receive.
pub const CHILD_SECRET_ENV: &[&str] = &[
    "APKEEP_AAS_TOKEN",
    "APKEEP_OAUTH_TOKEN",
    "APKEEP_KS_PASS",
    "APKEEP_KEY_PASS",
];

/// Install behavior. The default preserves application data.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum InstallMode {
    #[serde(rename = "reinstall")]
    Reinstall,
    #[serde(rename = "clean-install")]
    CleanInstall,
}

impl InstallMode {
    #[must_use]
    pub const fn as_str(self) -> &'static str {
        match self {
            Self::Reinstall => "reinstall",
            Self::CleanInstall => "clean-install",
        }
    }

    #[must_use]
    pub const fn description(self) -> &'static str {
        match self {
            Self::Reinstall => "reinstall",
            Self::CleanInstall => "clean install",
        }
    }
}

/// Successful deployment record, mirroring `DeployResult.to_dict`.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct DeployResult {
    #[serde(rename = "outputApk")]
    pub output_apk: String,
    #[serde(rename = "packageName")]
    pub package_name: String,
    #[serde(rename = "deviceSerial")]
    pub device_serial: String,
    #[serde(rename = "appliedPatches")]
    pub applied_patches: Vec<String>,
    #[serde(rename = "installMode")]
    pub install_mode: InstallMode,
    #[serde(rename = "launchComponent")]
    pub launch_component: Option<String>,
}

impl DeployResult {
    /// Human-readable rendering used by the CLI.
    #[must_use]
    pub fn format_human(&self) -> String {
        let mut lines = vec![
            format!("Output APK: {}", self.output_apk),
            format!("Package: {}", self.package_name),
            format!("Device: {}", self.device_serial),
            format!("Install mode: {}", self.install_mode.as_str()),
            format!(
                "Applied patches: {}",
                if self.applied_patches.is_empty() {
                    "none".to_string()
                } else {
                    self.applied_patches.join(", ")
                }
            ),
        ];
        if let Some(component) = &self.launch_component {
            lines.push(format!("Launched: {component}"));
        }
        lines.join("\n")
    }
}

/// One patch-application request. The engine owns selection semantics and
/// returns the patch names Morphe actually reported as applied.
pub struct PatchBuildRequest<'a> {
    pub mpp: &'a Path,
    pub artifact: &'a Path,
    pub package_name: &'a str,
    pub all_defaults: bool,
    pub enabled_patches: &'a [String],
    pub raw_options: &'a [String],
    pub output_apk: &'a Path,
    pub scratch_dir: &'a Path,
}

/// Injection point for Morphe patch selection and application.
///
/// Production wiring supplies the native Morphe port; deployment tests supply
/// a deterministic engine that writes a synthetic APK.
pub trait PatchEngine {
    fn apply(&self, request: &PatchBuildRequest<'_>) -> Result<Vec<String>, Error>;
}

/// Inputs that identify host tools. Tests construct this with fake SDK and
/// fake `adb`/`keytool` binaries; nothing is discovered implicitly.
#[derive(Debug, Clone)]
pub struct DeploymentTools {
    pub inspection: InspectionOptions,
    pub adb: PathBuf,
    pub keytool: Option<PathBuf>,
    pub morphe_keystore: Option<PathBuf>,
    pub home: Option<PathBuf>,
    /// Optional caller-owned cancellation, propagated to every deployment
    /// child. The process-wide signal flag is always consulted by the adapter.
    pub cancel: Option<Arc<AtomicBool>>,
}

impl DeploymentTools {
    /// Discovers host tools the same way the Python implementation does.
    pub fn discover() -> Result<Self, Error> {
        let env = ToolEnvironment::from_process(&tools::default_repo_root());
        let adb = device::find_adb()?;
        let keytool = find_keytool(&env);
        let morphe_keystore = ToolManager::with_defaults()
            .ok()
            .and_then(|manager| manager.install_dir("morphe").ok())
            .map(|directory| directory.join("morphe-data").join("morphe.keystore"))
            .filter(|path| path.is_file());
        Ok(Self {
            inspection: InspectionOptions {
                env,
                timeout: inspection::DEFAULT_TOOL_TIMEOUT,
            },
            adb,
            keytool,
            morphe_keystore,
            home: std::env::var_os("HOME").map(PathBuf::from),
            cancel: None,
        })
    }
}

/// Locates `adb` from the Android SDK or `PATH`.
fn find_keytool(env: &ToolEnvironment) -> Option<PathBuf> {
    if let Some(java_home) = &env.java_home {
        let candidate = java_home.join("bin").join("keytool");
        if candidate.is_file() {
            return Some(candidate);
        }
    }
    env.find_in_path("keytool")
}

/// Full deploy request. Contains passwords, so it deliberately has no derived
/// `Debug` implementation.
pub struct DeployOptions {
    pub artifact: PathBuf,
    pub mpp: Option<PathBuf>,
    pub build: bool,
    pub repo_start: PathBuf,
    pub package_name: String,
    pub all_defaults: bool,
    pub enabled_patches: Vec<String>,
    pub raw_options: Vec<String>,
    pub device_serial: Option<String>,
    pub launch: bool,
    pub clean_install: bool,
    pub out_apk: Option<PathBuf>,
    pub keystore: Option<PathBuf>,
    pub ks_alias: Option<String>,
    pub ks_pass: Option<String>,
    pub key_pass: Option<String>,
}

impl std::fmt::Debug for DeployOptions {
    fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        formatter
            .debug_struct("DeployOptions")
            .field("artifact", &self.artifact)
            .field("mpp", &self.mpp)
            .field("build", &self.build)
            .field("repo_start", &self.repo_start)
            .field("package_name", &self.package_name)
            .field("all_defaults", &self.all_defaults)
            .field("enabled_patches", &self.enabled_patches)
            .field("raw_options", &self.raw_options)
            .field("device_serial", &self.device_serial)
            .field("launch", &self.launch)
            .field("clean_install", &self.clean_install)
            .field("out_apk", &self.out_apk)
            .field("keystore", &self.keystore)
            .field("ks_alias", &self.ks_alias)
            .field("ks_pass", &self.ks_pass.as_ref().map(|_| "[REDACTED]"))
            .field("key_pass", &self.key_pass.as_ref().map(|_| "[REDACTED]"))
            .finish()
    }
}

impl DeployOptions {
    /// Path supplied through `--ks-pass-file`, when the password source is a
    /// private file rather than an inline value.
    #[must_use]
    pub fn ks_pass_file(&self) -> Option<&Path> {
        self.ks_pass
            .as_deref()
            .and_then(|value| value.strip_prefix(PASSWORD_FILE_PREFIX))
            .map(Path::new)
    }

    /// Path supplied through `--key-pass-file`, when the password source is a
    /// private file rather than an inline value.
    #[must_use]
    pub fn key_pass_file(&self) -> Option<&Path> {
        self.key_pass
            .as_deref()
            .and_then(|value| value.strip_prefix(PASSWORD_FILE_PREFIX))
            .map(Path::new)
    }
}

/// Resolves a patch bundle from `--mpp` or builds it with `--build`.
pub enum BundleSource {
    Existing(PathBuf),
    Build(PathBuf),
}

/// Applies the Python deploy default: `--mpp` wins, `--build` builds, and
/// neither is a usage error.
pub fn resolve_bundle_source(
    mpp: Option<&Path>,
    build: bool,
    repo_start: &Path,
) -> Result<BundleSource, Error> {
    if let Some(mpp) = mpp {
        return Ok(BundleSource::Existing(mpp.to_path_buf()));
    }
    if build {
        return Ok(BundleSource::Build(find_repo_root(repo_start)?));
    }
    Err(Error::usage("Either --mpp or --build must be specified"))
}

/// Performs bundle resolution, including an optional Gradle build.
pub fn resolve_deploy_bundle(
    mpp: Option<&Path>,
    build: bool,
    repo_start: &Path,
) -> Result<PathBuf, Error> {
    match resolve_bundle_source(mpp, build, repo_start)? {
        BundleSource::Existing(path) => Ok(path),
        BundleSource::Build(repo_root) => build_patch_bundle(&repo_root),
    }
}

/// Searches upward from `start` for the repository root (`gradlew` file).
pub fn find_repo_root(start: &Path) -> Result<PathBuf, Error> {
    let absolute = fs::canonicalize(start)
        .or_else(|_| std::path::absolute(start))
        .map_err(|error| Error::io(format!("resolve {}", start.display()), error))?;
    for candidate in absolute.ancestors() {
        if candidate.join("gradlew").is_file() {
            return Ok(candidate.to_path_buf());
        }
    }
    Err(Error::infrastructure(
        "Could not find repository root (gradlew not found in ancestors)",
    ))
}

/// Runs `./gradlew :patches:buildAndroid` and returns the newest `.mpp`.
pub fn build_patch_bundle(repo_root: &Path) -> Result<PathBuf, Error> {
    let gradlew = repo_root.join("gradlew");
    if !gradlew.is_file() {
        return Err(Error::infrastructure(format!(
            "Gradle wrapper not found at {}",
            gradlew.display()
        )));
    }
    let spec = scrub_child_environment(
        ProcessSpec::new(gradlew)
            .arg(":patches:buildAndroid")
            .cwd(repo_root),
    );
    let output = process::run(&spec)?;
    if !output.success() {
        let detail = diagnostic_text(&spec, &output, DIAGNOSTIC_CHAR_LIMIT);
        return Err(Error::infrastructure(format!(
            "Gradle build failed (exit code {}):\n{}",
            output
                .exit_code()
                .map_or_else(|| "signal".to_string(), |code| code.to_string()),
            detail
        )));
    }
    let libs_dir = repo_root.join("patches").join("build").join("libs");
    if !libs_dir.is_dir() {
        return Err(Error::infrastructure(format!(
            "Output directory does not exist: {}",
            libs_dir.display()
        )));
    }
    newest_bundle(&libs_dir)
}

/// Returns the most recently modified `.mpp` in `libs_dir`.
pub fn newest_bundle(libs_dir: &Path) -> Result<PathBuf, Error> {
    let entries = fs::read_dir(libs_dir)
        .map_err(|error| Error::io(format!("read {}", libs_dir.display()), error))?;
    let mut newest: Option<(PathBuf, std::time::SystemTime)> = None;
    for entry in entries.flatten() {
        let path = entry.path();
        if path.extension().and_then(|value| value.to_str()) != Some("mpp") {
            continue;
        }
        let Ok(metadata) = entry.metadata() else {
            continue;
        };
        if !metadata.is_file() {
            continue;
        }
        let modified = metadata.modified().unwrap_or(std::time::UNIX_EPOCH);
        if newest
            .as_ref()
            .is_none_or(|(_, current)| modified > *current)
        {
            newest = Some((path, modified));
        }
    }
    newest.map(|(path, _)| path).ok_or_else(|| {
        Error::infrastructure(format!("No .mpp bundle found in {}", libs_dir.display()))
    })
}

/// Identifies patched outputs so clean inputs win artifact discovery.
#[must_use]
pub fn is_derivative_artifact_name(name: &str) -> bool {
    let lower = name.to_ascii_lowercase();
    lower.ends_with("-patched.apk")
        || lower.ends_with(".mpe")
        || lower.contains("-patches-")
        || lower.contains("_patched")
}

/// Searches `apk/`, `~/Downloads` and `.apk-lab/` for a matching artifact.
///
/// Ranking matches the Python oracle: clean before derivative, split container
/// before standalone APK, then newest first.
#[must_use]
pub fn find_app_artifact(target: &str, repo_root: &Path, home: &Path) -> Option<PathBuf> {
    let search_dirs = [
        repo_root.join("apk"),
        home.join("Downloads"),
        repo_root.join(".apk-lab"),
    ];
    let target_lower = target.to_ascii_lowercase();

    for base_dir in &search_dirs {
        if !base_dir.is_dir() {
            continue;
        }
        let mut candidates: Vec<PathBuf> = Vec::new();
        collect_artifacts(base_dir, base_dir, &target_lower, &mut candidates);

        if candidates.is_empty() {
            continue;
        }
        candidates.sort_by_key(|path| std::cmp::Reverse(artifact_rank(path)));
        return candidates.into_iter().next();
    }
    None
}

fn collect_artifacts(base_dir: &Path, directory: &Path, target: &str, out: &mut Vec<PathBuf>) {
    let Ok(entries) = fs::read_dir(directory) else {
        return;
    };
    for entry in entries.flatten() {
        let path = entry.path();
        let Ok(file_type) = entry.file_type() else {
            continue;
        };
        if file_type.is_dir() {
            collect_artifacts(base_dir, &path, target, out);
            continue;
        }
        if !file_type.is_file() {
            continue;
        }
        let valid_extension = matches!(
            path.extension()
                .and_then(|value| value.to_str())
                .map(str::to_ascii_lowercase)
                .as_deref(),
            Some("apk" | "apkm" | "xapk" | "apks")
        );
        if !valid_extension {
            continue;
        }
        let relative = path.strip_prefix(base_dir).unwrap_or(&path);
        if relative.components().any(|component| {
            component
                .as_os_str()
                .to_string_lossy()
                .to_ascii_lowercase()
                .contains(target)
        }) {
            out.push(path);
        }
    }
}

fn artifact_rank(path: &Path) -> (bool, bool, std::time::SystemTime) {
    let name = path
        .file_name()
        .map(|value| value.to_string_lossy().into_owned())
        .unwrap_or_default();
    let clean = !is_derivative_artifact_name(&name);
    let split = matches!(
        path.extension()
            .and_then(|value| value.to_str())
            .map(str::to_ascii_lowercase)
            .as_deref(),
        Some("apkm" | "xapk" | "apks")
    );
    let modified = fs::metadata(path)
        .and_then(|metadata| metadata.modified())
        .unwrap_or(std::time::UNIX_EPOCH);
    (clean, split, modified)
}

/// Resolves the artifact used by `dev`: an explicit path wins over `--app`.
pub fn resolve_dev_artifact(
    explicit: Option<&Path>,
    app: Option<&str>,
    repo_root: &Path,
    home: &Path,
) -> Result<PathBuf, Error> {
    if let Some(explicit) = explicit {
        let path = fs::canonicalize(explicit)
            .map_err(|_| Error::usage(format!("Artifact not found: {}", explicit.display())))?;
        if !path.is_file() {
            return Err(Error::usage(format!(
                "Artifact not found: {}",
                explicit.display()
            )));
        }
        return Ok(path);
    }
    let Some(app) = app else {
        return Err(Error::usage("Either app or --artifact must be specified"));
    };
    find_app_artifact(app, repo_root, home)
        .ok_or_else(|| Error::usage(format!("Could not find matching artifact for '{app}'")))
}

/// Resolves the bundle used by `dev`: `--no-build` uses the newest existing
/// bundle, otherwise Gradle builds one.
pub fn resolve_dev_bundle(repo_root: &Path, no_build: bool) -> Result<PathBuf, Error> {
    if no_build {
        let libs_dir = repo_root.join("patches").join("build").join("libs");
        if !libs_dir.is_dir() {
            return Err(Error::infrastructure(format!(
                "No .mpp bundle found in {}",
                libs_dir.display()
            )));
        }
        newest_bundle(&libs_dir)
    } else {
        build_patch_bundle(repo_root)
    }
}

/// Signing inputs. Passwords are private and redacted from `Debug`.
pub struct SigningCredentials {
    pub keystore: PathBuf,
    pub alias: String,
    store_password: String,
    key_password: String,
}

impl SigningCredentials {
    #[must_use]
    pub fn new(
        keystore: PathBuf,
        alias: impl Into<String>,
        store_password: impl Into<String>,
        key_password: impl Into<String>,
    ) -> Self {
        Self {
            keystore,
            alias: alias.into(),
            store_password: store_password.into(),
            key_password: key_password.into(),
        }
    }

    #[must_use]
    pub fn store_password(&self) -> &str {
        &self.store_password
    }

    #[must_use]
    pub fn key_password(&self) -> &str {
        &self.key_password
    }
}

impl std::fmt::Debug for SigningCredentials {
    fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        formatter
            .debug_struct("SigningCredentials")
            .field("keystore", &self.keystore)
            .field("alias", &self.alias)
            .field("store_password", &"[REDACTED]")
            .field("key_password", &"[REDACTED]")
            .finish()
    }
}

/// Deploys one already-resolved request.
pub fn deploy_artifact(
    options: &DeployOptions,
    tools: &DeploymentTools,
    engine: &dyn PatchEngine,
) -> Result<DeployResult, Error> {
    let input = canonical_input(&options.artifact)?;
    let final_output = final_output_path(&input, options.out_apk.as_deref())?;

    // This must precede staging and every device command.
    ensure_distinct_output(&input, &final_output)?;

    let mpp = resolve_deploy_bundle(options.mpp.as_deref(), options.build, &options.repo_start)?;

    let final_parent = final_output
        .parent()
        .ok_or_else(|| Error::usage("Deployment output has no parent directory"))?;
    fs::create_dir_all(final_parent)
        .map_err(|error| Error::io(format!("create {}", final_parent.display()), error))?;

    let adb = AdbClient::with_adb_path(&tools.adb);
    let serial = select_device(&adb, options.device_serial.as_deref())?;

    let staging = tempfile::Builder::new()
        .prefix(STAGE_PREFIX)
        .tempdir_in(final_parent)
        .map_err(|error| {
            Error::io(
                format!("create staging in {}", final_parent.display()),
                error,
            )
        })?;
    let staged_unsigned = staging.path().join("unsigned.apk");
    let staged_aligned = staging.path().join("aligned.apk");
    let scratch_dir = staging.path().join("scratch");

    let applied = engine.apply(&PatchBuildRequest {
        mpp: &mpp,
        artifact: &input,
        package_name: &options.package_name,
        all_defaults: options.all_defaults,
        enabled_patches: &options.enabled_patches,
        raw_options: &options.raw_options,
        output_apk: &staged_unsigned,
        scratch_dir: &scratch_dir,
    })?;
    if !staged_unsigned.is_file() {
        return Err(Error::infrastructure(
            "Morphe reported success but output APK was not created",
        ));
    }

    let store_password =
        resolve_password_source(options.ks_pass.as_deref(), "--ks-pass-file", "--ks-pass")?;
    let key_password =
        resolve_password_source(options.key_pass.as_deref(), "--key-pass-file", "--key-pass")?;
    let credentials = resolve_signing_keystore(
        Some(&options.package_name),
        Some(serial.as_str()),
        options.keystore.as_deref(),
        options.ks_alias.as_deref(),
        store_password.as_deref(),
        key_password.as_deref(),
        tools,
        &adb,
    )?;

    zipalign_and_sign(&staged_unsigned, &staged_aligned, &credentials, tools)?;

    let signed = inspection::inspect_artifact_with_options(&staged_aligned, &tools.inspection)?;
    if signed.package_name != options.package_name {
        return Err(Error::infrastructure(format!(
            "Signed output package '{}' does not match expected '{}'",
            signed.package_name, options.package_name
        )));
    }

    fs::rename(&staged_aligned, &final_output).map_err(|error| {
        Error::io(
            format!(
                "replace {} with {}",
                final_output.display(),
                staged_aligned.display()
            ),
            error,
        )
    })?;
    drop(staging);

    let installed_path = fs::canonicalize(&final_output).unwrap_or_else(|_| final_output.clone());
    let mode = if options.clean_install {
        InstallMode::CleanInstall
    } else {
        InstallMode::Reinstall
    };
    device::install_apk(
        &adb,
        &installed_path,
        &options.package_name,
        Some(serial.as_str()),
        mode == InstallMode::CleanInstall,
    )
    .map_err(|error| {
        post_replacement_error("install", &installed_path, "not installed", error.message())
    })?;

    let mut launch_component = None;
    if options.launch {
        let component = resolve_launch_component(&installed_path, &options.package_name, tools)?;
        device::launch_component_intent(&adb, &component, Some(serial.as_str())).map_err(
            |error| {
                post_replacement_error(
                    "launch",
                    &installed_path,
                    "install succeeded",
                    error.message(),
                )
            },
        )?;
        launch_component = Some(component);
    }

    Ok(DeployResult {
        output_apk: installed_path.to_string_lossy().into_owned(),
        package_name: options.package_name.clone(),
        device_serial: serial,
        applied_patches: applied,
        install_mode: mode,
        launch_component,
    })
}

fn post_replacement_error(stage: &str, output: &Path, state: &str, detail: String) -> Error {
    Error::infrastructure(format!(
        "ADB {stage} failed after the output was replaced at {} ({state}): {detail}",
        output.display()
    ))
}

fn canonical_input(path: &Path) -> Result<PathBuf, Error> {
    let canonical = fs::canonicalize(path).map_err(|error| match error.kind() {
        std::io::ErrorKind::NotFound => {
            Error::usage(format!("Artifact not found: {}", path.display()))
        }
        _ => Error::io(format!("resolve artifact {}", path.display()), error),
    })?;
    if !canonical.is_file() {
        return Err(Error::usage(format!(
            "Artifact not found: {}",
            path.display()
        )));
    }
    Ok(canonical)
}

fn final_output_path(input: &Path, explicit: Option<&Path>) -> Result<PathBuf, Error> {
    if let Some(explicit) = explicit {
        return std::path::absolute(explicit)
            .map_err(|error| Error::io(format!("resolve {}", explicit.display()), error));
    }
    let parent = input
        .parent()
        .ok_or_else(|| Error::usage("Artifact has no parent directory"))?;
    let stem = input
        .file_stem()
        .ok_or_else(|| Error::usage("Artifact has no file name"))?;
    Ok(parent.join(format!("{}-patched.apk", stem.to_string_lossy())))
}

/// Rejects every alias of the input: lexical, symlink, hardlink, and paths
/// that normalize to it. Runs before staging or device contact.
pub fn ensure_distinct_output(input: &Path, output: &Path) -> Result<(), Error> {
    let alias_message = "Deployment output must not overwrite the input artifact";
    let input = fs::canonicalize(input).unwrap_or_else(|_| input.to_path_buf());

    let output_parent = output.parent().unwrap_or_else(|| Path::new("."));
    let resolved_parent = fs::canonicalize(output_parent).unwrap_or_else(|_| {
        std::path::absolute(output_parent).unwrap_or_else(|_| output_parent.to_path_buf())
    });
    let Some(name) = output.file_name() else {
        return Err(Error::usage(alias_message));
    };
    let candidate = resolved_parent.join(name);

    if candidate == input {
        return Err(Error::usage(alias_message));
    }

    if output.exists() {
        if let Ok(canonical) = fs::canonicalize(output) {
            if canonical == input {
                return Err(Error::usage(alias_message));
            }
        }
    }

    if same_file(input.as_path(), output)? {
        return Err(Error::usage(alias_message));
    }

    Ok(())
}

fn same_file(left: &Path, right: &Path) -> Result<bool, Error> {
    #[cfg(unix)]
    {
        use std::os::unix::fs::MetadataExt;
        let (Ok(left), Ok(right)) = (fs::metadata(left), fs::metadata(right)) else {
            return Ok(false);
        };
        Ok(left.dev() == right.dev() && left.ino() == right.ino())
    }
    #[cfg(not(unix))]
    {
        let _ = (left, right);
        Ok(false)
    }
}

fn select_device(runner: &dyn AdbRunner, explicit: Option<&str>) -> Result<String, Error> {
    let output = runner.run(&["devices".to_string()], None, None)?;
    if output.timed_out {
        return Err(Error::infrastructure("adb devices timed out"));
    }
    if output.status != 0 {
        return Err(Error::infrastructure(format!(
            "adb devices failed: {}",
            output.stderr.trim()
        )));
    }
    let devices = device::parse_adb_devices(&output.stdout);
    device::select_device(&devices, explicit)
}

fn resolve_launch_component(
    apk: &Path,
    package_name: &str,
    tools: &DeploymentTools,
) -> Result<String, Error> {
    let aapt2 = tools::find_build_tools_bin(&tools.inspection.env, "aapt2")?;
    let spec = with_cancel(
        ProcessSpec::new(aapt2)
            .args([
                "dump".to_string(),
                "badging".to_string(),
                apk.to_string_lossy().into_owned(),
            ])
            .timeout(tools.inspection.timeout),
        tools,
    );
    let output = process::run(&spec)?;
    if !output.success() {
        return Err(Error::infrastructure(format!(
            "aapt2 dump badging failed: {}",
            diagnostic_text(&spec, &output, DIAGNOSTIC_CHAR_LIMIT)
        )));
    }
    parse_launcher_activity(&output.stdout.text_lossy(), package_name)
}

/// Parses exactly one launchable activity and normalizes a leading dot.
///
/// Delegates to [`crate::device`] and translates its runtime failure to the
/// usage classification this deployment command exposes for malformed badging.
pub fn parse_launcher_activity(badging: &str, package_name: &str) -> Result<String, Error> {
    device::parse_launcher_activity(badging, package_name).map_err(|error| match error {
        Error::Runtime(message) => Error::usage(message),
        other => other,
    })
}

/// Resolves a password value that may be marked as a private file source.
///
/// `file:<path>` is produced by `--ks-pass-file`/`--key-pass-file`; the file is
/// read through the shared descriptor-checked reader and must be a 0600 regular
/// file. Inline values are returned unchanged.
fn resolve_password_source(
    value: Option<&str>,
    file_flag: &str,
    inline_flag: &str,
) -> Result<Option<String>, Error> {
    let Some(value) = value else {
        return Ok(None);
    };
    let Some(path) = value.strip_prefix(PASSWORD_FILE_PREFIX) else {
        return Ok(Some(value.to_string()));
    };
    if path.is_empty() {
        return Err(Error::usage(format!("{file_flag} requires a path")));
    }
    let secret = read_private_file(Path::new(path), &format!("{inline_flag} file"))
        .map_err(|error| Error::usage(error.to_string()))?;
    let secret = secret.trim_end_matches(['\r', '\n']).to_string();
    if secret.is_empty() {
        return Err(Error::usage(format!(
            "{file_flag} file {} is empty",
            Path::new(path).display()
        )));
    }
    Ok(Some(secret))
}

#[allow(clippy::too_many_arguments)]
fn resolve_signing_keystore(
    package_name: Option<&str>,
    device: Option<&str>,
    explicit_keystore: Option<&Path>,
    explicit_alias: Option<&str>,
    explicit_pass: Option<&str>,
    explicit_key_pass: Option<&str>,
    tools: &DeploymentTools,
    adb: &dyn AdbRunner,
) -> Result<SigningCredentials, Error> {
    if let Some(keystore) = explicit_keystore {
        let alias = explicit_alias.unwrap_or(DEFAULT_DEBUG_ALIAS).to_string();
        let password = explicit_pass.unwrap_or(DEFAULT_DEBUG_PASSWORD).to_string();
        let key_password = explicit_key_pass
            .map(str::to_string)
            .unwrap_or_else(|| password.clone());
        return Ok(SigningCredentials::new(
            absolute_path(keystore)?,
            alias,
            password,
            key_password,
        ));
    }

    if let (Some(package_name), Some(device)) = (package_name, device) {
        if device::get_installed_package_signature(adb, package_name, Some(device)).as_deref()
            == Some(MORPHE_KEYSTORE_SHA256)
        {
            if let Some(morphe_keystore) =
                tools.morphe_keystore.as_ref().filter(|path| path.is_file())
            {
                return Ok(SigningCredentials::new(
                    morphe_keystore.clone(),
                    explicit_alias.unwrap_or(MORPHE_ALIAS),
                    explicit_pass.unwrap_or(MORPHE_PASSWORD),
                    explicit_key_pass.unwrap_or(MORPHE_PASSWORD),
                ));
            }
        }
    }

    let debug = ensure_debug_keystore(tools, None)?;
    let alias = explicit_alias.unwrap_or(DEFAULT_DEBUG_ALIAS).to_string();
    let password = explicit_pass.unwrap_or(DEFAULT_DEBUG_PASSWORD).to_string();
    let key_password = explicit_key_pass
        .map(str::to_string)
        .unwrap_or_else(|| password.clone());
    Ok(SigningCredentials::new(
        debug,
        alias,
        password,
        key_password,
    ))
}

fn absolute_path(path: &Path) -> Result<PathBuf, Error> {
    std::path::absolute(path)
        .map_err(|error| Error::io(format!("resolve {}", path.display()), error))
}

/// Ensures the standard debug keystore exists, generating it with `keytool`
/// when absent. A generated keystore is private to the owner.
pub fn ensure_debug_keystore(
    tools: &DeploymentTools,
    keystore_path: Option<&Path>,
) -> Result<PathBuf, Error> {
    let path = match keystore_path {
        Some(path) => absolute_path(path)?,
        None => tools
            .home
            .as_ref()
            .ok_or_else(|| {
                Error::usage(
                    "Cannot locate the debug keystore: HOME is not set and no --keystore was given",
                )
            })?
            .join(".android")
            .join("debug.keystore"),
    };

    if path.is_file() {
        return Ok(path);
    }

    let parent = path
        .parent()
        .ok_or_else(|| Error::usage("Debug keystore path has no parent directory"))?;
    fs::create_dir_all(parent)
        .map_err(|error| Error::io(format!("create {}", parent.display()), error))?;

    let keytool = tools
        .keytool
        .as_ref()
        .ok_or_else(|| Error::usage("keytool not found; install a JDK or supply --keystore"))?;

    let mut store_password = secret_file(parent, DEFAULT_DEBUG_PASSWORD)?;
    let mut key_password = secret_file(parent, DEFAULT_DEBUG_PASSWORD)?;
    let spec = with_cancel(
        ProcessSpec::new(keytool)
            .args([
                "-genkeypair".to_string(),
                "-keystore".to_string(),
                path.to_string_lossy().into_owned(),
                "-storepass:file".to_string(),
                store_password.path().to_string_lossy().into_owned(),
                "-alias".to_string(),
                DEFAULT_DEBUG_ALIAS.to_string(),
                "-keypass:file".to_string(),
                key_password.path().to_string_lossy().into_owned(),
                "-dname".to_string(),
                "CN=Android Debug,O=Android,C=US".to_string(),
                "-keyalg".to_string(),
                "RSA".to_string(),
                "-keysize".to_string(),
                "2048".to_string(),
                "-validity".to_string(),
                "10000".to_string(),
            ])
            .secret(DEFAULT_DEBUG_PASSWORD),
        tools,
    );
    let output = process::run(&spec)?;
    // Keep the files alive until the child has exited.
    let _ = store_password.flush();
    let _ = key_password.flush();
    if output.cancelled {
        return Err(Error::runtime("keytool was cancelled"));
    }
    if !output.success() {
        return Err(Error::infrastructure(format!(
            "Failed to generate debug keystore via keytool: {}",
            diagnostic_text(&spec, &output, DIAGNOSTIC_CHAR_LIMIT)
        )));
    }
    set_private_permissions(&path)?;
    Ok(path)
}

/// Applies the deployment environment policy: keystore password variables are
/// removed from every child, while PATH/HOME/JAVA_HOME/ANDROID_*/TMPDIR survive.
fn scrub_child_environment(mut spec: ProcessSpec) -> ProcessSpec {
    for variable in CHILD_SECRET_ENV {
        spec = spec.remove_env(*variable);
    }
    spec
}

/// Propagates the caller-owned cancellation flag, if any, to a child spec.
/// Process-wide signal termination is applied by the adapter regardless.
fn with_cancel(spec: ProcessSpec, tools: &DeploymentTools) -> ProcessSpec {
    let spec = scrub_child_environment(spec);
    match &tools.cancel {
        Some(flag) => spec.cancel(Arc::clone(flag)),
        None => spec,
    }
}

/// Aligns to 4 bytes (page-aligned when native libraries were rewritten),
/// signs, and verifies the result.
pub fn zipalign_and_sign(
    unsigned_apk: &Path,
    aligned_and_signed_apk: &Path,
    credentials: &SigningCredentials,
    tools: &DeploymentTools,
) -> Result<(), Error> {
    let zipalign = tools::find_build_tools_bin(&tools.inspection.env, "zipalign")?;
    let apksigner = tools::find_build_tools_bin(&tools.inspection.env, "apksigner")?;

    let rewritten = store_native_libraries(unsigned_apk, aligned_and_signed_apk)?;
    let align_input = rewritten.as_deref().unwrap_or(unsigned_apk);

    let mut align_args = vec![
        "-f".to_string(),
        "4".to_string(),
        align_input.to_string_lossy().into_owned(),
        aligned_and_signed_apk.to_string_lossy().into_owned(),
    ];
    if rewritten.is_some() {
        align_args.insert(1, "-p".to_string());
    }
    let align_spec = with_cancel(ProcessSpec::new(zipalign).args(align_args), tools);
    let align_output = process::run(&align_spec)?;
    if let Some(path) = &rewritten {
        let _ = fs::remove_file(path);
    }
    if align_output.cancelled {
        return Err(Error::runtime("zipalign was cancelled"));
    }
    if !align_output.success() {
        return Err(Error::infrastructure(format!(
            "zipalign failed: {}",
            diagnostic_text(&align_spec, &align_output, DIAGNOSTIC_CHAR_LIMIT)
        )));
    }

    let parent = aligned_and_signed_apk
        .parent()
        .ok_or_else(|| Error::usage("Signed APK path has no parent directory"))?;
    let mut store_file = secret_file(parent, credentials.store_password())?;
    let mut key_file = secret_file(parent, credentials.key_password())?;
    let sign_spec = with_cancel(
        ProcessSpec::new(apksigner)
            .args([
                "sign".to_string(),
                "--ks".to_string(),
                credentials.keystore.to_string_lossy().into_owned(),
                "--ks-key-alias".to_string(),
                credentials.alias.clone(),
                "--ks-pass".to_string(),
                format!("file:{}", store_file.path().display()),
                "--key-pass".to_string(),
                format!("file:{}", key_file.path().display()),
                aligned_and_signed_apk.to_string_lossy().into_owned(),
            ])
            .secret(credentials.store_password())
            .secret(credentials.key_password()),
        tools,
    );
    let sign_output = process::run(&sign_spec)?;
    let _ = store_file.flush();
    let _ = key_file.flush();
    if sign_output.cancelled {
        return Err(Error::runtime("apksigner signing was cancelled"));
    }
    if !sign_output.success() {
        return Err(Error::infrastructure(format!(
            "apksigner sign failed: {}",
            diagnostic_text(&sign_spec, &sign_output, DIAGNOSTIC_CHAR_LIMIT)
        )));
    }
    drop(store_file);
    drop(key_file);

    let verify_spec = with_cancel(
        ProcessSpec::new(tools::find_build_tools_bin(
            &tools.inspection.env,
            "apksigner",
        )?)
        .args([
            "verify".to_string(),
            "--verbose".to_string(),
            "--print-certs".to_string(),
            aligned_and_signed_apk.to_string_lossy().into_owned(),
        ]),
        tools,
    );
    let verify_output = process::run(&verify_spec)?;
    if verify_output.cancelled {
        return Err(Error::runtime("apksigner verification was cancelled"));
    }
    if !verify_output.success() {
        return Err(Error::infrastructure(format!(
            "apksigner verify failed: {}",
            diagnostic_text(&verify_spec, &verify_output, DIAGNOSTIC_CHAR_LIMIT)
        )));
    }
    Ok(())
}

/// Rewrites an APK when any `.so` member is compressed. Returns the rewritten
/// path; other members are copied without recompression.
fn store_native_libraries(
    unsigned_apk: &Path,
    aligned_and_signed_apk: &Path,
) -> Result<Option<PathBuf>, Error> {
    let Ok(file) = File::open(unsigned_apk) else {
        return Ok(None);
    };
    let Ok(mut archive) = ZipArchive::new(file) else {
        return Ok(None);
    };

    let mut compressed = false;
    for index in 0..archive.len() {
        let Ok(entry) = archive.by_index(index) else {
            return Ok(None);
        };
        let Ok(name) = entry.name() else {
            return Ok(None);
        };
        if name.ends_with(".so") && entry.compression() != CompressionMethod::Stored {
            compressed = true;
            break;
        }
    }
    if !compressed {
        return Ok(None);
    }

    let parent = aligned_and_signed_apk
        .parent()
        .ok_or_else(|| Error::usage("Signed APK path has no parent directory"))?;
    let rewritten = parent.join("unsigned.uncompressed.apk");
    let file = File::open(unsigned_apk)
        .map_err(|error| Error::io(format!("open {}", unsigned_apk.display()), error))?;
    let mut archive = ZipArchive::new(file)
        .map_err(|error| Error::infrastructure(format!("open unsigned APK zip: {error}")))?;
    let writer_file = File::create(&rewritten)
        .map_err(|error| Error::io(format!("create {}", rewritten.display()), error))?;
    let mut writer = ZipWriter::new(writer_file);
    for index in 0..archive.len() {
        let mut entry = archive
            .by_index(index)
            .map_err(|error| Error::infrastructure(format!("read unsigned APK entry: {error}")))?;
        let name = entry
            .name()
            .map_err(|error| {
                Error::infrastructure(format!("read unsigned APK entry name: {error}"))
            })?
            .into_owned();
        if name.ends_with(".so") {
            let mut data = Vec::new();
            entry
                .read_to_end(&mut data)
                .map_err(|error| Error::io(format!("read native library {name}"), error))?;
            let mut options =
                SimpleFileOptions::default().compression_method(CompressionMethod::Stored);
            if let Some(mode) = entry.unix_mode() {
                options = options.unix_permissions(mode);
            }
            if let Some(modified) = entry.last_modified() {
                options = options.last_modified_time(modified);
            }
            writer.start_file(&name, options).map_err(|error| {
                Error::infrastructure(format!("rewrite native library: {error}"))
            })?;
            writer
                .write_all(&data)
                .map_err(|error| Error::io(format!("write native library {name}"), error))?;
        } else {
            writer
                .raw_copy_file(entry)
                .map_err(|error| Error::infrastructure(format!("copy APK member: {error}")))?;
        }
    }
    writer
        .finish()
        .map_err(|error| Error::infrastructure(format!("finish uncompressed APK: {error}")))?;
    Ok(Some(rewritten))
}

fn secret_file(directory: &Path, secret: &str) -> Result<NamedTempFile, Error> {
    let mut file = tempfile::Builder::new()
        .prefix(".apk-lab-secret-")
        .tempfile_in(directory)
        .map_err(|error| {
            Error::io(
                format!("create secret file in {}", directory.display()),
                error,
            )
        })?;
    file.write_all(secret.as_bytes())
        .map_err(|error| Error::io("write secret file", error))?;
    file.flush()
        .map_err(|error| Error::io("flush secret file", error))?;
    set_private_permissions(file.path())?;
    Ok(file)
}

fn set_private_permissions(path: &Path) -> Result<(), Error> {
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        fs::set_permissions(path, fs::Permissions::from_mode(0o600))
            .map_err(|error| Error::io(format!("chmod {}", path.display()), error))?;
    }
    #[cfg(not(unix))]
    {
        let _ = path;
    }
    Ok(())
}

fn diagnostic_text(spec: &ProcessSpec, output: &ProcessOutput, limit: usize) -> String {
    let raw = if output.stderr.bytes.is_empty() {
        output.stdout.text_lossy()
    } else {
        output.stderr.text_lossy()
    };
    // Redact first: truncating an unredacted string can split a secret.
    let redacted = spec.redact(&raw);
    let mut text: String = redacted.chars().take(limit).collect();
    if redacted.chars().count() > limit {
        text.push_str(" [truncated]");
    }
    text.trim().to_string()
}

/// Argument parser for `deploy`, mirroring the Python grammar.
pub fn parse_deploy_args(args: &[String]) -> Result<DeployOptions, Error> {
    let mut artifact = None;
    let mut mpp = None;
    let mut build = false;
    let mut package_name = None;
    let mut all = false;
    let mut enabled_patches = Vec::new();
    let mut raw_options = Vec::new();
    let mut device = None;
    let mut launch = false;
    let mut clean_install = false;
    let mut reinstall = false;
    let mut out = None;
    let mut keystore = None;
    let mut ks_alias = None;
    let mut ks_pass = None;
    let mut key_pass = None;
    let mut ks_pass_file = None;
    let mut key_pass_file = None;
    let mut inline_password = false;

    let mut index = 0;
    while index < args.len() {
        let argument = args[index].as_str();
        let (flag, inline) = split_inline(argument);
        match flag {
            "--mpp" => mpp = Some(PathBuf::from(value(inline, args, &mut index, flag)?)),
            "--build" => build = true,
            "--package" => package_name = Some(value(inline, args, &mut index, flag)?),
            "--all" => all = true,
            "-e" | "--enable" => enabled_patches.push(value(inline, args, &mut index, flag)?),
            "-O" | "--option" => raw_options.push(value(inline, args, &mut index, flag)?),
            "--device" => device = Some(value(inline, args, &mut index, flag)?),
            "--launch" => launch = true,
            "--clean-install" => clean_install = true,
            "--reinstall" => reinstall = true,
            "--out" => out = Some(PathBuf::from(value(inline, args, &mut index, flag)?)),
            "--keystore" => keystore = Some(PathBuf::from(value(inline, args, &mut index, flag)?)),
            "--ks-alias" => ks_alias = Some(value(inline, args, &mut index, flag)?),
            "--ks-pass" => {
                ks_pass = Some(value(inline, args, &mut index, flag)?);
                inline_password = true;
            }
            "--key-pass" => {
                key_pass = Some(value(inline, args, &mut index, flag)?);
                inline_password = true;
            }
            "--ks-pass-file" => {
                ks_pass_file = Some(PathBuf::from(value(inline, args, &mut index, flag)?));
            }
            "--key-pass-file" => {
                key_pass_file = Some(PathBuf::from(value(inline, args, &mut index, flag)?));
            }
            value if value.starts_with('-') => {
                return Err(Error::usage(format!("unrecognized option '{value}'")))
            }
            value => {
                if artifact.is_some() {
                    return Err(Error::usage(format!("unexpected argument '{value}'")));
                }
                artifact = Some(PathBuf::from(value));
            }
        }
        index += 1;
    }

    if all && !enabled_patches.is_empty() {
        return Err(Error::usage("--all and --enable are mutually exclusive"));
    }
    if clean_install && reinstall {
        return Err(Error::usage(
            "--reinstall and --clean-install are mutually exclusive",
        ));
    }
    if ks_pass.is_some() && ks_pass_file.is_some() {
        return Err(Error::usage(
            "--ks-pass and --ks-pass-file are mutually exclusive",
        ));
    }
    if key_pass.is_some() && key_pass_file.is_some() {
        return Err(Error::usage(
            "--key-pass and --key-pass-file are mutually exclusive",
        ));
    }
    if inline_password {
        eprintln!("{INLINE_PASSWORD_DEPRECATION}");
    }
    let ks_pass = ks_pass
        .or_else(|| ks_pass_file.map(|path| format!("{PASSWORD_FILE_PREFIX}{}", path.display())));
    let key_pass = key_pass
        .or_else(|| key_pass_file.map(|path| format!("{PASSWORD_FILE_PREFIX}{}", path.display())));
    let artifact = artifact.ok_or_else(|| Error::usage("the artifact argument is required"))?;
    Ok(DeployOptions {
        artifact,
        mpp,
        build,
        repo_start: std::env::current_dir()
            .map_err(|error| Error::io("current directory", error))?,
        package_name: package_name.unwrap_or_default(),
        all_defaults: all,
        enabled_patches,
        raw_options,
        device_serial: device,
        launch,
        clean_install,
        out_apk: out,
        keystore,
        ks_alias,
        ks_pass,
        key_pass,
    })
}

/// Argument parser for `dev`, mirroring the Python grammar.
pub struct DevCommand {
    pub app: Option<String>,
    pub artifact: Option<PathBuf>,
    pub no_build: bool,
    pub device: Option<String>,
    pub launch: bool,
    pub all: bool,
    pub clean_install: bool,
}

pub fn parse_dev_args(args: &[String]) -> Result<DevCommand, Error> {
    let mut app = None;
    let mut artifact = None;
    let mut no_build = false;
    let mut device = None;
    let mut launch = true;
    let mut all = true;
    let mut clean_install = false;
    let mut reinstall = false;

    let mut index = 0;
    while index < args.len() {
        let argument = args[index].as_str();
        let (flag, inline) = split_inline(argument);
        match flag {
            "--artifact" => artifact = Some(PathBuf::from(value(inline, args, &mut index, flag)?)),
            "--no-build" => no_build = true,
            "--device" => device = Some(value(inline, args, &mut index, flag)?),
            "--launch" => launch = true,
            "--all" => all = true,
            "--clean-install" => clean_install = true,
            "--reinstall" => reinstall = true,
            value if value.starts_with('-') => {
                return Err(Error::usage(format!("unrecognized option '{value}'")))
            }
            value => {
                if app.is_some() {
                    return Err(Error::usage(format!("unexpected argument '{value}'")));
                }
                app = Some(value.to_string());
            }
        }
        index += 1;
    }

    if clean_install && reinstall {
        return Err(Error::usage(
            "--reinstall and --clean-install are mutually exclusive",
        ));
    }
    Ok(DevCommand {
        app,
        artifact,
        no_build,
        device,
        launch,
        all,
        clean_install,
    })
}

fn split_inline(argument: &str) -> (&str, Option<&str>) {
    if argument.starts_with("--") {
        if let Some((flag, value)) = argument.split_once('=') {
            return (flag, Some(value));
        }
    }
    (argument, None)
}

fn value(
    inline: Option<&str>,
    args: &[String],
    index: &mut usize,
    flag: &str,
) -> Result<String, Error> {
    if let Some(inline) = inline {
        if inline.is_empty() {
            return Err(Error::usage(format!("{flag} requires a value")));
        }
        return Ok(inline.to_string());
    }
    let Some(next) = args.get(*index + 1) else {
        return Err(Error::usage(format!("{flag} requires a value")));
    };
    if next.is_empty() {
        return Err(Error::usage(format!("{flag} requires a value")));
    }
    *index += 1;
    Ok(next.clone())
}

/// Executes the parsed `deploy` command, returning its structured result.
pub fn run_deploy(
    args: &[String],
    tools: &DeploymentTools,
    engine: &dyn PatchEngine,
) -> Result<DeployResult, Error> {
    let mut options = parse_deploy_args(args)?;
    if options.package_name.is_empty() {
        options.package_name = inspect_package(&options.artifact, tools)?;
    }
    if !options.all_defaults && options.enabled_patches.is_empty() {
        options.all_defaults = true;
    }
    deploy_artifact(&options, tools, engine)
}

/// Executes the parsed `dev` command: resolve/build bundle, locate artifact,
/// resolve package, then deploy with launch enabled.
pub fn run_dev(
    args: &[String],
    tools: &DeploymentTools,
    engine: &dyn PatchEngine,
    cwd: &Path,
    home: &Path,
) -> Result<DeployResult, Error> {
    let command = parse_dev_args(args)?;
    let repo_root = find_repo_root(cwd)?;
    let bundle = resolve_dev_bundle(&repo_root, command.no_build)?;
    let artifact = resolve_dev_artifact(
        command.artifact.as_deref(),
        command.app.as_deref(),
        &repo_root,
        home,
    )?;
    let package_name = inspect_package(&artifact, tools)?;
    let options = DeployOptions {
        artifact,
        mpp: Some(bundle),
        build: false,
        repo_start: repo_root,
        package_name,
        all_defaults: command.all,
        enabled_patches: Vec::new(),
        raw_options: Vec::new(),
        device_serial: command.device,
        launch: command.launch,
        clean_install: command.clean_install,
        out_apk: None,
        keystore: None,
        ks_alias: None,
        ks_pass: None,
        key_pass: None,
    };
    deploy_artifact(&options, tools, engine)
}

fn inspect_package(artifact: &Path, tools: &DeploymentTools) -> Result<String, Error> {
    let inspection: ArtifactInspection =
        inspection::inspect_artifact_with_options(artifact, &tools.inspection)?;
    Ok(inspection.package_name)
}
