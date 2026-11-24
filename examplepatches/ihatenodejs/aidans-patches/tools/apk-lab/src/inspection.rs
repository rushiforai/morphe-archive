//! Artifact inspection through the shared process adapter and archive layer.
//!
//! `aapt2 dump badging` supplies manifest metadata, `apksigner verify
//! --print-certs` supplies the signer digest when available, and DEX headers
//! supply class/method counts exactly as the Python oracle parses them.
//! Container validation, split materialization and cleanup are owned by
//! [`crate::archives`]; this module never extracts on its own.
//!
//! A missing build tool is a usage/tool failure (exit 2). A malformed manifest,
//! badging output, unsafe archive or inconsistent split set is an invalid
//! artifact (exit 3). Parsing is byte-bounded and lossy where necessary so
//! hostile input cannot panic the process.

use crate::archives::{self, ArchiveError};
use crate::error::Error;
use crate::models::{AndroidManifestInfo, ArtifactInspection, ContainerType, SplitInfo};
use crate::process::{self, ProcessSpec};
use crate::tools::{default_repo_root, find_build_tools_bin, ToolEnvironment};
use ring::digest::{Context, SHA256};
use std::collections::BTreeSet;
use std::fs::{self, File};
use std::io::Read;
use std::path::{Path, PathBuf};
use std::time::Duration;
use zip::ZipArchive;

/// DEX header bytes needed for class and method counts.
const DEX_HEADER_BYTES: u64 = 0x70;
/// Default bound on one external inspection tool.
pub const DEFAULT_TOOL_TIMEOUT: Duration = Duration::from_secs(120);

/// Injection points for inspection: host tool resolution and tool timeout.
#[derive(Debug, Clone)]
pub struct InspectionOptions {
    pub env: ToolEnvironment,
    pub timeout: Duration,
}

impl InspectionOptions {
    #[must_use]
    pub fn from_process() -> Self {
        Self {
            env: ToolEnvironment::from_process(&default_repo_root()),
            timeout: DEFAULT_TOOL_TIMEOUT,
        }
    }
}

impl Default for InspectionOptions {
    fn default() -> Self {
        Self::from_process()
    }
}

/// Inspects an APK, APKM, XAPK or APKS artifact with process-derived tools.
pub fn inspect_artifact(artifact_path: impl AsRef<Path>) -> Result<ArtifactInspection, Error> {
    let options = InspectionOptions::from_process();
    inspect_artifact_with_options(artifact_path, &options)
}

/// Inspection with explicit host/tool inputs.
pub fn inspect_artifact_with_options(
    artifact_path: impl AsRef<Path>,
    options: &InspectionOptions,
) -> Result<ArtifactInspection, Error> {
    let (inspection, _materialized) =
        inspect_artifact_with_materialization(artifact_path, options)?;
    Ok(inspection)
}

/// Inspection that also returns the split materialization it validated.
///
/// Split containers are extracted once for inspection, and callers that read
/// the same splits afterwards reuse this extraction instead of unpacking the
/// container a second time. The materialized rows already carry the
/// manifest-resolved split names and base flags.
pub fn inspect_artifact_with_materialization(
    artifact_path: impl AsRef<Path>,
    options: &InspectionOptions,
) -> Result<(ArtifactInspection, archives::MaterializedApks), Error> {
    let path = canonical_or_absolute(artifact_path.as_ref());
    if !path.is_file() {
        return Err(Error::usage(format!(
            "Artifact not found: {}",
            path.display()
        )));
    }

    let file_size = fs::metadata(&path)
        .map_err(|error| Error::io(format!("read artifact {}", path.display()), error))?
        .len();
    let file_sha256 = sha256_file(&path)?;

    let safe_report = archives::inspect_safe_zip_path(&path)
        .map_err(|error| archive_error("Security validation failed", error))?;

    if safe_report.container_type == ContainerType::Unknown {
        return Err(Error::invalid_artifact(format!(
            "Unsupported or unrecognized Android container format: {}",
            path.display()
        )));
    }

    if safe_report.container_type == ContainerType::Apk {
        let scan = scan_apk(&path)?;
        let manifest_info = parse_apk_badging(&path, options)?;
        let cert_sha256 = extract_signing_cert_sha256(&path, options);
        let inspection = ArtifactInspection {
            file_path: path.to_string_lossy().into_owned(),
            container_type: ContainerType::Apk,
            file_size,
            sha256: file_sha256,
            package_name: manifest_info.package_name,
            version_name: manifest_info.version_name,
            version_code: manifest_info.version_code,
            min_sdk: manifest_info.min_sdk_version,
            target_sdk: manifest_info.target_sdk_version,
            signing_certificate_sha256: cert_sha256,
            splits: Vec::new(),
            dex_classes_count: scan.classes,
            dex_methods_count: scan.methods,
            dex_files: scan.dex_files,
            native_libraries: scan.native_libraries,
            resources: scan.resources,
            assets: scan.assets,
            warnings: scan.warnings,
        };
        let materialized = archives::materialize_artifact_apks(&path, &[], true)
            .map_err(|error| archive_error("Security validation failed", error))?;
        return Ok((inspection, materialized));
    }

    if safe_report.apk_members.is_empty() {
        return Err(Error::invalid_artifact(format!(
            "Split container {} contains no .apk files",
            path.display()
        )));
    }

    let split_rows: Vec<SplitInfo> = safe_report
        .apk_members
        .iter()
        .map(|member| SplitInfo {
            filename: member.clone(),
            split_name: member_stem(member),
            sha256: String::new(),
            size: 0,
            is_base: false,
        })
        .collect();
    let (mut materialized, split_hashes) =
        archives::materialize_artifact_apks_hashed(&path, &split_rows, false)
            .map_err(|error| archive_error("Security validation failed", error))?;

    let mut inspected = Vec::with_capacity(materialized.as_slice().len());
    let mut base_candidates: Vec<String> = Vec::new();
    let mut common_package: Option<String> = None;
    let mut common_version_code: Option<u64> = None;
    let mut common_signer: Option<String> = None;
    let mut signer_initialized = false;
    let mut total_classes = 0u64;
    let mut total_methods = 0u64;
    let mut all_dex_files = BTreeSet::new();
    let mut all_native_libs = BTreeSet::new();
    let mut all_resources = BTreeSet::new();
    let mut all_assets = BTreeSet::new();
    let mut all_warnings = Vec::new();

    for (row_index, row) in materialized.as_slice().iter().enumerate() {
        let apk_name = row
            .container_member
            .clone()
            .unwrap_or_else(|| row.path.to_string_lossy().into_owned());
        let apk_size = fs::metadata(&row.path)
            .map_err(|error| Error::io(format!("read split {}", row.path.display()), error))?
            .len();
        let apk_sha256 = split_hashes.get(row_index).cloned().ok_or_else(|| {
            Error::invalid_artifact(format!(
                "Missing digest for materialized split {}",
                row.path.display()
            ))
        })?;
        let scan = scan_apk(&row.path)?;
        let manifest_info = parse_apk_badging(&row.path, options)?;
        let cert_sha256 = extract_signing_cert_sha256(&row.path, options);

        if manifest_info.split_name.is_none() {
            base_candidates.push(apk_name.clone());
        }

        total_classes = total_classes.saturating_add(scan.classes);
        total_methods = total_methods.saturating_add(scan.methods);
        for dex in &scan.dex_files {
            all_dex_files.insert(format!("{apk_name}:{dex}"));
        }
        all_native_libs.extend(scan.native_libraries.iter().cloned());
        all_resources.extend(scan.resources.iter().cloned());
        all_assets.extend(scan.assets.iter().cloned());
        all_warnings.extend(scan.warnings.iter().cloned());

        if common_package.is_none() {
            common_package = Some(manifest_info.package_name.clone());
            common_version_code = Some(manifest_info.version_code);
        } else {
            if common_package.as_deref() != Some(manifest_info.package_name.as_str()) {
                return Err(Error::invalid_artifact(format!(
                    "Mismatched package name in split {apk_name}: '{}' != '{}'",
                    manifest_info.package_name,
                    common_package.unwrap_or_default()
                )));
            }
            if common_version_code != Some(manifest_info.version_code) {
                return Err(Error::invalid_artifact(format!(
                    "Mismatched version code in split {apk_name}: {} != {}",
                    manifest_info.version_code,
                    common_version_code.unwrap_or_default()
                )));
            }
        }

        if !signer_initialized {
            common_signer = cert_sha256.clone();
            signer_initialized = true;
        } else if common_signer != cert_sha256 {
            return Err(Error::invalid_artifact(format!(
                "Mismatched signer in split {apk_name}: '{:?}' != '{:?}'",
                cert_sha256, common_signer
            )));
        }

        inspected.push(InspectedSplit {
            apk_name,
            sha256: apk_sha256,
            size: apk_size,
            manifest_info,
        });
    }

    if base_candidates.is_empty() {
        return Err(Error::invalid_artifact(format!(
            "No base APK found in split container {}: all members declare split attributes",
            path.display()
        )));
    }
    if base_candidates.len() > 1 {
        return Err(Error::invalid_artifact(format!(
            "Multiple base APKs found in split container {}: {:?}",
            path.display(),
            base_candidates
        )));
    }
    let base_apk_name = &base_candidates[0];

    let mut base_manifest: Option<AndroidManifestInfo> = None;
    let mut splits_info = Vec::with_capacity(inspected.len());
    for split in inspected {
        let is_base = &split.apk_name == base_apk_name;
        if is_base {
            base_manifest = Some(split.manifest_info.clone());
        }
        let split_name = split
            .manifest_info
            .split_name
            .clone()
            .unwrap_or_else(|| member_stem(&split.apk_name));
        splits_info.push(SplitInfo {
            filename: split.apk_name,
            split_name,
            sha256: split.sha256,
            size: split.size,
            is_base,
        });
    }

    let base_manifest = base_manifest.ok_or_else(|| {
        Error::invalid_artifact(format!("Base APK manifest not found in {}", path.display()))
    })?;

    materialized
        .apply_split_metadata(&splits_info)
        .map_err(|error| archive_error("Security validation failed", error))?;

    let inspection = ArtifactInspection {
        file_path: path.to_string_lossy().into_owned(),
        container_type: safe_report.container_type,
        file_size,
        sha256: file_sha256,
        package_name: base_manifest.package_name,
        version_name: base_manifest.version_name,
        version_code: base_manifest.version_code,
        min_sdk: base_manifest.min_sdk_version,
        target_sdk: base_manifest.target_sdk_version,
        signing_certificate_sha256: common_signer,
        splits: splits_info,
        dex_classes_count: total_classes,
        dex_methods_count: total_methods,
        dex_files: all_dex_files.into_iter().collect(),
        native_libraries: all_native_libs.into_iter().collect(),
        resources: all_resources.into_iter().collect(),
        assets: all_assets.into_iter().collect(),
        warnings: all_warnings,
    };
    Ok((inspection, materialized))
}

struct InspectedSplit {
    apk_name: String,
    sha256: String,
    size: u64,
    manifest_info: AndroidManifestInfo,
}

#[derive(Debug, Clone, Default, PartialEq, Eq)]
struct ApkScan {
    classes: u64,
    methods: u64,
    dex_files: Vec<String>,
    native_libraries: Vec<String>,
    resources: Vec<String>,
    assets: Vec<String>,
    warnings: Vec<String>,
}

fn scan_apk(path: &Path) -> Result<ApkScan, Error> {
    let file = File::open(path)
        .map_err(|error| Error::io(format!("open APK {}", path.display()), error))?;
    let mut archive = ZipArchive::new(file)
        .map_err(|error| Error::invalid_artifact(format!("open APK zip: {error}")))?;
    let names: Vec<String> = archive
        .file_names()
        .filter_map(|result| result.ok())
        .map(|name| name.into_owned())
        .collect();

    let mut scan = ApkScan::default();
    for name in names {
        if name.ends_with(".dex") {
            scan.dex_files.push(name.clone());
            match read_dex_header(&mut archive, &name) {
                Ok(header) => {
                    scan.classes = scan.classes.saturating_add(header.0);
                    scan.methods = scan.methods.saturating_add(header.1);
                }
                Err(message) => scan
                    .warnings
                    .push(format!("Failed to parse DEX header for {name}: {message}")),
            }
        } else if name.starts_with("lib/") && name.ends_with(".so") {
            scan.native_libraries.push(name);
        } else if name.starts_with("res/") {
            scan.resources.push(name);
        } else if name.starts_with("assets/") {
            scan.assets.push(name);
        }
    }

    scan.dex_files.sort();
    scan.native_libraries.sort();
    scan.resources.sort();
    scan.assets.sort();
    Ok(scan)
}

fn read_dex_header(archive: &mut ZipArchive<File>, name: &str) -> Result<(u64, u64), Error> {
    let member = archive
        .by_name(name)
        .map_err(|error| Error::invalid_artifact(format!("read DEX member {name}: {error}")))?;
    let mut header = Vec::with_capacity(DEX_HEADER_BYTES as usize);
    member
        .take(DEX_HEADER_BYTES)
        .read_to_end(&mut header)
        .map_err(|error| Error::invalid_artifact(format!("read DEX member {name}: {error}")))?;
    Ok(parse_dex_header(&header))
}

/// Parses class and method counts from a DEX header. Malformed input yields
/// `(0, 0)`, matching the Python `parse_dex_header`.
#[must_use]
pub fn parse_dex_header(dex_bytes: &[u8]) -> (u64, u64) {
    if dex_bytes.len() < 0x70 {
        return (0, 0);
    }
    let magic = &dex_bytes[..8];
    if !magic.starts_with(b"dex\n") && !magic.starts_with(b"cdex") {
        return (0, 0);
    }
    let method_count = u32::from_le_bytes([
        dex_bytes[0x58],
        dex_bytes[0x59],
        dex_bytes[0x5a],
        dex_bytes[0x5b],
    ]);
    let class_count = u32::from_le_bytes([
        dex_bytes[0x60],
        dex_bytes[0x61],
        dex_bytes[0x62],
        dex_bytes[0x63],
    ]);
    (u64::from(class_count), u64::from(method_count))
}

fn parse_apk_badging(
    apk_path: &Path,
    options: &InspectionOptions,
) -> Result<AndroidManifestInfo, Error> {
    let aapt2 = find_build_tools_bin(&options.env, "aapt2")?;
    let spec = ProcessSpec::new(aapt2)
        .args([
            "dump".to_string(),
            "badging".to_string(),
            apk_path.to_string_lossy().into_owned(),
        ])
        .timeout(options.timeout);
    let output = process::run(&spec)?;
    if output.timed_out {
        return Err(Error::usage(format!(
            "aapt2 dump badging timed out for {}",
            apk_path.display()
        )));
    }
    if !output.status.success() {
        return Err(Error::invalid_artifact(format!(
            "Failed to dump APK badging with aapt2: {}",
            truncate_chars(&output.stderr.text_lossy(), 300)
        )));
    }
    parse_badging_text(&output.stdout.text_lossy())
        .map_err(|message| Error::invalid_artifact(format!("{message}: {}", apk_path.display())))
}

/// Parses `aapt2 dump badging` text without panicking on arbitrary bytes.
pub fn parse_badging_text(output: &str) -> Result<AndroidManifestInfo, String> {
    let package_line = output
        .lines()
        .find(|line| line.starts_with("package:"))
        .unwrap_or("");
    let package_name = find_quoted_attr(package_line, "name")
        .ok_or_else(|| "Could not parse package name from aapt2 badging output".to_string())?;
    let version_code = find_quoted_attr(package_line, "versionCode")
        .and_then(|value| value.parse::<u64>().ok())
        .unwrap_or(0);
    let version_name = find_quoted_attr(package_line, "versionName").unwrap_or_default();
    let split_name = find_quoted_attr(package_line, "split");
    let min_sdk = quoted_number(output, "minSdkVersion:'");
    let target_sdk = quoted_number(output, "targetSdkVersion:'");
    let permissions = parse_permissions(output);

    Ok(AndroidManifestInfo {
        package_name,
        version_code,
        version_name,
        min_sdk_version: min_sdk,
        target_sdk_version: target_sdk,
        permissions,
        components: Vec::new(),
        split_name,
    })
}

fn find_quoted_attr(line: &str, key: &str) -> Option<String> {
    let bytes = line.as_bytes();
    let mut search_from = 0;
    while let Some(relative) = line[search_from..].find(key) {
        let index = search_from + relative;
        let before_ok = index == 0 || !is_word_byte(bytes[index - 1]);
        let after_key = index + key.len();
        if before_ok && line[after_key..].starts_with("='") {
            let rest = &line[after_key + 2..];
            if let Some(end) = rest.find('\'') {
                return Some(rest[..end].to_string());
            }
        }
        search_from = after_key;
    }
    None
}

fn is_word_byte(byte: u8) -> bool {
    byte.is_ascii_alphanumeric() || byte == b'_'
}

fn quoted_number(output: &str, marker: &str) -> Option<u32> {
    let index = output.find(marker)?;
    let rest = &output[index + marker.len()..];
    let digits: String = rest.chars().take_while(char::is_ascii_digit).collect();
    if digits.is_empty() {
        None
    } else {
        digits.parse().ok()
    }
}

fn parse_permissions(output: &str) -> Vec<String> {
    let mut permissions = BTreeSet::new();
    let mut rest = output;
    while let Some(index) = rest.find("uses-permission:") {
        let after = &rest[index + "uses-permission:".len()..];
        if after.starts_with(char::is_whitespace) {
            let trimmed = after.trim_start();
            if let Some(value) = trimmed.strip_prefix("name='") {
                if let Some(end) = value.find('\'') {
                    permissions.insert(value[..end].to_string());
                }
            }
        }
        rest = after;
    }
    permissions.into_iter().collect()
}

fn extract_signing_cert_sha256(apk_path: &Path, options: &InspectionOptions) -> Option<String> {
    let apksigner = find_build_tools_bin(&options.env, "apksigner").ok()?;
    let spec = ProcessSpec::new(apksigner)
        .args([
            "verify".to_string(),
            "--print-certs".to_string(),
            apk_path.to_string_lossy().into_owned(),
        ])
        .timeout(options.timeout);
    let output = process::run(&spec).ok()?;
    let combined = format!(
        "{}\n{}",
        output.stdout.text_lossy(),
        output.stderr.text_lossy()
    );
    parse_signer_sha256(&combined)
}

/// Extracts a signer SHA-256 digest from `apksigner verify --print-certs`.
/// The signer-specific line wins; a generic certificate line is the fallback.
#[must_use]
pub fn parse_signer_sha256(text: &str) -> Option<String> {
    digest_after(text, "Signer #1 certificate SHA-256 digest:")
        .or_else(|| digest_after(text, "certificate SHA-256 digest:"))
}

fn digest_after(text: &str, marker: &str) -> Option<String> {
    let index = text.find(marker)?;
    let rest = text[index + marker.len()..].trim_start();
    let digest: String = rest.chars().take(64).collect();
    if digest.len() == 64 && digest.bytes().all(|byte| byte.is_ascii_hexdigit()) {
        Some(digest.to_ascii_lowercase())
    } else {
        None
    }
}

fn member_stem(member: &str) -> String {
    Path::new(member)
        .file_stem()
        .map(|stem| stem.to_string_lossy().into_owned())
        .unwrap_or_else(|| member.to_string())
}

fn archive_error(context: &str, error: ArchiveError) -> Error {
    match error {
        ArchiveError::Io { context, kind } => Error::Io { context, kind },
        other => Error::invalid_artifact(format!("{context}: {other}")),
    }
}

fn sha256_file(path: &Path) -> Result<String, Error> {
    let mut file = File::open(path)
        .map_err(|error| Error::io(format!("read artifact {}", path.display()), error))?;
    let mut hasher = Context::new(&SHA256);
    let mut buffer = [0u8; 64 * 1024];
    loop {
        let read = file
            .read(&mut buffer)
            .map_err(|error| Error::io(format!("read artifact {}", path.display()), error))?;
        if read == 0 {
            break;
        }
        hasher.update(&buffer[..read]);
    }
    Ok(archives::sha256_digest_hex(&hasher.finish()))
}

fn canonical_or_absolute(path: &Path) -> PathBuf {
    fs::canonicalize(path)
        .unwrap_or_else(|_| std::path::absolute(path).unwrap_or_else(|_| path.to_path_buf()))
}

fn truncate_chars(text: &str, limit: usize) -> String {
    text.chars().take(limit).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn dex_header_counts_match_python_offsets() {
        let mut data = vec![0u8; 0x80];
        data[..8].copy_from_slice(b"dex\n035\0");
        data[0x58..0x5c].copy_from_slice(&42u32.to_le_bytes());
        data[0x60..0x64].copy_from_slice(&15u32.to_le_bytes());
        assert_eq!(parse_dex_header(&data), (15, 42));
        data[..8].copy_from_slice(b"not_dex!");
        assert_eq!(parse_dex_header(&data), (0, 0));
        assert_eq!(parse_dex_header(&data[..0x10]), (0, 0));
    }

    #[test]
    fn badging_parser_handles_base_split_and_unicode() {
        let base = concat!(
            "package: name='com.example.app' versionCode='100' versionName='1.0-\u{394}' compileSdkVersion='34'\n",
            "sdkVersion:'21'\n",
            "targetSdkVersion:'34'\n",
            "uses-permission: name='android.permission.INTERNET'\n"
        );
        let info = parse_badging_text(base).expect("base badging");
        assert_eq!(info.package_name, "com.example.app");
        assert_eq!(info.version_code, 100);
        assert_eq!(info.version_name, "1.0-\u{394}");
        assert_eq!(info.min_sdk_version, None);
        assert_eq!(info.target_sdk_version, Some(34));
        assert_eq!(info.permissions, ["android.permission.INTERNET"]);
        assert_eq!(info.split_name, None);

        let split = "package: name='com.example.app' versionCode='100' versionName='1.0' split='config.arm64_v8a'\n";
        let info = parse_badging_text(split).expect("split badging");
        assert_eq!(info.split_name.as_deref(), Some("config.arm64_v8a"));
        assert!(parse_badging_text("no package here").is_err());
    }

    #[test]
    fn signer_digest_parsing_is_case_insensitive_and_bounded() {
        let upper = format!(
            "Signer #1 certificate SHA-256 digest: {}\n",
            "AB".repeat(32)
        );
        assert_eq!(parse_signer_sha256(&upper), Some("ab".repeat(32)));
        let fallback = format!("certificate SHA-256 digest: {}\n", "cd".repeat(32));
        assert_eq!(parse_signer_sha256(&fallback), Some("cd".repeat(32)));
        assert_eq!(parse_signer_sha256("certificate SHA-256 digest: abc"), None);
    }
}
