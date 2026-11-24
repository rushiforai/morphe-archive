//! Independent contract tests for secure archive traversal and managed
//! workspace ownership. Assertions target public APIs and observable
//! filesystem effects, not the Python implementation's incidental formatting.

use apk_lab::archives::{
    accumulate_expanded, compute_zip_member_sha256, inspect_safe_zip, materialize_artifact_apks,
    safe_extract_all, validate_entry_count, validate_member_name, validate_ratio, ArchiveError,
    ArchiveLimits, DEFAULT_MAX_ENTRIES, DEFAULT_MAX_EXPANDED_BYTES,
};
use apk_lab::models::{ContainerType, SplitInfo};
use apk_lab::workspace::{
    canonical_json, compute_config_digest, format_timestamp, freshness, write_marker, EphemeralRun,
    Freshness, Marker, RunRequest, WorkspaceError, WorkspaceManager, MARKER_FILENAME,
};
use serde_json::{json, Value};
use std::collections::{BTreeMap, BTreeSet};
use std::fs;
use std::io::{Cursor, Write};
use std::path::{Path, PathBuf};
use std::time::{Duration, UNIX_EPOCH};
use tempfile::TempDir;
use zip::unstable::write::FileOptionsExt;
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipWriter};

fn build_zip_with_options(entries: &[(&str, &[u8])], options: SimpleFileOptions) -> Vec<u8> {
    let mut writer = ZipWriter::new(Cursor::new(Vec::new()));
    for (name, data) in entries {
        writer.start_file(*name, options).expect("start zip file");
        writer.write_all(data).expect("write zip data");
    }
    writer.finish().expect("finish zip").into_inner()
}

fn build_zip(entries: &[(&str, &[u8])], method: CompressionMethod) -> Vec<u8> {
    build_zip_with_options(
        entries,
        SimpleFileOptions::default().compression_method(method),
    )
}

fn empty_zip(count: usize) -> Vec<u8> {
    let mut writer = ZipWriter::new(Cursor::new(Vec::new()));
    let options = SimpleFileOptions::default().compression_method(CompressionMethod::Stored);
    for index in 0..count {
        writer
            .start_file(format!("entry-{index}.bin"), options)
            .expect("start entry");
    }
    writer.finish().expect("finish zip").into_inner()
}

fn inspect(bytes: &[u8]) -> Result<apk_lab::archives::SafeArchiveReport, ArchiveError> {
    inspect_safe_zip(Cursor::new(bytes.to_vec()), ArchiveLimits::default())
}

fn rename_byte_sequence(mut bytes: Vec<u8>, from: &[u8], to: &[u8]) -> Vec<u8> {
    assert_eq!(from.len(), to.len());
    let mut index = 0;
    while index + from.len() <= bytes.len() {
        if &bytes[index..index + from.len()] == from {
            bytes[index..index + from.len()].copy_from_slice(to);
        }
        index += 1;
    }
    bytes
}

fn decode_hex(text: &str) -> Vec<u8> {
    assert!(text.len().is_multiple_of(2));
    (0..text.len())
        .step_by(2)
        .map(|index| u8::from_str_radix(&text[index..index + 2], 16).expect("hex"))
        .collect()
}

fn patch_compression_method(mut bytes: Vec<u8>, method: u16) -> Vec<u8> {
    assert!(bytes.len() > 12);
    let mut index = 0;
    while index + 12 <= bytes.len() {
        if &bytes[index..index + 4] == b"PK\x03\x04" {
            bytes[index + 8..index + 10].copy_from_slice(&method.to_le_bytes());
        } else if &bytes[index..index + 4] == b"PK\x01\x02" {
            bytes[index + 10..index + 12].copy_from_slice(&method.to_le_bytes());
        }
        index += 1;
    }
    bytes
}

#[test]
fn entry_count_limit_allows_exactly_one_hundred_thousand() {
    let at_limit = empty_zip(100_000);
    let report = inspect(&at_limit).expect("100,000 entries are allowed");
    assert_eq!(report.entry_count, 100_000);

    let over_limit = empty_zip(100_001);
    match inspect(&over_limit) {
        Err(ArchiveError::Security(message)) => {
            assert!(message.contains("100001 entries"), "{message}");
        }
        other => panic!("expected security failure, got {other:?}"),
    }
    assert!(validate_entry_count(DEFAULT_MAX_ENTRIES, DEFAULT_MAX_ENTRIES).is_ok());
    assert!(validate_entry_count(DEFAULT_MAX_ENTRIES + 1, DEFAULT_MAX_ENTRIES).is_err());
}

#[test]
fn expanded_size_uses_checked_four_gib_arithmetic() {
    let max = DEFAULT_MAX_EXPANDED_BYTES;
    assert_eq!(max, 4 * 1024 * 1024 * 1024);
    assert_eq!(accumulate_expanded(max - 1, 1, max).unwrap(), max);
    assert!(accumulate_expanded(max, 1, max).is_err());
    assert!(accumulate_expanded(u64::MAX - 1, 2, u64::MAX).is_err());
}

#[test]
fn compression_ratio_boundary_matches_contract() {
    // Exactly 100:1 with file > 1 MiB is accepted.
    assert!(validate_ratio("exact", 2_000_000, 20_000, 100.0).is_ok());
    // Just over 100:1 is rejected.
    assert!(validate_ratio("over", 2_000_001, 20_000, 100.0).is_err());
    // At exactly 1 MiB the ratio rule is bypassed.
    assert!(validate_ratio("small", 1024 * 1024, 1, 100.0).is_ok());
    // A zero compressed size bypasses the rule (no division).
    assert!(validate_ratio("empty", 10 * 1024 * 1024, 0, 100.0).is_ok());
}

#[test]
fn encrypted_entries_are_rejected() {
    let options = SimpleFileOptions::default()
        .compression_method(CompressionMethod::Stored)
        .with_deprecated_encryption(b"password")
        .expect("deprecated encryption option");
    let bytes = build_zip_with_options(&[("secret.txt", b"data")], options);
    match inspect(&bytes) {
        Err(ArchiveError::Security(message)) => assert!(message.contains("Encrypted"), "{message}"),
        other => panic!("expected encrypted rejection, got {other:?}"),
    }
}

#[test]
fn symlink_entries_are_rejected_before_extraction() {
    let options = SimpleFileOptions::default()
        .compression_method(CompressionMethod::Stored)
        .external_attributes(0o120777u32 << 16);
    let bytes = build_zip_with_options(&[("link", b"target")], options);
    match inspect(&bytes) {
        Err(ArchiveError::Security(message)) => assert!(message.contains("Symlink"), "{message}"),
        other => panic!("expected symlink rejection, got {other:?}"),
    }
}

#[test]
fn duplicate_and_normalized_duplicate_names_are_rejected() {
    let renamed = rename_byte_sequence(
        build_zip(
            &[("dupA.txt", b"one"), ("dupB.txt", b"two")],
            CompressionMethod::Stored,
        ),
        b"dupA.txt",
        b"dupB.txt",
    );
    match inspect(&renamed) {
        Err(ArchiveError::Security(message)) => {
            assert!(message.contains("Duplicate entry"), "{message}");
        }
        other => panic!("expected duplicate rejection, got {other:?}"),
    }

    let normalized = build_zip(
        &[("a/./b.txt", b"one"), ("a/b.txt", b"two")],
        CompressionMethod::Stored,
    );
    assert!(matches!(
        inspect(&normalized),
        Err(ArchiveError::Security(_))
    ));
}

#[test]
fn unsafe_names_are_rejected() {
    for name in [
        "../escape.txt",
        "a/../../escape.txt",
        "/absolute.txt",
        "\\absolute.txt",
        "a\\..\\escape.txt",
        "a//b.txt",
        "nul\u{0}.txt",
    ] {
        let bytes = build_zip(&[(name, b"x")], CompressionMethod::Stored);
        assert!(
            matches!(inspect(&bytes), Err(ArchiveError::Security(_))),
            "expected rejection for {name:?}"
        );
        assert!(validate_member_name(name, false).is_err());
    }
}

#[test]
fn unsupported_compression_methods_are_errors_not_ignored() {
    let bytes = build_zip(&[("data.bin", b"hello")], CompressionMethod::Stored);
    let patched = patch_compression_method(bytes, 99);
    match inspect(&patched) {
        Err(ArchiveError::Unsupported(message)) => {
            assert!(message.contains("Unsupported compression"), "{message}");
        }
        other => panic!("expected unsupported compression, got {other:?}"),
    }
}

#[test]
fn supported_compression_methods_are_readable() {
    for method in [
        CompressionMethod::Stored,
        CompressionMethod::Deflated,
        CompressionMethod::Bzip2,
    ] {
        let bytes = build_zip(&[("payload.bin", b"compress me please")], method);
        let report = inspect(&bytes).unwrap_or_else(|error| panic!("{method:?}: {error}"));
        assert_eq!(report.total_uncompressed_bytes, 18, "{method:?}");
    }
}

#[test]
fn lzma_compressed_member_is_readable() {
    // Fixed 157-byte Python-compatible ZIP fixture using method 14 (LZMA),
    // generated once so the test never invokes Python.
    let bytes = decode_hex(
        "504b03043f0002000e00f8ad755dacaeaf5b25000000120000000b0000007061796c6f61642e62696e090405005d0000800000319bc9f3f6bc8ec5bdd7a4cb54331072785bd8da3ad5fffbf58000504b01023f033f0002000e00f8ad755dacaeaf5b25000000120000000b00000000000000000000008001000000007061796c6f61642e62696e504b05060000000001000100390000004e0000000000",
    );
    let report = inspect(&bytes).expect("LZMA metadata is accepted");
    assert_eq!(report.total_uncompressed_bytes, 18);
    let dir = TempDir::new().unwrap();
    let path = dir.path().join("lzma.zip");
    fs::write(&path, bytes).unwrap();
    use sha2::{Digest, Sha256};
    assert_eq!(
        compute_zip_member_sha256(&path, "payload.bin").unwrap(),
        format!("{:x}", Sha256::digest(b"compress me please"))
    );
}

#[test]
fn container_classification_uses_content_priority() {
    let apks = build_zip(
        &[
            ("toc.pb", b"toc"),
            ("base.apk", b"apk"),
            ("manifest.json", b"{}"),
        ],
        CompressionMethod::Stored,
    );
    assert_eq!(inspect(&apks).unwrap().container_type, ContainerType::Apks);

    let xapk = build_zip(
        &[("manifest.json", b"{}"), ("app.apk", b"apk")],
        CompressionMethod::Stored,
    );
    assert_eq!(inspect(&xapk).unwrap().container_type, ContainerType::Xapk);

    let apkm = build_zip(
        &[("base.apk", b"apk"), ("split_config.arm64.apk", b"apk")],
        CompressionMethod::Stored,
    );
    let report = inspect(&apkm).unwrap();
    assert_eq!(report.container_type, ContainerType::Apkm);
    assert_eq!(report.apk_members.len(), 2);
    assert!(report.apk_members.windows(2).all(|pair| pair[0] <= pair[1]));

    let unknown = build_zip(&[("readme.txt", b"hello")], CompressionMethod::Stored);
    assert_eq!(
        inspect(&unknown).unwrap().container_type,
        ContainerType::Unknown
    );
}

#[test]
fn apk_with_embedded_apk_asset_stays_apk() {
    let bytes = build_zip(
        &[
            ("AndroidManifest.xml", b"manifest"),
            ("classes.dex", b"dex"),
            ("assets/helper.apk", b"nested"),
        ],
        CompressionMethod::Deflated,
    );
    let report = inspect(&bytes).expect("valid apk");
    assert_eq!(report.container_type, ContainerType::Apk);
    assert_eq!(report.apk_members, vec!["assets/helper.apk"]);
}

#[test]
fn member_hash_streams_and_matches_known_digest() {
    let dir = TempDir::new().unwrap();
    let path = dir.path().join("hash.jar");
    let payload = b"member contents";
    fs::write(
        &path,
        build_zip(&[("member.bin", payload)], CompressionMethod::Stored),
    )
    .unwrap();
    // Hash must be the SHA-256 of the payload, independently formatted.
    use sha2::{Digest, Sha256};
    assert_eq!(
        compute_zip_member_sha256(&path, "member.bin").unwrap(),
        format!("{:x}", Sha256::digest(payload))
    );
}

#[test]
fn plain_apk_is_returned_directly() {
    let dir = TempDir::new().unwrap();
    let path = dir.path().join("app.apk");
    fs::write(&path, b"plain apk bytes").unwrap();
    let materialized = materialize_artifact_apks(&path, &[], true).unwrap();
    assert!(materialized.temp_root().is_none());
    assert_eq!(materialized.as_slice().len(), 1);
    let row = &materialized.as_slice()[0];
    assert_eq!(row.path, fs::canonicalize(&path).unwrap());
    assert_eq!(row.container_member, None);
    assert_eq!(row.split_name, "base");
    assert!(row.is_base);
}

#[test]
fn split_materialization_is_ordered_base_is_deterministic_and_raii_cleans() {
    let dir = TempDir::new().unwrap();
    let path = dir.path().join("app.apkm");
    fs::write(
        &path,
        build_zip(
            &[
                ("z/base.apk", b"base bytes"),
                ("a/config.xxhdpi.apk", b"config bytes"),
            ],
            CompressionMethod::Deflated,
        ),
    )
    .unwrap();

    let splits = vec![
        SplitInfo {
            filename: "z/base.apk".into(),
            split_name: "base".into(),
            sha256: String::new(),
            size: 10,
            is_base: true,
        },
        SplitInfo {
            filename: "a/config.xxhdpi.apk".into(),
            split_name: "split_config.xxhdpi".into(),
            sha256: String::new(),
            size: 12,
            is_base: false,
        },
    ];
    let materialized = materialize_artifact_apks(&path, &splits, false).unwrap();
    let rows = materialized.as_slice().to_vec();
    assert_eq!(rows.len(), 2);
    assert_eq!(
        rows[0].container_member.as_deref(),
        Some("a/config.xxhdpi.apk")
    );
    assert_eq!(rows[1].container_member.as_deref(), Some("z/base.apk"));
    assert_eq!(rows.iter().filter(|row| row.is_base).count(), 1);
    assert!(rows[1].is_base);
    assert_eq!(fs::read(&rows[0].path).unwrap(), b"config bytes");
    assert_eq!(fs::read(&rows[1].path).unwrap(), b"base bytes");
    let temp_root = materialized.temp_root().unwrap().to_path_buf();
    assert!(temp_root.is_dir());
    drop(materialized);
    assert!(!temp_root.exists(), "temporary split root must be removed");
}

#[test]
fn materialization_without_explicit_base_chooses_named_base() {
    let dir = TempDir::new().unwrap();
    let path = dir.path().join("app.apkm");
    fs::write(
        &path,
        build_zip(
            &[("a.apk", b"a"), ("b.apk", b"b")],
            CompressionMethod::Stored,
        ),
    )
    .unwrap();
    let splits = vec![
        SplitInfo {
            filename: "b.apk".into(),
            split_name: "base".into(),
            sha256: String::new(),
            size: 1,
            is_base: false,
        },
        SplitInfo {
            filename: "a.apk".into(),
            split_name: "config".into(),
            sha256: String::new(),
            size: 1,
            is_base: false,
        },
    ];
    let materialized = materialize_artifact_apks(&path, &splits, false).unwrap();
    let rows = materialized.as_slice();
    assert_eq!(rows[0].container_member.as_deref(), Some("a.apk"));
    assert!(rows[1].is_base);
    assert_eq!(rows[0].split_name, "config");
}

#[test]
fn unsafe_container_fails_before_writing_materialization() {
    let dir = TempDir::new().unwrap();
    let path = dir.path().join("bad.apkm");
    fs::write(
        &path,
        build_zip(&[("../escape.apk", b"x")], CompressionMethod::Stored),
    )
    .unwrap();
    let splits = vec![SplitInfo {
        filename: "../escape.apk".into(),
        split_name: "base".into(),
        sha256: String::new(),
        size: 1,
        is_base: true,
    }];
    assert!(materialize_artifact_apks(&path, &splits, false).is_err());
    assert!(!dir.path().join("escape.apk").exists());
}

#[cfg(unix)]
#[test]
fn extraction_refuses_symlink_ancestors() {
    use std::os::unix::fs::symlink;

    let dir = TempDir::new().unwrap();
    let outside = dir.path().join("outside");
    fs::create_dir(&outside).unwrap();
    let dest = dir.path().join("dest");
    fs::create_dir(&dest).unwrap();
    symlink(&outside, dest.join("link")).unwrap();

    let archive = dir.path().join("evil.zip");
    fs::write(
        &archive,
        build_zip(&[("link/file.txt", b"evil")], CompressionMethod::Stored),
    )
    .unwrap();
    match safe_extract_all(&archive, &dest) {
        Err(ArchiveError::Security(message)) => {
            assert!(message.contains("Symlink ancestor"), "{message}");
        }
        other => panic!("expected symlink ancestor rejection, got {other:?}"),
    }
    assert!(!outside.join("file.txt").exists());
}

#[cfg(unix)]
#[test]
fn extraction_refuses_preexisting_symlink_destination() {
    use std::os::unix::fs::symlink;

    let dir = TempDir::new().unwrap();
    let outside = dir.path().join("outside.txt");
    fs::write(&outside, b"outside data").unwrap();
    let dest = dir.path().join("dest");
    fs::create_dir(&dest).unwrap();
    symlink(&outside, dest.join("pwn.txt")).unwrap();

    let archive = dir.path().join("evil.zip");
    fs::write(
        &archive,
        build_zip(&[("pwn.txt", b"evil")], CompressionMethod::Stored),
    )
    .unwrap();
    assert!(safe_extract_all(&archive, &dest).is_err());
    assert_eq!(fs::read(&outside).unwrap(), b"outside data");
}

fn tools() -> BTreeMap<String, String> {
    BTreeMap::from([("morphe".to_string(), "1.18.0".to_string())])
}

fn config() -> Value {
    json!({"apktool": false, "jadx": true, "ratio": 1.5, "unicode": "caf\u{e9} \u{1f600}"})
}

fn request<'a>(
    package: &'a str,
    config: &'a Value,
    tools: &'a BTreeMap<String, String>,
) -> RunRequest<'a> {
    RunRequest {
        package_name: package,
        version_code: 100,
        input_sha256: "abcdef1234567890",
        input_path: Path::new("/path/to/app.apk"),
        command: "check",
        config,
        tool_versions: tools,
    }
}

#[test]
fn unicode_config_digest_matches_python_canonical_vector() {
    let config = config();
    let tools = tools();
    let canonical = canonical_json(&json!({
        "command": "check",
        "config": config,
        "toolVersions": tools,
    }))
    .unwrap();
    assert_eq!(
        canonical,
        "{\"command\":\"check\",\"config\":{\"apktool\":false,\"jadx\":true,\"ratio\":1.5,\"unicode\":\"caf\\u00e9 \\ud83d\\ude00\"},\"toolVersions\":{\"morphe\":\"1.18.0\"}}"
    );
    assert_eq!(
        compute_config_digest("check", &config, &tools).unwrap(),
        "2677ade12f61"
    );
}

#[test]
fn canonical_json_handles_bool_null_float_and_escapes() {
    assert_eq!(
        canonical_json(&json!({"z": null, "b": false, "a": [1.0, -0.5, 1e-5]})).unwrap(),
        "{\"a\":[1.0,-0.5,1e-05],\"b\":false,\"z\":null}"
    );
    assert_eq!(
        canonical_json(&json!("\u{e9}\u{1f600}\u{7f}\u{1f}\"\\")).unwrap(),
        "\"\\u00e9\\ud83d\\ude00\\u007f\\u001f\\\"\\\\\""
    );
    assert_eq!(canonical_json(&json!("a/b")).unwrap(), "\"a/b\"");
}

#[test]
fn run_path_derivation_is_exact() {
    let root = TempDir::new().unwrap();
    let manager = WorkspaceManager::new(root.path());
    let config = config();
    let tools = tools();
    let digest = compute_config_digest("check", &config, &tools).unwrap();
    let derived = manager
        .derive_run_dir("com.example.app", 100, "abcdef1234567890", &digest)
        .unwrap();
    assert_eq!(
        derived,
        fs::canonicalize(root.path())
            .unwrap()
            .join("com.example.app")
            .join("100-abcdef123456")
            .join("2677ade12f61")
    );
    assert!(manager
        .derive_run_dir("../escape", 100, "abcdef1234567890", &digest)
        .is_err());
    assert!(manager
        .derive_run_dir("com.example", 100, "not-hex-at-all!", &digest)
        .is_err());
    assert!(manager
        .derive_run_dir("com.example", 100, "abcdef1234567890", "../escape")
        .is_err());
}

#[test]
fn created_run_marker_has_exact_fields_and_is_removable() {
    let root = TempDir::new().unwrap();
    let manager = WorkspaceManager::new(root.path());
    let config = config();
    let tools = tools();
    let request = request("com.example.app", &config, &tools);
    let run = manager.create_run_dir(&request).unwrap();

    let marker_path = run.join(MARKER_FILENAME);
    let raw = fs::read_to_string(&marker_path).unwrap();
    assert!(raw.starts_with("{\n  \"configDigest\":"), "{raw}");

    let value: Value = serde_json::from_str(&raw).unwrap();
    let keys: BTreeSet<&str> = value
        .as_object()
        .expect("marker object")
        .keys()
        .map(String::as_str)
        .collect();
    assert_eq!(
        keys,
        BTreeSet::from([
            "configDigest",
            "command",
            "createdAt",
            "inputCanonicalPath",
            "inputSha256",
            "schemaVersion",
            "toolVersions",
        ])
    );
    assert_eq!(value["schemaVersion"], 1);
    assert_eq!(value["command"], "check");
    assert_eq!(value["inputSha256"], "abcdef1234567890");
    assert_eq!(value["configDigest"], "2677ade12f61");
    assert_eq!(value["inputCanonicalPath"], "/path/to/app.apk");
    assert_eq!(value["toolVersions"]["morphe"], "1.18.0");
    assert!(!value["createdAt"].as_str().unwrap().is_empty());

    let marker = manager.validate_run_dir(&run).unwrap();
    assert_eq!(marker.config_digest, "2677ade12f61");
    assert_eq!(marker.tool_versions, tools);

    assert!(manager.clean_run(&run, false).unwrap());
    assert!(!run.exists());
    assert!(!run.parent().unwrap().exists());
}

#[test]
fn hand_written_python_marker_fixture_is_accepted_and_cleaned() {
    let root = TempDir::new().unwrap();
    let manager = WorkspaceManager::new(root.path());
    let run = root
        .path()
        .join("com.example.fixture")
        .join("100-abcdef123456")
        .join("0123456789ab");
    fs::create_dir_all(&run).unwrap();
    let fixture = r#"{
  "configDigest": "0123456789ab",
  "command": "check",
  "createdAt": "2026-01-02T03:04:05.123456+00:00",
  "inputCanonicalPath": "/tmp/caf\u00e9.apk",
  "inputSha256": "abcdef1234567890",
  "schemaVersion": 1,
  "toolVersions": {
    "morphe": "1.18.0"
  }
}
"#;
    fs::write(run.join(MARKER_FILENAME), fixture).unwrap();

    let marker = manager.validate_run_dir(&run).unwrap();
    assert_eq!(marker.input_canonical_path, "/tmp/café.apk");
    assert_eq!(marker.created_at, "2026-01-02T03:04:05.123456+00:00");

    assert!(manager.clean_run(&run, true).unwrap());
    assert!(run.exists(), "dry run must not delete");
    assert!(manager.clean_run(&run, false).unwrap());
    assert!(!run.exists());
}

#[test]
fn unmarked_and_outside_paths_are_refused() {
    let root = TempDir::new().unwrap();
    let manager = WorkspaceManager::new(root.path());

    assert!(manager.validate_run_dir(root.path()).is_err());

    let unmarked = root.path().join("fake_run");
    fs::create_dir(&unmarked).unwrap();
    match manager.validate_run_dir(&unmarked) {
        Err(WorkspaceError::Invalid(message)) => {
            assert!(message.contains("missing .marker.json"), "{message}");
        }
        other => panic!("expected missing marker, got {other:?}"),
    }
    assert!(manager.clean_run(&unmarked, false).is_err());
    assert!(unmarked.exists(), "unmarked directories are never deleted");

    let sibling = root.path().with_extension("sibling");
    fs::create_dir_all(sibling.join("run")).unwrap();
    assert!(manager.validate_run_dir(&sibling.join("run")).is_err());
    let _ = fs::remove_dir_all(&sibling);
}

#[cfg(unix)]
#[test]
fn symlinked_run_is_refused() {
    use std::os::unix::fs::symlink;

    let root = TempDir::new().unwrap();
    let manager = WorkspaceManager::new(root.path());
    let target = TempDir::new().unwrap();
    let link = root.path().join("linked_run");
    symlink(target.path(), &link).unwrap();
    match manager.validate_run_dir(&link) {
        Err(WorkspaceError::UnsafePath(message)) => {
            assert!(message.contains("symlink"), "{message}");
        }
        other => panic!("expected symlink refusal, got {other:?}"),
    }
    assert!(manager.clean_run(&link, false).is_err());
}

#[test]
fn dry_run_makes_no_writes_and_package_cleanup_only_removes_valid_runs() {
    let root = TempDir::new().unwrap();
    let manager = WorkspaceManager::new(root.path());
    let config = config();
    let tools = tools();
    let first = manager
        .create_run_dir(&request("com.example.app", &config, &tools))
        .unwrap();
    let other_config = json!({"apktool": true, "jadx": false});
    let second = manager
        .create_run_dir(&request("com.example.app", &other_config, &tools))
        .unwrap();
    assert_ne!(first, second);

    let unmarked = root
        .path()
        .join("com.example.app")
        .join("999-deadbeef0000")
        .join("ffffffffffff");
    fs::create_dir_all(&unmarked).unwrap();

    let planned = manager.clean_package("com.example.app", true).unwrap();
    assert_eq!(planned.len(), 2);
    assert!(first.exists());
    assert!(second.exists());
    assert!(unmarked.exists());

    let cleaned = manager.clean_package("com.example.app", false).unwrap();
    assert_eq!(cleaned.len(), 2);
    assert!(!first.exists());
    assert!(!second.exists());
    assert!(unmarked.exists(), "unmarked directories must survive");

    assert!(!root
        .path()
        .join("com.example.app")
        .join("100-abcdef123456")
        .exists());
}

#[test]
fn stale_cleanup_uses_created_at_and_dry_run() {
    let root = TempDir::new().unwrap();
    let manager = WorkspaceManager::new(root.path());
    let config = config();
    let tools = tools();
    let now = UNIX_EPOCH + Duration::from_secs(1_800_000_000);

    let stale_config = json!({"apktool": false, "jadx": true, "ratio": 2.5});
    let stale = manager
        .create_run_dir(&request("com.example.app", &stale_config, &tools))
        .unwrap();
    let mut stale_marker = manager.validate_run_dir(&stale).unwrap();
    stale_marker.created_at = format_timestamp(now - Duration::from_secs(3 * 86_400));
    write_marker(&stale, &stale_marker).unwrap();

    let fresh = manager
        .create_run_dir(&request("com.example.app", &config, &tools))
        .unwrap();
    let mut fresh_marker = manager.validate_run_dir(&fresh).unwrap();
    fresh_marker.created_at = format_timestamp(now - Duration::from_secs(3_600));
    write_marker(&fresh, &fresh_marker).unwrap();

    assert_eq!(
        freshness(&stale_marker, now, 86_400.0).unwrap(),
        Freshness::Stale
    );
    assert_eq!(
        freshness(&fresh_marker, now, 86_400.0).unwrap(),
        Freshness::Fresh
    );

    let stale_runs = manager.clean_stale_at(1.0, now, true).unwrap();
    assert_eq!(stale_runs, vec![fs::canonicalize(&stale).unwrap()]);
    assert!(stale.exists());
    assert!(fresh.exists());

    let removed = manager.clean_stale_at(1.0, now, false).unwrap();
    assert_eq!(removed.len(), 1);
    assert!(!stale.exists());
    assert!(fresh.exists());
    assert!(manager.clean_stale(-1.0, true).is_err());
}

#[test]
fn failed_preflight_writes_nothing_and_ephemeral_runs_clean_up() {
    let root = TempDir::new().unwrap();
    let missing_root = root.path().join(".apk-lab");
    let manager = WorkspaceManager::new(&missing_root);
    let config = config();
    let tools = tools();
    let bad = RunRequest {
        package_name: "../escape",
        version_code: 100,
        input_sha256: "abcdef1234567890",
        input_path: Path::new("/app.apk"),
        command: "check",
        config: &config,
        tool_versions: &tools,
    };
    assert!(manager.create_run_dir(&bad).is_err());
    assert!(
        !missing_root.exists(),
        "preflight failure must not create root"
    );

    let good_root = TempDir::new().unwrap();
    let good_manager = WorkspaceManager::new(good_root.path());
    let request = request("com.example.ephemeral", &config, &tools);
    let ephemeral: EphemeralRun = good_manager.ephemeral_run(&request, false).unwrap();
    let path: PathBuf = ephemeral.path().to_path_buf();
    assert!(path.join(MARKER_FILENAME).is_file());
    drop(ephemeral);
    assert!(!path.exists(), "ephemeral run must be removed on drop");

    let kept = good_manager.ephemeral_run(&request, true).unwrap();
    let kept_path = kept.path().to_path_buf();
    drop(kept);
    assert!(kept_path.exists(), "keep_workspace must retain the run");
    good_manager.clean_run(&kept_path, false).unwrap();
    assert!(!kept_path.exists());
}

#[test]
fn marker_timestamp_format_matches_python_isoformat() {
    let time = UNIX_EPOCH + Duration::from_secs(1_767_323_045) + Duration::from_micros(123_456);
    assert_eq!(format_timestamp(time), "2026-01-02T03:04:05.123456+00:00");
    let marker = Marker {
        config_digest: "0123456789ab".into(),
        command: "check".into(),
        created_at: format_timestamp(time),
        input_canonical_path: "/app.apk".into(),
        input_sha256: "abcdef1234567890".into(),
        schema_version: 1,
        tool_versions: tools(),
    };
    assert_eq!(freshness(&marker, time, 0.0).unwrap(), Freshness::Stale);
    assert_eq!(
        freshness(&marker, time + Duration::from_secs(59), 60.0).unwrap(),
        Freshness::Fresh
    );
}
