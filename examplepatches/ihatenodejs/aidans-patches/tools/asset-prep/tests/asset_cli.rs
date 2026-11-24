//! Consumer-visible contract tests for the `pdfbox` and `icons` subcommands.
//!
//! Expectations are frozen from the Python generators by
//! `.apk-lab-migration/asset-cli-capture/capture_assets.py` (see each fixture
//! manifest's `reference.captureCommand`). The HTTP tests use a loopback server
//! and the production `cache::http_agent`/`fetch_bytes` path; they never contact
//! Google Play.

use std::collections::BTreeMap;
use std::fs::{self, File, FileTimes};
use std::io::{BufRead, BufReader, Cursor, Read, Write};
use std::net::{TcpListener, TcpStream};
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{Arc, Mutex};
use std::thread::{self, JoinHandle};
use std::time::{Duration, SystemTime};

use asset_prep::{icon_sync, pdfbox};
use serde::Deserialize;
use serde_json::Value;
use sha2::{Digest, Sha256};
use tempfile::TempDir;

fn fixture_root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests")
        .join("fixtures")
}

fn sha256_hex(bytes: &[u8]) -> String {
    let digest = Sha256::digest(bytes);
    let mut out = String::with_capacity(64);
    for byte in digest {
        out.push_str(&format!("{byte:02x}"));
    }
    out
}

fn read(path: &Path) -> Vec<u8> {
    fs::read(path).unwrap_or_else(|err| panic!("failed to read {}: {err}", path.display()))
}

fn run_pdfbox(args: &[String]) -> (asset_prep::Result<()>, String, String) {
    let mut stdout = Vec::new();
    let mut stderr = Vec::new();
    let result = pdfbox::run_with(args, &mut stdout, &mut stderr);
    (
        result,
        String::from_utf8(stdout).expect("pdfbox stdout is UTF-8"),
        String::from_utf8(stderr).expect("pdfbox stderr is UTF-8"),
    )
}

fn run_icons(args: &[String], github_output: &Path) -> (asset_prep::Result<()>, String, String) {
    let mut stdout = Vec::new();
    let mut stderr = Vec::new();
    let result = icon_sync::run_with(args, Some(github_output), &mut stdout, &mut stderr);
    (
        result,
        String::from_utf8(stdout).expect("icon stdout is UTF-8"),
        String::from_utf8(stderr).expect("icon stderr is UTF-8"),
    )
}

fn run_icons_at(
    args: &[String],
    github_output: &Path,
    play_url_prefix: &str,
) -> (asset_prep::Result<()>, String, String) {
    let mut stdout = Vec::new();
    let mut stderr = Vec::new();
    let result = icon_sync::run_with_play_base(
        args,
        play_url_prefix,
        Some(github_output),
        &mut stdout,
        &mut stderr,
    );
    (
        result,
        String::from_utf8(stdout).expect("icon stdout is UTF-8"),
        String::from_utf8(stderr).expect("icon stderr is UTF-8"),
    )
}

fn error_message(result: asset_prep::Result<()>) -> String {
    match result {
        Ok(()) => panic!("expected an error result"),
        Err(err) => err.to_string(),
    }
}

fn assert_normalized_stdout(actual: &str, expected: &str, stderr: &str) {
    let actual = normalize_png_byte_counts(actual);
    let expected = normalize_png_byte_counts(expected);
    if actual == expected {
        return;
    }
    let actual_lines: Vec<&str> = actual.lines().collect();
    let expected_lines: Vec<&str> = expected.lines().collect();
    for index in 0..actual_lines.len().max(expected_lines.len()) {
        let actual_line = actual_lines.get(index).copied().unwrap_or("<missing line>");
        let expected_line = expected_lines
            .get(index)
            .copied()
            .unwrap_or("<missing line>");
        if actual_line != expected_line {
            panic!(
                "stdout line {} differs\nactual: {actual_line:?}\nexpected: {expected_line:?}\nstderr:\n{stderr}",
                index + 1
            );
        }
    }
    panic!("stdout differs only in trailing line endings\nstderr:\n{stderr}");
}

// ---------------------------------------------------------------------------
// PDFBox
// ---------------------------------------------------------------------------

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct PdfboxManifest {
    cases: BTreeMap<String, PdfboxCase>,
    fixtures: PdfboxFixtures,
    actual_selected_entry_digest: Option<PdfboxDigest>,
}

#[derive(Deserialize)]
struct PdfboxFixtures {
    aars: BTreeMap<String, PdfboxFile>,
}

#[derive(Deserialize)]
struct PdfboxFile {
    path: String,
    sha256: String,
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct PdfboxDigest {
    count: usize,
    entries_sha256: String,
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct PdfboxCase {
    stdout: String,
    stderr: String,
    exit: i32,
    output_exists: bool,
    output: Option<PdfboxOutput>,
}

#[derive(Deserialize)]
struct PdfboxOutput {
    entries: Vec<PdfboxEntry>,
    count: usize,
}

#[derive(Deserialize)]
struct PdfboxEntry {
    name: String,
    size: usize,
    sha256: String,
    method: u16,
    directory: bool,
}

fn load_pdfbox_manifest() -> (PathBuf, PdfboxManifest) {
    let root = fixture_root().join("pdfbox");
    let path = root.join("manifest.json");
    let manifest = serde_json::from_slice(&read(&path))
        .unwrap_or_else(|err| panic!("failed to parse {}: {err}", path.display()));
    (root, manifest)
}

fn pdfbox_args(aar: &Path, gradle_home: &Path, output: &Path) -> Vec<String> {
    vec![
        "--gradle-home".to_owned(),
        gradle_home.display().to_string(),
        "--aar".to_owned(),
        aar.display().to_string(),
        "--output".to_owned(),
        output.display().to_string(),
    ]
}

fn assert_zip_entries(archive_path: &Path, expected: &PdfboxOutput) {
    let file = File::open(archive_path)
        .unwrap_or_else(|err| panic!("failed to open {}: {err}", archive_path.display()));
    let mut archive = zip::ZipArchive::new(file).expect("output is a ZIP archive");
    assert_eq!(archive.len(), expected.count);
    let mut seen = Vec::new();
    for index in 0..archive.len() {
        let mut entry = archive.by_index(index).expect("valid ZIP member");
        let name = entry.name().expect("valid ZIP member name").into_owned();
        let mut bytes = Vec::with_capacity(entry.size() as usize);
        entry
            .read_to_end(&mut bytes)
            .expect("member content readable");
        let method = match entry.compression() {
            zip::CompressionMethod::Deflated => 8,
            zip::CompressionMethod::Stored => 0,
            _ => u16::MAX,
        };
        seen.push(PdfboxEntry {
            name,
            size: bytes.len(),
            sha256: sha256_hex(&bytes),
            method,
            directory: false,
        });
    }
    assert_eq!(seen.len(), expected.entries.len());
    for (actual, wanted) in seen.iter().zip(&expected.entries) {
        assert_eq!(actual.name, wanted.name);
        assert_eq!(actual.size, wanted.size, "size for {}", wanted.name);
        assert_eq!(actual.sha256, wanted.sha256, "content for {}", wanted.name);
        assert_eq!(actual.method, wanted.method, "method for {}", wanted.name);
        assert!(!wanted.directory);
        assert_eq!(actual.method, 8, "PDFBox entries use deflate");
    }
}

#[test]
fn fixture_hashes_match_manifest() {
    let (root, manifest) = load_pdfbox_manifest();
    for (name, file) in &manifest.fixtures.aars {
        let bytes = read(&root.join(&file.path));
        assert_eq!(sha256_hex(&bytes), file.sha256, "AAR fixture {name}");
    }
}

#[test]
fn actual_aar_capture_digest_is_recorded() {
    let (root, manifest) = load_pdfbox_manifest();
    let Some(digest) = manifest.actual_selected_entry_digest else {
        return;
    };
    let expected: Value =
        serde_json::from_slice(&read(&root.join("expected/actual-pdfbox-2.0.27.0.json")))
            .expect("valid actual capture");
    let entries = expected["output"]["entries"].clone();
    let encoded = serde_json::to_string(&entries).expect("serialize entries");
    assert_eq!(sha256_hex(encoded.as_bytes()), digest.entries_sha256);
    assert_eq!(
        entries.as_array().expect("entries array").len(),
        digest.count
    );
    assert_eq!(digest.count, 112);
}

#[test]
fn standard_aar_packages_only_selected_bytes() {
    let (root, manifest) = load_pdfbox_manifest();
    let expected = &manifest.cases["synthetic-standard"];
    let temp = TempDir::new().unwrap();
    let output = temp.path().join("nested").join("standard.zip");
    let args = pdfbox_args(
        &root.join("aars/standard.aar"),
        &root.join("gradle-home/single"),
        &output,
    );

    let (result, stdout, stderr) = run_pdfbox(&args);
    result.expect("packaging succeeds");
    let expected_stdout = format!(
        "Packaged {} PDFBox assets into {}\n",
        expected.output.as_ref().unwrap().count,
        output.display()
    );
    assert_eq!(stdout, expected_stdout);
    assert_eq!(stderr, "");
    assert!(expected.output_exists);
    assert_zip_entries(&output, expected.output.as_ref().unwrap());
}

#[test]
fn bzip2_and_lzma_aars_preserve_selected_bytes() {
    let (root, manifest) = load_pdfbox_manifest();
    for label in ["bzip2", "lzma"] {
        let case_name = format!("synthetic-{label}");
        let expected = &manifest.cases[case_name.as_str()];
        let temp = TempDir::new().unwrap();
        let output = temp.path().join(format!("{label}.zip"));
        let args = pdfbox_args(
            &root.join(format!("aars/standard-{label}.aar")),
            &root.join("gradle-home/single"),
            &output,
        );

        let (result, stdout, stderr) = run_pdfbox(&args);
        result.unwrap_or_else(|err| panic!("{label} AAR packaging failed: {err}"));
        let expected_count = expected.output.as_ref().unwrap().count;
        assert_eq!(
            stdout,
            format!(
                "Packaged {expected_count} PDFBox assets into {}\n",
                output.display()
            )
        );
        assert_eq!(stderr, "");
        assert_zip_entries(&output, expected.output.as_ref().unwrap());
        assert_eq!(expected.exit, 0);
    }
}

#[test]
fn zero_assets_removes_existing_output_and_fails() {
    let (root, manifest) = load_pdfbox_manifest();
    let expected = &manifest.cases["synthetic-no-assets"];
    let temp = TempDir::new().unwrap();
    let output = temp.path().join("no-assets.zip");
    fs::write(&output, b"pre-existing garbage").unwrap();

    let (result, stdout, stderr) = run_pdfbox(&pdfbox_args(
        &root.join("aars/no-assets.aar"),
        &root.join("gradle-home/single"),
        &output,
    ));
    let message = error_message(result);
    assert_eq!(stdout, expected.stdout);
    assert_eq!(stderr, "");
    assert_eq!(
        format!("{message}\n"),
        expected
            .stderr
            .replace("<fixtures>", &fixture_root().display().to_string())
    );
    assert!(!output.exists());
    assert!(!expected.output_exists);
    assert_eq!(expected.exit, 1);
}

#[test]
fn empty_aar_fails_without_leaving_output() {
    let (root, manifest) = load_pdfbox_manifest();
    let expected = &manifest.cases["synthetic-empty"];
    let temp = TempDir::new().unwrap();
    let output = temp.path().join("empty.zip");

    let (result, stdout, _) = run_pdfbox(&pdfbox_args(
        &root.join("aars/empty.aar"),
        &root.join("gradle-home/single"),
        &output,
    ));
    let message = error_message(result);
    assert_eq!(stdout, expected.stdout);
    assert_eq!(
        format!("{message}\n"),
        expected
            .stderr
            .replace("<fixtures>", &fixture_root().display().to_string())
    );
    assert!(!output.exists());
}

#[test]
fn corrupt_aar_fails() {
    let (root, _) = load_pdfbox_manifest();
    let temp = TempDir::new().unwrap();
    let output = temp.path().join("corrupt.zip");
    let (result, _, _) = run_pdfbox(&pdfbox_args(
        &root.join("aars/corrupt.aar"),
        &root.join("gradle-home/single"),
        &output,
    ));
    let message = error_message(result);
    assert!(message.contains("failed to read PDFBox AAR"), "{message}");
    assert!(!output.exists());
}

#[test]
fn explicit_missing_aar_matches_python_wording() {
    let (root, manifest) = load_pdfbox_manifest();
    let expected = &manifest.cases["missing-explicit-aar"];
    let temp = TempDir::new().unwrap();
    let absent = temp.path().join("absent.aar");
    let output = temp.path().join("missing.zip");
    let (result, stdout, _) = run_pdfbox(&pdfbox_args(
        &absent,
        &root.join("gradle-home/single"),
        &output,
    ));
    let message = error_message(result);
    assert_eq!(stdout, expected.stdout);
    assert_eq!(
        message,
        format!("Error: Specified AAR file not found: {}", absent.display())
    );
    assert!(!output.exists());
}

#[test]
fn versioned_cache_lookup_uses_requested_version() {
    let (root, manifest) = load_pdfbox_manifest();
    let expected = &manifest.cases["cache-version"];
    let temp = TempDir::new().unwrap();
    let output = temp.path().join("cache-version.zip");
    let args = vec![
        "--gradle-home".to_owned(),
        root.join("gradle-home").display().to_string(),
        "--version".to_owned(),
        "2.0.0".to_owned(),
        "--output".to_owned(),
        output.display().to_string(),
    ];

    let (result, stdout, stderr) = run_pdfbox(&args);
    result.expect("versioned lookup succeeds");
    assert_eq!(stderr, "");
    assert!(stdout.starts_with("Packaged "));
    assert!(stdout.ends_with(&format!(" into {}\n", output.display())));
    assert_zip_entries(&output, expected.output.as_ref().unwrap());
}

#[test]
fn unversioned_cache_lookup_uses_single_match() {
    let (root, manifest) = load_pdfbox_manifest();
    let expected = &manifest.cases["cache-unversioned"];
    let temp = TempDir::new().unwrap();
    let output = temp.path().join("cache-unversioned.zip");
    let args = vec![
        "--gradle-home".to_owned(),
        root.join("gradle-home/single").display().to_string(),
        "--output".to_owned(),
        output.display().to_string(),
    ];

    let (result, _, stderr) = run_pdfbox(&args);
    result.expect("unversioned lookup succeeds");
    assert_eq!(stderr, "");
    assert_zip_entries(&output, expected.output.as_ref().unwrap());
}

#[test]
fn missing_cache_version_matches_python_wording() {
    let (root, manifest) = load_pdfbox_manifest();
    let expected = &manifest.cases["cache-missing-version"];
    let temp = TempDir::new().unwrap();
    let output = temp.path().join("cache-missing.zip");
    let args = vec![
        "--gradle-home".to_owned(),
        root.join("gradle-home").display().to_string(),
        "--version".to_owned(),
        "9.9.9".to_owned(),
        "--output".to_owned(),
        output.display().to_string(),
    ];
    let (result, stdout, _) = run_pdfbox(&args);
    let message = error_message(result);
    assert_eq!(stdout, expected.stdout);
    assert_eq!(format!("{message}\n"), expected.stderr);
    assert!(!output.exists());
}

#[test]
fn gradle_home_is_required_even_when_aar_is_given() {
    let (root, _) = load_pdfbox_manifest();
    let temp = TempDir::new().unwrap();
    let args = vec![
        "--aar".to_owned(),
        root.join("aars/standard.aar").display().to_string(),
        "--output".to_owned(),
        temp.path().join("out.zip").display().to_string(),
    ];
    let (result, _, _) = run_pdfbox(&args);
    assert!(result.is_err());
}

// ---------------------------------------------------------------------------
// Icons
// ---------------------------------------------------------------------------

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct IconManifest {
    patches: IconPatches,
    sources: BTreeMap<String, IconFile>,
    html: BTreeMap<String, IconFile>,
    candidates: BTreeMap<String, IconCandidate>,
    compression_only_variant: IconCandidate,
    regex_contract: Option<IconFile>,
    expected_native: BTreeMap<String, IconExpected>,
}

#[derive(Deserialize)]
struct IconPatches {
    path: String,
}

#[derive(Deserialize)]
struct IconFile {
    path: String,
    sha256: String,
}

#[derive(Deserialize)]
struct IconCandidate {
    path: String,
    sha256: String,
    size: usize,
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct IconExpected {
    summary: String,
    github_output: String,
    stdout: String,
    created: Vec<String>,
    updated: Vec<String>,
    unchanged: Vec<String>,
    skipped: Vec<String>,
}

fn load_icon_manifest() -> (PathBuf, IconManifest) {
    let root = fixture_root().join("icon-sync");
    let path = root.join("manifest.json");
    let manifest = serde_json::from_slice(&read(&path))
        .unwrap_or_else(|err| panic!("failed to parse {}: {err}", path.display()));
    (root, manifest)
}

#[test]
fn icon_fixture_hashes_match_manifest() {
    let (root, manifest) = load_icon_manifest();
    for (name, file) in &manifest.sources {
        assert_eq!(
            sha256_hex(&read(&root.join(&file.path))),
            file.sha256,
            "source {name}"
        );
    }
    for (name, file) in &manifest.html {
        assert_eq!(
            sha256_hex(&read(&root.join(&file.path))),
            file.sha256,
            "html {name}"
        );
    }
    for (name, candidate) in &manifest.candidates {
        let bytes = read(&root.join(&candidate.path));
        assert_eq!(bytes.len(), candidate.size, "candidate size {name}");
        assert_eq!(sha256_hex(&bytes), candidate.sha256, "candidate {name}");
    }
    let variant = read(&root.join(&manifest.compression_only_variant.path));
    assert_eq!(
        sha256_hex(&variant),
        manifest.compression_only_variant.sha256
    );
    if let Some(contract) = &manifest.regex_contract {
        assert_eq!(
            sha256_hex(&read(&root.join(&contract.path))),
            contract.sha256
        );
    }
}

fn icon_patch_list(root: &Path, manifest: &IconManifest) -> PathBuf {
    root.join(&manifest.patches.path)
}

fn icon_args(mode: &str, patches: &Path, icons: &Path) -> Vec<String> {
    vec![
        mode.to_owned(),
        "--patches-list".to_owned(),
        patches.display().to_string(),
        "--icons-dir".to_owned(),
        icons.display().to_string(),
    ]
}

fn seed_icons(icons: &Path, entries: &[(&str, Vec<u8>)]) {
    fs::create_dir_all(icons).unwrap();
    for (name, bytes) in entries {
        fs::write(icons.join(format!("{name}.png")), bytes).unwrap();
    }
}

fn candidate_bytes(root: &Path, manifest: &IconManifest, package: &str) -> Vec<u8> {
    let candidate = &manifest.candidates[package];
    read(&root.join(&candidate.path))
}

fn decode_png_rgba(bytes: &[u8]) -> (u32, u32, Vec<u8>) {
    let decoder = png::Decoder::new(Cursor::new(bytes));
    let mut reader = decoder.read_info().expect("valid PNG");
    let mut buffer = vec![
        0;
        reader
            .output_buffer_size()
            .expect("PNG frame is addressable")
    ];
    let info = reader.next_frame(&mut buffer).expect("decodable PNG");
    assert_eq!(info.color_type, png::ColorType::Rgba);
    assert_eq!(info.bit_depth, png::BitDepth::Eight);
    (
        info.width,
        info.height,
        buffer[..info.buffer_size()].to_vec(),
    )
}

fn assert_icon_matches_candidate(path: &Path, candidate: &[u8]) {
    let bytes = read(path);
    let (width, height, pixels) = decode_png_rgba(&bytes);
    let (expected_width, expected_height, expected_pixels) = decode_png_rgba(candidate);
    assert_eq!((width, height), (128, 128));
    assert_eq!((width, height), (expected_width, expected_height));
    assert_eq!(pixels, expected_pixels, "pixels for {}", path.display());
}

fn read_github_output(path: &Path) -> String {
    String::from_utf8(read(path)).expect("GITHUB_OUTPUT is UTF-8")
}

/// PNG encoding is allowed to differ from Pillow, so the byte count printed
/// after a genuine write legitimately differs while every other stdout token is
/// a compatibility contract.
fn normalize_png_byte_counts(stdout: &str) -> String {
    let mut normalized = String::with_capacity(stdout.len());
    for line in stdout.split_inclusive('\n') {
        if let Some(open) = line.find(" (") {
            if let Some(close_rel) = line[open + 2..].find(" bytes)") {
                let number = &line[open + 2..open + 2 + close_rel];
                if !number.is_empty() && number.bytes().all(|byte| byte.is_ascii_digit()) {
                    normalized.push_str(&line[..open]);
                    normalized.push_str(" (N bytes)");
                    if line.ends_with('\n') {
                        normalized.push('\n');
                    }
                    continue;
                }
            }
        }
        normalized.push_str(line);
    }
    normalized
}

#[derive(Clone)]
struct Route {
    status: u16,
    reason: &'static str,
    content_type: &'static str,
    body: Vec<u8>,
}

impl Route {
    fn ok(body: Vec<u8>, content_type: &'static str) -> Self {
        Self {
            status: 200,
            reason: "OK",
            content_type,
            body,
        }
    }

    fn not_found() -> Self {
        Self {
            status: 404,
            reason: "Not Found",
            content_type: "text/plain",
            body: b"not found".to_vec(),
        }
    }
}

struct TestServer {
    address: std::net::SocketAddr,
    requests: Arc<Mutex<Vec<String>>>,
    shutdown: Arc<AtomicBool>,
    thread: Option<JoinHandle<()>>,
}

impl TestServer {
    fn start<F>(build_routes: F) -> Self
    where
        F: FnOnce(&str) -> BTreeMap<String, Route>,
    {
        let listener = TcpListener::bind("127.0.0.1:0").expect("bind loopback server");
        listener.set_nonblocking(true).unwrap();
        let address = listener.local_addr().unwrap();
        let base = format!("http://{address}");
        let routes = Arc::new(build_routes(&base));
        let requests = Arc::new(Mutex::new(Vec::new()));
        let shutdown = Arc::new(AtomicBool::new(false));
        let thread_requests = Arc::clone(&requests);
        let thread_shutdown = Arc::clone(&shutdown);
        let thread_routes = Arc::clone(&routes);
        let thread = thread::spawn(move || {
            while !thread_shutdown.load(Ordering::Relaxed) {
                match listener.accept() {
                    Ok((stream, _)) => {
                        let _ = handle_connection(stream, &thread_routes, &thread_requests);
                    }
                    Err(err) if err.kind() == std::io::ErrorKind::WouldBlock => {
                        thread::sleep(Duration::from_millis(2));
                    }
                    Err(_) => break,
                }
            }
        });
        Self {
            address,
            requests,
            shutdown,
            thread: Some(thread),
        }
    }

    fn requests(&self) -> Vec<String> {
        self.requests.lock().unwrap().clone()
    }

    fn base_url(&self) -> String {
        format!("http://{}", self.address)
    }
}

impl Drop for TestServer {
    fn drop(&mut self) {
        self.shutdown.store(true, Ordering::Relaxed);
        if let Some(thread) = self.thread.take() {
            let _ = thread.join();
        }
    }
}

fn handle_connection(
    mut stream: TcpStream,
    routes: &BTreeMap<String, Route>,
    requests: &Mutex<Vec<String>>,
) -> std::io::Result<()> {
    // BSD-derived hosts inherit O_NONBLOCK from the listening socket on accept.
    stream.set_nonblocking(false)?;
    stream.set_read_timeout(Some(Duration::from_secs(5)))?;
    stream.set_write_timeout(Some(Duration::from_secs(5)))?;
    let mut reader = BufReader::new(stream.try_clone()?);
    let mut request_line = String::new();
    reader.read_line(&mut request_line)?;
    let mut parts = request_line.split_whitespace();
    let method = parts.next().unwrap_or("");
    let path = parts.next().unwrap_or("/");
    requests.lock().unwrap().push(path.to_owned());
    let mut header = String::new();
    loop {
        header.clear();
        if reader.read_line(&mut header)? == 0 || header == "\r\n" || header == "\n" {
            break;
        }
    }
    if method != "GET" {
        stream.write_all(
            b"HTTP/1.1 405 Method Not Allowed\r\nContent-Length: 0\r\nConnection: close\r\n\r\n",
        )?;
        return Ok(());
    }
    let route = routes
        .get(path)
        .or_else(|| routes.get(path.split(['?', '&']).next().unwrap_or(path)));
    let route = route.cloned().unwrap_or_else(Route::not_found);
    write!(
        stream,
        "HTTP/1.1 {} {}\r\nContent-Type: {}\r\nContent-Length: {}\r\nConnection: close\r\n\r\n",
        route.status,
        route.reason,
        route.content_type,
        route.body.len()
    )?;
    stream.write_all(&route.body)?;
    stream.flush()
}

fn icon_routes(root: &Path, manifest: &IconManifest, base: &str) -> BTreeMap<String, Route> {
    let mut routes = BTreeMap::new();
    for (package, html) in &manifest.html {
        let body = String::from_utf8(read(&root.join(&html.path))).expect("UTF-8 HTML");
        let body = body.replace("{base}", base).into_bytes();
        routes.insert(
            format!("/store/{package}"),
            Route::ok(body, "text/html; charset=utf-8"),
        );
    }
    for (name, source) in &manifest.sources {
        routes.insert(
            format!("/icons/{name}.png"),
            Route::ok(read(&root.join(&source.path)), "image/png"),
        );
    }
    routes.insert(
        "/icons/delta.png".to_owned(),
        Route::ok(read(&root.join("sources/delta-corrupt.bin")), "image/png"),
    );
    routes.insert("/icons/zeta.png".to_owned(), Route::not_found());
    routes
}

#[test]
fn check_only_reports_missing_and_all_present() {
    let (root, manifest) = load_icon_manifest();
    let patches = icon_patch_list(&root, &manifest);
    let temp = TempDir::new().unwrap();

    let icons = temp.path().join("missing");
    seed_icons(
        &icons,
        &[
            ("com.example.alpha", b"alpha".to_vec()),
            ("com.example.beta", Vec::new()),
        ],
    );
    let output = temp.path().join("missing.output");
    let args = icon_args("--check-only", &patches, &icons);
    let (result, stdout, stderr) = run_icons(&args, &output);
    result.expect("check-only always succeeds");
    let expected_missing = [
        "com.example.beta",
        "com.example.delta",
        "com.example.epsilon",
        "com.example.eta",
        "com.example.gamma",
        "com.example.theta",
        "com.example.zeta",
    ];
    assert_eq!(
        stdout,
        format!(
            "Missing icons for {} package(s): {}\n",
            expected_missing.len(),
            expected_missing.join(", ")
        )
    );
    assert_eq!(stderr, "");
    assert_eq!(
        read_github_output(&output),
        format!(
            "has_missing=true\nmissing_packages={}\n",
            expected_missing.join(",")
        )
    );

    let all_icons = temp.path().join("all");
    seed_icons(
        &all_icons,
        &[
            ("com.example.alpha", b"x".to_vec()),
            ("com.example.beta", b"x".to_vec()),
            ("com.example.delta", b"x".to_vec()),
            ("com.example.epsilon", b"x".to_vec()),
            ("com.example.eta", b"x".to_vec()),
            ("com.example.gamma", b"x".to_vec()),
            ("com.example.theta", b"x".to_vec()),
            ("com.example.zeta", b"x".to_vec()),
        ],
    );
    let output = temp.path().join("all.output");
    let (result, stdout, _) = run_icons(&icon_args("--check-only", &patches, &all_icons), &output);
    result.expect("check-only always succeeds");
    assert_eq!(stdout, "All 8 application icons are present.\n");
    assert_eq!(
        read_github_output(&output),
        "has_missing=false\nmissing_packages=\n"
    );
}

#[test]
fn download_missing_creates_icons_and_soft_fails() {
    let (root, manifest) = load_icon_manifest();
    let patches = icon_patch_list(&root, &manifest);
    let temp = TempDir::new().unwrap();
    let icons = temp.path().join("icons");
    seed_icons(
        &icons,
        &[(
            "com.example.epsilon",
            candidate_bytes(&root, &manifest, "com.example.epsilon"),
        )],
    );
    let server = TestServer::start(|base| icon_routes(&root, &manifest, base));
    let output = temp.path().join("download.output");
    let play_prefix = format!("{}/store/", server.base_url());
    let (result, stdout, stderr) = run_icons_at(
        &icon_args("--download-missing", &patches, &icons),
        &output,
        &play_prefix,
    );
    result.expect("download-missing completes");

    let expected = &manifest.expected_native["download-missing"];
    assert_normalized_stdout(&stdout, &expected.stdout, &stderr);
    assert_eq!(read_github_output(&output), expected.github_output);
    for package in &expected.created {
        assert_icon_matches_candidate(
            &icons.join(format!("{package}.png")),
            &candidate_bytes(&root, &manifest, package),
        );
    }
    for package in &expected.skipped {
        assert!(!icons.join(format!("{package}.png")).exists(), "{package}");
    }
    assert!(icons.join("com.example.epsilon.png").exists());
    let base = server.base_url();
    let delta_prefix = format!("[WARN] Failed to process image from {base}/icons/delta.png: ");
    let theta_line = "[WARN] og:image meta tag not found for com.example.theta";
    let zeta_line = format!(
        "[WARN] Failed to download icon image {base}/icons/zeta.png: HTTP Error 404: Not Found"
    );
    let warning_lines: Vec<&str> = stderr.lines().collect();
    assert_eq!(warning_lines.len(), 3, "{stderr}");
    assert!(
        warning_lines[0].starts_with(&delta_prefix),
        "{}",
        warning_lines[0]
    );
    assert_eq!(warning_lines[1], theta_line);
    assert_eq!(warning_lines[2], zeta_line);
    assert!(server
        .requests()
        .iter()
        .any(|path| path == "/icons/eta.png?a=1&b=2"));
}

#[test]
fn sync_all_updates_but_keeps_compression_only_icon_bytes_and_mtime() {
    let (root, manifest) = load_icon_manifest();
    let patches = icon_patch_list(&root, &manifest);
    let temp = TempDir::new().unwrap();
    let icons = temp.path().join("icons");
    let alpha = candidate_bytes(&root, &manifest, "com.example.alpha");
    let epsilon_variant = read(&root.join(&manifest.compression_only_variant.path));
    seed_icons(
        &icons,
        &[
            ("com.example.alpha", alpha.clone()),
            ("com.example.beta", b"old beta".to_vec()),
            ("com.example.delta", b"old delta".to_vec()),
            ("com.example.epsilon", epsilon_variant.clone()),
            ("com.example.gamma", b"old gamma".to_vec()),
            ("com.example.theta", b"old theta".to_vec()),
            ("com.example.zeta", b"old zeta".to_vec()),
        ],
    );

    let epsilon_path = icons.join("com.example.epsilon.png");
    let old_time = SystemTime::UNIX_EPOCH + Duration::from_secs(1_600_000_000);
    let epsilon_file = File::options().write(true).open(&epsilon_path).unwrap();
    epsilon_file
        .set_times(FileTimes::new().set_modified(old_time))
        .unwrap();
    drop(epsilon_file);
    let before = fs::metadata(&epsilon_path).unwrap().modified().unwrap();

    let server = TestServer::start(|base| icon_routes(&root, &manifest, base));
    let output = temp.path().join("sync.output");
    let play_prefix = format!("{}/store/", server.base_url());
    let (result, stdout, stderr) = run_icons_at(
        &icon_args("--sync-all", &patches, &icons),
        &output,
        &play_prefix,
    );
    result.expect("sync-all completes");

    let expected = &manifest.expected_native["sync-all"];
    assert_normalized_stdout(&stdout, &expected.stdout, &stderr);
    assert_eq!(read_github_output(&output), expected.github_output);
    assert!(expected.github_output.contains(expected.summary.as_str()));

    assert_eq!(read(&icons.join("com.example.alpha.png")), alpha);
    for package in &expected.updated {
        assert_icon_matches_candidate(
            &icons.join(format!("{package}.png")),
            &candidate_bytes(&root, &manifest, package),
        );
    }
    for package in &expected.created {
        assert_icon_matches_candidate(
            &icons.join(format!("{package}.png")),
            &candidate_bytes(&root, &manifest, package),
        );
    }
    for package in &expected.unchanged {
        assert!(icons.join(format!("{package}.png")).exists(), "{package}");
    }
    assert_eq!(read(&epsilon_path), epsilon_variant);
    let metadata = fs::metadata(&epsilon_path).unwrap();
    assert_eq!(metadata.modified().unwrap(), before);
    for (package, original) in [
        ("com.example.delta", b"old delta".to_vec()),
        ("com.example.theta", b"old theta".to_vec()),
        ("com.example.zeta", b"old zeta".to_vec()),
    ] {
        assert_eq!(
            read(&icons.join(format!("{package}.png"))),
            original,
            "skipped {package} must not be rewritten"
        );
    }
    assert!(server
        .requests()
        .iter()
        .any(|path| path == "/icons/eta.png?a=1&b=2"));
    let base = server.base_url();
    let warning_lines: Vec<&str> = stderr.lines().collect();
    assert_eq!(warning_lines.len(), 3, "{stderr}");
    assert!(
        warning_lines[0].starts_with(&format!(
            "[WARN] Failed to process image from {base}/icons/delta.png: "
        )),
        "{}",
        warning_lines[0]
    );
    assert_eq!(
        warning_lines[1],
        "[WARN] og:image meta tag not found for com.example.theta"
    );
    assert_eq!(
        warning_lines[2],
        format!(
            "[WARN] Failed to download icon image {base}/icons/zeta.png: HTTP Error 404: Not Found"
        )
    );
}

#[test]
fn download_missing_with_nothing_to_do_reports_no_changes() {
    let (root, manifest) = load_icon_manifest();
    let patches = icon_patch_list(&root, &manifest);
    let temp = TempDir::new().unwrap();
    let icons = temp.path().join("icons");
    let packages = [
        "com.example.alpha",
        "com.example.beta",
        "com.example.delta",
        "com.example.epsilon",
        "com.example.eta",
        "com.example.gamma",
        "com.example.theta",
        "com.example.zeta",
    ];
    seed_icons(
        &icons,
        &packages.map(|package| (package, b"present".to_vec())),
    );
    let output = temp.path().join("none.output");
    let (result, stdout, stderr) =
        run_icons(&icon_args("--download-missing", &patches, &icons), &output);
    result.expect("no-op succeeds");
    assert_eq!(stdout, "No packages need icon updates.\n");
    assert_eq!(stderr, "");
    assert_eq!(
        read_github_output(&output),
        "changes_detected=false\nsummary=No changes detected.\n"
    );
}

#[test]
fn missing_or_malformed_patches_list_fails() {
    let temp = TempDir::new().unwrap();
    let icons = temp.path().join("icons");
    let output = temp.path().join("missing.output");
    let absent = temp.path().join("absent.json");
    let (result, stdout, _) = run_icons(&icon_args("--check-only", &absent, &icons), &output);
    assert_eq!(stdout, "");
    assert!(error_message(result).contains("Patches list not found:"));

    let malformed = temp.path().join("malformed.json");
    fs::write(&malformed, b"{not json").unwrap();
    let (result, _, _) = run_icons(&icon_args("--check-only", &malformed, &icons), &output);
    assert!(error_message(result).contains("failed to parse patches list"));
}

#[test]
fn exactly_one_mode_is_required() {
    let (root, manifest) = load_icon_manifest();
    let patches = icon_patch_list(&root, &manifest);
    let temp = TempDir::new().unwrap();
    let icons = temp.path().join("icons");
    let output = temp.path().join("mode.output");

    let (result, _, _) = run_icons(&icon_args("--check-only", &patches, &icons), &output);
    result.expect("one mode");
    fs::remove_file(&output).unwrap();
    let mut both = icon_args("--check-only", &patches, &icons);
    both.push("--sync-all".to_owned());
    let (result, _, _) = run_icons(&both, &output);
    assert!(result.is_err());
    let (result, _, _) = run_icons(&[], &output);
    assert!(result.is_err());
}

#[test]
fn compression_variant_decodes_to_candidate_pixels() {
    let (root, manifest) = load_icon_manifest();
    let variant = read(&root.join(&manifest.compression_only_variant.path));
    let candidate = candidate_bytes(&root, &manifest, "com.example.epsilon");
    assert_ne!(variant, candidate);
    let (_, _, variant_pixels) = decode_png_rgba(&variant);
    let (_, _, candidate_pixels) = decode_png_rgba(&candidate);
    assert_eq!(variant_pixels, candidate_pixels);
}
