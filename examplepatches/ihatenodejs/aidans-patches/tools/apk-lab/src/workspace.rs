//! Managed workspace ownership: deterministic run paths, schema-1 markers and
//! guarded cleanup.
//!
//! The layout matches the Python oracle:
//! `<root>/<package>/<versionCode>-<inputSha256[:12]>/<configDigest[:12]>`.
//! The config digest is SHA-256 over Python-canonical JSON
//! (`sort_keys=True`, compact separators, `ensure_ascii=True`).
//!
//! Destructive operations require a validated marker, strict containment under
//! the root and a non-symlink path. Dry runs perform reads only.

use crate::error::Error as CrateError;
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;
use std::fmt;
use std::fmt::Write as _;
use std::fs::{self, OpenOptions};
use std::io::{self, Write};
use std::path::{Component, Path, PathBuf};
use std::sync::{Arc, Mutex};
use std::time::{Duration, SystemTime, UNIX_EPOCH};

/// Marker file written into every managed run directory.
pub const MARKER_FILENAME: &str = ".marker.json";
/// Supported marker schema.
pub const SCHEMA_VERSION: u32 = 1;

/// Typed workspace failures.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum WorkspaceError {
    /// A value or marker is structurally invalid.
    Invalid(String),
    /// A path would escape the workspace root or has an unsafe component.
    UnsafePath(String),
    /// A filesystem boundary failed.
    Io {
        context: String,
        kind: io::ErrorKind,
    },
}

impl WorkspaceError {
    fn invalid(message: impl Into<String>) -> Self {
        Self::Invalid(message.into())
    }

    fn unsafe_path(message: impl Into<String>) -> Self {
        Self::UnsafePath(message.into())
    }

    fn io(context: impl Into<String>, error: io::Error) -> Self {
        Self::Io {
            context: context.into(),
            kind: error.kind(),
        }
    }

    /// Human-readable diagnostic.
    #[must_use]
    pub fn message(&self) -> String {
        match self {
            Self::Invalid(message) | Self::UnsafePath(message) => message.clone(),
            Self::Io { context, kind } => format!("{context}: {kind:?}"),
        }
    }
}

impl fmt::Display for WorkspaceError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(&self.message())
    }
}

impl std::error::Error for WorkspaceError {}

impl From<WorkspaceError> for CrateError {
    fn from(error: WorkspaceError) -> Self {
        match error {
            WorkspaceError::Io { context, kind } => CrateError::Io { context, kind },
            other => CrateError::invalid_artifact(other.message()),
        }
    }
}

/// Schema-1 marker. Field order is the sorted order Python writes.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct Marker {
    #[serde(rename = "configDigest")]
    pub config_digest: String,
    #[serde(rename = "command")]
    pub command: String,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "inputCanonicalPath")]
    pub input_canonical_path: String,
    #[serde(rename = "inputSha256")]
    pub input_sha256: String,
    #[serde(rename = "schemaVersion")]
    pub schema_version: u32,
    #[serde(rename = "toolVersions")]
    pub tool_versions: BTreeMap<String, String>,
}

/// Freshness verdict for a marker.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Freshness {
    Fresh,
    Stale,
}

/// Inputs for a managed run directory.
#[derive(Debug, Clone)]
pub struct RunRequest<'a> {
    pub package_name: &'a str,
    pub version_code: u64,
    pub input_sha256: &'a str,
    pub input_path: &'a Path,
    pub command: &'a str,
    pub config: &'a serde_json::Value,
    pub tool_versions: &'a BTreeMap<String, String>,
}

/// A manager for one workspace root.
#[derive(Debug, Clone)]
pub struct WorkspaceManager {
    root: PathBuf,
    /// Serializes publication and empty-parent pruning. Parallel check workers
    /// share package/version ancestors, so creation must not race cleanup.
    lifecycle_lock: Arc<Mutex<()>>,
}

impl WorkspaceManager {
    #[must_use]
    pub fn new(root: impl AsRef<Path>) -> Self {
        let root = root.as_ref();
        let resolved = fs::canonicalize(root)
            .or_else(|_| std::path::absolute(root))
            .unwrap_or_else(|_| root.to_path_buf());
        Self {
            root: resolved,
            lifecycle_lock: Arc::new(Mutex::new(())),
        }
    }

    #[must_use]
    pub fn root(&self) -> &Path {
        &self.root
    }

    /// Creates the workspace root if needed.
    pub fn ensure_root(&self) -> Result<PathBuf, WorkspaceError> {
        fs::create_dir_all(&self.root).map_err(|error| {
            WorkspaceError::io(
                format!("create workspace root {}", self.root.display()),
                error,
            )
        })?;
        fs::canonicalize(&self.root).map_err(|error| {
            WorkspaceError::io(
                format!("resolve workspace root {}", self.root.display()),
                error,
            )
        })
    }

    /// Derives the deterministic run path without writing anything.
    pub fn derive_run_dir(
        &self,
        package_name: &str,
        version_code: u64,
        input_sha256: &str,
        config_digest: &str,
    ) -> Result<PathBuf, WorkspaceError> {
        validate_package_name(package_name)?;
        let version_slot = version_slot(version_code, input_sha256)?;
        validate_config_digest(config_digest)?;
        Ok(self
            .root
            .join(package_name)
            .join(version_slot)
            .join(config_digest))
    }

    /// Creates a managed run directory and writes its marker atomically.
    ///
    /// All input validation and digest computation happen before any
    /// filesystem write, so a failed preflight leaves no partial run.
    pub fn create_run_dir(&self, request: &RunRequest<'_>) -> Result<PathBuf, WorkspaceError> {
        let prepared = self.prepare_run(request)?;
        let _guard = self
            .lifecycle_lock
            .lock()
            .unwrap_or_else(|error| error.into_inner());
        self.publish_run(prepared)
    }

    fn prepare_run(&self, request: &RunRequest<'_>) -> Result<PreparedRun, WorkspaceError> {
        validate_package_name(request.package_name)?;
        validate_input_sha256(request.input_sha256)?;
        if request.command.is_empty() {
            return Err(WorkspaceError::invalid("Command must not be empty"));
        }
        let version_slot = version_slot(request.version_code, request.input_sha256)?;
        let config_digest =
            compute_config_digest(request.command, request.config, request.tool_versions)?;
        let input_canonical_path = resolve_existing_path(request.input_path);
        let marker = Marker {
            config_digest: config_digest.clone(),
            command: request.command.to_string(),
            created_at: format_timestamp(SystemTime::now()),
            input_canonical_path,
            input_sha256: request.input_sha256.to_string(),
            schema_version: SCHEMA_VERSION,
            tool_versions: request.tool_versions.clone(),
        };
        Ok(PreparedRun {
            package_name: request.package_name.to_string(),
            version_slot,
            config_digest,
            marker,
        })
    }

    fn publish_run(&self, prepared: PreparedRun) -> Result<PathBuf, WorkspaceError> {
        let root = self.ensure_root()?;
        let run_dir = root
            .join(&prepared.package_name)
            .join(&prepared.version_slot)
            .join(&prepared.config_digest);

        let mut created = Vec::new();
        let result = (|| {
            ensure_directory_chain(&root, &run_dir, &mut created)?;
            write_marker(&run_dir, &prepared.marker)
        })();
        if result.is_err() {
            for directory in created.iter().rev() {
                let _ = fs::remove_dir(directory);
            }
        }
        result?;
        Ok(run_dir)
    }

    fn validate_run_dir_inner(&self, run_path: &Path) -> Result<(PathBuf, Marker), WorkspaceError> {
        let metadata = fs::symlink_metadata(run_path).map_err(|error| {
            WorkspaceError::io(format!("inspect run {}", run_path.display()), error)
        })?;
        if metadata.file_type().is_symlink() {
            return Err(WorkspaceError::unsafe_path(format!(
                "Path {} is a symlink",
                run_path.display()
            )));
        }

        let root = fs::canonicalize(&self.root).map_err(|error| {
            WorkspaceError::io(
                format!("resolve workspace root {}", self.root.display()),
                error,
            )
        })?;
        let resolved = fs::canonicalize(run_path).map_err(|error| {
            WorkspaceError::io(format!("resolve run {}", run_path.display()), error)
        })?;
        if resolved == root || !resolved.starts_with(&root) {
            return Err(WorkspaceError::unsafe_path(format!(
                "Path {} is outside workspace root {}",
                resolved.display(),
                root.display()
            )));
        }
        if !resolved.is_dir() {
            return Err(WorkspaceError::invalid(format!(
                "Path {} is not a directory",
                resolved.display()
            )));
        }

        let marker_file = resolved.join(MARKER_FILENAME);
        let marker_metadata = fs::symlink_metadata(&marker_file).map_err(|error| {
            if error.kind() == io::ErrorKind::NotFound {
                WorkspaceError::invalid(format!(
                    "Directory {} is missing {MARKER_FILENAME}",
                    resolved.display()
                ))
            } else {
                WorkspaceError::io(format!("inspect marker {}", marker_file.display()), error)
            }
        })?;
        if marker_metadata.file_type().is_symlink() || !marker_metadata.is_file() {
            return Err(WorkspaceError::invalid(format!(
                "Directory {} is missing {MARKER_FILENAME}",
                resolved.display()
            )));
        }

        let text = fs::read_to_string(&marker_file).map_err(|error| {
            WorkspaceError::io(format!("read marker {}", marker_file.display()), error)
        })?;
        let marker: Marker = serde_json::from_str(&text).map_err(|error| {
            WorkspaceError::invalid(format!(
                "Corrupt {MARKER_FILENAME} in {}: {error}",
                resolved.display()
            ))
        })?;
        if marker.schema_version != SCHEMA_VERSION {
            return Err(WorkspaceError::invalid(format!(
                "Unsupported marker schema in {}",
                resolved.display()
            )));
        }

        validate_run_layout(&root, &resolved)?;
        Ok((resolved, marker))
    }

    /// Validates a run directory and returns its marker.
    pub fn validate_run_dir(&self, run_path: &Path) -> Result<Marker, WorkspaceError> {
        self.validate_run_dir_inner(run_path)
            .map(|(_, marker)| marker)
    }

    /// Lists every validated run beneath the root, in deterministic order.
    pub fn find_all_runs(&self) -> Result<Vec<PathBuf>, WorkspaceError> {
        let mut runs = Vec::new();
        for package in self.child_directories(&self.root)? {
            for version in self.child_directories(&package)? {
                for candidate in self.child_directories(&version)? {
                    if let Ok((resolved, _)) = self.validate_run_dir_inner(&candidate) {
                        runs.push(resolved);
                    }
                }
            }
        }
        runs.sort();
        Ok(runs)
    }

    fn child_directories(&self, parent: &Path) -> Result<Vec<PathBuf>, WorkspaceError> {
        let entries = match fs::read_dir(parent) {
            Ok(entries) => entries,
            Err(error) if error.kind() == io::ErrorKind::NotFound => return Ok(Vec::new()),
            Err(error) => {
                return Err(WorkspaceError::io(
                    format!("read directory {}", parent.display()),
                    error,
                ))
            }
        };
        let mut children = Vec::new();
        for entry in entries {
            let entry = entry.map_err(|error| {
                WorkspaceError::io(format!("read directory {}", parent.display()), error)
            })?;
            let path = entry.path();
            let Ok(metadata) = fs::symlink_metadata(&path) else {
                continue;
            };
            if metadata.is_dir() && !metadata.file_type().is_symlink() {
                children.push(path);
            }
        }
        children.sort();
        Ok(children)
    }

    /// Cleans a single validated run. With `dry_run`, only validation occurs.
    pub fn clean_run(
        &self,
        run_path: impl AsRef<Path>,
        dry_run: bool,
    ) -> Result<bool, WorkspaceError> {
        let (resolved, _) = self.validate_run_dir_inner(run_path.as_ref())?;
        if !dry_run {
            fs::remove_dir_all(&resolved).map_err(|error| {
                WorkspaceError::io(format!("remove run {}", resolved.display()), error)
            })?;
            clean_empty_parents(&self.root, resolved.parent());
        }
        Ok(true)
    }

    /// Cleans every validated run for a package.
    pub fn clean_package(
        &self,
        package_name: &str,
        dry_run: bool,
    ) -> Result<Vec<PathBuf>, WorkspaceError> {
        validate_package_name(package_name)?;
        let root = match fs::canonicalize(&self.root) {
            Ok(root) => root,
            Err(error) if error.kind() == io::ErrorKind::NotFound => return Ok(Vec::new()),
            Err(error) => {
                return Err(WorkspaceError::io(
                    format!("resolve workspace root {}", self.root.display()),
                    error,
                ))
            }
        };
        let package_dir = root.join(package_name);
        match fs::symlink_metadata(&package_dir) {
            Ok(metadata) if metadata.file_type().is_symlink() => {
                return Err(WorkspaceError::unsafe_path(format!(
                    "Invalid package directory {}",
                    package_dir.display()
                )))
            }
            Ok(metadata) if !metadata.is_dir() => return Ok(Vec::new()),
            Ok(_) => {}
            Err(error) if error.kind() == io::ErrorKind::NotFound => return Ok(Vec::new()),
            Err(error) => {
                return Err(WorkspaceError::io(
                    format!("inspect package directory {}", package_dir.display()),
                    error,
                ))
            }
        }

        let mut cleaned = Vec::new();
        for version in self.child_directories(&package_dir)? {
            for candidate in self.child_directories(&version)? {
                let Ok((resolved, _)) = self.validate_run_dir_inner(&candidate) else {
                    continue;
                };
                cleaned.push(resolved.clone());
                if !dry_run {
                    fs::remove_dir_all(&resolved).map_err(|error| {
                        WorkspaceError::io(format!("remove run {}", resolved.display()), error)
                    })?;
                    clean_empty_parents(&self.root, resolved.parent());
                }
            }
        }
        cleaned.sort();
        Ok(cleaned)
    }

    /// Cleans runs older than `days`. Sorted results, never partial deletes.
    pub fn clean_stale(&self, days: f64, dry_run: bool) -> Result<Vec<PathBuf>, WorkspaceError> {
        self.clean_stale_at(days, SystemTime::now(), dry_run)
    }

    /// `clean_stale` with an injected clock for deterministic tests.
    pub fn clean_stale_at(
        &self,
        days: f64,
        now: SystemTime,
        dry_run: bool,
    ) -> Result<Vec<PathBuf>, WorkspaceError> {
        let cutoff = stale_cutoff(days)?;
        let mut stale = Vec::new();
        for run_dir in self.find_all_runs()? {
            let Ok(marker) = self.validate_run_dir(&run_dir) else {
                continue;
            };
            if freshness(&marker, now, cutoff)? != Freshness::Stale {
                continue;
            }
            stale.push(run_dir.clone());
            if !dry_run {
                fs::remove_dir_all(&run_dir).map_err(|error| {
                    WorkspaceError::io(format!("remove run {}", run_dir.display()), error)
                })?;
                clean_empty_parents(&self.root, run_dir.parent());
            }
        }
        stale.sort();
        Ok(stale)
    }

    /// Creates a managed run whose directory is removed on drop unless
    /// `keep_workspace` is true.
    pub fn ephemeral_run(
        &self,
        request: &RunRequest<'_>,
        keep_workspace: bool,
    ) -> Result<EphemeralRun, WorkspaceError> {
        let prepared = self.prepare_run(request)?;
        let marker = prepared.marker.clone();
        let _guard = self
            .lifecycle_lock
            .lock()
            .unwrap_or_else(|error| error.into_inner());
        let path = self.publish_run(prepared)?;
        Ok(EphemeralRun {
            path,
            marker,
            keep: keep_workspace,
            root: self.root.clone(),
            lifecycle_lock: Arc::clone(&self.lifecycle_lock),
        })
    }
}

struct PreparedRun {
    package_name: String,
    version_slot: String,
    config_digest: String,
    marker: Marker,
}

/// RAII ephemeral workspace directory.
#[derive(Debug)]
pub struct EphemeralRun {
    path: PathBuf,
    marker: Marker,
    keep: bool,
    root: PathBuf,
    lifecycle_lock: Arc<Mutex<()>>,
}

impl EphemeralRun {
    #[must_use]
    pub fn path(&self) -> &Path {
        &self.path
    }

    #[must_use]
    pub fn marker(&self) -> &Marker {
        &self.marker
    }
}

impl Drop for EphemeralRun {
    fn drop(&mut self) {
        if self.keep {
            return;
        }
        let _guard = self
            .lifecycle_lock
            .lock()
            .unwrap_or_else(|error| error.into_inner());
        let _ = fs::remove_dir_all(&self.path);
        clean_empty_parents(&self.root, self.path.parent());
    }
}

/// Writes a marker with Python's `json.dump(indent=2, sort_keys=True)` shape.
pub fn write_marker(run_dir: &Path, marker: &Marker) -> Result<(), WorkspaceError> {
    let marker_path = run_dir.join(MARKER_FILENAME);
    if let Ok(metadata) = fs::symlink_metadata(&marker_path) {
        if metadata.file_type().is_symlink() {
            return Err(WorkspaceError::unsafe_path(format!(
                "Marker path {} is a symlink",
                marker_path.display()
            )));
        }
    }
    let encoded = serde_json::to_string_pretty(marker)
        .map_err(|error| WorkspaceError::invalid(format!("encode marker: {error}")))?;
    let temp_name = format!(".marker.json.{}.tmp", std::process::id());
    let temp_path = run_dir.join(temp_name);
    let write_result = (|| {
        let mut file = OpenOptions::new()
            .write(true)
            .create_new(true)
            .open(&temp_path)
            .map_err(|error| {
                WorkspaceError::io(
                    format!("create marker temporary {}", temp_path.display()),
                    error,
                )
            })?;
        file.write_all(encoded.as_bytes())
            .map_err(|error| WorkspaceError::io("write marker", error))?;
        file.sync_all()
            .map_err(|error| WorkspaceError::io("sync marker", error))?;
        drop(file);
        fs::rename(&temp_path, &marker_path)
            .map_err(|error| WorkspaceError::io("publish marker", error))
    })();
    if write_result.is_err() {
        let _ = fs::remove_file(&temp_path);
    }
    write_result
}

/// Computes the full SHA-256 of Python-canonical JSON.
pub fn compute_digest(value: &serde_json::Value) -> Result<String, WorkspaceError> {
    let canonical = canonical_json(value)?;
    Ok(format!("{:x}", Sha256::digest(canonical.as_bytes())))
}

/// Computes the 12-character config digest used in the run path.
pub fn compute_config_digest(
    command: &str,
    config: &serde_json::Value,
    tool_versions: &BTreeMap<String, String>,
) -> Result<String, WorkspaceError> {
    if command.is_empty() {
        return Err(WorkspaceError::invalid("Command must not be empty"));
    }
    let mut payload = serde_json::Map::new();
    payload.insert(
        "command".to_string(),
        serde_json::Value::String(command.to_string()),
    );
    payload.insert("config".to_string(), config.clone());
    payload.insert(
        "toolVersions".to_string(),
        serde_json::to_value(tool_versions)
            .map_err(|error| WorkspaceError::invalid(format!("encode tool versions: {error}")))?,
    );
    let digest = compute_digest(&serde_json::Value::Object(payload))?;
    Ok(digest[..12].to_string())
}

/// Serializes a JSON value exactly as Python's
/// `json.dumps(sort_keys=True, separators=(",", ":"), ensure_ascii=True)`.
pub fn canonical_json(value: &serde_json::Value) -> Result<String, WorkspaceError> {
    let mut out = String::new();
    write_canonical(value, &mut out)?;
    Ok(out)
}

fn write_canonical(value: &serde_json::Value, out: &mut String) -> Result<(), WorkspaceError> {
    match value {
        serde_json::Value::Null => out.push_str("null"),
        serde_json::Value::Bool(flag) => {
            out.push_str(if *flag { "true" } else { "false" });
        }
        serde_json::Value::Number(number) => {
            if let Some(integer) = number.as_i64() {
                let _ = write!(out, "{integer}");
            } else if let Some(integer) = number.as_u64() {
                let _ = write!(out, "{integer}");
            } else if let Some(float) = number.as_f64() {
                write_python_float(float, out)?;
            } else {
                return Err(WorkspaceError::invalid("Unsupported JSON number"));
            }
        }
        serde_json::Value::String(text) => write_python_string(text, out),
        serde_json::Value::Array(items) => {
            out.push('[');
            for (index, item) in items.iter().enumerate() {
                if index > 0 {
                    out.push(',');
                }
                write_canonical(item, out)?;
            }
            out.push(']');
        }
        serde_json::Value::Object(map) => {
            let mut keys: Vec<&String> = map.keys().collect();
            keys.sort();
            out.push('{');
            for (index, key) in keys.into_iter().enumerate() {
                if index > 0 {
                    out.push(',');
                }
                write_python_string(key, out);
                out.push(':');
                let item = map
                    .get(key)
                    .ok_or_else(|| WorkspaceError::invalid("Missing JSON object value"))?;
                write_canonical(item, out)?;
            }
            out.push('}');
        }
    }
    Ok(())
}

fn write_python_string(text: &str, out: &mut String) {
    out.push('"');
    for character in text.chars() {
        match character {
            '"' => out.push_str("\\\""),
            '\\' => out.push_str("\\\\"),
            '\u{08}' => out.push_str("\\b"),
            '\u{0c}' => out.push_str("\\f"),
            '\n' => out.push_str("\\n"),
            '\r' => out.push_str("\\r"),
            '\t' => out.push_str("\\t"),
            character if (character as u32) < 0x20 || (character as u32) >= 0x7f => {
                let code_point = character as u32;
                if code_point <= 0xffff {
                    let _ = write!(out, "\\u{code_point:04x}");
                } else {
                    let scrambled = code_point - 0x10000;
                    let high = 0xd800 + (scrambled >> 10);
                    let low = 0xdc00 + (scrambled & 0x3ff);
                    let _ = write!(out, "\\u{high:04x}\\u{low:04x}");
                }
            }
            character => out.push(character),
        }
    }
    out.push('"');
}

fn write_python_float(value: f64, out: &mut String) -> Result<(), WorkspaceError> {
    if !value.is_finite() {
        return Err(WorkspaceError::invalid(
            "Non-finite float is not canonical JSON",
        ));
    }
    if value == 0.0 {
        out.push_str(if value.is_sign_negative() {
            "-0.0"
        } else {
            "0.0"
        });
        return Ok(());
    }

    let scientific = format!("{value:e}");
    let (mantissa, exponent) = scientific
        .split_once('e')
        .ok_or_else(|| WorkspaceError::invalid("Unformattable float"))?;
    let exponent: i32 = exponent
        .parse()
        .map_err(|_| WorkspaceError::invalid("Unformattable float exponent"))?;
    let (negative, mantissa) = match mantissa.strip_prefix('-') {
        Some(rest) => (true, rest),
        None => (false, mantissa),
    };
    let digits: String = mantissa
        .chars()
        .filter(|character| *character != '.')
        .collect();
    let digit_count = i32::try_from(digits.len())
        .map_err(|_| WorkspaceError::invalid("Unformattable float digits"))?;
    let decimal_point = exponent + 1;

    if negative {
        out.push('-');
    }
    if decimal_point <= -4 || decimal_point > 16 {
        out.push(digits.chars().next().unwrap_or('0'));
        if digit_count > 1 {
            out.push('.');
            out.push_str(&digits[1..]);
        }
        out.push('e');
        let printed_exponent = decimal_point - 1;
        if printed_exponent < 0 {
            out.push('-');
        } else {
            out.push('+');
        }
        let magnitude = printed_exponent.unsigned_abs();
        if magnitude < 10 {
            out.push('0');
        }
        let _ = write!(out, "{magnitude}");
    } else if decimal_point <= 0 {
        out.push_str("0.");
        for _ in 0..(-decimal_point) {
            out.push('0');
        }
        out.push_str(&digits);
    } else if decimal_point >= digit_count {
        out.push_str(&digits);
        for _ in 0..(decimal_point - digit_count) {
            out.push('0');
        }
        out.push_str(".0");
    } else {
        let split = usize::try_from(decimal_point)
            .map_err(|_| WorkspaceError::invalid("Unformattable float split"))?;
        out.push_str(&digits[..split]);
        out.push('.');
        out.push_str(&digits[split..]);
    }
    Ok(())
}

/// Rejects package names that cannot be used as a single safe path component.
///
/// Dots are legal (`com.example.app`); empty names, `.`/`..`, path separators,
/// NUL bytes, and multi-component paths are not.
///
/// # Errors
///
/// Returns [`WorkspaceError::UnsafePath`] when the name is unusable as a
/// directory or file component.
pub fn validate_package_name(package_name: &str) -> Result<(), WorkspaceError> {
    validate_component(package_name, "package name")
}

fn validate_component(value: &str, field: &str) -> Result<(), WorkspaceError> {
    if value.is_empty() {
        return Err(WorkspaceError::unsafe_path(format!("Empty {field}")));
    }
    if value.contains('\0') || value.contains('/') || value.contains('\\') {
        return Err(WorkspaceError::unsafe_path(format!(
            "Unsafe {field}: {value:?}"
        )));
    }
    if value == "." || value == ".." || Path::new(value).components().count() != 1 {
        return Err(WorkspaceError::unsafe_path(format!(
            "Unsafe {field}: {value:?}"
        )));
    }
    Ok(())
}

fn validate_hex_prefix(value: &str, length: usize, field: &str) -> Result<(), WorkspaceError> {
    if value.len() < length || !value.as_bytes()[..length].iter().all(u8::is_ascii_hexdigit) {
        return Err(WorkspaceError::unsafe_path(format!(
            "Invalid {field}: {value:?}"
        )));
    }
    Ok(())
}

fn validate_input_sha256(value: &str) -> Result<(), WorkspaceError> {
    validate_hex_prefix(value, 12, "input SHA-256")
}

fn validate_config_digest(value: &str) -> Result<(), WorkspaceError> {
    if value.len() != 12 || !value.as_bytes().iter().all(u8::is_ascii_hexdigit) {
        return Err(WorkspaceError::unsafe_path(format!(
            "Invalid config digest: {value:?}"
        )));
    }
    Ok(())
}

fn version_slot(version_code: u64, input_sha256: &str) -> Result<String, WorkspaceError> {
    validate_input_sha256(input_sha256)?;
    Ok(format!("{version_code}-{}", &input_sha256[..12]))
}

fn validate_run_layout(root: &Path, resolved: &Path) -> Result<(), WorkspaceError> {
    let relative = resolved.strip_prefix(root).map_err(|_| {
        WorkspaceError::unsafe_path(format!(
            "Path {} is outside workspace root {}",
            resolved.display(),
            root.display()
        ))
    })?;
    let components: Vec<&std::ffi::OsStr> = relative
        .components()
        .filter_map(|component| match component {
            Component::Normal(value) => Some(value),
            _ => None,
        })
        .collect();
    if components.len() != 3 {
        return Err(WorkspaceError::invalid(format!(
            "Invalid managed run layout: {}",
            resolved.display()
        )));
    }
    let package = components[0]
        .to_str()
        .ok_or_else(|| WorkspaceError::unsafe_path("Non-UTF-8 package directory"))?;
    validate_component(package, "package directory")?;

    let slot = components[1]
        .to_str()
        .ok_or_else(|| WorkspaceError::unsafe_path("Non-UTF-8 version slot"))?;
    let (version_code, sha_prefix) = slot
        .split_once('-')
        .ok_or_else(|| WorkspaceError::invalid(format!("Invalid version slot: {slot:?}")))?;
    if version_code.is_empty() || !version_code.bytes().all(|byte| byte.is_ascii_digit()) {
        return Err(WorkspaceError::invalid(format!(
            "Invalid version slot: {slot:?}"
        )));
    }
    validate_hex_prefix(sha_prefix, 12, "version slot SHA-256")?;
    if sha_prefix.len() != 12 {
        return Err(WorkspaceError::invalid(format!(
            "Invalid version slot: {slot:?}"
        )));
    }

    let config = components[2]
        .to_str()
        .ok_or_else(|| WorkspaceError::unsafe_path("Non-UTF-8 config digest"))?;
    validate_config_digest(config)?;
    Ok(())
}

fn ensure_directory_chain(
    root: &Path,
    target: &Path,
    created: &mut Vec<PathBuf>,
) -> Result<(), WorkspaceError> {
    let relative = target.strip_prefix(root).map_err(|_| {
        WorkspaceError::unsafe_path(format!(
            "Calculated run directory {} escapes root {}",
            target.display(),
            root.display()
        ))
    })?;
    let mut current = root.to_path_buf();
    for component in relative.components() {
        let Component::Normal(value) = component else {
            return Err(WorkspaceError::unsafe_path(format!(
                "Calculated run directory {} escapes root {}",
                target.display(),
                root.display()
            )));
        };
        current.push(value);
        match fs::symlink_metadata(&current) {
            Ok(metadata) => {
                if metadata.file_type().is_symlink() {
                    return Err(WorkspaceError::unsafe_path(format!(
                        "Workspace path {} is a symlink",
                        current.display()
                    )));
                }
                if !metadata.is_dir() {
                    return Err(WorkspaceError::unsafe_path(format!(
                        "Workspace path {} is not a directory",
                        current.display()
                    )));
                }
            }
            Err(error) if error.kind() == io::ErrorKind::NotFound => {
                match fs::create_dir(&current) {
                    Ok(()) => created.push(current.clone()),
                    Err(error) if error.kind() == io::ErrorKind::AlreadyExists => {
                        // A parallel worker can create a shared parent between
                        // the metadata probe and create_dir. Validate the winner
                        // instead of failing the check run.
                        let metadata = fs::symlink_metadata(&current).map_err(|error| {
                            WorkspaceError::io(
                                format!("inspect workspace directory {}", current.display()),
                                error,
                            )
                        })?;
                        if metadata.file_type().is_symlink() || !metadata.is_dir() {
                            return Err(WorkspaceError::unsafe_path(format!(
                                "Workspace path {} is not a safe directory",
                                current.display()
                            )));
                        }
                    }
                    Err(error) => {
                        return Err(WorkspaceError::io(
                            format!("create workspace directory {}", current.display()),
                            error,
                        ))
                    }
                }
            }
            Err(error) => {
                return Err(WorkspaceError::io(
                    format!("inspect workspace directory {}", current.display()),
                    error,
                ))
            }
        }
    }
    Ok(())
}

fn clean_empty_parents(root: &Path, start: Option<&Path>) {
    let Ok(root) = fs::canonicalize(root) else {
        return;
    };
    let Some(start) = start else {
        return;
    };
    let Ok(mut current) = fs::canonicalize(start) else {
        return;
    };
    while current != root && current.starts_with(&root) {
        if fs::remove_dir(&current).is_err() {
            break;
        }
        let Some(parent) = current.parent() else {
            break;
        };
        current = parent.to_path_buf();
    }
}

fn resolve_existing_path(path: &Path) -> String {
    fs::canonicalize(path)
        .or_else(|_| std::path::absolute(path))
        .unwrap_or_else(|_| path.to_path_buf())
        .to_string_lossy()
        .into_owned()
}

fn stale_cutoff(days: f64) -> Result<f64, WorkspaceError> {
    if !days.is_finite() || days < 0.0 {
        return Err(WorkspaceError::invalid(format!(
            "Stale age must be non-negative: {days}"
        )));
    }
    Ok(days * 86_400.0)
}

/// Fresh when the marker age is strictly below the cutoff.
pub fn freshness(
    marker: &Marker,
    now: SystemTime,
    cutoff_seconds: f64,
) -> Result<Freshness, WorkspaceError> {
    if !cutoff_seconds.is_finite() || cutoff_seconds < 0.0 {
        return Err(WorkspaceError::invalid("Stale cutoff must be non-negative"));
    }
    let created = parse_timestamp(&marker.created_at)?;
    let age = now
        .duration_since(created)
        .map(|duration| duration.as_secs_f64())
        .unwrap_or(0.0);
    Ok(if age >= cutoff_seconds {
        Freshness::Stale
    } else {
        Freshness::Fresh
    })
}

/// Formats a timestamp like Python's `datetime.now(UTC).isoformat()`.
#[must_use]
pub fn format_timestamp(time: SystemTime) -> String {
    let (seconds, micros) = match time.duration_since(UNIX_EPOCH) {
        Ok(duration) => (
            i64::try_from(duration.as_secs()).unwrap_or(i64::MAX),
            duration.subsec_micros(),
        ),
        Err(error) => {
            let duration = error.duration();
            let whole = duration.as_secs();
            let nanos = duration.subsec_nanos();
            if nanos == 0 {
                (-i64::try_from(whole).unwrap_or(i64::MAX), 0)
            } else {
                (
                    -i64::try_from(whole).unwrap_or(i64::MAX) - 1,
                    1_000_000 - nanos / 1_000,
                )
            }
        }
    };
    let days = seconds.div_euclid(86_400);
    let seconds_of_day = seconds.rem_euclid(86_400);
    let (year, month, day) = civil_from_days(days);
    let hour = seconds_of_day / 3600;
    let minute = (seconds_of_day % 3600) / 60;
    let second = seconds_of_day % 60;
    let fraction = if micros > 0 {
        format!(".{micros:06}")
    } else {
        String::new()
    };
    format!("{year:04}-{month:02}-{day:02}T{hour:02}:{minute:02}:{second:02}{fraction}+00:00")
}

/// Parses the RFC 3339 timestamps Python writes for `createdAt`.
pub fn parse_timestamp(text: &str) -> Result<SystemTime, WorkspaceError> {
    let (date, rest) = text
        .split_once('T')
        .ok_or_else(|| WorkspaceError::invalid(format!("Invalid timestamp: {text}")))?;
    let mut date_parts = date.split('-');
    let year: i64 = parse_part(date_parts.next(), "year", text)?;
    let month: i64 = parse_part(date_parts.next(), "month", text)?;
    let day: i64 = parse_part(date_parts.next(), "day", text)?;
    if date_parts.next().is_some() || !(1..=12).contains(&month) || !(1..=31).contains(&day) {
        return Err(WorkspaceError::invalid(format!(
            "Invalid timestamp: {text}"
        )));
    }

    let (clock, offset_seconds) = split_zone(rest, text)?;
    let mut clock_parts = clock.split(':');
    let hour: i64 = parse_part(clock_parts.next(), "hour", text)?;
    let minute: i64 = parse_part(clock_parts.next(), "minute", text)?;
    let seconds_part = clock_parts
        .next()
        .ok_or_else(|| WorkspaceError::invalid(format!("Invalid timestamp: {text}")))?;
    if clock_parts.next().is_some() {
        return Err(WorkspaceError::invalid(format!(
            "Invalid timestamp: {text}"
        )));
    }
    let (second_text, fraction_text) = match seconds_part.split_once('.') {
        Some((whole, fraction)) => (whole, Some(fraction)),
        None => (seconds_part, None),
    };
    let second: i64 = parse_part(Some(second_text), "second", text)?;
    if hour > 23 || minute > 59 || second > 60 {
        return Err(WorkspaceError::invalid(format!(
            "Invalid timestamp: {text}"
        )));
    }
    let micros = match fraction_text {
        None => 0i64,
        Some(fraction) => {
            if fraction.is_empty()
                || fraction.len() > 9
                || !fraction.bytes().all(|byte| byte.is_ascii_digit())
            {
                return Err(WorkspaceError::invalid(format!(
                    "Invalid timestamp fraction: {text}"
                )));
            }
            let mut padded = fraction.to_string();
            while padded.len() < 6 {
                padded.push('0');
            }
            padded[..6]
                .parse::<i64>()
                .map_err(|_| WorkspaceError::invalid(format!("Invalid timestamp: {text}")))?
        }
    };

    let days = days_from_civil(year, month, day);
    let seconds_of_day = hour * 3600 + minute * 60 + second;
    let epoch_seconds = days
        .checked_mul(86_400)
        .and_then(|value| value.checked_add(seconds_of_day))
        .and_then(|value| value.checked_sub(offset_seconds))
        .ok_or_else(|| WorkspaceError::invalid(format!("Timestamp out of range: {text}")))?;
    let base = if epoch_seconds >= 0 {
        UNIX_EPOCH
            .checked_add(Duration::from_secs(epoch_seconds.unsigned_abs()))
            .ok_or_else(|| WorkspaceError::invalid(format!("Timestamp out of range: {text}")))?
    } else {
        UNIX_EPOCH
            .checked_sub(Duration::from_secs(epoch_seconds.unsigned_abs()))
            .ok_or_else(|| WorkspaceError::invalid(format!("Timestamp out of range: {text}")))?
    };
    Ok(base + Duration::from_micros(micros.unsigned_abs()))
}

fn parse_part(value: Option<&str>, name: &str, text: &str) -> Result<i64, WorkspaceError> {
    let value =
        value.ok_or_else(|| WorkspaceError::invalid(format!("Invalid timestamp: {text}")))?;
    value
        .parse::<i64>()
        .map_err(|_| WorkspaceError::invalid(format!("Invalid timestamp {name}: {text}")))
}

fn split_zone<'a>(rest: &'a str, text: &str) -> Result<(&'a str, i64), WorkspaceError> {
    if let Some(clock) = rest.strip_suffix('Z') {
        return Ok((clock, 0));
    }
    let zone_index = rest
        .char_indices()
        .skip(1)
        .find(|(_, character)| *character == '+' || *character == '-')
        .map(|(index, _)| index);
    let Some(index) = zone_index else {
        return Ok((rest, 0));
    };
    let (clock, zone) = rest.split_at(index);
    let sign = if zone.starts_with('-') { -1 } else { 1 };
    let body = &zone[1..];
    let (hours_text, minutes_text) = body
        .split_once(':')
        .ok_or_else(|| WorkspaceError::invalid(format!("Invalid timezone: {text}")))?;
    let hours: i64 = parse_part(Some(hours_text), "offset hour", text)?;
    let minutes: i64 = parse_part(Some(minutes_text), "offset minute", text)?;
    if hours > 23 || minutes > 59 {
        return Err(WorkspaceError::invalid(format!("Invalid timezone: {text}")));
    }
    Ok((clock, sign * (hours * 3600 + minutes * 60)))
}

// Howard Hinnant's civil calendar algorithms; avoids a time-zone dependency.
fn days_from_civil(year: i64, month: i64, day: i64) -> i64 {
    let adjusted_year = year - i64::from(month <= 2);
    let era = if adjusted_year >= 0 {
        adjusted_year
    } else {
        adjusted_year - 399
    } / 400;
    let year_of_era = adjusted_year - era * 400;
    let month_prime = month + if month > 2 { -3 } else { 9 };
    let day_of_year = (153 * month_prime + 2) / 5 + day - 1;
    let day_of_era = year_of_era * 365 + year_of_era / 4 - year_of_era / 100 + day_of_year;
    era * 146_097 + day_of_era - 719_468
}

fn civil_from_days(days: i64) -> (i64, i64, i64) {
    let z = days + 719_468;
    let era = if z >= 0 { z } else { z - 146_096 } / 146_097;
    let day_of_era = z - era * 146_097;
    let year_of_era =
        (day_of_era - day_of_era / 1460 + day_of_era / 36_524 - day_of_era / 146_096) / 365;
    let year = year_of_era + era * 400;
    let day_of_year = day_of_era - (365 * year_of_era + year_of_era / 4 - year_of_era / 100);
    let month_prime = (5 * day_of_year + 2) / 153;
    let day = day_of_year - (153 * month_prime + 2) / 5 + 1;
    let month = month_prime + if month_prime < 10 { 3 } else { -9 };
    (year + i64::from(month <= 2), month, day)
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn canonical_strings_escape_like_python() {
        let value = json!("\u{e9}\u{1f600}\u{7f}\u{1f}\"\\");
        assert_eq!(
            canonical_json(&value).unwrap(),
            "\"\\u00e9\\ud83d\\ude00\\u007f\\u001f\\\"\\\\\""
        );
    }

    #[test]
    fn canonical_numbers_use_python_repr() {
        for (value, expected) in [
            (json!(1.0), "1.0"),
            (json!(1.5), "1.5"),
            (json!(0.1), "0.1"),
            (json!(1e16), "1e+16"),
            (json!(1e15), "1000000000000000.0"),
            (json!(1e-4), "0.0001"),
            (json!(1e-5), "1e-05"),
            (json!(1.234e-5), "1.234e-05"),
            (json!(-0.0), "-0.0"),
        ] {
            assert_eq!(canonical_json(&value).unwrap(), expected, "{value}");
        }
    }

    #[test]
    fn canonical_object_sorts_keys_and_compacts() {
        let value = json!({"b": 1, "a": [true, null, 1.5, "\u{e9}"]});
        assert_eq!(
            canonical_json(&value).unwrap(),
            "{\"a\":[true,null,1.5,\"\\u00e9\"],\"b\":1}"
        );
    }

    #[test]
    fn timestamp_round_trips() {
        let time = UNIX_EPOCH + Duration::from_secs(1_767_323_045) + Duration::from_micros(123_456);
        let text = format_timestamp(time);
        assert_eq!(text, "2026-01-02T03:04:05.123456+00:00");
        assert_eq!(parse_timestamp(&text).unwrap(), time);
        assert_eq!(
            parse_timestamp("2026-01-02T05:04:05+02:00").unwrap(),
            UNIX_EPOCH + Duration::from_secs(1_767_323_045)
        );
    }

    #[test]
    fn negative_stale_age_is_rejected() {
        assert!(stale_cutoff(-1.0).is_err());
    }
}
