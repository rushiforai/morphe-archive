//! Tool cache, setup profile, doctor, and inspection contracts.
//!
//! Every external tool here is a fake executable script; no test reaches the
//! network, the Android SDK, Java, or a Python interpreter. Fake SDK and
//! artifact paths deliberately contain spaces and Unicode.

#![cfg(unix)]

use apk_lab::error::Error;
use apk_lab::inspection::{self, InspectionOptions};
use apk_lab::models::{ContainerType, ExitCode};
use apk_lab::tools::{
    self, check_host_prerequisites, host_platform_for, platform_supported, profile_tool_names,
    DoctorOptions, Profile, ToolEnvironment, ToolError, ToolManager, ToolSpec,
};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;
use std::ffi::OsString;
use std::fs;
use std::io::Cursor;
use std::os::unix::fs::PermissionsExt;
use std::path::{Path, PathBuf};
use std::time::Duration;
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipWriter};

const BASE_BADGING: &str = "\
package: name='com.example.synthetic' versionCode='100' versionName='1.0-\u{394}' compileSdkVersion='34'
sdkVersion:'21'
targetSdkVersion:'34'
uses-permission: name='android.permission.INTERNET'
";

const SPLIT_BADGING: &str = "\
package: name='com.example.synthetic' versionCode='100' versionName='1.0-\u{394}' split='config.arm64_v8a'
targetSdkVersion:'34'
";

const SIGNER: &str = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

const AAPT2_SCRIPT: &str = r#"#!/bin/sh
last=""
for argument in "$@"; do last="$argument"; done
case "$(basename "$last")" in
  base*) exec cat "$(dirname "$0")/badging-base.txt" ;;
  *) exec cat "$(dirname "$0")/badging-split.txt" ;;
esac
"#;

const APKSIGNER_SCRIPT: &str = r#"#!/bin/sh
exec cat "$(dirname "$0")/certs.txt"
"#;

fn write_script(path: &Path, contents: &str) {
    fs::write(path, contents).expect("write script");
    let mut permissions = fs::metadata(path).expect("script metadata").permissions();
    permissions.set_mode(0o755);
    fs::set_permissions(path, permissions).expect("chmod script");
}

fn fake_sdk(root: &Path, aapt2_script: &str, badging_base: &str, badging_split: &str) -> PathBuf {
    let sdk = root.join("android sdk with spaces");
    let build_tools = sdk.join("build-tools").join("36.0.0");
    fs::create_dir_all(&build_tools).expect("build tools");
    write_script(&build_tools.join("aapt2"), aapt2_script);
    fs::write(build_tools.join("badging-base.txt"), badging_base).expect("base badging");
    fs::write(build_tools.join("badging-split.txt"), badging_split).expect("split badging");
    write_script(&build_tools.join("apksigner"), APKSIGNER_SCRIPT);
    fs::write(
        build_tools.join("certs.txt"),
        format!("Signer #1 certificate SHA-256 digest: {SIGNER}\n"),
    )
    .expect("certs");
    sdk
}

fn inspection_options(sdk: &Path, timeout: Duration) -> InspectionOptions {
    InspectionOptions {
        env: ToolEnvironment {
            android_home: Some(sdk.to_path_buf()),
            path: Some(OsString::new()),
            ..ToolEnvironment::default()
        },
        timeout,
    }
}

fn zip_bytes(entries: &[(&str, &[u8])]) -> Vec<u8> {
    let mut writer = ZipWriter::new(Cursor::new(Vec::new()));
    let options = SimpleFileOptions::default().compression_method(CompressionMethod::Deflated);
    for (name, data) in entries {
        writer.start_file(*name, options).expect("start file");
        use std::io::Write;
        writer.write_all(data).expect("write member");
    }
    writer.finish().expect("finish zip").into_inner()
}

fn dex_bytes(classes: u32, methods: u32) -> Vec<u8> {
    let mut data = vec![0u8; 0x80];
    data[..8].copy_from_slice(b"dex\n035\0");
    data[0x58..0x5c].copy_from_slice(&methods.to_le_bytes());
    data[0x60..0x64].copy_from_slice(&classes.to_le_bytes());
    data
}

fn base_apk() -> Vec<u8> {
    let dex = dex_bytes(4, 9);
    let second_dex = dex_bytes(0, 0);
    zip_bytes(&[
        ("AndroidManifest.xml", b"manifest"),
        ("classes.dex", &dex),
        ("classes2.dex", &second_dex),
        ("lib/arm64-v8a/libnative.so", b"native"),
        ("res/values/strings.xml", b"<resources/>"),
        (
            "res/drawable-xxhdpi/\u{256c}\u{2561}\u{256c}\u{2563}.webp",
            b"webp",
        ),
        ("assets/unicode-\u{251c}\u{2310}.txt", b"asset"),
    ])
}

fn split_apk() -> Vec<u8> {
    let dex = dex_bytes(1, 2);
    zip_bytes(&[
        ("AndroidManifest.xml", b"manifest-split"),
        ("classes.dex", &dex),
        ("lib/arm64-v8a/libsplit.so", b"split-native"),
        ("res/layout/split.xml", b"<layout/>"),
    ])
}

fn sha256(bytes: &[u8]) -> String {
    let mut hasher = Sha256::new();
    hasher.update(bytes);
    format!("{:x}", hasher.finalize())
}

fn write_file(path: &Path, bytes: &[u8]) {
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent).expect("parent");
    }
    fs::write(path, bytes).expect("write file");
}

fn tool_lock(directory: &Path, tools: Value) -> PathBuf {
    let path = directory.join("tools.lock.json");
    fs::write(
        &path,
        serde_json::to_vec(&json!({ "tools": tools })).expect("json"),
    )
    .expect("write lock");
    path
}

/// Writes a lock document while preserving the caller's entry order. The
/// `json!` macro sorts object keys, so ordered doctor tests need raw text.
fn tool_lock_ordered(directory: &Path, entries: &[(&str, Value)]) -> PathBuf {
    let path = directory.join("tools.lock.json");
    let mut text = String::from("{\"tools\":{");
    for (index, (name, spec)) in entries.iter().enumerate() {
        if index > 0 {
            text.push(',');
        }
        text.push_str(&serde_json::to_string(name).expect("name"));
        text.push(':');
        text.push_str(&serde_json::to_string(spec).expect("spec"));
    }
    text.push_str("}}");
    fs::write(&path, text).expect("write lock");
    path
}

fn dummy_spec(sha: &str, supported: &[&str]) -> Value {
    json!({
        "version": "1.0.0",
        "url": "https://example.invalid/dummy",
        "sha256": sha,
        "license": "MIT",
        "supportedPlatforms": supported,
        "toolType": "binary",
        "executablePath": "dummy",
        "versionProbe": {
            "args": ["{executable}", "--version"],
            "expectedPattern": "dummy 1\\.0\\.0"
        }
    })
}

#[test]
fn inspect_plain_apk_reports_exact_contract_fields() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let artifact = directory
        .path()
        .join("fixtures with spaces")
        .join("base.apk");
    write_file(&artifact, &base_apk());

    let inspection = inspection::inspect_artifact_with_options(
        &artifact,
        &inspection_options(&sdk, Duration::from_secs(5)),
    )
    .expect("inspect");

    assert_eq!(
        inspection.file_path,
        fs::canonicalize(&artifact).unwrap().to_string_lossy()
    );
    assert_eq!(inspection.container_type, ContainerType::Apk);
    assert_eq!(inspection.package_name, "com.example.synthetic");
    assert_eq!(inspection.version_name, "1.0-\u{394}");
    assert_eq!(inspection.version_code, 100);
    assert_eq!(inspection.min_sdk, None);
    assert_eq!(inspection.target_sdk, Some(34));
    assert_eq!(
        inspection.signing_certificate_sha256.as_deref(),
        Some(SIGNER)
    );
    assert!(inspection.splits.is_empty());
    assert_eq!(inspection.dex_classes_count, 4);
    assert_eq!(inspection.dex_methods_count, 9);
    assert_eq!(inspection.dex_files, ["classes.dex", "classes2.dex"]);
    assert_eq!(inspection.native_libraries, ["lib/arm64-v8a/libnative.so"]);
    assert_eq!(
        inspection.resources,
        [
            "res/drawable-xxhdpi/\u{256c}\u{2561}\u{256c}\u{2563}.webp",
            "res/values/strings.xml",
        ]
    );
    assert_eq!(inspection.assets, ["assets/unicode-\u{251c}\u{2310}.txt"]);
    assert!(inspection.warnings.is_empty());

    let value = serde_json::to_value(&inspection).expect("JSON");
    assert_eq!(value["minSdk"], Value::Null);
    assert_eq!(value["targetSdk"], 34);
    assert_eq!(value["signingCertificateSha256"], SIGNER);
    assert_eq!(value["splits"], json!([]));
}

#[test]
fn inspect_split_container_orders_splits_and_selects_base() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let artifact = directory.path().join("app bundle.apkm");
    write_file(
        &artifact,
        &zip_bytes(&[
            ("base.apk", &base_apk()),
            ("split_config.arm64_v8a.apk", &split_apk()),
        ]),
    );

    let inspection = inspection::inspect_artifact_with_options(
        &artifact,
        &inspection_options(&sdk, Duration::from_secs(5)),
    )
    .expect("inspect split container");

    assert_eq!(inspection.container_type, ContainerType::Apkm);
    assert_eq!(inspection.package_name, "com.example.synthetic");
    assert_eq!(inspection.dex_classes_count, 5);
    assert_eq!(inspection.dex_methods_count, 11);
    assert_eq!(
        inspection.dex_files,
        [
            "base.apk:classes.dex",
            "base.apk:classes2.dex",
            "split_config.arm64_v8a.apk:classes.dex",
        ]
    );
    assert_eq!(
        inspection.native_libraries,
        ["lib/arm64-v8a/libnative.so", "lib/arm64-v8a/libsplit.so",]
    );

    assert_eq!(inspection.splits.len(), 2);
    assert_eq!(inspection.splits[0].filename, "base.apk");
    assert_eq!(inspection.splits[0].split_name, "base");
    assert!(inspection.splits[0].is_base);
    assert_eq!(inspection.splits[1].filename, "split_config.arm64_v8a.apk");
    assert_eq!(inspection.splits[1].split_name, "config.arm64_v8a");
    assert!(!inspection.splits[1].is_base);
    assert_ne!(inspection.splits[0].sha256, inspection.splits[1].sha256);
}

#[test]
fn inspect_invalid_artifact_is_exit_three() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let artifact = directory.path().join("garbage.apk");
    write_file(&artifact, b"not a zip archive");

    let error = inspection::inspect_artifact_with_options(
        &artifact,
        &inspection_options(&sdk, Duration::from_secs(5)),
    )
    .expect_err("garbage must fail");
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
}

#[test]
fn inspect_missing_tool_is_exit_two() {
    let directory = tempfile::tempdir().expect("tempdir");
    let artifact = directory.path().join("base.apk");
    write_file(&artifact, &base_apk());
    let options = InspectionOptions {
        env: ToolEnvironment {
            android_home: None,
            android_sdk_root: None,
            java_home: None,
            path: Some(OsString::new()),
            local_properties: Vec::new(),
            credentials: BTreeMap::new(),
        },
        timeout: Duration::from_secs(5),
    };

    let error = inspection::inspect_artifact_with_options(&artifact, &options)
        .expect_err("missing aapt2 must fail");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(error.message().contains("aapt2"), "{}", error.message());
}

#[test]
fn inspect_malformed_badging_is_exit_three() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(
        directory.path(),
        AAPT2_SCRIPT,
        "this is not badging output\n",
        SPLIT_BADGING,
    );
    let artifact = directory.path().join("base.apk");
    write_file(&artifact, &base_apk());

    let error = inspection::inspect_artifact_with_options(
        &artifact,
        &inspection_options(&sdk, Duration::from_secs(5)),
    )
    .expect_err("malformed badging must fail");
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
    assert!(
        error.message().contains("Could not parse package name"),
        "{}",
        error.message()
    );
}

#[test]
fn inspect_aapt2_non_zero_exit_is_exit_three_with_stderr() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(
        directory.path(),
        "#!/bin/sh\necho 'badging exploded' >&2\nexit 7\n",
        BASE_BADGING,
        SPLIT_BADGING,
    );
    let artifact = directory.path().join("base.apk");
    write_file(&artifact, &base_apk());

    let error = inspection::inspect_artifact_with_options(
        &artifact,
        &inspection_options(&sdk, Duration::from_secs(5)),
    )
    .expect_err("non-zero aapt2 must fail");
    assert_eq!(error.exit_code(), ExitCode::InvalidArtifact);
    assert!(error.message().contains("badging exploded"));
}

#[test]
fn inspect_aapt2_timeout_is_exit_two() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(
        directory.path(),
        "#!/bin/sh\nsleep 5\n",
        BASE_BADGING,
        SPLIT_BADGING,
    );
    let artifact = directory.path().join("base.apk");
    write_file(&artifact, &base_apk());

    let error = inspection::inspect_artifact_with_options(
        &artifact,
        &inspection_options(&sdk, Duration::from_millis(100)),
    )
    .expect_err("timed out aapt2 must fail");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(error.message().contains("timed out"), "{}", error.message());
}

#[test]
fn inspect_apksigner_output_is_optional_and_parsed() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let artifact = directory.path().join("base.apk");
    write_file(&artifact, &base_apk());

    // Remove apksigner entirely: inspection still succeeds without a signer.
    fs::remove_file(sdk.join("build-tools/36.0.0/apksigner")).expect("remove apksigner");
    let inspection = inspection::inspect_artifact_with_options(
        &artifact,
        &inspection_options(&sdk, Duration::from_secs(5)),
    )
    .expect("inspect without apksigner");
    assert_eq!(inspection.signing_certificate_sha256, None);
}

#[test]
fn fake_tool_argv_preserves_argument_boundaries() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let artifact = directory
        .path()
        .join("directory with spaces")
        .join("base.apk");
    write_file(&artifact, &base_apk());

    let inspection = inspection::inspect_artifact_with_options(
        &artifact,
        &inspection_options(&sdk, Duration::from_secs(5)),
    )
    .expect("aapt2 receives the path as one argument");
    assert_eq!(inspection.package_name, "com.example.synthetic");
}

#[test]
fn cache_layout_permissions_and_checksum_are_enforced() {
    let directory = tempfile::tempdir().expect("tempdir");
    let cache = directory.path().join("cache root");
    let download = directory.path().join("downloads").join("dummy");
    let script = b"#!/bin/sh\nif [ \"$1\" = \"--version\" ]; then echo dummy 1.0.0; fi\n";
    write_file(&download, script);
    let digest = sha256(script);
    let lock = tool_lock(
        directory.path(),
        json!({ "dummy": dummy_spec(&digest, &["any"]) }),
    );
    let manager = ToolManager::with_host(&cache, &lock, "darwin-aarch64").expect("manager");

    let executable = manager
        .install_from_file("dummy", &download)
        .expect("install");
    assert_eq!(
        executable,
        cache
            .join("dummy")
            .join("1.0.0")
            .join(&digest)
            .join("dummy")
    );
    assert_eq!(
        executable,
        manager
            .install_dir("dummy")
            .expect("install dir")
            .join("dummy")
    );
    assert!(manager.is_tool_installed("dummy"));
    assert_ne!(
        fs::metadata(&executable)
            .expect("metadata")
            .permissions()
            .mode()
            & 0o111,
        0
    );

    let mut permissions = fs::metadata(&executable).expect("metadata").permissions();
    permissions.set_mode(0o644);
    fs::set_permissions(&executable, permissions).expect("chmod");
    assert!(!manager.is_tool_installed("dummy"));
}

#[test]
fn checksum_mismatch_never_publishes_the_tool() {
    let directory = tempfile::tempdir().expect("tempdir");
    let cache = directory.path().join("cache");
    let download = directory.path().join("dummy");
    write_file(&download, b"#!/bin/sh\necho dummy 1.0.0\n");
    let lock = tool_lock(
        directory.path(),
        json!({ "dummy": dummy_spec(&"0".repeat(64), &["any"]) }),
    );
    let manager = ToolManager::with_host(&cache, &lock, "darwin-aarch64").expect("manager");

    let error = manager
        .install_from_file("dummy", &download)
        .expect_err("checksum mismatch");
    assert!(matches!(error, ToolError::Checksum { .. }));
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(error.message().contains("Checksum mismatch"));
    assert!(!manager.install_dir("dummy").expect("dir").exists());
    assert!(!manager.is_tool_installed("dummy"));
}

#[test]
fn zip_tool_installation_extracts_and_marks_bin_executables() {
    let directory = tempfile::tempdir().expect("tempdir");
    let cache = directory.path().join("cache");
    let archive = directory.path().join("tool.zip");
    let mut writer = ZipWriter::new(Cursor::new(Vec::new()));
    let options = SimpleFileOptions::default();
    use std::io::Write;
    writer.start_file("bin/dummy", options).expect("start");
    writer
        .write_all(b"#!/bin/sh\nif [ \"$1\" = \"--version\" ]; then echo dummy 1.0.0; fi\n")
        .expect("write");
    let bytes = writer.finish().expect("finish").into_inner();
    write_file(&archive, &bytes);

    let digest = sha256(&bytes);
    let lock = tool_lock(
        directory.path(),
        json!({
            "dummy": {
                "version": "1.0.0",
                "url": "https://example.invalid/dummy.zip",
                "sha256": digest,
                "supportedPlatforms": ["any"],
                "toolType": "zip",
                "executablePath": "bin/dummy",
                "versionProbe": {
                    "args": ["{executable}", "--version"],
                    "expectedPattern": "dummy 1\\.0\\.0"
                }
            }
        }),
    );
    let manager = ToolManager::with_host(&cache, &lock, "linux-x86_64").expect("manager");
    let executable = manager
        .install_from_file("dummy", &archive)
        .expect("install zip");
    assert!(executable.ends_with("bin/dummy"));
    assert_ne!(
        fs::metadata(&executable)
            .expect("metadata")
            .permissions()
            .mode()
            & 0o111,
        0
    );
}

#[test]
fn jar_tools_do_not_require_executable_permission() {
    let directory = tempfile::tempdir().expect("tempdir");
    let cache = directory.path().join("cache");
    let digest = "a".repeat(64);
    let lock = tool_lock(
        directory.path(),
        json!({
            "jar-tool": {
                "version": "1.0.0",
                "url": "https://example.invalid/tool.jar",
                "sha256": digest,
                "supportedPlatforms": ["any"],
                "toolType": "jar",
                "executablePath": "tool.jar"
            }
        }),
    );
    let manager = ToolManager::with_host(&cache, &lock, "darwin-aarch64").expect("manager");
    let path = cache
        .join("jar-tool")
        .join("1.0.0")
        .join(&digest)
        .join("tool.jar");
    write_file(&path, b"jar bytes");
    let mut permissions = fs::metadata(&path).expect("metadata").permissions();
    permissions.set_mode(0o644);
    fs::set_permissions(&path, permissions).expect("chmod");
    assert!(manager.is_tool_installed("jar-tool"));
}

#[test]
fn unsupported_host_is_a_usage_error() {
    let directory = tempfile::tempdir().expect("tempdir");
    let cache = directory.path().join("cache");
    let download = directory.path().join("apkeep");
    write_file(&download, b"#!/bin/sh\nexit 0\n");
    let digest = sha256(&fs::read(&download).expect("read"));
    let lock = tool_lock(
        directory.path(),
        json!({ "apkeep": dummy_spec(&digest, &["linux-x86_64"]) }),
    );
    let manager = ToolManager::with_host(&cache, &lock, "darwin-aarch64").expect("manager");

    let error = manager
        .install_from_file("apkeep", &download)
        .expect_err("unsupported host");
    assert!(matches!(error, ToolError::UnsupportedHost { .. }));
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(error.message().contains("darwin-aarch64"));
    assert!(!cache.join("apkeep").exists());
}

#[test]
fn setup_profile_selection_is_exact() {
    assert_eq!(
        profile_tool_names(Profile::Analysis, |_| true),
        ["morphe", "jadx", "apktool", "baksmali", "smali"]
    );
    assert_eq!(
        profile_tool_names(Profile::Ci, |_| true),
        ["morphe", "jadx", "apktool", "baksmali", "smali", "apkeep"]
    );
    assert_eq!(
        profile_tool_names(Profile::Ci, |name| name != "apkeep"),
        ["morphe", "jadx", "apktool", "baksmali", "smali"]
    );
}

#[test]
fn doctor_reports_without_installing_or_writing_the_cache() {
    let directory = tempfile::tempdir().expect("tempdir");
    let cache = directory.path().join("cache never created");
    let lock = tool_lock_ordered(
        directory.path(),
        &[
            ("zeta", dummy_spec(&"a".repeat(64), &["any"])),
            ("alpha", dummy_spec(&"b".repeat(64), &["any"])),
            ("apkeep", dummy_spec(&"c".repeat(64), &["any"])),
        ],
    );
    let manager = ToolManager::with_host(&cache, &lock, "darwin-aarch64").expect("manager");
    let workspace = directory.path().join("workspace");
    fs::create_dir_all(&workspace).expect("workspace");
    let sentinel = workspace.join(".test_write");
    fs::write(&sentinel, b"pre-existing sentinel data").expect("sentinel");

    let env = ToolEnvironment {
        android_home: None,
        android_sdk_root: None,
        java_home: None,
        path: Some(OsString::new()),
        local_properties: Vec::new(),
        credentials: BTreeMap::new(),
    };
    let report = check_host_prerequisites(
        &manager,
        &env,
        &DoctorOptions {
            ci_mode: false,
            profile: None,
            workspace_root: workspace.clone(),
        },
    );

    let names: Vec<&str> = report.tools.iter().map(|tool| tool.name.as_str()).collect();
    assert_eq!(names, ["zeta", "alpha"]);
    assert!(report.tools.iter().all(|tool| !tool.installed));
    assert!(!report.all_ready);
    assert!(!report.ci_mode);
    assert!(report.credentials_present.is_empty());
    assert!(!cache.exists(), "doctor must not create the tool cache");
    assert_eq!(
        fs::read(&sentinel).expect("sentinel"),
        b"pre-existing sentinel data"
    );
    let leftovers: Vec<_> = fs::read_dir(&workspace)
        .expect("read workspace")
        .filter_map(Result::ok)
        .filter(|entry| entry.file_name().to_string_lossy().starts_with(".probe_"))
        .collect();
    assert!(leftovers.is_empty(), "doctor must remove its probe file");
}

#[test]
fn doctor_ci_profile_includes_supported_apkeep_and_presence_only_credentials() {
    let directory = tempfile::tempdir().expect("tempdir");
    let cache = directory.path().join("cache");
    let lock = tool_lock_ordered(
        directory.path(),
        &[
            ("morphe", dummy_spec(&"a".repeat(64), &["any"])),
            ("apkeep", dummy_spec(&"b".repeat(64), &["any"])),
        ],
    );
    let manager = ToolManager::with_host(&cache, &lock, "darwin-aarch64").expect("manager");
    let mut credentials = BTreeMap::new();
    credentials.insert("APKEEP_ACCOUNTS".to_string(), true);
    credentials.insert("R2_ACCOUNT_ID".to_string(), false);
    let env = ToolEnvironment {
        path: Some(OsString::new()),
        credentials,
        ..ToolEnvironment::default()
    };
    let workspace = directory.path().join("workspace");

    let report = check_host_prerequisites(
        &manager,
        &env,
        &DoctorOptions {
            ci_mode: true,
            profile: Some(Profile::Ci),
            workspace_root: workspace,
        },
    );
    let names: Vec<&str> = report.tools.iter().map(|tool| tool.name.as_str()).collect();
    assert_eq!(names, ["morphe", "apkeep"]);
    assert!(report.ci_mode);
    assert_eq!(
        report.credentials_present.get("APKEEP_ACCOUNTS"),
        Some(&true)
    );
    assert_eq!(
        report.credentials_present.get("R2_ACCOUNT_ID"),
        Some(&false)
    );
    let serialized = serde_json::to_string(&report).expect("JSON");
    assert!(!serialized.contains("secret"));
}

#[test]
fn doctor_does_not_probe_or_download_an_installed_cache_entry() {
    let directory = tempfile::tempdir().expect("tempdir");
    let cache = directory.path().join("cache");
    let digest = "d".repeat(64);
    let lock = tool_lock(
        directory.path(),
        json!({
            "dummy": {
                "version": "1.0.0",
                "url": "https://example.invalid/dummy",
                "sha256": digest,
                "supportedPlatforms": ["any"],
                "toolType": "binary",
                "executablePath": "dummy"
            }
        }),
    );
    let manager = ToolManager::with_host(&cache, &lock, "darwin-aarch64").expect("manager");
    let executable = cache
        .join("dummy")
        .join("1.0.0")
        .join(&digest)
        .join("dummy");
    write_file(&executable, b"#!/bin/sh\nexit 1\n");
    let mut permissions = fs::metadata(&executable).expect("metadata").permissions();
    permissions.set_mode(0o755);
    fs::set_permissions(&executable, permissions).expect("chmod");

    let env = ToolEnvironment {
        path: Some(OsString::new()),
        ..ToolEnvironment::default()
    };
    let report = check_host_prerequisites(
        &manager,
        &env,
        &DoctorOptions {
            ci_mode: false,
            profile: Some(Profile::Analysis),
            workspace_root: directory.path().join("workspace"),
        },
    );
    assert_eq!(report.tools.len(), 1);
    assert!(report.tools[0].installed);
    assert_eq!(report.tools[0].actual_version.as_deref(), Some("1.0.0"));
    let canonical = fs::canonicalize(&executable).expect("canonical");
    assert_eq!(
        report.tools[0].executable_path.as_deref(),
        Some(canonical.to_string_lossy().as_ref())
    );
}

#[test]
fn platform_mapping_and_lock_order_are_stable() {
    assert_eq!(host_platform_for("linux", "aarch64"), "linux-aarch64");
    assert_eq!(host_platform_for("macos", "arm64"), "darwin-aarch64");
    assert_eq!(host_platform_for("windows", "x86_64"), "windows-x86_64");
    let spec: ToolSpec =
        serde_json::from_value(dummy_spec(&"a".repeat(64), &["linux-x86_64"])).expect("spec");
    assert!(platform_supported(&spec, "linux-x86_64"));
    assert!(!platform_supported(&spec, "darwin-aarch64"));
    let wildcard: ToolSpec =
        serde_json::from_value(dummy_spec(&"a".repeat(64), &["any"])).expect("spec");
    assert!(platform_supported(&wildcard, "windows-aarch64"));
}

#[test]
fn inspect_error_display_never_panics_on_unicode_arguments() {
    let directory = tempfile::tempdir().expect("tempdir");
    let error: Error = inspection::inspect_artifact_with_options(
        directory.path().join("\u{251c}\u{2310} missing.apk"),
        &InspectionOptions::default(),
    )
    .expect_err("missing artifact");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(error.message().contains("Artifact not found"));
}

#[test]
fn tool_environment_uses_local_properties_only_without_env_sdk() {
    let directory = tempfile::tempdir().expect("tempdir");
    let properties = directory.path().join("local.properties");
    fs::write(&properties, "sdk.dir=  /sdk with spaces  \n").expect("properties");
    let env = ToolEnvironment {
        local_properties: vec![properties],
        ..ToolEnvironment::default()
    };
    assert_eq!(env.sdk_dir(), Some(PathBuf::from("/sdk with spaces")));

    let env_with_home = ToolEnvironment {
        android_home: Some(PathBuf::from("/from env")),
        ..env.clone()
    };
    assert_eq!(env_with_home.sdk_dir(), Some(PathBuf::from("/from env")));
}

#[test]
fn tools_lock_document_order_is_preserved_for_doctor_rows() {
    let directory = tempfile::tempdir().expect("tempdir");
    let lock = tool_lock_ordered(
        directory.path(),
        &[
            ("zzz", dummy_spec(&"a".repeat(64), &["any"])),
            ("aaa", dummy_spec(&"b".repeat(64), &["any"])),
        ],
    );
    let manager = ToolManager::with_host(directory.path().join("cache"), &lock, "darwin-aarch64")
        .expect("manager");
    let names: Vec<&str> = manager
        .lock()
        .tools
        .iter()
        .map(|tool| tool.name.as_str())
        .collect();
    assert_eq!(names, ["zzz", "aaa"]);
    assert!(tools::default_lock_path().ends_with("tools.lock.json"));
}

fn run_cli_with_sdk(args: &[&str], sdk: &Path, home: &Path) -> std::process::Output {
    std::process::Command::new(env!("CARGO_BIN_EXE_apk-lab"))
        .args(args)
        .env("ANDROID_HOME", sdk)
        .env_remove("ANDROID_SDK_ROOT")
        .env_remove("APK_LAB_REPO_ROOT")
        .env("HOME", home)
        .env("PATH", "/usr/bin:/bin")
        .env_remove("APK_LAB_TOOLS_LOCK")
        .stdin(std::process::Stdio::null())
        .env("JAVA_HOME", home.join("missing java"))
        .output()
        .expect("run apk-lab")
}

#[test]
fn cli_inspect_json_matches_python_shape_and_sorted_keys() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let home = directory.path().join("home");
    fs::create_dir_all(&home).expect("home");
    let artifact = directory.path().join("space dir").join("base.apk");
    write_file(&artifact, &base_apk());
    let artifact_arg = artifact.to_string_lossy().into_owned();

    let output = run_cli_with_sdk(&["inspect", &artifact_arg, "--json"], &sdk, &home);
    assert_eq!(
        output.status.code(),
        Some(0),
        "stderr={}",
        String::from_utf8_lossy(&output.stderr)
    );
    assert!(output.stderr.is_empty());
    assert_eq!(output.stdout.last(), Some(&b'\n'));
    let text = String::from_utf8(output.stdout.clone()).expect("UTF-8");
    assert!(
        text.contains(r#""assets/unicode-\u251c\u2310.txt""#),
        "non-ASCII must be escaped like Python: {text}"
    );
    assert!(
        text.contains(r#"1.0-\u0394"#),
        "version name must be ASCII-escaped: {text}"
    );
    assert!(!text.contains('\u{251c}'), "raw non-ASCII leaked: {text}");
    let value: Value = serde_json::from_slice(&output.stdout).expect("pure JSON");
    assert_eq!(value["containerType"], "APK");
    assert_eq!(value["packageName"], "com.example.synthetic");
    assert_eq!(value["versionName"], "1.0-\u{394}");
    assert_eq!(value["versionCode"], 100);
    assert_eq!(value["minSdk"], Value::Null);
    assert_eq!(value["targetSdk"], 34);
    assert_eq!(value["signingCertificateSha256"], SIGNER);
    assert_eq!(value["splits"], json!([]));
    assert_eq!(value["dexClassesCount"], 4);
    assert_eq!(value["dexMethodsCount"], 9);
    assert_eq!(value["dexFiles"], json!(["classes.dex", "classes2.dex"]));
    assert_eq!(
        value["nativeLibraries"],
        json!(["lib/arm64-v8a/libnative.so"])
    );
    assert_eq!(
        value["assets"],
        json!(["assets/unicode-\u{251c}\u{2310}.txt"])
    );
    assert_eq!(value["warnings"], json!([]));

    let ordered = [
        "\"assets\"",
        "\"containerType\"",
        "\"dexClassesCount\"",
        "\"dexFiles\"",
        "\"dexMethodsCount\"",
        "\"filePath\"",
        "\"fileSize\"",
        "\"minSdk\"",
        "\"nativeLibraries\"",
        "\"packageName\"",
        "\"resources\"",
        "\"sha256\"",
        "\"signingCertificateSha256\"",
        "\"splits\"",
        "\"targetSdk\"",
        "\"versionCode\"",
        "\"versionName\"",
        "\"warnings\"",
    ];
    let mut last = 0usize;
    for key in ordered {
        let position = text.find(key).expect("key present");
        assert!(position > last, "keys must be sorted: {key}");
        last = position;
    }
}

#[test]
fn cli_inspect_json_file_mode_writes_sorted_document_without_newline() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let home = directory.path().join("home");
    fs::create_dir_all(&home).expect("home");
    let artifact = directory.path().join("base.apk");
    write_file(&artifact, &base_apk());
    let report = directory.path().join("reports").join("inspect report.json");
    let artifact_arg = artifact.to_string_lossy().into_owned();
    let report_arg = report.to_string_lossy().into_owned();

    let output = run_cli_with_sdk(
        &["inspect", &artifact_arg, "--json", &report_arg],
        &sdk,
        &home,
    );
    assert_eq!(output.status.code(), Some(0));
    assert!(output.stdout.is_empty());
    assert!(output.stderr.is_empty());
    let bytes = fs::read(&report).expect("report file");
    assert_ne!(bytes.last(), Some(&b'\n'));
    let value: Value = serde_json::from_slice(&bytes).expect("pure JSON");
    assert_eq!(value["packageName"], "com.example.synthetic");
}

#[test]
fn cli_inspect_split_and_error_exit_classes() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let home = directory.path().join("home");
    fs::create_dir_all(&home).expect("home");

    let container = directory.path().join("app.apkm");
    write_file(
        &container,
        &zip_bytes(&[
            ("base.apk", &base_apk()),
            ("split_config.arm64_v8a.apk", &split_apk()),
        ]),
    );
    let container_arg = container.to_string_lossy().into_owned();
    let output = run_cli_with_sdk(&["inspect", &container_arg, "--json"], &sdk, &home);
    assert_eq!(output.status.code(), Some(0));
    let value: Value = serde_json::from_slice(&output.stdout).expect("JSON");
    assert_eq!(value["containerType"], "APKM");
    assert_eq!(value["splits"][0]["filename"], "base.apk");
    assert_eq!(value["splits"][0]["isBase"], true);
    assert_eq!(value["splits"][1]["splitName"], "config.arm64_v8a");
    assert_eq!(value["splits"][1]["isBase"], false);

    let garbage = directory.path().join("garbage.apk");
    write_file(&garbage, b"not a zip");
    let garbage_arg = garbage.to_string_lossy().into_owned();
    let output = run_cli_with_sdk(&["inspect", &garbage_arg], &sdk, &home);
    assert_eq!(output.status.code(), Some(3));
    assert!(output.stdout.is_empty());
    assert!(String::from_utf8_lossy(&output.stderr).contains("Inspection error"));

    let missing_sdk = directory.path().join("no sdk here");
    let output = run_cli_with_sdk(&["inspect", &container_arg], &missing_sdk, &home);
    assert_eq!(output.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&output.stderr).contains("Inspection error"));
}

#[test]
fn cli_doctor_json_reports_without_writing_the_tool_cache() {
    let directory = tempfile::tempdir().expect("tempdir");
    let sdk = fake_sdk(directory.path(), AAPT2_SCRIPT, BASE_BADGING, SPLIT_BADGING);
    let home = directory.path().join("home");
    fs::create_dir_all(&home).expect("home");
    let workspace = directory.path().join("workspace");

    let output = std::process::Command::new(env!("CARGO_BIN_EXE_apk-lab"))
        .arg("--workspace-root")
        .arg(&workspace)
        .args(["doctor", "--json"])
        .env("ANDROID_HOME", &sdk)
        .env_remove("ANDROID_SDK_ROOT")
        .env_remove("APK_LAB_REPO_ROOT")
        .env("HOME", &home)
        .env("PATH", "")
        .env_remove("APK_LAB_TOOLS_LOCK")
        .env("JAVA_HOME", home.join("missing java"))
        .stdin(std::process::Stdio::null())
        .output()
        .expect("run doctor");

    // Tools are not installed, so readiness is false even though the SDK is
    // present; the JSON report is still emitted on stdout.
    assert_eq!(output.status.code(), Some(2));
    assert!(output.stderr.is_empty());
    let value: Value = serde_json::from_slice(&output.stdout).expect("pure JSON");
    assert_eq!(value["allReady"], false);
    assert_eq!(value["workspaceWritable"], true);
    assert_eq!(value["ciMode"], false);
    assert!(value["credentialsPresent"].as_object().unwrap().is_empty());
    let names: Vec<&str> = value["tools"]
        .as_array()
        .expect("tools")
        .iter()
        .map(|tool| tool["name"].as_str().expect("name"))
        .collect();
    assert_eq!(names, ["morphe", "jadx", "apktool", "baksmali", "smali"]);
    assert!(value["tools"]
        .as_array()
        .expect("tools")
        .iter()
        .all(|tool| tool["installed"] == false
            && tool["actualVersion"] == Value::Null
            && tool["executablePath"] == Value::Null
            && tool["error"] == "Not installed in cache"));
    assert_eq!(value["prerequisites"][0]["name"], "Java");
    assert_eq!(value["prerequisites"][0]["satisfied"], false);
    assert_eq!(value["prerequisites"][1]["name"], "Android Build Tools");
    assert_eq!(value["prerequisites"][1]["satisfied"], true);

    let cache = home.join(".cache/aidans-patches/apk-lab/tools");
    assert!(!cache.exists(), "doctor must not create the tool cache");
    let leftovers: Vec<_> = fs::read_dir(&workspace)
        .expect("workspace")
        .filter_map(Result::ok)
        .filter(|entry| entry.file_name().to_string_lossy().starts_with(".probe_"))
        .collect();
    assert!(leftovers.is_empty());
}
