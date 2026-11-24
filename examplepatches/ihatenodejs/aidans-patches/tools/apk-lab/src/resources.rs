//! Resource queries and safe extraction across base and configuration splits.
//!
//! Native port of the retired Python implementation.
//!
//! Query normalization, `aapt2 dump resources` parsing, raw ZIP member
//! enumeration, duplicate grouping, Morphe guidance and deterministic ordering
//! mirror the Python oracle. Every archive read or write goes through
//! [`crate::archives`]; split names and archive member names are never
//! interpolated into a filesystem path before validation.
//!
//! Extraction is planned completely before the first write: unsafe member
//! names, escaping destinations, symlinked roots/ancestors, duplicate
//! destinations and pre-existing targets all fail the preflight with no output
//! created. Directory names use the sanitized split slug plus a container
//! member hash prefix supplied by [`derive_split_dir_name`].

use crate::archives::{self, ArchiveError, MaterializedApk};
use crate::error::Error;
use crate::inspection::{inspect_artifact_with_materialization, InspectionOptions};
use crate::process::{self, ProcessSpec};
use crate::tools::{default_repo_root, find_build_tools_bin, ToolEnvironment};
use regex::Regex;
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::collections::{HashMap, HashSet};
use std::fs;
use std::path::{Path, PathBuf};
use std::sync::LazyLock;

const STDERR_EXCERPT_CHARS: usize = 200;

static PACKAGE_LINE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"Package\s+name=([^\s]+)").expect("static package regex is valid")
});

static RESOURCE_LINE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"resource\s+(0x[0-9a-fA-F]+)\s+([^\s/]+)/([^\s]+)")
        .expect("static resource regex is valid")
});

static CONFIGURATION_LINE: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"^\(([^)]*)\)\s*(.*)").expect("static qualifier regex is valid"));

static HEX_ID: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"^(?:0x)?[0-9a-fA-F]{8}$").expect("static hex query regex is valid")
});

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum ResourceKind {
    Resource,
    Asset,
    Library,
    Manifest,
}

impl ResourceKind {
    #[must_use]
    pub const fn as_str(self) -> &'static str {
        match self {
            Self::Resource => "resource",
            Self::Asset => "asset",
            Self::Library => "library",
            Self::Manifest => "manifest",
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub enum MorpheMode {
    #[serde(rename = "resourcePatch")]
    ResourcePatch,
    #[serde(rename = "rawResourcePatch")]
    RawResourcePatch,
}

impl MorpheMode {
    #[must_use]
    pub const fn as_str(self) -> &'static str {
        match self {
            Self::ResourcePatch => "resourcePatch",
            Self::RawResourcePatch => "rawResourcePatch",
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum DuplicateStatus {
    Unique,
    Equivalent,
    Conflict,
}

impl DuplicateStatus {
    #[must_use]
    pub const fn as_str(self) -> &'static str {
        match self {
            Self::Unique => "unique",
            Self::Equivalent => "equivalent",
            Self::Conflict => "conflict",
        }
    }
}

/// One query result row. Field names mirror `ResourceMatch.to_dict`.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ResourceMatch {
    pub container_member: Option<String>,
    pub split_name: String,
    pub package_name: Option<String>,
    pub resource_id: Option<String>,
    pub resource_type: Option<String>,
    pub resource_name: Option<String>,
    pub qualifier: Option<String>,
    pub value: Option<String>,
    pub path: Option<String>,
    pub kind: ResourceKind,
    pub morphe_mode: MorpheMode,
    pub sha256: Option<String>,
    pub duplicate_status: DuplicateStatus,
}

/// Human/JSON report shape mirroring `ResourceQueryReport`.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ResourceQueryReport {
    pub query: String,
    pub matches: Vec<ResourceMatch>,
    pub extracted_paths: Vec<String>,
    pub warnings: Vec<String>,
}

impl ResourceQueryReport {
    #[must_use]
    pub fn format_human(&self) -> String {
        let mut lines = vec![format!("Found {} matching resources:", self.matches.len())];
        for resource_match in &self.matches {
            let resource_id = resource_match.resource_id.as_deref().unwrap_or("-");
            let type_name = match (
                resource_match.resource_type.as_deref(),
                resource_match.resource_name.as_deref(),
            ) {
                (Some(resource_type), Some(resource_name))
                    if !resource_type.is_empty() && !resource_name.is_empty() =>
                {
                    format!("{resource_type}/{resource_name}")
                }
                (_, Some(resource_name)) if !resource_name.is_empty() => resource_name.to_string(),
                (Some(resource_type), _) if !resource_type.is_empty() => resource_type.to_string(),
                _ => "-".to_string(),
            };
            let qualifier = resource_match.qualifier.as_deref().unwrap_or("-");
            let split_path = resource_match.path.as_deref().map_or_else(
                || "-".to_string(),
                |path| format!("{}:{path}", resource_match.split_name),
            );
            lines.push(format!(
                "{resource_id} | {type_name} | {qualifier} | {split_path} | {} | {}",
                resource_match.morphe_mode.as_str(),
                resource_match.duplicate_status.as_str()
            ));
        }
        if !self.extracted_paths.is_empty() {
            lines.push(format!("Extracted {} files:", self.extracted_paths.len()));
            lines.extend(self.extracted_paths.iter().map(|path| format!("  {path}")));
        }
        lines.extend(
            self.warnings
                .iter()
                .map(|warning| format!("Warning: {warning}")),
        );
        lines.join("\n")
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum QueryKind {
    Id,
    TypeName,
    Path,
    BareName,
    Value,
}

/// Normalized query shape mirroring Python's `ParsedQuery`.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ParsedQuery {
    pub kind: QueryKind,
    pub raw_query: String,
    pub resource_id: Option<String>,
    pub package_name: Option<String>,
    pub resource_type: Option<String>,
    pub resource_name: Option<String>,
    pub path: Option<String>,
    pub text_value: Option<String>,
}

/// One parsed `aapt2 dump resources` row (or one raw ZIP member).
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ResourceEntry {
    pub split_name: String,
    pub container_member: Option<String>,
    pub package_name: Option<String>,
    pub resource_id: Option<String>,
    pub resource_type: Option<String>,
    pub resource_name: Option<String>,
    pub qualifier: Option<String>,
    pub path: Option<String>,
    pub value: Option<String>,
    pub kind: Option<ResourceKind>,
    pub sha256: Option<String>,
}

/// Maps the CLI's `--query/-q` and `--text/--value` inputs to one query string.
///
/// Python treats empty values as absent and lets `--query` win when non-empty.
pub fn resolve_query(query: Option<&str>, text: Option<&str>) -> Result<String, Error> {
    let query = query.filter(|value| !value.is_empty());
    let text = text.filter(|value| !value.is_empty());
    match (query, text) {
        (Some(query), _) => Ok(query.to_string()),
        (None, Some(text)) => Ok(format!("text:{text}")),
        (None, None) => Err(Error::usage("either --query or --text/--value is required")),
    }
}

/// Normalizes and validates a resource query.
///
/// Control characters, traversal, absolute paths and empty fragments are
/// rejected with a usage error, matching the Python `ValueError` surface.
pub fn normalize_resource_query(query: &str) -> Result<ParsedQuery, Error> {
    let clean = query.trim();
    if clean.is_empty() {
        return Err(Error::usage("Resource query cannot be empty"));
    }
    if clean.chars().any(|character| (character as u32) < 32) {
        return Err(Error::usage(format!(
            "Resource query contains invalid control characters: {clean:?}"
        )));
    }

    let lowered = clean.to_lowercase();
    let is_text_query = ["text:", "val:", "value:"]
        .iter()
        .any(|prefix| clean.starts_with(prefix) || lowered.starts_with(prefix));
    if is_text_query {
        let (_, rest) = clean
            .split_once(':')
            .ok_or_else(|| Error::usage("Malformed text/value query"))?;
        let search_text = rest.trim();
        if search_text.is_empty() {
            return Err(Error::usage("Text/value query string cannot be empty"));
        }
        return Ok(ParsedQuery {
            kind: QueryKind::Value,
            raw_query: clean.to_string(),
            resource_id: None,
            package_name: None,
            resource_type: None,
            resource_name: None,
            path: None,
            text_value: Some(search_text.to_string()),
        });
    }

    if clean.contains("..") || clean.starts_with('/') {
        return Err(Error::usage(format!(
            "Resource query contains path traversal or absolute path: '{clean}'"
        )));
    }

    if HEX_ID.is_match(clean) {
        let digits = clean.strip_prefix("0x").unwrap_or(clean);
        return Ok(ParsedQuery {
            kind: QueryKind::Id,
            raw_query: clean.to_string(),
            resource_id: Some(normalize_hex_id(digits)),
            package_name: None,
            resource_type: None,
            resource_name: None,
            path: None,
            text_value: None,
        });
    }

    if clean.starts_with("res/")
        || clean.starts_with("assets/")
        || clean.starts_with("lib/")
        || clean == "AndroidManifest.xml"
    {
        return Ok(ParsedQuery {
            kind: QueryKind::Path,
            raw_query: clean.to_string(),
            resource_id: None,
            package_name: None,
            resource_type: None,
            resource_name: None,
            path: Some(clean.to_string()),
            text_value: None,
        });
    }

    let mut type_name = clean.to_string();
    if let Some(rest) = clean.strip_prefix("@+id/") {
        type_name = format!("id/{rest}");
    } else if let Some(rest) = clean.strip_prefix('@') {
        type_name = rest.to_string();
    }

    let (package_name, type_name) = match type_name.split_once(':') {
        Some((package, rest)) => (Some(package.to_string()), rest.to_string()),
        None => (None, type_name),
    };

    if let Some((resource_type, resource_name)) = type_name.split_once('/') {
        let resource_type = resource_type.trim();
        let resource_name = resource_name.trim();
        if resource_type.is_empty() || resource_name.is_empty() {
            return Err(Error::usage(format!(
                "Malformed resource type/name query: '{clean}'"
            )));
        }
        return Ok(ParsedQuery {
            kind: QueryKind::TypeName,
            raw_query: clean.to_string(),
            resource_id: None,
            package_name,
            resource_type: Some(resource_type.to_string()),
            resource_name: Some(resource_name.to_string()),
            path: None,
            text_value: None,
        });
    }

    Ok(ParsedQuery {
        kind: QueryKind::BareName,
        raw_query: clean.to_string(),
        resource_id: None,
        package_name: None,
        resource_type: None,
        resource_name: Some(clean.to_string()),
        path: None,
        text_value: None,
    })
}

/// Formats a hex resource identifier the way Python's `f"{int(x, 16):08x}"`
/// does: lowercase, leading zeros removed then padded to at least eight.
#[must_use]
pub fn normalize_hex_id(digits: &str) -> String {
    let lowered = digits.to_ascii_lowercase();
    let trimmed = lowered.trim_start_matches('0');
    let body = if trimmed.is_empty() { "0" } else { trimmed };
    let padded = if body.len() < 8 {
        format!("{}{body}", "0".repeat(8 - body.len()))
    } else {
        body.to_string()
    };
    format!("0x{padded}")
}

/// Parses `aapt2 dump resources` text into resource entries.
#[must_use]
pub fn parse_aapt2_resource_dump(
    dump_text: &str,
    split_name: &str,
    container_member: Option<&str>,
) -> Vec<ResourceEntry> {
    let mut entries = Vec::new();
    let mut current_package: Option<String> = None;
    let mut current_resource_id: Option<String> = None;
    let mut current_type: Option<String> = None;
    let mut current_name: Option<String> = None;

    for line in python_splitlines(dump_text) {
        if let Some(captures) = PACKAGE_LINE.captures(line) {
            current_package = captures.get(1).map(|value| value.as_str().to_string());
            continue;
        }

        if let Some(captures) = RESOURCE_LINE.captures(line) {
            let raw_id = captures.get(1).map_or("", |value| value.as_str());
            let digits = raw_id.strip_prefix("0x").unwrap_or(raw_id);
            current_resource_id = Some(normalize_hex_id(digits));
            current_type = captures.get(2).map(|value| value.as_str().to_string());
            current_name = captures.get(3).map(|value| value.as_str().to_string());
            continue;
        }

        if current_resource_id.is_none() || !line.starts_with("    ") {
            continue;
        }

        let content = line.trim();
        let Some(captures) = CONFIGURATION_LINE.captures(content) else {
            continue;
        };
        let qualifier_text = captures.get(1).map_or("", |value| value.as_str()).trim();
        let rest = captures.get(2).map_or("", |value| value.as_str()).trim();

        let mut qualifier = None;
        let mut path = None;
        let mut value = None;

        if qualifier_text == "file" {
            path = rest.split_whitespace().next().map(str::to_string);
        } else {
            if !qualifier_text.is_empty() {
                qualifier = Some(qualifier_text.to_string());
            }
            if let Some(after_file) = rest.strip_prefix("(file)") {
                path = after_file.split_whitespace().next().map(str::to_string);
            } else {
                value = Some(rest.to_string());
            }
        }

        entries.push(ResourceEntry {
            split_name: split_name.to_string(),
            container_member: container_member.map(str::to_string),
            package_name: current_package.clone(),
            resource_id: current_resource_id.clone(),
            resource_type: current_type.clone(),
            resource_name: current_name.clone(),
            qualifier,
            path,
            value,
            kind: None,
            sha256: None,
        });
    }

    entries
}

fn raw_entries_from_report(
    report: &archives::SafeArchiveReport,
    materialized: &MaterializedApk,
) -> Vec<ResourceEntry> {
    let mut entries = Vec::new();
    for member in &report.members {
        let name = member.name.as_str();
        let kind = if name == "AndroidManifest.xml" {
            Some(ResourceKind::Manifest)
        } else if name.starts_with("res/") {
            Some(ResourceKind::Resource)
        } else if name.starts_with("assets/") {
            Some(ResourceKind::Asset)
        } else if name.starts_with("lib/") {
            Some(ResourceKind::Library)
        } else {
            None
        };
        let Some(kind) = kind else {
            continue;
        };
        entries.push(ResourceEntry {
            split_name: materialized.split_name.clone(),
            container_member: materialized.container_member.clone(),
            package_name: None,
            resource_id: None,
            resource_type: None,
            resource_name: Some(python_stem(name)),
            qualifier: None,
            path: Some(name.to_string()),
            value: None,
            kind: Some(kind),
            sha256: None,
        });
    }
    entries
}

/// Queries resources across materialized splits with process-resolved `aapt2`.
pub fn query_apk_resources(
    materialized_apks: &[MaterializedApk],
    parsed_query: &ParsedQuery,
) -> Result<(Vec<ResourceMatch>, Vec<String>), Error> {
    let env = ToolEnvironment::from_process(&default_repo_root());
    let aapt2 = find_build_tools_bin(&env, "aapt2")?;
    query_apk_resources_with_aapt2(materialized_apks, parsed_query, &aapt2)
}

/// [`query_apk_resources`] with an explicit `aapt2` executable.
pub fn query_apk_resources_with_aapt2(
    materialized_apks: &[MaterializedApk],
    parsed_query: &ParsedQuery,
    aapt2: &Path,
) -> Result<(Vec<ResourceMatch>, Vec<String>), Error> {
    let mut arsc_entries: Vec<ResourceEntry> = Vec::new();
    let mut raw_entries: Vec<ResourceEntry> = Vec::new();
    let mut warnings = Vec::new();

    for materialized in materialized_apks {
        let report = archives::inspect_safe_zip_path(&materialized.path)?;
        let has_arsc = report
            .members
            .iter()
            .any(|member| member.name == "resources.arsc");

        if !has_arsc {
            raw_entries.extend(raw_entries_from_report(&report, materialized));
            continue;
        }

        let spec = ProcessSpec::new(aapt2)
            .args([
                "dump".to_string(),
                "resources".to_string(),
                materialized.path.to_string_lossy().into_owned(),
            ])
            .max_output_bytes(64 * 1024 * 1024);
        let output = process::run(&spec)?;
        if output.success() {
            let parsed = parse_aapt2_resource_dump(
                &output.stdout.text_lossy(),
                &materialized.split_name,
                materialized.container_member.as_deref(),
            );
            arsc_entries.extend(parsed);
        } else {
            let stderr = output.stderr.text_lossy();
            let excerpt: String = stderr.trim().chars().take(STDERR_EXCERPT_CHARS).collect();
            let code = output.exit_code().unwrap_or(-1);
            warnings.push(format!(
                "aapt2 dump resources returned code {code} on split '{}': {excerpt}",
                materialized.split_name
            ));
        }

        raw_entries.extend(raw_entries_from_report(&report, materialized));
    }

    for entry in &mut arsc_entries {
        entry.kind = Some(ResourceKind::Resource);
    }

    let candidates = select_candidates(parsed_query, &arsc_entries, &raw_entries);
    let mut candidates = candidates;

    // Hash only the matched split-and-path pairs.
    let mut split_apk_map: HashMap<&str, &Path> = HashMap::new();
    for materialized in materialized_apks {
        split_apk_map.insert(&materialized.split_name, &materialized.path);
    }
    let mut file_hashes: HashMap<(String, String), Option<String>> = HashMap::new();
    for candidate in &mut candidates {
        let (Some(path), split_name) = (candidate.path.as_deref(), &candidate.split_name) else {
            continue;
        };
        let key = (split_name.clone(), path.to_string());
        if !file_hashes.contains_key(&key) {
            let hash = split_apk_map
                .get(split_name.as_str())
                .filter(|apk_path| apk_path.is_file())
                .and_then(|apk_path| archives::compute_zip_member_sha256(*apk_path, path).ok());
            file_hashes.insert(key.clone(), hash);
        }
        candidate.sha256 = file_hashes.get(&key).cloned().flatten();
    }

    // Group candidates exactly as Python does, preserving first-seen order.
    let mut group_indices: HashMap<GroupKey, usize> = HashMap::new();
    let mut groups: Vec<Vec<usize>> = Vec::new();
    for (index, candidate) in candidates.iter().enumerate() {
        let key = group_key(candidate);
        if let Some(&group) = group_indices.get(&key) {
            groups[group].push(index);
        } else {
            group_indices.insert(key, groups.len());
            groups.push(vec![index]);
        }
    }

    let mut results = Vec::with_capacity(candidates.len());
    for rows in &groups {
        let duplicate_status = duplicate_status(&candidates, rows);
        for &index in rows {
            let candidate = &candidates[index];
            let kind = candidate.kind.unwrap_or_else(|| inferred_kind(candidate));
            let morphe_mode = match kind {
                ResourceKind::Asset | ResourceKind::Library => MorpheMode::RawResourcePatch,
                ResourceKind::Resource | ResourceKind::Manifest => MorpheMode::ResourcePatch,
            };
            results.push(ResourceMatch {
                container_member: candidate.container_member.clone(),
                split_name: candidate.split_name.clone(),
                package_name: candidate.package_name.clone(),
                resource_id: candidate.resource_id.clone(),
                resource_type: candidate.resource_type.clone(),
                resource_name: candidate.resource_name.clone(),
                qualifier: candidate.qualifier.clone(),
                value: candidate.value.clone(),
                path: candidate.path.clone(),
                kind,
                morphe_mode,
                sha256: candidate.sha256.clone(),
                duplicate_status,
            });
        }
    }

    results.sort_by_cached_key(sort_key);
    Ok((results, warnings))
}

fn select_candidates(
    parsed_query: &ParsedQuery,
    arsc_entries: &[ResourceEntry],
    raw_entries: &[ResourceEntry],
) -> Vec<ResourceEntry> {
    match parsed_query.kind {
        QueryKind::Id => {
            let target = parsed_query.resource_id.as_deref();
            arsc_entries
                .iter()
                .filter(|entry| entry.resource_id.as_deref() == target)
                .cloned()
                .collect()
        }
        QueryKind::TypeName => arsc_entries
            .iter()
            .filter(|entry| {
                entry.resource_type.as_deref() == parsed_query.resource_type.as_deref()
                    && entry.resource_name.as_deref() == parsed_query.resource_name.as_deref()
                    && (parsed_query.package_name.is_none()
                        || entry.package_name.as_deref() == parsed_query.package_name.as_deref())
            })
            .cloned()
            .collect(),
        QueryKind::Path => {
            let target = parsed_query.path.as_deref();
            let matching_arsc: Vec<ResourceEntry> = arsc_entries
                .iter()
                .filter(|entry| entry.path.as_deref() == target)
                .cloned()
                .collect();
            if !matching_arsc.is_empty() {
                matching_arsc
            } else {
                raw_entries
                    .iter()
                    .filter(|entry| entry.path.as_deref() == target)
                    .cloned()
                    .collect()
            }
        }
        QueryKind::Value => {
            let target = parsed_query
                .text_value
                .as_deref()
                .unwrap_or("")
                .to_lowercase();
            arsc_entries
                .iter()
                .filter(|entry| {
                    entry
                        .value
                        .as_deref()
                        .filter(|value| !value.is_empty())
                        .is_some_and(|value| value.to_lowercase().contains(&target))
                })
                .cloned()
                .collect()
        }
        QueryKind::BareName => {
            let target = parsed_query.resource_name.as_deref().unwrap_or("");
            let mut candidates: Vec<ResourceEntry> = arsc_entries
                .iter()
                .filter(|entry| entry.resource_name.as_deref() == Some(target))
                .cloned()
                .collect();
            for raw in raw_entries {
                let Some(path) = raw.path.as_deref() else {
                    continue;
                };
                let matches_name = python_stem(path) == target
                    || Path::new(path)
                        .file_name()
                        .is_some_and(|name| name.to_string_lossy().as_ref() == target);
                if !matches_name {
                    continue;
                }
                let duplicate = candidates.iter().any(|candidate| {
                    candidate.path.as_deref() == Some(path)
                        && candidate.split_name == raw.split_name
                });
                if !duplicate {
                    candidates.push(raw.clone());
                }
            }
            candidates
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
enum GroupKey {
    Arsc {
        package_name: Option<String>,
        resource_type: String,
        resource_name: String,
        qualifier: Option<String>,
    },
    Id {
        resource_id: String,
        qualifier: Option<String>,
    },
    Raw {
        kind: Option<ResourceKind>,
        path: Option<String>,
    },
}

fn group_key(entry: &ResourceEntry) -> GroupKey {
    let resource_type = entry
        .resource_type
        .as_deref()
        .filter(|value| !value.is_empty());
    let resource_name = entry
        .resource_name
        .as_deref()
        .filter(|value| !value.is_empty());
    match (resource_type, resource_name) {
        (Some(resource_type), Some(resource_name)) => GroupKey::Arsc {
            package_name: entry.package_name.clone(),
            resource_type: resource_type.to_string(),
            resource_name: resource_name.to_string(),
            qualifier: entry.qualifier.clone(),
        },
        _ => match entry
            .resource_id
            .as_deref()
            .filter(|value| !value.is_empty())
        {
            Some(resource_id) => GroupKey::Id {
                resource_id: resource_id.to_string(),
                qualifier: entry.qualifier.clone(),
            },
            None => GroupKey::Raw {
                kind: entry.kind,
                path: entry.path.clone(),
            },
        },
    }
}

fn duplicate_status(candidates: &[ResourceEntry], rows: &[usize]) -> DuplicateStatus {
    if rows.len() == 1 {
        return DuplicateStatus::Unique;
    }
    let first = &candidates[rows[0]];
    if first.path.is_some() {
        let first_hash = &first.sha256;
        if first_hash.is_some()
            && rows
                .iter()
                .all(|&index| &candidates[index].sha256 == first_hash)
        {
            DuplicateStatus::Equivalent
        } else {
            DuplicateStatus::Conflict
        }
    } else {
        let first_value = &first.value;
        if rows
            .iter()
            .all(|&index| &candidates[index].value == first_value)
        {
            DuplicateStatus::Equivalent
        } else {
            DuplicateStatus::Conflict
        }
    }
}

fn inferred_kind(entry: &ResourceEntry) -> ResourceKind {
    match entry.path.as_deref() {
        Some(path) if path.starts_with("assets/") => ResourceKind::Asset,
        Some(path) if path.starts_with("lib/") => ResourceKind::Library,
        Some("AndroidManifest.xml") => ResourceKind::Manifest,
        _ => ResourceKind::Resource,
    }
}

fn sort_key(resource_match: &ResourceMatch) -> (String, String, String, String) {
    let logical = match (
        resource_match.resource_type.as_deref(),
        resource_match.resource_name.as_deref(),
    ) {
        (Some(resource_type), Some(resource_name))
            if !resource_type.is_empty() && !resource_name.is_empty() =>
        {
            format!("{resource_type}/{resource_name}")
        }
        (_, Some(resource_name)) if !resource_name.is_empty() => resource_name.to_string(),
        (_, _) => resource_match.path.clone().unwrap_or_default(),
    };
    (
        logical,
        resource_match.split_name.clone(),
        resource_match.qualifier.clone().unwrap_or_default(),
        resource_match.path.clone().unwrap_or_default(),
    )
}

/// Derives the extraction directory name for one split.
///
/// The split name is sanitized to `[A-Za-z0-9._-]`; a container member adds an
/// eight-character SHA-256 prefix, and a plain APK uses `base`.
#[must_use]
pub fn derive_split_dir_name(split_name: &str, container_member: Option<&str>) -> String {
    let mut slug: String = split_name
        .chars()
        .map(|character| {
            if character.is_ascii_alphanumeric() || matches!(character, '.' | '_' | '-') {
                character
            } else {
                '_'
            }
        })
        .collect();
    if slug.is_empty() || slug == "." || slug == ".." {
        slug = "split".to_string();
    }
    let hash8 = match container_member {
        Some(member) => {
            let mut hasher = Sha256::new();
            hasher.update(member.as_bytes());
            let digest = format!("{:x}", hasher.finalize());
            digest[..8].to_string()
        }
        None => "base".to_string(),
    };
    format!("{slug}-{hash8}")
}

/// Extracts file-backed matches into `extract_dir`.
///
/// Returns `(extracted_paths, warnings)`. Every destination is planned and
/// validated before the first directory or file is created.
pub fn extract_matched_resources(
    extract_dir: &Path,
    materialized_apks: &[MaterializedApk],
    matches: &[ResourceMatch],
) -> Result<(Vec<String>, Vec<String>), Error> {
    let dest_root = std::path::absolute(extract_dir).map_err(|error| {
        Error::io(
            format!("resolve extraction directory {}", extract_dir.display()),
            error,
        )
    })?;

    match fs::symlink_metadata(extract_dir) {
        Ok(metadata) => {
            if metadata.file_type().is_symlink() {
                return Err(ArchiveError::Security(format!(
                    "Extraction directory root cannot be a symlink: {}",
                    dest_root.display()
                ))
                .into());
            }
            if metadata.is_file() {
                return Err(ArchiveError::Security(format!(
                    "Extraction directory root is a regular file: {}",
                    dest_root.display()
                ))
                .into());
            }
            if !metadata.is_dir() {
                return Err(ArchiveError::Security(format!(
                    "Extraction directory root is not a directory: {}",
                    dest_root.display()
                ))
                .into());
            }
        }
        Err(error) if error.kind() == std::io::ErrorKind::NotFound => {}
        Err(error) => {
            return Err(ArchiveError::Io {
                context: format!("inspect extraction directory {}", extract_dir.display()),
                kind: error.kind(),
            }
            .into())
        }
    }

    let mut warnings = Vec::new();
    let file_matches: Vec<&ResourceMatch> = matches
        .iter()
        .filter(|matched| matched.path.is_some())
        .collect();
    let scalar_count = matches.len() - file_matches.len();
    if scalar_count > 0 {
        warnings.push(format!(
            "Skipped extracting {scalar_count} scalar resource(s) without file payload."
        ));
    }
    if file_matches.is_empty() {
        return Ok((Vec::new(), warnings));
    }

    let mut split_map: HashMap<&str, &MaterializedApk> = HashMap::new();
    for materialized in materialized_apks {
        split_map.insert(&materialized.split_name, materialized);
    }

    struct PlannedWrite {
        apk_path: PathBuf,
        member: String,
        segments: Vec<String>,
    }

    let mut planned: Vec<PlannedWrite> = Vec::with_capacity(file_matches.len());
    let mut destinations: HashSet<String> = HashSet::new();
    let mut member_cache: HashMap<PathBuf, HashSet<String>> = HashMap::new();

    for matched in file_matches {
        let Some(materialized) = split_map.get(matched.split_name.as_str()) else {
            continue;
        };
        let Some(member) = matched.path.as_deref() else {
            continue;
        };
        let split_dir =
            derive_split_dir_name(&matched.split_name, matched.container_member.as_deref());
        let joined = dest_root.join(&split_dir).join(member);
        let validated = archives::validate_member_name(member, false).map_err(|_| {
            ArchiveError::Security(format!(
                "Extracted file escapes target directory: {}",
                joined.display()
            ))
        })?;

        let mut segments = Vec::with_capacity(validated.segments.len() + 1);
        segments.push(split_dir);
        segments.extend(validated.segments);

        preflight_destination(&dest_root, &segments)?;

        let destination_key = segments.join("/");
        if !destinations.insert(destination_key) {
            return Err(ArchiveError::Security(format!(
                "Conflicting duplicate extraction destination: {}",
                joined.display()
            ))
            .into());
        }

        if !member_cache.contains_key(&materialized.path) {
            let report = archives::inspect_safe_zip_path(&materialized.path)?;
            member_cache.insert(
                materialized.path.clone(),
                report.members.into_iter().map(|entry| entry.name).collect(),
            );
        }
        let Some(members) = member_cache.get(&materialized.path) else {
            return Err(ArchiveError::Corrupt(format!(
                "Resource member cache missing for {}",
                materialized.path.display()
            ))
            .into());
        };
        if !members.contains(member) {
            return Err(ArchiveError::Corrupt(format!(
                "Resource member {member} not found in {}",
                materialized.path.display()
            ))
            .into());
        }

        planned.push(PlannedWrite {
            apk_path: materialized.path.clone(),
            member: member.to_string(),
            segments,
        });
    }

    fs::create_dir_all(&dest_root).map_err(|error| {
        Error::io(
            format!("create extraction directory {}", dest_root.display()),
            error,
        )
    })?;
    let canonical_root = fs::canonicalize(&dest_root).map_err(|error| {
        Error::io(
            format!("resolve extraction directory {}", dest_root.display()),
            error,
        )
    })?;

    let mut extracted_paths = Vec::with_capacity(planned.len());
    for write in planned {
        let Some((file_name, directory_segments)) = write.segments.split_last() else {
            continue;
        };
        let parent = ensure_safe_directory(&canonical_root, directory_segments)?;
        let destination = parent.join(file_name);
        archives::safe_extract_member(&write.apk_path, &write.member, &destination)?;
        extracted_paths.push(destination.to_string_lossy().into_owned());
    }

    Ok((extracted_paths, warnings))
}

fn preflight_destination(root: &Path, segments: &[String]) -> Result<(), ArchiveError> {
    let mut current = root.to_path_buf();
    for (index, segment) in segments.iter().enumerate() {
        current.push(segment);
        let is_last = index + 1 == segments.len();
        match fs::symlink_metadata(&current) {
            Ok(metadata) => {
                if metadata.file_type().is_symlink() {
                    if is_last {
                        return Err(ArchiveError::Security(format!(
                            "Destination file already exists: {}",
                            current.display()
                        )));
                    }
                    return Err(ArchiveError::Security(format!(
                        "Symlink ancestor escapes extraction root: {}",
                        current.display()
                    )));
                }
                if is_last {
                    return Err(ArchiveError::Security(format!(
                        "Destination file already exists: {}",
                        current.display()
                    )));
                }
                if !metadata.is_dir() {
                    return Err(ArchiveError::Security(format!(
                        "Destination path component is not a directory: {}",
                        current.display()
                    )));
                }
            }
            Err(error) if error.kind() == std::io::ErrorKind::NotFound => return Ok(()),
            Err(error) => {
                return Err(ArchiveError::Io {
                    context: format!("inspect destination {}", current.display()),
                    kind: error.kind(),
                })
            }
        }
    }
    Ok(())
}

fn ensure_safe_directory(root: &Path, segments: &[String]) -> Result<PathBuf, ArchiveError> {
    let mut current = root.to_path_buf();
    for segment in segments {
        current.push(segment);
        match fs::symlink_metadata(&current) {
            Ok(metadata) => {
                if metadata.file_type().is_symlink() {
                    return Err(ArchiveError::Security(format!(
                        "Symlink ancestor escapes extraction root: {}",
                        current.display()
                    )));
                }
                if !metadata.is_dir() {
                    return Err(ArchiveError::Security(format!(
                        "Destination path component is not a directory: {}",
                        current.display()
                    )));
                }
            }
            Err(error) if error.kind() == std::io::ErrorKind::NotFound => {
                fs::create_dir(&current).map_err(|error| ArchiveError::Io {
                    context: format!("create extraction directory {}", current.display()),
                    kind: error.kind(),
                })?;
            }
            Err(error) => {
                return Err(ArchiveError::Io {
                    context: format!("inspect extraction directory {}", current.display()),
                    kind: error.kind(),
                })
            }
        }
        let canonical = fs::canonicalize(&current).map_err(|error| ArchiveError::Io {
            context: format!("resolve extraction directory {}", current.display()),
            kind: error.kind(),
        })?;
        if !canonical.starts_with(root) {
            return Err(ArchiveError::Security(format!(
                "Extraction directory {} escapes target directory {}",
                canonical.display(),
                root.display()
            )));
        }
    }
    Ok(current)
}

/// Runs a resource query against an artifact and optionally extracts matches.
pub fn inspect_resources(
    artifact_path: impl AsRef<Path>,
    query: &str,
    extract_dir: Option<&Path>,
) -> Result<ResourceQueryReport, Error> {
    let options = InspectionOptions::from_process();
    inspect_resources_with_options(artifact_path, query, extract_dir, &options)
}

/// [`inspect_resources`] with explicit host/tool inputs.
pub fn inspect_resources_with_options(
    artifact_path: impl AsRef<Path>,
    query: &str,
    extract_dir: Option<&Path>,
    options: &InspectionOptions,
) -> Result<ResourceQueryReport, Error> {
    let parsed = normalize_resource_query(query)?;
    let artifact_path = artifact_path.as_ref();
    let (_inspection, materialized) =
        inspect_artifact_with_materialization(artifact_path, options)?;
    let aapt2 = find_build_tools_bin(&options.env, "aapt2")?;
    let (matches, mut warnings) =
        query_apk_resources_with_aapt2(materialized.as_slice(), &parsed, &aapt2)?;

    let mut extracted_paths = Vec::new();
    if let Some(directory) = extract_dir {
        let (paths, extraction_warnings) =
            extract_matched_resources(directory, materialized.as_slice(), &matches)?;
        extracted_paths = paths;
        warnings.extend(extraction_warnings);
    }

    Ok(ResourceQueryReport {
        query: query.to_string(),
        matches,
        extracted_paths,
        warnings,
    })
}

/// Python `PurePath.stem`, including hidden-file behavior.
fn python_stem(name: &str) -> String {
    Path::new(name)
        .file_stem()
        .map(|stem| stem.to_string_lossy().into_owned())
        .unwrap_or_default()
}

fn python_splitlines(text: &str) -> Vec<&str> {
    let mut lines = Vec::new();
    let mut start = 0usize;
    let mut chars = text.char_indices().peekable();
    while let Some((index, character)) = chars.next() {
        if !matches!(
            character,
            '\n' | '\r'
                | '\u{0b}'
                | '\u{0c}'
                | '\u{1c}'
                | '\u{1d}'
                | '\u{1e}'
                | '\u{85}'
                | '\u{2028}'
                | '\u{2029}'
        ) {
            continue;
        }
        lines.push(&text[start..index]);
        start = index + character.len_utf8();
        if character == '\r' {
            if let Some(&(next_index, '\n')) = chars.peek() {
                chars.next();
                start = next_index + 1;
            }
        }
    }
    if start < text.len() {
        lines.push(&text[start..]);
    }
    lines
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::inspection::InspectionOptions;
    use crate::models::ExitCode;
    use crate::tools::ToolEnvironment;
    use sha2::{Digest, Sha256};
    use std::fs;
    use std::io::Write;
    use std::path::{Path, PathBuf};

    fn temp_dir() -> (tempfile::TempDir, PathBuf) {
        let directory = tempfile::tempdir().expect("create temp dir");
        let root = fs::canonicalize(directory.path()).expect("canonicalize temp dir");
        (directory, root)
    }

    fn write_zip(path: &Path, members: &[(&str, &[u8])]) {
        let file = fs::File::create(path).expect("create zip");
        let mut writer = zip::ZipWriter::new(file);
        for (name, bytes) in members {
            writer
                .start_file(*name, zip::write::SimpleFileOptions::default())
                .expect("start zip member");
            writer.write_all(bytes).expect("write zip member");
        }
        writer.finish().expect("finish zip");
    }

    #[cfg(unix)]
    fn write_executable(path: &Path, body: &str) {
        use std::os::unix::fs::PermissionsExt;

        fs::write(path, body).expect("write stub tool");
        let mut permissions = fs::metadata(path).expect("stat stub tool").permissions();
        permissions.set_mode(0o755);
        fs::set_permissions(path, permissions).expect("chmod stub tool");
    }

    #[cfg(unix)]
    fn stub_aapt2(root: &Path, body: &str) -> PathBuf {
        let tool = root.join("aapt2");
        write_executable(&tool, &format!("#!/bin/sh\n{body}\n"));
        tool
    }

    fn materialized(
        path: PathBuf,
        split_name: &str,
        container_member: Option<&str>,
    ) -> MaterializedApk {
        MaterializedApk {
            path,
            container_member: container_member.map(str::to_string),
            split_name: split_name.to_string(),
            is_base: container_member.is_none(),
        }
    }

    fn resource_match(
        split_name: &str,
        container_member: Option<&str>,
        path: &str,
    ) -> ResourceMatch {
        ResourceMatch {
            container_member: container_member.map(str::to_string),
            split_name: split_name.to_string(),
            package_name: Some("com.example.app".to_string()),
            resource_id: Some("0x7f080001".to_string()),
            resource_type: Some("drawable".to_string()),
            resource_name: Some("test".to_string()),
            qualifier: None,
            value: None,
            path: Some(path.to_string()),
            kind: ResourceKind::Resource,
            morphe_mode: MorpheMode::ResourcePatch,
            sha256: None,
            duplicate_status: DuplicateStatus::Unique,
        }
    }

    #[test]
    fn query_normalization_matches_python_aliases() {
        let hex = normalize_resource_query("7f08028e").expect("hex query");
        assert_eq!(hex.kind, QueryKind::Id);
        assert_eq!(hex.resource_id.as_deref(), Some("0x7f08028e"));
        let hex_upper = normalize_resource_query("0x7F08028E").expect("uppercase hex");
        assert_eq!(hex_upper.resource_id.as_deref(), Some("0x7f08028e"));

        let drawable = normalize_resource_query("@drawable/map_preview").expect("drawable query");
        assert_eq!(drawable.kind, QueryKind::TypeName);
        assert_eq!(drawable.resource_type.as_deref(), Some("drawable"));
        assert_eq!(drawable.resource_name.as_deref(), Some("map_preview"));
        assert_eq!(drawable.package_name, None);

        let id_alias = normalize_resource_query("@+id/submit_button").expect("id alias");
        assert_eq!(id_alias.kind, QueryKind::TypeName);
        assert_eq!(id_alias.resource_type.as_deref(), Some("id"));
        assert_eq!(id_alias.resource_name.as_deref(), Some("submit_button"));

        let packed = normalize_resource_query("com.test:string/app_name").expect("packaged query");
        assert_eq!(packed.package_name.as_deref(), Some("com.test"));
        assert_eq!(packed.resource_type.as_deref(), Some("string"));
        assert_eq!(packed.resource_name.as_deref(), Some("app_name"));

        for path in [
            "res/drawable-xxhdpi/icon.png",
            "assets/index.android.bundle",
            "lib/arm64-v8a/libsig.so",
            "AndroidManifest.xml",
        ] {
            let parsed = normalize_resource_query(path).expect("path query");
            assert_eq!(parsed.kind, QueryKind::Path, "{path}");
            assert_eq!(parsed.path.as_deref(), Some(path));
        }

        let bare = normalize_resource_query("map_preview_trails").expect("bare query");
        assert_eq!(bare.kind, QueryKind::BareName);
        assert_eq!(bare.resource_name.as_deref(), Some("map_preview_trails"));

        for query in [
            "text:Premium",
            "val:hello world",
            "value:test",
            "TEXT:Upper",
        ] {
            let parsed = normalize_resource_query(query).expect("value query");
            assert_eq!(parsed.kind, QueryKind::Value);
        }
        let ellipsis = normalize_resource_query("text:Loading...").expect("ellipsis value");
        assert_eq!(ellipsis.kind, QueryKind::Value);
        assert_eq!(ellipsis.text_value.as_deref(), Some("Loading..."));

        let at_only = normalize_resource_query("@foo").expect("bare at query");
        assert_eq!(at_only.kind, QueryKind::BareName);
        assert_eq!(at_only.resource_name.as_deref(), Some("@foo"));
    }

    #[test]
    fn query_normalization_rejects_invalid_input() {
        for (query, expected) in [
            ("   ", "empty"),
            ("res/icon\u{0}.png", "control characters"),
            ("../escaped.png", "path traversal"),
            ("/etc/passwd", "absolute path"),
            ("text:   ", "empty"),
            ("string/", "Malformed resource type/name"),
            ("/drawable/x", "absolute path"),
        ] {
            let error = normalize_resource_query(query).expect_err(query);
            assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
            assert!(
                error.message().contains(expected),
                "query {query:?}: {}",
                error.message()
            );
        }
    }

    #[test]
    fn cli_query_resolution_prefers_query_and_maps_text() {
        assert_eq!(
            resolve_query(Some("@string/app"), Some("ignored")).expect("query wins"),
            "@string/app"
        );
        assert_eq!(
            resolve_query(None, Some("Premium")).expect("text maps"),
            "text:Premium"
        );
        assert_eq!(
            resolve_query(Some(""), Some("Premium")).expect("empty query yields text"),
            "text:Premium"
        );
        assert!(resolve_query(None, None).is_err());
        assert!(resolve_query(Some(""), Some("")).is_err());
        assert_eq!(
            resolve_query(Some("   "), None).expect("whitespace query survives"),
            "   "
        );
    }

    #[test]
    fn aapt2_dump_parser_produces_exact_scalars_and_qualifiers() {
        let dump = r#"
Package name=com.example.app id=7f
  type string id=01 entryCount=2
    resource 0x7f010001 string/app_name
      () "My App"
      (fr) "Mon App"
  type drawable id=02 entryCount=1
    resource 0x7f08028e drawable/map_preview_trails
      (xxhdpi) (file) res/drawable-xxhdpi/map_preview_trails.webp type=webp
      (file) res/drawable/map_preview_trails.png
"#;
        let entries = parse_aapt2_resource_dump(dump, "base", Some("splits/base.apk"));
        assert_eq!(entries.len(), 4);
        assert_eq!(entries[0].resource_id.as_deref(), Some("0x7f010001"));
        assert_eq!(entries[0].resource_type.as_deref(), Some("string"));
        assert_eq!(entries[0].resource_name.as_deref(), Some("app_name"));
        assert_eq!(entries[0].package_name.as_deref(), Some("com.example.app"));
        assert_eq!(entries[0].qualifier, None);
        assert_eq!(entries[0].value.as_deref(), Some("\"My App\""));
        assert_eq!(entries[0].path, None);
        assert_eq!(entries[1].qualifier.as_deref(), Some("fr"));
        assert_eq!(entries[1].value.as_deref(), Some("\"Mon App\""));
        assert_eq!(
            entries[2].path.as_deref(),
            Some("res/drawable-xxhdpi/map_preview_trails.webp")
        );
        assert_eq!(entries[2].qualifier.as_deref(), Some("xxhdpi"));
        assert_eq!(
            entries[3].path.as_deref(),
            Some("res/drawable/map_preview_trails.png")
        );
        assert_eq!(entries[3].qualifier, None);
    }

    #[test]
    fn aapt2_dump_parser_normalizes_ids_and_tolerates_odd_lines() {
        let dump = "Package name=p\n  resource 0x0000000A string/spaced\n    () (file)  res/a.png extra\n  resource 0xFFFFFFFFFFFFFFFFFFFFFFFF drawable/huge\n    (fr) \"\"\nnot a resource line\n";
        let entries = parse_aapt2_resource_dump(dump, "base", None);
        assert_eq!(entries.len(), 2);
        assert_eq!(entries[0].resource_id.as_deref(), Some("0x0000000a"));
        assert_eq!(entries[0].path.as_deref(), Some("res/a.png"));
        assert_eq!(
            entries[1].resource_id.as_deref(),
            Some("0xffffffffffffffffffffffff")
        );
        assert_eq!(entries[1].qualifier.as_deref(), Some("fr"));
        assert_eq!(entries[1].value.as_deref(), Some("\"\""));
        assert!(parse_aapt2_resource_dump("", "base", None).is_empty());
    }

    #[test]
    fn hex_normalization_matches_python_formatting() {
        assert_eq!(normalize_hex_id("7f08028e"), "0x7f08028e");
        assert_eq!(normalize_hex_id("7F08028E"), "0x7f08028e");
        assert_eq!(normalize_hex_id("00000001"), "0x00000001");
        assert_eq!(normalize_hex_id("0"), "0x00000000");
        assert_eq!(normalize_hex_id("123456789"), "0x123456789");
    }

    #[cfg(unix)]
    #[test]
    fn duplicate_scalars_are_equivalent_or_conflict_and_sorted() {
        let (_guard, root) = temp_dir();
        let tool = stub_aapt2(
            &root,
            r#"case "$*" in
  *base.apk*) printf '%s' 'Package name=com.example.app id=7f
  type string id=01
    resource 0x7f010002 string/zebra
      () "Z"
    resource 0x7f010001 string/alpha
      () "Same"
      (fr) "Fr"
' ;;
  *split.apk*) printf '%s' 'Package name=com.example.app id=7f
  type string id=01
    resource 0x7f010001 string/alpha
      () "Same"
' ;;
  *) exit 9 ;;
esac"#,
        );
        let base_path = root.join("base.apk");
        let split_path = root.join("split.apk");
        write_zip(&base_path, &[("resources.arsc", b"fake")]);
        write_zip(&split_path, &[("resources.arsc", b"fake")]);
        let apks = vec![
            materialized(base_path, "base", None),
            materialized(split_path, "split_config", Some("splits/split.apk")),
        ];

        let parsed = normalize_resource_query("alpha").expect("bare query");
        let (matches, warnings) =
            query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query resources");
        assert!(warnings.is_empty());
        assert_eq!(matches.len(), 3);
        assert_eq!(matches[0].split_name, "base");
        assert_eq!(matches[0].qualifier, None);
        assert_eq!(matches[0].duplicate_status, DuplicateStatus::Equivalent);
        assert_eq!(matches[1].split_name, "base");
        assert_eq!(matches[1].qualifier.as_deref(), Some("fr"));
        assert_eq!(matches[1].duplicate_status, DuplicateStatus::Unique);
        assert_eq!(matches[2].split_name, "split_config");
        assert_eq!(matches[2].qualifier, None);
        assert_eq!(matches[2].duplicate_status, DuplicateStatus::Equivalent);
    }

    #[cfg(unix)]
    #[test]
    fn duplicate_file_hashes_decide_equivalence_across_splits() {
        let (_guard, root) = temp_dir();
        let tool = stub_aapt2(
            &root,
            r#"case "$*" in
  *base.apk*) printf '%s' 'Package name=com.example.app id=7f
  type drawable id=02
    resource 0x7f080001 drawable/icon
      () (file) res/drawable/icon.png
' ;;
  *split.apk*) printf '%s' 'Package name=com.example.app id=7f
  type drawable id=02
    resource 0x7f080001 drawable/icon
      () (file) res/drawable/icon.png
' ;;
  *) exit 9 ;;
esac"#,
        );
        let base_path = root.join("base.apk");
        let split_path = root.join("split.apk");
        write_zip(
            &base_path,
            &[
                ("resources.arsc", b"fake"),
                ("res/drawable/icon.png", b"same bytes"),
            ],
        );
        write_zip(
            &split_path,
            &[
                ("resources.arsc", b"fake"),
                ("res/drawable/icon.png", b"same bytes"),
            ],
        );
        let apks = vec![
            materialized(base_path, "base", None),
            materialized(split_path.clone(), "split_config", Some("splits/split.apk")),
        ];
        let parsed = normalize_resource_query("0x7f080001").expect("id query");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 2);
        assert!(matches
            .iter()
            .all(|row| row.duplicate_status == DuplicateStatus::Equivalent));
        assert_eq!(matches[0].kind, ResourceKind::Resource);
        assert_eq!(matches[0].morphe_mode, MorpheMode::ResourcePatch);
        assert!(matches[0].sha256.is_some());
        assert_eq!(matches[0].sha256, matches[1].sha256);

        // Different bytes under the same identity become a conflict.
        write_zip(
            &split_path,
            &[
                ("resources.arsc", b"fake"),
                ("res/drawable/icon.png", b"different bytes"),
            ],
        );
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 2);
        assert!(matches
            .iter()
            .all(|row| row.duplicate_status == DuplicateStatus::Conflict));
    }

    #[cfg(unix)]
    #[test]
    fn scalar_values_and_unicode_search_are_case_insensitive() {
        let (_guard, root) = temp_dir();
        let tool = stub_aapt2(
            &root,
            r#"printf '%s' 'Package name=com.example.app id=7f
  type string id=01
    resource 0x7f010001 string/premium_upsell
      () "Über Premium member"
    resource 0x7f010002 string/free_tier
      () "Basic free member"
'"#,
        );
        let apk_path = root.join("base.apk");
        write_zip(&apk_path, &[("resources.arsc", b"fake")]);
        let apks = vec![materialized(apk_path, "base", None)];

        let parsed = normalize_resource_query("text:über").expect("unicode query");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 1);
        assert_eq!(matches[0].resource_name.as_deref(), Some("premium_upsell"));
        assert_eq!(matches[0].value.as_deref(), Some("\"Über Premium member\""));

        let parsed = normalize_resource_query("value:MEMBER").expect("value query");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 2);
        assert_eq!(matches[0].duplicate_status, DuplicateStatus::Unique);
    }

    #[cfg(unix)]
    #[test]
    fn arsc_less_splits_keep_raw_members_and_skip_the_dump() {
        let (_guard, root) = temp_dir();
        let log = root.join("calls.log");
        let escaped_log = log.to_string_lossy().replace('\'', "'\\''");
        let tool = stub_aapt2(
            &root,
            &format!(
                "printf '%s\\n' \"$*\" >> '{escaped_log}'\nprintf '%s' 'Package name=com.example.app id=7f\n'"
            ),
        );
        let base_path = root.join("base.apk");
        let split_path = root.join("config.arm64_v8a.apk");
        write_zip(
            &base_path,
            &[
                ("resources.arsc", b"fake"),
                ("AndroidManifest.xml", b"<manifest/>"),
            ],
        );
        write_zip(&split_path, &[("lib/arm64-v8a/libfoo.so", b"ELF")]);
        let apks = vec![
            materialized(base_path, "base", None),
            materialized(
                split_path,
                "config.arm64_v8a",
                Some("splits/config.arm64_v8a.apk"),
            ),
        ];

        let parsed = normalize_resource_query("lib/arm64-v8a/libfoo.so").expect("lib query");
        let (matches, warnings) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("q");
        assert!(warnings.is_empty());
        assert_eq!(matches.len(), 1);
        assert_eq!(matches[0].split_name, "config.arm64_v8a");
        assert_eq!(matches[0].kind, ResourceKind::Library);
        assert_eq!(matches[0].morphe_mode, MorpheMode::RawResourcePatch);

        let calls = fs::read_to_string(&log).expect("read calls log");
        assert_eq!(
            calls.lines().count(),
            1,
            "only the ARSC split is dumped: {calls}"
        );
        assert!(calls.contains("base.apk"));
        assert!(!calls.contains("config.arm64_v8a.apk"));
    }

    #[cfg(unix)]
    #[test]
    fn raw_bare_name_and_manifest_queries_keep_kinds() {
        let (_guard, root) = temp_dir();
        let tool = stub_aapt2(&root, "exit 0");
        let apk_path = root.join("base.apk");
        write_zip(
            &apk_path,
            &[
                ("AndroidManifest.xml", b"<manifest/>"),
                ("assets/bundle.js", b"console.log()"),
                ("res/drawable/icon.png", b"icon"),
            ],
        );
        let apks = vec![materialized(apk_path, "base", None)];

        let parsed = normalize_resource_query("AndroidManifest.xml").expect("manifest");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 1);
        assert_eq!(matches[0].kind, ResourceKind::Manifest);
        assert_eq!(matches[0].morphe_mode, MorpheMode::ResourcePatch);

        let parsed = normalize_resource_query("bundle.js").expect("raw filename");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 1);
        assert_eq!(matches[0].path.as_deref(), Some("assets/bundle.js"));
        assert_eq!(matches[0].kind, ResourceKind::Asset);
        assert_eq!(matches[0].morphe_mode, MorpheMode::RawResourcePatch);

        let parsed = normalize_resource_query("icon").expect("raw stem");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 1);
        assert_eq!(matches[0].path.as_deref(), Some("res/drawable/icon.png"));
        assert_eq!(matches[0].resource_name.as_deref(), Some("icon"));
    }

    #[cfg(unix)]
    #[test]
    fn nonzero_aapt2_dump_is_a_warning_plus_raw_match() {
        let (_guard, root) = temp_dir();
        let tool = stub_aapt2(&root, "echo 'error: failed to dump resources' >&2\nexit 1");
        let apk_path = root.join("base.apk");
        write_zip(
            &apk_path,
            &[
                ("resources.arsc", b"fake"),
                ("AndroidManifest.xml", b"<manifest/>"),
            ],
        );
        let apks = vec![materialized(apk_path, "base", None)];
        let parsed = normalize_resource_query("AndroidManifest.xml").expect("manifest");
        let (matches, warnings) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("q");
        assert_eq!(matches.len(), 1);
        assert_eq!(warnings.len(), 1);
        assert_eq!(
            warnings[0],
            "aapt2 dump resources returned code 1 on split 'base': error: failed to dump resources"
        );
    }

    #[test]
    fn split_directory_names_are_sanitized_slug_plus_member_hash() {
        assert_eq!(derive_split_dir_name("base", None), "base-base");
        let derived = derive_split_dir_name(
            "split_config.xxhdpi",
            Some("splits/split_config.xxhdpi.apk"),
        );
        let mut hasher = Sha256::new();
        hasher.update(b"splits/split_config.xxhdpi.apk");
        let digest = format!("{:x}", hasher.finalize());
        assert_eq!(derived, format!("split_config.xxhdpi-{}", &digest[..8]));

        for (name, expected) in [
            ("../../etc/passwd", ".._.._etc_passwd"),
            ("..", "split"),
            (".", "split"),
            ("", "split"),
            ("über/split", "_ber_split"),
        ] {
            let derived = derive_split_dir_name(name, None);
            assert_eq!(derived, format!("{expected}-base"));
            assert_eq!(derived.matches('/').count(), 0);
        }
    }

    #[cfg(unix)]
    #[test]
    fn extraction_writes_only_file_matches_with_expected_tree() {
        let (_guard, root) = temp_dir();
        let apk_path = root.join("base.apk");
        write_zip(&apk_path, &[("res/drawable/test.png", b"test_png_bytes")]);
        let apks = vec![materialized(apk_path, "base", Some("splits/base.apk"))];
        let file_match = resource_match("base", Some("splits/base.apk"), "res/drawable/test.png");
        let scalar_match = ResourceMatch {
            path: None,
            value: Some("Hello".to_string()),
            resource_type: Some("string".to_string()),
            resource_name: Some("hello".to_string()),
            ..file_match.clone()
        };

        let dest = root.join("out_res");
        let (extracted, warnings) =
            extract_matched_resources(&dest, &apks, &[file_match, scalar_match]).expect("extract");
        assert_eq!(extracted.len(), 1);
        assert_eq!(
            warnings,
            vec!["Skipped extracting 1 scalar resource(s) without file payload."]
        );
        let expected_dir = derive_split_dir_name("base", Some("splits/base.apk"));
        let extracted_path = Path::new(&extracted[0]);
        assert!(extracted_path.starts_with(fs::canonicalize(&dest).expect("canonical dest")));
        assert!(extracted_path.ends_with(format!("{expected_dir}/res/drawable/test.png")));
        assert_eq!(
            fs::read(extracted_path).expect("read extracted"),
            b"test_png_bytes"
        );
        assert_eq!(collect_files(&dest).len(), 1);
        let mut hasher = Sha256::new();
        hasher.update(fs::read(extracted_path).expect("read extracted"));
        let mut expected_hasher = Sha256::new();
        expected_hasher.update(b"test_png_bytes");
        assert_eq!(
            format!("{:x}", hasher.finalize()),
            format!("{:x}", expected_hasher.finalize())
        );
    }

    fn collect_files(root: &Path) -> Vec<PathBuf> {
        let mut files = Vec::new();
        let mut stack = vec![root.to_path_buf()];
        while let Some(directory) = stack.pop() {
            for entry in fs::read_dir(&directory).expect("read directory") {
                let entry = entry.expect("dir entry");
                let path = entry.path();
                if path.is_dir() {
                    stack.push(path);
                } else {
                    files.push(path);
                }
            }
        }
        files.sort();
        files
    }

    #[cfg(unix)]
    #[test]
    fn extraction_rejects_symlink_roots_and_ancestors_without_writing() {
        use std::os::unix::fs::symlink;

        let (_guard, root) = temp_dir();
        let apk_path = root.join("base.apk");
        write_zip(&apk_path, &[("res/a.png", b"a")]);
        let apks = vec![materialized(apk_path, "base", None)];
        let matched = resource_match("base", None, "res/a.png");

        let outside = root.join("outside");
        fs::create_dir(&outside).expect("create outside dir");

        let symlink_root = root.join("link_root");
        symlink(&outside, &symlink_root).expect("create symlink root");
        let error = extract_matched_resources(&symlink_root, &apks, std::slice::from_ref(&matched))
            .expect_err("symlink root");
        assert!(error.message().contains("cannot be a symlink"));
        assert!(fs::read_dir(&outside).expect("outside").next().is_none());

        let dest = root.join("out");
        let slug = derive_split_dir_name("base", None);
        let symlink_ancestor = dest.join(&slug).join("res");
        fs::create_dir_all(symlink_ancestor.parent().expect("parent")).expect("create dest");
        symlink(&outside, &symlink_ancestor).expect("create symlink ancestor");
        let error =
            extract_matched_resources(&dest, &apks, &[matched]).expect_err("symlink ancestor");
        assert!(error.message().contains("Symlink ancestor"));
        assert!(fs::read_dir(&outside).expect("outside").next().is_none());
    }

    #[test]
    fn extraction_rejects_regular_file_root() {
        let (_guard, root) = temp_dir();
        let apk_path = root.join("base.apk");
        write_zip(&apk_path, &[("res/a.png", b"a")]);
        let apks = vec![materialized(apk_path, "base", None)];
        let dest = root.join("not_a_dir");
        fs::write(&dest, b"file").expect("write root file");
        let error =
            extract_matched_resources(&dest, &apks, &[resource_match("base", None, "res/a.png")])
                .expect_err("file root");
        assert!(error.message().contains("regular file"));
    }

    #[test]
    fn extraction_preflight_rejection_leaves_no_output() {
        let (_guard, root) = temp_dir();
        let apk_path = root.join("base.apk");
        write_zip(
            &apk_path,
            &[("res/other.png", b"other"), ("res/test.png", b"test")],
        );
        let apks = vec![materialized(apk_path, "base", None)];
        let dest = root.join("out");
        let slug = derive_split_dir_name("base", None);
        fs::create_dir_all(dest.join(&slug).join("res")).expect("create dest tree");
        fs::write(dest.join(&slug).join("res/test.png"), b"existing").expect("existing target");

        let error = extract_matched_resources(
            &dest,
            &apks,
            &[
                resource_match("base", None, "res/other.png"),
                resource_match("base", None, "res/test.png"),
            ],
        )
        .expect_err("existing target");
        assert!(error.message().contains("already exists"));
        assert!(!dest.join(&slug).join("res/other.png").exists());

        let collision_dest = root.join("collision");
        let collision = extract_matched_resources(
            &collision_dest,
            &apks,
            &[
                resource_match("base", None, "res/other.png"),
                resource_match("base", None, "res/other.png"),
            ],
        )
        .expect_err("duplicate destination");
        assert!(collision.message().contains("Conflicting duplicate"));
        assert!(!collision_dest.exists());
    }

    #[test]
    fn extraction_rejects_traversal_absolute_and_missing_members_without_output() {
        let (_guard, root) = temp_dir();
        let apk_path = root.join("base.apk");
        write_zip(&apk_path, &[("res/a.png", b"a")]);
        let apks = vec![materialized(apk_path, "base", None)];

        for path in ["../escape.png", "/etc/passwd"] {
            let dest = root.join("escape_out");
            let error =
                extract_matched_resources(&dest, &apks, &[resource_match("base", None, path)])
                    .expect_err("unsafe path");
            assert!(
                error.message().contains("escapes target directory"),
                "{path}"
            );
            assert!(!dest.exists());
        }

        let dest = root.join("missing_out");
        let error = extract_matched_resources(
            &dest,
            &apks,
            &[resource_match("base", None, "res/missing.png")],
        )
        .expect_err("missing member");
        assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
        assert!(error.message().contains("not found"));
        assert!(!dest.exists());
    }

    #[cfg(unix)]
    #[test]
    fn package_qualified_queries_and_arsc_path_precedence() {
        let (_guard, root) = temp_dir();
        let tool = stub_aapt2(
            &root,
            r#"printf '%s' 'Package name=com.example.app id=7f
  type string id=01
    resource 0x7f010001 string/alpha
      () "A"
  type drawable id=02
    resource 0x7f080001 drawable/icon
      () (file) res/drawable/icon.png
'"#,
        );
        let base_path = root.join("base.apk");
        let split_path = root.join("split.apk");
        write_zip(
            &base_path,
            &[
                ("resources.arsc", b"fake"),
                ("res/drawable/icon.png", b"arsc bytes"),
            ],
        );
        write_zip(&split_path, &[("res/drawable/icon.png", b"raw bytes")]);
        let apks = vec![
            materialized(base_path, "base", None),
            materialized(split_path, "split_config", Some("splits/split.apk")),
        ];

        let parsed =
            normalize_resource_query("com.example.app:string/alpha").expect("packaged query");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 1);
        assert_eq!(matches[0].split_name, "base");

        let parsed =
            normalize_resource_query("com.other:string/alpha").expect("wrong package query");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert!(matches.is_empty());

        // An ARSC path match suppresses raw entries with the same path.
        let parsed = normalize_resource_query("res/drawable/icon.png").expect("path query");
        let (matches, _) = query_apk_resources_with_aapt2(&apks, &parsed, &tool).expect("query");
        assert_eq!(matches.len(), 1);
        assert_eq!(matches[0].split_name, "base");
        assert_eq!(matches[0].kind, ResourceKind::Resource);
        assert_eq!(matches[0].sha256.as_deref().map(str::len), Some(64));
    }

    #[test]
    fn malicious_split_names_are_slugged_before_path_use() {
        let (_guard, root) = temp_dir();
        let apk_path = root.join("base.apk");
        write_zip(&apk_path, &[("res/a.png", b"a")]);
        let apks = vec![materialized(
            apk_path,
            "../../../etc/passwd",
            Some("splits/../../config.apk"),
        )];
        let dest = root.join("out");
        let (extracted, _) = extract_matched_resources(
            &dest,
            &apks,
            &[resource_match(
                "../../../etc/passwd",
                Some("splits/../../config.apk"),
                "res/a.png",
            )],
        )
        .expect("extract with malicious split name");
        assert_eq!(extracted.len(), 1);
        let extracted_path = Path::new(&extracted[0]);
        assert!(extracted_path.starts_with(fs::canonicalize(&dest).expect("canonical dest")));
        assert!(!extracted_path
            .components()
            .any(|component| matches!(component, std::path::Component::ParentDir)));
        let relative = extracted_path
            .strip_prefix(fs::canonicalize(&dest).expect("canonical dest"))
            .expect("relative path");
        let slug = relative.components().next().expect("slug component");
        assert_eq!(
            slug.as_os_str().to_string_lossy().to_string(),
            derive_split_dir_name("../../../etc/passwd", Some("splits/../../config.apk"))
        );
    }

    #[test]
    fn format_human_matches_python_report_lines() {
        let report = ResourceQueryReport {
            query: "icon".to_string(),
            matches: vec![ResourceMatch {
                path: Some("res/drawable/icon.png".to_string()),
                resource_type: Some("drawable".to_string()),
                resource_name: Some("icon".to_string()),
                ..resource_match("base", None, "res/drawable/icon.png")
            }],
            extracted_paths: vec!["/tmp/out/icon.png".to_string()],
            warnings: vec!["warn".to_string()],
        };
        assert_eq!(
            report.format_human(),
            "Found 1 matching resources:\n0x7f080001 | drawable/icon | - | base:res/drawable/icon.png | resourcePatch | unique\nExtracted 1 files:\n  /tmp/out/icon.png\nWarning: warn"
        );
    }

    #[cfg(unix)]
    #[test]
    fn inspect_resources_end_to_end_uses_process_adapter_and_extraction() {
        let (_guard, root) = temp_dir();
        let bin = root.join("bin");
        fs::create_dir(&bin).expect("create bin");
        let badging = "package: name='com.example.app' versionCode='1' versionName='1.0'\n";
        let resources = "Package name=com.example.app id=7f\n  type drawable id=02\n    resource 0x7f080001 drawable/icon\n      () (file) res/drawable/icon.png\n";
        let escaped_badging = badging.replace('\'', "'\\''");
        let escaped_resources = resources.replace('\'', "'\\''");
        write_executable(
            &bin.join("aapt2"),
            &format!(
                "#!/bin/sh\ncase \"$*\" in\n  *badging*) printf '%s' '{escaped_badging}' ;;\n  *resources*) printf '%s' '{escaped_resources}' ;;\n  *) exit 9 ;;\nesac\n"
            ),
        );
        let apk = root.join("base.apk");
        write_zip(
            &apk,
            &[
                ("AndroidManifest.xml", b"<manifest/>"),
                ("resources.arsc", b"fake"),
                ("res/drawable/icon.png", b"icon bytes"),
            ],
        );
        let options = InspectionOptions {
            env: ToolEnvironment {
                path: Some(bin.into_os_string()),
                ..ToolEnvironment::default()
            },
            timeout: crate::inspection::DEFAULT_TOOL_TIMEOUT,
        };
        let dest = root.join("extracted");
        let report = inspect_resources_with_options(&apk, "0x7f080001", Some(&dest), &options)
            .expect("inspect resources");
        assert_eq!(report.matches.len(), 1);
        assert_eq!(report.matches[0].kind, ResourceKind::Resource);
        assert_eq!(report.extracted_paths.len(), 1);
        assert_eq!(
            fs::read(&report.extracted_paths[0]).expect("read extracted"),
            b"icon bytes"
        );
        assert_eq!(report.query, "0x7f080001");
    }

    #[cfg(unix)]
    #[test]
    fn large_aapt2_dump_is_not_truncated_at_one_mib() {
        let (_guard, root) = temp_dir();
        let tool = stub_aapt2(
            &root,
            r#"printf 'Package name=com.example.app\n'
i=0
while [ "$i" -lt 20000 ]; do
  printf '  resource 0x%08x string/big%s\n    () "NEEDLE %s"\n' "$((0x7f010000 + i))" "$i" "$i"
  i=$((i + 1))
done"#,
        );
        let apk_path = root.join("base.apk");
        write_zip(&apk_path, &[("resources.arsc", b"fake")]);
        let apks = vec![materialized(apk_path, "base", None)];
        let query = normalize_resource_query("text:NEEDLE").expect("text query");
        let (matches, warnings) =
            query_apk_resources_with_aapt2(&apks, &query, &tool).expect("query resources");
        assert!(warnings.is_empty());
        assert_eq!(matches.len(), 20000);
        assert!(matches.iter().all(|row| row
            .value
            .as_deref()
            .is_some_and(|value| value.starts_with("\"NEEDLE "))));
    }
}
