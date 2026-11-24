//! Managed `analyze` orchestration and native-library extraction.
//!
//! Native port of the retired Python implementation's `analyze` orchestration.
//!
//! The workspace layout, config digest and marker come from
//! [`crate::workspace`]. This module owns the command-specific behavior:
//! default Smali disassembly, optional JADX/Apktool runs, extraction of every
//! native library from every split, collision detection and the exact
//! human-readable completion block including shell-quoted cleanup command.
//!
//! Split materialization and archive reads are done once per invocation. Tool
//! execution goes through the same process-adapter boundary as inspection.

use crate::archives;
use crate::code_inspection::{ArtifactInspector, ToolExecutor, ToolKind, ToolResult};
use crate::error::Error;
use crate::models::{ArtifactInspection, ContainerType};
use crate::workspace::{RunRequest, WorkspaceManager};
use regex::Regex;
use serde_json::json;
use std::collections::BTreeMap;
use std::fs::{self, File};
use std::io::{Read, Write};
use std::path::{Path, PathBuf};
use zip::ZipArchive;

/// Options accepted by the `analyze` command.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AnalyzeOptions {
    pub workspace_root: PathBuf,
    pub jadx: bool,
    pub apktool: bool,
    pub smali: bool,
    pub classes: Vec<String>,
}

impl Default for AnalyzeOptions {
    fn default() -> Self {
        Self {
            workspace_root: PathBuf::from(".apk-lab"),
            jadx: false,
            apktool: false,
            smali: false,
            classes: Vec::new(),
        }
    }
}

/// Successful analysis result, formatted by [`AnalysisReport::render`].
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AnalysisReport {
    pub run_dir: PathBuf,
    pub libraries: BTreeMap<String, Vec<String>>,
    pub cleanup_command: Vec<String>,
}

impl AnalysisReport {
    #[must_use]
    pub fn render(&self) -> String {
        let mut text = String::new();
        text.push_str("Analysis workspace created successfully:\n");
        text.push_str(&format!("  Workspace: {}\n", self.run_dir.display()));
        if !self.libraries.is_empty() {
            let summary = self
                .libraries
                .iter()
                .map(|(architecture, libraries)| format!("{architecture} ({})", libraries.len()))
                .collect::<Vec<_>>()
                .join(", ");
            text.push_str(&format!("  Libraries: {summary}\n"));
        }
        text.push_str(&format!(
            "  Cleanup:   {}\n",
            shlex_join(&self.cleanup_command)
        ));
        text
    }
}

fn workspace_error(error: crate::workspace::WorkspaceError) -> Error {
    Error::infrastructure(error.message())
}

/// Validates a DEX member name as a safe top-level `classes*.dex`.
pub fn validate_dex_entry_name(name: &str) -> Result<&str, Error> {
    let Some(digits) = name
        .strip_prefix("classes")
        .and_then(|rest| rest.strip_suffix(".dex"))
    else {
        return Err(Error::invalid_artifact(format!(
            "Invalid or unsafe DEX entry name: {name}"
        )));
    };
    if !digits.bytes().all(|byte| byte.is_ascii_digit()) {
        return Err(Error::invalid_artifact(format!(
            "Invalid or unsafe DEX entry name: {name}"
        )));
    }
    Ok(name)
}

fn zip_error(context: &str, error: zip::result::ZipError) -> Error {
    match error {
        zip::result::ZipError::Io(error) => Error::io(context, error),
        other => Error::invalid_artifact(format!("{context}: {other}")),
    }
}

fn copy_member(entry: &mut impl Read, destination: &Path, overwrite: bool) -> Result<(), Error> {
    let mut target = if overwrite {
        File::create(destination)
    } else {
        File::options()
            .write(true)
            .create_new(true)
            .open(destination)
    }
    .map_err(|error| Error::io(format!("create {}", destination.display()), error))?;
    let mut buffer = [0u8; archives::STREAM_BUFFER_BYTES];
    loop {
        let read = entry
            .read(&mut buffer)
            .map_err(|error| Error::io("read archive member", error))?;
        if read == 0 {
            break;
        }
        target
            .write_all(&buffer[..read])
            .map_err(|error| Error::io("write extracted member", error))?;
    }
    target
        .flush()
        .map_err(|error| Error::io("flush extracted member", error))
}

/// Extracts every inspected split into `dest_dir`, preserving member relative
/// paths. The whole container is validated before the first write.
fn extract_container_splits(
    artifact: &Path,
    inspection: &ArtifactInspection,
    dest_dir: &Path,
) -> Result<Vec<(bool, PathBuf)>, Error> {
    archives::inspect_safe_zip_path(artifact).map_err(Error::from)?;
    fs::create_dir_all(dest_dir).map_err(|error| {
        Error::io(
            format!("create extraction directory {}", dest_dir.display()),
            error,
        )
    })?;
    let file = File::open(artifact)
        .map_err(|error| Error::io(format!("open archive {}", artifact.display()), error))?;
    let mut archive =
        ZipArchive::new(file).map_err(|error| zip_error("open split container", error))?;
    let mut rows = Vec::with_capacity(inspection.splits.len());
    for split in &inspection.splits {
        let validated =
            archives::validate_member_name(&split.filename, false).map_err(Error::from)?;
        let destination = validated
            .segments
            .iter()
            .fold(dest_dir.to_path_buf(), |path, segment| path.join(segment));
        if let Some(parent) = destination.parent() {
            fs::create_dir_all(parent)
                .map_err(|error| Error::io(format!("create {}", parent.display()), error))?;
        }
        let index = archive.index_for_name(&split.filename).ok_or_else(|| {
            Error::invalid_artifact(format!(
                "Split member {} not found in archive",
                split.filename
            ))
        })?;
        let mut entry = archive
            .by_index(index)
            .map_err(|error| zip_error("open split member", error))?;
        copy_member(&mut entry, &destination, true)?;
        rows.push((split.is_base, destination));
    }
    Ok(rows)
}

fn native_roots(lib_dir: &Path, name: &str) -> Result<(String, String), Error> {
    let rest = name.strip_prefix("lib/").unwrap_or(name);
    let mut components: Vec<&str> = Vec::new();
    for component in rest.split('/') {
        match component {
            "" | "." => {}
            ".." => {
                if components.pop().is_none() {
                    return Err(Error::invalid_artifact(format!(
                        "Native library {name} escapes library directory {}",
                        lib_dir.display()
                    )));
                }
            }
            other => {
                if other.contains('\0') || other.contains('\\') {
                    return Err(Error::invalid_artifact(format!(
                        "Native library {name} escapes library directory {}",
                        lib_dir.display()
                    )));
                }
                components.push(other);
            }
        }
    }
    if components.len() != 2 {
        return Err(Error::invalid_artifact(format!(
            "Invalid native library entry name: {name}"
        )));
    }
    let pattern = Regex::new(r"^lib/([^/]+)/([^/]+\.so)$").expect("static native library regex");
    let captures = pattern.captures(name).ok_or_else(|| {
        Error::invalid_artifact(format!("Invalid native library entry name: {name}"))
    })?;
    Ok((captures[1].to_string(), captures[2].to_string()))
}

fn compare_member_with_file(entry: &mut impl Read, path: &Path, name: &str) -> Result<(), Error> {
    let mut existing =
        File::open(path).map_err(|error| Error::io(format!("open {}", path.display()), error))?;
    let mut left = [0u8; archives::STREAM_BUFFER_BYTES];
    let mut right = [0u8; archives::STREAM_BUFFER_BYTES];
    loop {
        let left_read = entry
            .read(&mut left)
            .map_err(|error| Error::io("read archive member", error))?;
        let right_read = existing
            .read(&mut right)
            .map_err(|error| Error::io("read existing native library", error))?;
        if left[..left_read] != right[..right_read] {
            return Err(Error::invalid_artifact(format!(
                "Conflicting native library content for {name}"
            )));
        }
        if left_read == 0 {
            return Ok(());
        }
    }
}

/// Extracts all native shared libraries from candidate APKs into
/// `lib_dir/<arch>/`, rejecting traversal, malformed nesting and conflicting
/// duplicate content just like the Python oracle.
pub fn extract_native_libraries(
    apk_paths: &[PathBuf],
    lib_dir: &Path,
) -> Result<BTreeMap<String, Vec<String>>, Error> {
    let mut extracted: BTreeMap<String, Vec<String>> = BTreeMap::new();
    let mut root_created = false;

    for apk_path in apk_paths {
        if !apk_path.is_file() {
            continue;
        }
        let file = File::open(apk_path)
            .map_err(|error| Error::io(format!("open {}", apk_path.display()), error))?;
        let mut archive = ZipArchive::new(file)
            .map_err(|error| zip_error("open native library archive", error))?;
        for index in 0..archive.len() {
            let mut entry = archive
                .by_index(index)
                .map_err(|error| zip_error("read native library entry", error))?;
            let name = entry
                .name()
                .map_err(|error| zip_error("decode archive entry name", error))?
                .into_owned();
            if !name.starts_with("lib/") || !name.ends_with(".so") {
                continue;
            }
            let (architecture, filename) = native_roots(lib_dir, &name)?;
            if !root_created {
                fs::create_dir_all(lib_dir)
                    .map_err(|error| Error::io(format!("create {}", lib_dir.display()), error))?;
                root_created = true;
            }
            let destination = lib_dir.join(&architecture).join(&filename);
            match fs::symlink_metadata(&destination) {
                Ok(metadata) => {
                    if metadata.file_type().is_symlink() || !metadata.is_file() {
                        return Err(Error::invalid_artifact(format!(
                            "Native library {name} escapes library directory {}",
                            lib_dir.display()
                        )));
                    }
                    compare_member_with_file(&mut entry, &destination, &name)?;
                }
                Err(error) if error.kind() == std::io::ErrorKind::NotFound => {
                    if let Some(parent) = destination.parent() {
                        fs::create_dir_all(parent).map_err(|error| {
                            Error::io(format!("create {}", parent.display()), error)
                        })?;
                    }
                    copy_member(&mut entry, &destination, false)?;
                }
                Err(error) => {
                    return Err(Error::io(
                        format!("inspect {}", destination.display()),
                        error,
                    ))
                }
            }
            let libraries = extracted.entry(architecture).or_default();
            if !libraries.contains(&filename) {
                libraries.push(filename);
            }
        }
    }
    Ok(extracted)
}

fn run_tool(
    executor: &dyn ToolExecutor,
    tool: ToolKind,
    args: &[String],
) -> Result<ToolResult, Error> {
    executor
        .execute(tool, args)
        .map_err(|error| Error::infrastructure(error.message()))
}

fn extract_dex_members(
    target_apk: &Path,
    run_dir: &Path,
    executor: &dyn ToolExecutor,
) -> Result<(), Error> {
    let smali_out = run_dir.join("smali");
    fs::create_dir_all(&smali_out)
        .map_err(|error| Error::io(format!("create {}", smali_out.display()), error))?;
    let file = File::open(target_apk)
        .map_err(|error| Error::io(format!("open {}", target_apk.display()), error))?;
    let mut archive = ZipArchive::new(file).map_err(|error| zip_error("open target APK", error))?;
    let mut dex_names = Vec::new();
    for index in 0..archive.len() {
        let entry = archive
            .by_index(index)
            .map_err(|error| zip_error("read target APK entry", error))?;
        let name = entry
            .name()
            .map_err(|error| zip_error("decode archive entry name", error))?
            .into_owned();
        if let Ok(valid) = validate_dex_entry_name(&name) {
            dex_names.push(valid.to_string());
        }
    }
    for dex_name in dex_names {
        let destination = run_dir.join(&dex_name);
        if !destination.starts_with(run_dir) {
            return Err(Error::invalid_artifact(format!(
                "DEX destination {dex_name} escapes run directory {}",
                run_dir.display()
            )));
        }
        let mut entry = archive
            .by_name(&dex_name)
            .map_err(|error| zip_error("open DEX member", error))?;
        copy_member(&mut entry, &destination, true)?;
        drop(entry);
        let args = vec![
            "d".to_string(),
            destination.to_string_lossy().into_owned(),
            "-o".to_string(),
            smali_out.to_string_lossy().into_owned(),
        ];
        let result = run_tool(executor, ToolKind::Baksmali, &args)?;
        if result.exit_code != Some(0) {
            return Err(Error::infrastructure(format!(
                "baksmali failed (code {}): {}",
                result.exit_code.unwrap_or(-1),
                result.stderr.chars().take(300).collect::<String>()
            )));
        }
        let _ = fs::remove_file(&destination);
    }
    Ok(())
}

/// Runs `analyze`, returning the report whose rendering is printed by the CLI.
pub fn analyze_artifact(
    artifact: &Path,
    options: &AnalyzeOptions,
    executor: &dyn ToolExecutor,
    inspector: &dyn ArtifactInspector,
) -> Result<AnalysisReport, Error> {
    let inspection = inspector.inspect(artifact)?;

    let mut tool_versions = BTreeMap::new();
    for name in ["morphe", "jadx", "apktool", "baksmali"] {
        let version = executor.version(name).ok_or_else(|| {
            Error::infrastructure(format!("Unknown tool '{name}' in tools lock file"))
        })?;
        tool_versions.insert(name.to_string(), version);
    }

    let config = json!({
        "jadx": options.jadx,
        "apktool": options.apktool,
        "smali": options.smali,
        "classes": options.classes,
    });
    let workspace = WorkspaceManager::new(&options.workspace_root);
    let run_dir = workspace
        .create_run_dir(&RunRequest {
            package_name: &inspection.package_name,
            version_code: inspection.version_code,
            input_sha256: &inspection.sha256,
            input_path: artifact,
            command: "analyze",
            config: &config,
            tool_versions: &tool_versions,
        })
        .map_err(workspace_error)?;

    let extracted_dir = run_dir.join("apks");
    fs::create_dir_all(&extracted_dir)
        .map_err(|error| Error::io(format!("create {}", extracted_dir.display()), error))?;

    let mut target_apk = run_dir.join("base.apk");
    let mut candidate_apks = Vec::new();
    if inspection.container_type == ContainerType::Apk {
        fs::copy(artifact, &target_apk).map_err(|error| {
            Error::io(
                format!("copy {} to {}", artifact.display(), target_apk.display()),
                error,
            )
        })?;
        candidate_apks.push(target_apk.clone());
    } else {
        let rows = extract_container_splits(artifact, &inspection, &extracted_dir)?;
        for (is_base, path) in rows {
            if is_base {
                target_apk = path.clone();
            }
            candidate_apks.push(path);
        }
    }

    let libraries = extract_native_libraries(&candidate_apks, &run_dir.join("lib"))?;

    let run_smali = options.smali || (!options.jadx && !options.apktool);
    if run_smali {
        extract_dex_members(&target_apk, &run_dir, executor)?;
    }

    if options.jadx {
        let jadx_out = run_dir.join("jadx");
        let mut args = vec![
            "-d".to_string(),
            jadx_out.to_string_lossy().into_owned(),
            target_apk.to_string_lossy().into_owned(),
        ];
        for class in &options.classes {
            args.push("--include-pkg".to_string());
            args.push(class.clone());
        }
        let result = run_tool(executor, ToolKind::Jadx, &args)?;
        if !matches!(result.exit_code, Some(0) | Some(3)) {
            return Err(Error::infrastructure(format!(
                "JADX decompilation failed (code {}): {}",
                result.exit_code.unwrap_or(-1),
                result.stderr.chars().take(300).collect::<String>()
            )));
        }
    }

    if options.apktool {
        let apktool_out = run_dir.join("apktool");
        let args = vec![
            "d".to_string(),
            "-f".to_string(),
            "-o".to_string(),
            apktool_out.to_string_lossy().into_owned(),
            target_apk.to_string_lossy().into_owned(),
        ];
        let result = run_tool(executor, ToolKind::Apktool, &args)?;
        if result.exit_code != Some(0) {
            return Err(Error::infrastructure(format!(
                "apktool failed (code {}): {}",
                result.exit_code.unwrap_or(-1),
                result.stderr.chars().take(300).collect::<String>()
            )));
        }
    }

    let mut cleanup_command = vec![
        "uv".to_string(),
        "run".to_string(),
        "--project".to_string(),
        "tools/apk-lab".to_string(),
        "apk-lab".to_string(),
    ];
    if options.workspace_root != Path::new(".apk-lab") {
        cleanup_command.push("--workspace-root".to_string());
        cleanup_command.push(options.workspace_root.to_string_lossy().into_owned());
    }
    cleanup_command.push("clean".to_string());
    cleanup_command.push("--run".to_string());
    cleanup_command.push(run_dir.to_string_lossy().into_owned());

    Ok(AnalysisReport {
        run_dir,
        libraries,
        cleanup_command,
    })
}

/// Python `shlex.join`: ASCII-safe tokens are left bare, everything else is
/// single-quoted with embedded quotes escaped as `'"'"'`.
#[must_use]
pub fn shlex_quote(value: &str) -> String {
    if value.is_empty() {
        return "''".to_string();
    }
    let safe = value.bytes().all(|byte| {
        byte.is_ascii_alphanumeric()
            || matches!(
                byte,
                b'_' | b'@' | b'%' | b'+' | b'=' | b':' | b',' | b'.' | b'/' | b'-'
            )
    });
    if safe {
        value.to_string()
    } else {
        format!("'{}'", value.replace('\'', "'\"'\"'"))
    }
}

/// Joins argv with Python `shlex.join` quoting.
#[must_use]
pub fn shlex_join(arguments: &[String]) -> String {
    arguments
        .iter()
        .map(|argument| shlex_quote(argument))
        .collect::<Vec<_>>()
        .join(" ")
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::code_inspection::{ArtifactInspector, ToolExecutor, ToolKind, ToolResult};
    use crate::models::{ArtifactInspection, SplitInfo};
    use crate::workspace::{compute_config_digest, WorkspaceManager};
    use std::cell::RefCell;
    use std::collections::BTreeMap;
    use std::io::Write;
    use tempfile::TempDir;
    use zip::write::SimpleFileOptions;
    use zip::{CompressionMethod, ZipWriter};

    struct FakeInspector {
        inspection: ArtifactInspection,
    }

    impl ArtifactInspector for FakeInspector {
        fn inspect(&self, _path: &Path) -> Result<ArtifactInspection, Error> {
            Ok(self.inspection.clone())
        }
    }

    type Handler = Box<dyn Fn(ToolKind, &[String]) -> Result<ToolResult, Error>>;

    struct FakeExecutor {
        versions: BTreeMap<String, String>,
        calls: RefCell<Vec<(ToolKind, Vec<String>)>>,
        handler: Handler,
    }

    impl FakeExecutor {
        fn new(
            versions: &[(&str, &str)],
            handler: impl Fn(ToolKind, &[String]) -> Result<ToolResult, Error> + 'static,
        ) -> Self {
            Self {
                versions: versions
                    .iter()
                    .map(|(name, version)| ((*name).to_string(), (*version).to_string()))
                    .collect(),
                calls: RefCell::new(Vec::new()),
                handler: Box::new(handler),
            }
        }

        fn success_versions() -> Self {
            Self::new(
                &[
                    ("morphe", "1.0"),
                    ("jadx", "1.0"),
                    ("apktool", "1.0"),
                    ("baksmali", "1.0"),
                ],
                |_tool, _args| {
                    Ok(ToolResult {
                        exit_code: Some(0),
                        stdout: String::new(),
                        stderr: String::new(),
                    })
                },
            )
        }

        fn calls(&self) -> Vec<(ToolKind, Vec<String>)> {
            self.calls.borrow().clone()
        }
    }

    impl ToolExecutor for FakeExecutor {
        fn is_available(&self, _tool: ToolKind) -> bool {
            true
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

    fn inspection(container: ContainerType, splits: Vec<SplitInfo>) -> ArtifactInspection {
        ArtifactInspection {
            file_path: "app.apks".to_string(),
            container_type: container,
            file_size: 100,
            sha256: "a".repeat(64),
            package_name: "com.example.game".to_string(),
            version_name: "1.0".to_string(),
            version_code: 10,
            min_sdk: Some(21),
            target_sdk: Some(34),
            signing_certificate_sha256: None,
            splits,
            dex_classes_count: 0,
            dex_methods_count: 0,
            dex_files: Vec::new(),
            native_libraries: Vec::new(),
            resources: Vec::new(),
            assets: Vec::new(),
            warnings: Vec::new(),
        }
    }

    #[test]
    fn shlex_join_quotes_spaces_and_embedded_quotes() {
        assert_eq!(shlex_quote("plain"), "plain");
        assert_eq!(shlex_quote("my workspace"), "'my workspace'");
        assert_eq!(shlex_quote("it's"), "'it'\"'\"'s'");
        assert_eq!(shlex_quote(""), "''");
        assert_eq!(
            shlex_join(&[
                "clean".to_string(),
                "--run".to_string(),
                "/tmp/my workspace".to_string()
            ]),
            "clean --run '/tmp/my workspace'"
        );
    }

    #[test]
    fn native_extraction_collisions_preserve_first_content() {
        let temp = TempDir::new().expect("temp");
        let first = temp.path().join("split1.apk");
        let identical = temp.path().join("split2.apk");
        write_zip(
            &first,
            &[("lib/arm64-v8a/libshared.so", b"identical_content_bytes")],
        );
        write_zip(
            &identical,
            &[("lib/arm64-v8a/libshared.so", b"identical_content_bytes")],
        );
        let lib_dir = temp.path().join("lib");
        let extracted = extract_native_libraries(&[first.clone(), identical], &lib_dir)
            .expect("identical duplicates");
        assert_eq!(
            extracted.get("arm64-v8a"),
            Some(&vec!["libshared.so".to_string()])
        );
        assert_eq!(
            fs::read(lib_dir.join("arm64-v8a/libshared.so")).expect("read"),
            b"identical_content_bytes"
        );

        let conflicting = temp.path().join("split3.apk");
        write_zip(
            &conflicting,
            &[("lib/arm64-v8a/libshared.so", b"different_content")],
        );
        let lib_dir2 = temp.path().join("lib2");
        let error =
            extract_native_libraries(&[first, conflicting], &lib_dir2).expect_err("conflict");
        assert_eq!(error.exit_code(), crate::models::ExitCode::InvalidArtifact);
        assert!(error.message().contains("lib/arm64-v8a/libshared.so"));
        assert_eq!(
            fs::read(lib_dir2.join("arm64-v8a/libshared.so")).expect("first bytes"),
            b"identical_content_bytes"
        );
    }

    #[test]
    fn native_extraction_rejects_traversal_and_extra_nesting() {
        let temp = TempDir::new().expect("temp");
        let traversal = temp.path().join("bad.apk");
        write_zip(&traversal, &[("lib/arm64-v8a/../../evil.so", b"evil")]);
        let error = extract_native_libraries(&[traversal], &temp.path().join("lib"))
            .expect_err("traversal");
        assert!(error.message().contains("escapes library directory"));

        let nested = temp.path().join("nested.apk");
        write_zip(&nested, &[("lib/arm64-v8a/nested/evil.so", b"evil")]);
        let error =
            extract_native_libraries(&[nested], &temp.path().join("lib2")).expect_err("nested");
        assert!(error.message().contains("Invalid native library"));
    }

    #[test]
    fn analyze_extracts_all_split_libraries_and_writes_digest() {
        let temp = TempDir::new().expect("temp");
        let base_apk = temp.path().join("base.apk");
        write_zip(
            &base_apk,
            &[
                ("AndroidManifest.xml", b"<manifest/>"),
                ("classes.dex", b"dex\n035\x00"),
            ],
        );
        let split_apk = temp.path().join("split_config.arm64_v8a.apk");
        write_zip(
            &split_apk,
            &[
                ("AndroidManifest.xml", b"<manifest/>"),
                ("lib/arm64-v8a/libgame.so", b"binary_data_arm64"),
                ("lib/armeabi-v7a/libgame32.so", b"binary_data_v7"),
            ],
        );
        let container = temp.path().join("app.apks");
        write_zip(
            &container,
            &[
                ("base.apk", &fs::read(&base_apk).expect("base")),
                (
                    "split_config.arm64_v8a.apk",
                    &fs::read(&split_apk).expect("split"),
                ),
            ],
        );
        let splits = vec![
            SplitInfo {
                filename: "base.apk".to_string(),
                split_name: "base".to_string(),
                sha256: "base".to_string(),
                size: 1,
                is_base: true,
            },
            SplitInfo {
                filename: "split_config.arm64_v8a.apk".to_string(),
                split_name: "config.arm64_v8a".to_string(),
                sha256: "split".to_string(),
                size: 1,
                is_base: false,
            },
        ];
        let inspector = FakeInspector {
            inspection: inspection(ContainerType::Apks, splits),
        };
        let executor = FakeExecutor::success_versions();
        let root = temp.path().join("my custom workspace");
        let options = AnalyzeOptions {
            workspace_root: root.clone(),
            ..AnalyzeOptions::default()
        };
        let report =
            analyze_artifact(&container, &options, &executor, &inspector).expect("analyze");
        assert_eq!(
            fs::read(report.run_dir.join("lib/arm64-v8a/libgame.so")).expect("arm64 lib"),
            b"binary_data_arm64"
        );
        assert_eq!(
            fs::read(report.run_dir.join("lib/armeabi-v7a/libgame32.so")).expect("v7 lib"),
            b"binary_data_v7"
        );
        assert_eq!(
            report.libraries.get("arm64-v8a"),
            Some(&vec!["libgame.so".to_string()])
        );
        assert_eq!(
            report.libraries.get("armeabi-v7a"),
            Some(&vec!["libgame32.so".to_string()])
        );

        let manager = WorkspaceManager::new(&root);
        let marker = manager.validate_run_dir(&report.run_dir).expect("marker");
        let expected_versions: BTreeMap<String, String> = [
            ("morphe", "1.0"),
            ("jadx", "1.0"),
            ("apktool", "1.0"),
            ("baksmali", "1.0"),
        ]
        .into_iter()
        .map(|(name, version)| (name.to_string(), version.to_string()))
        .collect();
        let expected_config = json!({
            "jadx": false,
            "apktool": false,
            "smali": false,
            "classes": [],
        });
        let expected_digest =
            compute_config_digest("analyze", &expected_config, &expected_versions).expect("digest");
        assert_eq!(marker.config_digest, expected_digest);
        assert_eq!(marker.tool_versions, expected_versions);
        assert_eq!(
            report.run_dir.file_name().expect("run name"),
            std::ffi::OsStr::new(&expected_digest)
        );

        let rendered = report.render();
        assert!(rendered.starts_with("Analysis workspace created successfully:\n"));
        assert!(rendered.contains("Libraries: arm64-v8a (1), armeabi-v7a (1)\n"));
        assert!(rendered.contains("--workspace-root '"));
        assert!(rendered.contains("clean --run "));
        assert_eq!(
            report.cleanup_command,
            vec![
                "uv".to_string(),
                "run".to_string(),
                "--project".to_string(),
                "tools/apk-lab".to_string(),
                "apk-lab".to_string(),
                "--workspace-root".to_string(),
                root.to_string_lossy().into_owned(),
                "clean".to_string(),
                "--run".to_string(),
                report.run_dir.to_string_lossy().into_owned(),
            ]
        );

        let baksmali = executor
            .calls()
            .into_iter()
            .find(|(tool, _)| *tool == ToolKind::Baksmali)
            .expect("default smali disassembly");
        assert_eq!(baksmali.1[0], "d");
        assert!(baksmali.1[2] == "-o");
    }

    #[test]
    fn analyze_jadx_uses_include_pkg_and_skips_default_smali() {
        let temp = TempDir::new().expect("temp");
        let apk = temp.path().join("app.apk");
        write_zip(&apk, &[("classes.dex", b"dex")]);
        let inspector = FakeInspector {
            inspection: inspection(ContainerType::Apk, Vec::new()),
        };
        let executor = FakeExecutor::success_versions();
        let options = AnalyzeOptions {
            workspace_root: temp.path().join("workspace"),
            jadx: true,
            classes: vec!["com.example.game".to_string()],
            ..AnalyzeOptions::default()
        };
        let report = analyze_artifact(&apk, &options, &executor, &inspector).expect("analyze");
        assert!(report.libraries.is_empty());
        let calls = executor.calls();
        assert_eq!(calls.len(), 1);
        assert_eq!(calls[0].0, ToolKind::Jadx);
        assert_eq!(
            calls[0].1,
            vec![
                "-d".to_string(),
                report.run_dir.join("jadx").to_string_lossy().into_owned(),
                report
                    .run_dir
                    .join("base.apk")
                    .to_string_lossy()
                    .into_owned(),
                "--include-pkg".to_string(),
                "com.example.game".to_string(),
            ]
        );
        assert!(report.run_dir.join("base.apk").is_file());
    }

    #[test]
    fn analyze_apktool_failure_is_infrastructure_failure() {
        let temp = TempDir::new().expect("temp");
        let apk = temp.path().join("app.apk");
        write_zip(&apk, &[("classes.dex", b"dex")]);
        let inspector = FakeInspector {
            inspection: inspection(ContainerType::Apk, Vec::new()),
        };
        let executor = FakeExecutor::new(
            &[
                ("morphe", "1.0"),
                ("jadx", "1.0"),
                ("apktool", "1.0"),
                ("baksmali", "1.0"),
            ],
            |tool, _args| match tool {
                ToolKind::Apktool => Ok(ToolResult {
                    exit_code: Some(2),
                    stdout: String::new(),
                    stderr: "decode failed".to_string(),
                }),
                _ => Ok(ToolResult {
                    exit_code: Some(0),
                    stdout: String::new(),
                    stderr: String::new(),
                }),
            },
        );
        let options = AnalyzeOptions {
            workspace_root: temp.path().join("workspace"),
            jadx: false,
            apktool: true,
            smali: false,
            classes: Vec::new(),
        };
        let error =
            analyze_artifact(&apk, &options, &executor, &inspector).expect_err("apktool failure");
        assert_eq!(
            error.exit_code(),
            crate::models::ExitCode::InfrastructureFailure
        );
        assert!(error.message().contains("apktool failed (code 2)"));
    }

    #[test]
    fn analyze_malformed_baksmali_exit_is_infrastructure() {
        let temp = TempDir::new().expect("temp");
        let apk = temp.path().join("app.apk");
        write_zip(&apk, &[("classes.dex", b"dex")]);
        let inspector = FakeInspector {
            inspection: inspection(ContainerType::Apk, Vec::new()),
        };
        let executor = FakeExecutor::new(
            &[
                ("morphe", "1.0"),
                ("jadx", "1.0"),
                ("apktool", "1.0"),
                ("baksmali", "1.0"),
            ],
            |_tool, _args| {
                Ok(ToolResult {
                    exit_code: Some(1),
                    stdout: String::new(),
                    stderr: "malformed output".to_string(),
                })
            },
        );
        let options = AnalyzeOptions {
            workspace_root: temp.path().join("workspace"),
            ..AnalyzeOptions::default()
        };
        let error =
            analyze_artifact(&apk, &options, &executor, &inspector).expect_err("baksmali failure");
        assert_eq!(
            error.exit_code(),
            crate::models::ExitCode::InfrastructureFailure
        );
        assert!(error.message().contains("baksmali failed (code 1)"));
    }

    #[test]
    fn validate_dex_entry_name_matches_python_regex() {
        for valid in ["classes.dex", "classes2.dex", "classes10.dex"] {
            assert_eq!(validate_dex_entry_name(valid).expect("valid"), valid);
        }
        for invalid in [
            "../classes.dex",
            "foo/classes.dex",
            "/classes.dex",
            "notdex.txt",
        ] {
            let error = validate_dex_entry_name(invalid).expect_err("invalid");
            assert_eq!(error.exit_code(), crate::models::ExitCode::InvalidArtifact);
            assert!(error.message().contains("Invalid or unsafe DEX"));
        }
    }
}
