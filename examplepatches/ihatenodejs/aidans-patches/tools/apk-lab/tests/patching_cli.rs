//! End-to-end contracts for the patching, deployment and device commands.
//!
//! Every external tool is a fake executable in a temporary directory. Morphe,
//! adb, Gradle, zipalign, apksigner, aapt2, dexdump and keytool are scripted,
//! so no test touches a device, the network, a JDK, an Android SDK, or Python.

#![cfg(unix)]

use serde_json::{json, Value};
use std::fs;
use std::io::{Read, Write};
use std::os::unix::fs::PermissionsExt;
use std::path::{Path, PathBuf};
use std::process::{Command, Output, Stdio};
use tempfile::TempDir;
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipWriter};

const PACKAGE: &str = "com.example.synthetic";
const SERIAL: &str = "emulator-5554";
const SHA: &str = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

const BADGING: &str = "\
package: name='com.example.synthetic' versionCode='100' versionName='1.0' compileSdkVersion='34'
launchable-activity: name='.MainActivity' label='' icon=''
sdkVersion:'21'
targetSdkVersion:'34'
";

const CRASH_LOGCAT: &str = "\
10-15 12:00:00.000  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main
10-15 12:00:00.000  1234  1234 E AndroidRuntime: Process: com.example.synthetic, PID: 1234
10-15 12:00:00.000  1234  1234 E AndroidRuntime: java.lang.VerifyError: Rejecting class com.example.Bad
10-15 12:00:00.000  1234  1234 E AndroidRuntime:     at com.example.app.MainActivity.onCreate(MainActivity.java:20)
";

const LIVE_CRASH: &str = "10-15 12:00:00.000  1234  1234 E AndroidRuntime: FATAL EXCEPTION: main";

const UI_XML: &str = r#"<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<hierarchy rotation="0">
  <node index="0" text="Must &amp; Watch" resource-id="" class="android.widget.TextView" package="com.example.synthetic" content-desc="" clickable="false" enabled="true" bounds="[32,297][861,361]" />
  <node index="1" text="" resource-id="" class="android.view.View" package="com.example.synthetic" content-desc="media" clickable="true" enabled="true" bounds="[281,2259][360,2290]" />
  <node index="2" text="Save" resource-id="com.example.synthetic:id/save" class="android.widget.Button" package="com.example.synthetic" content-desc="" clickable="true" enabled="true" bounds="[100,200][200,300]" />
</hierarchy>
"#;

fn write_script(path: &Path, contents: &str) {
    fs::write(path, contents).expect("write fake tool");
    let mut permissions = fs::metadata(path).expect("fake metadata").permissions();
    permissions.set_mode(0o755);
    fs::set_permissions(path, permissions).expect("chmod fake tool");
}

fn apk_bytes(dex_fill: u8) -> Vec<u8> {
    let mut writer = ZipWriter::new(std::io::Cursor::new(Vec::new()));
    writer
        .start_file(
            "AndroidManifest.xml",
            SimpleFileOptions::default().compression_method(CompressionMethod::Deflated),
        )
        .expect("manifest member");
    writer.write_all(b"manifest").expect("write manifest");
    let mut dex = vec![dex_fill; 0x90];
    dex[..8].copy_from_slice(b"dex\n035\0");
    writer
        .start_file(
            "classes.dex",
            SimpleFileOptions::default().compression_method(CompressionMethod::Deflated),
        )
        .expect("dex member");
    writer.write_all(&dex).expect("write dex");
    writer
        .start_file(
            "resources.arsc",
            SimpleFileOptions::default().compression_method(CompressionMethod::Deflated),
        )
        .expect("resources member");
    writer.write_all(b"resources").expect("write resources");
    writer.finish().expect("finish apk").into_inner()
}

fn write_tool_cache(home: &Path, name: &str) -> PathBuf {
    let directory = home
        .join(".cache/aidans-patches/apk-lab/tools")
        .join(name)
        .join("1.0.0")
        .join(SHA);
    fs::create_dir_all(&directory).expect("tool cache");
    directory
}

struct Fixture {
    _temp: TempDir,
    root: PathBuf,
    home: PathBuf,
    sdk: PathBuf,
    repo: PathBuf,
    log: PathBuf,
    lock: PathBuf,
    badging: PathBuf,
    logcat: PathBuf,
    ui_xml: PathBuf,
    dumpsys: PathBuf,
    live_log: PathBuf,
    input: PathBuf,
    patched: PathBuf,
    mpp: PathBuf,
    keystore: PathBuf,
}

impl Fixture {
    fn new() -> Self {
        let temp = tempfile::tempdir().expect("temp dir");
        let root = fs::canonicalize(temp.path()).expect("canonical temp root");
        let home = root.join("home");
        let sdk = root.join("sdk");
        let build_tools = sdk.join("build-tools").join("36.0.0");
        let platform_tools = sdk.join("platform-tools");
        let repo = root.join("repo");
        let fake_bin = root.join("bin");
        for directory in [
            &home,
            &build_tools,
            &platform_tools,
            &repo,
            &fake_bin,
            &repo.join("patches/build/libs"),
        ] {
            fs::create_dir_all(directory).expect("fixture directory");
        }

        let log = root.join("calls.log");
        fs::write(&log, "").expect("empty log");
        let badging = root.join("badging.txt");
        fs::write(&badging, BADGING).expect("badging");
        let logcat = root.join("logcat.txt");
        fs::write(&logcat, CRASH_LOGCAT).expect("logcat");
        let ui_xml = root.join("ui.xml");
        fs::write(&ui_xml, UI_XML).expect("ui xml");
        let dumpsys = root.join("dumpsys.txt");
        fs::write(&dumpsys, "").expect("dumpsys");
        let live_log = root.join("live.log");
        fs::write(&live_log, "").expect("live log");
        let input = root.join("input.apk");
        fs::write(&input, apk_bytes(0x11)).expect("input apk");
        let patched = root.join("patched.apk");
        fs::write(&patched, apk_bytes(0x22)).expect("patched apk");
        let mpp = root.join("patches.mpp");
        fs::write(&mpp, b"mpp").expect("mpp");
        let keystore = root.join("custom.keystore");
        fs::write(&keystore, b"custom keystore").expect("keystore");
        fs::write(repo.join("gradlew"), "").expect("gradlew placeholder");
        fs::write(repo.join("patches/build/libs/built.mpp"), b"mpp").expect("built mpp");

        let patches_list = json!({
            "version": "1.2.3",
            "patches": [{
                "name": "Test Patch",
                "description": "synthetic",
                "default": true,
                "compatiblePackages": [{"packageName": PACKAGE}],
                "dependencies": [],
                "options": [{
                    "key": "enabled",
                    "title": "Enabled",
                    "description": "",
                    "required": false,
                    "default": true,
                    "type": "Boolean"
                }]
            }]
        });
        fs::write(
            repo.join("patches-list.json"),
            serde_json::to_vec(&patches_list).expect("patches list"),
        )
        .expect("write patches list");

        let morphe_dir = write_tool_cache(&home, "morphe");
        let mut tools = serde_json::Map::new();
        tools.insert(
            "morphe".to_string(),
            json!({
                "version": "1.0.0",
                "sha256": SHA,
                "toolType": "binary",
                "executablePath": "morphe",
            }),
        );
        for name in ["jadx", "apktool", "baksmali"] {
            tools.insert(
                name.to_string(),
                json!({
                    "version": "1.0.0",
                    "sha256": SHA,
                    "toolType": "binary",
                    "executablePath": name,
                }),
            );
        }
        let lock = root.join("tools.lock.json");
        fs::write(
            &lock,
            serde_json::to_vec(&json!({"tools": tools})).expect("lock"),
        )
        .expect("write lock");

        let aapt2 = build_tools.join("aapt2");
        write_script(
            &aapt2,
            r#"#!/bin/sh
if [ "$1" = "dump" ] && [ "$2" = "badging" ]; then
  cat "$FAKE_BADGING"
  exit 0
fi
exit 0
"#,
        );
        let apksigner = build_tools.join("apksigner");
        write_script(
            &apksigner,
            r#"#!/bin/sh
printf 'apksigner %s\n' "$*" >> "$FAKE_LOG"
if [ "$1" = "verify" ]; then
  printf 'Signer #1 certificate SHA-256 digest: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n'
fi
exit 0
"#,
        );
        let zipalign = build_tools.join("zipalign");
        write_script(
            &zipalign,
            r#"#!/bin/sh
printf 'zipalign %s\n' "$*" >> "$FAKE_LOG"
previous=""
last=""
for argument in "$@"; do
  previous="$last"
  last="$argument"
done
cp "$previous" "$last"
exit 0
"#,
        );
        let dexdump = build_tools.join("dexdump");
        write_script(
            &dexdump,
            r#"#!/bin/sh
exit 0
"#,
        );

        let keytool = fake_bin.join("keytool");
        write_script(
            &keytool,
            r#"#!/bin/sh
printf 'keytool %s\n' "$*" >> "$FAKE_LOG"
keystore=""
previous=""
for argument in "$@"; do
  if [ "$previous" = "-keystore" ]; then keystore="$argument"; fi
  previous="$argument"
done
if [ -n "$keystore" ]; then : > "$keystore"; fi
exit 0
"#,
        );

        let adb = platform_tools.join("adb");
        write_script(
            &adb,
            r#"#!/bin/sh
printf 'adb %s\n' "$*" >> "$FAKE_LOG"
if [ "$1" = "-s" ]; then shift 2; fi
case "$1" in
  devices)
    printf 'List of devices attached\nemulator-5554\tdevice\n'
    ;;
  logcat)
    if [ "$2" = "-d" ]; then
      cat "$FAKE_LOGCAT"
    else
      if [ -s "$FAKE_LIVE_LOG" ]; then cat "$FAKE_LIVE_LOG"; fi
    fi
    ;;
  install)
    last=""
    for argument in "$@"; do last="$argument"; done
    cp "$last" "$FAKE_INSTALLED" 2>/dev/null || true
    printf 'Success\n'
    ;;
  uninstall)
    printf 'Success\n'
    ;;
  shell)
    shift
    case "$1" in
      date) printf '1700000000 +0000\n' ;;
      dumpsys) cat "$FAKE_DUMPSYS" ;;
      pidof) if [ -s "$FAKE_PID" ]; then cat "$FAKE_PID"; fi ;;
      cat)
        case "$2" in
          /proc/stat) printf 'cpu  100 0 0 0 0 0 0 0 0 0\ncpu0 100 0 0 0 0 0 0 0 0 0\n' ;;
          *) printf '1234 (com.example.synthetic) R 1 1 1 0 -1 4194560 100 0 0 0 100 0 0 0 20 0 1 0 100 0 0\n' ;;
        esac
        ;;
      input) printf 'tap\n' ;;
      am) printf 'Starting: Intent\n' ;;
      kill) printf '' ;;
    esac
    ;;
  exec-out)
    cat "$FAKE_UI_XML"
    ;;
esac
exit 0
"#,
        );

        let gradlew = repo.join("gradlew");
        write_script(
            &gradlew,
            r#"#!/bin/sh
printf 'gradlew %s\n' "$*" >> "$FAKE_LOG"
mkdir -p "$FAKE_REPO/patches/build/libs"
printf 'mpp' > "$FAKE_REPO/patches/build/libs/built.mpp"
exit 0
"#,
        );

        write_script(
            &morphe_dir.join("morphe"),
            r#"#!/bin/sh
printf 'morphe %s\n' "$*" >> "$FAKE_LOG"
out=""
result=""
names="$FAKE_LOG.names"
: > "$names"
while [ $# -gt 0 ]; do
  case "$1" in
    -o) out="$2"; shift 2 ;;
    -r) result="$2"; shift 2 ;;
    -e) printf '%s\n' "$2" >> "$names"; shift 2 ;;
    *) shift ;;
  esac
done
cp "$FAKE_PATCHED_APK" "$out"
printf '{"appliedPatches":[' > "$result"
first=1
while IFS= read -r name; do
  if [ "$first" = "1" ]; then first=0; else printf ',' >> "$result"; fi
  printf '{"name":"%s"}' "$name" >> "$result"
done < "$names"
printf '],"failedPatches":[]}\n' >> "$result"
rm -f "$names"
exit 0
"#,
        );

        let installed = root.join("installed.apk");
        fs::write(&installed, b"").expect("installed placeholder");
        let pid = root.join("pid.txt");
        fs::write(&pid, "").expect("pid placeholder");

        Self {
            _temp: temp,
            root,
            home,
            sdk,
            repo,
            log,
            lock,
            badging,
            logcat,
            ui_xml,
            dumpsys,
            live_log,
            input,
            patched,
            mpp,
            keystore,
        }
    }

    fn command(&self, args: &[&str]) -> Command {
        let mut command = Command::new(env!("CARGO_BIN_EXE_apk-lab"));
        command
            .args(args)
            .current_dir(&self.root)
            .env_clear()
            .env("HOME", &self.home)
            .env(
                "PATH",
                format!("{}:/usr/bin:/bin", self.root.join("bin").display()),
            )
            .env("ANDROID_HOME", &self.sdk)
            .env("APK_LAB_TOOLS_LOCK", &self.lock)
            .env("APK_LAB_REPO_ROOT", &self.repo)
            .env("FAKE_LOG", &self.log)
            .env("FAKE_BADGING", &self.badging)
            .env("FAKE_LOGCAT", &self.logcat)
            .env("FAKE_UI_XML", &self.ui_xml)
            .env("FAKE_DUMPSYS", &self.dumpsys)
            .env("FAKE_LIVE_LOG", &self.live_log)
            .env("FAKE_PATCHED_APK", &self.patched)
            .env("FAKE_INSTALLED", self.root.join("installed.apk"))
            .env("FAKE_PID", self.root.join("pid.txt"))
            .env("FAKE_REPO", &self.repo);
        command
    }

    fn run(&self, args: &[&str]) -> Output {
        self.command(args).output().expect("run apk-lab")
    }

    fn run_at(&self, directory: &Path, args: &[&str]) -> Output {
        let mut command = self.command(args);
        command.current_dir(directory);
        command.output().expect("run apk-lab")
    }

    fn run_env(&self, args: &[&str], env: &[(&str, &Path)]) -> Output {
        let mut command = self.command(args);
        for (key, value) in env {
            command.env(key, value);
        }
        command.output().expect("run apk-lab")
    }

    fn lines(&self) -> Vec<String> {
        fs::read_to_string(&self.log)
            .unwrap_or_default()
            .lines()
            .map(str::to_string)
            .collect()
    }

    fn index_of(&self, prefix: &str) -> usize {
        self.lines()
            .iter()
            .position(|line| line.starts_with(prefix))
            .unwrap_or_else(|| panic!("no log line starting with {prefix:?}: {:?}", self.lines()))
    }

    fn artifact(&self) -> String {
        self.input.to_string_lossy().into_owned()
    }

    fn mpp(&self) -> String {
        self.mpp.to_string_lossy().into_owned()
    }

    fn set_pid(&self, pid: &str) {
        fs::write(self.root.join("pid.txt"), pid).expect("write pid");
    }

    fn set_live_log(&self, text: &str) {
        fs::write(&self.live_log, text).expect("write live log");
    }
}

fn stderr(output: &Output) -> String {
    String::from_utf8_lossy(&output.stderr).into_owned()
}

fn stdout(output: &Output) -> String {
    String::from_utf8_lossy(&output.stdout).into_owned()
}

fn assert_success(output: &Output) {
    assert_eq!(
        output.status.code(),
        Some(0),
        "stdout:\n{}\nstderr:\n{}",
        stdout(output),
        stderr(output)
    );
}

fn assert_exit(output: &Output, code: i32) {
    assert_eq!(
        output.status.code(),
        Some(code),
        "stdout:\n{}\nstderr:\n{}",
        stdout(output),
        stderr(output)
    );
}

#[test]
fn help_screens_document_every_native_operation() {
    let fixture = Fixture::new();
    for (command, needle) in [
        (vec!["check", "--help"], "Usage: apk-lab"),
        (vec!["deploy", "--help"], "Usage: apk-lab deploy"),
        (vec!["dev", "--help"], "Usage: apk-lab dev"),
        (vec!["monitor", "--help"], "Usage: apk-lab monitor"),
        (vec!["crash-trace", "--help"], "Usage: apk-lab crash-trace"),
        (vec!["ui", "--help"], "Usage: apk-lab ui"),
        (vec!["ui", "dump", "--help"], "Usage: apk-lab ui dump"),
        (vec!["ui", "click", "--help"], "Usage: apk-lab ui click"),
    ] {
        let output = fixture.run(&command);
        assert_success(&output);
        assert!(
            stdout(&output).contains(needle),
            "{command:?} help missing {needle:?}: {}",
            stdout(&output)
        );
    }
}

#[test]
fn check_emits_python_shaped_report_with_base_and_boolean_cases() {
    let fixture = Fixture::new();
    let output = fixture.run(&[
        "check",
        &fixture.artifact(),
        "--mpp",
        &fixture.mpp(),
        "--all",
        "--jobs",
        "1",
        "--force",
        "--json",
    ]);
    assert_success(&output);
    let report: Value = serde_json::from_str(&stdout(&output)).expect("report JSON");
    assert_eq!(report["packageName"], PACKAGE);
    assert_eq!(report["versionName"], "1.0");
    assert_eq!(report["versionCode"], 100);
    assert_eq!(report["patchBundleVersion"], "1.2.3");
    assert_eq!(report["overallStatus"], "compatible");
    assert_eq!(report["totalCases"], 2);
    assert_eq!(report["passedCases"], 2);
    assert_eq!(report["failedCases"], 0);
    assert_eq!(report["failureReason"], Value::Null);
    let cases = report["testCases"].as_array().expect("test cases");
    assert_eq!(cases[0]["patchName"], "Test Patch");
    assert_eq!(cases[0]["options"]["enabled"], true);
    assert_eq!(cases[1]["options"]["enabled"], false);
    assert_eq!(cases[0]["success"], true);
    assert!(fixture.lines().iter().any(|line| line.contains("-f")));
}

#[test]
fn check_reports_incompatible_cases_with_exit_one() {
    let fixture = Fixture::new();
    let marker = fixture.root.join("no-patched.apk");
    let output = fixture.run_env(
        &[
            "check",
            &fixture.artifact(),
            "--mpp",
            &fixture.mpp(),
            "--all",
            "--json",
        ],
        &[("FAKE_PATCHED_APK", &marker)],
    );
    assert_exit(&output, 1);
    let report: Value = serde_json::from_str(&stdout(&output)).expect("report JSON");
    assert_eq!(report["overallStatus"], "incompatible");
    assert_eq!(report["passedCases"], 0);
    assert_eq!(report["failedCases"], 2);
}

#[test]
fn check_requires_a_bundle_when_none_was_built() {
    let fixture = Fixture::new();
    let output = fixture.run(&["check", &fixture.artifact()]);
    assert_exit(&output, 2);
    assert!(stderr(&output).contains("No compiled .mpp found in patches/build/libs/"));
}

#[test]
fn deploy_rejects_unsupported_flags_and_missing_bundle_source() {
    let fixture = Fixture::new();
    let unsupported = fixture.run(&["deploy", &fixture.artifact(), "--bogus"]);
    assert_exit(&unsupported, 2);

    let missing = fixture.run(&["deploy", &fixture.artifact(), "--device", SERIAL]);
    assert_exit(&missing, 2);
    assert!(stderr(&missing).contains("Either --mpp or --build must be specified"));
    assert!(
        !fixture.lines().iter().any(|line| line.starts_with("adb")),
        "no device command may run before bundle resolution"
    );
}

#[test]
fn deploy_orders_patch_align_sign_install_and_launch() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    let keystore = fixture.keystore.to_string_lossy().into_owned();
    let out = output.to_string_lossy().into_owned();
    let result = fixture.run(&[
        "deploy",
        &fixture.artifact(),
        "--mpp",
        &fixture.mpp(),
        "--device",
        SERIAL,
        "--launch",
        "--keystore",
        &keystore,
        "--out",
        &out,
    ]);
    assert_success(&result);
    assert!(stdout(&result).contains("Install mode: reinstall"));
    assert!(stdout(&result)
        .contains("Launched: com.example.synthetic/com.example.synthetic.MainActivity"));
    assert!(output.is_file());

    let morphe = fixture.index_of("morphe ");
    let zipalign = fixture.index_of("zipalign ");
    let sign = fixture.index_of("apksigner sign");
    let install = fixture.index_of("adb -s emulator-5554 install");
    let launch = fixture.index_of("adb -s emulator-5554 shell am start");
    assert!(morphe < zipalign, "patch before alignment");
    assert!(zipalign < sign, "alignment before signing");
    assert!(sign < install, "signing before installation");
    assert!(install < launch, "installation before launch");
    assert!(
        fixture.lines()[install].contains(" -r "),
        "default reinstall preserves data"
    );
}

#[test]
fn deploy_builds_a_bundle_and_rejects_missing_artifacts() {
    let fixture = Fixture::new();
    let keystore = fixture.keystore.to_string_lossy().into_owned();
    let result = fixture.run_at(
        &fixture.repo,
        &[
            "deploy",
            &fixture.artifact(),
            "--build",
            "--device",
            SERIAL,
            "--keystore",
            &keystore,
        ],
    );
    assert_success(&result);
    assert!(fixture
        .lines()
        .iter()
        .any(|line| line.starts_with("gradlew ")));
    assert!(fixture
        .lines()
        .iter()
        .any(|line| line.starts_with("morphe ") && line.contains("built.mpp")));

    let missing = fixture.run(&[
        "deploy",
        &fixture.root.join("missing.apk").to_string_lossy(),
        "--mpp",
        &fixture.mpp(),
        "--device",
        SERIAL,
        "--keystore",
        &keystore,
    ]);
    assert_exit(&missing, 2);
    assert!(stderr(&missing).contains("Artifact not found"));
}

#[test]
fn deploy_keeps_credentials_out_of_output_and_tool_argv() {
    let fixture = Fixture::new();
    let keystore = fixture.keystore.to_string_lossy().into_owned();
    let result = fixture.run(&[
        "deploy",
        &fixture.artifact(),
        "--mpp",
        &fixture.mpp(),
        "--device",
        SERIAL,
        "--keystore",
        &keystore,
        "--ks-pass",
        "store-secret-value",
        "--key-pass",
        "key-secret-value",
    ]);
    assert_success(&result);
    let combined = format!("{}{}", stdout(&result), stderr(&result));
    assert!(!combined.contains("store-secret-value"));
    assert!(!combined.contains("key-secret-value"));
    for line in fixture.lines() {
        assert!(
            !line.contains("store-secret-value"),
            "secret in argv: {line}"
        );
        assert!(!line.contains("key-secret-value"), "secret in argv: {line}");
    }
}

#[test]
fn deploy_clean_install_uninstalls_before_installing() {
    let fixture = Fixture::new();
    let keystore = fixture.keystore.to_string_lossy().into_owned();
    let result = fixture.run(&[
        "deploy",
        &fixture.artifact(),
        "--mpp",
        &fixture.mpp(),
        "--device",
        SERIAL,
        "--keystore",
        &keystore,
        "--clean-install",
    ]);
    assert_success(&result);
    assert!(stdout(&result).contains("Install mode: clean-install"));
    let uninstall = fixture.index_of("adb -s emulator-5554 uninstall");
    let install = fixture.index_of("adb -s emulator-5554 install");
    assert!(uninstall < install);
}

#[test]
fn dev_uses_the_newest_existing_bundle_and_launches() {
    let fixture = Fixture::new();
    let artifact = fixture.artifact();
    let result = fixture.run_at(
        &fixture.repo,
        &[
            "dev",
            "--artifact",
            &artifact,
            "--no-build",
            "--device",
            SERIAL,
        ],
    );
    assert_success(&result);
    let text = stdout(&result);
    assert!(text.contains("Repository root:"));
    assert!(text.contains("Using existing bundle:"));
    assert!(text.contains("Found artifact:"));
    assert!(text.contains("Resolved package: com.example.synthetic"));
    assert!(text.contains("Install mode: reinstall"));
    fixture.index_of("adb -s emulator-5554 install");
    fixture.index_of("adb -s emulator-5554 shell am start");
}

#[test]
fn monitor_returns_five_on_a_live_crash_and_prints_threshold_evidence() {
    let fixture = Fixture::new();
    fixture.set_pid("1234\n");
    fixture.set_live_log(LIVE_CRASH);
    let output = fixture.run(&[
        "monitor",
        "--package",
        PACKAGE,
        "--device",
        SERIAL,
        "--timeout",
        "3",
    ]);
    assert_exit(&output, 5);
    assert!(stderr(&output).contains("Live Crash detected"));
    assert!(stdout(&output).contains("Attached to process PID 1234"));
}

#[test]
fn monitor_completes_cleanly_after_a_healthy_sample() {
    let fixture = Fixture::new();
    fixture.set_pid("1234\n");
    let output = fixture.run(&[
        "monitor",
        "--package",
        PACKAGE,
        "--device",
        SERIAL,
        "--timeout",
        "0",
    ]);
    assert_success(&output);
    assert!(stdout(&output).contains("Monitoring completed: process healthy"));
}

#[test]
fn crash_trace_supports_text_and_json_output() {
    let fixture = Fixture::new();
    let text = fixture.run(&["crash-trace", "--package", PACKAGE, "--device", SERIAL]);
    assert_success(&text);
    let body = stdout(&text);
    assert!(body.contains("Exception: java.lang.VerifyError"));
    assert!(body.contains("at com.example.app.MainActivity.onCreate"));

    let json = fixture.run(&[
        "crash-trace",
        "--package",
        PACKAGE,
        "--device",
        SERIAL,
        "--json",
    ]);
    assert_success(&json);
    let reports: Value = serde_json::from_str(&stdout(&json)).expect("crash JSON");
    assert_eq!(reports[0]["process"], PACKAGE);
    assert_eq!(reports[0]["pid"], 1234);
    assert_eq!(reports[0]["exception_type"], "java.lang.VerifyError");
}

#[test]
fn ui_dump_filters_text_and_clickable_nodes_in_both_formats() {
    let fixture = Fixture::new();
    let text = fixture.run(&["ui", "dump", "--device", SERIAL, "--clickable"]);
    assert_success(&text);
    let body = stdout(&text);
    assert!(body.contains("android.view.View center=(320, 2274)"));
    assert!(body.contains("android.widget.Button center=(150, 250)"));
    assert!(body.contains(" text=\"Save\""));
    assert!(body.contains(" desc=\"media\""));
    assert!(!body.contains("Must & Watch"));

    let json = fixture.run(&["ui", "dump", "--device", SERIAL, "--text", "save", "--json"]);
    assert_success(&json);
    let nodes: Value = serde_json::from_str(&stdout(&json)).expect("ui JSON");
    assert_eq!(nodes.as_array().expect("nodes").len(), 1);
    assert_eq!(nodes[0]["text"], "Save");
    assert_eq!(nodes[0]["contentDesc"], "");
    assert_eq!(nodes[0]["bounds"], json!([100, 200, 200, 300]));
    assert_eq!(nodes[0]["center"], json!([150, 250]));
}

#[test]
fn ui_click_selects_text_nodes_and_coordinates() {
    let fixture = Fixture::new();
    let node = fixture.run(&["ui", "click", "--device", SERIAL, "--text", "save"]);
    assert_success(&node);
    assert!(stdout(&node).contains("Clicked node at (150, 250)"));
    assert!(fixture
        .lines()
        .iter()
        .any(|line| line == "adb -s emulator-5554 shell input tap 150 250"));

    let coords = fixture.run(&["ui", "click", "--device", SERIAL, "--coords", "12,34"]);
    assert_success(&coords);
    assert_eq!(stdout(&coords).trim(), "Clicked coordinates: (12, 34)");
    assert!(fixture
        .lines()
        .iter()
        .any(|line| line == "adb -s emulator-5554 shell input tap 12 34"));

    let missing = fixture.run(&["ui", "click", "--device", SERIAL, "--text", "absent"]);
    assert_exit(&missing, 2);
    assert!(stderr(&missing).contains("No matching UI node found"));

    let invalid = fixture.run(&["ui", "click", "--device", SERIAL, "--coords", "nope"]);
    assert_exit(&invalid, 2);
    assert!(stderr(&invalid).contains("Invalid coords format"));
}

#[test]
fn unsupported_flags_are_usage_errors_for_every_command() {
    let fixture = Fixture::new();
    for args in [
        vec!["check", "x.apk", "--bogus"],
        vec!["dev", "--bogus"],
        vec!["monitor", "--package", PACKAGE, "--bogus"],
        vec!["crash-trace", "--package", PACKAGE, "--bogus"],
        vec!["ui", "dump", "--bogus"],
        vec!["ui", "click", "--coords", "1,2", "--bogus"],
    ] {
        let output = fixture.run(&args);
        assert_exit(&output, 2);
    }
}

#[test]
fn closed_stdout_pipe_exits_zero() {
    let fixture = Fixture::new();
    let mut nodes =
        String::from("<?xml version='1.0' encoding='UTF-8'?>\n<hierarchy rotation=\"0\">\n");
    for index in 0..3000 {
        nodes.push_str(&format!(
            "  <node index=\"{index}\" text=\"Node {index} with a reasonably long label for pipe pressure\" resource-id=\"\" class=\"android.widget.TextView\" package=\"com.example.synthetic\" content-desc=\"\" clickable=\"false\" enabled=\"true\" bounds=\"[0,0][100,100]\" />\n"
        ));
    }
    nodes.push_str("</hierarchy>\n");
    let big_ui = fixture.root.join("big-ui.xml");
    fs::write(&big_ui, nodes).expect("big ui");

    let mut command = fixture.command(&["ui", "dump", "--device", SERIAL]);
    command
        .env("FAKE_UI_XML", &big_ui)
        .stdout(Stdio::piped())
        .stderr(Stdio::null());
    let mut child = command.spawn().expect("spawn apk-lab");
    let mut pipe = child.stdout.take().expect("stdout pipe");
    let mut buffer = [0u8; 1024];
    pipe.read_exact(&mut buffer).expect("read first chunk");
    drop(pipe);
    let status = child.wait().expect("wait");
    assert_eq!(status.code(), Some(0), "broken pipe must exit 0");
}
