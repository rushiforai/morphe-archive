//! `pdfbox` subcommand: package the `assets/com/tom_roush/` entries of the
//! pinned `pdfbox-android` AAR into the resource ZIP consumed by the patches
//! module.
//!
//! The Python generator selected non-directory members whose names start with
//! `assets/com/tom_roush/`, stored them relative to `assets/` and wrote the
//! result with deflate compression. A zero-match run removes the destination
//! and fails. This module preserves those member names and uncompressed bytes;
//! timestamps and compression streams need not be byte-identical because the
//! consumer reads ZIP members.

use std::ffi::OsStr;
use std::fs::{self, File};
use std::io::{self, Write};
use std::path::{Path, PathBuf};

use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipArchive, ZipWriter};

use crate::{cli, AssetError, Result};

/// Prefix inside the AAR. The packaged ZIP stores paths without `assets/`.
const ASSET_PREFIX: &str = "assets/com/tom_roush/";
const AAR_PREFIX: &str = "assets/";

/// Run the `pdfbox` subcommand against the process environment.
pub fn run(args: &[String]) -> Result<()> {
    let mut stdout = io::stdout().lock();
    let mut stderr = io::stderr().lock();
    run_with(args, &mut stdout, &mut stderr)
}

/// Run the `pdfbox` subcommand with explicit output streams.
///
/// This is public so integration tests can observe the exact user-visible
/// output without spawning the release binary.
#[doc(hidden)]
pub fn run_with(args: &[String], stdout: &mut dyn Write, _stderr: &mut dyn Write) -> Result<()> {
    const VALUE_FLAGS: &[&str] = &["--output", "--gradle-home", "--version", "--aar"];
    const BOOL_FLAGS: &[&str] = &[];
    let options = cli::parse(args, VALUE_FLAGS, BOOL_FLAGS)?;
    let output = options.required("--output")?;
    let gradle_home = options.required("--gradle-home")?;

    let aar_path = match options.get("--aar") {
        Some(aar) => {
            let path = PathBuf::from(aar);
            if !path.is_file() {
                return Err(AssetError::failure(format!(
                    "Error: Specified AAR file not found: {aar}"
                )));
            }
            path
        }
        None => {
            find_pdfbox_aar(Path::new(gradle_home), options.get("--version")).ok_or_else(|| {
                let version = options
                    .get("--version")
                    .map(|value| format!(" {value}"))
                    .unwrap_or_default();
                AssetError::failure(format!(
                    "pdfbox-android{version}.aar not found in Gradle cache"
                ))
            })?
        }
    };

    let output_path = PathBuf::from(output);
    package_assets(&aar_path, &output_path, output, stdout)
}

fn package_assets(
    aar_path: &Path,
    output_path: &Path,
    output_display: &str,
    stdout: &mut dyn Write,
) -> Result<()> {
    if let Some(parent) = output_path.parent() {
        if !parent.as_os_str().is_empty() {
            fs::create_dir_all(parent).map_err(|err| {
                AssetError::failure(format!(
                    "failed to create output directory {}: {err}",
                    parent.display()
                ))
            })?;
        }
    }

    let aar_file = File::open(aar_path).map_err(|err| {
        AssetError::failure(format!(
            "failed to open PDFBox AAR {}: {err}",
            aar_path.display()
        ))
    })?;
    let mut archive = ZipArchive::new(aar_file).map_err(|err| {
        AssetError::failure(format!(
            "failed to read PDFBox AAR {}: {err}",
            aar_path.display()
        ))
    })?;

    // Count first so a zero-match run never creates an empty archive and the
    // historical cleanup behavior is preserved.
    let mut count = 0usize;
    for index in 0..archive.len() {
        let entry = archive.by_index(index).map_err(|err| {
            AssetError::failure(format!(
                "failed to read member of {}: {err}",
                aar_path.display()
            ))
        })?;
        let name = entry.name().map_err(|err| {
            AssetError::failure(format!(
                "failed to decode member name in {}: {err}",
                aar_path.display()
            ))
        })?;
        if is_selected(name.as_ref()) {
            count += 1;
        }
    }

    if count == 0 {
        remove_if_exists(output_path)?;
        return Err(AssetError::failure(format!(
            "Error: No PDFBox assets found matching prefix '{ASSET_PREFIX}' in {}",
            aar_path.display()
        )));
    }

    let output_file = File::create(output_path).map_err(|err| {
        AssetError::failure(format!(
            "failed to create PDFBox asset archive {}: {err}",
            output_path.display()
        ))
    })?;
    let mut writer = ZipWriter::new(output_file);
    let options = SimpleFileOptions::default().compression_method(CompressionMethod::Deflated);

    for index in 0..archive.len() {
        let mut entry = archive.by_index(index).map_err(|err| {
            AssetError::failure(format!(
                "failed to read member of {}: {err}",
                aar_path.display()
            ))
        })?;
        let name = entry
            .name()
            .map_err(|err| {
                AssetError::failure(format!(
                    "failed to decode member name in {}: {err}",
                    aar_path.display()
                ))
            })?
            .into_owned();
        if !is_selected(&name) {
            continue;
        }
        let archived_name = name
            .strip_prefix(AAR_PREFIX)
            .expect("selected names always start with the assets prefix")
            .to_owned();
        writer.start_file(archived_name, options).map_err(|err| {
            AssetError::failure(format!("failed to write PDFBox asset archive: {err}"))
        })?;
        io::copy(&mut entry, &mut writer).map_err(|err| {
            AssetError::failure(format!("failed to copy PDFBox asset {name}: {err}"))
        })?;
    }

    writer.finish().map_err(|err| {
        AssetError::failure(format!(
            "failed to finish PDFBox asset archive {}: {err}",
            output_path.display()
        ))
    })?;

    writeln!(
        stdout,
        "Packaged {count} PDFBox assets into {output_display}"
    )?;
    Ok(())
}

fn is_selected(name: &str) -> bool {
    name.starts_with(ASSET_PREFIX) && !name.ends_with('/')
}

fn remove_if_exists(path: &Path) -> Result<()> {
    match fs::remove_file(path) {
        Ok(()) => Ok(()),
        Err(err) if err.kind() == io::ErrorKind::NotFound => Ok(()),
        Err(err) => Err(AssetError::failure(format!(
            "failed to remove {}: {err}",
            path.display()
        ))),
    }
}

/// Locate the first `<gradle-home>/caches/modules-2/files-2.1/com.tom-roush/
/// pdfbox-android/<version>/**/*.aar` match, mirroring the Python glob.
fn find_pdfbox_aar(gradle_home: &Path, version: Option<&str>) -> Option<PathBuf> {
    let base = gradle_home
        .join("caches")
        .join("modules-2")
        .join("files-2.1")
        .join("com.tom-roush")
        .join("pdfbox-android");
    let entries = fs::read_dir(base).ok()?;

    for entry in entries.flatten() {
        let path = entry.path();
        if !path.is_dir() {
            continue;
        }
        let Some(directory_name) = path.file_name().and_then(OsStr::to_str) else {
            continue;
        };
        if !version_matches(version, directory_name) {
            continue;
        }
        if let Some(found) = first_aar(&path) {
            return Some(found);
        }
    }
    None
}

fn version_matches(version: Option<&str>, directory_name: &str) -> bool {
    match version {
        None => !directory_name.starts_with('.'),
        Some(pattern) => {
            // Python's glob does not match hidden directories with a
            // non-dot-leading pattern.
            if directory_name.starts_with('.') && !pattern.starts_with('.') {
                return false;
            }
            glob_match(pattern, directory_name)
        }
    }
}

fn first_aar(directory: &Path) -> Option<PathBuf> {
    let entries = fs::read_dir(directory).ok()?;
    for entry in entries.flatten() {
        let path = entry.path();
        if path.is_dir() {
            if let Some(found) = first_aar(&path) {
                return Some(found);
            }
        } else if path.extension() == Some(OsStr::new("aar")) {
            return Some(path);
        }
    }
    None
}

/// Minimal glob matching for the `--version` path segment (`*`, `?`, and
/// `[...]`, like Python's `glob`).
fn glob_match(pattern: &str, text: &str) -> bool {
    let pattern: Vec<char> = pattern.chars().collect();
    let text: Vec<char> = text.chars().collect();
    glob_match_at(&pattern, &text)
}

fn glob_match_at(pattern: &[char], text: &[char]) -> bool {
    let Some((&token, rest)) = pattern.split_first() else {
        return text.is_empty();
    };
    match token {
        '*' => {
            if glob_match_at(rest, text) {
                return true;
            }
            for index in 0..text.len() {
                if glob_match_at(rest, &text[index + 1..]) {
                    return true;
                }
            }
            false
        }
        '?' => !text.is_empty() && glob_match_at(rest, &text[1..]),
        '[' => {
            let Some(close) = pattern.iter().skip(1).position(|&ch| ch == ']') else {
                return !text.is_empty() && token == text[0] && glob_match_at(rest, &text[1..]);
            };
            let close = close + 1;
            if text.is_empty() {
                return false;
            }
            let class = &pattern[1..close];
            let (negated, class) = match class.first() {
                Some('!') | Some('^') => (true, &class[1..]),
                _ => (false, class),
            };
            let matched = class_matches(class, text[0]);
            if matched != negated && glob_match_at(&pattern[close + 1..], &text[1..]) {
                return true;
            }
            false
        }
        literal => !text.is_empty() && literal == text[0] && glob_match_at(rest, &text[1..]),
    }
}

fn class_matches(class: &[char], candidate: char) -> bool {
    let mut index = 0;
    while index < class.len() {
        if index + 2 < class.len() && class[index + 1] == '-' {
            if class[index] <= candidate && candidate <= class[index + 2] {
                return true;
            }
            index += 3;
        } else {
            if class[index] == candidate {
                return true;
            }
            index += 1;
        }
    }
    false
}
