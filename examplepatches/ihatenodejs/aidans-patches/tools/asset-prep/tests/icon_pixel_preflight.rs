//! Exact-pixel, integrity and write-decision tests for the Pillow-compatible
//! icon module.
//!
//! All fixtures are frozen, offline and read-only. The public manifest is
//! shared with the native asset tests; these tests never rewrite it.

use std::collections::{BTreeMap, HashSet};
use std::fmt::Write as _;
use std::fs;
use std::io::Read as _;
use std::path::{Path, PathBuf};
use std::time::{Duration, SystemTime};

use asset_prep::{transform_icon, write_icon_if_changed, IconImage, IconWriteDecision, ICON_SIZE};
use flate2::read::ZlibDecoder;
use serde::Deserialize;
use sha2::{Digest, Sha256};

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Manifest {
    schema_version: u32,
    required_coverage: Vec<String>,
    reference: Reference,
    cases: Vec<Case>,
    #[serde(default)]
    decoded_inputs: BTreeMap<String, DecodedInput>,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Reference {
    python_version: String,
    pillow_version: String,
    source_sha256: String,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct Case {
    id: String,
    coverage: Vec<String>,
    visibility: String,
    input_path: String,
    input_sha256: String,
    expected_outcome: String,
    reference_rgba_path: Option<String>,
    reference_rgba_sha256: Option<String>,
    reference_png_path: Option<String>,
    width: Option<u32>,
    height: Option<u32>,
}

#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
struct DecodedInput {
    path: String,
    sha256: String,
    #[serde(default)]
    encoding: DecodedEncoding,
    #[serde(default)]
    stored_sha256: Option<String>,
    width: u32,
    height: u32,
    mode: String,
}

#[derive(Clone, Copy, Default, Deserialize, PartialEq, Eq)]
#[serde(rename_all = "lowercase")]
enum DecodedEncoding {
    #[default]
    Raw,
    Zlib,
}

const MAX_DECODED_BYTES: usize = 128 * 1024 * 1024;
const REFERENCE_PIXELS: usize = (ICON_SIZE as usize) * (ICON_SIZE as usize);
const REFERENCE_BYTES: usize = REFERENCE_PIXELS * 4;

fn fixture_root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests")
        .join("fixtures")
        .join("icons")
}

fn load_manifest() -> (PathBuf, Manifest) {
    let root = fixture_root();
    let path = root.join("manifest.json");
    let bytes =
        fs::read(&path).unwrap_or_else(|err| panic!("failed to read {}: {err}", path.display()));
    let manifest = serde_json::from_slice(&bytes)
        .unwrap_or_else(|err| panic!("failed to parse {}: {err}", path.display()));
    (root, manifest)
}

fn resolve(root: &Path, path: &str) -> PathBuf {
    let candidate = Path::new(path);
    if candidate.is_absolute() {
        candidate.to_path_buf()
    } else {
        root.join(candidate)
    }
}

fn sha256_hex(bytes: &[u8]) -> String {
    let digest = Sha256::digest(bytes);
    let mut out = String::with_capacity(64);
    for byte in digest {
        let _ = write!(out, "{byte:02x}");
    }
    out
}

fn expected_decoded_len(id: &str, width: u32, height: u32) -> Result<usize, String> {
    let bytes = (width as usize)
        .checked_mul(height as usize)
        .and_then(|pixels| pixels.checked_mul(4))
        .ok_or_else(|| format!("decodedInputs {id}: dimensions overflow"))?;
    if bytes > MAX_DECODED_BYTES {
        return Err(format!(
            "decodedInputs {id}: {bytes} decoded bytes exceed the {MAX_DECODED_BYTES}-byte limit"
        ));
    }
    Ok(bytes)
}

fn inflate_bounded(id: &str, stored: &[u8], expected: usize) -> Result<Vec<u8>, String> {
    let limit = expected
        .checked_add(1)
        .ok_or_else(|| format!("decodedInputs {id}: decoded size overflow"))?;
    let decoder = ZlibDecoder::new(stored);
    let mut bytes = Vec::with_capacity(expected);
    decoder
        .take(limit as u64)
        .read_to_end(&mut bytes)
        .map_err(|err| format!("decodedInputs {id}: zlib inflate failed: {err}"))?;
    if bytes.len() != expected {
        return Err(format!(
            "decodedInputs {id}: decompressed {} bytes, expected {expected}",
            bytes.len()
        ));
    }
    Ok(bytes)
}

fn validate_manifest(root: &Path, manifest: &Manifest) -> Result<(), String> {
    if manifest.schema_version != 1 {
        return Err(format!(
            "unexpected schemaVersion {}",
            manifest.schema_version
        ));
    }
    if manifest.required_coverage.is_empty() {
        return Err("requiredCoverage must not be empty".to_owned());
    }
    if manifest.reference.python_version.is_empty()
        || manifest.reference.pillow_version.is_empty()
        || manifest.reference.source_sha256.len() != 64
    {
        return Err("reference environment metadata is incomplete".to_owned());
    }
    if manifest.cases.is_empty() {
        return Err("manifest has no cases".to_owned());
    }

    let mut ids = HashSet::new();
    let mut success_ids = HashSet::new();
    for case in &manifest.cases {
        if !ids.insert(case.id.as_str()) {
            return Err(format!("duplicate case id {}", case.id));
        }
        if case.visibility != "public" {
            return Err(format!("case {} is not public", case.id));
        }
        if case.coverage.is_empty() {
            return Err(format!("case {} has empty coverage", case.id));
        }
        let input = fs::read(resolve(root, &case.input_path))
            .map_err(|err| format!("case {}: input unreadable: {err}", case.id))?;
        let actual = sha256_hex(&input);
        if actual != case.input_sha256 {
            return Err(format!(
                "case {}: input hash mismatch ({actual} != {})",
                case.id, case.input_sha256
            ));
        }

        match case.expected_outcome.as_str() {
            "success" => {
                success_ids.insert(case.id.as_str());
                if case.width != Some(ICON_SIZE) || case.height != Some(ICON_SIZE) {
                    return Err(format!("case {}: success must be 128x128", case.id));
                }
                let reference_path = case
                    .reference_rgba_path
                    .as_deref()
                    .ok_or_else(|| format!("case {}: missing referenceRgbaPath", case.id))?;
                let reference = fs::read(resolve(root, reference_path))
                    .map_err(|err| format!("case {}: reference unreadable: {err}", case.id))?;
                if reference.len() != REFERENCE_BYTES {
                    return Err(format!(
                        "case {}: reference is {} bytes, expected {REFERENCE_BYTES}",
                        case.id,
                        reference.len()
                    ));
                }
                let reference_hash = sha256_hex(&reference);
                match case.reference_rgba_sha256.as_deref() {
                    Some(expected) if expected == reference_hash => {}
                    Some(expected) => {
                        return Err(format!(
                            "case {}: reference hash mismatch ({reference_hash} != {expected})",
                            case.id
                        ))
                    }
                    None => return Err(format!("case {}: missing referenceRgbaSha256", case.id)),
                }
                if let Some(png_path) = case.reference_png_path.as_deref() {
                    let png = fs::read(resolve(root, png_path)).map_err(|err| {
                        format!("case {}: reference PNG unreadable: {err}", case.id)
                    })?;
                    if !png.starts_with(&[0x89, b'P', b'N', b'G', 0x0d, 0x0a, 0x1a, 0x0a]) {
                        return Err(format!("case {}: reference PNG is not a PNG", case.id));
                    }
                }
            }
            "error" => {
                if case.reference_rgba_path.is_some()
                    || case.reference_rgba_sha256.is_some()
                    || case.reference_png_path.is_some()
                    || case.width.is_some()
                    || case.height.is_some()
                {
                    return Err(format!(
                        "case {}: error cases must not carry reference output",
                        case.id
                    ));
                }
            }
            other => return Err(format!("case {}: unknown outcome {other}", case.id)),
        }
    }

    for tag in &manifest.required_coverage {
        if !manifest
            .cases
            .iter()
            .any(|case| case.coverage.iter().any(|coverage| coverage == tag))
        {
            return Err(format!("required coverage {tag} has no case"));
        }
    }

    for (id, decoded) in &manifest.decoded_inputs {
        if !success_ids.contains(id.as_str()) {
            return Err(format!("decodedInputs entry {id} has no success case"));
        }
        let stored = fs::read(resolve(root, &decoded.path))
            .map_err(|err| format!("decodedInputs {id}: unreadable: {err}"))?;
        let expected = expected_decoded_len(id, decoded.width, decoded.height)?;
        let bytes = match decoded.encoding {
            DecodedEncoding::Raw => stored,
            DecodedEncoding::Zlib => {
                let stored_sha256 = decoded.stored_sha256.as_deref().ok_or_else(|| {
                    format!("decodedInputs {id}: encoding zlib requires storedSha256")
                })?;
                let actual_stored = sha256_hex(&stored);
                if actual_stored != stored_sha256 {
                    return Err(format!(
                        "decodedInputs {id}: stored hash mismatch ({actual_stored} != {stored_sha256})"
                    ));
                }
                inflate_bounded(id, &stored, expected)?
            }
        };
        if bytes.len() != expected {
            return Err(format!(
                "decodedInputs {id}: {} bytes, expected {expected}",
                bytes.len()
            ));
        }
        if sha256_hex(&bytes) != decoded.sha256 {
            return Err(format!("decodedInputs {id}: hash mismatch"));
        }
        if decoded.mode.is_empty() {
            return Err(format!("decodedInputs {id}: empty mode"));
        }
    }

    Ok(())
}

fn cases_for_format<'a>(manifest: &'a Manifest, format: &str) -> Vec<&'a Case> {
    let tag = format!("format:{format}");
    let cases: Vec<&Case> = manifest
        .cases
        .iter()
        .filter(|case| {
            case.expected_outcome == "success" && case.coverage.iter().any(|item| item == &tag)
        })
        .collect();
    assert!(
        !cases.is_empty(),
        "public manifest has no successful {format} cases; required format proof is missing"
    );
    cases
}

fn check_success_cases(format: &str) {
    let (root, manifest) = load_manifest();
    validate_manifest(&root, &manifest).expect("public manifest integrity");
    let mut failures = Vec::new();
    for case in cases_for_format(&manifest, format) {
        let input = fs::read(resolve(&root, &case.input_path))
            .unwrap_or_else(|err| panic!("case {}: input unreadable: {err}", case.id));
        let image = transform_icon(&input)
            .unwrap_or_else(|err| panic!("case {} failed to transform: {err}", case.id));
        assert_eq!(image.width, ICON_SIZE, "case {}", case.id);
        assert_eq!(image.height, ICON_SIZE, "case {}", case.id);
        assert_eq!(image.rgba.len(), REFERENCE_BYTES, "case {}", case.id);

        let reference_path = case
            .reference_rgba_path
            .as_deref()
            .expect("validated success case has a reference");
        let expected =
            fs::read(resolve(&root, reference_path)).expect("validated reference is readable");
        if image.rgba != expected {
            let position = image
                .rgba
                .iter()
                .zip(&expected)
                .position(|(candidate, reference)| candidate != reference)
                .unwrap_or(0);
            let pixel = position / 4;
            let channel = ["R", "G", "B", "A"][position % 4];
            failures.push(format!(
                "case {}: first differing RGBA byte at offset {position} (pixel {pixel}, channel {channel}): candidate {}, reference {}",
                case.id,
                image.rgba.get(position).copied().unwrap_or(0),
                expected.get(position).copied().unwrap_or(0)
            ));
        }

        let (width, height, decoded) = decode_candidate_png(&image.png);
        assert_eq!((width, height), (ICON_SIZE, ICON_SIZE), "case {}", case.id);
        if decoded != image.rgba {
            failures.push(format!(
                "case {}: candidate PNG does not decode back to candidate RGBA",
                case.id
            ));
        }
    }
    assert!(
        failures.is_empty(),
        "Pillow reference mismatches for format {format}:\n{}",
        failures.join("\n")
    );
}

fn decode_candidate_png(bytes: &[u8]) -> (u32, u32, Vec<u8>) {
    let mut decoder = png::Decoder::new(std::io::Cursor::new(bytes));
    decoder.set_transformations(png::Transformations::normalize_to_color8());
    let mut reader = decoder.read_info().expect("candidate PNG header");
    let mut buffer = vec![0u8; reader.output_buffer_size().expect("candidate PNG size")];
    let info = reader
        .next_frame(&mut buffer)
        .expect("candidate PNG pixels");
    assert_eq!(info.color_type, png::ColorType::Rgba);
    assert_eq!(info.bit_depth, png::BitDepth::Eight);
    buffer.truncate(info.line_size * info.height as usize);
    (info.width, info.height, buffer)
}

#[test]
fn unknown_decoded_encoding_is_rejected() {
    let json = r#"{"path":"decoded/x","sha256":"00","encoding":"bzip2","width":1,"height":1,"mode":"RGB"}"#;
    assert!(
        serde_json::from_str::<DecodedInput>(json).is_err(),
        "unknown decoded encodings must not deserialize"
    );
}

#[test]
fn altered_zlib_stored_bytes_are_rejected_before_inflate() {
    let (root, manifest) = load_manifest();
    let entry = manifest
        .decoded_inputs
        .get("rgb-downscale-png")
        .expect("the compressed public fixture");
    let stored = fs::read(resolve(&root, &entry.path)).expect("compressed fixture");
    let mut corrupted = stored;
    *corrupted.last_mut().expect("non-empty compressed fixture") ^= 0xff;

    let temp = tempfile::tempdir().expect("tempdir");
    let path = temp.path().join("rgb-downscale-png.rgba.zlib");
    fs::write(&path, &corrupted).unwrap();

    let mut broken = manifest.clone();
    broken
        .decoded_inputs
        .get_mut("rgb-downscale-png")
        .unwrap()
        .path = path.to_string_lossy().into_owned();

    let error =
        validate_manifest(&root, &broken).expect_err("altered stored bytes must be rejected");
    assert!(error.contains("stored hash mismatch"), "{error}");
}

#[test]
fn corrupted_zlib_body_with_matching_stored_hash_fails_inflate() {
    let (root, manifest) = load_manifest();
    let entry = manifest
        .decoded_inputs
        .get("rgb-downscale-png")
        .expect("the compressed public fixture");
    let stored = fs::read(resolve(&root, &entry.path)).expect("compressed fixture");
    let mut corrupted = stored;
    *corrupted.last_mut().expect("non-empty compressed fixture") ^= 0xff;
    let stored_hash = sha256_hex(&corrupted);

    let temp = tempfile::tempdir().expect("tempdir");
    let path = temp.path().join("rgb-downscale-png.rgba.zlib");
    fs::write(&path, &corrupted).unwrap();

    let mut broken = manifest.clone();
    let entry = broken.decoded_inputs.get_mut("rgb-downscale-png").unwrap();
    entry.path = path.to_string_lossy().into_owned();
    entry.stored_sha256 = Some(stored_hash);

    let error = validate_manifest(&root, &broken)
        .expect_err("a corrupted zlib body must fail before the raw hash is accepted");
    assert!(
        error.contains("zlib inflate failed") || error.contains("decompressed"),
        "{error}"
    );
}

#[test]
fn zlib_decompressed_length_must_match_declared_dimensions() {
    let (root, manifest) = load_manifest();
    let mut broken = manifest.clone();
    broken
        .decoded_inputs
        .get_mut("rgb-downscale-png")
        .unwrap()
        .height += 1;
    let error = validate_manifest(&root, &broken)
        .expect_err("decompressed length must match width*height*4");
    assert!(
        error.contains("decompressed") && error.contains("expected"),
        "{error}"
    );
}

#[test]
fn zlib_decompressed_hash_must_match_raw_sha256() {
    let (root, manifest) = load_manifest();
    let mut broken = manifest.clone();
    broken
        .decoded_inputs
        .get_mut("rgb-downscale-png")
        .unwrap()
        .sha256 = "00".repeat(32);
    let error =
        validate_manifest(&root, &broken).expect_err("decompressed raw hash must be verified");
    assert!(error.contains("hash mismatch"), "{error}");
}

#[test]
fn zlib_encoding_requires_stored_sha256() {
    let (root, manifest) = load_manifest();
    let mut broken = manifest.clone();
    broken
        .decoded_inputs
        .get_mut("rgb-downscale-png")
        .unwrap()
        .stored_sha256 = None;
    let error = validate_manifest(&root, &broken)
        .expect_err("zlib decoded inputs must declare their stored hash");
    assert!(error.contains("requires storedSha256"), "{error}");
}

#[test]
fn public_manifest_integrity_is_complete() {
    let (root, manifest) = load_manifest();
    validate_manifest(&root, &manifest).expect("public manifest integrity");
    assert_eq!(manifest.reference.pillow_version, "11.3.0");
}

#[test]
fn missing_required_coverage_is_rejected() {
    let (root, manifest) = load_manifest();
    let mut broken = manifest.clone();
    broken
        .cases
        .retain(|case| !case.coverage.iter().any(|tag| tag == "format:webp"));
    let error = validate_manifest(&root, &broken).expect_err("missing cases must be rejected");
    assert!(error.contains("format:webp"), "unexpected error: {error}");
}

#[test]
fn altered_reference_bytes_are_rejected() {
    let (root, manifest) = load_manifest();
    let template = manifest
        .cases
        .iter()
        .find(|case| case.expected_outcome == "success")
        .expect("a success fixture")
        .clone();

    let temp = tempfile::tempdir().expect("tempdir");
    let base = temp.path();
    fs::create_dir_all(base.join("inputs")).unwrap();
    fs::create_dir_all(base.join("reference")).unwrap();

    let input_name = Path::new(&template.input_path)
        .file_name()
        .unwrap()
        .to_owned();
    let reference_name = Path::new(template.reference_rgba_path.as_deref().unwrap())
        .file_name()
        .unwrap()
        .to_owned();
    fs::copy(
        resolve(&root, &template.input_path),
        base.join("inputs").join(&input_name),
    )
    .unwrap();
    fs::copy(
        resolve(&root, template.reference_rgba_path.as_deref().unwrap()),
        base.join("reference").join(&reference_name),
    )
    .unwrap();

    let mut copied = template.clone();
    copied.input_path = format!("inputs/{}", input_name.to_string_lossy());
    copied.reference_rgba_path = Some(format!("reference/{}", reference_name.to_string_lossy()));
    copied.reference_png_path = None;

    let mut single = manifest.clone();
    single.required_coverage = copied.coverage.clone();
    single.cases = vec![copied];
    single.decoded_inputs.clear();

    validate_manifest(base, &single).expect("copied fixture should validate");

    let reference_path = base.join("reference").join(&reference_name);
    let mut bytes = fs::read(&reference_path).unwrap();
    bytes[0] ^= 0x01;
    fs::write(&reference_path, &bytes).unwrap();
    let error = validate_manifest(base, &single).expect_err("altered reference must be rejected");
    assert!(error.contains("reference hash mismatch"), "{error}");
}

#[test]
fn public_png_cases_match_reference_rgba_exactly() {
    check_success_cases("png");
}

#[test]
fn public_jpeg_cases_match_reference_rgba_exactly() {
    check_success_cases("jpeg");
}

#[test]
fn public_webp_cases_match_reference_rgba_exactly() {
    check_success_cases("webp");
}

#[test]
fn public_error_cases_are_controlled_errors() {
    let (root, manifest) = load_manifest();
    validate_manifest(&root, &manifest).expect("public manifest integrity");
    let errors: Vec<&Case> = manifest
        .cases
        .iter()
        .filter(|case| case.expected_outcome == "error")
        .collect();
    assert!(!errors.is_empty(), "manifest has no error cases");
    for case in errors {
        let input = fs::read(resolve(&root, &case.input_path)).unwrap();
        let result = transform_icon(&input);
        assert!(
            result.is_err(),
            "case {} unexpectedly succeeded; expected a controlled error",
            case.id
        );
    }
}

fn candidate_from_manifest(manifest: &Manifest) -> (PathBuf, Case, IconImage) {
    let root = fixture_root();
    let case = manifest
        .cases
        .iter()
        .find(|case| case.expected_outcome == "success")
        .expect("a success fixture")
        .clone();
    let input = fs::read(resolve(&root, &case.input_path)).unwrap();
    let image = transform_icon(&input).unwrap();
    (root, case, image)
}

fn encode_rgba_png(rgba: &[u8], width: u32, height: u32, compression: png::Compression) -> Vec<u8> {
    let mut out = Vec::new();
    {
        let mut encoder = png::Encoder::new(&mut out, width, height);
        encoder.set_color(png::ColorType::Rgba);
        encoder.set_depth(png::BitDepth::Eight);
        encoder.set_compression(compression);
        let mut writer = encoder.write_header().unwrap();
        writer.write_image_data(rgba).unwrap();
        writer.finish().unwrap();
    }
    out
}

fn set_old_mtime(path: &Path) -> SystemTime {
    let timestamp = SystemTime::UNIX_EPOCH + Duration::from_secs(1_600_000_000);
    let file = fs::OpenOptions::new().write(true).open(path).unwrap();
    file.set_modified(timestamp).unwrap();
    fs::metadata(path).unwrap().modified().unwrap()
}

#[test]
fn equal_pixels_with_different_encoding_preserve_bytes_and_mtime() {
    let (_, _, candidate) = {
        let (_, manifest) = load_manifest();
        candidate_from_manifest(&manifest)
    };

    let plain = encode_rgba_png(
        &candidate.rgba,
        ICON_SIZE,
        ICON_SIZE,
        png::Compression::NoCompression,
    );
    let high = encode_rgba_png(
        &candidate.rgba,
        ICON_SIZE,
        ICON_SIZE,
        png::Compression::High,
    );
    assert_ne!(
        plain, high,
        "compression levels should produce different PNG bytes"
    );

    let temp = tempfile::tempdir().unwrap();
    let path = temp.path().join("icon.png");
    fs::write(&path, &plain).unwrap();
    let modified = set_old_mtime(&path);

    let decision = write_icon_if_changed(&path, &candidate).unwrap();
    assert_eq!(decision, IconWriteDecision::Unchanged);
    assert_eq!(
        fs::read(&path).unwrap().as_slice(),
        plain.as_slice(),
        "existing bytes must survive"
    );
    assert_eq!(
        fs::metadata(&path).unwrap().modified().unwrap(),
        modified,
        "existing mtime must survive"
    );

    let decision = write_icon_if_changed(&path, &candidate).unwrap();
    assert_eq!(decision, IconWriteDecision::Unchanged);
    assert_eq!(fs::read(&path).unwrap().as_slice(), plain.as_slice());
    assert_eq!(fs::metadata(&path).unwrap().modified().unwrap(), modified);
}

#[test]
fn one_byte_alpha_change_is_a_genuine_update() {
    let (_, manifest) = load_manifest();
    let (_, _, candidate) = candidate_from_manifest(&manifest);

    let mut mutated = candidate.rgba.clone();
    let alpha_index = (0..REFERENCE_PIXELS)
        .map(|pixel| pixel * 4 + 3)
        .find(|&index| mutated[index] > 0)
        .expect("a non-transparent pixel");
    mutated[alpha_index] -= 1;
    assert_ne!(mutated, candidate.rgba);

    let temp = tempfile::tempdir().unwrap();
    let path = temp.path().join("icon.png");
    fs::write(
        &path,
        encode_rgba_png(&mutated, ICON_SIZE, ICON_SIZE, png::Compression::High),
    )
    .unwrap();

    let decision = write_icon_if_changed(&path, &candidate).unwrap();
    assert_eq!(decision, IconWriteDecision::Updated);
    assert_eq!(
        fs::read(&path).unwrap().as_slice(),
        candidate.png.as_slice()
    );
}

#[test]
fn one_byte_rgb_change_is_a_genuine_update() {
    let (_, manifest) = load_manifest();
    let (_, _, candidate) = candidate_from_manifest(&manifest);

    let mut mutated = candidate.rgba.clone();
    let rgb_index = (0..REFERENCE_PIXELS)
        .flat_map(|pixel| [pixel * 4, pixel * 4 + 1, pixel * 4 + 2])
        .find(|&index| mutated[index] < 255 && mutated[index - index % 4 + 3] > 0)
        .expect("an opaque visible color channel");
    mutated[rgb_index] ^= 0x01;

    let temp = tempfile::tempdir().unwrap();
    let path = temp.path().join("icon.png");
    fs::write(
        &path,
        encode_rgba_png(&mutated, ICON_SIZE, ICON_SIZE, png::Compression::High),
    )
    .unwrap();

    let decision = write_icon_if_changed(&path, &candidate).unwrap();
    assert_eq!(decision, IconWriteDecision::Updated);
    assert_eq!(
        fs::read(&path).unwrap().as_slice(),
        candidate.png.as_slice()
    );
}

#[test]
fn missing_corrupt_empty_and_wrong_dimension_files_are_genuine_updates() {
    let (_, manifest) = load_manifest();
    let (_, _, candidate) = candidate_from_manifest(&manifest);
    let temp = tempfile::tempdir().unwrap();

    let missing = temp.path().join("missing.png");
    assert_eq!(
        write_icon_if_changed(&missing, &candidate).unwrap(),
        IconWriteDecision::Created
    );
    assert_eq!(
        fs::read(&missing).unwrap().as_slice(),
        candidate.png.as_slice()
    );

    let corrupt = temp.path().join("corrupt.png");
    fs::write(&corrupt, b"this is not a PNG").unwrap();
    assert_eq!(
        write_icon_if_changed(&corrupt, &candidate).unwrap(),
        IconWriteDecision::Updated
    );
    assert_eq!(
        fs::read(&corrupt).unwrap().as_slice(),
        candidate.png.as_slice()
    );

    let empty = temp.path().join("empty.png");
    fs::write(&empty, b"").unwrap();
    assert_eq!(
        write_icon_if_changed(&empty, &candidate).unwrap(),
        IconWriteDecision::Updated
    );
    assert_eq!(
        fs::read(&empty).unwrap().as_slice(),
        candidate.png.as_slice()
    );

    let wrong = temp.path().join("wrong-dimensions.png");
    let small = encode_rgba_png(
        &candidate.rgba[..64 * 64 * 4],
        64,
        64,
        png::Compression::High,
    );
    fs::write(&wrong, &small).unwrap();
    assert_eq!(
        write_icon_if_changed(&wrong, &candidate).unwrap(),
        IconWriteDecision::Updated
    );
    assert_eq!(
        fs::read(&wrong).unwrap().as_slice(),
        candidate.png.as_slice()
    );
}

#[test]
fn truncated_primary_jpeg_with_exif_thumbnail_eoi_is_rejected() {
    let (root, manifest) = load_manifest();
    let case = manifest
        .cases
        .iter()
        .find(|case| case.id == "jpeg-rgb-opaque")
        .expect("the public JPEG fixture");
    let valid = fs::read(resolve(&root, &case.input_path)).expect("JPEG fixture");
    assert!(
        valid.starts_with(&[0xff, 0xd8]),
        "fixture must start with SOI"
    );
    assert!(valid.ends_with(&[0xff, 0xd9]), "fixture must end with EOI");

    // Truncate the primary entropy-coded scan and then prepend an APP1
    // segment whose EXIF thumbnail payload contains a complete EOI. A naive
    // `FF D9` search would accept this stream; the marker walker must not.
    let primary = &valid[2..valid.len() - 2];
    let sos = primary
        .windows(2)
        .rposition(|window| window == [0xff, 0xda])
        .expect("JPEG fixture has a primary scan");
    let cutoff = (sos + 128).min(primary.len());
    let truncated_primary = &primary[..cutoff];

    let thumbnail_payload = b"Exif\0\0\xff\xd8\xff\xd9";
    let mut malicious = Vec::with_capacity(4 + thumbnail_payload.len() + truncated_primary.len());
    malicious.extend_from_slice(&[0xff, 0xd8, 0xff, 0xe1]);
    malicious.extend_from_slice(&((thumbnail_payload.len() + 2) as u16).to_be_bytes());
    malicious.extend_from_slice(thumbnail_payload);
    malicious.extend_from_slice(truncated_primary);

    assert!(
        malicious.windows(2).any(|window| window == b"\xff\xd9"),
        "the embedded thumbnail EOI must be present"
    );
    let error = transform_icon(&malicious).expect_err("truncated primary scan must be rejected");
    let message = error.to_string();
    assert!(
        message.contains("truncated") || message.contains("JPEG"),
        "unexpected error: {message}"
    );
}

#[test]
fn pillow_compatible_bad_iend_transform_input_still_decodes() {
    let (root, manifest) = load_manifest();
    let case = manifest
        .cases
        .iter()
        .find(|case| case.id == "rgb-opaque-png")
        .expect("the public PNG fixture");
    let valid = fs::read(resolve(&root, &case.input_path)).expect("PNG fixture");
    assert!(valid.ends_with(b"IEND\xae\x42\x60\x82"));

    let baseline = transform_icon(&valid).expect("valid PNG transform");

    let mut bad_crc = valid.clone();
    let last = bad_crc.len() - 1;
    bad_crc[last] ^= 0xff;
    let from_bad_crc = transform_icon(&bad_crc).expect("Pillow accepts a bad IEND CRC");
    assert_eq!(from_bad_crc.rgba, baseline.rgba);

    let truncated = &valid[..valid.len() - 7];
    let from_truncated = transform_icon(truncated).expect("Pillow accepts a truncated IEND");
    assert_eq!(from_truncated.rgba, baseline.rgba);
}

#[test]
fn corrupt_or_truncated_png_iend_is_a_genuine_update() {
    let (_, manifest) = load_manifest();
    let (_, _, candidate) = candidate_from_manifest(&manifest);

    let plain = encode_rgba_png(
        &candidate.rgba,
        ICON_SIZE,
        ICON_SIZE,
        png::Compression::NoCompression,
    );

    let mut bad_crc = plain.clone();
    let last = bad_crc.len() - 1;
    bad_crc[last] ^= 0xff;

    let truncated_end = plain[..plain.len() - 7].to_vec();

    for (name, bytes) in [("bad-iend-crc", bad_crc), ("truncated-iend", truncated_end)] {
        let temp = tempfile::tempdir().unwrap();
        let path = temp.path().join(format!("{name}.png"));
        fs::write(&path, &bytes).unwrap();
        let modified = set_old_mtime(&path);

        let decision = write_icon_if_changed(&path, &candidate).unwrap();
        assert_eq!(
            decision,
            IconWriteDecision::Updated,
            "{name} must not qualify as an unchanged valid PNG"
        );
        assert_eq!(
            fs::read(&path).unwrap().as_slice(),
            candidate.png.as_slice(),
            "{name} should be replaced with the candidate"
        );
        assert!(
            fs::metadata(&path).unwrap().modified().unwrap() != modified,
            "{name} must actually be rewritten"
        );

        let decision = write_icon_if_changed(&path, &candidate).unwrap();
        assert_eq!(
            decision,
            IconWriteDecision::Unchanged,
            "{name} replacement should then be a valid no-op"
        );
    }
}

#[test]
fn adam7_png_matches_pinned_pillow_without_requiring_a_trailer() {
    // Independently captured with Python 3.12.14 / Pillow 11.3.0: a 2x2
    // Adam7 image (red, green, blue, white), converted then Lanczos-resized.
    let input = b"\x89\x50\x4e\x47\x0d\x0a\x1a\x0a\x00\x00\x00\x0d\x49\x48\x44\x52\x00\x00\x00\x02\x00\x00\x00\x02\x08\x06\x00\x00\x01\x05\xb1\x3d\xb2\x00\x00\x00\x13\x49\x44\x41\x54\x78\x9c\x63\xf8\xcf\xc0\x00\x46\x40\x82\xe1\x3f\x18\x00\x00\x4b\xc7\x09\xf7\x41\xa9\xbf\x18\x00\x00\x00\x00\x49\x45\x4e\x44\xae\x42\x60\x82";
    for bytes in [input.as_slice(), &input[..input.len() - 7]] {
        let image = transform_icon(bytes).expect("complete image pixels");
        assert_eq!(
            sha256_hex(&image.rgba),
            "6a3b67f0a30a920f71801811f5bd48ec0e3e7526c728846974c5924423ec0bd4"
        );
    }
}

#[test]
fn jpeg_warnings_match_pillow_without_hiding_fatal_errors() {
    let (root, manifest) = load_manifest();
    let case = manifest
        .cases
        .iter()
        .find(|case| case.id == "jpeg-rgb-opaque")
        .expect("the independent JPEG reference");
    let original = fs::read(resolve(&root, &case.input_path)).unwrap();
    assert_eq!(&original[2..4], b"\xff\xe0");
    let app_end = 4 + u16::from_be_bytes([original[4], original[5]]) as usize;
    let mut warning = Vec::with_capacity(original.len() + 13);
    warning.extend_from_slice(&original[..app_end]);
    warning.extend_from_slice(b"ignored-bytes");
    warning.extend_from_slice(&original[app_end..]);
    // Independently observed with pinned Pillow: extraneous pre-marker bytes
    // produce the same image, rather than turning a warning into a soft failure.
    let image = transform_icon(&warning).expect("nonfatal libjpeg warning");
    assert_eq!(
        sha256_hex(&image.rgba),
        case.reference_rgba_sha256.as_deref().unwrap()
    );

    // The same oracle rejects a scan referencing an undefined Huffman table.
    // Keep the primary EOI intact so this exercises a codec failure, not the
    // independent truncation guard.
    let mut fatal = original;
    let scan = fatal
        .windows(2)
        .position(|bytes| bytes == b"\xff\xda")
        .unwrap();
    fatal[scan + 6] = 0x33;
    assert!(matches!(
        transform_icon(&fatal),
        Err(asset_prep::icons::IconError::Decode(_))
    ));
}
