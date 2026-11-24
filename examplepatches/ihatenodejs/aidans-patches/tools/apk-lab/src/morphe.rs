//! Native Morphe patch selection, command construction, execution and
//! postcondition verification.
//!
//! The module mirrors the retired Python implementation:
//!
//! * patches-list metadata is parsed in document order;
//! * `check --all` selects every compatible patch while the deployment
//!   default selects only `default: true` patches;
//! * explicit selections expand transitive dependencies and reject missing
//!   dependencies and cycles;
//! * `KEY=VALUE` options are type-checked against the selected closure;
//! * one case is generated for defaults plus one independent inversion per
//!   declared boolean option;
//! * Morphe command arguments open one `-p` group per selection, because a
//!   shared `-p` silently drops every option group but the first;
//! * a case succeeds only when Morphe's result JSON and the real output
//!   artifact satisfy every postcondition.
//!
//! External programs go through [`crate::process`]. Tests inject fake
//! executables and fake inspectors; nothing here invokes Python.

use crate::archives;
use crate::dex_strings;
use crate::error::Error;
use crate::inspection;
use crate::models::{ArtifactInspection, ContainerType, ExitCode};
use crate::process::{self, ProcessSpec};
use crate::tools::{self, ToolEnvironment, ToolManager, ToolType};
use crate::workspace::WorkspaceManager;
use regex::Regex;
use serde::de::{MapAccess, Visitor};
use serde::ser::SerializeMap;
use serde::{Deserialize, Deserializer, Serialize, Serializer};
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::collections::{BTreeMap, BTreeSet};
use std::fmt;
use std::fs;
use std::io::{Read, Seek};
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicBool, AtomicUsize, Ordering};
use std::sync::{Arc, LazyLock, Mutex};
use std::time::{Duration, Instant};
use tempfile::TempDir;
use zip::ZipArchive;

/// Whether an archive member can be changed by a patch and must therefore
/// count toward the "something actually changed" postcondition.
#[must_use]
pub fn is_patchable_member(name: &str) -> bool {
    name == "AndroidManifest.xml"
        || name == "resources.arsc"
        || name.ends_with(".dex")
        || name.starts_with("res/")
        || name.starts_with("assets/")
        || name.starts_with("lib/")
}

/// Insertion-ordered string-keyed map. Python's dictionaries preserve
/// declaration order; using sorted maps here would change serialized reports.
#[derive(Debug, Clone, PartialEq, Eq, Default)]
pub struct OrderedMap<T> {
    entries: Vec<(String, T)>,
}

impl<T> OrderedMap<T> {
    #[must_use]
    pub fn new() -> Self {
        Self {
            entries: Vec::new(),
        }
    }

    pub fn from_pairs<I, K>(pairs: I) -> Self
    where
        I: IntoIterator<Item = (K, T)>,
        K: Into<String>,
    {
        let mut map = Self::new();
        for (key, value) in pairs {
            map.insert(key, value);
        }
        map
    }

    #[must_use]
    pub fn get(&self, key: &str) -> Option<&T> {
        self.entries
            .iter()
            .find(|(candidate, _)| candidate == key)
            .map(|(_, value)| value)
    }

    /// Inserts a key, retaining its original position on replacement.
    pub fn insert(&mut self, key: impl Into<String>, value: T) -> Option<T> {
        let key = key.into();
        if let Some((_, slot)) = self
            .entries
            .iter_mut()
            .find(|(candidate, _)| *candidate == key)
        {
            return Some(std::mem::replace(slot, value));
        }
        self.entries.push((key, value));
        None
    }

    pub fn iter(&self) -> impl Iterator<Item = (&String, &T)> {
        self.entries.iter().map(|(key, value)| (key, value))
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.entries.len()
    }

    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.entries.is_empty()
    }

    #[must_use]
    pub fn entries(&self) -> &[(String, T)] {
        &self.entries
    }
}

impl<T: Serialize> Serialize for OrderedMap<T> {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        let mut map = serializer.serialize_map(Some(self.entries.len()))?;
        for (key, value) in &self.entries {
            map.serialize_entry(key, value)?;
        }
        map.end()
    }
}

impl<'de, T: Deserialize<'de>> Deserialize<'de> for OrderedMap<T> {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: Deserializer<'de>,
    {
        struct OrderedVisitor<T>(std::marker::PhantomData<T>);

        impl<'de, T: Deserialize<'de>> Visitor<'de> for OrderedVisitor<T> {
            type Value = OrderedMap<T>;

            fn expecting(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
                formatter.write_str("an object")
            }

            fn visit_map<A>(self, mut map: A) -> Result<Self::Value, A::Error>
            where
                A: MapAccess<'de>,
            {
                let mut result = OrderedMap::new();
                while let Some((key, value)) = map.next_entry::<String, T>()? {
                    result.insert(key, value);
                }
                Ok(result)
            }
        }

        deserializer.deserialize_map(OrderedVisitor(std::marker::PhantomData))
    }
}

/// Patch option values keyed in declaration order.
pub type PatchOptions = OrderedMap<Value>;
/// Tool versions keyed in report order.
pub type ToolVersions = OrderedMap<String>;

#[derive(Debug, Clone, PartialEq)]
pub struct PatchOptionDef {
    pub key: String,
    pub title: String,
    pub description: String,
    pub required: bool,
    pub default: Value,
    pub option_type: String,
}

impl PatchOptionDef {
    #[must_use]
    pub fn new(
        key: impl Into<String>,
        title: impl Into<String>,
        description: impl Into<String>,
        required: bool,
        default: Value,
        option_type: impl Into<String>,
    ) -> Self {
        Self {
            key: key.into(),
            title: title.into(),
            description: description.into(),
            required,
            default,
            option_type: option_type.into(),
        }
    }

    fn is_boolean(&self) -> bool {
        self.default.is_boolean() || self.option_type.contains("Boolean")
    }
}

#[derive(Debug, Clone, PartialEq)]
pub struct PatchDef {
    pub name: String,
    pub description: String,
    pub default: bool,
    pub dependencies: Vec<String>,
    pub options: Vec<PatchOptionDef>,
}

#[derive(Debug, Clone, PartialEq)]
pub struct PatchSelection {
    pub definition: PatchDef,
    pub options: PatchOptions,
}

#[derive(Debug, Clone, PartialEq)]
pub struct PatchTestCase {
    pub patch_name: String,
    pub options: PatchOptions,
    pub dependencies: Vec<String>,
}

/// Loads `patches-list.json`. Missing files are usage errors at the boundary.
pub fn load_patches_list(path: impl AsRef<Path>) -> Result<Value, Error> {
    let path = path.as_ref();
    let text = fs::read_to_string(path).map_err(|error| {
        if error.kind() == std::io::ErrorKind::NotFound {
            Error::usage(format!(
                "patches-list.json not found at {}",
                resolve_path(path).display()
            ))
        } else {
            Error::io(format!("read {}", path.display()), error)
        }
    })?;
    serde_json::from_str(&text)
        .map_err(|error| Error::usage(format!("invalid patches-list.json: {error}")))
}

fn patch_string(object: &Value, key: &str) -> Option<String> {
    object.get(key).and_then(Value::as_str).map(str::to_string)
}

fn patch_bool(object: &Value, key: &str, default: bool) -> bool {
    object.get(key).and_then(Value::as_bool).unwrap_or(default)
}

/// Parses every patch compatible with `package_name` in metadata order.
pub fn parse_all_compatible_patches(
    package_name: &str,
    patches_list_data: &Value,
) -> Vec<PatchDef> {
    let mut compatible = Vec::new();
    let Some(raw_patches) = patches_list_data.get("patches").and_then(Value::as_array) else {
        return compatible;
    };

    for patch in raw_patches {
        let is_compatible = patch
            .get("compatiblePackages")
            .and_then(Value::as_array)
            .is_some_and(|packages| {
                packages.iter().any(|candidate| {
                    candidate.get("packageName").and_then(Value::as_str) == Some(package_name)
                })
            });
        if !is_compatible {
            continue;
        }

        let options = patch
            .get("options")
            .and_then(Value::as_array)
            .map(|options| {
                options
                    .iter()
                    .filter_map(|option| {
                        Some(PatchOptionDef {
                            key: option.get("key")?.as_str()?.to_string(),
                            title: patch_string(option, "title").unwrap_or_default(),
                            description: patch_string(option, "description").unwrap_or_default(),
                            required: patch_bool(option, "required", false),
                            default: option.get("default").cloned().unwrap_or(Value::Null),
                            option_type: patch_string(option, "type")
                                .unwrap_or_else(|| "String".to_string()),
                        })
                    })
                    .collect()
            })
            .unwrap_or_default();

        compatible.push(PatchDef {
            name: patch_string(patch, "name").unwrap_or_default(),
            description: patch_string(patch, "description").unwrap_or_default(),
            default: patch_bool(patch, "default", true),
            dependencies: patch
                .get("dependencies")
                .and_then(Value::as_array)
                .map(|dependencies| {
                    dependencies
                        .iter()
                        .filter_map(Value::as_str)
                        .map(str::to_string)
                        .collect()
                })
                .unwrap_or_default(),
            options,
        });
    }
    compatible
}

/// Finds compatible patches, filtered by explicit request or defaults.
///
/// `all_patches == true` is the `check --all` selector and deliberately keeps
/// every compatible patch. Deployment uses the default closure instead.
#[must_use]
pub fn get_compatible_patches(
    package_name: &str,
    patches_list_data: &Value,
    requested_patches: Option<&[String]>,
    all_patches: bool,
) -> Vec<PatchDef> {
    let all_compat = parse_all_compatible_patches(package_name, patches_list_data);
    if let Some(requested) = requested_patches {
        if !requested.is_empty() {
            return all_compat
                .into_iter()
                .filter(|patch| requested.iter().any(|name| name == &patch.name))
                .collect();
        }
    }
    if all_patches {
        return all_compat;
    }
    all_compat
        .into_iter()
        .filter(|patch| patch.default)
        .collect()
}

/// Resolves explicit/default selections, transitive dependencies and options.
pub fn resolve_patch_selections(
    package_name: &str,
    requested_patches: Option<&[String]>,
    all_defaults: bool,
    raw_options: Option<&[String]>,
    patches_list_data: &Value,
) -> Result<Vec<PatchSelection>, Error> {
    let compat_list = parse_all_compatible_patches(package_name, patches_list_data);
    let compat_map: BTreeMap<&str, &PatchDef> = compat_list
        .iter()
        .map(|patch| (patch.name.as_str(), patch))
        .collect();

    let initial_names: Vec<String> = if all_defaults {
        compat_list
            .iter()
            .filter(|patch| patch.default)
            .map(|patch| patch.name.clone())
            .collect()
    } else {
        let requested = requested_patches.unwrap_or(&[]).to_vec();
        for name in &requested {
            if !compat_map.contains_key(name.as_str()) {
                return Err(Error::usage(format!(
                    "Patch '{name}' is not compatible with or not found for package '{package_name}'"
                )));
            }
        }
        requested
    };

    // Transitive dependency expansion with cycle detection.
    let mut selected_set: BTreeSet<String> = BTreeSet::new();
    let mut visiting: BTreeSet<String> = BTreeSet::new();

    fn visit(
        patch_name: &str,
        chain: &[String],
        package_name: &str,
        compat_map: &BTreeMap<&str, &PatchDef>,
        selected_set: &mut BTreeSet<String>,
        visiting: &mut BTreeSet<String>,
    ) -> Result<(), Error> {
        if visiting.contains(patch_name) {
            let mut cycle = chain.to_vec();
            cycle.push(patch_name.to_string());
            return Err(Error::usage(format!(
                "Circular dependency detected: {}",
                cycle.join(" -> ")
            )));
        }
        if selected_set.contains(patch_name) {
            return Ok(());
        }
        let Some(definition) = compat_map.get(patch_name) else {
            let parent = chain.last().map_or("root", String::as_str);
            return Err(Error::usage(format!(
                "Dependency '{patch_name}' required by '{parent}' is not found or not compatible with package '{package_name}'"
            )));
        };
        visiting.insert(patch_name.to_string());
        for dependency in &definition.dependencies {
            visit(
                dependency,
                &[chain, &[patch_name.to_string()]].concat(),
                package_name,
                compat_map,
                selected_set,
                visiting,
            )?;
        }
        visiting.remove(patch_name);
        selected_set.insert(patch_name.to_string());
        Ok(())
    }

    for name in &initial_names {
        visit(
            name,
            &[],
            package_name,
            &compat_map,
            &mut selected_set,
            &mut visiting,
        )?;
    }

    // Preserve metadata order and emit every patch once.
    let ordered_patches: Vec<&PatchDef> = compat_list
        .iter()
        .filter(|patch| selected_set.contains(&patch.name))
        .collect();

    let mut patch_options: BTreeMap<&str, PatchOptions> = BTreeMap::new();
    for patch in &ordered_patches {
        patch_options.insert(
            patch.name.as_str(),
            PatchOptions::from_pairs(
                patch
                    .options
                    .iter()
                    .map(|option| (option.key.clone(), option.default.clone())),
            ),
        );
    }

    if let Some(raw_options) = raw_options {
        for raw in raw_options {
            let Some((key, raw_value)) = raw.split_once('=') else {
                return Err(Error::usage(format!(
                    "Invalid option format '{raw}', expected KEY=VALUE"
                )));
            };
            let matching: Vec<&PatchDef> = ordered_patches
                .iter()
                .copied()
                .filter(|patch| patch.options.iter().any(|option| option.key == key))
                .collect();
            if matching.is_empty() {
                return Err(Error::usage(format!("Unknown patch option '{key}'")));
            }
            if matching.len() > 1 {
                let names: Vec<String> = matching.iter().map(|patch| patch.name.clone()).collect();
                return Err(Error::usage(format!(
                    "Ambiguous patch option '{key}': declared by multiple selected patches ({})",
                    python_list(&names)
                )));
            }
            let patch = matching[0];
            let option = patch
                .options
                .iter()
                .find(|option| option.key == key)
                .expect("matching option");
            let coerced = if option.is_boolean() {
                match raw_value.trim().to_ascii_lowercase().as_str() {
                    "true" => Value::Bool(true),
                    "false" => Value::Bool(false),
                    _ => {
                        return Err(Error::usage(format!(
                            "Invalid boolean value '{raw_value}' for option '{key}', must be 'true' or 'false'"
                        )))
                    }
                }
            } else {
                Value::String(raw_value.to_string())
            };
            if let Some(options) = patch_options.get_mut(patch.name.as_str()) {
                options.insert(key, coerced);
            }
        }
    }

    for patch in &ordered_patches {
        for option in &patch.options {
            if option.required {
                let value = patch_options
                    .get(patch.name.as_str())
                    .and_then(|options| options.get(&option.key));
                if value.is_none_or(Value::is_null) {
                    return Err(Error::usage(format!(
                        "Required patch option '{}' for patch '{}' was not provided",
                        option.key, patch.name
                    )));
                }
            }
        }
    }

    Ok(ordered_patches
        .into_iter()
        .map(|patch| PatchSelection {
            definition: patch.clone(),
            options: patch_options
                .remove(patch.name.as_str())
                .unwrap_or_default(),
        })
        .collect())
}

/// Default case plus one independent inversion per declared boolean option.
#[must_use]
pub fn generate_test_cases(patch: &PatchDef) -> Vec<PatchTestCase> {
    let default_options = PatchOptions::from_pairs(
        patch
            .options
            .iter()
            .map(|option| (option.key.clone(), option.default.clone())),
    );

    let mut cases = vec![PatchTestCase {
        patch_name: patch.name.clone(),
        options: default_options.clone(),
        dependencies: patch.dependencies.clone(),
    }];

    for option in &patch.options {
        if option.is_boolean() && option.default.is_boolean() {
            let mut boundary = default_options.clone();
            boundary.insert(
                &option.key,
                Value::Bool(!option.default.as_bool().unwrap_or(false)),
            );
            cases.push(PatchTestCase {
                patch_name: patch.name.clone(),
                options: boundary,
                dependencies: patch.dependencies.clone(),
            });
        }
    }

    cases
}

fn android_package_regex() -> &'static Regex {
    static REGEX: LazyLock<Regex> = LazyLock::new(|| {
        Regex::new(r"^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$")
            .expect("static package regex")
    });
    &REGEX
}

/// Returns the package a case may legitimately declare after patching.
///
/// Only an explicit, syntactically valid `packageName` option may change the
/// identity (the Clone App exception). Everything else must preserve it.
#[must_use]
pub fn resolve_expected_output_package(test_case: &PatchTestCase, input_package: &str) -> String {
    let Some(declared) = test_case.options.get("packageName").and_then(Value::as_str) else {
        return input_package.to_string();
    };
    let candidate = declared.trim();
    if candidate.is_empty() || candidate == input_package {
        return input_package.to_string();
    }
    if !android_package_regex().is_match(candidate) {
        return input_package.to_string();
    }
    candidate.to_string()
}

fn python_list(items: &[String]) -> String {
    let quoted: Vec<String> = items.iter().map(|item| format!("'{item}'")).collect();
    format!("[{}]", quoted.join(", "))
}

fn resolve_path(path: &Path) -> PathBuf {
    fs::canonicalize(path)
        .unwrap_or_else(|_| std::path::absolute(path).unwrap_or_else(|_| path.to_path_buf()))
}

/// Inputs and output locations for one Morphe invocation.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PatchCommandPaths {
    pub mpp: PathBuf,
    pub artifact: PathBuf,
    pub out_apk: PathBuf,
    pub result_json: PathBuf,
    pub scratch_dir: PathBuf,
    pub force: bool,
}

impl PatchCommandPaths {
    #[must_use]
    pub fn new(
        mpp: impl AsRef<Path>,
        artifact: impl AsRef<Path>,
        out_apk: impl AsRef<Path>,
        result_json: impl AsRef<Path>,
        scratch_dir: impl AsRef<Path>,
    ) -> Self {
        Self {
            mpp: resolve_path(mpp.as_ref()),
            artifact: resolve_path(artifact.as_ref()),
            out_apk: resolve_path(out_apk.as_ref()),
            result_json: resolve_path(result_json.as_ref()),
            scratch_dir: resolve_path(scratch_dir.as_ref()),
            force: false,
        }
    }

    #[must_use]
    pub fn with_force(mut self, force: bool) -> Self {
        self.force = force;
        self
    }
}

fn option_string(value: &Value) -> Option<String> {
    match value {
        Value::Null => None,
        Value::Bool(flag) => Some(if *flag { "true" } else { "false" }.to_string()),
        Value::String(text) => Some(text.clone()),
        Value::Number(number) => Some(number.to_string()),
        other => Some(other.to_string()),
    }
}

/// Builds `morphe patch` arguments with one `-p` group per selection.
///
/// Morphe binds `-O` options to the `-e` of the same `-p` group, so every
/// selection opens its own group. A single shared `-p` drops the options of
/// every patch but the first.
#[must_use]
pub fn build_morphe_patch_set_cmd(
    selections: &[PatchSelection],
    paths: &PatchCommandPaths,
) -> Vec<String> {
    let mut cmd = vec!["patch".to_string(), "--exclusive".to_string()];
    let bundle = paths.mpp.to_string_lossy().into_owned();
    for selection in selections {
        cmd.push("-p".to_string());
        cmd.push(bundle.clone());

        let mut options: Vec<(&String, &Value)> = selection.options.iter().collect();
        options.sort_by(|left, right| left.0.cmp(right.0));
        for (key, value) in options {
            let Some(rendered) = option_string(value) else {
                continue;
            };
            cmd.push("-O".to_string());
            cmd.push(format!("{key}={rendered}"));
        }
        cmd.push("-e".to_string());
        cmd.push(selection.definition.name.clone());
    }

    cmd.extend([
        "--unsigned".to_string(),
        "-t".to_string(),
        paths.scratch_dir.to_string_lossy().into_owned(),
        "-o".to_string(),
        paths.out_apk.to_string_lossy().into_owned(),
        "-r".to_string(),
        paths.result_json.to_string_lossy().into_owned(),
    ]);
    if paths.force {
        cmd.push("-f".to_string());
    }
    cmd.push(paths.artifact.to_string_lossy().into_owned());
    cmd
}

/// Builds a command for one patch case, appending one group per dependency.
#[must_use]
pub fn build_morphe_patch_cmd(
    patch_name: &str,
    options: &PatchOptions,
    dependencies: &[String],
    paths: &PatchCommandPaths,
) -> Vec<String> {
    let mut selections = vec![PatchSelection {
        definition: PatchDef {
            name: patch_name.to_string(),
            description: String::new(),
            default: true,
            dependencies: dependencies.to_vec(),
            options: Vec::new(),
        },
        options: options.clone(),
    }];
    for dependency in dependencies {
        selections.push(PatchSelection {
            definition: PatchDef {
                name: dependency.clone(),
                description: String::new(),
                default: true,
                dependencies: Vec::new(),
                options: Vec::new(),
            },
            options: PatchOptions::new(),
        });
    }
    build_morphe_patch_set_cmd(&selections, paths)
}

/// The pinned Morphe launcher: either a binary or `java -jar <jar>`.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MorpheTool {
    pub program: PathBuf,
    pub prefix_args: Vec<String>,
    pub version: String,
}

impl MorpheTool {
    #[must_use]
    pub fn executable(program: impl Into<PathBuf>, version: impl Into<String>) -> Self {
        Self {
            program: program.into(),
            prefix_args: Vec::new(),
            version: version.into(),
        }
    }

    /// Resolves the cached, checksum-verified Morphe artifact.
    pub fn pinned(manager: &ToolManager, java: impl Into<PathBuf>) -> Result<Self, Error> {
        if !manager.is_tool_installed("morphe") {
            return Err(Error::usage(
                "Tool 'morphe' is not installed. Run 'apk-lab setup' first.",
            ));
        }
        let spec = manager
            .spec("morphe")
            .map_err(|error| Error::usage(error.message()))?;
        let executable = manager
            .executable_path("morphe")
            .map_err(|error| Error::usage(error.message()))?;
        let program;
        let mut prefix_args = Vec::new();
        if spec.tool_type == ToolType::Jar {
            program = java.into();
            prefix_args.push("-jar".to_string());
            prefix_args.push(executable.to_string_lossy().into_owned());
        } else {
            program = executable;
        }
        Ok(Self {
            program,
            prefix_args,
            version: spec.version.clone(),
        })
    }
}

/// Shared cooperative cancellation flag.
#[derive(Debug, Clone, Default)]
pub struct Cancellation {
    flag: Arc<AtomicBool>,
}

impl Cancellation {
    #[must_use]
    pub fn new() -> Self {
        Self::default()
    }

    pub fn cancel(&self) {
        self.flag.store(true, Ordering::SeqCst);
    }

    #[must_use]
    pub fn is_cancelled(&self) -> bool {
        self.flag.load(Ordering::SeqCst)
    }

    fn shared(&self) -> Arc<AtomicBool> {
        Arc::clone(&self.flag)
    }
}

/// Artifact inspection boundary, injectable for offline contract tests.
pub trait ArtifactInspector: Send + Sync {
    fn inspect(&self, path: &Path) -> Result<ArtifactInspection, Error>;
}

/// Production inspector using the native `aapt2`/manifest implementation.
#[derive(Debug, Clone, Copy, Default)]
pub struct NativeInspector;

impl ArtifactInspector for NativeInspector {
    fn inspect(&self, path: &Path) -> Result<ArtifactInspection, Error> {
        inspection::inspect_artifact(path)
    }
}

/// DEX verification and class-descriptor extraction boundary.
pub trait DexTool: Send + Sync {
    /// Runs `dexdump -c` over every DEX member.
    fn verify(&self, apk_path: &Path) -> Result<(), String>;

    /// Extracts every class descriptor from the APK's DEX members.
    fn class_descriptors(&self, apk_path: &Path) -> Result<BTreeSet<String>, String>;
}

/// Full class listings exceed the generic 1 MiB capture bound on large apps.
const DEXDUMP_MAX_OUTPUT_BYTES: usize = 64 * 1024 * 1024;

/// `dexdump` from Android build-tools, invoked through the process adapter.
#[derive(Debug, Clone)]
pub struct DexDump {
    program: Option<PathBuf>,
    missing_reason: Option<String>,
    timeout: Option<Duration>,
    cancellation: Option<Cancellation>,
    max_output_bytes: usize,
}

impl DexDump {
    #[must_use]
    pub fn new(program: impl Into<PathBuf>) -> Self {
        Self {
            program: Some(program.into()),
            missing_reason: None,
            timeout: None,
            cancellation: None,
            max_output_bytes: DEXDUMP_MAX_OUTPUT_BYTES,
        }
    }

    #[must_use]
    pub fn from_environment(environment: &ToolEnvironment) -> Self {
        match tools::find_build_tools_bin(environment, "dexdump") {
            Ok(program) => Self::new(program),
            Err(error) => Self {
                program: None,
                missing_reason: Some(error.message()),
                timeout: None,
                cancellation: None,
                max_output_bytes: DEXDUMP_MAX_OUTPUT_BYTES,
            },
        }
    }

    #[must_use]
    pub fn with_timeout(mut self, timeout: Duration) -> Self {
        self.timeout = Some(timeout);
        self
    }

    #[must_use]
    pub fn with_cancellation(mut self, cancellation: Cancellation) -> Self {
        self.cancellation = Some(cancellation);
        self
    }

    fn program(&self) -> Result<&Path, String> {
        self.program.as_deref().ok_or_else(|| {
            format!(
                "Could not locate dexdump: {}",
                self.missing_reason.as_deref().unwrap_or("unknown error")
            )
        })
    }
}

/// Stream each DEX member directly to a temp file; DEX payloads are never held
/// in memory, matching the Python oracle's bounded copy loop.
fn for_each_dex_file<F>(apk_path: &Path, directory: &Path, mut visit: F) -> Result<(), String>
where
    F: FnMut(&str, &Path) -> Result<(), String>,
{
    let file =
        fs::File::open(apk_path).map_err(|error| format!("{}: {error}", apk_path.display()))?;
    let mut archive =
        ZipArchive::new(file).map_err(|error| format!("invalid zip archive: {error}"))?;
    for index in 0..archive.len() {
        let mut member = archive
            .by_index(index)
            .map_err(|error| format!("read zip member: {error}"))?;
        let name = member
            .name()
            .map_err(|error| format!("decode zip member name: {error}"))?
            .to_string();
        if member.is_dir() || !name.ends_with(".dex") {
            continue;
        }
        let path = directory.join(name.replace('/', "_"));
        let mut output = fs::File::create(&path)
            .map_err(|error| format!("write {}: {error}", path.display()))?;
        std::io::copy(&mut member, &mut output).map_err(|error| format!("read {name}: {error}"))?;
        visit(&name, &path)?;
    }
    Ok(())
}

/// Read one DEX member at a time into memory for direct header/table parsing.
///
/// Only the current member's bytes are retained, so peak memory is bounded by
/// the largest DEX in the archive rather than a full-text `dexdump` capture.
fn for_each_dex_member<F>(apk_path: &Path, mut visit: F) -> Result<(), String>
where
    F: FnMut(&str, Vec<u8>) -> Result<(), String>,
{
    let file =
        fs::File::open(apk_path).map_err(|error| format!("{}: {error}", apk_path.display()))?;
    let mut archive =
        ZipArchive::new(file).map_err(|error| format!("invalid zip archive: {error}"))?;
    for index in 0..archive.len() {
        let mut member = archive
            .by_index(index)
            .map_err(|error| format!("read zip member: {error}"))?;
        let name = member
            .name()
            .map_err(|error| format!("decode zip member name: {error}"))?
            .to_string();
        if member.is_dir() || !name.ends_with(".dex") {
            continue;
        }
        let mut bytes = Vec::new();
        member
            .read_to_end(&mut bytes)
            .map_err(|error| format!("read {name}: {error}"))?;
        visit(&name, bytes)?;
    }
    Ok(())
}

impl DexTool for DexDump {
    fn verify(&self, apk_path: &Path) -> Result<(), String> {
        let directory =
            TempDir::new().map_err(|error| format!("create DEX temp directory: {error}"))?;
        let mut count = 0usize;
        for_each_dex_file(apk_path, directory.path(), |name, path| {
            count += 1;
            let program = self.program()?;
            let mut spec = ProcessSpec::new(program.to_path_buf())
                .arg("-c".to_string())
                .arg(path.to_string_lossy().into_owned())
                .max_output_bytes(self.max_output_bytes);
            if let Some(timeout) = self.timeout {
                spec = spec.timeout(timeout);
            }
            if let Some(cancellation) = &self.cancellation {
                spec = spec.cancel(cancellation.shared());
            }
            let output = process::run(&spec)
                .map_err(|error| format!("Could not locate dexdump: {error}"))?;
            if output.timed_out {
                return Err(format!("dexdump verification timed out for {name}"));
            }
            if output.cancelled {
                return Err(format!("dexdump verification was cancelled for {name}"));
            }
            if !output.status.success() {
                return Err(format!(
                    "dexdump verification failed for {name}: {}",
                    truncate_chars(&output.stderr.text_lossy(), 200)
                ));
            }
            Ok(())
        })?;
        if count == 0 {
            return Err("No DEX files found in patched output".to_string());
        }
        Ok(())
    }

    fn class_descriptors(&self, apk_path: &Path) -> Result<BTreeSet<String>, String> {
        if self.program.is_none() {
            return Ok(BTreeSet::new());
        }
        let mut classes = BTreeSet::new();
        for_each_dex_member(apk_path, |_name, bytes| {
            if self
                .cancellation
                .as_ref()
                .is_some_and(Cancellation::is_cancelled)
            {
                return Err("dexdump extraction was cancelled".to_string());
            }
            classes.extend(dex_strings::extract_class_descriptors_from_dex_bytes(
                &bytes,
            ));
            Ok(())
        })?;
        Ok(classes)
    }
}

/// Parses `Class descriptor  : 'L...;'` lines from plain `dexdump` output.
#[must_use]
pub fn parse_dexdump_class_descriptors(output: &str) -> BTreeSet<String> {
    static REGEX: LazyLock<Regex> = LazyLock::new(|| {
        Regex::new(r"Class descriptor\s+:\s+'([^']+)'").expect("static dexdump regex")
    });
    REGEX
        .captures_iter(output)
        .filter_map(|captures| captures.get(1).map(|value| value.as_str().to_string()))
        .collect()
}

fn truncate_chars(text: &str, limit: usize) -> String {
    text.chars().take(limit).collect()
}

fn hash_zip_members<R: Read + Seek>(reader: R) -> Result<BTreeMap<String, String>, String> {
    let mut archive = ZipArchive::new(reader).map_err(|error| format!("invalid zip: {error}"))?;
    let mut hashes = BTreeMap::new();
    for index in 0..archive.len() {
        let mut member = archive
            .by_index(index)
            .map_err(|error| format!("read zip member: {error}"))?;
        if member.is_dir() {
            continue;
        }
        let name = member
            .name()
            .map_err(|error| format!("decode zip member name: {error}"))?
            .to_string();
        let mut hasher = Sha256::new();
        let mut buffer = [0u8; 64 * 1024];
        loop {
            let read = member
                .read(&mut buffer)
                .map_err(|error| format!("read {name}: {error}"))?;
            if read == 0 {
                break;
            }
            hasher.update(&buffer[..read]);
        }
        hashes.insert(name, format!("{:x}", hasher.finalize()));
    }
    Ok(hashes)
}

/// Maps every member to its uncompressed SHA-256.
pub fn get_member_hashes(apk_path: &Path) -> Result<BTreeMap<String, String>, Error> {
    let file = fs::File::open(apk_path).map_err(|error| {
        Error::invalid_artifact(format!("open archive {}: {error}", apk_path.display()))
    })?;
    hash_zip_members(file).map_err(Error::invalid_artifact)
}

/// Maps each split member path to the set of hashes found across split APKs.
///
/// Splits are streamed to disk one at a time instead of being buffered whole,
/// matching the Python oracle's bounded copy loop. A large base split would
/// otherwise be resident for every case.
pub fn get_split_container_input_member_hashes(
    container_path: &Path,
) -> Result<BTreeMap<String, BTreeSet<String>>, Error> {
    let file = fs::File::open(container_path).map_err(|error| {
        Error::invalid_artifact(format!(
            "open split container {}: {error}",
            container_path.display()
        ))
    })?;
    let mut container = ZipArchive::new(file)
        .map_err(|error| Error::invalid_artifact(format!("invalid split container: {error}")))?;
    let directory = TempDir::new().map_err(|error| {
        Error::io(
            format!(
                "create split temp directory for {}",
                container_path.display()
            ),
            error,
        )
    })?;
    let mut hashes_map: BTreeMap<String, BTreeSet<String>> = BTreeMap::new();
    for index in 0..container.len() {
        let mut member = container
            .by_index(index)
            .map_err(|error| Error::invalid_artifact(format!("read split: {error}")))?;
        let split_name = member
            .name()
            .map_err(|error| Error::invalid_artifact(format!("decode split name: {error}")))?
            .to_string();
        if member.is_dir() || !split_name.ends_with(".apk") {
            continue;
        }
        let extracted = directory.path().join(format!("split-{index}.apk"));
        let mut output = fs::File::create(&extracted)
            .map_err(|error| Error::io(format!("write {}", extracted.display()), error))?;
        std::io::copy(&mut member, &mut output)
            .map_err(|error| Error::invalid_artifact(format!("read {split_name}: {error}")))?;
        drop(output);
        let split_file = fs::File::open(&extracted)
            .map_err(|error| Error::io(format!("read {}", extracted.display()), error))?;
        let split_hashes = hash_zip_members(split_file)
            .map_err(|error| Error::invalid_artifact(format!("{split_name}: {error}")))?;
        for (name, hash) in split_hashes {
            hashes_map.entry(name).or_default().insert(hash);
        }
    }
    Ok(hashes_map)
}

/// One executed case, matching Python's `PatchTestCaseResult.to_dict` order.
#[derive(Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct PatchTestCaseResult {
    #[serde(rename = "patchName")]
    pub patch_name: String,
    #[serde(rename = "options")]
    pub options: PatchOptions,
    #[serde(rename = "success")]
    pub success: bool,
    #[serde(rename = "errorMessage")]
    pub error_message: Option<String>,
    #[serde(rename = "appliedPatches")]
    pub applied_patches: Vec<String>,
    #[serde(rename = "injectedClasses")]
    pub injected_classes: Vec<String>,
    #[serde(rename = "durationSeconds")]
    pub duration_seconds: f64,
}

/// Aggregate report, matching Python's `PatchCompatibilityReport.to_dict`.
#[derive(Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct PatchCompatibilityReport {
    #[serde(rename = "artifactSha256")]
    pub artifact_sha256: String,
    #[serde(rename = "packageName")]
    pub package_name: String,
    #[serde(rename = "versionName")]
    pub version_name: String,
    #[serde(rename = "versionCode")]
    pub version_code: u64,
    #[serde(rename = "patchBundleVersion")]
    pub patch_bundle_version: String,
    #[serde(rename = "gitRevision")]
    pub git_revision: String,
    #[serde(rename = "toolVersions")]
    pub tool_versions: ToolVersions,
    #[serde(rename = "overallStatus")]
    pub overall_status: String,
    #[serde(rename = "totalCases")]
    pub total_cases: u64,
    #[serde(rename = "passedCases")]
    pub passed_cases: u64,
    #[serde(rename = "failedCases")]
    pub failed_cases: u64,
    #[serde(rename = "testCases")]
    pub test_cases: Vec<PatchTestCaseResult>,
    #[serde(rename = "failureReason")]
    pub failure_reason: Option<String>,
}

/// Options for one compatibility check.
#[derive(Debug, Clone)]
pub struct CheckOptions {
    pub artifact: PathBuf,
    pub mpp: PathBuf,
    pub expected_package: Option<String>,
    pub requested_patches: Vec<String>,
    pub all_patches: bool,
    pub force: bool,
    pub keep_workspace: bool,
    pub workspace_root: PathBuf,
    pub jobs: Option<usize>,
    pub patches_list_path: Option<PathBuf>,
    pub case_timeout: Option<Duration>,
    pub tool_versions: ToolVersions,
    pub git_revision: Option<String>,
}

impl CheckOptions {
    #[must_use]
    pub fn new(artifact: impl Into<PathBuf>, mpp: impl Into<PathBuf>) -> Self {
        Self {
            artifact: artifact.into(),
            mpp: mpp.into(),
            expected_package: None,
            requested_patches: Vec::new(),
            all_patches: false,
            force: false,
            keep_workspace: false,
            workspace_root: PathBuf::from(".apk-lab"),
            jobs: None,
            patches_list_path: None,
            case_timeout: None,
            tool_versions: ToolVersions::new(),
            git_revision: None,
        }
    }
}

/// Execution dependencies for a check.
pub struct CheckRunner {
    pub morphe: MorpheTool,
    pub inspector: Arc<dyn ArtifactInspector>,
    pub dex: Arc<dyn DexTool>,
    pub cancellation: Option<Cancellation>,
    pub max_output_bytes: usize,
    /// Serializes managed-directory publication, which is not concurrent-safe
    /// when cases share a package/version slot.
    workspace_lock: Mutex<()>,
}

impl CheckRunner {
    #[must_use]
    pub fn new(
        morphe: MorpheTool,
        inspector: Arc<dyn ArtifactInspector>,
        dex: Arc<dyn DexTool>,
    ) -> Self {
        Self {
            morphe,
            inspector,
            dex,
            cancellation: None,
            max_output_bytes: process::DEFAULT_MAX_OUTPUT_BYTES,
            workspace_lock: Mutex::new(()),
        }
    }

    /// Production runner using Android build-tools `dexdump`.
    #[must_use]
    pub fn native(morphe: MorpheTool) -> Self {
        let environment = ToolEnvironment::from_process(&tools::default_repo_root());
        Self::new(
            morphe,
            Arc::new(NativeInspector),
            Arc::new(DexDump::from_environment(&environment)),
        )
    }

    #[must_use]
    pub fn with_cancellation(mut self, cancellation: Cancellation) -> Self {
        self.cancellation = Some(cancellation);
        self
    }

    fn cancelled(&self) -> bool {
        self.cancellation
            .as_ref()
            .is_some_and(Cancellation::is_cancelled)
    }

    fn execute_case(
        &self,
        options: &CheckOptions,
        workspace: &WorkspaceManager,
        input_inspection: &ArtifactInspection,
        test_case: &PatchTestCase,
        mpp: &Path,
        artifact: &Path,
    ) -> Result<PatchTestCaseResult, Error> {
        let started = Instant::now();
        let config = serde_json::json!({
            "patchName": test_case.patch_name,
            "options": test_case.options,
            "force": options.force,
        });
        let tool_versions: BTreeMap<String, String> =
            options.tool_versions.entries().iter().cloned().collect();
        let request = crate::workspace::RunRequest {
            package_name: &input_inspection.package_name,
            version_code: input_inspection.version_code,
            input_sha256: &input_inspection.sha256,
            input_path: artifact,
            command: "check",
            config: &config,
            tool_versions: &tool_versions,
        };
        let run = {
            let _guard = self
                .workspace_lock
                .lock()
                .unwrap_or_else(std::sync::PoisonError::into_inner);
            workspace
                .ephemeral_run(&request, options.keep_workspace)
                .map_err(Error::from)?
        };
        let run_dir = run.path().to_path_buf();
        let out_apk = run_dir.join("patched.apk");
        let result_json = run_dir.join("result.json");
        let scratch_dir = run_dir.join("scratch");
        fs::create_dir_all(&scratch_dir).map_err(|error| {
            Error::io(format!("create scratch {}", scratch_dir.display()), error)
        })?;

        let paths = PatchCommandPaths {
            mpp: mpp.to_path_buf(),
            artifact: artifact.to_path_buf(),
            out_apk: out_apk.clone(),
            result_json: result_json.clone(),
            scratch_dir: scratch_dir.clone(),
            force: options.force,
        };
        let command_args = build_morphe_patch_cmd(
            &test_case.patch_name,
            &test_case.options,
            &test_case.dependencies,
            &paths,
        );

        let mut spec = ProcessSpec::new(self.morphe.program.clone())
            .args(self.morphe.prefix_args.iter().cloned())
            .args(command_args)
            .cwd(scratch_dir)
            .max_output_bytes(self.max_output_bytes);
        if let Some(timeout) = options.case_timeout {
            spec = spec.timeout(timeout);
        }
        if let Some(cancellation) = &self.cancellation {
            spec = spec.cancel(cancellation.shared());
        }

        let output = process::run(&spec)?;
        let duration = started.elapsed().as_secs_f64();

        if output.cancelled {
            return Ok(failure_result(
                test_case,
                "Morphe execution was cancelled".to_string(),
                Vec::new(),
                duration,
            ));
        }
        if output.timed_out {
            let limit = options.case_timeout.unwrap_or_default().as_secs_f64();
            return Ok(failure_result(
                test_case,
                format!("Morphe timed out after {limit:.1}s"),
                Vec::new(),
                duration,
            ));
        }

        // 1. Morphe result JSON.
        if !result_json.is_file() {
            return Ok(failure_result(
                test_case,
                format!(
                    "Morphe failed to write result file. Exit {}. Output: {}",
                    output.status.code().unwrap_or(-1),
                    truncate_chars(&output.stderr.text_lossy(), 300)
                ),
                Vec::new(),
                duration,
            ));
        }

        let result_text = match fs::read_to_string(&result_json) {
            Ok(text) => text,
            Err(error) => {
                return Ok(failure_result(
                    test_case,
                    format!("Corrupt Morphe result JSON: {error}"),
                    Vec::new(),
                    duration,
                ))
            }
        };
        let result_data: Value = match serde_json::from_str(&result_text) {
            Ok(value) => value,
            Err(error) => {
                return Ok(failure_result(
                    test_case,
                    format!("Corrupt Morphe result JSON: {error}"),
                    Vec::new(),
                    duration,
                ))
            }
        };

        let failed_patches: Vec<String> = result_data
            .get("failedPatches")
            .and_then(Value::as_array)
            .map(|patches| {
                patches
                    .iter()
                    .map(|patch| {
                        let name = patch.get("name").and_then(Value::as_str).unwrap_or("");
                        let reason = patch.get("reason").and_then(Value::as_str).unwrap_or("");
                        format!("{name}: {reason}")
                    })
                    .collect()
            })
            .unwrap_or_default();
        if !failed_patches.is_empty() || !output.status.success() {
            let err = if failed_patches.is_empty() {
                truncate_chars(&output.stderr.text_lossy(), 300)
            } else {
                failed_patches.join("; ")
            };
            return Ok(failure_result(
                test_case,
                format!("Morphe reported failure: {err}"),
                Vec::new(),
                duration,
            ));
        }

        let applied: Vec<String> = result_data
            .get("appliedPatches")
            .and_then(Value::as_array)
            .map(|patches| {
                patches
                    .iter()
                    .filter_map(|patch| patch.get("name").and_then(Value::as_str))
                    .map(str::to_string)
                    .collect()
            })
            .unwrap_or_default();
        if !applied.iter().any(|name| name == &test_case.patch_name) {
            return Ok(failure_result(
                test_case,
                format!(
                    "Target patch '{}' was not reported in applied patches: {}",
                    test_case.patch_name,
                    python_list(&applied)
                ),
                applied,
                duration,
            ));
        }
        for dependency in &test_case.dependencies {
            if !applied.iter().any(|name| name == dependency) {
                return Ok(failure_result(
                    test_case,
                    format!(
                        "Declared dependency '{dependency}' was not applied. Applied: {}",
                        python_list(&applied)
                    ),
                    applied,
                    duration,
                ));
            }
        }

        // 2. Output artifact postconditions.
        if !out_apk.is_file() {
            return Ok(failure_result(
                test_case,
                "Morphe reported success but output APK was not created".to_string(),
                applied,
                duration,
            ));
        }

        if let Err(error) = archives::inspect_safe_zip_path(&out_apk) {
            return Ok(failure_result(
                test_case,
                format!("Output is not a valid zip archive: {error}"),
                applied,
                duration,
            ));
        }

        let output_inspection = match self.inspector.inspect(&out_apk) {
            Ok(inspection) => inspection,
            Err(error) => {
                return Ok(failure_result(
                    test_case,
                    format!("Failed to inspect output APK: {error}"),
                    applied,
                    duration,
                ))
            }
        };

        // Package and version unchanged, except an explicit clone-package option.
        let input_package = &input_inspection.package_name;
        let expected_package = resolve_expected_output_package(test_case, input_package);
        if output_inspection.package_name != expected_package {
            return Ok(failure_result(
                test_case,
                format!(
                    "Package name changed: {input_package} -> {} (expected {expected_package})",
                    output_inspection.package_name
                ),
                applied,
                duration,
            ));
        }
        if output_inspection.version_code != input_inspection.version_code {
            return Ok(failure_result(
                test_case,
                format!(
                    "Version code changed: {} -> {}",
                    input_inspection.version_code, output_inspection.version_code
                ),
                applied,
                duration,
            ));
        }

        if let Err(error) = self.dex.verify(&out_apk) {
            return Ok(failure_result(
                test_case,
                format!("SDK DEX verification failed: {error}"),
                applied,
                duration,
            ));
        }

        let injected_classes: Vec<String> = match self.dex.class_descriptors(&out_apk) {
            Ok(classes) => classes
                .into_iter()
                .filter(|class| class.contains("Lapp/aidan/extension/"))
                .collect(),
            Err(error) => {
                return Ok(failure_result(
                    test_case,
                    format!("Postcondition failed: dexdump extraction error: {error}"),
                    applied,
                    duration,
                ))
            }
        };

        let output_hashes = match get_member_hashes(&out_apk) {
            Ok(hashes) => hashes,
            Err(error) => {
                return Ok(failure_result(
                    test_case,
                    format!("Postcondition failed: {}", error.message()),
                    applied,
                    duration,
                ))
            }
        };

        let changed = if input_inspection.container_type == ContainerType::Apk {
            let input_hashes = match get_member_hashes(artifact) {
                Ok(hashes) => hashes,
                Err(error) => {
                    return Ok(failure_result(
                        test_case,
                        format!("Postcondition failed: {}", error.message()),
                        applied,
                        duration,
                    ))
                }
            };
            let mut changed = false;
            for (name, output_hash) in &output_hashes {
                if let Some(input_hash) = input_hashes.get(name) {
                    if output_hash != input_hash && is_patchable_member(name) {
                        changed = true;
                    }
                }
            }
            for name in output_hashes.keys() {
                if name.ends_with(".dex")
                    && !input_hashes.contains_key(name)
                    && !injected_classes.is_empty()
                {
                    changed = true;
                }
            }
            changed
        } else {
            let input_hashes = match get_split_container_input_member_hashes(artifact) {
                Ok(hashes) => hashes,
                Err(error) => {
                    return Ok(failure_result(
                        test_case,
                        format!("Postcondition failed: {}", error.message()),
                        applied,
                        duration,
                    ))
                }
            };
            let mut changed = false;
            for (name, output_hash) in &output_hashes {
                if !is_patchable_member(name) {
                    continue;
                }
                if let Some(input_hashes) = input_hashes.get(name) {
                    if !input_hashes.contains(output_hash) {
                        changed = true;
                    }
                } else if name.ends_with(".dex") && !injected_classes.is_empty() {
                    changed = true;
                }
            }
            changed
        };

        if !changed {
            return Ok(failure_result(
                test_case,
                "Postcondition failed: no DEX/resource/native/asset member changed in output"
                    .to_string(),
                applied,
                duration,
            ));
        }

        Ok(PatchTestCaseResult {
            patch_name: test_case.patch_name.clone(),
            options: test_case.options.clone(),
            success: true,
            error_message: None,
            applied_patches: applied,
            injected_classes,
            duration_seconds: round_seconds(duration),
        })
    }

    /// Runs every generated case and returns the Python-compatible report.
    ///
    /// With more than one worker, case zero runs first so shared one-time tool
    /// state is initialized before parallel JVMs race to create it. Results are
    /// stored by case index, restoring metadata order regardless of completion.
    pub fn run(
        &self,
        options: &CheckOptions,
    ) -> Result<(PatchCompatibilityReport, ExitCode), Error> {
        let artifact = resolve_path(&options.artifact);
        let mpp = resolve_path(&options.mpp);
        if !artifact.is_file() {
            return Err(Error::usage(format!(
                "Artifact not found: {}",
                artifact.display()
            )));
        }
        if !mpp.is_file() {
            return Err(Error::usage(format!(
                "MPP bundle not found: {}",
                mpp.display()
            )));
        }

        let input_inspection = self.inspector.inspect(&artifact)?;
        let requested_package = options
            .expected_package
            .as_deref()
            .map(str::trim)
            .filter(|value| !value.is_empty());
        if let Some(package) = requested_package {
            if input_inspection.package_name != package {
                return Err(Error::usage(format!(
                    "Artifact package '{}' does not match requested '{package}'",
                    input_inspection.package_name
                )));
            }
        }
        let target_package = requested_package
            .unwrap_or(&input_inspection.package_name)
            .to_string();

        let patches_list_path = options
            .patches_list_path
            .clone()
            .unwrap_or_else(|| tools::default_repo_root().join("patches-list.json"));
        let patches_list_data = load_patches_list(&patches_list_path)?;
        let requested = if options.requested_patches.is_empty() {
            None
        } else {
            Some(options.requested_patches.as_slice())
        };
        let patch_defs = get_compatible_patches(
            &target_package,
            &patches_list_data,
            requested,
            options.all_patches,
        );
        if patch_defs.is_empty() {
            return Err(Error::usage(format!(
                "No compatible patches found for {target_package}"
            )));
        }

        let mut all_cases = Vec::new();
        for patch in &patch_defs {
            all_cases.extend(generate_test_cases(patch));
        }

        let default_workers = std::thread::available_parallelism()
            .map_or(4, std::num::NonZeroUsize::get)
            .clamp(1, 8);
        let max_workers = options.jobs.map_or(default_workers, |jobs| jobs.max(1));
        let workspace = WorkspaceManager::new(&options.workspace_root);

        let case_count = all_cases.len();
        let mut results: Vec<Option<Result<PatchTestCaseResult, Error>>> =
            (0..case_count).map(|_| None).collect();

        if max_workers == 1 || case_count <= 1 {
            for (index, test_case) in all_cases.iter().enumerate() {
                if self.cancelled() {
                    return Err(Error::runtime("patch compatibility check cancelled"));
                }
                results[index] = Some(self.execute_case(
                    options,
                    &workspace,
                    &input_inspection,
                    test_case,
                    &mpp,
                    &artifact,
                ));
            }
        } else {
            // Initialize shared one-time tool state before bounded workers.
            results[0] = Some(self.execute_case(
                options,
                &workspace,
                &input_inspection,
                &all_cases[0],
                &mpp,
                &artifact,
            ));

            let next = AtomicUsize::new(1);
            let slots = Mutex::new(results);
            let workers = max_workers.min(case_count - 1);
            std::thread::scope(|scope| {
                for _ in 0..workers {
                    scope.spawn(|| loop {
                        if self.cancelled() {
                            break;
                        }
                        let index = next.fetch_add(1, Ordering::SeqCst);
                        if index >= case_count {
                            break;
                        }
                        let result = self.execute_case(
                            options,
                            &workspace,
                            &input_inspection,
                            &all_cases[index],
                            &mpp,
                            &artifact,
                        );
                        let mut guard = slots
                            .lock()
                            .unwrap_or_else(std::sync::PoisonError::into_inner);
                        guard[index] = Some(result);
                    });
                }
            });
            results = slots
                .into_inner()
                .unwrap_or_else(std::sync::PoisonError::into_inner);
        }

        if self.cancelled() {
            return Err(Error::runtime("patch compatibility check cancelled"));
        }

        let mut test_cases = Vec::with_capacity(case_count);
        for result in results {
            match result {
                Some(result) => test_cases.push(result?),
                None => {
                    return Err(Error::runtime("patch compatibility check cancelled"));
                }
            }
        }

        let total_cases = test_cases.len() as u64;
        let passed_cases = test_cases.iter().filter(|case| case.success).count() as u64;
        let failed_cases = total_cases - passed_cases;
        let mut failed_reasons = Vec::new();
        for case in &test_cases {
            if !case.success {
                let message = case.error_message.clone().unwrap_or_default();
                failed_reasons.push(format!("[{}] {message}", case.patch_name));
            }
        }

        let (overall_status, exit_code) = if failed_cases == 0 {
            ("compatible".to_string(), ExitCode::Success)
        } else {
            ("incompatible".to_string(), ExitCode::CompatibilityFailure)
        };

        let patch_bundle_version = patches_list_data
            .get("version")
            .and_then(Value::as_str)
            .unwrap_or("unknown")
            .to_string();

        let report = PatchCompatibilityReport {
            artifact_sha256: input_inspection.sha256.clone(),
            package_name: input_inspection.package_name.clone(),
            version_name: input_inspection.version_name.clone(),
            version_code: input_inspection.version_code,
            patch_bundle_version,
            git_revision: options
                .git_revision
                .clone()
                .unwrap_or_else(|| "unknown".to_string()),
            tool_versions: options.tool_versions.clone(),
            overall_status,
            total_cases,
            passed_cases,
            failed_cases,
            test_cases,
            failure_reason: if failed_reasons.is_empty() {
                None
            } else {
                Some(failed_reasons.join("; "))
            },
        };
        Ok((report, exit_code))
    }
}

fn round_seconds(seconds: f64) -> f64 {
    (seconds * 100.0).round() / 100.0
}

fn failure_result(
    test_case: &PatchTestCase,
    message: String,
    applied_patches: Vec<String>,
    duration_seconds: f64,
) -> PatchTestCaseResult {
    PatchTestCaseResult {
        patch_name: test_case.patch_name.clone(),
        options: test_case.options.clone(),
        success: false,
        error_message: Some(message),
        applied_patches,
        injected_classes: Vec::new(),
        duration_seconds: round_seconds(duration_seconds),
    }
}
