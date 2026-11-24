//! Validated archive traversal and split materialization.
//!
//! Every archive reader goes through [`inspect_safe_zip_path`] (or the reader
//! form) before extraction. Validation is metadata-only: entry count, declared
//! sizes, compression ratio, encryption, symlinks, duplicate normalized names,
//! absolute or traversing components, NUL bytes and unsupported compression
//! methods are all rejected before a byte is written.
//!
//! Extraction never builds a full in-memory artifact. Members are streamed
//! through a fixed 64 KiB buffer, destination directories are created one
//! component at a time while refusing symlinked ancestors, and temporary
//! materializations are owned by [`MaterializedApks`] so they disappear on
//! drop or on an extraction error.

use crate::error::Error as CrateError;
use crate::models::{ContainerType, MemberInfo, SplitInfo};
use ring::digest::{Context, Digest, SHA256};
use std::collections::{HashMap, HashSet};
use std::fmt;
use std::fs::{self, File, OpenOptions};
use std::io::{self, Read, Seek, Write};
use std::path::{Path, PathBuf};
use tempfile::TempDir;
use zip::{CompressionMethod, ZipArchive};

/// Maximum member count, matching the Python oracle's `DEFAULT_MAX_ENTRIES`.
pub const DEFAULT_MAX_ENTRIES: usize = 100_000;
/// Maximum total expanded bytes, matching `DEFAULT_MAX_EXPANDED_BYTES`.
pub const DEFAULT_MAX_EXPANDED_BYTES: u64 = 4 * 1024 * 1024 * 1024;
/// Maximum per-member compression ratio, matching `DEFAULT_MAX_RATIO`.
pub const DEFAULT_MAX_RATIO: f64 = 100.0;
/// Ratio checks only apply above this uncompressed size (strictly greater).
pub const RATIO_MIN_UNCOMPRESSED_BYTES: u64 = 1024 * 1024;
/// Fixed streaming buffer size; no archive is ever buffered whole.
pub const STREAM_BUFFER_BYTES: usize = 64 * 1024;

/// Typed archive failures. Security and corruption failures map to the
/// artifact-invalid exit class; I/O failures keep their kind for the caller.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum ArchiveError {
    /// The file is not a readable ZIP archive.
    Corrupt(String),
    /// A structural or safety invariant was violated.
    Security(String),
    /// The archive uses a compression method this host does not support.
    Unsupported(String),
    /// A filesystem boundary failed.
    Io {
        context: String,
        kind: io::ErrorKind,
    },
}

impl ArchiveError {
    fn security(message: impl Into<String>) -> Self {
        Self::Security(message.into())
    }

    fn corrupt(message: impl Into<String>) -> Self {
        Self::Corrupt(message.into())
    }

    fn io(context: impl Into<String>, error: io::Error) -> Self {
        Self::Io {
            context: context.into(),
            kind: error.kind(),
        }
    }

    /// Human-readable diagnostic used by callers that format errors.
    #[must_use]
    pub fn message(&self) -> String {
        match self {
            Self::Corrupt(message) | Self::Security(message) | Self::Unsupported(message) => {
                message.clone()
            }
            Self::Io { context, kind } => format!("{context}: {kind:?}"),
        }
    }
}

impl fmt::Display for ArchiveError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(&self.message())
    }
}

impl std::error::Error for ArchiveError {}

impl From<ArchiveError> for CrateError {
    fn from(error: ArchiveError) -> Self {
        match error {
            ArchiveError::Io { context, kind } => CrateError::Io { context, kind },
            other => CrateError::invalid_artifact(other.message()),
        }
    }
}

/// Safety limits applied before extraction.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct ArchiveLimits {
    pub max_entries: usize,
    pub max_expanded_bytes: u64,
    pub max_ratio: f64,
}

impl Default for ArchiveLimits {
    fn default() -> Self {
        Self {
            max_entries: DEFAULT_MAX_ENTRIES,
            max_expanded_bytes: DEFAULT_MAX_EXPANDED_BYTES,
            max_ratio: DEFAULT_MAX_RATIO,
        }
    }
}

/// Metadata-only report mirroring the Python oracle shape.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SafeArchiveReport {
    pub container_type: ContainerType,
    pub entry_count: usize,
    pub total_uncompressed_bytes: u64,
    pub total_compressed_bytes: u64,
    pub members: Vec<MemberInfo>,
    pub apk_members: Vec<String>,
}

/// A member name decomposed into safe relative path segments.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ValidatedMemberName {
    /// The name exactly as stored in the archive.
    pub original: String,
    /// Forward-slash joined normalized path used for duplicate detection.
    pub normalized: String,
    /// Normalized components, never empty, `.` or `..`.
    pub segments: Vec<String>,
}

/// Enforces the entry-count limit. Exactly `max_entries` is allowed.
pub fn validate_entry_count(count: usize, max_entries: usize) -> Result<(), ArchiveError> {
    if count > max_entries {
        return Err(ArchiveError::security(format!(
            "Archive contains {count} entries, exceeding limit of {max_entries}"
        )));
    }
    Ok(())
}

/// Accumulates an expanded size with overflow checking and the total limit.
pub fn accumulate_expanded(
    total: u64,
    entry_size: u64,
    max_expanded_bytes: u64,
) -> Result<u64, ArchiveError> {
    let Some(updated) = total.checked_add(entry_size) else {
        return Err(ArchiveError::security(
            "Uncompressed size arithmetic overflow",
        ));
    };
    if updated > max_expanded_bytes {
        return Err(ArchiveError::security(format!(
            "Uncompressed size exceeds limit of {max_expanded_bytes} bytes"
        )));
    }
    Ok(updated)
}

/// Applies the per-member compression-ratio rule.
///
/// The rule matches the Python oracle: only entries strictly larger than
/// 1 MiB and only when the compressed size is positive are checked, and a
/// ratio of exactly `max_ratio` is allowed.
pub fn validate_ratio(
    member: &str,
    file_size: u64,
    compressed_size: u64,
    max_ratio: f64,
) -> Result<(), ArchiveError> {
    if compressed_size == 0 || file_size <= RATIO_MIN_UNCOMPRESSED_BYTES {
        return Ok(());
    }
    let ratio = file_size as f64 / compressed_size as f64;
    if ratio > max_ratio {
        return Err(ArchiveError::security(format!(
            "Zip bomb detected: entry {member} has compression ratio {ratio:.1}:1"
        )));
    }
    Ok(())
}

/// Returns whether this build can decompress `method`.
#[must_use]
pub fn compression_supported(method: CompressionMethod) -> bool {
    matches!(
        method,
        CompressionMethod::Stored
            | CompressionMethod::Deflated
            | CompressionMethod::Bzip2
            | CompressionMethod::Lzma
    )
}

/// Validates untrusted member names without touching the filesystem.
///
/// Backslashes are treated as separators for validation so `..\\escape` cannot
/// sneak through on a host that treats them literally. Empty components,
/// `.`/`..` components, absolute paths, drive prefixes and NUL bytes are
/// rejected. A single trailing separator is allowed for directory entries.
pub fn validate_member_name(
    name: &str,
    _is_dir: bool,
) -> Result<ValidatedMemberName, ArchiveError> {
    if name.contains('\0') {
        return Err(ArchiveError::security(format!(
            "NUL byte in archive entry name: {name:?}"
        )));
    }
    if name.starts_with('/') || name.starts_with('\\') {
        return Err(ArchiveError::security(format!(
            "Absolute path in archive entry: {name}"
        )));
    }

    let mut working = name.replace('\\', "/");
    if working.ends_with('/') {
        working.pop();
    }
    if working.is_empty() {
        return Err(ArchiveError::security(
            "Empty path in archive entry".to_string(),
        ));
    }

    let mut segments = Vec::new();
    for (index, component) in working.split('/').enumerate() {
        if component.is_empty() {
            return Err(ArchiveError::security(format!(
                "Empty path component in archive entry: {name}"
            )));
        }
        if component == "." {
            continue;
        }
        if component == ".." {
            return Err(ArchiveError::security(format!(
                "Path traversal detected in archive entry: {name}"
            )));
        }
        if index == 0 && is_windows_drive_prefix(component) {
            return Err(ArchiveError::security(format!(
                "Absolute path in archive entry: {name}"
            )));
        }
        segments.push(component.to_string());
    }

    if segments.is_empty() {
        return Err(ArchiveError::security(format!(
            "Empty path in archive entry: {name}"
        )));
    }

    Ok(ValidatedMemberName {
        original: name.to_string(),
        normalized: segments.join("/"),
        segments,
    })
}

fn is_windows_drive_prefix(component: &str) -> bool {
    let bytes = component.as_bytes();
    bytes.len() >= 2 && bytes[0].is_ascii_alphabetic() && bytes[1] == b':'
}

struct EntryMeta {
    name: String,
    size: u64,
    compressed_size: u64,
    crc: u32,
    is_dir: bool,
    is_symlink: bool,
    encrypted: bool,
    compression: CompressionMethod,
}

fn read_entry_meta<R: Read + Seek>(
    archive: &ZipArchive<R>,
    index: usize,
) -> Result<EntryMeta, ArchiveError> {
    let entry = archive
        .by_index_data(index)
        .map_err(|error| map_zip_error("read archive entry metadata", error))?;
    if entry.name_raw().contains(&0) {
        return Err(ArchiveError::security(
            "NUL byte in archive entry name".to_string(),
        ));
    }
    let name = entry
        .name()
        .map_err(|error| map_zip_error("decode archive entry name", error))?
        .into_owned();
    Ok(EntryMeta {
        name,
        size: entry.size(),
        compressed_size: entry.compressed_size(),
        crc: entry.crc32(),
        is_dir: entry.is_dir(),
        is_symlink: entry.is_symlink(),
        encrypted: entry.encrypted(),
        compression: entry.compression(),
    })
}

fn map_zip_error(context: &str, error: zip::result::ZipError) -> ArchiveError {
    match error {
        zip::result::ZipError::Io(error) => ArchiveError::io(context, error),
        zip::result::ZipError::UnsupportedArchive(message) => {
            ArchiveError::Unsupported(format!("{context}: {message}"))
        }
        other => ArchiveError::corrupt(format!("{context}: {other}")),
    }
}

/// Inspects a ZIP archive at `path` with the default limits.
pub fn inspect_safe_zip_path(path: impl AsRef<Path>) -> Result<SafeArchiveReport, ArchiveError> {
    inspect_safe_zip_path_with_limits(path, ArchiveLimits::default())
}

/// Inspects a ZIP archive at `path` with explicit limits.
pub fn inspect_safe_zip_path_with_limits(
    path: impl AsRef<Path>,
    limits: ArchiveLimits,
) -> Result<SafeArchiveReport, ArchiveError> {
    let path = path.as_ref();
    let file = File::open(path)
        .map_err(|error| ArchiveError::io(format!("open archive {}", path.display()), error))?;
    inspect_safe_zip(file, limits)
}

/// Inspects a seekable ZIP stream. No member data is decompressed.
pub fn inspect_safe_zip<R: Read + Seek>(
    reader: R,
    limits: ArchiveLimits,
) -> Result<SafeArchiveReport, ArchiveError> {
    let archive =
        ZipArchive::new(reader).map_err(|error| map_zip_error("open zip archive", error))?;
    if archive.has_duplicate_names() {
        return Err(ArchiveError::security(
            "Duplicate entry in archive".to_string(),
        ));
    }

    let entry_count = archive.len();
    validate_entry_count(entry_count, limits.max_entries)?;

    let mut seen_names: HashSet<String> = HashSet::new();
    let mut total_uncompressed = 0u64;
    let mut total_compressed = 0u64;
    let mut members = Vec::with_capacity(entry_count);
    let mut apk_members = Vec::new();
    let mut has_android_manifest = false;
    let mut has_toc_pb = false;
    let mut has_xapk_manifest = false;
    let mut has_info_json = false;

    for index in 0..entry_count {
        let meta = read_entry_meta(&archive, index)?;
        let validated = validate_member_name(&meta.name, meta.is_dir)?;
        if !seen_names.insert(validated.normalized) {
            return Err(ArchiveError::security(format!(
                "Duplicate entry in archive: {}",
                meta.name
            )));
        }

        if meta.encrypted {
            return Err(ArchiveError::security(format!(
                "Encrypted entry detected: {}",
                meta.name
            )));
        }
        if meta.is_symlink {
            return Err(ArchiveError::security(format!(
                "Symlink entry detected in archive: {}",
                meta.name
            )));
        }
        if meta.is_dir {
            continue;
        }
        if !compression_supported(meta.compression) {
            return Err(ArchiveError::Unsupported(format!(
                "Unsupported compression method {:?} for entry {}",
                meta.compression, meta.name
            )));
        }

        total_uncompressed =
            accumulate_expanded(total_uncompressed, meta.size, limits.max_expanded_bytes)?;
        total_compressed = total_compressed
            .checked_add(meta.compressed_size)
            .ok_or_else(|| {
                ArchiveError::security("Compressed size arithmetic overflow".to_string())
            })?;
        validate_ratio(
            &meta.name,
            meta.size,
            meta.compressed_size,
            limits.max_ratio,
        )?;

        if meta.name == "AndroidManifest.xml" {
            has_android_manifest = true;
        } else if meta.name == "toc.pb" {
            has_toc_pb = true;
        } else if meta.name == "manifest.json" {
            has_xapk_manifest = true;
        } else if meta.name == "info.json" {
            has_info_json = true;
        } else if meta.name.ends_with(".apk") {
            apk_members.push(meta.name.clone());
        }

        members.push(MemberInfo {
            name: meta.name,
            size: meta.size,
            compressed_size: meta.compressed_size,
            crc: meta.crc,
            sha256: String::new(),
        });
    }

    let container_type = if has_toc_pb {
        ContainerType::Apks
    } else if has_xapk_manifest {
        ContainerType::Xapk
    } else if has_android_manifest {
        // An APK that carries a nested APK asset remains an APK.
        ContainerType::Apk
    } else if has_info_json || !apk_members.is_empty() {
        ContainerType::Apkm
    } else {
        ContainerType::Unknown
    };

    apk_members.sort();
    Ok(SafeArchiveReport {
        container_type,
        entry_count,
        total_uncompressed_bytes: total_uncompressed,
        total_compressed_bytes: total_compressed,
        members,
        apk_members,
    })
}

/// Streams a member's uncompressed bytes into a SHA-256 digest.
pub fn compute_zip_member_sha256(
    archive_path: impl AsRef<Path>,
    member_name: &str,
) -> Result<String, ArchiveError> {
    let path = archive_path.as_ref();
    let file = File::open(path)
        .map_err(|error| ArchiveError::io(format!("open archive {}", path.display()), error))?;
    let mut archive =
        ZipArchive::new(file).map_err(|error| map_zip_error("open zip archive", error))?;
    validate_member_name(member_name, false)?;
    let mut member = archive
        .by_name(member_name)
        .map_err(|error| map_zip_error("open archive member", error))?;
    let mut hasher = Context::new(&SHA256);
    let mut buffer = [0u8; STREAM_BUFFER_BYTES];
    loop {
        let read = member
            .read(&mut buffer)
            .map_err(|error| ArchiveError::io("read archive member", error))?;
        if read == 0 {
            break;
        }
        hasher.update(&buffer[..read]);
    }
    Ok(sha256_digest_hex(&hasher.finish()))
}

/// Lowercase hexadecimal SHA-256 digest, matching Python `hexdigest()`.
pub(crate) fn sha256_digest_hex(digest: &Digest) -> String {
    const HEX: &[u8; 16] = b"0123456789abcdef";
    let bytes = digest.as_ref();
    let mut hex = String::with_capacity(bytes.len() * 2);
    for byte in bytes {
        hex.push(char::from(HEX[usize::from(byte >> 4)]));
        hex.push(char::from(HEX[usize::from(byte & 0x0f)]));
    }
    hex
}

/// Resolves a temporary extraction root for materialization.
#[derive(Debug)]
pub struct MaterializedApks {
    apks: Vec<MaterializedApk>,
    temp_dir: Option<TempDir>,
}

impl MaterializedApks {
    /// Deterministic materialized rows.
    #[must_use]
    pub fn as_slice(&self) -> &[MaterializedApk] {
        &self.apks
    }

    /// The temporary root when a container was extracted; `None` for a plain
    /// APK whose path is returned directly.
    #[must_use]
    pub fn temp_root(&self) -> Option<&Path> {
        self.temp_dir.as_ref().map(TempDir::path)
    }

    /// Applies manifest-resolved split names and base flags to rows extracted
    /// under provisional names.
    ///
    /// Inspection first extracts members using file-stem split names so the
    /// splits can be read; once `aapt2` reports each member's declared split it
    /// retargets the same extraction instead of extracting a second time.
    pub fn apply_split_metadata(&mut self, splits: &[SplitInfo]) -> Result<(), ArchiveError> {
        let mut metadata: HashMap<&str, (&str, bool)> = HashMap::with_capacity(splits.len());
        for split in splits {
            metadata.insert(
                split.filename.as_str(),
                (split.split_name.as_str(), split.is_base),
            );
        }
        for apk in &mut self.apks {
            let Some(member) = apk.container_member.as_deref() else {
                continue;
            };
            let Some((split_name, is_base)) = metadata.get(member) else {
                return Err(ArchiveError::corrupt(format!(
                    "Materialized member {member} has no split metadata"
                )));
            };
            apk.split_name = (*split_name).to_string();
            apk.is_base = *is_base;
        }
        Ok(())
    }
}

/// One split (or the plain APK) ready for a reader.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MaterializedApk {
    pub path: PathBuf,
    pub container_member: Option<String>,
    pub split_name: String,
    pub is_base: bool,
}

/// Materializes a split container into an RAII temporary directory.
///
/// A plain APK is returned directly. Containers are fully inspected first;
/// splits are ordered lexicographically by member name and exactly one row is
/// marked as base (explicit `is_base` first, then `split_name == "base"`, then
/// `base.apk`, then the first member).
pub fn materialize_artifact_apks(
    artifact_path: impl AsRef<Path>,
    splits: &[SplitInfo],
    is_plain_apk: bool,
) -> Result<MaterializedApks, ArchiveError> {
    materialize_artifact_apks_with_limits(
        artifact_path,
        splits,
        is_plain_apk,
        ArchiveLimits::default(),
    )
}

/// Materializes a split container and hashes each extracted member while it is
/// streamed to disk.
///
/// The returned digest vector is aligned with [`MaterializedApks::as_slice`]
/// and is empty for a plain APK (whose hash callers already hold). This removes
/// a second full read of every split during inspection.
pub fn materialize_artifact_apks_hashed(
    artifact_path: impl AsRef<Path>,
    splits: &[SplitInfo],
    is_plain_apk: bool,
) -> Result<(MaterializedApks, Vec<String>), ArchiveError> {
    materialize_impl(
        artifact_path,
        splits,
        is_plain_apk,
        ArchiveLimits::default(),
        true,
    )
}

/// Materialization with explicit safety limits.
pub fn materialize_artifact_apks_with_limits(
    artifact_path: impl AsRef<Path>,
    splits: &[SplitInfo],
    is_plain_apk: bool,
    limits: ArchiveLimits,
) -> Result<MaterializedApks, ArchiveError> {
    Ok(materialize_impl(artifact_path, splits, is_plain_apk, limits, false)?.0)
}

fn materialize_impl(
    artifact_path: impl AsRef<Path>,
    splits: &[SplitInfo],
    is_plain_apk: bool,
    limits: ArchiveLimits,
    hash_members: bool,
) -> Result<(MaterializedApks, Vec<String>), ArchiveError> {
    let path = artifact_path.as_ref();
    let resolved = resolve_existing_path(path);
    if is_plain_apk || splits.is_empty() {
        return Ok((
            MaterializedApks {
                apks: vec![MaterializedApk {
                    path: resolved,
                    container_member: None,
                    split_name: "base".to_string(),
                    is_base: true,
                }],
                temp_dir: None,
            },
            Vec::new(),
        ));
    }

    // Validate the whole container before creating a single file.
    inspect_safe_zip_path_with_limits(&resolved, limits)?;

    let mut ordered: Vec<&SplitInfo> = splits.iter().collect();
    ordered.sort_by(|left, right| left.filename.cmp(&right.filename));
    let mut seen_filenames = HashSet::new();
    for split in &ordered {
        if !seen_filenames.insert(split.filename.as_str()) {
            return Err(ArchiveError::security(format!(
                "Duplicate split member: {}",
                split.filename
            )));
        }
        validate_member_name(&split.filename, false)?;
    }

    let base_index = select_base_index(&ordered);

    let temp_dir = TempDir::new()
        .map_err(|error| ArchiveError::io("create materialization directory", error))?;
    let root = fs::canonicalize(temp_dir.path())
        .map_err(|error| ArchiveError::io("resolve materialization directory", error))?;

    let file = File::open(&resolved)
        .map_err(|error| ArchiveError::io(format!("open archive {}", resolved.display()), error))?;
    let mut archive =
        ZipArchive::new(file).map_err(|error| map_zip_error("open zip archive", error))?;

    let mut apks = Vec::with_capacity(ordered.len());
    let mut hashes = if hash_members {
        Vec::with_capacity(ordered.len())
    } else {
        Vec::new()
    };
    for (position, split) in ordered.iter().enumerate() {
        let index = archive.index_for_name(&split.filename).ok_or_else(|| {
            ArchiveError::corrupt(format!(
                "Split member {} not found in archive",
                split.filename
            ))
        })?;
        let meta = read_entry_meta(&archive, index)?;
        if meta.is_dir || meta.is_symlink || meta.encrypted {
            return Err(ArchiveError::security(format!(
                "Split member {} is not a regular file",
                split.filename
            )));
        }
        let validated = validate_member_name(&meta.name, false)?;
        let destination = resolve_destination(&root, &validated.segments)?;
        let mut source = archive
            .by_index(index)
            .map_err(|error| map_zip_error("open split member", error))?;
        if hash_members {
            hashes.push(stream_to_new_file_hashed(&mut source, &destination)?);
        } else {
            stream_to_new_file(&mut source, &destination)?;
        }
        apks.push(MaterializedApk {
            path: destination,
            container_member: Some(split.filename.clone()),
            split_name: split.split_name.clone(),
            is_base: position == base_index,
        });
    }

    Ok((
        MaterializedApks {
            apks,
            temp_dir: Some(temp_dir),
        },
        hashes,
    ))
}

fn select_base_index(ordered: &[&SplitInfo]) -> usize {
    if let Some(index) = ordered.iter().position(|split| split.is_base) {
        return index;
    }
    if let Some(index) = ordered.iter().position(|split| split.split_name == "base") {
        return index;
    }
    if let Some(index) = ordered
        .iter()
        .position(|split| split.filename == "base.apk" || split.filename.ends_with("/base.apk"))
    {
        return index;
    }
    0
}

/// Safely extracts every non-directory member into `dest_dir`.
pub fn safe_extract_all(
    archive_path: impl AsRef<Path>,
    dest_dir: impl AsRef<Path>,
) -> Result<Vec<PathBuf>, ArchiveError> {
    safe_extract_all_with_limits(archive_path, dest_dir, ArchiveLimits::default())
}

/// `safe_extract_all` with explicit limits.
pub fn safe_extract_all_with_limits(
    archive_path: impl AsRef<Path>,
    dest_dir: impl AsRef<Path>,
    limits: ArchiveLimits,
) -> Result<Vec<PathBuf>, ArchiveError> {
    let archive_path = archive_path.as_ref();
    inspect_safe_zip_path_with_limits(archive_path, limits)?;

    let dest_dir = dest_dir.as_ref();
    fs::create_dir_all(dest_dir).map_err(|error| {
        ArchiveError::io(format!("create destination {}", dest_dir.display()), error)
    })?;
    let root = fs::canonicalize(dest_dir).map_err(|error| {
        ArchiveError::io(format!("resolve destination {}", dest_dir.display()), error)
    })?;

    let file = File::open(archive_path).map_err(|error| {
        ArchiveError::io(format!("open archive {}", archive_path.display()), error)
    })?;
    let mut archive =
        ZipArchive::new(file).map_err(|error| map_zip_error("open zip archive", error))?;
    let mut extracted = Vec::new();
    for index in 0..archive.len() {
        let meta = read_entry_meta(&archive, index)?;
        let validated = validate_member_name(&meta.name, meta.is_dir)?;
        if meta.is_dir {
            ensure_directory(&root, &validated.segments)?;
            continue;
        }
        let destination = resolve_destination(&root, &validated.segments)?;
        let mut source = archive
            .by_index(index)
            .map_err(|error| map_zip_error("open archive member", error))?;
        stream_to_new_file(&mut source, &destination)?;
        extracted.push(destination);
    }
    Ok(extracted)
}

/// Safely extracts a single member into an explicit destination path.
///
/// The parent directory is created without following symlinks. Existing
/// destinations are refused so callers never overwrite an unrelated file.
pub fn safe_extract_member(
    archive_path: impl AsRef<Path>,
    member_name: &str,
    dest_path: impl AsRef<Path>,
) -> Result<PathBuf, ArchiveError> {
    let archive_path = archive_path.as_ref();
    validate_member_name(member_name, false)?;
    inspect_safe_zip_path(archive_path)?;

    let destination = resolve_new_path(dest_path.as_ref())?;
    if let Some(parent) = destination.parent() {
        fs::create_dir_all(parent).map_err(|error| {
            ArchiveError::io(format!("create destination {}", parent.display()), error)
        })?;
    }
    if fs::symlink_metadata(&destination).is_ok() {
        return Err(ArchiveError::security(format!(
            "Extraction path already exists: {}",
            destination.display()
        )));
    }

    let file = File::open(archive_path).map_err(|error| {
        ArchiveError::io(format!("open archive {}", archive_path.display()), error)
    })?;
    let mut archive =
        ZipArchive::new(file).map_err(|error| map_zip_error("open zip archive", error))?;
    let mut source = archive
        .by_name(member_name)
        .map_err(|error| map_zip_error("open archive member", error))?;
    let mut target = OpenOptions::new()
        .write(true)
        .create_new(true)
        .open(&destination)
        .map_err(|error| {
            ArchiveError::io(
                format!("create extraction target {}", destination.display()),
                error,
            )
        })?;
    copy_bounded(&mut source, &mut target).inspect_err(|_| {
        let _ = fs::remove_file(&destination);
    })?;
    Ok(destination)
}

fn copy_bounded<R: Read, W: Write>(source: &mut R, target: &mut W) -> Result<u64, ArchiveError> {
    copy_bounded_hashed(source, target, None)
}

fn copy_bounded_hashed<R: Read, W: Write>(
    source: &mut R,
    target: &mut W,
    mut hasher: Option<&mut Context>,
) -> Result<u64, ArchiveError> {
    let mut buffer = [0u8; STREAM_BUFFER_BYTES];
    let mut written = 0u64;
    loop {
        let read = source
            .read(&mut buffer)
            .map_err(|error| ArchiveError::io("read archive member", error))?;
        if read == 0 {
            break;
        }
        if let Some(digest) = hasher.as_deref_mut() {
            digest.update(&buffer[..read]);
        }
        target
            .write_all(&buffer[..read])
            .map_err(|error| ArchiveError::io("write extracted member", error))?;
        written += read as u64;
    }
    target
        .flush()
        .map_err(|error| ArchiveError::io("flush extracted member", error))?;
    Ok(written)
}

fn stream_to_new_file<R: Read>(source: &mut R, destination: &Path) -> Result<(), ArchiveError> {
    let mut target = create_extraction_target(destination)?;
    copy_bounded(source, &mut target).inspect_err(|_| {
        let _ = fs::remove_file(destination);
    })?;
    Ok(())
}

fn stream_to_new_file_hashed<R: Read>(
    source: &mut R,
    destination: &Path,
) -> Result<String, ArchiveError> {
    let mut target = create_extraction_target(destination)?;
    let mut hasher = Context::new(&SHA256);
    copy_bounded_hashed(source, &mut target, Some(&mut hasher)).inspect_err(|_| {
        let _ = fs::remove_file(destination);
    })?;
    Ok(sha256_digest_hex(&hasher.finish()))
}

fn create_extraction_target(destination: &Path) -> Result<File, ArchiveError> {
    OpenOptions::new()
        .write(true)
        .create_new(true)
        .open(destination)
        .map_err(|error| {
            ArchiveError::io(
                format!("create extraction target {}", destination.display()),
                error,
            )
        })
}

/// Resolves and confines a member destination under `root`.
///
/// Every ancestor below `root` must be a real directory (never a symlink), and
/// the final destination must not already exist.
fn resolve_destination(root: &Path, segments: &[String]) -> Result<PathBuf, ArchiveError> {
    let Some((file_name, directory_segments)) = segments.split_last() else {
        return Err(ArchiveError::security("Empty path in archive entry"));
    };
    let directory = ensure_directory(root, directory_segments)?;
    let destination = directory.join(file_name);
    if let Ok(metadata) = fs::symlink_metadata(&destination) {
        if metadata.file_type().is_symlink() {
            return Err(ArchiveError::security(format!(
                "Extraction path {} escapes target directory {}",
                destination.display(),
                root.display()
            )));
        }
        return Err(ArchiveError::security(format!(
            "Extraction path already exists: {}",
            destination.display()
        )));
    }
    let parent = destination.parent().ok_or_else(|| {
        ArchiveError::security(format!(
            "Extraction path {} escapes target directory {}",
            destination.display(),
            root.display()
        ))
    })?;
    let canonical_parent = fs::canonicalize(parent)
        .map_err(|error| ArchiveError::io("resolve extraction parent", error))?;
    if !canonical_parent.starts_with(root) {
        return Err(ArchiveError::security(format!(
            "Extraction path {} escapes target directory {}",
            destination.display(),
            root.display()
        )));
    }
    Ok(destination)
}

fn ensure_directory(root: &Path, segments: &[String]) -> Result<PathBuf, ArchiveError> {
    let mut current = root.to_path_buf();
    for segment in segments {
        current.push(segment);
        match fs::symlink_metadata(&current) {
            Ok(metadata) => {
                if metadata.file_type().is_symlink() {
                    return Err(ArchiveError::security(format!(
                        "Symlink ancestor escapes extraction root: {}",
                        current.display()
                    )));
                }
                if !metadata.is_dir() {
                    return Err(ArchiveError::security(format!(
                        "Archive path component is not a directory: {}",
                        current.display()
                    )));
                }
            }
            Err(error) if error.kind() == io::ErrorKind::NotFound => {
                fs::create_dir(&current).map_err(|error| {
                    ArchiveError::io(format!("create directory {}", current.display()), error)
                })?;
            }
            Err(error) => {
                return Err(ArchiveError::io(
                    format!("inspect directory {}", current.display()),
                    error,
                ))
            }
        }
    }
    let canonical = fs::canonicalize(&current)
        .map_err(|error| ArchiveError::io("resolve extraction directory", error))?;
    if !canonical.starts_with(root) {
        return Err(ArchiveError::security(format!(
            "Extraction directory {} escapes target directory {}",
            canonical.display(),
            root.display()
        )));
    }
    Ok(current)
}

fn resolve_new_path(path: &Path) -> Result<PathBuf, ArchiveError> {
    let absolute = std::path::absolute(path)
        .map_err(|error| ArchiveError::io(format!("resolve path {}", path.display()), error))?;
    Ok(absolute)
}

fn resolve_existing_path(path: &Path) -> PathBuf {
    fs::canonicalize(path)
        .unwrap_or_else(|_| std::path::absolute(path).unwrap_or_else(|_| path.to_path_buf()))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sha256_hex_matches_python_digest_vectors() {
        let empty = Context::new(&SHA256).finish();
        assert_eq!(
            sha256_digest_hex(&empty),
            "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        );
        let mut abc = Context::new(&SHA256);
        abc.update(b"abc");
        assert_eq!(
            sha256_digest_hex(&abc.finish()),
            "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
        );
    }

    #[test]
    fn entry_count_boundary_is_inclusive() {
        assert!(validate_entry_count(100_000, 100_000).is_ok());
        assert!(validate_entry_count(100_001, 100_000).is_err());
    }

    #[test]
    fn expanded_size_boundary_and_overflow() {
        let max = DEFAULT_MAX_EXPANDED_BYTES;
        assert_eq!(accumulate_expanded(max - 1, 1, max).unwrap(), max);
        assert!(accumulate_expanded(max, 1, max).is_err());
        assert!(accumulate_expanded(u64::MAX, 1, u64::MAX).is_err());
    }

    #[test]
    fn ratio_boundary_matches_python_rule() {
        // Exactly 100:1 above 1 MiB is allowed.
        assert!(validate_ratio("x", 2_000_000, 20_000, 100.0).is_ok());
        // Just over 100:1 is rejected.
        assert!(validate_ratio("x", 2_000_001, 20_000, 100.0).is_err());
        // At or below 1 MiB the rule is bypassed entirely.
        assert!(validate_ratio("x", 1024 * 1024, 1, 100.0).is_ok());
        // Zero compressed size bypasses the rule.
        assert!(validate_ratio("x", 10 * 1024 * 1024, 0, 100.0).is_ok());
    }

    #[test]
    fn traversal_and_absolute_names_are_rejected() {
        for name in [
            "../escape",
            "a/../../escape",
            "/absolute",
            "\\absolute",
            "a\\..\\escape",
            "a//b",
            "",
            "C:/windows",
        ] {
            assert!(
                validate_member_name(name, false).is_err(),
                "expected rejection for {name:?}"
            );
        }
        assert!(validate_member_name("assets/helper.apk", false).is_ok());
        assert!(validate_member_name("res/", true).is_ok());
    }

    #[test]
    fn nul_names_are_rejected() {
        assert!(validate_member_name("a\0b", false).is_err());
    }

    #[test]
    fn normalization_collapses_dot_components() {
        let validated = validate_member_name("./a/./b.txt", false).unwrap();
        assert_eq!(validated.normalized, "a/b.txt");
        assert_eq!(validated.segments, vec!["a", "b.txt"]);
    }
}
