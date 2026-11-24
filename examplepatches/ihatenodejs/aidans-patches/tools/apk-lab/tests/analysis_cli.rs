//! Real-executable contracts for the native analysis commands.
//!
//! Every external tool is a fake executable script or fake build-tools binary;
//! no test reaches the network, a device, or a Python interpreter. Artifacts
//! are tiny synthetic APKs built in a temporary directory.

#![cfg(unix)]

use serde_json::{json, Value};
use std::fs;
use std::io::Write;
use std::os::unix::fs::PermissionsExt;
use std::path::{Path, PathBuf};
use std::process::{Command, Output, Stdio};
use tempfile::TempDir;
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipWriter};

const SHA: &str = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

const BADGING: &str = "\
package: name='com.example.synthetic' versionCode='100' versionName='1.0' compileSdkVersion='34'
sdkVersion:'21'
targetSdkVersion:'34'
uses-permission: name='android.permission.INTERNET'
";

const CERT: &str = "Signer #1 certificate SHA-256 digest: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n";

const XMLTREE: &str = r#"N: android=http://schemas.android.com/apk/res/android (line=2)
  E: manifest (line=2)
    E: application (line=10)
      E: activity (line=12)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.MainActivity" (Raw: "com.example.MainActivity")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true
        E: intent-filter (line=15)
          E: action (line=16)
            A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.intent.action.MAIN" (Raw: "android.intent.action.MAIN")
"#;

const AAPT2_SCRIPT: &str = r#"#!/bin/sh
if [ -n "$AAPT2_FAIL" ]; then
  echo "aapt2 dump timed out" >&2
  exit 124
fi
dir="$(dirname "$0")"
case "$1 $2" in
  "dump badging") exec cat "$dir/badging.txt" ;;
  "dump xmltree") exec cat "$dir/xmltree.txt" ;;
  "dump resources") exec cat "$dir/resources.txt" ;;
  *) exit 1 ;;
esac
"#;

const APKSIGNER_SCRIPT: &str = r#"#!/bin/sh
dir="$(dirname "$0")"
exec cat "$dir/certs.txt"
"#;

const DEXDUMP_SCRIPT: &str = r#"#!/bin/sh
case "$1" in
  *classes2.dex) exit 0 ;;
esac
echo "Class descriptor  : 'Lcom/example/Foo;'"
exit 0
"#;

const BAKSMALI_SCRIPT: &str = r#"#!/bin/sh
if [ -n "$BAKSMALI_FAIL" ]; then
  echo "baksmali exploded" >&2
  exit 1
fi
if [ "$3" = "--classes" ]; then
  desc="$4"
  out="$7"
  rel=$(printf '%s' "$desc" | sed 's/^L//; s/;$//')
  mkdir -p "$out/$(dirname "$rel")"
  {
    printf '.class public %s\n\n' "$desc"
    printf '.method public static answer()I\n'
    printf '    const/4 v0, 0x2a\n'
    printf '    return v0\n'
    printf '.end method\n'
  } > "$out/$rel.smali"
  exit 0
fi
if [ "$1" = "d" ]; then
  mkdir -p "$4"
fi
exit 0
"#;

const SMALI_SCRIPT: &str = r#"#!/bin/sh
if [ "$1" = "assemble" ]; then
  if [ -n "$SMALI_FAIL" ]; then
    echo "Synthetic.smali:[6,4] Invalid instruction 'bad_opcode'" >&2
    exit 1
  fi
  exit 0
fi
exit 1
"#;

struct Fixture {
    _temp: TempDir,
    root: PathBuf,
    home: PathBuf,
    sdk: PathBuf,
    lock: PathBuf,
    artifact: PathBuf,
}

impl Fixture {
    fn command(&self, args: &[&str]) -> Command {
        let mut command = Command::new(env!("CARGO_BIN_EXE_apk-lab"));
        command
            .args(args)
            .current_dir(&self.root)
            .env_clear()
            .env("HOME", &self.home)
            .env("APK_LAB_TOOLS_LOCK", &self.lock)
            .env("ANDROID_HOME", &self.sdk)
            .env("PATH", "/usr/bin:/bin");
        command
    }

    fn run(&self, args: &[&str]) -> Output {
        self.command(args).output().expect("run apk-lab")
    }

    fn run_with_env(&self, args: &[&str], env: &[(&str, &str)]) -> Output {
        let mut command = self.command(args);
        for (key, value) in env {
            command.env(key, value);
        }
        command.output().expect("run apk-lab")
    }
}

fn write_script(path: &Path, contents: &str) {
    fs::write(path, contents).expect("write script");
    let mut permissions = fs::metadata(path).expect("script metadata").permissions();
    permissions.set_mode(0o755);
    fs::set_permissions(path, permissions).expect("chmod script");
}

fn install_tool(home: &Path, name: &str, contents: &str) -> PathBuf {
    let directory = home
        .join(".cache/aidans-patches/apk-lab/tools")
        .join(name)
        .join("1.0.0")
        .join(SHA);
    fs::create_dir_all(&directory).expect("tool cache");
    let path = directory.join(name);
    write_script(&path, contents);
    path
}

fn tool_lock(root: &Path) -> PathBuf {
    let tools: serde_json::Map<String, Value> = ["morphe", "jadx", "apktool", "baksmali", "smali"]
        .iter()
        .map(|name| {
            (
                (*name).to_string(),
                json!({
                    "version": "1.0.0",
                    "sha256": SHA,
                    "toolType": "binary",
                    "executablePath": name,
                }),
            )
        })
        .collect();
    let path = root.join("tools.lock.json");
    fs::write(
        &path,
        serde_json::to_vec(&json!({ "tools": tools })).expect("lock"),
    )
    .expect("write lock");
    path
}

fn dex_bytes(strings: &[&str]) -> Vec<u8> {
    let mut data = vec![0u8; 0x70];
    data[..8].copy_from_slice(b"dex\n035\0");
    let ids_offset = 0x70usize;
    let data_offset = ids_offset + strings.len() * 4;
    let mut blob = Vec::new();
    let mut offsets = Vec::new();
    for value in strings {
        offsets.push(data_offset + blob.len());
        blob.push(value.len() as u8);
        blob.extend_from_slice(value.as_bytes());
        blob.push(0);
    }
    data.resize(data_offset, 0);
    for (index, offset) in offsets.iter().enumerate() {
        let position = ids_offset + index * 4;
        data[position..position + 4].copy_from_slice(&(*offset as u32).to_le_bytes());
    }
    data.extend_from_slice(&blob);
    data[0x38..0x3C].copy_from_slice(&(strings.len() as u32).to_le_bytes());
    data[0x3C..0x40].copy_from_slice(&(ids_offset as u32).to_le_bytes());
    let size = data.len() as u32;
    data[0x20..0x24].copy_from_slice(&size.to_le_bytes());
    data
}

fn unity_asset(name: &str) -> Vec<u8> {
    let mut data = vec![0u8; 32];
    let name_bytes = name.as_bytes();
    data.extend_from_slice(&(name_bytes.len() as u32).to_le_bytes());
    data.extend_from_slice(name_bytes);
    data.extend(std::iter::repeat_n(0u8, (4 - (name_bytes.len() % 4)) % 4));
    data.extend_from_slice(&0u16.to_le_bytes());
    data.push(1);
    data.extend(std::iter::repeat_n(0u8, 16));
    data
}

fn il2cpp_metadata() -> Vec<u8> {
    let mut data = vec![0u8; 256];
    data[0..4].copy_from_slice(&0xFAB1_1BAFu32.to_le_bytes());
    data[4..8].copy_from_slice(&29u32.to_le_bytes());
    data[24..28].copy_from_slice(&256u32.to_le_bytes());
    data
}

fn zip_bytes(entries: &[(&str, &[u8])]) -> Vec<u8> {
    let mut writer = ZipWriter::new(std::io::Cursor::new(Vec::new()));
    let options = SimpleFileOptions::default().compression_method(CompressionMethod::Stored);
    for (name, data) in entries {
        writer.start_file(*name, options).expect("start file");
        writer.write_all(data).expect("write member");
    }
    writer.finish().expect("finish zip").into_inner()
}

fn fixture(install_dexdump: bool) -> Fixture {
    let temp = TempDir::new().expect("tempdir");
    let root = temp.path().to_path_buf();
    let home = root.join("home");
    fs::create_dir_all(&home).expect("home");
    let sdk = root.join("android sdk");
    let build_tools = sdk.join("build-tools").join("36.0.0");
    fs::create_dir_all(&build_tools).expect("build tools");
    write_script(&build_tools.join("aapt2"), AAPT2_SCRIPT);
    write_script(&build_tools.join("apksigner"), APKSIGNER_SCRIPT);
    fs::write(build_tools.join("badging.txt"), BADGING).expect("badging");
    fs::write(build_tools.join("certs.txt"), CERT).expect("certs");
    fs::write(build_tools.join("xmltree.txt"), XMLTREE).expect("xmltree");
    fs::write(build_tools.join("resources.txt"), "").expect("resources");
    if install_dexdump {
        write_script(&build_tools.join("dexdump"), DEXDUMP_SCRIPT);
    }

    install_tool(&home, "baksmali", BAKSMALI_SCRIPT);
    install_tool(&home, "smali", SMALI_SCRIPT);

    let lock = tool_lock(&root);
    let artifact = root.join("app.apk");
    let dex = dex_bytes(&["alphaString", "BetaString"]);
    let second_dex = dex_bytes(&["secondDexValue"]);
    let metadata = il2cpp_metadata();
    let assets = unity_asset("Button_HelpCenter");
    let apk = zip_bytes(&[
        ("AndroidManifest.xml", b"manifest"),
        ("classes.dex", &dex),
        ("classes2.dex", &second_dex),
        ("lib/arm64-v8a/libnative.so", b"native"),
        (
            "assets/bin/Data/Managed/Metadata/global-metadata.dat",
            &metadata,
        ),
        ("assets/bin/Data/sharedassets0.assets", &assets),
        ("res/values/strings.xml", b"<resources/>"),
    ]);
    fs::write(&artifact, apk).expect("artifact");

    Fixture {
        _temp: temp,
        root,
        home,
        sdk,
        lock,
        artifact,
    }
}

fn assert_success(output: &Output) {
    assert!(
        output.status.success(),
        "expected success, status={:?} stderr={}",
        output.status.code(),
        String::from_utf8_lossy(&output.stderr)
    );
}

fn parse_json(output: &Output) -> Value {
    serde_json::from_slice(&output.stdout).expect("stdout must be pure JSON")
}

#[test]
fn globally_unknown_command_exits_two() {
    let fixture = fixture(true);
    let output = fixture.run(&["frobnicate"]);
    assert_eq!(output.status.code(), Some(2));
    assert!(output.stdout.is_empty());
    assert!(String::from_utf8_lossy(&output.stderr).contains("unknown command"));
}

#[test]
fn every_analysis_command_help_exits_zero() {
    let fixture = fixture(true);
    for command in [
        "asm",
        "strings",
        "unity",
        "il2cpp",
        "manifest",
        "res",
        "inspect-code",
        "compare",
        "analyze",
        "validate-smali",
        "smali",
    ] {
        let output = fixture.run(&[command, "--help"]);
        assert_success(&output);
        assert!(
            output.stderr.is_empty(),
            "{command} help wrote stderr: {}",
            String::from_utf8_lossy(&output.stderr)
        );
        let text = String::from_utf8_lossy(&output.stdout);
        assert!(text.contains("Usage:"), "{command} help had no usage");
    }
}

#[test]
fn asm_human_and_error_classes() {
    let fixture = fixture(true);
    let output = fixture.run(&["asm", "bl 0x3c98ce4", "--pc", "0x1fcf6e8"]);
    assert_success(&output);
    assert_eq!(String::from_utf8_lossy(&output.stdout), "7f 25 73 94\n");

    let kotlin = fixture.run(&["asm", "mov w1, #1", "--format", "kotlin"]);
    assert_success(&kotlin);
    assert_eq!(
        String::from_utf8_lossy(&kotlin.stdout),
        "byteArrayOf(0x21, 0x00, 0x80.toByte(), 0x52)\n"
    );

    let invalid = fixture.run(&["asm", "definitely-not-an-instruction"]);
    assert_eq!(invalid.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&invalid.stderr).contains("Assembly error:"));
}

#[test]
fn strings_human_and_json_with_dex_filter() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let human = fixture.run(&["strings", &artifact, "-q", "alpha"]);
    assert_success(&human);
    assert_eq!(
        String::from_utf8_lossy(&human.stdout),
        "[base:classes.dex] alphaString\n"
    );

    let json_output = fixture.run(&["strings", &artifact, "--json"]);
    assert_success(&json_output);
    let value = parse_json(&json_output);
    assert!(value.as_array().is_some_and(|rows| rows.len() >= 3));

    let filtered = fixture.run(&["strings", &artifact, "--dex", "classes2.dex", "--json"]);
    assert_success(&filtered);
    let value = parse_json(&filtered);
    assert_eq!(value.as_array().expect("array").len(), 1);
    assert_eq!(value[0]["dex"], "classes2.dex");
    assert_eq!(value[0]["split"], "base");
}

#[test]
fn unity_json_and_human() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let json_output = fixture.run(&[
        "unity",
        &artifact,
        "--gameobject",
        "Button_HelpCenter",
        "--json",
    ]);
    assert_success(&json_output);
    let value = parse_json(&json_output);
    assert_eq!(value[0]["name"], "Button_HelpCenter");
    assert_eq!(value[0]["is_active_value"], 1);
    assert_eq!(value[0]["member"], "assets/bin/Data/sharedassets0.assets");

    let human = fixture.run(&["unity", &artifact, "--gameobject", "Button_HelpCenter"]);
    assert_success(&human);
    assert!(String::from_utf8_lossy(&human.stdout).contains("Found 1 matching Unity GameObjects:"));
}

#[test]
fn il2cpp_json_and_human() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let json_output = fixture.run(&["il2cpp", &artifact, "--json"]);
    assert_success(&json_output);
    assert_eq!(parse_json(&json_output), json!([]));

    let human = fixture.run(&["il2cpp", &artifact, "-q", "anything"]);
    assert_success(&human);
    assert!(String::from_utf8_lossy(&human.stdout).contains("No matching IL2CPP symbols found."));
}

#[test]
fn manifest_human_and_json() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let human = fixture.run(&["manifest", &artifact]);
    assert_success(&human);
    assert_eq!(
        String::from_utf8_lossy(&human.stdout),
        "[ACTIVITY] com.example.MainActivity [exported=true] (actions: android.intent.action.MAIN)\n"
    );

    let filter = fixture.run(&["manifest", &artifact, "--filter", "main"]);
    assert_success(&filter);
    assert!(String::from_utf8_lossy(&filter.stdout).contains("MainActivity"));

    let json_output = fixture.run(&["manifest", &artifact, "--json"]);
    assert_success(&json_output);
    let value = parse_json(&json_output);
    assert_eq!(value[0]["type"], "activity");
    assert_eq!(value[0]["intent_actions"][0], "android.intent.action.MAIN");
}

#[test]
fn res_has_no_json_flag_and_queries_human_output() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let output = fixture.run(&["res", &artifact, "--query", "res/values/strings.xml"]);
    assert_success(&output);
    assert!(String::from_utf8_lossy(&output.stdout).contains("Found"));

    let json_flag = fixture.run(&[
        "res",
        &artifact,
        "--query",
        "res/values/strings.xml",
        "--json",
    ]);
    assert_eq!(json_flag.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&json_flag.stderr).contains("unrecognized option"));
}

#[test]
fn inspect_code_human_output() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let output = fixture.run(&["inspect-code", &artifact, "--class", "com.example.Foo"]);
    assert_success(&output);
    let text = String::from_utf8_lossy(&output.stdout);
    assert!(text.contains("Location: base:classes.dex"));
    assert!(text.contains(".method public static answer()I"));
    assert!(
        !text.contains("\u{1b}["),
        "captured stdout must not be colored"
    );
}

#[test]
fn compare_json_success_and_tool_unavailable_exit_two() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let output = fixture.run(&["compare", &artifact, &artifact, "--json"]);
    assert_success(&output);
    let value = parse_json(&output);
    assert_eq!(value["versionChanged"], false);
    assert_eq!(value["dexClassesDelta"], 0);

    // JADX is absent from the fake cache, so class comparison is unavailable.
    let classes = fixture.run(&[
        "compare",
        &artifact,
        &artifact,
        "--class",
        "com.example.Foo",
    ]);
    assert_eq!(classes.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&classes.stdout).contains("APK COMPARISON"));
}

#[test]
fn inspect_code_missing_tool_exits_two() {
    let fixture = fixture(false);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let output = fixture.run(&["inspect-code", &artifact, "--class", "com.example.Foo"]);
    assert_eq!(output.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&output.stderr).contains("Code inspection error"));
}

#[test]
fn invalid_artifact_exits_three() {
    let fixture = fixture(true);
    let invalid = fixture.root.join("not-an-apk.bin");
    fs::write(&invalid, b"plain text").expect("invalid artifact");
    let invalid = invalid.to_string_lossy().into_owned();

    let res = fixture.run(&["res", &invalid, "--query", "res/values/strings.xml"]);
    assert_eq!(res.status.code(), Some(3));

    let compare = fixture.run(&["compare", &invalid, &invalid]);
    assert_eq!(compare.status.code(), Some(3));
    assert!(String::from_utf8_lossy(&compare.stderr).contains("Comparison inspection error"));
}

#[test]
fn analyze_tool_failure_exits_four() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let output = fixture.run_with_env(&["analyze", &artifact], &[("BAKSMALI_FAIL", "1")]);
    assert_eq!(output.status.code(), Some(4));
    assert!(String::from_utf8_lossy(&output.stderr).contains("Analysis error:"));
}

#[test]
fn manifest_tool_failure_is_infrastructure_exit_four() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let output = fixture.run_with_env(&["manifest", &artifact], &[("AAPT2_FAIL", "1")]);
    assert_eq!(output.status.code(), Some(4));
    assert!(String::from_utf8_lossy(&output.stderr).contains("Manifest inspection error:"));
}

#[test]
fn analyze_creates_the_documented_workspace_layout() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let workspace = fixture.root.join("workspace with spaces");
    let workspace_arg = workspace.to_string_lossy().into_owned();
    let output = fixture.run(&["--workspace-root", &workspace_arg, "analyze", &artifact]);
    assert_success(&output);
    let text = String::from_utf8_lossy(&output.stdout);
    assert!(text.contains("Analysis workspace created successfully:"));
    assert!(text.contains("  Workspace: "));
    assert!(text.contains("  Libraries: arm64-v8a (1)"));
    assert!(text.contains("--workspace-root '"));
    assert!(text.contains("clean --run '"));

    let mut runs = Vec::new();
    for entry in fs::read_dir(&workspace).expect("workspace") {
        let entry = entry.expect("entry");
        if entry.path().is_dir() {
            collect_run_dirs(&entry.path(), &mut runs);
        }
    }
    assert_eq!(runs.len(), 1, "expected exactly one run directory");
    let run = &runs[0];
    assert!(run.join(".marker.json").is_file());
    assert!(run.join("base.apk").is_file());
    assert!(run.join("lib/arm64-v8a/libnative.so").is_file());
    assert!(run.join("smali").is_dir());
    let marker: Value =
        serde_json::from_slice(&fs::read(run.join(".marker.json")).expect("marker"))
            .expect("marker json");
    assert_eq!(marker["command"], "analyze");
    assert_eq!(marker["toolVersions"]["baksmali"], "1.0.0");
    assert!(marker["configDigest"].as_str().is_some());
}

fn collect_run_dirs(directory: &Path, runs: &mut Vec<PathBuf>) {
    if directory.join(".marker.json").is_file() {
        runs.push(directory.to_path_buf());
        return;
    }
    for entry in fs::read_dir(directory).expect("scan run") {
        let path = entry.expect("entry").path();
        if path.is_dir() {
            collect_run_dirs(&path, runs);
        }
    }
}

#[test]
fn broken_pipe_exits_zero() {
    let fixture = fixture(true);
    let artifact = fixture.artifact.to_string_lossy().into_owned();
    let mut child = fixture
        .command(&["strings", &artifact])
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .expect("spawn");
    drop(child.stdout.take());
    let status = child.wait().expect("wait");
    assert!(status.success(), "closed pipe must exit zero");
}

#[test]
fn validate_smali_static_and_assembler_failures() {
    let fixture = fixture(true);
    let valid = fixture.run(&[
        "validate-smali",
        "--snippet",
        "return-void",
        "--locals",
        "0",
    ]);
    assert_success(&valid);
    assert!(String::from_utf8_lossy(&valid.stdout).contains("Validation succeeded"));

    let alias = fixture.run(&["smali", "--snippet", "return-void", "--locals", "0"]);
    assert_success(&alias);

    let assembler = fixture.run_with_env(
        &[
            "validate-smali",
            "--snippet",
            "const/4 v0, 1",
            "--locals",
            "1",
            "--is-static",
        ],
        &[("SMALI_FAIL", "1")],
    );
    assert_eq!(assembler.status.code(), Some(2));
    let text = String::from_utf8_lossy(&assembler.stdout);
    assert!(text.contains("ASSEMBLER_SYNTAX_ERROR"));
    assert!(text.contains("Line 2"));
}
