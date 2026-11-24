//! Shared HTTP download, hash validation and atomic cache promotion.
//!
//! Font and OCR preparation have different user-visible messages and pins but
//! the same safety requirements: a bounded HTTP read into a sibling temporary
//! file, SHA-256/size validation, and only then an atomic rename over the cache
//! path. Interrupted or rejected downloads never publish a partial file.
//!
//! `file://` URLs are supported because the original font script's `--url`
//! option accepts any URL understood by `urllib`, including local file URLs.

use std::fs::{self, File};
use std::io::{Read, Write};
use std::path::{Path, PathBuf};
use std::time::Duration;

use sha2::{Digest, Sha256};
use ureq::Agent;

use crate::{AssetError, Result};

const DOWNLOAD_CHUNK: usize = 1024 * 1024;

/// Outcome of [`ensure_cached`].
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum CacheOutcome {
    /// An existing cache file already matched the pinned hash/size.
    Valid,
    /// A cache file existed but was invalid and has been replaced.
    ReplacedCorrupt,
    /// No cache file existed and a verified download was published.
    Downloaded,
}

/// Build the process-wide HTTP agent used by the asset downloaders.
///
/// `timeout` becomes ureq's global operation budget (including response body
/// reads); `None` keeps the original font script's "no timeout" behavior.
pub fn http_agent(timeout: Option<Duration>, user_agent: &str) -> Agent {
    Agent::config_builder()
        .timeout_global(timeout)
        .user_agent(user_agent)
        .build()
        .into()
}

/// Download a bounded body into memory.
///
/// This is the shared entry point for callers that need bytes rather than a
/// cache file (for example icon HTML and image downloads). HTTP status errors
/// are ureq errors and therefore failures. `file://` URLs are read locally
/// with the same byte limit.
pub fn fetch_bytes(agent: &Agent, url: &str, limit: u64) -> Result<Vec<u8>> {
    if let Some(path) = file_url_path(url) {
        let metadata = fs::metadata(&path)
            .map_err(|err| AssetError::failure(format!("failed to read {url}: {err}")))?;
        if metadata.len() > limit {
            return Err(too_large(url, metadata.len(), limit));
        }
        let bytes = fs::read(&path)
            .map_err(|err| AssetError::failure(format!("failed to read {url}: {err}")))?;
        if bytes.len() as u64 > limit {
            return Err(too_large(url, bytes.len() as u64, limit));
        }
        return Ok(bytes);
    }

    let mut response = agent
        .get(url)
        .call()
        .map_err(|err| request_error(url, err))?;
    if let Some(length) = response
        .headers()
        .get("content-length")
        .and_then(|value| value.to_str().ok())
        .and_then(|value| value.parse::<u64>().ok())
    {
        if length > limit {
            return Err(too_large(url, length, limit));
        }
    }

    let mut body = response.body_mut().as_reader();
    let mut bytes = Vec::new();
    body.by_ref()
        .take(limit.saturating_add(1))
        .read_to_end(&mut bytes)
        .map_err(|err| AssetError::failure(format!("failed to read {url}: {err}")))?;
    if bytes.len() as u64 > limit {
        return Err(too_large(url, bytes.len() as u64, limit));
    }
    Ok(bytes)
}

/// Validate an existing cache file against the pinned SHA-256 and optional size.
///
/// Missing, unreadable, wrongly sized and wrongly hashed files are all simply
/// `false`; callers decide whether to repair or report.
pub fn validate_file(path: &Path, expected_sha256: &str, expected_size: Option<u64>) -> bool {
    let metadata = match fs::metadata(path) {
        Ok(metadata) => metadata,
        Err(_) => return false,
    };
    if !metadata.is_file() {
        return false;
    }
    if let Some(size) = expected_size {
        if metadata.len() != size {
            return false;
        }
    }
    match sha256_file(path) {
        Ok(digest) => digest == expected_sha256,
        Err(_) => false,
    }
}

/// Validate a cache-like file, downloading a verified replacement when needed.
///
/// The existing file is left in place if the download fails, so a failed
/// network operation cannot delete an otherwise usable file. A successful
/// download is promoted with one atomic rename.
pub fn ensure_cached(
    agent: &Agent,
    url: &str,
    path: &Path,
    expected_sha256: &str,
    expected_size: Option<u64>,
    limit: u64,
) -> Result<CacheOutcome> {
    let existed = path.exists();
    if validate_file(path, expected_sha256, expected_size) {
        return Ok(CacheOutcome::Valid);
    }
    download_verified(agent, url, path, expected_sha256, expected_size, limit)?;
    Ok(if existed {
        CacheOutcome::ReplacedCorrupt
    } else {
        CacheOutcome::Downloaded
    })
}

/// Stream `url` into `path.tmp`, validate it, then atomically rename it.
///
/// Any error removes the temporary file and leaves the destination untouched.
pub fn download_verified(
    agent: &Agent,
    url: &str,
    path: &Path,
    expected_sha256: &str,
    expected_size: Option<u64>,
    limit: u64,
) -> Result<()> {
    ensure_parent(path)?;
    let temporary = temporary_path(path);
    let result = (|| -> Result<()> {
        let mut file = File::create(&temporary)?;
        let mut hasher = Sha256::new();
        let mut written = 0u64;

        if let Some(source) = file_url_path(url) {
            let metadata = fs::metadata(&source)
                .map_err(|err| AssetError::failure(format!("failed to read {url}: {err}")))?;
            if metadata.len() > limit {
                return Err(too_large(url, metadata.len(), limit));
            }
            let mut input = File::open(&source)
                .map_err(|err| AssetError::failure(format!("failed to read {url}: {err}")))?;
            copy_bounded(&mut input, &mut file, &mut hasher, &mut written, limit, url)?;
        } else {
            let mut response = agent
                .get(url)
                .call()
                .map_err(|err| request_error(url, err))?;
            if let Some(length) = response
                .headers()
                .get("content-length")
                .and_then(|value| value.to_str().ok())
                .and_then(|value| value.parse::<u64>().ok())
            {
                if length > limit {
                    return Err(too_large(url, length, limit));
                }
            }
            let mut body = response.body_mut().as_reader();
            copy_bounded(&mut body, &mut file, &mut hasher, &mut written, limit, url)?;
        }

        file.flush()?;
        drop(file);

        if written == 0 {
            return Err(AssetError::failure(format!(
                "downloaded zero bytes from {url}"
            )));
        }
        let digest = hex_digest(&hasher.finalize()[..]);
        if digest != expected_sha256 {
            return Err(AssetError::failure(format!(
                "checksum mismatch for {url}: expected {expected_sha256}, got {digest}"
            )));
        }
        if let Some(size) = expected_size {
            if written != size {
                return Err(AssetError::failure(format!(
                    "size mismatch for {url}: expected {size} bytes, got {written}"
                )));
            }
        }

        fs::rename(&temporary, path).map_err(|err| {
            AssetError::failure(format!(
                "failed to publish downloaded file {}: {err}",
                path.display()
            ))
        })?;
        Ok(())
    })();

    if result.is_err() {
        let _ = fs::remove_file(&temporary);
    }
    result
}

/// Copy a file into place, creating its parent directory as the originals do.
pub fn copy_file(source: &Path, destination: &Path) -> Result<()> {
    ensure_parent(destination)?;
    fs::copy(source, destination).map_err(|err| {
        AssetError::failure(format!(
            "failed to copy {} to {}: {err}",
            source.display(),
            destination.display()
        ))
    })?;
    Ok(())
}

/// Write bytes through a sibling temporary file and rename into place.
pub fn write_atomic(path: &Path, bytes: &[u8]) -> Result<()> {
    ensure_parent(path)?;
    let temporary = temporary_path(path);
    let result = (|| -> Result<()> {
        fs::write(&temporary, bytes)?;
        fs::rename(&temporary, path).map_err(|err| {
            AssetError::failure(format!("failed to publish {}: {err}", path.display()))
        })?;
        Ok(())
    })();
    if result.is_err() {
        let _ = fs::remove_file(&temporary);
    }
    result
}

/// Lowercase hexadecimal SHA-256 of an in-memory buffer.
pub fn sha256_hex(bytes: &[u8]) -> String {
    let mut hasher = Sha256::new();
    hasher.update(bytes);
    hex_digest(&hasher.finalize()[..])
}

/// Lowercase hexadecimal SHA-256 of a file, streamed in bounded chunks.
pub fn sha256_file(path: &Path) -> Result<String> {
    let mut file = File::open(path)?;
    let mut hasher = Sha256::new();
    let mut buffer = [0u8; 64 * 1024];
    loop {
        let read = file.read(&mut buffer)?;
        if read == 0 {
            break;
        }
        hasher.update(&buffer[..read]);
    }
    Ok(hex_digest(&hasher.finalize()[..]))
}

/// Decode the path portion of a `file://` URL, if this is one.
pub fn file_url_path(url: &str) -> Option<PathBuf> {
    let rest = url.strip_prefix("file://")?;
    let rest = rest.strip_prefix("localhost").unwrap_or(rest);
    let decoded = percent_decode(rest);
    if decoded.is_empty() {
        return None;
    }
    Some(PathBuf::from(decoded))
}

pub(crate) fn ensure_parent(path: &Path) -> Result<()> {
    if let Some(parent) = path.parent() {
        if !parent.as_os_str().is_empty() {
            fs::create_dir_all(parent)?;
        }
    }
    Ok(())
}

fn copy_bounded(
    input: &mut impl Read,
    output: &mut impl Write,
    hasher: &mut Sha256,
    written: &mut u64,
    limit: u64,
    url: &str,
) -> Result<()> {
    let mut buffer = vec![0u8; DOWNLOAD_CHUNK];
    loop {
        let read = input
            .read(&mut buffer)
            .map_err(|err| AssetError::failure(format!("failed to read {url}: {err}")))?;
        if read == 0 {
            break;
        }
        *written = written
            .checked_add(read as u64)
            .ok_or_else(|| too_large(url, u64::MAX, limit))?;
        if *written > limit {
            return Err(too_large(url, *written, limit));
        }
        hasher.update(&buffer[..read]);
        output.write_all(&buffer[..read])?;
    }
    Ok(())
}

fn request_error(url: &str, err: ureq::Error) -> AssetError {
    match err {
        ureq::Error::StatusCode(code) => {
            let reason = ureq::http::StatusCode::from_u16(code)
                .ok()
                .and_then(|status| status.canonical_reason())
                .unwrap_or("");
            AssetError::failure(format!("HTTP Error {code}: {reason}"))
        }
        other => AssetError::failure(format!("failed to download {url}: {other}")),
    }
}

fn temporary_path(path: &Path) -> PathBuf {
    let mut name = path.as_os_str().to_os_string();
    name.push(".tmp");
    PathBuf::from(name)
}

fn percent_decode(value: &str) -> String {
    let bytes = value.as_bytes();
    let mut decoded = Vec::with_capacity(bytes.len());
    let mut index = 0;
    while index < bytes.len() {
        if bytes[index] == b'%' && index + 2 < bytes.len() {
            if let (Some(high), Some(low)) =
                (hex_value(bytes[index + 1]), hex_value(bytes[index + 2]))
            {
                decoded.push(high << 4 | low);
                index += 3;
                continue;
            }
        }
        decoded.push(bytes[index]);
        index += 1;
    }
    String::from_utf8_lossy(&decoded).into_owned()
}

fn hex_value(byte: u8) -> Option<u8> {
    match byte {
        b'0'..=b'9' => Some(byte - b'0'),
        b'a'..=b'f' => Some(byte - b'a' + 10),
        b'A'..=b'F' => Some(byte - b'A' + 10),
        _ => None,
    }
}

fn hex_digest(digest: &[u8]) -> String {
    use std::fmt::Write as _;
    let mut out = String::with_capacity(digest.len() * 2);
    for byte in digest {
        let _ = write!(&mut out, "{byte:02x}");
    }
    out
}

fn too_large(url: &str, length: u64, limit: u64) -> AssetError {
    AssetError::failure(format!(
        "{url} is {length} bytes, exceeding the {limit} byte download limit"
    ))
}
