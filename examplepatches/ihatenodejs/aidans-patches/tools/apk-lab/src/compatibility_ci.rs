//! Compatibility CI orchestration.
//!
//! Native port of the stateful half of the retired Python implementation: matrix
//! selection, target-version ordering, fixture reconciliation, Morphe
//! invocation and the Worker callback contract.
//!
//! The callback protocol is intentionally unchanged:
//!
//! * the submission is written atomically **before** the HTTP POST,
//! * the `ok` marker is written **only** after a 2xx response,
//! * a request ID is posted at most once by one invocation,
//! * transport and non-2xx failures leave the saved submission in place so the
//!   workflow shell fallback can retry it without double completion.
//!
//! External acquisition and Morphe execution are injected through traits. The
//! production CLI supplies native implementations; contract tests supply
//! deterministic fakes and never contact Play, R2 or the Worker.

use crate::error::Error;
use crate::fixtures::{R2FixtureManager, SeedExpectations, SlotMetadata};
use crate::models::ExitCode;
use crate::morphe::{ArtifactInspector, PatchCompatibilityReport};
use crate::process::{self, ProcessSpec};
use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::collections::BTreeSet;
use std::fs::{self, OpenOptions};
use std::io::Write;
use std::path::{Path, PathBuf};
use std::sync::LazyLock;
use std::time::Duration;

/// Default Worker origin used when `WORKER_STATUS_URL` is unset.
pub const DEFAULT_WORKER_STATUS_URL: &str =
    "https://aidans-patches-worker.aidan-is-confused.workers.dev";

/// User agent sent with both Worker requests.
pub const WORKER_USER_AGENT: &str = "aidans-patches-ci/1.0";

/// Prefix of every package-mapped patch source directory.
pub const PATCH_APP_PREFIX: &str = "patches/src/main/kotlin/app/aidan/patches/";

const MATRIX_GIT_TIMEOUT: Duration = Duration::from_secs(30);

fn package_regex() -> &'static regex::Regex {
    static REGEX: LazyLock<regex::Regex> = LazyLock::new(|| {
        regex::Regex::new(r#"const\s+val\s+\w+_PACKAGE_NAME\s*=\s*"([^"]+)""#)
            .expect("package constant regex is valid")
    });
    &REGEX
}

fn digits_regex() -> &'static regex::Regex {
    static REGEX: LazyLock<regex::Regex> =
        LazyLock::new(|| regex::Regex::new(r"\d+").expect("digit regex is valid"));
    &REGEX
}

/// One package's patch-list metadata used by run-start and target resolution.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PackageRunMetadata {
    pub package_name: String,
    pub app_name: String,
    pub target_version: String,
    pub supported_versions: Vec<String>,
}

/// Worker run-start payload, field order matching the Python dict literal.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct RunStartPayload {
    #[serde(rename = "requestId")]
    pub request_id: String,
    #[serde(rename = "packageName")]
    pub package_name: String,
    #[serde(rename = "appName")]
    pub app_name: String,
    #[serde(rename = "targetVersion")]
    pub target_version: String,
    #[serde(rename = "supportedVersions")]
    pub supported_versions: Vec<String>,
    #[serde(rename = "gitRevision")]
    pub git_revision: String,
}

/// One terminal role result accepted by the Worker.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct CompatibilityResultInput {
    #[serde(rename = "role")]
    pub role: String,
    #[serde(rename = "versionName")]
    pub version_name: String,
    #[serde(rename = "versionCode")]
    pub version_code: u64,
    #[serde(rename = "patchBundleVersion")]
    pub patch_bundle_version: String,
    #[serde(rename = "gitRevision")]
    pub git_revision: String,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "passedCount")]
    pub passed_count: u64,
    #[serde(rename = "failedCount")]
    pub failed_count: u64,
    #[serde(rename = "failureReason")]
    pub failure_reason: Option<String>,
    #[serde(rename = "workflowRunUrl")]
    pub workflow_run_url: Option<String>,
    #[serde(rename = "failureStage", skip_serializing_if = "Option::is_none")]
    pub failure_stage: Option<String>,
}

/// Batched submission accepted by `POST /api/compatibility-results`.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct CompatibilitySubmission {
    #[serde(rename = "requestId")]
    pub request_id: String,
    #[serde(rename = "packageName")]
    pub package_name: String,
    #[serde(rename = "results")]
    pub results: Vec<CompatibilityResultInput>,
}

/// Accepted CI environment inputs. Empty strings are treated as absent where
/// the Python implementation relied on truthiness.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CiEnvironment {
    pub event_name: String,
    pub dispatch_request_id: String,
    pub status_secret: Option<String>,
    pub worker_url: String,
    pub submission_path: Option<PathBuf>,
    pub callback_marker: Option<PathBuf>,
    pub git_revision: String,
    pub github_server_url: String,
    pub github_repository: String,
    pub github_run_id: Option<String>,
    pub dispatch_expected_roles: Option<String>,
    pub dispatch_play_version: Option<String>,
    pub apkeep_accounts: Option<String>,
    pub r2_access_key_id: Option<String>,
}

impl Default for CiEnvironment {
    fn default() -> Self {
        Self {
            event_name: "workflow_dispatch".to_string(),
            dispatch_request_id: String::new(),
            status_secret: None,
            worker_url: DEFAULT_WORKER_STATUS_URL.to_string(),
            submission_path: None,
            callback_marker: None,
            git_revision: "unknown".to_string(),
            github_server_url: "https://github.com".to_string(),
            github_repository: String::new(),
            github_run_id: None,
            dispatch_expected_roles: None,
            dispatch_play_version: None,
            apkeep_accounts: None,
            r2_access_key_id: None,
        }
    }
}

impl CiEnvironment {
    /// Reads the accepted environment inputs. No other variables are consulted.
    #[must_use]
    pub fn from_env() -> Self {
        let mut environment = Self::default();
        if let Some(value) = nonempty_var("GITHUB_EVENT_NAME") {
            environment.event_name = value;
        }
        environment.dispatch_request_id = std::env::var("DISPATCH_REQUEST_ID").unwrap_or_default();
        environment.status_secret = nonempty_var("COMPATIBILITY_STATUS_SECRET");
        if let Some(value) = nonempty_var("WORKER_STATUS_URL") {
            environment.worker_url = value;
        }
        environment.submission_path =
            nonempty_var("COMPATIBILITY_SUBMISSION_PATH").map(PathBuf::from);
        environment.callback_marker =
            nonempty_var("COMPATIBILITY_CALLBACK_MARKER").map(PathBuf::from);
        if let Some(value) = nonempty_var("GITHUB_SHA") {
            environment.git_revision = value;
        }
        if let Some(value) = nonempty_var("GITHUB_SERVER_URL") {
            environment.github_server_url = value;
        }
        environment.github_repository = std::env::var("GITHUB_REPOSITORY").unwrap_or_default();
        environment.github_run_id = nonempty_var("GITHUB_RUN_ID");
        environment.dispatch_expected_roles = nonempty_var("DISPATCH_EXPECTED_ROLES");
        environment.dispatch_play_version = nonempty_var("DISPATCH_PLAY_VERSION");
        environment.apkeep_accounts = nonempty_var("APKEEP_ACCOUNTS");
        environment.r2_access_key_id = nonempty_var("R2_ACCESS_KEY_ID");
        environment
    }

    /// Python builds this URL only when `GITHUB_RUN_ID` is present.
    #[must_use]
    pub fn workflow_run_url(&self) -> Option<String> {
        self.github_run_id.as_ref().map(|run_id| {
            format!(
                "{}/{}/actions/runs/{run_id}",
                self.github_server_url, self.github_repository
            )
        })
    }
}

fn nonempty_var(name: &str) -> Option<String> {
    std::env::var(name)
        .ok()
        .filter(|value| !value.trim().is_empty())
}

/// Worker request failure (transport or malformed response).
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PostError {
    pub message: String,
}

impl std::fmt::Display for PostError {
    fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        formatter.write_str(&self.message)
    }
}

impl std::error::Error for PostError {}

/// Worker HTTP boundary, injectable in tests.
pub trait WorkerPoster: Send + Sync {
    fn post_run_start(
        &self,
        worker_url: &str,
        status_secret: &str,
        payload: &RunStartPayload,
    ) -> Result<u16, PostError>;

    fn post_submission(
        &self,
        worker_url: &str,
        status_secret: &str,
        submission: &CompatibilitySubmission,
    ) -> Result<u16, PostError>;
}

/// Production `ureq` poster with the Python timeout, headers and user agent.
#[derive(Debug, Clone, Copy, Default)]
pub struct UreqWorkerPoster;

impl UreqWorkerPoster {
    fn post_json(url: &str, status_secret: &str, body: &[u8]) -> Result<u16, PostError> {
        let request = ureq::post(url)
            .config()
            .timeout_global(Some(Duration::from_secs(30)))
            .build()
            .header("content-type", "application/json")
            .header("authorization", format!("Bearer {status_secret}"))
            .header("user-agent", WORKER_USER_AGENT);
        match request.send(body) {
            Ok(response) => Ok(response.status().as_u16()),
            Err(ureq::Error::StatusCode(status)) => Ok(status),
            Err(error) => Err(PostError {
                message: error.to_string(),
            }),
        }
    }
}

impl WorkerPoster for UreqWorkerPoster {
    fn post_run_start(
        &self,
        worker_url: &str,
        status_secret: &str,
        payload: &RunStartPayload,
    ) -> Result<u16, PostError> {
        let url = format!(
            "{}/api/compatibility-runs",
            worker_url.trim_end_matches('/')
        );
        let body = serde_json::to_vec(payload).map_err(|error| PostError {
            message: error.to_string(),
        })?;
        Self::post_json(&url, status_secret, &body)
    }

    fn post_submission(
        &self,
        worker_url: &str,
        status_secret: &str,
        submission: &CompatibilitySubmission,
    ) -> Result<u16, PostError> {
        let url = format!(
            "{}/api/compatibility-results",
            worker_url.trim_end_matches('/')
        );
        let body = serde_json::to_vec(submission).map_err(|error| PostError {
            message: error.to_string(),
        })?;
        Self::post_json(&url, status_secret, &body)
    }
}

/// Native acquisition boundary. Implementations must validate the expected
/// version themselves or let CI validate the inspected artifact.
pub trait ArtifactAcquirer: Send + Sync {
    fn acquire(
        &self,
        package: &str,
        output_dir: &Path,
        expected_version: &str,
    ) -> Result<(PathBuf, String), Error>;
}

/// Morphe check boundary returning the report and its process exit class.
pub trait CompatibilityChecker: Send + Sync {
    fn check(
        &self,
        artifact: &Path,
        mpp: &Path,
        expected_package: &str,
    ) -> Result<(PatchCompatibilityReport, ExitCode), Error>;
}

/// Dependencies for one reconciliation run.
pub struct CiDependencies<'a> {
    pub r2: &'a R2FixtureManager,
    /// `None` means the runner's acquisition backend is unavailable; the
    /// credential precondition is still checked before reporting that state.
    pub acquirer: Option<&'a dyn ArtifactAcquirer>,
    pub checker: &'a dyn CompatibilityChecker,
    pub poster: &'a dyn WorkerPoster,
    pub inspector: &'a dyn ArtifactInspector,
}

/// Immutable inputs for one reconciliation run.
pub struct CiRunRequest<'a> {
    pub package: &'a str,
    pub mpp_path: &'a Path,
    pub runner_temp: &'a Path,
    pub patches_data: &'a Value,
    pub environment: CiEnvironment,
    /// Explicit roles override `DISPATCH_EXPECTED_ROLES`.
    pub requested_roles: Option<Vec<String>>,
}

/// Extracts the single `<NAME>_PACKAGE_NAME` constant from an app's
/// `shared/Constants.kt`.
#[must_use]
pub fn extract_package_from_constants(app_dir: &Path) -> Option<String> {
    let constants = app_dir.join("shared").join("Constants.kt");
    let content = fs::read_to_string(constants).ok()?;
    let matches: Vec<&str> = package_regex()
        .captures_iter(&content)
        .filter_map(|capture| capture.get(1).map(|value| value.as_str()))
        .collect();
    if matches.len() == 1 {
        Some(matches[0].trim().to_string())
    } else {
        None
    }
}

/// Runs `git diff --name-only` for patch files. A missing/zero SHA, git error
/// or spawn failure yields `None`, which the matrix treats as "fan out".
#[must_use]
pub fn get_changed_patch_files(
    before_sha: Option<&str>,
    commit_sha: Option<&str>,
    repo_root: &Path,
) -> Option<Vec<String>> {
    let before = before_sha?.trim();
    let commit = commit_sha?.trim();
    if before.is_empty() || commit.is_empty() || before.replace('0', "").is_empty() {
        return None;
    }
    let spec = ProcessSpec::new("git")
        .args(["diff", "--name-only", before, commit, "--", "patches/"])
        .cwd(repo_root)
        .timeout(MATRIX_GIT_TIMEOUT);
    let output = process::run(&spec).ok()?;
    if !output.success() {
        return None;
    }
    Some(
        output
            .stdout
            .text_lossy()
            .lines()
            .map(str::trim)
            .filter(|line| !line.is_empty())
            .map(str::to_string)
            .collect(),
    )
}

/// Resolves the CI package matrix.
///
/// Any change outside a known app directory, or an app whose constant is
/// missing/ambiguous/unknown, fans out to every known package. Unknown
/// explicit selections are errors, never silent fallbacks.
pub fn resolve_matrix_packages(
    patches_data: &Value,
    event_name: &str,
    dispatch_package: Option<&str>,
    input_package: Option<&str>,
    changed_paths: Option<&[String]>,
    patches_root: &Path,
) -> Result<Vec<String>, Error> {
    let known = known_packages(patches_data);

    if event_name == "workflow_dispatch" {
        let requested = input_package.unwrap_or("all").trim();
        if !requested.is_empty() && requested != "all" {
            if !known.iter().any(|package| package == requested) {
                return Err(Error::usage(format!(
                    "Unknown package in workflow dispatch: {requested}"
                )));
            }
            return Ok(vec![requested.to_string()]);
        }
        return Ok(known);
    }

    if event_name == "push" {
        let Some(changed_paths) = changed_paths.filter(|paths| !paths.is_empty()) else {
            return Ok(known);
        };
        let app_base = patches_root
            .join("src")
            .join("main")
            .join("kotlin")
            .join("app")
            .join("aidan")
            .join("patches");
        let mut selected = BTreeSet::new();
        for raw_path in changed_paths {
            let normalized = raw_path.replace('\\', "/");
            let normalized = normalized.trim().trim_start_matches('/');
            let Some(relative) = normalized.strip_prefix(PATCH_APP_PREFIX) else {
                return Ok(known);
            };
            let Some(app_slug) = relative.split('/').next().filter(|slug| !slug.is_empty()) else {
                return Ok(known);
            };
            let app_dir = app_base.join(app_slug);
            if !app_dir.is_dir() {
                return Ok(known);
            }
            let Some(package) = extract_package_from_constants(&app_dir) else {
                return Ok(known);
            };
            if !known.iter().any(|known_package| known_package == &package) {
                return Ok(known);
            }
            selected.insert(package);
        }
        if selected.is_empty() {
            return Ok(known);
        }
        return Ok(selected.into_iter().collect());
    }

    let package = dispatch_package.unwrap_or_default().trim();
    if !package.is_empty() {
        if !known.iter().any(|value| value == package) {
            return Err(Error::usage(format!("Unknown package: {package}")));
        }
        return Ok(vec![package.to_string()]);
    }
    Ok(known)
}

fn known_packages(patches_data: &Value) -> Vec<String> {
    let mut known = BTreeSet::new();
    if let Some(patches) = patches_data.get("patches").and_then(Value::as_array) {
        for patch in patches {
            let Some(compatible) = patch.get("compatiblePackages").and_then(Value::as_array) else {
                continue;
            };
            for mapping in compatible {
                if let Some(package) = mapping
                    .get("packageName")
                    .and_then(Value::as_str)
                    .filter(|value| !value.is_empty())
                {
                    known.insert(package.to_string());
                }
            }
        }
    }
    known.into_iter().collect()
}

/// Extracts app name, highest target version and all supported versions for a
/// package.
#[must_use]
pub fn get_package_run_metadata(patches_data: &Value, package_name: &str) -> PackageRunMetadata {
    let mut app_name = String::new();
    let mut target_versions = BTreeSet::new();
    if let Some(patches) = patches_data.get("patches").and_then(Value::as_array) {
        for patch in patches {
            let Some(compatible) = patch.get("compatiblePackages").and_then(Value::as_array) else {
                continue;
            };
            for mapping in compatible {
                if mapping.get("packageName").and_then(Value::as_str) != Some(package_name) {
                    continue;
                }
                if app_name.is_empty() {
                    if let Some(name) = mapping.get("name").and_then(Value::as_str) {
                        app_name = name.to_string();
                    }
                }
                let Some(targets) = mapping.get("targets").and_then(Value::as_array) else {
                    continue;
                };
                for target in targets {
                    if let Some(version) = target
                        .get("version")
                        .and_then(Value::as_str)
                        .filter(|value| !value.is_empty())
                    {
                        target_versions.insert(version.to_string());
                    }
                }
            }
        }
    }

    let mut supported_versions: Vec<String> = target_versions.into_iter().collect();
    supported_versions.sort_by(|left, right| {
        (version_key(left), left.as_str()).cmp(&(version_key(right), right.as_str()))
    });
    let target_version = supported_versions.last().cloned().unwrap_or_default();
    PackageRunMetadata {
        package_name: package_name.to_string(),
        app_name: if app_name.is_empty() {
            package_name.to_string()
        } else {
            app_name
        },
        target_version,
        supported_versions,
    }
}

/// Highest target version for a package, or empty when none is declared.
#[must_use]
pub fn get_target_version_for_package(patches_data: &Value, package_name: &str) -> String {
    get_package_run_metadata(patches_data, package_name).target_version
}

/// Python tuple key: numeric groups after stripping `v`, then everything up to
/// `-`/`+`. Ties are broken by the raw version string.
fn version_key(version: &str) -> Vec<u64> {
    let without_prefix = version
        .strip_prefix('v')
        .or_else(|| version.strip_prefix('V'))
        .unwrap_or(version);
    let numeric = without_prefix.split(['-', '+']).next().unwrap_or_default();
    digits_regex()
        .find_iter(numeric)
        .filter_map(|digits| digits.as_str().parse().ok())
        .collect()
}

/// Parses requested roles strictly. `repository_dispatch` must name at least
/// one role; duplicates and unknown roles are errors.
pub fn parse_requested_roles(
    raw_roles: Option<&str>,
    event_name: Option<&str>,
) -> Result<Option<Vec<String>>, Error> {
    let missing = || {
        if event_name == Some("repository_dispatch") {
            Err(Error::usage(
                "Repository dispatch must specify at least one expected role in DISPATCH_EXPECTED_ROLES",
            ))
        } else {
            Ok(None)
        }
    };
    let Some(raw_roles) = raw_roles else {
        return missing();
    };
    if raw_roles.trim().is_empty() {
        return missing();
    }
    let tokens: Vec<&str> = raw_roles
        .split(',')
        .map(str::trim)
        .filter(|token| !token.is_empty())
        .collect();
    if tokens.is_empty() {
        return missing();
    }

    let mut seen = BTreeSet::new();
    let mut parsed = Vec::with_capacity(tokens.len());
    for token in tokens {
        if token != "target" {
            return Err(Error::usage(format!(
                "Invalid requested role '{token}'; must be one of ['target']"
            )));
        }
        if !seen.insert(token) {
            return Err(Error::usage(format!("Duplicate requested role '{token}'")));
        }
        parsed.push(token.to_string());
    }
    Ok(Some(parsed))
}

/// Terminal error result matching `build_error_result`.
///
/// The positional shape mirrors the Python keyword-only helper; callers in CI
/// always supply every field.
#[must_use]
#[allow(clippy::too_many_arguments)]
pub fn build_error_result(
    role: &str,
    expected_version: &str,
    reason: &str,
    failure_stage: &str,
    patch_bundle_version: &str,
    git_revision: &str,
    failed_count: u64,
    workflow_run_url: Option<String>,
) -> CompatibilityResultInput {
    CompatibilityResultInput {
        role: role.to_string(),
        version_name: expected_version.to_string(),
        version_code: 0,
        patch_bundle_version: patch_bundle_version.to_string(),
        git_revision: git_revision.to_string(),
        status: "error".to_string(),
        passed_count: 0,
        failed_count,
        failure_reason: Some(reason.to_string()),
        workflow_run_url,
        failure_stage: Some(failure_stage.to_string()),
    }
}

/// Terminal success/failure item matching `build_result_item`.
#[must_use]
pub fn build_result_item(
    role: &str,
    report: &PatchCompatibilityReport,
    workflow_run_url: Option<String>,
) -> CompatibilityResultInput {
    let mut status = report.overall_status.clone();
    if !matches!(status.as_str(), "compatible" | "incompatible" | "error") {
        status = if report.failed_cases > 0 {
            "error".to_string()
        } else {
            "compatible".to_string()
        };
    }
    CompatibilityResultInput {
        role: role.to_string(),
        version_name: report.version_name.clone(),
        version_code: report.version_code,
        patch_bundle_version: report.patch_bundle_version.clone(),
        git_revision: report.git_revision.clone(),
        status: status.clone(),
        passed_count: report.passed_cases,
        failed_count: report.failed_cases,
        failure_reason: report.failure_reason.clone(),
        workflow_run_url,
        failure_stage: (status == "error").then(|| "compatibility-check".to_string()),
    }
}

/// Output line and GITHUB_OUTPUT fragment for a resolved matrix.
#[must_use]
pub fn packages_output(packages: &[String]) -> String {
    format!(
        "packages={}",
        serde_json::to_string(packages).expect("string array serializes")
    )
}

/// Prints and optionally appends `packages=[...]` to `GITHUB_OUTPUT`.
pub fn write_matrix_output(packages: &[String], output_file: Option<&Path>) -> Result<(), Error> {
    let line = packages_output(packages);
    println!("{line}");
    if let Some(output_file) = output_file {
        let mut file = OpenOptions::new()
            .create(true)
            .append(true)
            .open(output_file)
            .map_err(|error| {
                Error::io(
                    format!("open GITHUB_OUTPUT {}", output_file.display()),
                    error,
                )
            })?;
        writeln!(file, "{line}").map_err(|error| {
            Error::io(
                format!("append GITHUB_OUTPUT {}", output_file.display()),
                error,
            )
        })?;
    }
    Ok(())
}

/// Executes acquisition, fixture reconciliation, check and callback for one
/// package.
pub async fn run_ci_reconcile_and_test(
    request: &CiRunRequest<'_>,
    dependencies: &CiDependencies<'_>,
) -> Result<ExitCode, Error> {
    let package = request.package;
    let environment = &request.environment;
    let metadata = get_package_run_metadata(request.patches_data, package);
    let target_version = metadata.target_version.clone();
    let patch_bundle_version = request
        .patches_data
        .get("version")
        .and_then(Value::as_str)
        .unwrap_or("unknown")
        .to_string();
    let git_revision = environment.git_revision.clone();

    if target_version.is_empty() {
        eprintln!("Error: No target version declared for package {package}");
        return Ok(ExitCode::UsageOrToolError);
    }

    let requested_roles = match &request.requested_roles {
        Some(roles) => Some(roles.clone()),
        None => parse_requested_roles(
            environment.dispatch_expected_roles.as_deref(),
            Some(&environment.event_name),
        )?,
    };
    println!(
        "Checking {package} with target version {target_version}, requested_roles={requested_roles:?}"
    );

    let mut results: Vec<CompatibilityResultInput> = Vec::new();
    let mut overall_exit = ExitCode::Success;
    let workflow_url = environment.workflow_run_url();

    let push_error = |results: &mut Vec<CompatibilityResultInput>,
                      overall: &mut ExitCode,
                      stage: &str,
                      reason: String,
                      exit: ExitCode| {
        results.push(build_error_result(
            "target",
            &target_version,
            &reason,
            stage,
            &patch_bundle_version,
            &git_revision,
            0,
            workflow_url.clone(),
        ));
        *overall = exit;
    };

    // 1. Slot metadata lookup.
    let mut latest_slot: Option<SlotMetadata> = None;
    let mut target_slot: Option<SlotMetadata> = None;
    match dependencies.r2.get_slot_metadata(package, "latest").await {
        Ok(slot) => latest_slot = slot,
        Err(error) => {
            eprintln!("R2 lookup error for {package}: {error}");
            push_error(
                &mut results,
                &mut overall_exit,
                "r2-lookup",
                format!("R2 fixture lookup failed: {error}"),
                ExitCode::InfrastructureFailure,
            );
        }
    }
    if overall_exit == ExitCode::Success {
        match dependencies.r2.get_slot_metadata(package, "target").await {
            Ok(slot) => target_slot = slot,
            Err(error) => {
                eprintln!("R2 lookup error for {package}: {error}");
                push_error(
                    &mut results,
                    &mut overall_exit,
                    "r2-lookup",
                    format!("R2 fixture lookup failed: {error}"),
                    ExitCode::InfrastructureFailure,
                );
            }
        }
    }

    // 2. Match a slot, or acquire and seed the exact target.
    let mut matched_slot_role: Option<String> = None;
    let mut matched_slot_meta: Option<SlotMetadata> = None;
    let mut local_target_artifact: Option<PathBuf> = None;
    if overall_exit == ExitCode::Success {
        if let Some(slot) = target_slot
            .as_ref()
            .filter(|slot| slot.version_name == target_version)
        {
            matched_slot_role = Some("target".to_string());
            matched_slot_meta = Some(slot.clone());
        } else if let Some(slot) = latest_slot
            .as_ref()
            .filter(|slot| slot.version_name == target_version)
        {
            matched_slot_role = Some("latest".to_string());
            matched_slot_meta = Some(slot.clone());
        }

        if matched_slot_role.is_none() {
            let target_label = target_slot
                .as_ref()
                .map_or_else(|| "absent".to_string(), |slot| slot.version_name.clone());
            let latest_label = latest_slot
                .as_ref()
                .map_or_else(|| "absent".to_string(), |slot| slot.version_name.clone());
            println!(
                "No R2 fixture matches {package} v{target_version} \
                 (target={target_label}, latest={latest_label}); attempting acquisition..."
            );

            match dependencies.acquirer {
                None => {
                    let has_creds = environment.apkeep_accounts.is_some()
                        || environment.r2_access_key_id.is_some();
                    let reason = if has_creds {
                        format!(
                            "No native acquisition backend is configured for target version '{target_version}'"
                        )
                    } else {
                        format!(
                            "No fixture slot matches target version '{target_version}' and no acquisition credentials configured"
                        )
                    };
                    eprintln!("Error: {reason}");
                    push_error(
                        &mut results,
                        &mut overall_exit,
                        "acquisition",
                        reason,
                        ExitCode::InvalidArtifact,
                    );
                }
                Some(acquirer) => {
                    let output_dir = request.runner_temp.join(format!("{package}-acquire"));
                    match acquirer.acquire(package, &output_dir, &target_version) {
                        Ok((path, source)) => match dependencies.inspector.inspect(&path) {
                            Ok(inspection) if inspection.version_name == target_version => {
                                println!(
                                    "Acquired {package} v{target_version} via {source}: {}",
                                    path.display()
                                );
                                match dependencies
                                    .r2
                                    .seed_fixture(
                                        package,
                                        "target",
                                        &path,
                                        &source,
                                        SeedExpectations::default(),
                                    )
                                    .await
                                {
                                    Ok(metadata) => {
                                        matched_slot_role = Some("target".to_string());
                                        matched_slot_meta = Some(metadata);
                                        local_target_artifact = Some(path);
                                    }
                                    Err(error) => {
                                        eprintln!(
                                            "R2 upload error for {package} target slot: {error}"
                                        );
                                        push_error(
                                            &mut results,
                                            &mut overall_exit,
                                            "r2-upload",
                                            format!("R2 fixture upload failed: {error}"),
                                            ExitCode::InfrastructureFailure,
                                        );
                                    }
                                }
                            }
                            Ok(inspection) => {
                                let reason = format!(
                                    "Acquired version '{}' != expected '{target_version}'",
                                    inspection.version_name
                                );
                                eprintln!(
                                    "Acquisition error for {package} v{target_version}: {reason}"
                                );
                                push_error(
                                    &mut results,
                                    &mut overall_exit,
                                    "acquisition",
                                    format!("Target acquisition failed: {reason}"),
                                    ExitCode::InvalidArtifact,
                                );
                            }
                            Err(error) => {
                                let reason = format!(
                                    "Artifact inspection failed for {}: {}",
                                    path.display(),
                                    error.message()
                                );
                                eprintln!(
                                    "Acquisition error for {package} v{target_version}: {reason}"
                                );
                                push_error(
                                    &mut results,
                                    &mut overall_exit,
                                    "acquisition",
                                    format!("Target acquisition failed: {reason}"),
                                    ExitCode::InvalidArtifact,
                                );
                            }
                        },
                        Err(error) => {
                            eprintln!(
                                "Acquisition error for {package} v{target_version}: {}",
                                error.message()
                            );
                            push_error(
                                &mut results,
                                &mut overall_exit,
                                "acquisition",
                                format!("Target acquisition failed: {}", error.message()),
                                ExitCode::InvalidArtifact,
                            );
                        }
                    }
                }
            }
        }
    }

    // 3. Download the matched fixture unless acquisition already staged it.
    if overall_exit == ExitCode::Success {
        match (&matched_slot_role, &matched_slot_meta) {
            (Some(role), Some(slot)) => {
                let needs_download = local_target_artifact
                    .as_ref()
                    .is_none_or(|path| !path.is_file());
                if needs_download {
                    let extension = target_extension(slot, request.patches_data, package);
                    let destination = request
                        .runner_temp
                        .join(format!("{package}-target{extension}"));
                    match dependencies
                        .r2
                        .download_slot(package, role, &destination)
                        .await
                    {
                        Ok(path) => local_target_artifact = Some(path),
                        Err(error) => {
                            eprintln!("R2 download error for {package} slot '{role}': {error}");
                            push_error(
                                &mut results,
                                &mut overall_exit,
                                "r2-download",
                                format!("R2 fixture download failed: {error}"),
                                ExitCode::InfrastructureFailure,
                            );
                        }
                    }
                }
            }
            _ => {
                push_error(
                    &mut results,
                    &mut overall_exit,
                    "r2-lookup",
                    format!("No fixture slot matches target version '{target_version}'"),
                    ExitCode::InvalidArtifact,
                );
            }
        }
    }

    // 4. Morphe check.
    if overall_exit == ExitCode::Success {
        let artifact = local_target_artifact
            .as_ref()
            .expect("successful reconciliation has a local artifact");
        match dependencies
            .checker
            .check(artifact, request.mpp_path, package)
        {
            Ok((report, code)) => {
                println!(
                    "Target compatibility: {} ({}/{})",
                    report.overall_status, report.passed_cases, report.total_cases
                );
                if let Some(reason) = &report.failure_reason {
                    eprintln!("Target failure details: {reason}");
                }
                results.push(build_result_item("target", &report, workflow_url.clone()));
                if code != ExitCode::Success || report.overall_status != "compatible" {
                    overall_exit = if code == ExitCode::Success {
                        ExitCode::UsageOrToolError
                    } else {
                        code
                    };
                }
            }
            Err(error) => {
                eprintln!(
                    "Compatibility check error for {package}: {}",
                    error.message()
                );
                push_error(
                    &mut results,
                    &mut overall_exit,
                    "compatibility-check",
                    format!("Compatibility check execution failed: {}", error.message()),
                    ExitCode::UsageOrToolError,
                );
            }
        }
    }

    // 5. Save submission atomically, before any POST.
    let mut submission: Option<CompatibilitySubmission> = None;
    if !environment.dispatch_request_id.trim().is_empty() {
        let payload = CompatibilitySubmission {
            request_id: environment.dispatch_request_id.trim().to_string(),
            package_name: package.to_string(),
            results,
        };
        if let Some(path) = &environment.submission_path {
            if let Err(error) = save_submission_atomically(path, &payload) {
                eprintln!("Failed to save compatibility submission: {error}");
                return Ok(ExitCode::InfrastructureFailure);
            }
        }
        submission = Some(payload);
    }

    // 6. Post and mark completion only for a 2xx response.
    let secret = environment
        .status_secret
        .as_deref()
        .filter(|value| !value.is_empty());
    let worker_url = if environment.worker_url.trim().is_empty() {
        None
    } else {
        Some(environment.worker_url.as_str())
    };
    if let (Some(submission), Some(secret), Some(worker_url)) =
        (submission.as_ref(), secret, worker_url)
    {
        match dependencies
            .poster
            .post_submission(worker_url, secret, submission)
        {
            Ok(status) if (200..300).contains(&status) => {
                println!(
                    "Posted {} results to worker: HTTP {status}",
                    submission.results.len()
                );
                if let Some(marker) = &environment.callback_marker {
                    if let Err(error) = write_marker(marker) {
                        eprintln!("Failed to write callback marker: {error}");
                        if overall_exit == ExitCode::Success {
                            overall_exit = ExitCode::InfrastructureFailure;
                        }
                    }
                }
            }
            Ok(status) => {
                eprintln!("Worker rejected results with status code HTTP {status}");
                if overall_exit == ExitCode::Success {
                    overall_exit = ExitCode::InfrastructureFailure;
                }
            }
            Err(error) => {
                eprintln!("Failed to post results to worker: {error}");
                if overall_exit == ExitCode::Success {
                    overall_exit = ExitCode::InfrastructureFailure;
                }
            }
        }
    } else if environment.dispatch_request_id.trim().is_empty() {
        println!("No DISPATCH_REQUEST_ID provided; skipping worker callback.");
    }

    Ok(overall_exit)
}

fn target_extension(slot: &SlotMetadata, patches_data: &Value, package: &str) -> String {
    const ALLOWED: [&str; 4] = ["apk", "apkm", "xapk", "apks"];
    let mut extension = "apk".to_string();
    if !slot.container_type.is_empty() {
        let raw = slot.container_type.to_lowercase();
        let raw = raw.trim_start_matches('.');
        if ALLOWED.contains(&raw) {
            extension = raw.to_string();
        }
    } else if let Some(found) = find_apk_file_type(patches_data, package) {
        extension = found;
    }
    format!(".{extension}")
}

fn find_apk_file_type(patches_data: &Value, package: &str) -> Option<String> {
    const ALLOWED: [&str; 4] = ["apk", "apkm", "xapk", "apks"];
    let patches = patches_data.get("patches")?.as_array()?;
    for patch in patches {
        let compatible = patch.get("compatiblePackages")?.as_array()?;
        for mapping in compatible {
            if mapping.get("packageName").and_then(Value::as_str) != Some(package) {
                continue;
            }
            if let Some(file_type) = mapping.get("apkFileType").and_then(Value::as_str) {
                let raw = file_type.to_lowercase();
                let raw = raw.trim_start_matches('.');
                if ALLOWED.contains(&raw) {
                    return Some(raw.to_string());
                }
            }
        }
    }
    None
}

fn save_submission_atomically(
    path: &Path,
    submission: &CompatibilitySubmission,
) -> Result<(), std::io::Error> {
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent)?;
    }
    let temp_name = format!(
        "{}.tmp.{}",
        path.file_name()
            .map_or_else(String::new, |name| name.to_string_lossy().into_owned()),
        std::process::id()
    );
    let temp_path = path.with_file_name(temp_name);
    let body = serde_json::to_vec_pretty(submission)
        .map_err(|error| std::io::Error::new(std::io::ErrorKind::InvalidData, error))?;
    fs::write(&temp_path, body)?;
    fs::rename(&temp_path, path)
}

fn write_marker(path: &Path) -> Result<(), std::io::Error> {
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent)?;
    }
    fs::write(path, "ok")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn version_key_strips_prefixes_and_suffixes() {
        assert_eq!(version_key("v1.2.3-beta+4"), vec![1, 2, 3]);
        assert_eq!(version_key("7.10"), vec![7, 10]);
        assert_eq!(version_key("beta"), Vec::<u64>::new());
    }

    #[test]
    fn packages_output_is_compact_json() {
        assert_eq!(
            packages_output(&["com.a".to_string(), "com.b".to_string()]),
            r#"packages=["com.a","com.b"]"#
        );
    }
}
