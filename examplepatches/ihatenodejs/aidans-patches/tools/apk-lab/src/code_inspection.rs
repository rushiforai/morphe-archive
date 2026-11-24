//! Class localization, method extraction and unified-diff behavior.
//!
//! Native port of the retired Python implementation.
//!
//! Classes are located across every `classes*.dex` member of every
//! materialized split before any decompiler runs, matching the Python oracle's
//! split/multi-DEX search order. Tool invocation goes through [`ToolExecutor`],
//! whose production implementation builds [`ProcessSpec`] values and calls the
//! process adapter; no shell is ever involved and tests inject fake tools.
//!
//! The unified diff here is a direct port of CPython's `difflib`
//! [`SequenceMatcher`] greedy algorithm, including the popular-element
//! autojunk rule, so headers, hunk ranges, context and bytes match the Python
//! command instead of a third-party diff dialect. Diff coloring is applied only
//! when the caller reports a TTY.

use crate::archives::{self, MaterializedApk};
use crate::error::Error;
use crate::inspection;
use crate::models::ArtifactInspection;
use crate::process::{self, ProcessSpec};
use crate::tools::{self, ToolEnvironment, ToolManager, ToolType};
use regex::Regex;
use std::collections::{HashMap, HashSet};
use std::fs::{self, File};
use std::io::{Read, Write};
use std::path::{Path, PathBuf};
use tempfile::TempDir;
use zip::ZipArchive;

/// dexdump prints one descriptor per class; a large multi-DEX app exceeds the
/// process adapter's default 1 MiB capture. This bound keeps parity without
/// accepting unbounded memory.
pub const DEXDUMP_MAX_OUTPUT_BYTES: usize = 64 * 1024 * 1024;

/// Maximum bytes accepted from one DEX member. The DEX format itself cannot
/// address more than 4 GiB, so this only bounds hostile archives.
pub const MAX_DEX_BYTES: u64 = 1024 * 1024 * 1024;

/// Diff truncation limit shared with the comparison command.
pub const DIFF_LINE_LIMIT: usize = 500;
/// Marker appended when a diff exceeds [`DIFF_LINE_LIMIT`].
pub const DIFF_TRUNCATION_MARKER: &str = "\n... diff truncated at 500 lines ...\n";

/// External tools used by inspection and analysis.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum ToolKind {
    Dexdump,
    Baksmali,
    Jadx,
    Apktool,
    Smali,
}

impl ToolKind {
    /// Tool-cache name, matching `tools.lock.json`.
    #[must_use]
    pub const fn name(self) -> &'static str {
        match self {
            ToolKind::Dexdump => "dexdump",
            ToolKind::Baksmali => "baksmali",
            ToolKind::Jadx => "jadx",
            ToolKind::Apktool => "apktool",
            ToolKind::Smali => "smali",
        }
    }
}

/// Process outcome reduced to what command handlers consume.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ToolResult {
    pub exit_code: Option<i32>,
    pub stdout: String,
    pub stderr: String,
}

impl ToolResult {
    #[must_use]
    pub fn success(&self) -> bool {
        self.exit_code == Some(0)
    }
}

/// Injection point for every external tool.
///
/// `execute` receives the tool's raw argument vector. The production
/// implementation prefixes `java -jar` for JAR tools internally; fake
/// implementations in tests therefore see the same argv the Python oracle
/// passes to `ToolManager.run_tool_cmd`.
pub trait ToolExecutor {
    fn is_available(&self, tool: ToolKind) -> bool;

    /// Pinned version from the tool lock, when known.
    fn version(&self, tool: &str) -> Option<String> {
        let _ = tool;
        None
    }

    fn execute(&self, tool: ToolKind, args: &[String]) -> Result<ToolResult, Error>;
}

/// Production executor backed by the shared tool cache and process adapter.
#[derive(Debug, Clone)]
pub struct NativeToolExecutor {
    manager: ToolManager,
    env: ToolEnvironment,
    dexdump: Option<PathBuf>,
}

impl NativeToolExecutor {
    pub fn new(manager: ToolManager, env: ToolEnvironment) -> Self {
        let dexdump = tools::find_build_tools_bin(&env, "dexdump").ok();
        Self {
            manager,
            env,
            dexdump,
        }
    }

    pub fn from_defaults() -> Result<Self, Error> {
        let env = ToolEnvironment::from_process(&tools::default_repo_root());
        let manager =
            ToolManager::with_defaults().map_err(|error| Error::usage(error.message()))?;
        Ok(Self::new(manager, env))
    }

    fn executable(&self, tool: ToolKind) -> Result<PathBuf, Error> {
        match tool {
            ToolKind::Dexdump => self.dexdump.clone().ok_or_else(|| {
                Error::usage(
                    "Android build tool 'dexdump' not found. Check ANDROID_HOME or local.properties",
                )
            }),
            other => self
                .manager
                .executable_path(other.name())
                .map_err(|error| Error::usage(error.message())),
        }
    }
}

impl ToolExecutor for NativeToolExecutor {
    fn is_available(&self, tool: ToolKind) -> bool {
        match tool {
            ToolKind::Dexdump => self.dexdump.is_some(),
            other => self.manager.is_tool_installed(other.name()),
        }
    }

    fn version(&self, tool: &str) -> Option<String> {
        self.manager
            .lock()
            .spec(tool)
            .map(|spec| spec.version.clone())
    }

    fn execute(&self, tool: ToolKind, args: &[String]) -> Result<ToolResult, Error> {
        let executable = self.executable(tool)?;
        if tool != ToolKind::Dexdump && !executable.exists() {
            return Err(Error::usage(format!(
                "Tool '{}' is not installed. Run 'apk-lab setup' first.",
                tool.name()
            )));
        }
        let mut spec = if tool == ToolKind::Dexdump
            || self
                .manager
                .spec(tool.name())
                .is_ok_and(|entry| entry.tool_type != ToolType::Jar)
        {
            ProcessSpec::new(executable.clone())
        } else {
            ProcessSpec::new(self.env.find_java())
                .arg("-jar")
                .arg(executable.to_string_lossy().into_owned())
        };
        spec.args.extend(args.iter().cloned());
        if tool == ToolKind::Dexdump {
            spec = spec.max_output_bytes(DEXDUMP_MAX_OUTPUT_BYTES);
        }
        let output = process::run(&spec)?;
        Ok(ToolResult {
            exit_code: output.exit_code(),
            stdout: output.stdout.text_lossy(),
            stderr: output.stderr.text_lossy(),
        })
    }
}

/// Injection point for artifact inspection, so tests never call aapt2.
pub trait ArtifactInspector {
    fn inspect(&self, path: &Path) -> Result<ArtifactInspection, Error>;
}

/// Production inspector backed by [`inspection::inspect_artifact`].
#[derive(Debug, Clone, Copy, Default)]
pub struct LiveArtifactInspector;

impl ArtifactInspector for LiveArtifactInspector {
    fn inspect(&self, path: &Path) -> Result<ArtifactInspection, Error> {
        inspection::inspect_artifact(path)
    }
}

/// Typed class/method inspection failure, preserving the Python categories.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum CodeInspectionError {
    /// Class absent from every searched split/DEX.
    ClassNotFound { fqcn: String, searched: Vec<String> },
    /// More than one DEX defines the requested class.
    DuplicateClass {
        fqcn: String,
        locations: Vec<String>,
    },
    /// Bare method name matches overloads.
    AmbiguousMethod {
        selector: String,
        fqcn: String,
        signatures: Vec<String>,
    },
    /// No method matches the selector.
    MethodNotFound {
        selector: String,
        fqcn: String,
        signatures: Vec<String>,
    },
    /// A Dalvik descriptor was supplied with `--format java`.
    DescriptorWithJava(String),
    /// Usage-class failure with a preformatted message.
    Usage(String),
    /// Tool/decompiler failure (exit 4).
    Infrastructure(String),
}

impl CodeInspectionError {
    #[must_use]
    pub fn exit_code(&self) -> crate::models::ExitCode {
        match self {
            Self::Infrastructure(_) => crate::models::ExitCode::InfrastructureFailure,
            Self::ClassNotFound { .. }
            | Self::DuplicateClass { .. }
            | Self::AmbiguousMethod { .. }
            | Self::MethodNotFound { .. }
            | Self::DescriptorWithJava(_)
            | Self::Usage(_) => crate::models::ExitCode::UsageOrToolError,
        }
    }

    #[must_use]
    pub fn message(&self) -> String {
        match self {
            Self::ClassNotFound { fqcn, searched } => format!(
                "Class '{fqcn}' not found in artifact. Searched splits and DEX files: {}",
                python_list(searched)
            ),
            Self::DuplicateClass { fqcn, locations } => format!(
                "Duplicate class definitions found for '{fqcn}': {}",
                python_list(locations)
            ),
            Self::AmbiguousMethod {
                selector,
                fqcn,
                signatures,
            } => format!(
                "Ambiguous method name '{selector}' in class '{fqcn}'. Available overloads: {}",
                python_list(signatures)
            ),
            Self::MethodNotFound {
                selector,
                fqcn,
                signatures,
            } => format!(
                "Method '{selector}' not found in class '{fqcn}'. Available methods: {}",
                python_list(signatures)
            ),
            Self::DescriptorWithJava(selector) => format!(
                "Dalvik descriptors like '{selector}' cannot be used with --format java. Use bare method name."
            ),
            Self::Usage(message) | Self::Infrastructure(message) => message.clone(),
        }
    }
}

impl std::fmt::Display for CodeInspectionError {
    fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        formatter.write_str(&self.message())
    }
}

impl std::error::Error for CodeInspectionError {}

impl From<CodeInspectionError> for Error {
    fn from(error: CodeInspectionError) -> Self {
        match error.exit_code() {
            crate::models::ExitCode::InfrastructureFailure => {
                Error::infrastructure(error.message())
            }
            _ => Error::usage(error.message()),
        }
    }
}

fn python_list(items: &[String]) -> String {
    let quoted: Vec<String> = items.iter().map(|item| format!("'{item}'")).collect();
    format!("[{}]", quoted.join(", "))
}

/// Normalizes a class name into `(fqcn, descriptor)`.
#[must_use]
pub fn normalize_fqcn(name: &str) -> (String, String) {
    let clean = name.trim();
    if clean.starts_with('L') && clean.ends_with(';') {
        let fqcn = clean[1..clean.len() - 1].replace('/', ".");
        (fqcn, clean.to_string())
    } else {
        let fqcn = clean.replace('/', ".");
        let descriptor = format!("L{};", fqcn.replace('.', "/"));
        (fqcn, descriptor)
    }
}

/// A class definition inside one physical APK split.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DexLocation {
    pub split: String,
    pub dex_name: String,
    pub descriptor: String,
    pub apk_path: PathBuf,
}

/// One parsed method, with enough fields to reproduce declaration extraction.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ParsedMethod {
    pub name: String,
    pub signature: String,
    pub declaration: String,
    pub content: String,
}

fn zip_error(context: &str, error: zip::result::ZipError) -> Error {
    match error {
        zip::result::ZipError::Io(error) => Error::io(context, error),
        other => Error::invalid_artifact(format!("{context}: {other}")),
    }
}

fn is_dex_member(name: &str) -> bool {
    let Some(rest) = name.strip_prefix("classes") else {
        return false;
    };
    let Some(digits) = rest.strip_suffix(".dex") else {
        return false;
    };
    digits.bytes().all(|byte| byte.is_ascii_digit())
}

fn stream_entry_to_file<R: Read>(entry: &mut R, target: &mut File) -> Result<u64, Error> {
    let mut buffer = [0u8; archives::STREAM_BUFFER_BYTES];
    let mut written = 0u64;
    loop {
        let read = entry
            .read(&mut buffer)
            .map_err(|error| Error::io("read archive member", error))?;
        if read == 0 {
            break;
        }
        written += read as u64;
        if written > MAX_DEX_BYTES {
            return Err(Error::invalid_artifact(
                "DEX member exceeds the supported size bound",
            ));
        }
        target
            .write_all(&buffer[..read])
            .map_err(|error| Error::io("write extract", error))?;
    }
    target
        .flush()
        .map_err(|error| Error::io("flush extract", error))?;
    Ok(written)
}

fn extract_dex<R: Read + std::io::Seek>(
    archive: &mut ZipArchive<R>,
    dex_name: &str,
    destination: &Path,
) -> Result<(), Error> {
    archives::validate_member_name(dex_name, false).map_err(Error::from)?;
    let mut member = archive
        .by_name(dex_name)
        .map_err(|error| zip_error("open DEX member", error))?;
    let mut file = File::create(destination)
        .map_err(|error| Error::io(format!("create {}", destination.display()), error))?;
    stream_entry_to_file(&mut member, &mut file)?;
    Ok(())
}

/// Locates a class definition across `classes*.dex` entries of materialized
/// splits. Search order is materialized-apk order, then archive order.
pub fn locate_class(
    materialized_apks: &[MaterializedApk],
    fqcn: &str,
    allow_missing: bool,
    executor: &dyn ToolExecutor,
) -> Result<Option<DexLocation>, CodeInspectionError> {
    let (_, descriptor) = normalize_fqcn(fqcn);
    let temp = TempDir::new().map_err(|error| {
        CodeInspectionError::Infrastructure(format!("create temp dir: {error}"))
    })?;
    let mut matches = Vec::new();
    let mut searched = Vec::new();

    for materialized in materialized_apks {
        let file = File::open(&materialized.path).map_err(|error| {
            CodeInspectionError::Infrastructure(format!(
                "open {}: {error}",
                materialized.path.display()
            ))
        })?;
        let mut archive = ZipArchive::new(file).map_err(|error| {
            CodeInspectionError::Infrastructure(format!(
                "open archive {}: {error}",
                materialized.path.display()
            ))
        })?;
        let mut dex_names = Vec::new();
        for index in 0..archive.len() {
            let entry = archive.by_index(index).map_err(|error| {
                CodeInspectionError::Infrastructure(format!("read archive metadata: {error}"))
            })?;
            let name = entry
                .name()
                .map_err(|error| {
                    CodeInspectionError::Infrastructure(format!(
                        "decode archive entry name: {error}"
                    ))
                })?
                .into_owned();
            if is_dex_member(&name) {
                dex_names.push(name);
            }
        }

        for dex_name in dex_names {
            searched.push(format!("{}:{}", materialized.split_name, dex_name));
            let extracted = temp
                .path()
                .join(format!("{}_{}", materialized.split_name, dex_name));
            extract_dex(&mut archive, &dex_name, &extracted).map_err(|error| {
                CodeInspectionError::Infrastructure(format!("extract {dex_name}: {error}"))
            })?;
            let args = vec![extracted.to_string_lossy().into_owned()];
            match executor.execute(ToolKind::Dexdump, &args) {
                Ok(result) => {
                    if result.exit_code == Some(0) {
                        let descriptors = parse_dexdump_class_descriptors(&result.stdout);
                        if descriptors.contains(&descriptor) {
                            matches.push(DexLocation {
                                split: materialized.split_name.clone(),
                                dex_name: dex_name.clone(),
                                descriptor: descriptor.clone(),
                                apk_path: materialized.path.clone(),
                            });
                        }
                    }
                }
                Err(error) => {
                    let _ = fs::remove_file(&extracted);
                    return Err(match error {
                        Error::Usage(message) => CodeInspectionError::Usage(message),
                        other => CodeInspectionError::Infrastructure(other.message()),
                    });
                }
            }
            let _ = fs::remove_file(&extracted);
        }
    }

    if matches.is_empty() {
        if allow_missing {
            return Ok(None);
        }
        return Err(CodeInspectionError::ClassNotFound {
            fqcn: normalize_fqcn(fqcn).0,
            searched,
        });
    }
    if matches.len() > 1 {
        let locations = matches
            .iter()
            .map(|location| format!("{}:{}", location.split, location.dex_name))
            .collect();
        return Err(CodeInspectionError::DuplicateClass {
            fqcn: normalize_fqcn(fqcn).0,
            locations,
        });
    }
    Ok(matches.pop())
}

/// Parses `Class descriptor  : 'L…;'` lines from dexdump output.
#[must_use]
pub fn parse_dexdump_class_descriptors(output: &str) -> HashSet<String> {
    let pattern = Regex::new(r"Class descriptor\s+:\s+'([^']+)'").expect("static descriptor regex");
    pattern
        .captures_iter(output)
        .filter_map(|captures| captures.get(1).map(|value| value.as_str().to_string()))
        .collect()
}

fn truncate_chars(text: &str, limit: usize) -> String {
    text.chars().take(limit).collect()
}

/// Extracts one class as Smali using baksmali.
pub fn extract_smali_class(
    executor: &dyn ToolExecutor,
    location: &DexLocation,
) -> Result<String, CodeInspectionError> {
    let (_, descriptor) = normalize_fqcn(&location.descriptor);
    let temp = TempDir::new().map_err(|error| {
        CodeInspectionError::Infrastructure(format!("create temp dir: {error}"))
    })?;
    let extracted = temp.path().join(&location.dex_name);

    let file = File::open(&location.apk_path).map_err(|error| {
        CodeInspectionError::Infrastructure(format!(
            "open {}: {error}",
            location.apk_path.display()
        ))
    })?;
    let mut archive = ZipArchive::new(file)
        .map_err(|error| CodeInspectionError::Infrastructure(format!("open archive: {error}")))?;
    extract_dex(&mut archive, &location.dex_name, &extracted)
        .map_err(|error| CodeInspectionError::Infrastructure(error.message()))?;
    drop(archive);

    let output_dir = temp.path().join("smali_out");
    let args = vec![
        "d".to_string(),
        extracted.to_string_lossy().into_owned(),
        "--classes".to_string(),
        descriptor.clone(),
        "--code-offsets".to_string(),
        "-o".to_string(),
        output_dir.to_string_lossy().into_owned(),
    ];
    let result = executor
        .execute(ToolKind::Baksmali, &args)
        .map_err(|error| CodeInspectionError::Infrastructure(error.message()))?;
    if result.exit_code != Some(0) {
        return Err(CodeInspectionError::Infrastructure(format!(
            "baksmali failed (code {}): {}",
            result.exit_code.unwrap_or(-1),
            truncate_chars(&result.stderr, 300)
        )));
    }

    let relative = descriptor[1..descriptor.len() - 1].to_string() + ".smali";
    let expected = output_dir.join(relative);
    let smali_file = if expected.is_file() {
        expected
    } else {
        let mut found = Vec::new();
        collect_smali_files(&output_dir, &mut found);
        found.sort();
        found.into_iter().next().ok_or_else(|| {
            CodeInspectionError::Infrastructure(format!(
                "baksmali did not emit expected smali file for {descriptor}"
            ))
        })?
    };
    let bytes = fs::read(&smali_file).map_err(|error| {
        CodeInspectionError::Infrastructure(format!("read {}: {error}", smali_file.display()))
    })?;
    String::from_utf8(bytes).map_err(|error| {
        CodeInspectionError::Infrastructure(format!("smali output is not UTF-8: {error}"))
    })
}

fn collect_smali_files(directory: &Path, found: &mut Vec<PathBuf>) {
    let Ok(entries) = fs::read_dir(directory) else {
        return;
    };
    for entry in entries.flatten() {
        let path = entry.path();
        if path.is_dir() {
            collect_smali_files(&path, found);
        } else if path
            .extension()
            .is_some_and(|extension| extension == "smali")
        {
            found.push(path);
        }
    }
}

/// Decompiles one class with pinned JADX.
pub fn extract_java_class(
    executor: &dyn ToolExecutor,
    location: &DexLocation,
) -> Result<String, CodeInspectionError> {
    let (fqcn, _) = normalize_fqcn(&location.descriptor);
    let temp = TempDir::new().map_err(|error| {
        CodeInspectionError::Infrastructure(format!("create temp dir: {error}"))
    })?;
    let out_file = temp.path().join("Output.java");
    let args = vec![
        "--single-class".to_string(),
        fqcn,
        "--single-class-output".to_string(),
        out_file.to_string_lossy().into_owned(),
        "--show-bad-code".to_string(),
        "--no-res".to_string(),
        "--output-format".to_string(),
        "java".to_string(),
        location.apk_path.to_string_lossy().into_owned(),
    ];
    let result = executor
        .execute(ToolKind::Jadx, &args)
        .map_err(|error| CodeInspectionError::Infrastructure(error.message()))?;
    let code = result.exit_code.unwrap_or(-1);
    if !matches!(result.exit_code, Some(0) | Some(3)) || !out_file.is_file() {
        return Err(CodeInspectionError::Infrastructure(format!(
            "JADX decompilation failed (code {code}): {}",
            truncate_chars(&result.stderr, 300)
        )));
    }
    let bytes = fs::read(&out_file).map_err(|error| {
        CodeInspectionError::Infrastructure(format!("read {}: {error}", out_file.display()))
    })?;
    String::from_utf8(bytes).map_err(|error| {
        CodeInspectionError::Infrastructure(format!("JADX output is not UTF-8: {error}"))
    })
}

/// Parses `.method` blocks from Smali text.
#[must_use]
pub fn parse_smali_methods(smali_text: &str) -> Vec<ParsedMethod> {
    let pattern = Regex::new(
        r"(?ms)^(\.method\s+.*?([^\s(]+)\(([^)]*)\)([^\s]+))\s*$(.*?)^(\.end\s+method)\s*$",
    )
    .expect("static smali method regex");
    pattern
        .captures_iter(smali_text)
        .filter_map(|captures| {
            let declaration = captures.get(1)?.as_str().trim().to_string();
            let name = captures.get(2)?.as_str().to_string();
            let params = captures.get(3)?.as_str();
            let ret = captures.get(4)?.as_str();
            Some(ParsedMethod {
                signature: format!("{name}({params}){ret}"),
                name,
                declaration,
                content: captures.get(0)?.as_str().trim().to_string(),
            })
        })
        .collect()
}

fn rfind_char(haystack: &[char], needle: char, end: usize) -> Option<usize> {
    (0..end).rev().find(|index| haystack[*index] == needle)
}

/// Lexically parses Java method boundaries, balancing braces while skipping
/// string/char literals and both comment forms. Indices are character based,
/// matching Python string slicing.
#[must_use]
pub fn parse_java_methods(java_text: &str) -> Vec<ParsedMethod> {
    let original: Vec<char> = java_text.chars().collect();
    let n = original.len();
    let mut cleaned: Vec<char> = Vec::with_capacity(n);
    let mut index = 0usize;
    let mut in_line_comment = false;
    let mut in_block_comment = false;
    let mut in_string = false;
    let mut in_char = false;

    while index < n {
        let current = original[index];
        let next = if index + 1 < n {
            original[index + 1]
        } else {
            '\0'
        };

        if in_line_comment {
            if current == '\n' {
                in_line_comment = false;
                cleaned.push('\n');
            } else {
                cleaned.push(' ');
            }
            index += 1;
            continue;
        }
        if in_block_comment {
            if current == '*' && next == '/' {
                in_block_comment = false;
                cleaned.push(' ');
                cleaned.push(' ');
                index += 2;
            } else if current == '\n' {
                cleaned.push('\n');
                index += 1;
            } else {
                cleaned.push(' ');
                index += 1;
            }
            continue;
        }
        if in_string {
            if current == '\\' && index + 1 < n {
                cleaned.push(' ');
                cleaned.push(' ');
                index += 2;
            } else if current == '"' {
                in_string = false;
                cleaned.push('"');
                index += 1;
            } else if current == '\n' {
                cleaned.push('\n');
                index += 1;
            } else {
                cleaned.push(' ');
                index += 1;
            }
            continue;
        }
        if in_char {
            if current == '\\' && index + 1 < n {
                cleaned.push(' ');
                cleaned.push(' ');
                index += 2;
            } else if current == '\'' {
                in_char = false;
                cleaned.push('\'');
                index += 1;
            } else if current == '\n' {
                cleaned.push('\n');
                index += 1;
            } else {
                cleaned.push(' ');
                index += 1;
            }
            continue;
        }

        if current == '/' && next == '/' {
            in_line_comment = true;
            cleaned.push(' ');
            cleaned.push(' ');
            index += 2;
            continue;
        }
        if current == '/' && next == '*' {
            in_block_comment = true;
            cleaned.push(' ');
            cleaned.push(' ');
            index += 2;
            continue;
        }
        if current == '"' {
            in_string = true;
            cleaned.push('"');
            index += 1;
            continue;
        }
        if current == '\'' {
            in_char = true;
            cleaned.push('\'');
            index += 1;
            continue;
        }
        cleaned.push(current);
        index += 1;
    }

    let class_start = cleaned.iter().position(|character| *character == '{');
    let Some(class_start) = class_start else {
        return Vec::new();
    };

    let signature_pattern = Regex::new(r"([A-Za-z0-9_$]+)\s*\([^)]*\)\s*(?:throws\s+[^{]+)?$")
        .expect("static java signature regex");

    let mut methods = Vec::new();
    let mut depth = 1usize;
    let mut method_start_index: Option<usize> = None;
    let mut method_name = String::new();
    let mut method_signature = String::new();
    let mut method_declaration = String::new();
    let mut cursor = class_start + 1;

    while cursor < n {
        let character = cleaned[cursor];
        if character == '{' {
            depth += 1;
            if depth == 2 {
                let header_start = method_start_index.unwrap_or(class_start + 1);
                let header: String = cleaned[header_start..cursor].iter().collect();
                let trimmed = header.trim_end();
                if let Some(captures) = signature_pattern.captures(trimmed) {
                    let whole = captures.get(0).expect("whole match");
                    method_name = captures
                        .get(1)
                        .map(|value| value.as_str().to_string())
                        .unwrap_or_default();
                    method_signature = whole.as_str().trim().to_string();
                    let signature_start = trimmed[..whole.start()].chars().count();
                    let last_semi =
                        rfind_char(&cleaned[header_start..cursor], ';', signature_start);
                    let last_brace =
                        rfind_char(&cleaned[header_start..cursor], '}', signature_start);
                    let boundary = match (last_semi, last_brace) {
                        (Some(left), Some(right)) => Some(left.max(right)),
                        (Some(value), None) | (None, Some(value)) => Some(value),
                        (None, None) => None,
                    };
                    let mut start_offset = boundary.map_or(0, |value| value + 1);
                    while start_offset < header.chars().count()
                        && header
                            .chars()
                            .nth(start_offset)
                            .is_some_and(|c| c.is_whitespace())
                    {
                        start_offset += 1;
                    }
                    let declaration_start = header_start + start_offset;
                    method_declaration = original[declaration_start..cursor]
                        .iter()
                        .collect::<String>()
                        .trim()
                        .to_string();
                    method_start_index = Some(declaration_start);
                } else {
                    method_start_index = None;
                }
            }
        } else if character == '}' {
            depth = depth.saturating_sub(1);
            if depth == 1 && !method_name.is_empty() {
                if let Some(start) = method_start_index {
                    let content = original[start..=cursor]
                        .iter()
                        .collect::<String>()
                        .trim()
                        .to_string();
                    methods.push(ParsedMethod {
                        name: std::mem::take(&mut method_name),
                        signature: std::mem::take(&mut method_signature),
                        declaration: std::mem::take(&mut method_declaration),
                        content,
                    });
                }
                method_start_index = Some(cursor + 1);
            } else if depth == 1 {
                method_start_index = Some(cursor + 1);
            }
        }
        cursor += 1;
    }

    methods
}

/// Extracts a method by bare name or exact Smali descriptor.
pub fn extract_method_from_class(
    code_text: &str,
    method_selector: &str,
    fmt: &str,
    fqcn: &str,
) -> Result<String, CodeInspectionError> {
    if fmt == "java" && method_selector.contains('(') {
        return Err(CodeInspectionError::DescriptorWithJava(
            method_selector.to_string(),
        ));
    }
    let methods = if fmt == "smali" {
        parse_smali_methods(code_text)
    } else {
        parse_java_methods(code_text)
    };
    let matching: Vec<&ParsedMethod> = if method_selector.contains('(') {
        methods
            .iter()
            .filter(|method| method.signature == method_selector)
            .collect()
    } else {
        methods
            .iter()
            .filter(|method| method.name == method_selector)
            .collect()
    };
    if matching.is_empty() {
        return Err(CodeInspectionError::MethodNotFound {
            selector: method_selector.to_string(),
            fqcn: fqcn.to_string(),
            signatures: methods
                .iter()
                .map(|method| method.signature.clone())
                .collect(),
        });
    }
    if matching.len() > 1 {
        return Err(CodeInspectionError::AmbiguousMethod {
            selector: method_selector.to_string(),
            fqcn: fqcn.to_string(),
            signatures: matching
                .iter()
                .map(|method| method.signature.clone())
                .collect(),
        });
    }
    Ok(matching[0].content.clone())
}

// ---------------------------------------------------------------------------
// Unified diff (port of CPython difflib.SequenceMatcher + unified_diff)
// ---------------------------------------------------------------------------

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
struct Match {
    a: usize,
    b: usize,
    size: usize,
}

struct SequenceMatcher<'a> {
    a: &'a [String],
    b: &'a [String],
    b2j: HashMap<&'a str, Vec<usize>>,
}

impl<'a> SequenceMatcher<'a> {
    fn new(a: &'a [String], b: &'a [String]) -> Self {
        let mut b2j: HashMap<&str, Vec<usize>> = HashMap::new();
        for (index, line) in b.iter().enumerate() {
            b2j.entry(line.as_str()).or_default().push(index);
        }
        if b.len() >= 200 {
            let threshold = b.len() / 100 + 1;
            b2j.retain(|_, positions| positions.len() <= threshold);
        }
        Self { a, b, b2j }
    }

    fn find_longest_match(&self, alo: usize, ahi: usize, blo: usize, bhi: usize) -> Match {
        let mut best = Match {
            a: alo,
            b: blo,
            size: 0,
        };
        let mut j2len: HashMap<usize, usize> = HashMap::new();
        for i in alo..ahi {
            let mut new_j2len: HashMap<usize, usize> = HashMap::new();
            if let Some(positions) = self.b2j.get(self.a[i].as_str()) {
                for &j in positions {
                    if j < blo {
                        continue;
                    }
                    if j >= bhi {
                        break;
                    }
                    let length = if j == 0 {
                        1
                    } else {
                        j2len.get(&(j - 1)).copied().unwrap_or(0) + 1
                    };
                    new_j2len.insert(j, length);
                    if length > best.size {
                        best = Match {
                            a: i + 1 - length,
                            b: j + 1 - length,
                            size: length,
                        };
                    }
                }
            }
            j2len = new_j2len;
        }

        while best.a > alo && best.b > blo && self.a[best.a - 1] == self.b[best.b - 1] {
            best.a -= 1;
            best.b -= 1;
            best.size += 1;
        }
        while best.a + best.size < ahi
            && best.b + best.size < bhi
            && self.a[best.a + best.size] == self.b[best.b + best.size]
        {
            best.size += 1;
        }
        best
    }

    fn matching_blocks(&self) -> Vec<Match> {
        let la = self.a.len();
        let lb = self.b.len();
        let mut queue = vec![(0usize, la, 0usize, lb)];
        let mut blocks = Vec::new();
        while let Some((alo, ahi, blo, bhi)) = queue.pop() {
            let found = self.find_longest_match(alo, ahi, blo, bhi);
            if found.size > 0 {
                blocks.push(found);
                if alo < found.a && blo < found.b {
                    queue.push((alo, found.a, blo, found.b));
                }
                if found.a + found.size < ahi && found.b + found.size < bhi {
                    queue.push((found.a + found.size, ahi, found.b + found.size, bhi));
                }
            }
        }
        blocks.sort();

        let mut collapsed: Vec<Match> = Vec::new();
        let mut i1 = 0usize;
        let mut j1 = 0usize;
        let mut k1 = 0usize;
        for block in blocks {
            if i1 + k1 == block.a && j1 + k1 == block.b {
                k1 += block.size;
            } else {
                if k1 > 0 {
                    collapsed.push(Match {
                        a: i1,
                        b: j1,
                        size: k1,
                    });
                }
                i1 = block.a;
                j1 = block.b;
                k1 = block.size;
            }
        }
        if k1 > 0 {
            collapsed.push(Match {
                a: i1,
                b: j1,
                size: k1,
            });
        }
        collapsed.push(Match {
            a: la,
            b: lb,
            size: 0,
        });
        collapsed
    }

    fn opcodes(&self) -> Vec<Opcode> {
        let mut result = Vec::new();
        let mut i = 0usize;
        let mut j = 0usize;
        for block in self.matching_blocks() {
            let tag = if i < block.a && j < block.b {
                Some(Tag::Replace)
            } else if i < block.a {
                Some(Tag::Delete)
            } else if j < block.b {
                Some(Tag::Insert)
            } else {
                None
            };
            if let Some(tag) = tag {
                result.push(Opcode {
                    tag,
                    i1: i,
                    i2: block.a,
                    j1: j,
                    j2: block.b,
                });
            }
            i = block.a + block.size;
            j = block.b + block.size;
            if block.size > 0 {
                result.push(Opcode {
                    tag: Tag::Equal,
                    i1: block.a,
                    i2: i,
                    j1: block.b,
                    j2: j,
                });
            }
        }
        result
    }

    fn grouped_opcodes(&self, context: usize) -> Vec<Vec<Opcode>> {
        let mut codes = self.opcodes();
        if codes.is_empty() {
            codes.push(Opcode {
                tag: Tag::Equal,
                i1: 0,
                i2: 1,
                j1: 0,
                j2: 1,
            });
        }
        if codes[0].tag == Tag::Equal {
            let first = &mut codes[0];
            first.i1 = first.i1.max(first.i2.saturating_sub(context));
            first.j1 = first.j1.max(first.j2.saturating_sub(context));
        }
        if codes.last().map(|code| code.tag) == Some(Tag::Equal) {
            let last = codes.last_mut().expect("non-empty opcodes");
            last.i2 = last.i2.min(last.i1 + context);
            last.j2 = last.j2.min(last.j1 + context);
        }

        let double = context + context;
        let mut groups = Vec::new();
        let mut group: Vec<Opcode> = Vec::new();
        for mut code in codes {
            if code.tag == Tag::Equal && code.i2 - code.i1 > double {
                group.push(Opcode {
                    tag: code.tag,
                    i1: code.i1,
                    i2: (code.i1 + context).min(code.i2),
                    j1: code.j1,
                    j2: (code.j1 + context).min(code.j2),
                });
                groups.push(std::mem::take(&mut group));
                code.i1 = (code.i2.saturating_sub(context)).max(code.i1);
                code.j1 = (code.j2.saturating_sub(context)).max(code.j1);
            }
            group.push(code);
        }
        if !group.is_empty() && !(group.len() == 1 && group[0].tag == Tag::Equal) {
            groups.push(group);
        }
        groups
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Tag {
    Replace,
    Delete,
    Insert,
    Equal,
}

#[derive(Debug, Clone, Copy)]
struct Opcode {
    tag: Tag,
    i1: usize,
    i2: usize,
    j1: usize,
    j2: usize,
}

fn format_range_unified(start: usize, stop: usize) -> String {
    let mut beginning = start + 1;
    let length = stop - start;
    if length == 1 {
        return beginning.to_string();
    }
    if length == 0 {
        beginning -= 1;
    }
    format!("{beginning},{length}")
}

/// Python `str.splitlines(keepends=True)` for the line-break characters
/// CPython recognizes.
#[must_use]
pub fn split_lines_keep_ends(text: &str) -> Vec<String> {
    let mut lines = Vec::new();
    let mut start = 0usize;
    let mut chars = text.char_indices().peekable();
    while let Some((index, character)) = chars.next() {
        let is_break = matches!(
            character,
            '\n' | '\r'
                | '\u{000b}'
                | '\u{000c}'
                | '\u{001c}'
                | '\u{001d}'
                | '\u{001e}'
                | '\u{0085}'
                | '\u{2028}'
                | '\u{2029}'
        );
        if !is_break {
            continue;
        }
        let mut end = index + character.len_utf8();
        if character == '\r' {
            if let Some((next_index, '\n')) = chars.peek().copied() {
                end = next_index + 1;
                chars.next();
            }
        }
        lines.push(text[start..end].to_string());
        start = end;
    }
    if start < text.len() {
        lines.push(text[start..].to_string());
    }
    lines
}

/// Produces the exact byte sequence of Python's `difflib.unified_diff`.
#[must_use]
pub fn unified_diff(
    old_lines: &[String],
    new_lines: &[String],
    fromfile: &str,
    tofile: &str,
    context: usize,
) -> Vec<String> {
    let matcher = SequenceMatcher::new(old_lines, new_lines);
    let mut output = Vec::new();
    let mut started = false;
    for group in matcher.grouped_opcodes(context) {
        if !started {
            started = true;
            output.push(format!("--- {fromfile}\n"));
            output.push(format!("+++ {tofile}\n"));
        }
        let first = group[0];
        let last = group[group.len() - 1];
        output.push(format!(
            "@@ -{} +{} @@\n",
            format_range_unified(first.i1, last.i2),
            format_range_unified(first.j1, last.j2)
        ));
        for code in group {
            match code.tag {
                Tag::Equal => {
                    for line in &old_lines[code.i1..code.i2] {
                        output.push(format!(" {line}"));
                    }
                }
                Tag::Replace | Tag::Delete => {
                    for line in &old_lines[code.i1..code.i2] {
                        output.push(format!("-{line}"));
                    }
                    if code.tag == Tag::Replace {
                        for line in &new_lines[code.j1..code.j2] {
                            output.push(format!("+{line}"));
                        }
                    }
                }
                Tag::Insert => {
                    for line in &new_lines[code.j1..code.j2] {
                        output.push(format!("+{line}"));
                    }
                }
            }
        }
    }
    output
}

/// Applies Python's unified-diff truncation rule.
#[must_use]
pub fn truncate_diff(mut lines: Vec<String>) -> Vec<String> {
    if lines.len() > DIFF_LINE_LIMIT {
        lines.truncate(DIFF_LINE_LIMIT);
        lines.push(DIFF_TRUNCATION_MARKER.to_string());
    }
    lines
}

/// Whether stdout is a terminal; only then may the CLI color diff output.
#[must_use]
pub fn stdout_is_tty() -> bool {
    use std::io::IsTerminal;
    std::io::stdout().is_terminal()
}

/// Applies the Python color rule to diff lines. `use_color` is supplied by the
/// CLI from `stdout.is_terminal()` so non-TTY runs are byte-identical.
#[must_use]
pub fn format_colored_diff(diff_lines: &[String], use_color: bool) -> String {
    let mut output = Vec::with_capacity(diff_lines.len());
    for line in diff_lines {
        let clean = line.trim_end_matches(['\r', '\n']);
        if !use_color {
            output.push(clean.to_string());
        } else if clean.starts_with("+++") || clean.starts_with("---") {
            output.push(format!("\u{1b}[1m{clean}\u{1b}[0m"));
        } else if clean.starts_with('+') {
            output.push(format!("\u{1b}[32m{clean}\u{1b}[0m"));
        } else if clean.starts_with('-') {
            output.push(format!("\u{1b}[31m{clean}\u{1b}[0m"));
        } else if clean.starts_with('@') {
            output.push(format!("\u{1b}[36m{clean}\u{1b}[0m"));
        } else {
            output.push(clean.to_string());
        }
    }
    output.join("\n")
}

/// Result of `inspect-code` formatting, ready for the CLI to print.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CodeInspectionOutput {
    pub text: String,
}

impl CodeInspectionOutput {
    fn from_text(text: String) -> Self {
        Self { text }
    }
}

/// Parameters for one `inspect-code` invocation.
#[derive(Debug, Clone)]
pub struct InspectCodeRequest {
    pub artifact: PathBuf,
    pub fqcn: String,
    pub method: Option<String>,
    pub format: String,
    pub compare_artifact: Option<PathBuf>,
    pub use_color: bool,
}

/// Runs standalone inspection or two-artifact comparison and returns the text
/// the CLI prints. Added/removed/missing/tool-unavailable states are encoded as
/// messages rather than errors, matching the Python handler.
pub fn inspect_or_compare_code(
    request: &InspectCodeRequest,
    executor: &dyn ToolExecutor,
    inspector: &dyn ArtifactInspector,
) -> Result<CodeInspectionOutput, Error> {
    let (clean_fqcn, _) = normalize_fqcn(&request.fqcn);
    if request.compare_artifact.is_none() {
        let inspection = inspector.inspect(&request.artifact)?;
        let materialized = archives::materialize_artifact_apks(
            &request.artifact,
            &inspection.splits,
            inspection.container_type == crate::models::ContainerType::Apk,
        )?;
        let location = locate_class(materialized.as_slice(), &clean_fqcn, false, executor)?
            .ok_or_else(|| Error::usage("Class not found"))?;
        let full_code = if request.format == "smali" {
            extract_smali_class(executor, &location)?
        } else {
            extract_java_class(executor, &location)?
        };
        let mut text = format!("Location: {}:{}\n", location.split, location.dex_name);
        if let Some(method) = &request.method {
            let target =
                extract_method_from_class(&full_code, method, &request.format, &clean_fqcn)?;
            text.push_str(&target);
            text.push('\n');
        } else {
            text.push_str(&full_code);
            text.push('\n');
        }
        return Ok(CodeInspectionOutput::from_text(text));
    }

    let unpatched = request
        .compare_artifact
        .as_ref()
        .expect("comparison path checked");
    let unpatched_inspection = inspector.inspect(unpatched)?;
    let patched_inspection = inspector.inspect(&request.artifact)?;
    let old_materialized = archives::materialize_artifact_apks(
        unpatched,
        &unpatched_inspection.splits,
        unpatched_inspection.container_type == crate::models::ContainerType::Apk,
    )?;
    let new_materialized = archives::materialize_artifact_apks(
        &request.artifact,
        &patched_inspection.splits,
        patched_inspection.container_type == crate::models::ContainerType::Apk,
    )?;
    let old_location = locate_class(old_materialized.as_slice(), &clean_fqcn, true, executor)?;
    let new_location = locate_class(new_materialized.as_slice(), &clean_fqcn, true, executor)?;

    match (old_location, new_location) {
        (None, None) => Err(Error::usage(format!(
            "Class '{clean_fqcn}' not found in either artifact."
        ))),
        (None, Some(location)) => Ok(CodeInspectionOutput::from_text(format!(
            "Class '{clean_fqcn}' was added in patched artifact ({}:{}).\n",
            location.split, location.dex_name
        ))),
        (Some(location), None) => Ok(CodeInspectionOutput::from_text(format!(
            "Class '{clean_fqcn}' was removed in patched artifact (was in {}:{}).\n",
            location.split, location.dex_name
        ))),
        (Some(old_location), Some(new_location)) => {
            let old_code = if request.format == "smali" {
                extract_smali_class(executor, &old_location)?
            } else {
                extract_java_class(executor, &old_location)?
            };
            let new_code = if request.format == "smali" {
                extract_smali_class(executor, &new_location)?
            } else {
                extract_java_class(executor, &new_location)?
            };
            let selector_label = match &request.method {
                Some(method) => format!("{clean_fqcn}:{method}"),
                None => clean_fqcn.clone(),
            };

            let (target_old, target_new) = if let Some(method) = &request.method {
                let old_method =
                    extract_method_from_class(&old_code, method, &request.format, &clean_fqcn);
                let new_method =
                    extract_method_from_class(&new_code, method, &request.format, &clean_fqcn);
                match (old_method, new_method) {
                    (
                        Err(CodeInspectionError::MethodNotFound { .. }),
                        Err(CodeInspectionError::MethodNotFound { .. }),
                    ) => {
                        return Err(Error::usage(format!(
                            "Method '{method}' not found in class '{clean_fqcn}' in either artifact."
                        )));
                    }
                    (Err(CodeInspectionError::MethodNotFound { .. }), Ok(_)) => {
                        return Ok(CodeInspectionOutput::from_text(format!(
                            "Method '{selector_label}' was added in patched artifact.\n"
                        )));
                    }
                    (Ok(_), Err(CodeInspectionError::MethodNotFound { .. })) => {
                        return Ok(CodeInspectionOutput::from_text(format!(
                            "Method '{selector_label}' was removed in patched artifact.\n"
                        )));
                    }
                    (Ok(old), Ok(new)) => (old, new),
                    (Err(CodeInspectionError::MethodNotFound { .. }), Err(error)) => {
                        return Err(error.into());
                    }
                    (Err(error), _) | (_, Err(error)) => return Err(error.into()),
                }
            } else {
                (old_code, new_code)
            };

            if target_old == target_new {
                return Ok(CodeInspectionOutput::from_text(format!(
                    "Unchanged: {selector_label}\n"
                )));
            }
            let old_label = format!(
                "unpatched/{}:{}:{}",
                old_location.split, old_location.dex_name, selector_label
            );
            let new_label = format!(
                "patched/{}:{}:{}",
                new_location.split, new_location.dex_name, selector_label
            );
            let old_lines = split_lines_keep_ends(&target_old);
            let new_lines = split_lines_keep_ends(&target_new);
            let diff = truncate_diff(unified_diff(
                &old_lines, &new_lines, &old_label, &new_label, 3,
            ));
            Ok(CodeInspectionOutput::from_text(format!(
                "{}\n",
                format_colored_diff(&diff, request.use_color)
            )))
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::models::ArtifactInspection;
    use sha2::Digest;
    use std::cell::RefCell;
    use std::collections::BTreeMap;
    use std::io::Cursor;
    use zip::write::SimpleFileOptions;
    use zip::{CompressionMethod, ZipWriter};

    type Handler = Box<dyn Fn(ToolKind, &[String]) -> Result<ToolResult, Error>>;

    struct FakeExecutor {
        available: HashSet<ToolKind>,
        versions: BTreeMap<String, String>,
        calls: RefCell<Vec<(ToolKind, Vec<String>)>>,
        handler: Handler,
    }

    impl FakeExecutor {
        fn new(
            available: &[ToolKind],
            handler: impl Fn(ToolKind, &[String]) -> Result<ToolResult, Error> + 'static,
        ) -> Self {
            Self {
                available: available.iter().copied().collect(),
                versions: BTreeMap::new(),
                calls: RefCell::new(Vec::new()),
                handler: Box::new(handler),
            }
        }

        fn calls(&self) -> Vec<(ToolKind, Vec<String>)> {
            self.calls.borrow().clone()
        }
    }

    impl ToolExecutor for FakeExecutor {
        fn is_available(&self, tool: ToolKind) -> bool {
            self.available.contains(&tool)
        }

        fn version(&self, tool: &str) -> Option<String> {
            self.versions.get(tool).cloned()
        }

        fn execute(&self, tool: ToolKind, args: &[String]) -> Result<ToolResult, Error> {
            self.calls.borrow_mut().push((tool, args.to_vec()));
            (self.handler)(tool, args)
        }
    }

    fn write_zip(path: &Path, entries: &[(&str, &[u8])]) {
        let mut writer = ZipWriter::new(File::create(path).expect("create zip"));
        let options = SimpleFileOptions::default().compression_method(CompressionMethod::Stored);
        for (name, data) in entries {
            writer.start_file(*name, options).expect("start file");
            writer.write_all(data).expect("write member");
        }
        writer.finish().expect("finish zip");
    }

    fn inspection() -> ArtifactInspection {
        serde_json::from_str(
            r#"{
                "filePath": "app.apk",
                "containerType": "APK",
                "fileSize": 1,
                "sha256": "ab",
                "packageName": "com.example",
                "versionName": "1.0",
                "versionCode": 1
            }"#,
        )
        .expect("inspection fixture")
    }

    fn ok(stdout: &str) -> Result<ToolResult, Error> {
        Ok(ToolResult {
            exit_code: Some(0),
            stdout: stdout.to_string(),
            stderr: String::new(),
        })
    }

    #[test]
    fn normalize_fqcn_accepts_both_spellings() {
        assert_eq!(
            normalize_fqcn("com.example.app.MyClass"),
            (
                "com.example.app.MyClass".to_string(),
                "Lcom/example/app/MyClass;".to_string()
            )
        );
        assert_eq!(
            normalize_fqcn("Lcom/example/app/MyClass;"),
            (
                "com.example.app.MyClass".to_string(),
                "Lcom/example/app/MyClass;".to_string()
            )
        );
    }

    #[test]
    fn locate_class_searches_split_apk_multidex_in_order() {
        let temp = TempDir::new().expect("temp");
        let apk = temp.path().join("base.apk");
        write_zip(&apk, &[("classes.dex", b"dex1"), ("classes2.dex", b"dex2")]);
        let materialized = vec![MaterializedApk {
            path: apk.clone(),
            container_member: None,
            split_name: "base".to_string(),
            is_base: true,
        }];
        let executor = FakeExecutor::new(&[ToolKind::Dexdump], |_tool, args| {
            let bytes = fs::read(&args[0]).expect("read dex");
            if bytes == b"dex2" {
                ok("Class descriptor  : 'Lcom/example/Target;'\n")
            } else {
                ok("Class descriptor  : 'Lcom/example/Other;'\n")
            }
        });
        let location = locate_class(&materialized, "com.example.Target", false, &executor)
            .expect("locate")
            .expect("present");
        assert_eq!(location.split, "base");
        assert_eq!(location.dex_name, "classes2.dex");
        assert_eq!(location.descriptor, "Lcom/example/Target;");
    }

    #[test]
    fn locate_class_missing_and_duplicate_states_are_distinct() {
        let temp = TempDir::new().expect("temp");
        let apk = temp.path().join("base.apk");
        write_zip(&apk, &[("classes.dex", b"dex1"), ("classes2.dex", b"dex2")]);
        let materialized = vec![MaterializedApk {
            path: apk,
            container_member: None,
            split_name: "base".to_string(),
            is_base: true,
        }];
        let empty = FakeExecutor::new(&[ToolKind::Dexdump], |_tool, _args| ok(""));
        assert!(
            locate_class(&materialized, "com.example.Target", true, &empty)
                .expect("allow missing")
                .is_none()
        );
        let missing =
            locate_class(&materialized, "com.example.Target", false, &empty).expect_err("missing");
        assert!(matches!(missing, CodeInspectionError::ClassNotFound { .. }));
        assert!(missing.message().contains("not found in artifact"));

        let duplicate = FakeExecutor::new(&[ToolKind::Dexdump], |_tool, _args| {
            ok("Class descriptor  : 'Lcom/example/Target;'\n")
        });
        let error = locate_class(&materialized, "com.example.Target", false, &duplicate)
            .expect_err("duplicate");
        assert!(matches!(error, CodeInspectionError::DuplicateClass { .. }));
        assert!(error
            .message()
            .contains("Duplicate class definitions found"));
    }

    #[test]
    fn malformed_dexdump_output_is_not_a_match() {
        let temp = TempDir::new().expect("temp");
        let apk = temp.path().join("base.apk");
        write_zip(&apk, &[("classes.dex", b"dex1")]);
        let materialized = vec![MaterializedApk {
            path: apk,
            container_member: None,
            split_name: "base".to_string(),
            is_base: true,
        }];
        let executor = FakeExecutor::new(&[ToolKind::Dexdump], |_tool, _args| {
            ok("Class descriptor  : 'unterminated\nClass descriptor :\n")
        });
        assert!(
            locate_class(&materialized, "com.example.Target", true, &executor)
                .expect("tolerate malformed output")
                .is_none()
        );
    }

    #[test]
    fn baksmali_argv_matches_python_and_output_is_read() {
        let temp = TempDir::new().expect("temp");
        let apk = temp.path().join("app.apk");
        write_zip(&apk, &[("classes.dex", b"dex bytes")]);
        let location = DexLocation {
            split: "base".to_string(),
            dex_name: "classes.dex".to_string(),
            descriptor: "Lcom/example/Target;".to_string(),
            apk_path: apk,
        };
        let executor = FakeExecutor::new(&[ToolKind::Baksmali], |_tool, args| {
            assert_eq!(args[0], "d");
            assert_eq!(args[2], "--classes");
            assert_eq!(args[3], "Lcom/example/Target;");
            assert!(args.contains(&"--code-offsets".to_string()));
            let out_dir =
                PathBuf::from(&args[args.iter().position(|arg| arg == "-o").expect("-o") + 1]);
            let target = out_dir.join("com/example/Target.smali");
            fs::create_dir_all(target.parent().expect("parent")).expect("dirs");
            fs::write(
                target,
                ".class public Lcom/example/Target;\n.super Ljava/lang/Object;\n",
            )
            .expect("write smali");
            ok("")
        });
        let text = extract_smali_class(&executor, &location).expect("smali");
        assert!(text.contains(".class public Lcom/example/Target;"));
        assert_eq!(executor.calls().len(), 1);
    }

    #[test]
    fn jadx_argv_accepts_exit_three_and_reads_single_class_output() {
        let temp = TempDir::new().expect("temp");
        let apk = temp.path().join("app.apk");
        write_zip(&apk, &[("classes.dex", b"dex")]);
        let location = DexLocation {
            split: "base".to_string(),
            dex_name: "classes.dex".to_string(),
            descriptor: "Lcom/example/Target;".to_string(),
            apk_path: apk,
        };
        let executor = FakeExecutor::new(&[ToolKind::Jadx], |_tool, args| {
            assert_eq!(args[0], "--single-class");
            assert_eq!(args[1], "com.example.Target");
            assert!(args.contains(&"--show-bad-code".to_string()));
            assert!(args.contains(&"--no-res".to_string()));
            assert_eq!(args[args.len() - 2], "java");
            let out = PathBuf::from(&args[3]);
            fs::write(out, "package com.example;\npublic class Target {}\n").expect("write java");
            Ok(ToolResult {
                exit_code: Some(3),
                stdout: String::new(),
                stderr: "warnings".to_string(),
            })
        });
        let text = extract_java_class(&executor, &location).expect("java");
        assert!(text.contains("public class Target"));
    }

    #[test]
    fn smali_methods_preserve_descriptors_and_overload_categories() {
        let smali = r#"
.class public Lcom/example/Foo;
.super Ljava/lang/Object;

.method public constructor <init>()V
    .registers 1
    return-void
.end method

.method public compute(I)I
    .registers 2
    add-int/lit8 v0, p1, 1
    return v0
.end method

.method public compute(II)I
    .registers 3
    add-int v0, p1, p2
    return v0
.end method
"#;
        let methods = parse_smali_methods(smali);
        assert_eq!(methods.len(), 3);
        assert_eq!(methods[0].signature, "<init>()V");
        assert_eq!(methods[1].signature, "compute(I)I");
        assert_eq!(methods[2].signature, "compute(II)I");
        let exact = extract_method_from_class(smali, "compute(I)I", "smali", "com.example.Foo")
            .expect("exact descriptor");
        assert!(exact.contains("add-int/lit8"));
        let ambiguous = extract_method_from_class(smali, "compute", "smali", "com.example.Foo")
            .expect_err("ambiguous");
        assert!(matches!(
            ambiguous,
            CodeInspectionError::AmbiguousMethod { .. }
        ));
        let missing = extract_method_from_class(smali, "bar", "smali", "com.example.Foo")
            .expect_err("missing");
        assert!(matches!(
            missing,
            CodeInspectionError::MethodNotFound { .. }
        ));
    }

    #[test]
    fn java_parser_skips_comments_strings_and_char_literals() {
        let java = r#"
package com.example;

public class Foo {
    // A comment with { and }
    private String name = "hello { world }";
    /* block { comment } */
    private int field1 = 42;

    public void process(int x) {
        String s = "closing brace } inside string";
        char c = '{';
        if (x > 0) {
            System.out.println(s + c);
        }
    }

    public void run() {
        System.out.println("run");
    }
}
"#;
        let methods = parse_java_methods(java);
        assert_eq!(methods.len(), 2);
        assert_eq!(methods[0].name, "process");
        assert_eq!(methods[1].name, "run");
        let process =
            extract_method_from_class(java, "process", "java", "com.example.Foo").expect("process");
        assert!(process.contains("public void process(int x)"));
        assert!(process.contains("String s = \"closing brace } inside string\";"));
        assert!(process.contains("char c = '{';"));
        assert!(!process.contains("field1"));
        assert!(process.ends_with('}'));
        let descriptor = extract_method_from_class(java, "process(I)V", "java", "com.example.Foo")
            .expect_err("descriptor rejected");
        assert!(matches!(
            descriptor,
            CodeInspectionError::DescriptorWithJava(_)
        ));
    }

    #[test]
    fn java_ambiguity_is_its_own_category() {
        let java = r#"
public class Foo {
    public void bar(int x) {}
    public void bar(String s) {}
}
"#;
        let error = extract_method_from_class(java, "bar", "java", "Foo").expect_err("ambiguous");
        assert!(matches!(error, CodeInspectionError::AmbiguousMethod { .. }));
        assert!(error.message().contains("Ambiguous method name 'bar'"));
    }

    #[test]
    fn unified_diff_headers_and_context_match_python_bytes() {
        let old = vec!["a\n".to_string(), "b\n".to_string(), "c\n".to_string()];
        let new = vec!["a\n".to_string(), "B\n".to_string(), "c\n".to_string()];
        let diff = unified_diff(&old, &new, "old", "new", 3);
        assert_eq!(
            diff,
            vec![
                "--- old\n".to_string(),
                "+++ new\n".to_string(),
                "@@ -1,3 +1,3 @@\n".to_string(),
                " a\n".to_string(),
                "-b\n".to_string(),
                "+B\n".to_string(),
                " c\n".to_string(),
            ]
        );
        assert_eq!(
            format_colored_diff(&diff, false),
            "--- old\n+++ new\n@@ -1,3 +1,3 @@\n a\n-b\n+B\n c"
        );
    }

    #[test]
    fn insertion_and_deletion_hunk_ranges_match_python() {
        let old = vec!["one\n".to_string(), "two\n".to_string()];
        let new = vec![
            "zero\n".to_string(),
            "one\n".to_string(),
            "two\n".to_string(),
        ];
        let diff = unified_diff(&old, &new, "a", "b", 3);
        assert_eq!(diff[2], "@@ -1,2 +1,3 @@\n");
        let deletion = unified_diff(&new, &old, "a", "b", 3);
        assert_eq!(deletion[2], "@@ -1,3 +1,2 @@\n");
    }

    #[test]
    fn diff_truncation_and_color_are_exact() {
        let old: Vec<String> = (0..600).map(|index| format!("line {index}\n")).collect();
        let new: Vec<String> = (0..600)
            .map(|index| format!("modified {index}\n"))
            .collect();
        let diff = truncate_diff(unified_diff(&old, &new, "old", "new", 3));
        assert_eq!(diff.len(), DIFF_LINE_LIMIT + 1);
        assert_eq!(diff.last().expect("marker"), DIFF_TRUNCATION_MARKER);

        let colored = format_colored_diff(
            &[
                "--- a\n".to_string(),
                "+++ b\n".to_string(),
                "@@ -1 +1 @@\n".to_string(),
                "-x\n".to_string(),
                "+y\n".to_string(),
                " z\n".to_string(),
            ],
            true,
        );
        assert!(colored.contains("\u{1b}[1m--- a\u{1b}[0m"));
        assert!(colored.contains("\u{1b}[32m+y\u{1b}[0m"));
        assert!(colored.contains("\u{1b}[31m-x\u{1b}[0m"));
        assert!(colored.contains("\u{1b}[36m@@ -1 +1 @@\u{1b}[0m"));
        assert!(colored.ends_with("\n z"));
        let plain = format_colored_diff(&["-x\n".to_string()], false);
        assert_eq!(plain, "-x");
    }

    #[test]
    fn split_lines_handles_python_line_breaks_and_missing_final_newline() {
        assert_eq!(
            split_lines_keep_ends("a\r\nb\rc\nd"),
            vec![
                "a\r\n".to_string(),
                "b\r".to_string(),
                "c\n".to_string(),
                "d".to_string()
            ]
        );
        assert!(split_lines_keep_ends("").is_empty());
    }

    #[test]
    fn empty_side_and_missing_newline_diffs_match_python() {
        let insertion = unified_diff(&[], &["x".to_string()], "old", "new", 3);
        assert_eq!(insertion.concat(), "--- old\n+++ new\n@@ -0,0 +1 @@\n+x");
        let deletion = unified_diff(&["x".to_string()], &[], "old", "new", 3);
        assert_eq!(deletion.concat(), "--- old\n+++ new\n@@ -1 +0,0 @@\n-x");
        let no_newline = unified_diff(
            &["a".to_string(), "b".to_string()],
            &["a".to_string(), "c".to_string()],
            "old",
            "new",
            3,
        );
        assert_eq!(
            no_newline.concat(),
            "--- old\n+++ new\n@@ -1,2 +1,2 @@\n a-b+c"
        );
    }

    #[test]
    fn autojunk_diff_matches_python_sequence_matcher() {
        let old: Vec<String> = (0..250)
            .map(|index| format!("line {}\n", index % 17))
            .collect();
        let mut new = old.clone();
        new[10] = "changed ten\n".to_string();
        new[120] = "changed hundred twenty\n".to_string();
        new.splice(
            121..121,
            ["inserted a\n".to_string(), "inserted b\n".to_string()],
        );
        new.drain(200..203);
        let diff = unified_diff(&old, &new, "old", "new", 3);
        let joined = diff.concat();
        let digest = sha2::Sha256::digest(joined.as_bytes());
        assert_eq!(
            format!("{digest:x}"),
            "e36ca0dc2985621bf62efcb9ee2a49782e6f1e957dbc05f9dc730b74b65db7f1"
        );
    }

    #[test]
    fn inspect_code_reports_added_removed_and_missing_class_states() {
        let temp = TempDir::new().expect("temp");
        let old_path = temp.path().join("old.apk");
        let new_path = temp.path().join("new.apk");
        write_zip(&old_path, &[("classes.dex", b"oldclass")]);
        write_zip(&new_path, &[("classes.dex", b"newclass")]);

        struct FixedInspector;
        impl ArtifactInspector for FixedInspector {
            fn inspect(&self, path: &Path) -> Result<ArtifactInspection, Error> {
                let mut value = inspection();
                value.file_path = path.display().to_string();
                Ok(value)
            }
        }
        let executor = FakeExecutor::new(&[ToolKind::Dexdump], |_tool, args| {
            let bytes = fs::read(&args[0]).expect("read dex");
            if bytes == b"oldclass" {
                ok("Class descriptor  : 'Lcom/example/Target;'\n")
            } else {
                ok("")
            }
        });
        let removed = InspectCodeRequest {
            artifact: new_path.clone(),
            fqcn: "com.example.Target".to_string(),
            method: None,
            format: "smali".to_string(),
            compare_artifact: Some(old_path.clone()),
            use_color: false,
        };
        let output =
            inspect_or_compare_code(&removed, &executor, &FixedInspector).expect("removed");
        assert_eq!(
            output.text,
            "Class 'com.example.Target' was removed in patched artifact (was in base:classes.dex).\n"
        );

        let added = InspectCodeRequest {
            artifact: old_path,
            fqcn: "com.example.Target".to_string(),
            method: None,
            format: "smali".to_string(),
            compare_artifact: Some(new_path.clone()),
            use_color: false,
        };
        let output = inspect_or_compare_code(&added, &executor, &FixedInspector).expect("added");
        assert_eq!(
            output.text,
            "Class 'com.example.Target' was added in patched artifact (base:classes.dex).\n"
        );

        let missing = InspectCodeRequest {
            artifact: new_path.clone(),
            fqcn: "com.example.Nope".to_string(),
            method: None,
            format: "smali".to_string(),
            compare_artifact: Some(new_path),
            use_color: false,
        };
        let error =
            inspect_or_compare_code(&missing, &executor, &FixedInspector).expect_err("missing");
        assert_eq!(error.exit_code(), crate::models::ExitCode::UsageOrToolError);
        assert!(error.message().contains("not found in either artifact"));
    }

    #[test]
    fn inspection_trait_fixture_is_only_used_for_shape() {
        let value = inspection();
        assert_eq!(value.package_name, "com.example");
        let _ = Cursor::new(Vec::<u8>::new());
    }
}
