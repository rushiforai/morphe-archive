//! Frozen plan-006 asset baseline contracts.
//!
//! These fixtures were captured independently from the original Python
//! generators through a frozen private helper before any native asset module
//! replaced them. The test is deliberately about the captured contracts, not
//! about CLI wiring or default feature flags:
//!
//! * every committed fixture must match its recorded SHA-256 and size;
//! * altered bytes must be rejected, including through the filesystem path;
//! * the shared tiny font fixture must preserve the exact Python output bytes,
//!   the OpenType checksum invariant, and native `transform_font` output;
//! * the shared PDFBox AAR must yield exactly the Python-captured member names
//!   and content hashes through an independent ZIP reader, and native
//!   packaging must consume the same member set;
//! * the existing native icon transform must reproduce the Pillow RGBA bytes
//!   captured for the offline image-conversion fixture.
//!
//! Large real fonts/models and Play originals stay in the private read-only
//! migration cache; only their digests are recorded here. Missing originals
//! block deleting the Python generators, but they are not committed.

use std::collections::BTreeSet;
use std::fs;
use std::io::Read as _;
use std::path::{Path, PathBuf};

use asset_prep::font::transform_font;
use asset_prep::{transform_icon, ICON_SIZE};
use flate2::read::DeflateDecoder;
use serde::Deserialize;
use serde_json::Value;
use sha2::{Digest, Sha256};

const CONTRACTS_PATH: &str = "contracts.json";

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Contracts {
    schema_version: u32,
    kind: String,
    capture: Capture,
    private_assets: std::collections::BTreeMap<String, PrivateAsset>,
    workloads: Vec<WorkloadContract>,
    fixtures: Vec<Fixture>,
    native_expectations: NativeExpectations,
    reproduction: Value,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Capture {
    source_revision: String,
    captured_at: String,
    python_version: String,
    pillow_version: String,
    frozen_interpreter: String,
    helper_path: String,
    helper_sha256: String,
    helper_size_bytes: u64,
    source_scripts: std::collections::BTreeMap<String, String>,
    capture_commands: Vec<String>,
    notes: String,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct PrivateAsset {
    label: String,
    sha256: String,
    size_bytes: u64,
    network_used: bool,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct WorkloadContract {
    id: String,
    command: String,
    exit_code: i32,
    stdout_sha256: String,
    network: bool,
    argv_template: Vec<String>,
    staged_files: Vec<StagedFileContract>,
    staged_input_roles: Vec<String>,
    input_roles: Vec<String>,
    semantic: Value,
    function_stdout: String,
    function_stderr: String,
    source_script_sha256: String,
    expected_files: Vec<ExpectedFile>,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct StagedFileContract {
    input_role: String,
    path: String,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct ExpectedFile {
    path: String,
    sha256: String,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Fixture {
    path: String,
    role: String,
    sha256: String,
    size_bytes: u64,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct NativeExpectations {
    image: ImageExpectation,
    font: FontExpectation,
    pdfbox: PdfboxExpectation,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct ImageExpectation {
    source: String,
    expected_rgba: String,
    width: u32,
    height: u32,
    rgba_sha256: String,
    capture_command: String,
    note: String,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct FontExpectation {
    input: String,
    expected_output: String,
    manifest: String,
    note: String,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct PdfboxExpectation {
    aar: String,
    manifest: String,
    reference_case: String,
    note: String,
}

fn fixture_root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/baseline")
}

fn load_contracts() -> Contracts {
    let path = fixture_root().join(CONTRACTS_PATH);
    let bytes = fs::read(&path).unwrap_or_else(|error| {
        panic!("cannot read {}: {error}", path.display());
    });
    serde_json::from_slice(&bytes).unwrap_or_else(|error| {
        panic!("invalid contracts {}: {error}", path.display());
    })
}

fn sha256(bytes: &[u8]) -> String {
    let mut hasher = Sha256::new();
    hasher.update(bytes);
    let digest = hasher.finalize();
    let mut text = String::with_capacity(64);
    for byte in digest {
        use std::fmt::Write as _;
        write!(text, "{byte:02x}").expect("writing to a String cannot fail");
    }
    text
}

fn read_fixture(relative: &str) -> Vec<u8> {
    let path = fixture_root().join(relative);
    fs::read(&path).unwrap_or_else(|error| {
        panic!("cannot read fixture {}: {error}", path.display());
    })
}

fn verify_fixture_bytes(fixture: &Fixture, bytes: &[u8]) -> Result<(), String> {
    if bytes.len() as u64 != fixture.size_bytes {
        return Err(format!(
            "fixture '{}' size is {}, expected {}",
            fixture.path,
            bytes.len(),
            fixture.size_bytes
        ));
    }
    let actual = sha256(bytes);
    if actual != fixture.sha256 {
        return Err(format!(
            "fixture '{}' sha256 is {actual}, expected {}",
            fixture.path, fixture.sha256
        ));
    }
    Ok(())
}

fn verify_fixture_file(root: &Path, fixture: &Fixture) -> Result<(), String> {
    let path = root.join(&fixture.path);
    let bytes = fs::read(&path).map_err(|error| {
        format!(
            "cannot read fixture '{}' at {}: {error}",
            fixture.path,
            path.display()
        )
    })?;
    verify_fixture_bytes(fixture, &bytes)
}

fn is_lower_hex_sha256(value: &str) -> bool {
    value.len() == 64
        && value
            .bytes()
            .all(|byte| matches!(byte, b'0'..=b'9' | b'a'..=b'f'))
}

fn assert_rejected(name: &str, result: Result<(), String>) {
    let error = match result {
        Ok(()) => panic!("{name} must be rejected"),
        Err(error) => error,
    };
    assert!(
        error.contains("sha256") || error.contains("size"),
        "{name} rejection should name the hash/size mismatch, got: {error}"
    );
}

#[test]
fn contracts_cover_six_independently_captured_offline_workloads() {
    let contracts = load_contracts();
    assert_eq!(contracts.schema_version, 1);
    assert_eq!(contracts.kind, "asset-prep-baseline-contracts");
    assert_eq!(contracts.capture.python_version, "3.12.14");
    assert_eq!(contracts.capture.pillow_version, "11.3.0");
    assert_eq!(contracts.capture.source_revision.len(), 40);
    assert!(!contracts.capture.captured_at.is_empty());
    assert!(contracts
        .capture
        .frozen_interpreter
        .contains("icons-reference/.venv/bin/python"));
    assert!(contracts.capture.helper_path.ends_with("asset_oracle.py"));
    assert!(is_lower_hex_sha256(&contracts.capture.helper_sha256));
    assert!(contracts.capture.helper_size_bytes > 0);
    assert!(!contracts.capture.notes.is_empty());
    assert_eq!(
        contracts
            .capture
            .source_scripts
            .keys()
            .cloned()
            .collect::<BTreeSet<_>>(),
        BTreeSet::from([
            "prepare_emoji_font.py".to_string(),
            "prepare_ocr_model.py".to_string(),
            "prepare_pdfbox_assets.py".to_string(),
            "sync_app_icons.py".to_string(),
        ])
    );
    for (name, digest) in &contracts.capture.source_scripts {
        assert!(
            is_lower_hex_sha256(digest),
            "source script {name} digest must be a lowercase sha256"
        );
    }
    assert_eq!(
        contracts.capture.capture_commands.len(),
        6,
        "one capture command per workload"
    );
    for command in &contracts.capture.capture_commands {
        assert!(
            command.contains("asset_oracle.py"),
            "capture command must exercise the frozen helper: {command}"
        );
    }

    let expected_ids = BTreeSet::from([
        "assets.font.transform",
        "assets.font.cache-hit",
        "assets.ocr.cache-hit",
        "assets.pdfbox.package",
        "assets.icons.check",
        "assets.icons.convert",
    ]);
    let ids: BTreeSet<&str> = contracts
        .workloads
        .iter()
        .map(|workload| workload.id.as_str())
        .collect();
    assert_eq!(ids, expected_ids, "all six asset workloads must be frozen");

    for workload in &contracts.workloads {
        assert!(
            !workload.network,
            "{} must not use the network",
            workload.id
        );
        assert_eq!(workload.exit_code, 0, "{}", workload.id);
        assert!(
            is_lower_hex_sha256(&workload.stdout_sha256),
            "{} stdout pin",
            workload.id
        );
        assert!(!workload.argv_template.is_empty(), "{}", workload.id);
        let argv = workload.argv_template.join(" ");
        assert!(
            !argv.to_ascii_lowercase().contains("http"),
            "{} must not carry a network URL",
            workload.id
        );
        assert!(
            !workload.function_stderr.contains("Downloading"),
            "{} captured a download path",
            workload.id
        );
        assert!(
            is_lower_hex_sha256(&workload.source_script_sha256),
            "{} source script pin",
            workload.id
        );

        let staged_roles: BTreeSet<&str> = workload
            .staged_input_roles
            .iter()
            .map(String::as_str)
            .collect();
        let declared_roles: BTreeSet<&str> =
            workload.input_roles.iter().map(String::as_str).collect();
        assert!(
            !staged_roles.is_empty(),
            "{} must stage a verified input",
            workload.id
        );
        for staged in &workload.staged_files {
            assert!(
                declared_roles.contains(staged.input_role.as_str()),
                "{} stages undeclared role {}",
                workload.id,
                staged.input_role
            );
            assert!(
                !staged.path.is_empty()
                    && !staged.path.starts_with('/')
                    && !staged.path.split('/').any(|part| part == ".."),
                "{} has an unsafe staged destination {}",
                workload.id,
                staged.path
            );
        }
        assert_eq!(
            staged_roles,
            workload
                .staged_files
                .iter()
                .map(|staged| staged.input_role.as_str())
                .collect::<BTreeSet<_>>()
        );
    }

    for (role, asset) in &contracts.private_assets {
        assert!(!asset.label.is_empty(), "{role} label");
        assert!(is_lower_hex_sha256(&asset.sha256), "{role} sha256");
        assert!(asset.size_bytes > 0, "{role} size");
        assert!(!asset.network_used, "{role} must be an offline cache hit");
    }
    assert_eq!(
        contracts.private_assets["rawFont"].sha256,
        "e37c7af6265ac4a0af6d57bc65e86109a776d9966e8343334557f63da482516f"
    );
    assert_eq!(contracts.private_assets["rawFont"].size_bytes, 115_969_256);
    assert_eq!(
        contracts.private_assets["processedFont"].sha256,
        "c75b8bb062f4001ecacfd62ec843918096e1dcd12a0260be9e13168021fa2208"
    );
    assert_eq!(
        contracts.private_assets["processedFont"].size_bytes,
        38_369_120
    );
    assert_eq!(
        contracts.private_assets["ocrModel"].sha256,
        "7d4322bd2a7749724879683fc3912cb542f19906c83bcc1a52132556427170b2"
    );
    assert_eq!(contracts.private_assets["ocrModel"].size_bytes, 4_113_088);
    assert_eq!(
        contracts.private_assets["pdfboxAar"].sha256,
        "30277f879cfd571db2a137582c95516a0d4ea6778e945519bc58ca93d57d88c7"
    );
    assert_eq!(
        contracts.private_assets["playSourceImage"].sha256,
        "092d44f68a9ca353250a36e16b3e997c640b38deacbfe94ebc686078e19273aa"
    );

    assert!(contracts.reproduction["benchPrepare"]
        .as_str()
        .expect("benchPrepare reproduction command")
        .contains("assets-baseline.manifest.local.json"));
    assert!(contracts.reproduction["benchTimed"]
        .as_str()
        .expect("benchTimed note")
        .contains("future native bench child"));
}

#[test]
fn committed_fixtures_match_the_independent_capture() {
    let contracts = load_contracts();
    let root = fixture_root();
    for fixture in &contracts.fixtures {
        verify_fixture_file(&root, fixture).unwrap_or_else(|error| panic!("{error}"));
    }
    assert!(contracts.fixtures.len() >= 8);
    assert!(contracts
        .fixtures
        .iter()
        .all(|fixture| !fixture.role.is_empty()));
}

#[test]
fn altered_fixture_content_is_rejected_by_hash_and_filesystem_paths() {
    let contracts = load_contracts();
    for fixture in &contracts.fixtures {
        let mut bytes = read_fixture(&fixture.path);
        assert!(!bytes.is_empty(), "{}", fixture.path);
        bytes[0] ^= 0xFF;
        assert_rejected(&fixture.path, verify_fixture_bytes(fixture, &bytes));

        // Reintroduce a size mismatch independently of the hash check.
        bytes.push(0);
        assert_rejected(&fixture.path, verify_fixture_bytes(fixture, &bytes));
    }

    // Exercise the real filesystem path with a mutated copy of the tree.
    let temp = tempfile::tempdir().expect("temp dir");
    let source_root = fixture_root();
    for entry in fs::read_dir(&source_root).expect("fixture root") {
        let entry = entry.expect("fixture entry");
        let target = temp.path().join(entry.file_name());
        if entry.path().is_dir() {
            copy_dir(&entry.path(), &target);
        } else {
            fs::copy(entry.path(), target).expect("copy fixture file");
        }
    }
    let mutated = contracts
        .fixtures
        .iter()
        .find(|fixture| fixture.path == "image/expected.rgba")
        .expect("image fixture");
    let path = temp.path().join(&mutated.path);
    let mut bytes = fs::read(&path).expect("read mutated fixture");
    let last = bytes.len() - 1;
    bytes[last] ^= 0x01;
    fs::write(&path, bytes).expect("write mutated fixture");
    assert_rejected(
        "filesystem fixture",
        verify_fixture_file(temp.path(), mutated),
    );
}

fn copy_dir(source: &Path, destination: &Path) {
    fs::create_dir_all(destination).expect("create fixture dir");
    for entry in fs::read_dir(source).expect("read fixture dir") {
        let entry = entry.expect("fixture dir entry");
        let target = destination.join(entry.file_name());
        if entry.path().is_dir() {
            copy_dir(&entry.path(), &target);
        } else {
            fs::copy(entry.path(), target).expect("copy fixture");
        }
    }
}

#[test]
fn shared_font_fixture_preserves_python_bytes_and_native_output() {
    let contracts = load_contracts();
    let font = &contracts.native_expectations.font;
    let manifest: Value = serde_json::from_slice(&read_fixture(&font.manifest))
        .expect("shared font fixture manifest");
    assert_eq!(
        manifest["python_transform"]["sha256"].as_str(),
        Some(contracts.capture.source_scripts["prepare_emoji_font.py"].as_str())
    );
    let input_meta = &manifest["fixtures"]["tiny-input.ttf"];
    let output_meta = &manifest["fixtures"]["tiny-expected.ttf"];

    let input = read_fixture(&font.input);
    let expected = read_fixture(&font.expected_output);
    assert_eq!(
        input.len() as u64,
        input_meta["size"].as_u64().expect("input size")
    );
    assert_eq!(
        sha256(&input),
        input_meta["sha256"].as_str().expect("input sha256")
    );
    assert_eq!(
        expected.len() as u64,
        output_meta["size"].as_u64().expect("output size")
    );
    assert_eq!(
        sha256(&expected),
        output_meta["sha256"].as_str().expect("output sha256")
    );
    assert_ne!(input, expected, "transform must produce a distinct font");

    let native = transform_font(&input).expect("native transform accepts the shared fixture");
    assert_eq!(
        native, expected,
        "native transform must reproduce every Python output byte"
    );

    let padded = {
        let mut bytes = expected.clone();
        while !bytes.len().is_multiple_of(4) {
            bytes.push(0);
        }
        bytes
    };
    let mut sum: u32 = 0;
    for chunk in padded.chunks_exact(4) {
        sum = sum.wrapping_add(u32::from_be_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]));
    }
    assert_eq!(sum, asset_prep::font::OPENTYPE_CHECKSUM_MAGIC);

    // The reassembled SFNT directory must be sorted, aligned and in-bounds.
    let num_tables = u16::from_be_bytes([expected[4], expected[5]]) as usize;
    assert!(num_tables > 0, "shared font has no tables");
    let mut previous: Option<[u8; 4]> = None;
    let directory_end = 12 + num_tables * 16;
    for (index, record) in expected[12..directory_end].chunks_exact(16).enumerate() {
        let tag: [u8; 4] = record[0..4].try_into().expect("table tag");
        if let Some(previous) = previous {
            assert!(previous < tag, "table tags must be strictly sorted");
        }
        previous = Some(tag);
        let offset = u32::from_be_bytes(record[8..12].try_into().unwrap()) as usize;
        let length = u32::from_be_bytes(record[12..16].try_into().unwrap()) as usize;
        assert_eq!(offset % 4, 0, "table data must be four-byte aligned");
        assert!(
            offset + length <= expected.len(),
            "table {index} extends past the font"
        );
    }
    assert!(!font.note.is_empty());
}

#[test]
fn shared_pdfbox_fixture_matches_an_independent_zip_reader() {
    let contracts = load_contracts();
    let expected = &contracts.native_expectations.pdfbox;
    let manifest: Value = serde_json::from_slice(&read_fixture(&expected.manifest))
        .expect("shared pdfbox fixture manifest");
    assert_eq!(
        manifest["reference"]["pdfboxScriptSha256"].as_str(),
        Some(contracts.capture.source_scripts["prepare_pdfbox_assets.py"].as_str())
    );

    let aar = read_fixture(&expected.aar);
    assert_eq!(
        sha256(&aar),
        manifest["fixtures"]["aars"]["standard.aar"]["sha256"]
            .as_str()
            .expect("standard AAR pin")
    );

    let case: Value = serde_json::from_slice(&read_fixture(&expected.reference_case))
        .expect("shared Python PDFBox case");
    let mut expected_members: Vec<(String, u64, String)> = case["output"]["entries"]
        .as_array()
        .expect("reference entries")
        .iter()
        .filter(|entry| entry["directory"].as_bool() == Some(false))
        .map(|entry| {
            (
                entry["name"].as_str().expect("member name").to_string(),
                entry["size"].as_u64().expect("member size"),
                entry["sha256"].as_str().expect("member sha").to_string(),
            )
        })
        .collect();
    expected_members.sort_by(|left, right| left.0.cmp(&right.0));

    let mut actual: Vec<(String, Vec<u8>)> = read_local_zip_members(&aar)
        .into_iter()
        .filter(|(name, _)| !name.ends_with('/'))
        .filter_map(|(name, data)| {
            name.strip_prefix("assets/")
                .filter(|relative| relative.starts_with("com/tom_roush/"))
                .map(|relative| (relative.to_string(), data))
        })
        .collect();
    actual.sort_by(|left, right| left.0.cmp(&right.0));

    assert_eq!(actual.len(), expected_members.len());
    for ((name, data), (expected_name, expected_size, expected_sha)) in
        actual.iter().zip(&expected_members)
    {
        assert_eq!(name, expected_name);
        assert_eq!(data.len() as u64, *expected_size);
        assert_eq!(&sha256(data), expected_sha);
        assert!(
            !name.starts_with("assets/"),
            "entries must be stored relative to assets/"
        );
    }
    assert!(expected_members
        .iter()
        .all(|(name, _, _)| name.starts_with("com/tom_roush/")));

    // Native packaging must produce the same consumed member set. Container
    // timestamps/compression bytes are explicitly outside the contract.
    let temp = tempfile::tempdir().expect("temp dir");
    let output = temp.path().join("standard.zip");
    let args = vec![
        "--gradle-home".to_string(),
        fixture_root()
            .join("../pdfbox/gradle-home/single")
            .display()
            .to_string(),
        "--aar".to_string(),
        fixture_root().join(&expected.aar).display().to_string(),
        "--output".to_string(),
        output.display().to_string(),
    ];
    let mut stdout = Vec::new();
    let mut stderr = Vec::new();
    asset_prep::pdfbox::run_with(&args, &mut stdout, &mut stderr)
        .expect("native PDFBox packaging must succeed");
    assert!(stderr.is_empty(), "native PDFBox wrote diagnostics");
    let packaged = fs::read(&output).expect("native PDFBox output");
    let mut native: Vec<(String, Vec<u8>)> = read_local_zip_members(&packaged)
        .into_iter()
        .filter(|(name, _)| !name.ends_with('/'))
        .collect();
    native.sort_by(|left, right| left.0.cmp(&right.0));
    assert_eq!(native.len(), expected_members.len());
    for ((name, data), (expected_name, expected_size, expected_sha)) in
        native.iter().zip(&expected_members)
    {
        assert_eq!(name, expected_name);
        assert_eq!(data.len() as u64, *expected_size);
        assert_eq!(&sha256(data), expected_sha);
    }
    assert!(!expected.note.is_empty());
}

fn read_local_zip_members(bytes: &[u8]) -> Vec<(String, Vec<u8>)> {
    fn u16_at(bytes: &[u8], offset: usize) -> u16 {
        u16::from_le_bytes([bytes[offset], bytes[offset + 1]])
    }
    fn u32_at(bytes: &[u8], offset: usize) -> u32 {
        u32::from_le_bytes([
            bytes[offset],
            bytes[offset + 1],
            bytes[offset + 2],
            bytes[offset + 3],
        ])
    }

    // Locate the End Of Central Directory record. Reading through the central
    // directory keeps this independent of whether a writer emitted a data
    // descriptor in the local header.
    let eocd = (0..=bytes.len().saturating_sub(22))
        .rev()
        .find(|offset| *offset + 22 <= bytes.len() && u32_at(bytes, *offset) == 0x0605_4b50)
        .expect("ZIP end-of-central-directory record");
    let total_entries = u16_at(bytes, eocd + 10) as usize;
    let mut offset = u32_at(bytes, eocd + 16) as usize;

    let mut members = Vec::with_capacity(total_entries);
    for _ in 0..total_entries {
        assert_eq!(
            u32_at(bytes, offset),
            0x0201_4b50,
            "central directory entry"
        );
        let method = u16_at(bytes, offset + 10);
        let compressed_size = u32_at(bytes, offset + 20) as usize;
        let uncompressed_size = u32_at(bytes, offset + 24) as usize;
        let name_len = u16_at(bytes, offset + 28) as usize;
        let extra_len = u16_at(bytes, offset + 30) as usize;
        let comment_len = u16_at(bytes, offset + 32) as usize;
        let local_offset = u32_at(bytes, offset + 42) as usize;
        let name_start = offset + 46;
        let name = String::from_utf8(bytes[name_start..name_start + name_len].to_vec())
            .expect("ZIP member name is UTF-8");

        // The local header gives the exact start of the member data; the
        // central directory supplies the authoritative compressed size.
        assert_eq!(u32_at(bytes, local_offset), 0x0403_4b50, "local ZIP header");
        let local_name_len = u16_at(bytes, local_offset + 26) as usize;
        let local_extra_len = u16_at(bytes, local_offset + 28) as usize;
        let data_start = local_offset + 30 + local_name_len + local_extra_len;
        let data_end = data_start + compressed_size;
        assert!(data_end <= bytes.len(), "truncated ZIP member");
        let raw = &bytes[data_start..data_end];
        let data = match method {
            0 => raw.to_vec(),
            8 => {
                let mut decoder = DeflateDecoder::new(raw);
                let mut decoded = Vec::with_capacity(uncompressed_size);
                decoder
                    .read_to_end(&mut decoded)
                    .expect("inflate ZIP member");
                decoded
            }
            other => panic!("unsupported fixture ZIP compression method {other}"),
        };
        assert_eq!(data.len(), uncompressed_size, "ZIP member size");
        members.push((name, data));
        offset = name_start + name_len + extra_len + comment_len;
    }
    members
}

#[test]
fn native_icon_transform_reproduces_the_pillow_rgba_contract() {
    let contracts = load_contracts();
    let expectation = &contracts.native_expectations.image;
    let source = read_fixture(&expectation.source);
    let expected_rgba = read_fixture(&expectation.expected_rgba);
    let icon = transform_icon(&source).expect("native transform must accept the fixture");
    assert_eq!(icon.width, ICON_SIZE);
    assert_eq!(icon.height, ICON_SIZE);
    assert_eq!(icon.width, expectation.width);
    assert_eq!(icon.height, expectation.height);
    assert_eq!(icon.rgba.len(), expected_rgba.len());
    assert_eq!(sha256(&expected_rgba), expectation.rgba_sha256);
    assert_eq!(sha256(&icon.rgba), expectation.rgba_sha256);
    assert_eq!(
        icon.rgba, expected_rgba,
        "every decoded RGBA byte must match Pillow"
    );
    assert!(!icon.png.is_empty(), "native encoder must emit a PNG");
    assert!(!expectation.capture_command.is_empty());
    assert!(!expectation.note.is_empty());
}

#[test]
fn captured_workload_semantics_match_the_recorded_contracts() {
    let contracts = load_contracts();
    let by_id: std::collections::BTreeMap<&str, &WorkloadContract> = contracts
        .workloads
        .iter()
        .map(|workload| (workload.id.as_str(), workload))
        .collect();

    for (id, expected_command) in [
        ("assets.font.transform", "font-transform"),
        ("assets.font.cache-hit", "font-cache-hit"),
        ("assets.ocr.cache-hit", "ocr-cache-hit"),
        ("assets.pdfbox.package", "pdfbox-package"),
        ("assets.icons.check", "icon-check"),
        ("assets.icons.convert", "image-convert"),
    ] {
        let workload = by_id[id];
        assert_eq!(workload.command, expected_command);
        let capture_path = format!("captures/{id}.json");
        let capture: Value =
            serde_json::from_slice(&read_fixture(&capture_path)).expect("capture JSON");
        assert_eq!(capture["command"].as_str(), Some(expected_command));
        assert_eq!(capture["exitCode"].as_i64(), Some(0));
        assert_eq!(
            capture["capture"]["helperSha256"].as_str(),
            Some(contracts.capture.helper_sha256.as_str())
        );
        assert_eq!(
            capture["capture"]["pythonVersion"].as_str(),
            Some(contracts.capture.python_version.as_str())
        );
        assert_eq!(capture["semantic"], workload.semantic);
        assert_eq!(
            capture["functionStdout"].as_str(),
            Some(workload.function_stdout.as_str())
        );
        assert_eq!(
            capture["functionStderr"].as_str(),
            Some(workload.function_stderr.as_str())
        );
        assert_eq!(
            capture["sourceScriptSha256"].as_str(),
            Some(workload.source_script_sha256.as_str())
        );
        assert_eq!(sha256(&read_fixture(&capture_path)), workload.stdout_sha256);
    }

    let font = &by_id["assets.font.transform"].semantic;
    assert_eq!(
        font["outputSha256"].as_str(),
        Some(contracts.private_assets["processedFont"].sha256.as_str())
    );
    assert_eq!(font["outputSize"].as_u64(), Some(38_369_120));
    assert_eq!(font["verifyProcessedFont"].as_bool(), Some(true));
    assert_eq!(font["sfntChecksumMagic"].as_str(), Some("b1b0afba"));
    let cache_hit = &by_id["assets.font.cache-hit"].semantic;
    assert_eq!(cache_hit["mode"].as_str(), Some("cache-hit"));
    assert_eq!(
        cache_hit["outputSha256"].as_str(),
        Some(contracts.private_assets["processedFont"].sha256.as_str())
    );

    let ocr = &by_id["assets.ocr.cache-hit"].semantic;
    assert_eq!(
        ocr["outputSha256"].as_str(),
        Some(contracts.private_assets["ocrModel"].sha256.as_str())
    );
    assert_eq!(
        ocr["outputSize"].as_u64(),
        Some(contracts.private_assets["ocrModel"].size_bytes)
    );
    assert_eq!(ocr["matchesExpectedSha256"].as_bool(), Some(true));
    assert_eq!(ocr["matchesExpectedSize"].as_bool(), Some(true));

    let pdfbox = &by_id["assets.pdfbox.package"].semantic;
    let members = pdfbox["members"].as_array().expect("pdfbox members");
    assert_eq!(pdfbox["memberCount"].as_u64(), Some(112));
    assert_eq!(members.len(), 112);
    let names: Vec<&str> = members
        .iter()
        .map(|member| member["name"].as_str().expect("member name"))
        .collect();
    let mut sorted = names.clone();
    sorted.sort_unstable();
    assert_eq!(names, sorted, "member names must be sorted");
    assert!(names.iter().all(|name| name.starts_with("com/tom_roush/")));
    assert!(pdfbox.get("outputSha256").is_none());
    assert!(pdfbox.get("outputSize").is_none());

    let icons = &by_id["assets.icons.check"].semantic;
    assert_eq!(icons["packageCount"].as_u64(), Some(14));
    assert_eq!(icons["hasMissing"].as_bool(), Some(false));
    assert_eq!(
        icons["githubOutputs"]["has_missing"].as_str(),
        Some("false")
    );
    assert_eq!(
        icons["githubOutputs"]["missing_packages"].as_str(),
        Some("")
    );

    let image = &by_id["assets.icons.convert"].semantic;
    assert_eq!(image["width"].as_u64(), Some(128));
    assert_eq!(image["height"].as_u64(), Some(128));
    let play_source_sha = contracts.private_assets["playSourceImage"].sha256.as_str();
    assert_eq!(image["sourceSha256"].as_str(), Some(play_source_sha));
    assert_eq!(
        image["sourceSize"].as_u64(),
        Some(contracts.private_assets["playSourceImage"].size_bytes)
    );
    assert!(image["pngSize"].as_u64().expect("png size") > 0);

    // The conversion capture used the private Play original rather than the
    // committed synthetic source, so compare it with plan 011's independently
    // recorded RGBA pin for that exact input.
    let corpus: Value = serde_json::from_slice(
        &fs::read(
            Path::new(env!("CARGO_MANIFEST_DIR"))
                .join("tests/fixtures/baseline/required-corpus.json"),
        )
        .expect("plan 011 icon corpus"),
    )
    .expect("plan 011 icon corpus json");
    let corpus_case = corpus["cases"]
        .as_array()
        .expect("icon corpus cases")
        .iter()
        .find(|case| case["inputSha256"].as_str() == Some(play_source_sha))
        .expect("Play original in plan 011 corpus");
    assert_eq!(
        image["rgbaSha256"].as_str(),
        corpus_case["referenceRgbaSha256"].as_str()
    );

    for workload in contracts.workloads {
        for file in &workload.expected_files {
            assert!(
                file.path.contains("{workspace}/"),
                "{} expected file must be workspace-relative",
                workload.id
            );
            assert!(is_lower_hex_sha256(&file.sha256));
        }
    }
}
