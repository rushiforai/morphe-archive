//! Independent consumer-visible tests for the font/OCR asset pipeline.
//!
//! Font expectations come from the original Python transform applied to a
//! synthetic tiny font; `tests/fixtures/font/manifest.json` records the retired
//! generator and source digests. The remaining tests exercise cache repair,
//! bounded downloads, atomic publication and Python-compatible HTTP errors.

use std::fs;
use std::io::{Read, Write};
use std::net::TcpListener;
use std::path::{Path, PathBuf};
use std::thread;
use std::time::Duration;

use asset_prep::cache::{self, CacheOutcome};
use asset_prep::font::{
    self, table_checksum, transform_font, verify_processed_font, verify_processed_font_file,
    EXPECTED_PROCESSED_SHA256, EXPECTED_PROCESSED_SIZE, EXPECTED_RAW_SHA256,
    OPENTYPE_CHECKSUM_MAGIC,
};
use asset_prep::ocr;
use serde_json::Value;

fn fixture_dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/font")
}

fn read_fixture(name: &str) -> Vec<u8> {
    fs::read(fixture_dir().join(name)).unwrap_or_else(|err| panic!("read {name}: {err}"))
}

fn file_url(path: &Path) -> String {
    format!("file://{}", path.display())
}

fn temporary_path(path: &Path) -> PathBuf {
    let mut name = path.as_os_str().to_os_string();
    name.push(".tmp");
    PathBuf::from(name)
}

struct TableRecord {
    tag: [u8; 4],
    checksum: u32,
    offset: usize,
    length: usize,
}

fn records(font: &[u8]) -> Vec<TableRecord> {
    let count = u16::from_be_bytes([font[4], font[5]]) as usize;
    (0..count)
        .map(|index| {
            let base = 12 + index * 16;
            TableRecord {
                tag: font[base..base + 4].try_into().unwrap(),
                checksum: u32::from_be_bytes([
                    font[base + 4],
                    font[base + 5],
                    font[base + 6],
                    font[base + 7],
                ]),
                offset: u32::from_be_bytes([
                    font[base + 8],
                    font[base + 9],
                    font[base + 10],
                    font[base + 11],
                ]) as usize,
                length: u32::from_be_bytes([
                    font[base + 12],
                    font[base + 13],
                    font[base + 14],
                    font[base + 15],
                ]) as usize,
            }
        })
        .collect()
}

fn find<'a>(font: &'a [u8], tag: &[u8; 4]) -> &'a [u8] {
    let record = records(font)
        .into_iter()
        .find(|record| record.tag == *tag)
        .unwrap_or_else(|| panic!("missing table {}", String::from_utf8_lossy(tag)));
    &font[record.offset..record.offset + record.length]
}

#[test]
fn fixture_manifest_pins_match_bytes() {
    let manifest: Value =
        serde_json::from_slice(&read_fixture("manifest.json")).expect("manifest json");
    let entries = manifest["fixtures"].as_object().expect("fixtures object");
    assert!(entries.len() >= 8);
    for (name, expected) in entries {
        let bytes = read_fixture(name);
        assert_eq!(
            bytes.len() as u64,
            expected["size"].as_u64().unwrap(),
            "{name} size drifted"
        );
        assert_eq!(
            cache::sha256_hex(&bytes),
            expected["sha256"].as_str().unwrap(),
            "{name} digest drifted"
        );
    }
    assert_eq!(
        manifest["python_transform"]["sha256"].as_str().unwrap(),
        "fa16dfb5a776f7e95dc7d3f2b9f13fb020519698554b414f3db7586d18e42da2",
        "fixtures must be regenerated only from the recorded original transform"
    );
}

#[test]
fn transform_matches_python_expected_bytes() {
    let input = read_fixture("tiny-input.ttf");
    let untouched = input.clone();
    let expected = read_fixture("tiny-expected.ttf");

    let actual = transform_font(&input).expect("tiny font transforms");
    assert_eq!(input, untouched, "transform must borrow, not mutate, input");
    assert_eq!(actual, expected, "Rust transform must match Python exactly");
    assert_eq!(table_checksum(&actual), OPENTYPE_CHECKSUM_MAGIC);
    assert!(
        !verify_processed_font(&actual),
        "tiny font is not the pinned production font"
    );
}

#[test]
fn expected_layout_has_sorted_aligned_tables_and_exact_metrics() {
    let input = read_fixture("tiny-input.ttf");
    let output = read_fixture("tiny-expected.ttf");
    let entries = records(&output);

    let mut tags: Vec<[u8; 4]> = entries.iter().map(|entry| entry.tag).collect();
    let unsorted = tags.clone();
    tags.sort();
    assert_eq!(tags, unsorted, "table directory must be sorted by tag");
    for record in &entries {
        assert_eq!(
            record.offset % 4,
            0,
            "table offsets must be four-byte aligned"
        );
        assert!(record.offset + record.length <= output.len());
        if &record.tag == b"head" {
            // The directory checksum covers head with checkSumAdjustment zero.
            let mut head = output[record.offset..record.offset + record.length].to_vec();
            head[8..12].fill(0);
            assert_eq!(table_checksum(&head), record.checksum);
        } else {
            assert_eq!(
                table_checksum(&output[record.offset..record.offset + record.length]),
                record.checksum,
                "{} checksum",
                String::from_utf8_lossy(&record.tag)
            );
        }
    }

    let head = find(&output, b"head");
    assert_eq!(u16::from_be_bytes([head[18], head[19]]), 2048);
    let hhea = find(&output, b"hhea");
    assert_eq!(i16::from_be_bytes([hhea[4], hhea[5]]), 2048);
    assert_eq!(i16::from_be_bytes([hhea[6], hhea[7]]), -640);
    let os2 = find(&output, b"OS/2");
    assert_eq!(i16::from_be_bytes([os2[68], os2[69]]), 1920);
    assert_eq!(i16::from_be_bytes([os2[70], os2[71]]), -640);
    assert_eq!(u16::from_be_bytes([os2[74], os2[75]]), 2048);
    assert_eq!(u16::from_be_bytes([os2[76], os2[77]]), 640);

    let cmap = find(&output, b"cmap");
    assert_eq!(u16::from_be_bytes([cmap[0], cmap[1]]), 0);
    assert_eq!(u16::from_be_bytes([cmap[2], cmap[3]]), 4);
    let fmt14_offset = u32::from_be_bytes([cmap[32], cmap[33], cmap[34], cmap[35]]) as usize;
    let fmt14 = read_fixture("fmt14.bin");
    assert_eq!(
        &cmap[fmt14_offset..fmt14_offset + fmt14.len()],
        fmt14.as_slice()
    );
    let input_cmap = find(&input, b"cmap");
    let cmap_body_len = input_cmap.len() - 28;
    assert_eq!(fmt14_offset, 36 + cmap_body_len);
    assert_eq!(&cmap[36..36 + cmap_body_len], &input_cmap[28..]);

    let cblc = find(&output, b"CBLC");
    assert_eq!(u16::from_be_bytes([cblc[0], cblc[1]]), 3);
    assert_eq!(u16::from_be_bytes([cblc[2], cblc[3]]), 0);
    assert_eq!(u32::from_be_bytes([cblc[4], cblc[5], cblc[6], cblc[7]]), 1);
    let strike = &cblc[8..56];
    assert_eq!(
        u32::from_be_bytes([strike[0], strike[1], strike[2], strike[3]]),
        56
    );
    assert_eq!(
        u32::from_be_bytes([strike[4], strike[5], strike[6], strike[7]]),
        32
    );
    assert_eq!(
        u32::from_be_bytes([strike[8], strike[9], strike[10], strike[11]]),
        2
    );
    let subtables = &cblc[56..88];
    assert_eq!(
        u32::from_be_bytes([subtables[4], subtables[5], subtables[6], subtables[7]]),
        16
    );
    assert_eq!(
        u32::from_be_bytes([subtables[12], subtables[13], subtables[14], subtables[15]]),
        24
    );
    assert_eq!(
        u32::from_be_bytes([subtables[20], subtables[21], subtables[22], subtables[23]]),
        4
    );
    assert_eq!(
        u32::from_be_bytes([subtables[28], subtables[29], subtables[30], subtables[31]]),
        104
    );

    let cbdt = find(&output, b"CBDT");
    let input_cbdt = find(&input, b"CBDT");
    assert_eq!(&cbdt[..4], &input_cbdt[..4]);
    assert_eq!(&cbdt[4..], &input_cbdt[100..]);
}

#[test]
fn malformed_fonts_are_rejected_without_panicking() {
    for name in [
        "tiny-truncated.ttf",
        "tiny-bad-table-offset.ttf",
        "tiny-short-cmap.ttf",
        "tiny-short-cblc.ttf",
        "tiny-short-head.ttf",
    ] {
        let bytes = read_fixture(name);
        assert!(transform_font(&bytes).is_err(), "{name} must be rejected");
    }

    let input = read_fixture("tiny-input.ttf");
    assert!(transform_font(&[]).is_err());
    for length in (0..input.len()).step_by(7) {
        assert!(
            transform_font(&input[..length]).is_err(),
            "prefix {length} must not transform"
        );
    }

    let mut duplicate = input.clone();
    let first_tag = duplicate[12..16].to_vec();
    duplicate[28..32].copy_from_slice(&first_tag);
    assert!(
        transform_font(&duplicate).is_err(),
        "duplicate tags rejected"
    );
}

#[test]
fn processed_font_verification_rejects_wrong_bytes() {
    let expected = read_fixture("tiny-expected.ttf");
    assert!(!verify_processed_font(&expected));
    assert!(!verify_processed_font(&[]));

    let directory = tempfile::tempdir().unwrap();
    let path = directory.path().join("font.ttf");
    fs::write(&path, &expected).unwrap();
    assert!(!verify_processed_font_file(&path));
    assert!(!verify_processed_font_file(
        &directory.path().join("missing.ttf")
    ));
}

#[test]
fn fetch_bytes_reads_file_urls_and_enforces_the_limit() {
    let expected = read_fixture("tiny-expected.ttf");
    let agent = cache::http_agent(Some(Duration::from_secs(5)), "asset-prep-test/1.0");
    let url = file_url(&fixture_dir().join("tiny-expected.ttf"));

    let bytes = cache::fetch_bytes(&agent, &url, expected.len() as u64).unwrap();
    assert_eq!(bytes, expected);

    let error = cache::fetch_bytes(&agent, &url, expected.len() as u64 - 1).unwrap_err();
    assert!(error.to_string().contains("download limit"), "{error}");
}

#[test]
fn download_promotes_only_after_hash_and_size_validation() {
    let directory = tempfile::tempdir().unwrap();
    let source = fixture_dir().join("tiny-expected.ttf");
    let expected = fs::read(&source).unwrap();
    let digest = cache::sha256_hex(&expected);
    let agent = cache::http_agent(Some(Duration::from_secs(5)), "asset-prep-test/1.0");

    let destination = directory.path().join("cache").join("font.ttf");
    cache::download_verified(
        &agent,
        &file_url(&source),
        &destination,
        &digest,
        Some(expected.len() as u64),
        1024 * 1024,
    )
    .unwrap();
    assert_eq!(fs::read(&destination).unwrap(), expected);
    assert!(!temporary_path(&destination).exists());

    let rejected = directory.path().join("cache").join("rejected.ttf");
    let error = cache::download_verified(
        &agent,
        &file_url(&source),
        &rejected,
        "0000000000000000000000000000000000000000000000000000000000000000",
        Some(expected.len() as u64),
        1024 * 1024,
    )
    .unwrap_err();
    assert!(error.to_string().contains("checksum mismatch"), "{error}");
    assert!(!rejected.exists(), "mismatch must not publish");
    assert!(
        !temporary_path(&rejected).exists(),
        "temporary file cleaned up"
    );

    let wrong_size = directory.path().join("cache").join("wrong-size.ttf");
    let error = cache::download_verified(
        &agent,
        &file_url(&source),
        &wrong_size,
        &digest,
        Some(expected.len() as u64 + 1),
        1024 * 1024,
    )
    .unwrap_err();
    assert!(error.to_string().contains("size mismatch"), "{error}");
    assert!(!wrong_size.exists());
    assert!(!temporary_path(&wrong_size).exists());
}

#[test]
fn ensure_cached_reports_valid_downloaded_and_repaired() {
    let directory = tempfile::tempdir().unwrap();
    let source = fixture_dir().join("tiny-expected.ttf");
    let expected = fs::read(&source).unwrap();
    let digest = cache::sha256_hex(&expected);
    let agent = cache::http_agent(Some(Duration::from_secs(5)), "asset-prep-test/1.0");
    let url = file_url(&source);

    let cache_path = directory.path().join("tiny.ttf");
    assert_eq!(
        cache::ensure_cached(
            &agent,
            &url,
            &cache_path,
            &digest,
            Some(expected.len() as u64),
            1024 * 1024,
        )
        .unwrap(),
        CacheOutcome::Downloaded
    );
    assert_eq!(fs::read(&cache_path).unwrap(), expected);

    fs::write(&cache_path, b"not the cached font").unwrap();
    assert_eq!(
        cache::ensure_cached(
            &agent,
            &url,
            &cache_path,
            &digest,
            Some(expected.len() as u64),
            1024 * 1024,
        )
        .unwrap(),
        CacheOutcome::ReplacedCorrupt
    );
    assert_eq!(fs::read(&cache_path).unwrap(), expected);

    assert_eq!(
        cache::ensure_cached(
            &agent,
            &url,
            &cache_path,
            &digest,
            Some(expected.len() as u64),
            1024 * 1024,
        )
        .unwrap(),
        CacheOutcome::Valid
    );
}

#[test]
fn failed_repair_leaves_the_existing_cache_file_untouched() {
    let directory = tempfile::tempdir().unwrap();
    let cache_path = directory.path().join("cache.bin");
    fs::write(&cache_path, b"stale cache contents").unwrap();
    let digest = cache::sha256_hex(b"expected contents");
    let agent = cache::http_agent(Some(Duration::from_secs(5)), "asset-prep-test/1.0");
    let missing = file_url(&directory.path().join("missing.bin"));

    assert!(cache::ensure_cached(&agent, &missing, &cache_path, &digest, None, 1024).is_err());
    assert_eq!(fs::read(&cache_path).unwrap(), b"stale cache contents");
}

#[test]
fn font_cli_url_override_rejects_wrong_checksum_without_partial_cache() {
    let directory = tempfile::tempdir().unwrap();
    let output = directory.path().join("staged/AppleColorEmoji-96.ttf");
    let cache_dir = directory.path().join("cache");
    let url = file_url(&fixture_dir().join("tiny-input.ttf"));
    let args = vec![
        "--output".to_owned(),
        output.display().to_string(),
        "--cache-dir".to_owned(),
        cache_dir.display().to_string(),
        "--url".to_owned(),
        url,
    ];

    let error = font::run(&args).unwrap_err();
    assert!(error.to_string().contains("checksum mismatch"), "{error}");
    let raw = cache_dir.join("AppleColorEmoji-Linux.ttf");
    assert!(!raw.exists(), "rejected download must not be published");
    assert!(
        !temporary_path(&raw).exists(),
        "temporary download cleaned up"
    );
    assert!(!output.exists(), "font is not staged before verification");
}

#[test]
fn committed_fixtures_stay_unmodified() {
    // Guards against a test accidentally writing into the checked-in fixture
    // directory (the Python generator is the only writer).
    let manifest: Value =
        serde_json::from_slice(&read_fixture("manifest.json")).expect("manifest json");
    for name in manifest["fixtures"].as_object().unwrap().keys() {
        assert!(fixture_dir().join(name).is_file(), "{name} missing");
    }
    assert_eq!(EXPECTED_RAW_SHA256.len(), 64);
    assert_eq!(EXPECTED_PROCESSED_SHA256.len(), 64);
}

#[test]
#[ignore = "requires the private verified font cache; set ASSET_PREP_FONT_RAW and ASSET_PREP_FONT_PROCESSED"]
fn real_pinned_font_matches_python_bytes() {
    let raw = PathBuf::from(std::env::var("ASSET_PREP_FONT_RAW").expect("ASSET_PREP_FONT_RAW"));
    let processed = PathBuf::from(
        std::env::var("ASSET_PREP_FONT_PROCESSED").expect("ASSET_PREP_FONT_PROCESSED"),
    );
    let input = fs::read(raw).expect("read raw font");
    let expected = fs::read(processed).expect("read processed font");

    assert_eq!(cache::sha256_hex(&input), EXPECTED_RAW_SHA256);
    let actual = transform_font(&input).expect("real font transforms");
    assert_eq!(actual.len() as u64, EXPECTED_PROCESSED_SIZE);
    assert_eq!(cache::sha256_hex(&actual), EXPECTED_PROCESSED_SHA256);
    assert_eq!(actual, expected);
    assert!(verify_processed_font(&actual));
}

#[test]
#[ignore = "requires the private verified OCR cache; set ASSET_PREP_OCR"]
fn real_pinned_ocr_matches_python_bytes() {
    let path = PathBuf::from(std::env::var("ASSET_PREP_OCR").expect("ASSET_PREP_OCR"));
    let bytes = fs::read(path).expect("read OCR model");
    assert_eq!(bytes.len() as u64, ocr::EXPECTED_SIZE);
    assert_eq!(cache::sha256_hex(&bytes), ocr::EXPECTED_SHA256);
}

#[test]
fn http_404_uses_python_compatible_message() {
    let (url, handle) = serve_once("404 Not Found", "");
    let agent = cache::http_agent(Some(Duration::from_secs(5)), "asset-prep-test/1.0");
    let error = cache::fetch_bytes(&agent, &url, 1024).unwrap_err();
    assert_eq!(error.to_string(), "HTTP Error 404: Not Found");
    let _ = handle.join();

    let (url, handle) = serve_once("500 Internal Server Error", "");
    let error = cache::fetch_bytes(&agent, &url, 1024).unwrap_err();
    assert_eq!(error.to_string(), "HTTP Error 500: Internal Server Error");
    let _ = handle.join();
}

fn serve_once(status: &str, body: &str) -> (String, thread::JoinHandle<()>) {
    let listener = TcpListener::bind("127.0.0.1:0").unwrap();
    let address = listener.local_addr().unwrap();
    let response = format!(
        "HTTP/1.1 {status}\r\nContent-Length: {}\r\nConnection: close\r\n\r\n{body}",
        body.len()
    );
    let handle = thread::spawn(move || {
        let (mut stream, _) = listener.accept().unwrap();
        let mut request = [0u8; 2048];
        let _ = stream.read(&mut request);
        stream.write_all(response.as_bytes()).unwrap();
    });
    (format!("http://{address}/fixture"), handle)
}
