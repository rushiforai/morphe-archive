//! Deployment transaction contracts.
//!
//! Every external tool is a fake executable script in a temporary directory:
//! `adb`, `gradlew`, `zipalign`, `apksigner`, `aapt2` and `keytool`. The tests
//! therefore exercise real argv construction and ordering without a device,
//! network, Android SDK, JDK, signing key or Python interpreter.

#![cfg(unix)]

use apk_lab::deployment::{
    self, DeployOptions, DeployResult, DeploymentTools, InstallMode, PatchBuildRequest,
    PatchEngine, INLINE_PASSWORD_DEPRECATION, MORPHE_KEYSTORE_SHA256, PASSWORD_FILE_PREFIX,
};
use apk_lab::error::Error;
use apk_lab::inspection::InspectionOptions;
use apk_lab::models::ExitCode;
use apk_lab::tools::ToolEnvironment;
use std::ffi::OsString;
use std::fs;
use std::io::{Cursor, Write};
use std::os::unix::fs::PermissionsExt;
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::Arc;
use std::time::Duration;
use tempfile::TempDir;
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipArchive, ZipWriter};

const PACKAGE: &str = "com.test.app";
const SERIAL: &str = "emulator-5554";

fn write_script(path: &Path, body: &str) {
    fs::write(path, body).expect("write fake tool");
    let mut permissions = fs::metadata(path)
        .expect("fake tool metadata")
        .permissions();
    permissions.set_mode(0o755);
    fs::set_permissions(path, permissions).expect("chmod fake tool");
}

fn apk_bytes(so_compression: CompressionMethod) -> Vec<u8> {
    let mut writer = ZipWriter::new(Cursor::new(Vec::new()));
    writer
        .start_file(
            "AndroidManifest.xml",
            SimpleFileOptions::default().compression_method(CompressionMethod::Deflated),
        )
        .expect("manifest member");
    writer.write_all(b"manifest").expect("write manifest");
    let mut dex = vec![0u8; 0x80];
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
            "lib/arm64-v8a/libnative.so",
            SimpleFileOptions::default().compression_method(so_compression),
        )
        .expect("native member");
    writer.write_all(b"native bytes").expect("write native");
    writer.finish().expect("finish apk").into_inner()
}

fn entry_compression(path: &Path, name: &str) -> CompressionMethod {
    let file = fs::File::open(path).expect("open apk");
    let mut archive = ZipArchive::new(file).expect("open zip");
    let compression = archive.by_name(name).expect("member").compression();
    compression
}

struct Fixture {
    _temp: TempDir,
    root: PathBuf,
    sdk: PathBuf,
    build_tools: PathBuf,
    fake_bin: PathBuf,
    repo: PathBuf,
    home: PathBuf,
    log: PathBuf,
    badging: PathBuf,
    dumpsys: PathBuf,
    input: PathBuf,
    keystore: PathBuf,
    adb: PathBuf,
    keytool: PathBuf,
}

impl Fixture {
    fn new() -> Self {
        let temp = tempfile::tempdir().expect("temp dir");
        let root = fs::canonicalize(temp.path()).expect("canonical temp root");
        let sdk = root.join("android sdk");
        let build_tools = sdk.join("build-tools").join("36.0.0");
        let platform_tools = sdk.join("platform-tools");
        let fake_bin = root.join("fake bin");
        let repo = root.join("repo");
        let home = root.join("home");
        for directory in [&build_tools, &platform_tools, &fake_bin, &repo, &home] {
            fs::create_dir_all(directory).expect("fixture directory");
        }
        fs::write(repo.join("gradlew"), "").expect("gradlew placeholder");

        let log = root.join("calls.log");
        fs::write(&log, "").expect("empty log");
        let badging = root.join("badging.txt");
        fs::write(
            &badging,
            format!(
                "package: name='{PACKAGE}' versionCode='7' versionName='1.0'\n\
                 launchable-activity: name='.MainActivity'  label='' icon=''\n\
                 sdkVersion:'21'\ntargetSdkVersion:'34'\n"
            ),
        )
        .expect("badging fixture");
        let dumpsys = root.join("dumpsys.txt");
        fs::write(&dumpsys, "").expect("dumpsys fixture");

        let input = root.join("input.apk");
        fs::write(&input, apk_bytes(CompressionMethod::Stored)).expect("input apk");
        let keystore = root.join("custom.keystore");
        fs::write(&keystore, b"custom keystore").expect("custom keystore");

        let adb = platform_tools.join("adb");
        let zipalign = build_tools.join("zipalign");
        let apksigner = build_tools.join("apksigner");
        let aapt2 = build_tools.join("aapt2");
        let keytool = fake_bin.join("keytool");
        let gradlew = repo.join("gradlew");

        let quoted_log = shell_quote(&log);
        write_script(
            &adb,
            &format!(
                r#"#!/bin/sh
printf '%s\n' "adb $*" >> {log}
if [ "$1" = "-s" ]; then shift 2; fi
case "$1" in
  devices)
    printf 'List of devices attached\n{SERIAL}\tdevice\n'
    ;;
  install)
    last=""
    for argument in "$@"; do last="$argument"; done
    cp "$last" {root}/installed.apk
    printf 'Success\n'
    exit ${{ADB_INSTALL_EXIT:-0}}
    ;;
  uninstall)
    printf 'Success\n'
    ;;
  shell)
    if [ "$2" = "dumpsys" ]; then
      cat {dumpsys}
    elif [ "$2" = "am" ]; then
      printf 'Starting: Intent {{ cmp=$5 }}\n'
      exit ${{ADB_LAUNCH_EXIT:-0}}
    fi
    ;;
esac
exit 0
"#,
                log = quoted_log,
                root = shell_quote(&root),
                dumpsys = shell_quote(&dumpsys),
            ),
        );
        write_script(
            &zipalign,
            &format!(
                r#"#!/bin/sh
printf '%s\n' "zipalign $*" >> {log}
previous=""
last=""
for argument in "$@"; do
  previous="$last"
  last="$argument"
done
cp "$previous" {root}/zipalign-input.apk
cp "$previous" "$last"
exit ${{ZIPALIGN_EXIT:-0}}
"#,
                log = quoted_log,
                root = shell_quote(&root),
            ),
        );
        write_script(
            &apksigner,
            &format!(
                r#"#!/bin/sh
printf '%s\n' "apksigner $*" >> {log}
store_password=""
previous_argument=""
for argument in "$@"; do
  case "$argument" in
    file:*)
      password_file=${{argument#file:}}
      if [ -f "$password_file" ]; then
        mode=$(stat -c %a "$password_file" 2>/dev/null || stat -f %Lp "$password_file" 2>/dev/null)
        printf 'secret-mode %s\n' "$mode" >> {log}
      fi
      ;;
  esac
  if [ "$previous_argument" = "--ks-pass" ]; then
    store_password=${{argument#file:}}
  fi
  previous_argument=$argument
done
if [ "$1" = "sign" ]; then
  if [ "${{APKSIGNER_SIGN_FAIL:-0}}" = "1" ]; then
    awk 'BEGIN{{for(i=0;i<490;i++)printf "x"}}' >&2
    cat "$store_password" >&2
    awk 'BEGIN{{for(i=0;i<100;i++)printf "y"}}' >&2
    exit 1
  fi
  exit 0
fi
if [ "$1" = "verify" ]; then
  if [ "${{APKSIGNER_VERIFY_FAIL:-0}}" = "1" ]; then
    printf 'signature verification failed\n' >&2
    exit 1
  fi
  printf 'Signer #1 certificate SHA-256 digest: {sha}\n'
  exit 0
fi
printf 'unknown apksigner command\n' >&2
exit 1
"#,
                log = quoted_log,
                sha = MORPHE_KEYSTORE_SHA256,
            ),
        );
        write_script(
            &aapt2,
            &format!(
                r#"#!/bin/sh
printf '%s\n' "aapt2 $*" >> {log}
if [ "$1" = "dump" ] && [ "$2" = "badging" ]; then
  cat {badging}
  exit 0
fi
printf 'unsupported aapt2 command\n' >&2
exit 1
"#,
                log = quoted_log,
                badging = shell_quote(&badging),
            ),
        );
        write_script(
            &keytool,
            &format!(
                r#"#!/bin/sh
printf '%s\n' "keytool $*" >> {log}
keystore=""
while [ $# -gt 0 ]; do
  case "$1" in
    -keystore)
      keystore=$2
      shift 2
      ;;
    -storepass:file|-keypass:file)
      password_file=$2
      mode=$(stat -c %a "$password_file" 2>/dev/null || stat -f %Lp "$password_file" 2>/dev/null)
      printf 'secret-mode %s\n' "$mode" >> {log}
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done
if [ -z "$keystore" ]; then
  printf 'missing -keystore\n' >&2
  exit 1
fi
printf 'fake keystore' > "$keystore"
exit 0
"#,
                log = quoted_log,
            ),
        );
        write_script(
            &gradlew,
            &format!(
                r#"#!/bin/sh
printf '%s\n' "gradlew $*" >> {log}
mkdir -p {repo}/patches/build/libs
printf 'mpp' > {repo}/patches/build/libs/built.mpp
exit ${{GRADLE_EXIT:-0}}
"#,
                log = quoted_log,
                repo = shell_quote(&repo),
            ),
        );

        Self {
            _temp: temp,
            root,
            sdk,
            build_tools,
            fake_bin,
            repo,
            home,
            log,
            badging,
            dumpsys,
            input,
            keystore,
            adb,
            keytool,
        }
    }

    fn tools(&self) -> DeploymentTools {
        DeploymentTools {
            inspection: InspectionOptions {
                env: ToolEnvironment {
                    android_home: Some(self.sdk.clone()),
                    path: Some(OsString::from(format!(
                        "{}:/usr/bin:/bin",
                        self.fake_bin.display()
                    ))),
                    ..ToolEnvironment::default()
                },
                timeout: Duration::from_secs(10),
            },
            adb: self.adb.clone(),
            keytool: Some(self.keytool.clone()),
            morphe_keystore: None,
            home: Some(self.home.clone()),
            cancel: None,
        }
    }

    fn options(&self, out: Option<PathBuf>) -> DeployOptions {
        DeployOptions {
            artifact: self.input.clone(),
            mpp: Some(self.root.join("patches.mpp")),
            build: false,
            repo_start: self.root.clone(),
            package_name: PACKAGE.to_string(),
            all_defaults: true,
            enabled_patches: Vec::new(),
            raw_options: Vec::new(),
            device_serial: None,
            launch: false,
            clean_install: false,
            out_apk: out,
            keystore: Some(self.keystore.clone()),
            ks_alias: None,
            ks_pass: None,
            key_pass: None,
        }
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
            .unwrap_or_else(|| panic!("no log line starting with {prefix:?}"))
    }

    fn badging_package(&self, package: &str) {
        fs::write(
            &self.badging,
            format!(
                "package: name='{package}' versionCode='7' versionName='1.0'\n\
                 launchable-activity: name='.MainActivity'  label='' icon=''\n"
            ),
        )
        .expect("rewrite badging");
    }

    fn installed_signature(&self, signature: Option<&str>) {
        let text = signature.map_or_else(String::new, |signature| {
            format!(
                "Packages:\n  Package [com.test.app] (abc):\n    signatures=PackageSignatures{{def, [{signature}]}}\n"
            )
        });
        fs::write(&self.dumpsys, text).expect("rewrite dumpsys");
    }
}

fn shell_quote(path: &Path) -> String {
    format!("'{}'", path.display())
}

struct FakeEngine {
    apk: Vec<u8>,
    patches: Vec<String>,
    fail: Option<&'static str>,
    log: PathBuf,
}

impl FakeEngine {
    fn new(fixture: &Fixture) -> Self {
        Self {
            apk: apk_bytes(CompressionMethod::Stored),
            patches: vec!["P1".to_string()],
            fail: None,
            log: fixture.log.clone(),
        }
    }
}

impl PatchEngine for FakeEngine {
    fn apply(&self, request: &PatchBuildRequest<'_>) -> Result<Vec<String>, Error> {
        let mut log = fs::OpenOptions::new()
            .append(true)
            .open(&self.log)
            .expect("open call log");
        writeln!(
            log,
            "engine {} {}",
            request.mpp.display(),
            request.package_name
        )
        .expect("log engine");
        if let Some(message) = self.fail {
            return Err(Error::infrastructure(message));
        }
        fs::create_dir_all(request.output_apk.parent().expect("output parent"))
            .expect("staging output parent");
        fs::write(request.output_apk, &self.apk).expect("write patched apk");
        Ok(self.patches.clone())
    }
}

fn deploy(
    fixture: &Fixture,
    options: &DeployOptions,
    engine: &FakeEngine,
) -> Result<DeployResult, Error> {
    deployment::deploy_artifact(options, &fixture.tools(), engine)
}

#[test]
fn deploy_requires_mpp_or_build_and_accepts_either_source() {
    let fixture = Fixture::new();

    let error = deployment::resolve_deploy_bundle(None, false, &fixture.root)
        .expect_err("neither source must be rejected");
    assert!(matches!(error, Error::Usage(_)));
    assert_eq!(error.message(), "Either --mpp or --build must be specified");
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    assert!(fixture.lines().is_empty(), "no tool may run");

    let source = deployment::resolve_bundle_source(None, true, &fixture.repo)
        .expect("build source accepted");
    match source {
        deployment::BundleSource::Build(root) => assert_eq!(root, fixture.repo),
        deployment::BundleSource::Existing(_) => panic!("expected build source"),
    }

    let mut parsed =
        deployment::parse_deploy_args(&["input.apk".to_string()]).expect("parse deploy");
    parsed.artifact = fixture.input.clone();
    parsed.repo_start = fixture.root.clone();
    assert!(parsed.mpp.is_none());
    assert!(!parsed.build);
    let error = deploy(&fixture, &parsed, &FakeEngine::new(&fixture))
        .expect_err("deploy without --mpp or --build must fail");
    assert_eq!(error.message(), "Either --mpp or --build must be specified");
    assert!(
        !fixture.lines().iter().any(|line| line.starts_with("adb")),
        "rejection must precede device communication"
    );

    let explicit = fixture.root.join("explicit.mpp");
    fs::write(&explicit, b"mpp").expect("explicit mpp");
    match deployment::resolve_bundle_source(Some(&explicit), true, &fixture.root)
        .expect("explicit mpp wins")
    {
        deployment::BundleSource::Existing(path) => assert_eq!(path, explicit),
        deployment::BundleSource::Build(_) => panic!("--mpp must win over --build"),
    }
}

#[test]
fn deploy_builds_the_newest_bundle_when_requested() {
    let fixture = Fixture::new();
    let mut options = fixture.options(Some(fixture.root.join("out.apk")));
    options.mpp = None;
    options.build = true;
    options.repo_start = fixture.repo.clone();

    let result = deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect("build deploy");
    assert_eq!(result.install_mode, InstallMode::Reinstall);
    assert!(fixture.root.join("out.apk").is_file());
    let lines = fixture.lines();
    assert!(lines
        .iter()
        .any(|line| line.starts_with("gradlew :patches:buildAndroid")));
    assert!(lines.iter().any(|line| line.starts_with(&format!(
        "engine {}",
        fixture.repo.join("patches/build/libs/built.mpp").display()
    ))));
}

#[test]
fn deploy_rejects_every_output_alias_before_staging_or_device_contact() {
    let fixture = Fixture::new();
    let input_bytes = fs::read(&fixture.input).expect("input bytes");

    let symlink = fixture.root.join("link.apk");
    std::os::unix::fs::symlink(&fixture.input, &symlink).expect("symlink");

    let hardlink = fixture.root.join("hardlink.apk");
    fs::hard_link(&fixture.input, &hardlink).expect("hardlink");

    let dotdot = fixture.root.join("nested").join("..").join("input.apk");
    fs::create_dir_all(fixture.root.join("nested")).expect("nested dir");

    for output in [
        fixture.input.clone(),
        symlink.clone(),
        hardlink.clone(),
        dotdot,
    ] {
        let options = fixture.options(Some(output.clone()));
        let error = deploy(&fixture, &options, &FakeEngine::new(&fixture))
            .expect_err("alias must be rejected");
        assert!(matches!(error, Error::Usage(_)), "output {output:?}");
        assert_eq!(
            error.message(),
            "Deployment output must not overwrite the input artifact"
        );
        assert_eq!(fs::read(&fixture.input).expect("input bytes"), input_bytes);
        assert!(fixture.lines().is_empty(), "no staging or device contact");
    }
    assert!(symlink.is_symlink());
}

#[test]
fn deploy_preserves_existing_output_when_signing_fails() {
    let fixture = Fixture::new();
    let output = fixture.root.join("existing.apk");
    fs::write(&output, b"ORIGINAL_FILE_BYTES").expect("existing output");

    let mut options = fixture.options(Some(output.clone()));
    options.ks_pass = Some("store-secret-value".to_string());
    options.key_pass = Some("key-secret-value".to_string());
    fixture.lines();

    // Force apksigner sign to fail by rewriting the script's failure branch.
    let apksigner = fixture.build_tools.join("apksigner");
    let script = fs::read_to_string(&apksigner).expect("apksigner script");
    let script = script.replace("APKSIGNER_SIGN_FAIL:-0", "APKSIGNER_SIGN_FAIL:-1");
    write_script(&apksigner, &script);

    let error =
        deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect_err("signing must fail");
    assert!(matches!(error, Error::Infrastructure(_)));
    assert_eq!(
        fs::read(&output).expect("output bytes"),
        b"ORIGINAL_FILE_BYTES"
    );
    assert!(!error.message().contains("store-secret-value"));
    assert!(!error.message().contains("key-secret-value"));
    let lines = fixture.lines();
    assert!(lines.iter().any(|line| line.starts_with("zipalign")));
    assert!(lines.iter().any(|line| line.starts_with("apksigner sign")));
    assert!(
        !lines.iter().any(|line| line.contains(" install")),
        "install must not run after signing failure"
    );
}

#[test]
fn deploy_cancellation_kills_signing_and_removes_password_files() {
    let fixture = Fixture::new();
    let output = fixture.root.join("cancelled.apk");
    let mut options = fixture.options(Some(output));
    options.ks_pass = Some("cancel-store-secret".to_string());
    options.key_pass = Some("cancel-key-secret".to_string());

    // Slow signing down so cancellation lands while apksigner is running.
    // `exec` leaves the shell as the only process holding the captured pipes,
    // so the group kill cannot race a freshly forked `sleep`.
    let apksigner = fixture.build_tools.join("apksigner");
    let script = fs::read_to_string(&apksigner).expect("apksigner script");
    let script = script.replace(
        "if [ \"$1\" = \"sign\" ]; then\n",
        &format!(
            "if [ \"$1\" = \"sign\" ]; then\n  printf 'signing started\\n' >> '{}'\n  exec sleep 30\n",
            fixture.log.display()
        ),
    );
    write_script(&apksigner, &script);

    let cancel = Arc::new(AtomicBool::new(false));
    let mut tools = fixture.tools();
    tools.cancel = Some(Arc::clone(&cancel));

    let log = fixture.log.clone();
    let signal = Arc::clone(&cancel);
    let (observed_tx, observed_rx) = std::sync::mpsc::channel();
    let starter = std::thread::spawn(move || {
        // The pre-sign phase (adb, patch engine, zipalign) runs under the full
        // test suite's parallelism, so readiness must not be tightly bounded.
        let readiness = Duration::from_secs(120);
        let deadline = std::time::Instant::now() + readiness;
        loop {
            let started = fs::read_to_string(&log)
                .map(|text| text.lines().any(|line| line == "signing started"))
                .unwrap_or(false);
            if started {
                break;
            }
            if std::time::Instant::now() >= deadline {
                let contents = fs::read_to_string(&log)
                    .unwrap_or_else(|error| format!("<unreadable: {error}>"));
                panic!(
                    "apksigner signing did not start within {readiness:?}; log contents:\n{contents}"
                );
            }
            std::thread::sleep(Duration::from_millis(10));
        }
        let _ = observed_tx.send(std::time::Instant::now());
        signal.store(true, Ordering::Relaxed);
    });

    let started = std::time::Instant::now();
    let result = deployment::deploy_artifact(&options, &tools, &FakeEngine::new(&fixture));
    let error_instant = std::time::Instant::now();
    starter.join().expect("signal thread");
    let sign_started = observed_rx
        .recv()
        .expect("starter must report when signing was observed");
    let error = result.expect_err("cancelled signing must fail");

    assert_eq!(error.exit_code(), ExitCode::RuntimeFailure);
    assert!(
        error.message().contains("cancelled"),
        "unexpected error: {}",
        error.message()
    );
    let cancellation_latency = error_instant.duration_since(sign_started);
    assert!(
        cancellation_latency < Duration::from_secs(5),
        "cancellation took {cancellation_latency:?} after signing started"
    );
    assert!(
        started.elapsed() < Duration::from_secs(150),
        "cancellation must not wait for the fake tool's sleep"
    );
    assert!(
        !error.message().contains("cancel-store-secret"),
        "secret leaked: {}",
        error.message()
    );
    assert!(
        !error.message().contains("cancel-key-secret"),
        "secret leaked: {}",
        error.message()
    );

    let leftovers = secret_files(&fixture.root);
    assert!(
        leftovers.is_empty(),
        "credential files left behind: {leftovers:?}"
    );
}

fn secret_files(root: &Path) -> Vec<PathBuf> {
    let mut found = Vec::new();
    let mut pending = vec![root.to_path_buf()];
    while let Some(directory) = pending.pop() {
        let Ok(entries) = fs::read_dir(&directory) else {
            continue;
        };
        for entry in entries.flatten() {
            let path = entry.path();
            if path.is_dir() {
                pending.push(path);
            } else if path
                .file_name()
                .and_then(|name| name.to_str())
                .is_some_and(|name| name.starts_with(".apk-lab-secret-"))
            {
                found.push(path);
            }
        }
    }
    found
}

#[test]
fn deploy_reads_private_password_files_and_keeps_values_off_argv() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    let store_file = fixture.root.join("store.pass");
    let key_file = fixture.root.join("key.pass");
    fs::write(&store_file, "store-file-secret").expect("store password file");
    fs::write(&key_file, "key-file-secret").expect("key password file");
    for path in [&store_file, &key_file] {
        fs::set_permissions(path, fs::Permissions::from_mode(0o600)).expect("private mode");
    }

    let mut options = fixture.options(Some(output));
    options.ks_pass = Some(format!("{PASSWORD_FILE_PREFIX}{}", store_file.display()));
    options.key_pass = Some(format!("{PASSWORD_FILE_PREFIX}{}", key_file.display()));

    deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect("deploy with private files");

    let lines = fixture.lines();
    let sign = lines
        .iter()
        .find(|line| line.starts_with("apksigner sign "))
        .expect("apksigner sign");
    assert!(sign.contains("--ks-pass file:"), "{sign}");
    assert!(sign.contains("--key-pass file:"), "{sign}");
    assert!(!sign.contains("store-file-secret"), "{sign}");
    assert!(!sign.contains("key-file-secret"), "{sign}");
    assert!(
        lines
            .iter()
            .all(|line| !line.contains("store-file-secret") && !line.contains("key-file-secret")),
        "password file contents must never reach argv: {lines:?}"
    );
}

#[test]
fn deploy_rejects_insecure_password_files_and_conflicting_flags() {
    let fixture = Fixture::new();
    let insecure = fixture.root.join("insecure.pass");
    fs::write(&insecure, "secret").expect("insecure password file");
    fs::set_permissions(&insecure, fs::Permissions::from_mode(0o644)).expect("chmod");

    let mut options = fixture.options(Some(fixture.root.join("out.apk")));
    options.ks_pass = Some(format!("{PASSWORD_FILE_PREFIX}{}", insecure.display()));
    let error = deploy(&fixture, &options, &FakeEngine::new(&fixture))
        .expect_err("insecure password file must be rejected");
    assert!(matches!(error, Error::Usage(_)), "{error:?}");
    assert!(
        error.message().contains("insecure permissions"),
        "{}",
        error.message()
    );

    let error = deployment::parse_deploy_args(&[
        "input.apk".to_string(),
        "--ks-pass".to_string(),
        "inline".to_string(),
        "--ks-pass-file".to_string(),
        "file".to_string(),
    ])
    .expect_err("inline and file flags are mutually exclusive");
    assert!(error.message().contains("mutually exclusive"));

    let error = deployment::parse_deploy_args(&[
        "input.apk".to_string(),
        "--key-pass".to_string(),
        "inline".to_string(),
        "--key-pass-file".to_string(),
        "file".to_string(),
    ])
    .expect_err("inline and file flags are mutually exclusive");
    assert!(error.message().contains("mutually exclusive"));
}

#[test]
fn deploy_password_file_flags_parse_and_inline_flags_stay_compatible() {
    let parsed = deployment::parse_deploy_args(&[
        "input.apk".to_string(),
        "--ks-pass-file".to_string(),
        "/tmp/store.pass".to_string(),
        "--key-pass-file".to_string(),
        "/tmp/key.pass".to_string(),
    ])
    .expect("parse file flags");
    assert_eq!(
        parsed.ks_pass.as_deref(),
        Some(format!("{PASSWORD_FILE_PREFIX}/tmp/store.pass").as_str())
    );
    assert_eq!(
        parsed.key_pass.as_deref(),
        Some(format!("{PASSWORD_FILE_PREFIX}/tmp/key.pass").as_str())
    );
    assert_eq!(parsed.ks_pass_file(), Some(Path::new("/tmp/store.pass")));
    assert_eq!(parsed.key_pass_file(), Some(Path::new("/tmp/key.pass")));

    let inline = deployment::parse_deploy_args(&[
        "input.apk".to_string(),
        "--ks-pass".to_string(),
        "inline-store".to_string(),
        "--key-pass".to_string(),
        "inline-key".to_string(),
    ])
    .expect("inline flags still parse");
    assert_eq!(inline.ks_pass.as_deref(), Some("inline-store"));
    assert_eq!(inline.key_pass.as_deref(), Some("inline-key"));
    assert!(INLINE_PASSWORD_DEPRECATION.contains("process listings"));
}

#[test]
fn deploy_orders_alignment_signing_reinspection_install_and_launch() {
    let fixture = Fixture::new();
    let output = fixture.root.join("build").join("target-patched.apk");
    let mut options = fixture.options(Some(output.clone()));
    options.launch = true;

    let result = deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect("deploy");
    assert_eq!(result.package_name, PACKAGE);
    assert_eq!(result.device_serial, SERIAL);
    assert_eq!(result.applied_patches, vec!["P1".to_string()]);
    assert_eq!(result.install_mode, InstallMode::Reinstall);
    assert_eq!(
        result.launch_component.as_deref(),
        Some("com.test.app/com.test.app.MainActivity")
    );
    assert_eq!(result.output_apk, output.display().to_string());
    assert!(output.is_file());

    let engine = fixture.index_of("engine ");
    let align = fixture.index_of("zipalign ");
    let sign = fixture.index_of("apksigner sign ");
    let verbose_verify = fixture.index_of("apksigner verify --verbose ");
    let install = fixture.index_of("adb -s emulator-5554 install ");
    let badging = fixture
        .lines()
        .iter()
        .rposition(|line| line.starts_with("aapt2 dump badging "))
        .expect("launch badging lookup");
    let launch = fixture.index_of("adb -s emulator-5554 shell am start ");

    assert!(engine < align, "patch before alignment");
    assert!(align < sign, "alignment before signing");
    assert!(sign < verbose_verify, "sign before verification");
    assert!(verbose_verify < install, "verification before install");
    assert!(install < badging, "install before launch lookup");
    assert!(badging < launch, "launch lookup before launch");

    let sign_line = &fixture.lines()[sign];
    assert!(sign_line.contains("--ks "));
    assert!(sign_line.contains("--ks-key-alias androiddebugkey"));
    assert!(sign_line.contains("--ks-pass file:"));
    assert!(sign_line.contains("--key-pass file:"));
    assert!(!sign_line.contains("pass:android"));
    assert!(!sign_line.contains("android "));
    assert_eq!(
        fs::read(&output).expect("deployed bytes"),
        apk_bytes(CompressionMethod::Stored)
    );
}

#[test]
fn deploy_replaces_atomically_and_removes_staging() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    fs::write(&output, b"OLD").expect("old output");
    let options = fixture.options(Some(output.clone()));

    let result = deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect("deploy");
    assert_eq!(result.output_apk, output.display().to_string());
    assert_eq!(
        fs::read(&output).expect("new output"),
        apk_bytes(CompressionMethod::Stored)
    );
    let staged: Vec<String> = fs::read_dir(&fixture.root)
        .expect("root entries")
        .flatten()
        .filter_map(|entry| entry.file_name().into_string().ok())
        .filter(|name| name.starts_with("apk-lab-stage-"))
        .collect();
    assert!(
        staged.is_empty(),
        "staging directory must be removed: {staged:?}"
    );
}

#[test]
fn deploy_install_failure_reports_the_replaced_output_and_skips_launch() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    let mut options = fixture.options(Some(output.clone()));
    options.launch = true;

    let adb = fixture.adb.clone();
    let script = fs::read_to_string(&adb).expect("adb script");
    let script = script.replace("${ADB_INSTALL_EXIT:-0}", "${ADB_INSTALL_EXIT:-1}");
    write_script(&adb, &script);

    let error =
        deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect_err("install must fail");
    assert!(matches!(error, Error::Infrastructure(_)));
    assert!(error.message().contains("install failed"));
    assert!(error
        .message()
        .contains(&format!("output was replaced at {}", output.display())));
    assert!(error.message().contains("not installed"));
    assert!(output.is_file());
    assert!(!fixture
        .lines()
        .iter()
        .any(|line| line.contains("shell am start")));
}

#[test]
fn deploy_launch_failure_reports_installed_state() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    let mut options = fixture.options(Some(output.clone()));
    options.launch = true;

    let adb = fixture.adb.clone();
    let script = fs::read_to_string(&adb).expect("adb script");
    let script = script.replace("${ADB_LAUNCH_EXIT:-0}", "${ADB_LAUNCH_EXIT:-1}");
    write_script(&adb, &script);

    let error =
        deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect_err("launch must fail");
    assert!(error.message().contains("launch failed"));
    assert!(error
        .message()
        .contains(&format!("output was replaced at {}", output.display())));
    assert!(error.message().contains("install succeeded"));
    assert!(output.is_file());
}

#[test]
fn deploy_clean_install_uninstalls_first_and_reinstall_preserves_data() {
    let fixture = Fixture::new();
    let reinstall = fixture.options(Some(fixture.root.join("reinstall.apk")));
    deploy(&fixture, &reinstall, &FakeEngine::new(&fixture)).expect("reinstall");
    assert!(fixture.lines().iter().any(|line| line
        == &format!(
            "adb -s {SERIAL} install -r {}",
            fixture.root.join("reinstall.apk").display()
        )));

    fs::write(&fixture.log, "").expect("clear log");
    let mut clean = fixture.options(Some(fixture.root.join("clean.apk")));
    clean.clean_install = true;
    deploy(&fixture, &clean, &FakeEngine::new(&fixture)).expect("clean install");
    let lines = fixture.lines();
    let uninstall = lines
        .iter()
        .position(|line| line == &format!("adb -s {SERIAL} uninstall {PACKAGE}"))
        .expect("uninstall");
    let install = lines
        .iter()
        .position(|line| {
            line == &format!(
                "adb -s {SERIAL} install {}",
                fixture.root.join("clean.apk").display()
            )
        })
        .expect("install");
    assert!(uninstall < install);
    assert!(!lines.iter().any(|line| line.contains(" install -r ")));
}

#[test]
fn deploy_generated_debug_keystore_and_password_files_are_private() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    let mut options = fixture.options(Some(output));
    options.keystore = None;

    deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect("deploy");

    let keystore = fixture.home.join(".android").join("debug.keystore");
    let mode = fs::metadata(&keystore)
        .expect("debug keystore")
        .permissions()
        .mode()
        & 0o777;
    assert_eq!(mode, 0o600);

    let lines = fixture.lines();
    let keytool_line = lines
        .iter()
        .find(|line| line.starts_with("keytool "))
        .expect("keytool invocation");
    assert!(keytool_line.contains("-storepass:file "));
    assert!(keytool_line.contains("-keypass:file "));
    assert!(!keytool_line.contains("-storepass android"));
    assert!(!keytool_line.contains("-keypass android"));
    assert!(!keytool_line.contains(" pass:"));

    let secret_modes = lines
        .iter()
        .filter(|line| line.starts_with("secret-mode "))
        .collect::<Vec<_>>();
    assert_eq!(secret_modes.len(), 4, "two keytool and two apksigner files");
    assert!(secret_modes.iter().all(|line| line == &"secret-mode 600"));
}

#[test]
fn deploy_redacts_secrets_before_truncating_diagnostics() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    let secret = "SUPER-SECRET-DEPLOY-PASSWORD";
    let mut options = fixture.options(Some(output));
    options.ks_pass = Some(secret.to_string());
    options.key_pass = Some(secret.to_string());

    let apksigner = fixture.build_tools.join("apksigner");
    let script = fs::read_to_string(&apksigner).expect("apksigner script");
    let script = script.replace("APKSIGNER_SIGN_FAIL:-0", "APKSIGNER_SIGN_FAIL:-1");
    write_script(&apksigner, &script);

    let error =
        deploy(&fixture, &options, &FakeEngine::new(&fixture)).expect_err("signing must fail");
    let message = error.message();
    assert!(!message.contains(secret), "secret leaked: {message}");
    assert!(message.contains("[REDACTED]"));
    assert!(message.contains("[truncated]"));
    assert!(message.len() < 600, "diagnostic must stay bounded");
}

#[test]
fn deploy_stores_compressed_native_libraries_and_page_aligns() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    let mut engine = FakeEngine::new(&fixture);
    engine.apk = apk_bytes(CompressionMethod::Deflated);

    deploy(&fixture, &fixture.options(Some(output.clone())), &engine).expect("deploy");

    let align_line = fixture
        .lines()
        .into_iter()
        .find(|line| line.starts_with("zipalign "))
        .expect("zipalign");
    assert!(align_line.starts_with("zipalign -f -p 4 "), "{align_line}");

    let staged_input = fixture.root.join("zipalign-input.apk");
    assert_eq!(
        entry_compression(&staged_input, "lib/arm64-v8a/libnative.so"),
        CompressionMethod::Stored
    );
    assert_eq!(
        entry_compression(&staged_input, "classes.dex"),
        CompressionMethod::Deflated
    );
    assert_eq!(
        entry_compression(&output, "lib/arm64-v8a/libnative.so"),
        CompressionMethod::Stored
    );
}

#[test]
fn deploy_leaves_uncompressed_native_libraries_alone() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    deploy(
        &fixture,
        &fixture.options(Some(output)),
        &FakeEngine::new(&fixture),
    )
    .expect("deploy");
    let align_line = fixture
        .lines()
        .into_iter()
        .find(|line| line.starts_with("zipalign "))
        .expect("zipalign");
    assert!(align_line.starts_with("zipalign -f 4 "), "{align_line}");
    assert!(!align_line.contains(" -p "));
}

#[test]
fn deploy_reinspection_mismatch_keeps_existing_output() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    fs::write(&output, b"KEEP_ME").expect("existing output");
    fixture.badging_package("com.other.app");

    let error = deploy(
        &fixture,
        &fixture.options(Some(output.clone())),
        &FakeEngine::new(&fixture),
    )
    .expect_err("package mismatch");
    assert!(error.message().contains("does not match expected"));
    assert_eq!(fs::read(&output).expect("output"), b"KEEP_ME");
    assert!(!fixture
        .lines()
        .iter()
        .any(|line| line.contains(" install ")));
}

#[test]
fn deploy_failure_from_patch_engine_keeps_existing_output() {
    let fixture = Fixture::new();
    let output = fixture.root.join("out.apk");
    fs::write(&output, b"ORIGINAL").expect("existing output");
    let mut engine = FakeEngine::new(&fixture);
    engine.fail = Some("Morphe failed during compilation");

    let error = deploy(&fixture, &fixture.options(Some(output.clone())), &engine)
        .expect_err("patch failure");
    assert!(error.message().contains("Morphe failed during compilation"));
    assert_eq!(fs::read(&output).expect("output"), b"ORIGINAL");
    assert!(!fixture
        .lines()
        .iter()
        .any(|line| line.starts_with("zipalign ")));
}

#[test]
fn installed_morphe_certificate_selects_the_morphe_keystore() {
    let fixture = Fixture::new();
    let morphe_keystore = fixture.root.join("morphe-data").join("morphe.keystore");
    fs::create_dir_all(morphe_keystore.parent().expect("parent")).expect("morphe dir");
    fs::write(&morphe_keystore, b"morphe keystore").expect("morphe keystore");
    fixture.installed_signature(Some(MORPHE_KEYSTORE_SHA256));

    let mut tools = fixture.tools();
    tools.morphe_keystore = Some(morphe_keystore.clone());
    let mut options = fixture.options(Some(fixture.root.join("out.apk")));
    options.keystore = None;

    deployment::deploy_artifact(&options, &tools, &FakeEngine::new(&fixture))
        .expect("deploy with morphe keystore");

    let sign_line = fixture
        .lines()
        .into_iter()
        .find(|line| line.starts_with("apksigner sign "))
        .expect("sign");
    assert!(sign_line.contains(&format!("--ks {}", morphe_keystore.display())));
    assert!(sign_line.contains("--ks-key-alias Morphe"));
    assert!(!fixture
        .lines()
        .iter()
        .any(|line| line.starts_with("keytool ")));
}

#[test]
fn artifact_discovery_prefers_clean_split_over_newer_derivative() {
    let fixture = Fixture::new();
    let app_dir = fixture.repo.join("apk").join("NHL");
    fs::create_dir_all(&app_dir).expect("app dir");
    let clean = app_dir.join("com.nhl.gc1112.free_17.0.0.apkm");
    fs::write(&clean, b"clean").expect("clean artifact");
    let derivative = app_dir.join("NHL-17.0.0-patches-1.8.0.apk");
    fs::write(&derivative, b"patched").expect("derivative");
    let now = std::time::SystemTime::now();
    fs::File::options()
        .write(true)
        .open(&clean)
        .expect("open clean")
        .set_modified(now - Duration::from_secs(60))
        .expect("old mtime");
    fs::File::options()
        .write(true)
        .open(&derivative)
        .expect("open derivative")
        .set_modified(now)
        .expect("new mtime");

    assert_eq!(
        deployment::find_app_artifact("NHL", &fixture.repo, &fixture.home),
        Some(clean)
    );
    assert!(deployment::is_derivative_artifact_name("app-patched.apk"));
    assert!(deployment::is_derivative_artifact_name("x-patches-1.0.apk"));
    assert!(!deployment::is_derivative_artifact_name("app-release.apk"));
}

#[test]
fn dev_no_build_uses_newest_bundle_and_explicit_artifact() {
    let fixture = Fixture::new();
    let libs = fixture.repo.join("patches").join("build").join("libs");
    fs::create_dir_all(&libs).expect("libs");
    let older = libs.join("older.mpp");
    let newer = libs.join("newer.mpp");
    fs::write(&older, b"old").expect("older bundle");
    fs::write(&newer, b"new").expect("newer bundle");
    let old_time = std::time::SystemTime::now() - Duration::from_secs(60);
    fs::File::options()
        .write(true)
        .open(&older)
        .expect("open older")
        .set_modified(old_time)
        .expect("older mtime");

    let result = deployment::run_dev(
        &[
            "--no-build".to_string(),
            "--artifact".to_string(),
            fixture.input.display().to_string(),
        ],
        &fixture.tools(),
        &FakeEngine::new(&fixture),
        &fixture.repo,
        &fixture.home,
    )
    .expect("dev");
    assert_eq!(result.package_name, PACKAGE);
    let lines = fixture.lines();
    assert!(lines
        .iter()
        .any(|line| line.starts_with(&format!("engine {}", newer.display()))));
    assert!(!lines.iter().any(|line| line.starts_with("gradlew ")));
    assert!(lines
        .iter()
        .any(|line| line.contains("shell am start -n com.test.app/com.test.app.MainActivity")));
}

#[test]
fn dev_builds_when_no_build_is_absent_and_finds_artifacts_by_name() {
    let fixture = Fixture::new();
    let app_dir = fixture.repo.join("apk").join("demo");
    fs::create_dir_all(&app_dir).expect("app dir");
    let discovered = app_dir.join("demo.apk");
    fs::write(&discovered, apk_bytes(CompressionMethod::Stored)).expect("discovered apk");

    let result = deployment::run_dev(
        &["demo".to_string()],
        &fixture.tools(),
        &FakeEngine::new(&fixture),
        &fixture.repo,
        &fixture.home,
    )
    .expect("dev build");
    assert_eq!(result.package_name, PACKAGE);
    let lines = fixture.lines();
    assert!(lines
        .iter()
        .any(|line| line.starts_with("gradlew :patches:buildAndroid")));
    assert!(lines.iter().any(|line| line.starts_with(&format!(
        "engine {}",
        fixture.repo.join("patches/build/libs/built.mpp").display()
    ))));
}

#[test]
fn dev_rejects_missing_artifact_and_missing_selection() {
    let fixture = Fixture::new();
    let error = deployment::resolve_dev_artifact(None, None, &fixture.repo, &fixture.home)
        .expect_err("missing selection");
    assert_eq!(
        error.message(),
        "Either app or --artifact must be specified"
    );

    let missing = fixture.root.join("missing.apk");
    let error =
        deployment::resolve_dev_artifact(Some(&missing), None, &fixture.repo, &fixture.home)
            .expect_err("missing explicit artifact");
    assert!(error.message().contains("Artifact not found"));
}

#[test]
fn parse_rejects_conflicting_deploy_flags() {
    let error = deployment::parse_deploy_args(&[
        "input.apk".to_string(),
        "--all".to_string(),
        "-e".to_string(),
        "Patch".to_string(),
    ])
    .expect_err("conflicting selection");
    assert!(error.message().contains("mutually exclusive"));

    let error = deployment::parse_deploy_args(&[
        "input.apk".to_string(),
        "--reinstall".to_string(),
        "--clean-install".to_string(),
    ])
    .expect_err("conflicting install mode");
    assert!(error.message().contains("mutually exclusive"));

    let error = deployment::parse_deploy_args(&["input.apk".to_string(), "--mpp".to_string()])
        .expect_err("missing value");
    assert!(error.message().contains("requires a value"));

    let error = deployment::parse_deploy_args(&["input.apk".to_string(), "--bogus".to_string()])
        .expect_err("unknown flag");
    assert!(error.message().contains("unrecognized option"));
}

#[test]
fn launch_activity_parsing_normalizes_and_rejects_ambiguity() {
    assert_eq!(
        deployment::parse_launcher_activity(
            "launchable-activity: name='.MainActivity'",
            "com.test.app"
        )
        .expect("dot activity"),
        "com.test.app/com.test.app.MainActivity"
    );
    assert_eq!(
        deployment::parse_launcher_activity(
            "launchable-activity: name='com.test.app.MainActivity'",
            "com.test.app"
        )
        .expect("full activity"),
        "com.test.app/com.test.app.MainActivity"
    );
    assert!(deployment::parse_launcher_activity("package: name='x'", "x").is_err());
    assert!(deployment::parse_launcher_activity(
        "launchable-activity: name='.A'\nlaunchable-activity: name='.B'",
        "x"
    )
    .is_err());
}
