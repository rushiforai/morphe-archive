//! Pinned Tesseract OCR model download and cache handling.
//!
//! This is a direct port of `.github/scripts/prepare_ocr_model.py`: a valid
//! cache file is copied to the output, a corrupt cache is replaced, and a
//! download is only published after its pinned SHA-256 and size match.

use std::fs;
use std::path::PathBuf;
use std::time::Duration;

use crate::cache;
use crate::{AssetError, Result};

/// Pinned upstream model URL.
pub const DEFAULT_URL: &str = "https://raw.githubusercontent.com/tesseract-ocr/tessdata_fast/65727574dfcd264acbb0c3e07860e4e9e9b22185/eng.traineddata";
/// Pinned SHA-256 of the model.
pub const EXPECTED_SHA256: &str =
    "7d4322bd2a7749724879683fc3912cb542f19906c83bcc1a52132556427170b2";
/// Pinned size of the model.
pub const EXPECTED_SIZE: u64 = 4_113_088;

const USER_AGENT: &str = "AidansPatches/1.0";
const TIMEOUT: Duration = Duration::from_secs(60);
const DOWNLOAD_LIMIT: u64 = 64 * 1024 * 1024;
const VALUE_FLAGS: &[&str] = &["--output", "--cache-dir"];
const BOOLEAN_FLAGS: &[&str] = &[];

/// CLI entry point: `asset-prep ocr --output ... --cache-dir ...`.
pub fn run(args: &[String]) -> Result<()> {
    let options = crate::cli::parse(args, VALUE_FLAGS, BOOLEAN_FLAGS)?;
    let output = PathBuf::from(options.required("--output")?);
    let cache_dir = PathBuf::from(options.required("--cache-dir")?);

    fs::create_dir_all(&cache_dir)?;
    cache::ensure_parent(&output)?;

    let cached = cache_dir.join("eng.traineddata");
    if cache::validate_file(&cached, EXPECTED_SHA256, Some(EXPECTED_SIZE)) {
        println!("Used cached OCR model at {}", cached.display());
        cache::copy_file(&cached, &output)?;
        return Ok(());
    }
    if cached.exists() {
        eprintln!("Cached model SHA-256 mismatch, re-downloading...");
        fs::remove_file(&cached)?;
    }

    println!("Downloading OCR model from {DEFAULT_URL}...");
    let agent = cache::http_agent(Some(TIMEOUT), USER_AGENT);
    cache::ensure_cached(
        &agent,
        DEFAULT_URL,
        &cached,
        EXPECTED_SHA256,
        Some(EXPECTED_SIZE),
        DOWNLOAD_LIMIT,
    )
    .map_err(|err| AssetError::failure(format!("Download failed: {err}")))?;

    cache::copy_file(&cached, &output)?;
    println!("Prepared OCR model: {}", output.display());
    Ok(())
}
