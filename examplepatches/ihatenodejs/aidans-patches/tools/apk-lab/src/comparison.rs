//! Artifact comparison, class-source diffing and summary formatting.
//!
//! Native port of the retired Python implementation.
//!
//! The comparison model mirrors Python's `ArtifactComparison.to_dict` field
//! names and order. Split materialization is shared within one invocation: the
//! repository hashes and the optional JADX class comparison reuse the same
//! temporary extraction, but nothing is cached across invocations.
//!
//! Class status states (`added`, `removed`, `unchanged`, `modified`, `missing`,
//! `tool_unavailable`, `error`) and their diff strings are produced exactly as
//! the Python module does, including the 500-line unified-diff truncation.

use crate::archives::{self, MaterializedApk, MaterializedApks};
use crate::code_inspection::{
    split_lines_keep_ends, truncate_diff, unified_diff, ArtifactInspector, ToolExecutor, ToolKind,
};
use crate::error::Error;
use crate::models::{ArtifactInspection, ContainerType, SplitInfo};
use serde::ser::SerializeMap;
use serde::Serialize;
use sha2::{Digest, Sha256};
use std::collections::{BTreeMap, BTreeSet};
use std::fs::{self, File};
use std::io::Read;
use std::path::{Path, PathBuf};
use tempfile::TempDir;
use zip::ZipArchive;

/// One requested-class comparison result.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct ClassDiff {
    pub status: String,
    pub diff: Option<String>,
}

impl ClassDiff {
    fn new(status: impl Into<String>, diff: Option<String>) -> Self {
        Self {
            status: status.into(),
            diff,
        }
    }
}

/// Requested-class results in request order. A manual map serializer preserves
/// Python dict insertion order for duplicate requested class names.
#[derive(Debug, Clone, Default, PartialEq, Eq)]
pub struct ClassesDiff(Vec<(String, ClassDiff)>);

impl ClassesDiff {
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.0.is_empty()
    }

    pub fn iter(&self) -> impl Iterator<Item = (&String, &ClassDiff)> {
        self.0.iter().map(|(name, diff)| (name, diff))
    }

    #[must_use]
    pub fn get(&self, name: &str) -> Option<&ClassDiff> {
        self.0
            .iter()
            .find(|(key, _)| key == name)
            .map(|(_, diff)| diff)
    }

    fn insert(&mut self, name: String, diff: ClassDiff) {
        if let Some(existing) = self.0.iter_mut().find(|(key, _)| key == &name) {
            existing.1 = diff;
        } else {
            self.0.push((name, diff));
        }
    }

    fn fill(&mut self, classes: &[String], status: &str, diff: impl Fn(&str) -> String) {
        for class in classes {
            self.insert(class.clone(), ClassDiff::new(status, Some(diff(class))));
        }
    }
}

impl Serialize for ClassesDiff {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: serde::Serializer,
    {
        let mut map = serializer.serialize_map(Some(self.0.len()))?;
        for (name, diff) in &self.0 {
            map.serialize_entry(name, diff)?;
        }
        map.end()
    }
}

/// Structured artifact comparison matching Python's wire model.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct ArtifactComparison {
    #[serde(rename = "old")]
    pub old_inspection: ArtifactInspection,
    #[serde(rename = "new")]
    pub new_inspection: ArtifactInspection,
    #[serde(rename = "versionChanged")]
    pub version_changed: bool,
    #[serde(rename = "versionCodeDelta")]
    pub version_code_delta: i128,
    #[serde(rename = "signerChanged")]
    pub signer_changed: bool,
    #[serde(rename = "addedSplits")]
    pub added_splits: Vec<String>,
    #[serde(rename = "removedSplits")]
    pub removed_splits: Vec<String>,
    #[serde(rename = "modifiedSplits")]
    pub modified_splits: Vec<String>,
    #[serde(rename = "addedPermissions")]
    pub added_permissions: Vec<String>,
    #[serde(rename = "removedPermissions")]
    pub removed_permissions: Vec<String>,
    #[serde(rename = "addedComponents")]
    pub added_components: Vec<String>,
    #[serde(rename = "removedComponents")]
    pub removed_components: Vec<String>,
    #[serde(rename = "dexClassesDelta")]
    pub dex_classes_delta: i128,
    #[serde(rename = "dexMethodsDelta")]
    pub dex_methods_delta: i128,
    #[serde(rename = "addedNativeLibraries")]
    pub added_native_libraries: Vec<String>,
    #[serde(rename = "removedNativeLibraries")]
    pub removed_native_libraries: Vec<String>,
    #[serde(rename = "modifiedNativeLibraries")]
    pub modified_native_libraries: Vec<String>,
    #[serde(rename = "addedAssets")]
    pub added_assets: Vec<String>,
    #[serde(rename = "removedAssets")]
    pub removed_assets: Vec<String>,
    #[serde(rename = "modifiedAssets")]
    pub modified_assets: Vec<String>,
    #[serde(rename = "classesDiff")]
    pub classes_diff: ClassesDiff,
}

fn zip_error(context: &str, error: zip::result::ZipError) -> Error {
    match error {
        zip::result::ZipError::Io(error) => Error::io(context, error),
        other => Error::invalid_artifact(format!("{context}: {other}")),
    }
}

fn digest_reader<R: Read>(reader: &mut R) -> Result<String, Error> {
    let mut hasher = Sha256::new();
    let mut buffer = [0u8; archives::STREAM_BUFFER_BYTES];
    loop {
        let read = reader
            .read(&mut buffer)
            .map_err(|error| Error::io("read archive member", error))?;
        if read == 0 {
            break;
        }
        hasher.update(&buffer[..read]);
    }
    let mut text = String::with_capacity(64);
    for byte in hasher.finalize() {
        text.push_str(&format!("{byte:02x}"));
    }
    Ok(text)
}

fn hash_matching_members(
    archive_path: &Path,
    prefix: &str,
    hashes: &mut BTreeMap<String, Vec<String>>,
) -> Result<(), Error> {
    let file = File::open(archive_path)
        .map_err(|error| Error::io(format!("open archive {}", archive_path.display()), error))?;
    let mut archive =
        ZipArchive::new(file).map_err(|error| zip_error("open zip archive", error))?;
    for index in 0..archive.len() {
        let mut entry = archive
            .by_index(index)
            .map_err(|error| zip_error("read archive entry", error))?;
        if entry.is_dir() {
            continue;
        }
        let name = entry
            .name()
            .map_err(|error| zip_error("decode archive entry name", error))?
            .into_owned();
        archives::validate_member_name(&name, false).map_err(Error::from)?;
        if !name.starts_with(prefix) {
            continue;
        }
        let hash = digest_reader(&mut entry)?;
        hashes.entry(name).or_default().push(hash);
    }
    Ok(())
}

fn hashes_for_materialized(
    materialized: &[MaterializedApk],
    prefix: &str,
) -> Result<BTreeMap<String, Vec<String>>, Error> {
    let mut hashes = BTreeMap::new();
    for apk in materialized {
        hash_matching_members(&apk.path, prefix, &mut hashes)?;
    }
    Ok(hashes
        .into_iter()
        .map(|(name, values)| {
            let mut values = values;
            values.sort();
            (name, values)
        })
        .collect())
}

/// Locates decompiled Java/Kotlin source for an FQCN under `sources_dir`.
#[must_use]
pub fn locate_class_source(sources_dir: &Path, fqcn: &str) -> Option<PathBuf> {
    if !sources_dir.is_dir() {
        return None;
    }
    let relative = fqcn.replace('.', "/");
    for extension in [".java", ".kt"] {
        let candidate = sources_dir.join(format!("{relative}{extension}"));
        if candidate.is_file() {
            return Some(candidate);
        }
    }
    if let Some((outer, _)) = fqcn.split_once('$') {
        let outer = outer.replace('.', "/");
        for extension in [".java", ".kt"] {
            let candidate = sources_dir.join(format!("{outer}{extension}"));
            if candidate.is_file() {
                return Some(candidate);
            }
        }
    }
    None
}

fn read_lossy(path: &Path) -> Result<String, Error> {
    let bytes =
        fs::read(path).map_err(|error| Error::io(format!("read {}", path.display()), error))?;
    Ok(String::from_utf8_lossy(&bytes).into_owned())
}

/// Compares two decompiled class sources and returns the Python status shape.
pub fn compare_class_sources(
    old_file: Option<&Path>,
    new_file: Option<&Path>,
    fqcn: &str,
) -> Result<ClassDiff, Error> {
    match (old_file, new_file) {
        (None, None) => Ok(ClassDiff::new(
            "missing",
            Some(format!("Class {fqcn} not found in old or new artifact")),
        )),
        (None, Some(_)) => Ok(ClassDiff::new("added", None)),
        (Some(_), None) => Ok(ClassDiff::new("removed", None)),
        (Some(old_file), Some(new_file)) => {
            let old_text = read_lossy(old_file)?;
            let new_text = read_lossy(new_file)?;
            if old_text == new_text {
                return Ok(ClassDiff::new("unchanged", None));
            }
            let old_lines = split_lines_keep_ends(&old_text);
            let new_lines = split_lines_keep_ends(&new_text);
            let lines = truncate_diff(unified_diff(
                &old_lines,
                &new_lines,
                &format!("a/{fqcn}.java"),
                &format!("b/{fqcn}.java"),
                3,
            ));
            Ok(ClassDiff::new("modified", Some(lines.concat())))
        }
    }
}

fn base_apk_for(
    materialized: &MaterializedApks,
    inspection: &ArtifactInspection,
    artifact_path: &Path,
) -> Result<PathBuf, Error> {
    if inspection.container_type == ContainerType::Apk || inspection.splits.is_empty() {
        return Ok(materialized
            .as_slice()
            .first()
            .map_or_else(|| artifact_path.to_path_buf(), |apk| apk.path.clone()));
    }
    let base_count = inspection
        .splits
        .iter()
        .filter(|split| split.is_base)
        .count();
    if base_count != 1 {
        return Err(Error::invalid_artifact(format!(
            "Expected exactly 1 base split in {}, found {}",
            artifact_path.display(),
            base_count
        )));
    }
    materialized
        .as_slice()
        .iter()
        .find(|apk| apk.is_base)
        .map(|apk| apk.path.clone())
        .ok_or_else(|| {
            Error::invalid_artifact(format!(
                "Base split missing from materialized {}",
                artifact_path.display()
            ))
        })
}

/// Compares two artifacts, optionally diffing requested classes with JADX.
pub fn compare_artifacts(
    old_path: &Path,
    new_path: &Path,
    requested_classes: &[String],
    executor: &dyn ToolExecutor,
    inspector: &dyn ArtifactInspector,
) -> Result<ArtifactComparison, Error> {
    let old_info = inspector.inspect(old_path)?;
    let new_info = inspector.inspect(new_path)?;

    let old_materialized = archives::materialize_artifact_apks(
        old_path,
        &old_info.splits,
        old_info.container_type == ContainerType::Apk,
    )?;
    let new_materialized = archives::materialize_artifact_apks(
        new_path,
        &new_info.splits,
        new_info.container_type == ContainerType::Apk,
    )?;

    let version_changed = old_info.version_name != new_info.version_name;
    let version_code_delta = i128::from(new_info.version_code) - i128::from(old_info.version_code);
    let signer_changed = old_info.signing_certificate_sha256 != new_info.signing_certificate_sha256;

    let old_splits: BTreeMap<&str, &SplitInfo> = old_info
        .splits
        .iter()
        .map(|split| (split.filename.as_str(), split))
        .collect();
    let new_splits: BTreeMap<&str, &SplitInfo> = new_info
        .splits
        .iter()
        .map(|split| (split.filename.as_str(), split))
        .collect();
    let added_splits: Vec<String> = new_splits
        .keys()
        .filter(|name| !old_splits.contains_key(**name))
        .map(|name| (*name).to_string())
        .collect();
    let removed_splits: Vec<String> = old_splits
        .keys()
        .filter(|name| !new_splits.contains_key(**name))
        .map(|name| (*name).to_string())
        .collect();
    let modified_splits: Vec<String> = old_splits
        .keys()
        .filter(|name| {
            new_splits
                .get(**name)
                .is_some_and(|new_split| old_splits[**name].sha256 != new_split.sha256)
        })
        .map(|name| (*name).to_string())
        .collect();

    let old_libs = hashes_for_materialized(old_materialized.as_slice(), "lib/")?;
    let new_libs = hashes_for_materialized(new_materialized.as_slice(), "lib/")?;
    let (added_native_libraries, removed_native_libraries, modified_native_libraries) =
        diff_hash_keys(&old_libs, &new_libs);

    let old_assets = hashes_for_materialized(old_materialized.as_slice(), "assets/")?;
    let new_assets = hashes_for_materialized(new_materialized.as_slice(), "assets/")?;
    let (added_assets, removed_assets, modified_assets) = diff_hash_keys(&old_assets, &new_assets);

    let mut classes_diff = ClassesDiff::default();
    if !requested_classes.is_empty() {
        if !executor.is_available(ToolKind::Jadx) {
            classes_diff.fill(requested_classes, "tool_unavailable", |_| {
                "JADX is not installed in cache".to_string()
            });
        } else {
            let temp =
                TempDir::new().map_err(|error| Error::io("create comparison temp dir", error))?;
            let old_base = base_apk_for(&old_materialized, &old_info, old_path)?;
            let new_base = base_apk_for(&new_materialized, &new_info, new_path)?;
            let old_sources = temp.path().join("old_src");
            let new_sources = temp.path().join("new_src");

            let packages: BTreeSet<String> = requested_classes
                .iter()
                .map(|class| match class.rsplit_once('.') {
                    Some((package, _)) => package.to_string(),
                    None => class.clone(),
                })
                .collect();
            let mut package_args = Vec::new();
            for package in &packages {
                package_args.push("--include-pkg".to_string());
                package_args.push(package.clone());
            }

            let mut old_args = vec![
                "-d".to_string(),
                old_sources.to_string_lossy().into_owned(),
                "--no-res".to_string(),
            ];
            old_args.extend(package_args.iter().cloned());
            old_args.push(old_base.to_string_lossy().into_owned());
            let mut new_args = vec![
                "-d".to_string(),
                new_sources.to_string_lossy().into_owned(),
                "--no-res".to_string(),
            ];
            new_args.extend(package_args.iter().cloned());
            new_args.push(new_base.to_string_lossy().into_owned());

            let old_result = executor
                .execute(ToolKind::Jadx, &old_args)
                .map_err(|error| Error::infrastructure(error.message()))?;
            let new_result = executor
                .execute(ToolKind::Jadx, &new_args)
                .map_err(|error| Error::infrastructure(error.message()))?;
            if old_result.exit_code != Some(0) {
                let message = format!(
                    "JADX failed on old artifact: {}",
                    result_stderr(&old_result.stderr)
                );
                classes_diff.fill(requested_classes, "error", |_| message.clone());
            } else if new_result.exit_code != Some(0) {
                let message = format!(
                    "JADX failed on new artifact: {}",
                    result_stderr(&new_result.stderr)
                );
                classes_diff.fill(requested_classes, "error", |_| message.clone());
            } else {
                for class in requested_classes {
                    let old_file = locate_class_source(&old_sources.join("sources"), class);
                    let new_file = locate_class_source(&new_sources.join("sources"), class);
                    let result =
                        compare_class_sources(old_file.as_deref(), new_file.as_deref(), class)?;
                    classes_diff.insert(class.clone(), result);
                }
            }
        }
    }

    Ok(ArtifactComparison {
        old_inspection: old_info.clone(),
        new_inspection: new_info.clone(),
        version_changed,
        version_code_delta,
        signer_changed,
        added_splits,
        removed_splits,
        modified_splits,
        added_permissions: Vec::new(),
        removed_permissions: Vec::new(),
        added_components: Vec::new(),
        removed_components: Vec::new(),
        dex_classes_delta: i128::from(new_info.dex_classes_count)
            - i128::from(old_info.dex_classes_count),
        dex_methods_delta: i128::from(new_info.dex_methods_count)
            - i128::from(old_info.dex_methods_count),
        added_native_libraries,
        removed_native_libraries,
        modified_native_libraries,
        added_assets,
        removed_assets,
        modified_assets,
        classes_diff,
    })
}

fn result_stderr(stderr: &str) -> String {
    stderr.chars().take(300).collect()
}

fn diff_hash_keys(
    old: &BTreeMap<String, Vec<String>>,
    new: &BTreeMap<String, Vec<String>>,
) -> (Vec<String>, Vec<String>, Vec<String>) {
    let added = new
        .keys()
        .filter(|key| !old.contains_key(*key))
        .cloned()
        .collect();
    let removed = old
        .keys()
        .filter(|key| !new.contains_key(*key))
        .cloned()
        .collect();
    let modified = old
        .keys()
        .filter(|key| new.get(*key).is_some_and(|value| value != &old[*key]))
        .cloned()
        .collect();
    (added, removed, modified)
}

/// Formats the human-readable comparison summary.
#[must_use]
pub fn format_comparison_summary(comparison: &ArtifactComparison) -> String {
    let separator = "=".repeat(60);
    let mut lines = Vec::new();
    lines.push(separator.clone());
    lines.push(format!(
        "APK COMPARISON: {}",
        comparison.old_inspection.package_name
    ));
    lines.push(separator.clone());

    let old_version = format!(
        "{} ({})",
        comparison.old_inspection.version_name, comparison.old_inspection.version_code
    );
    let new_version = format!(
        "{} ({})",
        comparison.new_inspection.version_name, comparison.new_inspection.version_code
    );
    let delta_sign = format!("{:+}", comparison.version_code_delta);
    lines.push(format!(
        "Version:      {old_version} -> {new_version} [delta: {delta_sign}]"
    ));

    let old_signer = signer_prefix(&comparison.old_inspection);
    let new_signer = signer_prefix(&comparison.new_inspection);
    let signer_status = if comparison.signer_changed {
        "CHANGED (ALERT!)"
    } else {
        "MATCH"
    };
    lines.push(format!(
        "Signer SHA:   {old_signer} -> {new_signer} [{signer_status}]"
    ));

    lines.push(format!(
        "Splits:       {} old, {} new",
        comparison.old_inspection.splits.len(),
        comparison.new_inspection.splits.len()
    ));
    if !comparison.added_splits.is_empty() {
        lines.push(format!(
            "  + Added:    {}",
            comparison.added_splits.join(", ")
        ));
    }
    if !comparison.removed_splits.is_empty() {
        lines.push(format!(
            "  - Removed:  {}",
            comparison.removed_splits.join(", ")
        ));
    }
    if !comparison.modified_splits.is_empty() {
        lines.push(format!(
            "  * Modified: {}",
            comparison.modified_splits.join(", ")
        ));
    }

    lines.push(format!(
        "DEX Classes:  {} -> {} [delta: {:+}]",
        comparison.old_inspection.dex_classes_count,
        comparison.new_inspection.dex_classes_count,
        comparison.dex_classes_delta
    ));
    lines.push(format!(
        "DEX Methods:  {} -> {} [delta: {:+}]",
        comparison.old_inspection.dex_methods_count,
        comparison.new_inspection.dex_methods_count,
        comparison.dex_methods_delta
    ));

    if !comparison.added_native_libraries.is_empty() {
        lines.push(format!(
            "Native Libs (+): {} added",
            comparison.added_native_libraries.len()
        ));
    }
    if !comparison.removed_native_libraries.is_empty() {
        lines.push(format!(
            "Native Libs (-): {} removed",
            comparison.removed_native_libraries.len()
        ));
    }
    if !comparison.modified_native_libraries.is_empty() {
        lines.push(format!(
            "Native Libs (*): {} modified",
            comparison.modified_native_libraries.len()
        ));
    }
    if !comparison.added_assets.is_empty() {
        lines.push(format!(
            "Assets (+):      {} added",
            comparison.added_assets.len()
        ));
    }
    if !comparison.removed_assets.is_empty() {
        lines.push(format!(
            "Assets (-):      {} removed",
            comparison.removed_assets.len()
        ));
    }
    if !comparison.modified_assets.is_empty() {
        lines.push(format!(
            "Assets (*):      {} modified",
            comparison.modified_assets.len()
        ));
    }

    if !comparison.classes_diff.is_empty() {
        lines.push("\nClass Diffs:".to_string());
        let mut entries: Vec<(&String, &ClassDiff)> = comparison.classes_diff.iter().collect();
        entries.sort_by(|left, right| left.0.cmp(right.0));
        for (class, result) in entries {
            lines.push(format!("  [{}] {class}", result.status.to_uppercase()));
            if result.status == "modified" {
                if let Some(diff_text) = &result.diff {
                    for diff_line in split_lines_keep_ends(diff_text) {
                        lines.push(format!("    {}", diff_line.trim_end_matches(['\r', '\n'])));
                    }
                }
            }
        }
    }

    lines.push(separator);
    lines.join("\n")
}

fn signer_prefix(inspection: &ArtifactInspection) -> String {
    let value = inspection
        .signing_certificate_sha256
        .clone()
        .unwrap_or_else(|| "None".to_string());
    let prefix: String = value.chars().take(16).collect();
    format!("{prefix}...")
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::code_inspection::{ArtifactInspector, ToolExecutor, ToolKind, ToolResult};
    use crate::error::Error;
    use std::cell::RefCell;
    use std::io::Write;
    use tempfile::TempDir;
    use zip::write::SimpleFileOptions;
    use zip::{CompressionMethod, ZipWriter};

    type InspectorHandler = Box<dyn Fn(&Path) -> Result<ArtifactInspection, Error>>;

    struct FakeInspector {
        handler: InspectorHandler,
    }

    impl ArtifactInspector for FakeInspector {
        fn inspect(&self, path: &Path) -> Result<ArtifactInspection, Error> {
            (self.handler)(path)
        }
    }

    type Handler = Box<dyn Fn(ToolKind, &[String]) -> Result<ToolResult, Error>>;

    struct FakeExecutor {
        available: std::collections::HashSet<ToolKind>,
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
                calls: RefCell::new(Vec::new()),
                handler: Box::new(handler),
            }
        }

        fn noop() -> Self {
            Self::new(&[], |_tool, _args| {
                Ok(ToolResult {
                    exit_code: Some(0),
                    stdout: String::new(),
                    stderr: String::new(),
                })
            })
        }

        fn calls(&self) -> Vec<(ToolKind, Vec<String>)> {
            self.calls.borrow().clone()
        }
    }

    impl ToolExecutor for FakeExecutor {
        fn is_available(&self, tool: ToolKind) -> bool {
            self.available.contains(&tool)
        }

        fn execute(&self, tool: ToolKind, args: &[String]) -> Result<ToolResult, Error> {
            self.calls.borrow_mut().push((tool, args.to_vec()));
            (self.handler)(tool, args)
        }
    }

    fn inspection(
        version_name: &str,
        version_code: u64,
        classes: u64,
        methods: u64,
        splits: Vec<SplitInfo>,
    ) -> ArtifactInspection {
        ArtifactInspection {
            file_path: "/mock/path.apk".to_string(),
            container_type: ContainerType::Apkm,
            file_size: 10_000_000,
            sha256: "mock_sha256".to_string(),
            package_name: "com.example.app".to_string(),
            version_name: version_name.to_string(),
            version_code,
            min_sdk: Some(23),
            target_sdk: Some(34),
            signing_certificate_sha256: Some(
                "622850867847ccb7a1371bc42c865b1137fa51bd19987dc81b53815c9a9817bf".to_string(),
            ),
            splits,
            dex_classes_count: classes,
            dex_methods_count: methods,
            dex_files: vec!["classes.dex".to_string()],
            native_libraries: vec!["lib/arm64-v8a/libfoo.so".to_string()],
            resources: vec!["res/values/strings.xml".to_string()],
            assets: vec!["assets/config.json".to_string()],
            warnings: Vec::new(),
        }
    }

    fn apk_inspection(path: &Path) -> Result<ArtifactInspection, Error> {
        let mut value = inspection("1", 1, 0, 0, Vec::new());
        value.container_type = ContainerType::Apk;
        value.file_path = path.display().to_string();
        Ok(value)
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

    #[test]
    fn comparison_summary_formatting_matches_python_layout() {
        let old = inspection("1.0.0", 100, 1000, 5000, Vec::new());
        let new = inspection(
            "1.1.0",
            110,
            1200,
            5500,
            vec![SplitInfo {
                filename: "config.fr.apk".to_string(),
                split_name: "config.fr".to_string(),
                sha256: "abc".to_string(),
                size: 100,
                is_base: false,
            }],
        );
        let comparison = ArtifactComparison {
            old_inspection: old,
            new_inspection: new,
            version_changed: true,
            version_code_delta: 10,
            signer_changed: false,
            added_splits: vec!["config.fr.apk".to_string()],
            removed_splits: Vec::new(),
            modified_splits: Vec::new(),
            added_permissions: Vec::new(),
            removed_permissions: Vec::new(),
            added_components: Vec::new(),
            removed_components: Vec::new(),
            dex_classes_delta: 200,
            dex_methods_delta: 500,
            added_native_libraries: Vec::new(),
            removed_native_libraries: Vec::new(),
            modified_native_libraries: Vec::new(),
            added_assets: Vec::new(),
            removed_assets: Vec::new(),
            modified_assets: Vec::new(),
            classes_diff: ClassesDiff::default(),
        };
        let summary = format_comparison_summary(&comparison);
        assert!(summary.contains("com.example.app"));
        assert!(summary.contains("1.0.0 (100) -> 1.1.0 (110) [delta: +10]"));
        assert!(summary.contains("[MATCH]"));
        assert!(summary.contains("+ Added:    config.fr.apk"));
        assert!(summary.contains("DEX Classes:  1000 -> 1200 [delta: +200]"));
        assert!(summary.starts_with("=".repeat(60).as_str()));
        assert!(summary.ends_with("=".repeat(60).as_str()));
    }

    #[test]
    fn class_source_statuses_are_added_removed_missing_modified_unchanged() {
        let temp = TempDir::new().expect("temp");
        let old_dir = temp.path().join("old/sources/com/example");
        let new_dir = temp.path().join("new/sources/com/example");
        fs::create_dir_all(&old_dir).expect("old dir");
        fs::create_dir_all(&new_dir).expect("new dir");
        fs::write(old_dir.join("Same.java"), "class Same { int x = 1; }\n").expect("same old");
        fs::write(new_dir.join("Same.java"), "class Same { int x = 1; }\n").expect("same new");
        fs::write(old_dir.join("Mod.kt"), "class Mod { val v = 1 }\n").expect("mod old");
        fs::write(new_dir.join("Mod.kt"), "class Mod { val v = 2 }\n").expect("mod new");
        fs::write(new_dir.join("Added.java"), "class Added {}\n").expect("added");
        fs::write(old_dir.join("Removed.java"), "class Removed {}\n").expect("removed");
        fs::write(
            old_dir.join("Outer.java"),
            "class Outer { class Inner {} }\n",
        )
        .expect("outer");

        let old_sources = temp.path().join("old/sources");
        let new_sources = temp.path().join("new/sources");
        let same = compare_class_sources(
            locate_class_source(&old_sources, "com.example.Same").as_deref(),
            locate_class_source(&new_sources, "com.example.Same").as_deref(),
            "com.example.Same",
        )
        .expect("same");
        assert_eq!(same.status, "unchanged");
        assert_eq!(same.diff, None);
        let modified = compare_class_sources(
            locate_class_source(&old_sources, "com.example.Mod").as_deref(),
            locate_class_source(&new_sources, "com.example.Mod").as_deref(),
            "com.example.Mod",
        )
        .expect("modified");
        assert_eq!(modified.status, "modified");
        assert!(modified
            .diff
            .as_deref()
            .expect("diff")
            .contains("-class Mod { val v = 1 }"));
        assert!(modified
            .diff
            .as_deref()
            .expect("diff")
            .contains("+class Mod { val v = 2 }"));
        let added = compare_class_sources(
            locate_class_source(&old_sources, "com.example.Added").as_deref(),
            locate_class_source(&new_sources, "com.example.Added").as_deref(),
            "com.example.Added",
        )
        .expect("added");
        assert_eq!(added.status, "added");
        let removed = compare_class_sources(
            locate_class_source(&old_sources, "com.example.Removed").as_deref(),
            locate_class_source(&new_sources, "com.example.Removed").as_deref(),
            "com.example.Removed",
        )
        .expect("removed");
        assert_eq!(removed.status, "removed");
        let missing = compare_class_sources(
            locate_class_source(&old_sources, "com.example.Nope").as_deref(),
            locate_class_source(&new_sources, "com.example.Nope").as_deref(),
            "com.example.Nope",
        )
        .expect("missing");
        assert_eq!(missing.status, "missing");
        assert!(missing
            .diff
            .expect("missing diff")
            .contains("not found in old or new artifact"));
        assert_eq!(
            locate_class_source(&old_sources, "com.example.Outer$Inner"),
            Some(old_dir.join("Outer.java"))
        );
    }

    #[test]
    fn artifact_hashes_identify_modified_native_libs_and_assets() {
        let temp = TempDir::new().expect("temp");
        let old_path = temp.path().join("v1.apk");
        let new_path = temp.path().join("v2.apk");
        write_zip(
            &old_path,
            &[
                ("lib/arm64-v8a/libunchanged.so", b"same_code"),
                ("lib/arm64-v8a/libmodified.so", b"old_code"),
                ("assets/config.json", b"{\"version\": 1}"),
            ],
        );
        write_zip(
            &new_path,
            &[
                ("lib/arm64-v8a/libunchanged.so", b"same_code"),
                ("lib/arm64-v8a/libmodified.so", b"new_code_modified"),
                ("assets/config.json", b"{\"version\": 2}"),
                ("assets/new_asset.txt", b"new"),
            ],
        );
        let inspector = FakeInspector {
            handler: Box::new(apk_inspection),
        };
        let executor = FakeExecutor::noop();
        let comparison =
            compare_artifacts(&old_path, &new_path, &[], &executor, &inspector).expect("compare");
        assert!(comparison
            .modified_native_libraries
            .contains(&"lib/arm64-v8a/libmodified.so".to_string()));
        assert!(!comparison
            .modified_native_libraries
            .contains(&"lib/arm64-v8a/libunchanged.so".to_string()));
        assert!(comparison
            .modified_assets
            .contains(&"assets/config.json".to_string()));
        assert!(comparison
            .added_assets
            .contains(&"assets/new_asset.txt".to_string()));
    }

    #[test]
    fn jadx_class_comparison_uses_include_pkg_and_reports_modified() {
        let temp = TempDir::new().expect("temp");
        let old_path = temp.path().join("v1.apk");
        let new_path = temp.path().join("v2.apk");
        write_zip(&old_path, &[("classes.dex", b"dex1")]);
        write_zip(&new_path, &[("classes.dex", b"dex2")]);
        let inspector = FakeInspector {
            handler: Box::new(apk_inspection),
        };
        let executor = FakeExecutor::new(&[ToolKind::Jadx], |_tool, args| {
            let out =
                PathBuf::from(&args[args.iter().position(|arg| arg == "-d").expect("-d") + 1]);
            let sources = out.join("sources/com/test");
            fs::create_dir_all(&sources).expect("sources dir");
            if args.last().expect("apk").ends_with("v1.apk") {
                fs::write(sources.join("Target.java"), "class Target { int a = 1; }\n")
                    .expect("old target");
            } else {
                fs::write(sources.join("Target.java"), "class Target { int a = 2; }\n")
                    .expect("new target");
            }
            Ok(ToolResult {
                exit_code: Some(0),
                stdout: String::new(),
                stderr: String::new(),
            })
        });
        let comparison = compare_artifacts(
            &old_path,
            &new_path,
            &["com.test.Target".to_string()],
            &executor,
            &inspector,
        )
        .expect("compare");
        assert!(comparison
            .classes_diff
            .get("com.test.Target")
            .is_some_and(|diff| diff.status == "modified"));
        let calls = executor.calls();
        assert_eq!(calls.len(), 2);
        for (_tool, args) in calls {
            assert!(args.contains(&"--include-pkg".to_string()));
            assert!(args.contains(&"com.test".to_string()));
        }
        let summary = format_comparison_summary(&comparison);
        assert!(summary.contains("[MODIFIED] com.test.Target"));
    }

    #[test]
    fn missing_jadx_reports_tool_unavailable_for_every_class() {
        let temp = TempDir::new().expect("temp");
        let old_path = temp.path().join("v1.apk");
        let new_path = temp.path().join("v2.apk");
        write_zip(&old_path, &[("classes.dex", b"dex1")]);
        write_zip(&new_path, &[("classes.dex", b"dex2")]);
        let inspector = FakeInspector {
            handler: Box::new(apk_inspection),
        };
        let executor = FakeExecutor::noop();
        let comparison = compare_artifacts(
            &old_path,
            &new_path,
            &["com.test.A".to_string(), "com.test.B".to_string()],
            &executor,
            &inspector,
        )
        .expect("compare");
        for class in ["com.test.A", "com.test.B"] {
            let diff = comparison.classes_diff.get(class).expect("class");
            assert_eq!(diff.status, "tool_unavailable");
            assert_eq!(diff.diff.as_deref(), Some("JADX is not installed in cache"));
        }
        assert!(executor.calls().is_empty());
    }

    #[test]
    fn jadx_failure_reports_error_status_with_truncated_stderr() {
        let temp = TempDir::new().expect("temp");
        let old_path = temp.path().join("v1.apk");
        let new_path = temp.path().join("v2.apk");
        write_zip(&old_path, &[("classes.dex", b"dex1")]);
        write_zip(&new_path, &[("classes.dex", b"dex2")]);
        let inspector = FakeInspector {
            handler: Box::new(apk_inspection),
        };
        let executor = FakeExecutor::new(&[ToolKind::Jadx], |_tool, _args| {
            Ok(ToolResult {
                exit_code: Some(1),
                stdout: String::new(),
                stderr: "x".repeat(400),
            })
        });
        let comparison = compare_artifacts(
            &old_path,
            &new_path,
            &["com.test.Target".to_string()],
            &executor,
            &inspector,
        )
        .expect("compare");
        let diff = comparison
            .classes_diff
            .get("com.test.Target")
            .expect("class");
        assert_eq!(diff.status, "error");
        let text = diff.diff.as_deref().expect("diff");
        assert!(text.starts_with("JADX failed on old artifact: "));
        assert_eq!(text.len(), "JADX failed on old artifact: ".len() + 300);
    }

    #[test]
    fn wire_json_uses_python_field_names_and_class_order() {
        let comparison = ArtifactComparison {
            old_inspection: inspection("1", 1, 0, 0, Vec::new()),
            new_inspection: inspection("1", 1, 0, 0, Vec::new()),
            version_changed: false,
            version_code_delta: 0,
            signer_changed: false,
            added_splits: Vec::new(),
            removed_splits: Vec::new(),
            modified_splits: Vec::new(),
            added_permissions: Vec::new(),
            removed_permissions: Vec::new(),
            added_components: Vec::new(),
            removed_components: Vec::new(),
            dex_classes_delta: 0,
            dex_methods_delta: 0,
            added_native_libraries: Vec::new(),
            removed_native_libraries: Vec::new(),
            modified_native_libraries: Vec::new(),
            added_assets: Vec::new(),
            removed_assets: Vec::new(),
            modified_assets: Vec::new(),
            classes_diff: {
                let mut diff = ClassesDiff::default();
                diff.insert("z.Class".to_string(), ClassDiff::new("added", None));
                diff.insert(
                    "a.Class".to_string(),
                    ClassDiff::new("modified", Some("x".to_string())),
                );
                diff
            },
        };
        let value = serde_json::to_value(&comparison).expect("serialize");
        assert_eq!(value["versionChanged"], false);
        assert_eq!(
            value["classesDiff"]["z.Class"]["diff"],
            serde_json::Value::Null
        );
        let keys: Vec<&str> = value["classesDiff"]
            .as_object()
            .expect("object")
            .keys()
            .map(String::as_str)
            .collect();
        assert_eq!(keys, vec!["a.Class", "z.Class"]);
    }
}
