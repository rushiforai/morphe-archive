//! `icons` subcommand: discover missing Play icons or synchronize the cached
//! `site/public/icons/<package>.png` files.
//!
//! Behavior follows `.github/scripts/sync_app_icons.py`:
//! * packages come from `patches-list.json` compatible packages, deduplicated
//!   by first occurrence and sorted by package name;
//! * `--check-only` only reports missing files and always succeeds;
//! * per-package network/image failures are soft failures;
//! * image conversion reuses the proven Pillow-compatible
//!   [`crate::transform_icon`] and [`crate::write_icon_if_changed`] path. An
//!   existing PNG with identical decoded RGBA pixels keeps its bytes and
//!   modification time even when the newly encoded PNG bytes differ;
//! * `GITHUB_OUTPUT` keys and the multiline summary delimiter are preserved.

use std::collections::BTreeMap;
use std::env;
use std::fs::{self, OpenOptions};
use std::io::{self, Write};
use std::path::{Path, PathBuf};
use std::sync::LazyLock;
use std::time::Duration;

use regex::Regex;
use serde::Deserialize;

use crate::cache;
use crate::{cli, transform_icon, write_icon_if_changed, AssetError, IconWriteDecision, Result};

const USER_AGENT: &str = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) \
AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36";

const PLAY_URL_PREFIX: &str = "https://play.google.com/store/apps/details?id=";
const HTML_LIMIT: u64 = 8 * 1024 * 1024;
const IMAGE_LIMIT: u64 = 64 * 1024 * 1024;
const REQUEST_TIMEOUT: Duration = Duration::from_secs(15);

/// `md5("summary")`; the only value that can contain newlines in this command.
const SUMMARY_DELIMITER: &str = "ghadelim_a80da1282f2c775bbc5f2c92c836968b";
const MISSING_PACKAGES_DELIMITER: &str = "ghadelim_8fea859464b925ea68bde3c49fd45847";
const CHANGES_DETECTED_DELIMITER: &str = "ghadelim_3882492abb258498dbff430f888d3c42";
const HAS_MISSING_DELIMITER: &str = "ghadelim_2335d5205082998a60e03593139147fa";

#[derive(Deserialize)]
struct PatchesList {
    #[serde(default)]
    patches: Vec<Patch>,
}

#[derive(Deserialize)]
struct Patch {
    #[serde(default, rename = "compatiblePackages")]
    compatible_packages: Option<Vec<CompatiblePackage>>,
}

#[derive(Deserialize)]
struct CompatiblePackage {
    #[serde(default, rename = "packageName")]
    package_name: Option<String>,
    #[serde(default)]
    name: Option<String>,
}

/// Run the `icons` subcommand against the process environment.
pub fn run(args: &[String]) -> Result<()> {
    let mut stdout = io::stdout().lock();
    let mut stderr = io::stderr().lock();
    let github_output = env::var_os("GITHUB_OUTPUT")
        .filter(|value| !value.is_empty())
        .map(PathBuf::from);
    run_with(args, github_output.as_deref(), &mut stdout, &mut stderr)
}

/// Run the `icons` subcommand with explicit streams and `GITHUB_OUTPUT` path.
///
/// This is public so integration tests can observe exact output and side
/// effects without spawning the release binary.
#[doc(hidden)]
pub fn run_with(
    args: &[String],
    github_output: Option<&Path>,
    stdout: &mut dyn Write,
    stderr: &mut dyn Write,
) -> Result<()> {
    run_with_play_base(args, PLAY_URL_PREFIX, github_output, stdout, stderr)
}

/// Same as [`run_with`] but against an explicit Play details prefix.
///
/// This exists so integration tests can exercise the exact HTML parsing and
/// image pipeline through a loopback server; production callers always use
/// [`PLAY_URL_PREFIX`].
#[doc(hidden)]
pub fn run_with_play_base(
    args: &[String],
    play_url_prefix: &str,
    github_output: Option<&Path>,
    stdout: &mut dyn Write,
    stderr: &mut dyn Write,
) -> Result<()> {
    const VALUE_FLAGS: &[&str] = &["--patches-list", "--icons-dir"];
    const BOOL_FLAGS: &[&str] = &["--check-only", "--download-missing", "--sync-all"];
    let options = cli::parse(args, VALUE_FLAGS, BOOL_FLAGS)?;

    let selected_modes = [
        options.has("--check-only"),
        options.has("--download-missing"),
        options.has("--sync-all"),
    ]
    .into_iter()
    .filter(|selected| *selected)
    .count();
    if selected_modes != 1 {
        return Err(AssetError::usage(
            "exactly one of --check-only, --download-missing or --sync-all is required",
        ));
    }

    let root = repository_root();
    let patches_list_path = options
        .get("--patches-list")
        .map(PathBuf::from)
        .unwrap_or_else(|| root.join("patches-list.json"));
    let icons_dir = options
        .get("--icons-dir")
        .map(PathBuf::from)
        .unwrap_or_else(|| root.join("site").join("public").join("icons"));

    let packages = load_unique_packages(&patches_list_path)?;
    fs::create_dir_all(&icons_dir).map_err(|err| {
        AssetError::failure(format!(
            "failed to create icons directory {}: {err}",
            icons_dir.display()
        ))
    })?;

    let mut missing = Vec::new();
    for package in packages.keys() {
        if icon_is_missing(&icons_dir, package)? {
            missing.push(package.clone());
        }
    }

    if options.has("--check-only") {
        let has_missing = !missing.is_empty();
        set_github_output(
            github_output,
            "has_missing",
            if has_missing { "true" } else { "false" },
        )?;
        let missing_packages = missing.join(",");
        set_github_output(github_output, "missing_packages", missing_packages.as_str())?;
        if has_missing {
            writeln!(
                stdout,
                "Missing icons for {} package(s): {}",
                missing.len(),
                missing.join(", ")
            )?;
        } else {
            writeln!(
                stdout,
                "All {} application icons are present.",
                packages.len()
            )?;
        }
        return Ok(());
    }

    let packages_to_process: Vec<&String> = if options.has("--download-missing") {
        missing.iter().collect()
    } else {
        packages.keys().collect()
    };

    if packages_to_process.is_empty() {
        writeln!(stdout, "No packages need icon updates.")?;
        set_github_output(github_output, "changes_detected", "false")?;
        set_github_output(github_output, "summary", "No changes detected.")?;
        return Ok(());
    }

    let agent = cache::http_agent(Some(REQUEST_TIMEOUT), USER_AGENT);
    let mut new_packages = Vec::new();
    let mut updated_packages = Vec::new();

    for package in packages_to_process {
        let name = packages
            .get(package)
            .map(String::as_str)
            .unwrap_or(package.as_str());
        let icon_path = icons_dir.join(format!("{package}.png"));
        let is_new = icon_is_missing(&icons_dir, package)?;

        writeln!(
            stdout,
            "Fetching Google Play icon for {name} ({package})..."
        )?;

        let Some(image_url) = fetch_google_play_icon_url(&agent, package, play_url_prefix, stderr)?
        else {
            writeln!(stdout, "  Skipping {package}: could not obtain icon URL.")?;
            continue;
        };
        let Some(icon) = download_and_process_icon(&agent, &image_url, stderr)? else {
            writeln!(stdout, "  Skipping {package}: image processing failed.")?;
            continue;
        };

        let decision = write_icon_if_changed(&icon_path, &icon).map_err(|err| {
            AssetError::failure(format!(
                "failed to write icon {}: {err}",
                icon_path.display()
            ))
        })?;

        match decision {
            IconWriteDecision::Unchanged => {
                writeln!(stdout, "  {package}: icon unchanged.")?;
            }
            IconWriteDecision::Created | IconWriteDecision::Updated => {
                let bytes = icon.png.len();
                if is_new {
                    new_packages.push(format!("{name} (`{package}`)"));
                    writeln!(stdout, "  Added new icon for {package} ({bytes} bytes)")?;
                } else {
                    updated_packages.push(format!("{name} (`{package}`)"));
                    writeln!(stdout, "  Updated icon for {package} ({bytes} bytes)")?;
                }
            }
        }
    }

    let changes_detected = !new_packages.is_empty() || !updated_packages.is_empty();
    set_github_output(
        github_output,
        "changes_detected",
        if changes_detected { "true" } else { "false" },
    )?;

    let mut summary_lines = Vec::new();
    if !new_packages.is_empty() {
        summary_lines.push("### New Icons Added".to_owned());
        for item in &new_packages {
            summary_lines.push(format!("- {item}"));
        }
    }
    if !updated_packages.is_empty() {
        summary_lines.push("### Icons Refreshed from Google Play".to_owned());
        for item in &updated_packages {
            summary_lines.push(format!("- {item}"));
        }
    }
    let summary = if summary_lines.is_empty() {
        "No icons modified.".to_owned()
    } else {
        summary_lines.join("\n")
    };
    set_github_output(github_output, "summary", summary.as_str())?;

    writeln!(stdout)?;
    writeln!(
        stdout,
        "Completed. Changes detected: {}",
        if changes_detected { "True" } else { "False" }
    )?;
    if !summary_lines.is_empty() {
        writeln!(stdout)?;
        writeln!(stdout, "{summary}")?;
    }
    Ok(())
}

fn repository_root() -> PathBuf {
    let manifest_dir = Path::new(env!("CARGO_MANIFEST_DIR"));
    manifest_dir
        .parent()
        .and_then(Path::parent)
        .map(Path::to_path_buf)
        .unwrap_or_else(|| manifest_dir.to_path_buf())
}

fn load_unique_packages(path: &Path) -> Result<BTreeMap<String, String>> {
    let bytes = match fs::read(path) {
        Ok(bytes) => bytes,
        Err(err) if err.kind() == io::ErrorKind::NotFound => {
            return Err(AssetError::failure(format!(
                "Patches list not found: {}",
                path.display()
            )));
        }
        Err(err) => {
            return Err(AssetError::failure(format!(
                "failed to read patches list {}: {err}",
                path.display()
            )));
        }
    };
    let data: PatchesList = serde_json::from_slice(&bytes).map_err(|err| {
        AssetError::failure(format!(
            "failed to parse patches list {}: {err}",
            path.display()
        ))
    })?;

    let mut packages: BTreeMap<String, String> = BTreeMap::new();
    for patch in data.patches {
        for compatible in patch.compatible_packages.unwrap_or_default() {
            let Some(package) = compatible.package_name else {
                continue;
            };
            if package.is_empty() {
                continue;
            }
            let name = compatible
                .name
                .filter(|value| !value.is_empty())
                .unwrap_or_else(|| package.clone());
            packages.entry(package).or_insert(name);
        }
    }
    Ok(packages)
}

fn icon_is_missing(icons_dir: &Path, package: &str) -> Result<bool> {
    match fs::metadata(icons_dir.join(format!("{package}.png"))) {
        Ok(metadata) => Ok(metadata.len() == 0),
        Err(err) if err.kind() == io::ErrorKind::NotFound => Ok(true),
        Err(err) => Err(AssetError::failure(format!(
            "failed to inspect icon for {package}: {err}"
        ))),
    }
}

fn fetch_google_play_icon_url(
    agent: &ureq::Agent,
    package: &str,
    play_url_prefix: &str,
    stderr: &mut dyn Write,
) -> Result<Option<String>> {
    let url = format!("{play_url_prefix}{}&hl=en&gl=US", quote_package(package));
    let html = match cache::fetch_bytes(agent, &url, HTML_LIMIT) {
        Ok(bytes) => String::from_utf8_lossy(&bytes).into_owned(),
        Err(err) => {
            writeln!(
                stderr,
                "[WARN] Failed to scrape Google Play for {package}: {err}"
            )?;
            return Ok(None);
        }
    };

    match extract_og_image(&html) {
        Some(raw_url) => Ok(Some(normalize_og_image_url(&raw_url))),
        None => {
            writeln!(stderr, "[WARN] og:image meta tag not found for {package}")?;
            Ok(None)
        }
    }
}

fn download_and_process_icon(
    agent: &ureq::Agent,
    image_url: &str,
    stderr: &mut dyn Write,
) -> Result<Option<crate::IconImage>> {
    let bytes = match cache::fetch_bytes(agent, image_url, IMAGE_LIMIT) {
        Ok(bytes) => bytes,
        Err(err) => {
            writeln!(
                stderr,
                "[WARN] Failed to download icon image {image_url}: {err}"
            )?;
            return Ok(None);
        }
    };
    match transform_icon(&bytes) {
        Ok(icon) => Ok(Some(icon)),
        Err(err) => {
            writeln!(
                stderr,
                "[WARN] Failed to process image from {image_url}: {err}"
            )?;
            Ok(None)
        }
    }
}

static OG_IMAGE_PATTERNS: LazyLock<(Regex, Regex)> = LazyLock::new(|| {
    let property_first = Regex::new(
        r#"(?i)<meta[\s\x{1C}-\x{1F}]+[^>]*property=["']og:[iIİı]mage["'](?:[\s\x{1C}-\x{1F}]+)content=["']([^"']+)["']"#,
    )
    .expect("valid property-first og:image pattern");
    let content_first = Regex::new(
        r#"(?i)<meta[\s\x{1C}-\x{1F}]+[^>]*content=["']([^"']+)["'](?:[\s\x{1C}-\x{1F}]+)property=["']og:[iIİı]mage["']"#,
    )
    .expect("valid content-first og:image pattern");
    (property_first, content_first)
});

fn extract_og_image(html: &str) -> Option<String> {
    let (property_first, content_first) = &*OG_IMAGE_PATTERNS;
    property_first
        .captures(html)
        .or_else(|| content_first.captures(html))
        .and_then(|captures| captures.get(1).map(|value| value.as_str().to_owned()))
}

fn normalize_og_image_url(raw_url: &str) -> String {
    // The production script only decodes the HTML `&amp;` entity.
    raw_url.replace("&amp;", "&")
}

/// Python `urllib.parse.quote(value)` with the default safe set plus `/`.
fn quote_package(value: &str) -> String {
    let mut quoted = String::with_capacity(value.len());
    for byte in value.bytes() {
        match byte {
            b'A'..=b'Z' | b'a'..=b'z' | b'0'..=b'9' | b'_' | b'.' | b'-' | b'~' | b'/' => {
                quoted.push(byte as char);
            }
            _ => {
                const HEX: &[u8; 16] = b"0123456789ABCDEF";
                quoted.push('%');
                quoted.push(HEX[(byte >> 4) as usize] as char);
                quoted.push(HEX[(byte & 0x0f) as usize] as char);
            }
        }
    }
    quoted
}

fn delimiter_for(key: &str) -> Option<&'static str> {
    match key {
        "summary" => Some(SUMMARY_DELIMITER),
        "missing_packages" => Some(MISSING_PACKAGES_DELIMITER),
        "changes_detected" => Some(CHANGES_DETECTED_DELIMITER),
        "has_missing" => Some(HAS_MISSING_DELIMITER),
        _ => None,
    }
}

fn set_github_output(path: Option<&Path>, key: &str, value: &str) -> Result<()> {
    let Some(path) = path else {
        return Ok(());
    };
    let mut file = OpenOptions::new()
        .create(true)
        .append(true)
        .open(path)
        .map_err(|err| {
            AssetError::failure(format!(
                "failed to open GITHUB_OUTPUT {}: {err}",
                path.display()
            ))
        })?;

    if value.contains('\n') {
        let delimiter = delimiter_for(key).ok_or_else(|| {
            AssetError::failure(format!(
                "no GITHUB_OUTPUT delimiter for multiline key {key}"
            ))
        })?;
        write!(file, "{key}<<{delimiter}\n{value}\n{delimiter}\n")?;
    } else {
        writeln!(file, "{key}={value}")?;
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use std::fs;
    use std::path::Path;

    use serde_json::Value;

    use super::{normalize_og_image_url, repository_root, OG_IMAGE_PATTERNS};

    #[test]
    fn repository_root_is_the_crate_grandparent() {
        let root = repository_root();
        assert!(root.join("patches-list.json").is_file());
        assert!(root.join("tools").join("asset-prep").is_dir());
    }

    #[test]
    fn quote_matches_python_rules() {
        assert_eq!(super::quote_package("com.example.app"), "com.example.app");
        assert_eq!(super::quote_package("a b+c/d"), "a%20b%2Bc/d");
    }

    #[test]
    fn regexes_match_the_frozen_python_contract() {
        let root = Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("tests")
            .join("fixtures")
            .join("icon-sync");
        let contract: Value = serde_json::from_slice(
            &fs::read(root.join("regex").join("contract.json")).expect("regex contract fixture"),
        )
        .expect("valid regex contract JSON");
        let (property_first, alternate) = &*OG_IMAGE_PATTERNS;
        for case in contract["cases"].as_array().expect("contract cases") {
            let html_path = case["htmlPath"].as_str().expect("htmlPath");
            let html = fs::read_to_string(root.join(html_path)).expect("case HTML");
            let expected_property = case["propertyFirstUrl"].as_str();
            let expected_alternate = case["alternateUrl"].as_str();
            let expected_normalized = case["normalizedUrl"].as_str();

            let property_match = property_first
                .captures(&html)
                .and_then(|captures| captures.get(1).map(|value| value.as_str()));
            let alternate_match = alternate
                .captures(&html)
                .and_then(|captures| captures.get(1).map(|value| value.as_str()));
            assert_eq!(
                property_match, expected_property,
                "property-first pattern for {}",
                case["id"]
            );
            assert_eq!(
                alternate_match, expected_alternate,
                "alternate pattern for {}",
                case["id"]
            );
            let combined = property_match
                .or(alternate_match)
                .map(normalize_og_image_url);
            assert_eq!(
                combined.as_deref(),
                expected_normalized,
                "combined extraction for {}",
                case["id"]
            );
        }
    }

    #[test]
    fn extracts_both_attribute_orders() {
        let first = r#"<meta property="og:image" content="https://x/a.png?a=1&amp;b=2">"#;
        let second = r#"<meta content="https://x/b.png" property="og:image">"#;
        assert_eq!(
            super::extract_og_image(first).as_deref(),
            Some("https://x/a.png?a=1&amp;b=2")
        );
        assert_eq!(
            super::extract_og_image(second).as_deref(),
            Some("https://x/b.png")
        );
        assert_eq!(
            super::normalize_og_image_url("https://x/a?b=1&amp;c=2&#38;d=3"),
            "https://x/a?b=1&c=2&#38;d=3"
        );
    }
}
