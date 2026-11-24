//! Offline contract tests for native Morphe patch selection, command
//! construction and postcondition verification.
//!
//! Every external program is a fake shell executable and every artifact is a
//! synthetic ZIP in a temporary directory. No test reaches the network, a
//! device, a JVM or Python.

#![cfg(unix)]

use apk_lab::error::Error;
use apk_lab::models::{ArtifactInspection, ContainerType, ExitCode};
use apk_lab::morphe::{
    build_morphe_patch_cmd, build_morphe_patch_set_cmd, generate_test_cases,
    get_compatible_patches, get_member_hashes, get_split_container_input_member_hashes,
    is_patchable_member, load_patches_list, parse_dexdump_class_descriptors,
    resolve_expected_output_package, resolve_patch_selections, ArtifactInspector, Cancellation,
    CheckOptions, CheckRunner, DexDump, DexTool, MorpheTool, PatchCommandPaths, PatchDef,
    PatchOptionDef, PatchOptions, PatchTestCase, ToolVersions,
};
use serde_json::{json, Value};
use std::collections::BTreeSet;
use std::fs;
use std::io::Write;
use std::os::unix::fs::PermissionsExt;
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::Arc;
use std::time::{Duration, Instant};
use tempfile::TempDir;
use zip::write::SimpleFileOptions;
use zip::{CompressionMethod, ZipWriter};

// ---------------------------------------------------------------------------
// Fixtures
// ---------------------------------------------------------------------------

fn write_zip(path: &Path, entries: &[(&str, &[u8])]) {
    let mut writer = ZipWriter::new(fs::File::create(path).expect("create zip"));
    let options = SimpleFileOptions::default().compression_method(CompressionMethod::Stored);
    for (name, bytes) in entries {
        writer.start_file(*name, options).expect("start member");
        writer.write_all(bytes).expect("write member");
    }
    writer.finish().expect("finish zip");
}

/// Builds a minimal valid DEX that declares one class per string; each type
/// descriptor is the corresponding string entry.
fn mock_dex(strings: &[&str]) -> Vec<u8> {
    fn uleb128(mut value: u64) -> Vec<u8> {
        let mut out = Vec::new();
        loop {
            let byte = (value & 0x7F) as u8;
            value >>= 7;
            out.push(if value == 0 { byte } else { byte | 0x80 });
            if value == 0 {
                return out;
            }
        }
    }

    let header_size = 0x70_usize;
    let string_ids_off = header_size;
    let data_off = string_ids_off + strings.len() * 4;
    let mut string_data = Vec::new();
    let mut offsets = Vec::new();
    for value in strings {
        offsets.push(data_off + string_data.len());
        string_data.extend(uleb128(value.chars().count() as u64));
        string_data.extend_from_slice(value.as_bytes());
        string_data.push(0);
    }
    let type_ids_off = data_off + string_data.len();
    let class_defs_off = type_ids_off + strings.len() * 4;

    let mut dex = vec![0_u8; header_size];
    dex[0..4].copy_from_slice(b"dex\n");
    dex[4..8].copy_from_slice(b"035\x00");
    dex[0x38..0x3C].copy_from_slice(&(strings.len() as u32).to_le_bytes());
    dex[0x3C..0x40].copy_from_slice(&(string_ids_off as u32).to_le_bytes());
    dex[0x40..0x44].copy_from_slice(&(strings.len() as u32).to_le_bytes());
    dex[0x44..0x48].copy_from_slice(&(type_ids_off as u32).to_le_bytes());
    dex[0x60..0x64].copy_from_slice(&(strings.len() as u32).to_le_bytes());
    dex[0x64..0x68].copy_from_slice(&(class_defs_off as u32).to_le_bytes());
    for offset in offsets {
        dex.extend_from_slice(&(offset as u32).to_le_bytes());
    }
    dex.extend_from_slice(&string_data);
    for index in 0..strings.len() {
        dex.extend_from_slice(&(index as u32).to_le_bytes());
    }
    for index in 0..strings.len() {
        dex.extend_from_slice(&(index as u32).to_le_bytes());
        dex.extend_from_slice(&[0_u8; 28]);
    }
    dex
}

fn inspect_package(
    path: &Path,
    package_name: &str,
    version_code: u64,
    container_type: ContainerType,
) -> ArtifactInspection {
    ArtifactInspection {
        file_path: path.display().to_string(),
        container_type,
        file_size: 1024,
        sha256: "a".repeat(64),
        package_name: package_name.to_string(),
        version_name: "1.0.0".to_string(),
        version_code,
        min_sdk: Some(24),
        target_sdk: Some(34),
        signing_certificate_sha256: None,
        splits: Vec::new(),
        dex_classes_count: 1,
        dex_methods_count: 1,
        dex_files: vec!["classes.dex".to_string()],
        native_libraries: Vec::new(),
        resources: Vec::new(),
        assets: Vec::new(),
        warnings: Vec::new(),
    }
}

struct MapInspector {
    input_path: PathBuf,
    input: ArtifactInspection,
    output: ArtifactInspection,
}

impl ArtifactInspector for MapInspector {
    fn inspect(&self, path: &Path) -> Result<ArtifactInspection, Error> {
        let resolved = fs::canonicalize(path).unwrap_or_else(|_| path.to_path_buf());
        if resolved == self.input_path {
            Ok(self.input.clone())
        } else {
            Ok(self.output.clone())
        }
    }
}

#[derive(Clone)]
struct FakeDex {
    verify_error: Option<String>,
    classes: BTreeSet<String>,
}

impl FakeDex {
    fn healthy() -> Self {
        Self {
            verify_error: None,
            classes: BTreeSet::new(),
        }
    }
}

impl DexTool for FakeDex {
    fn verify(&self, _apk_path: &Path) -> Result<(), String> {
        match &self.verify_error {
            Some(message) => Err(message.clone()),
            None => Ok(()),
        }
    }

    fn class_descriptors(&self, _apk_path: &Path) -> Result<BTreeSet<String>, String> {
        Ok(self.classes.clone())
    }
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum MorpheMode {
    Ok,
    MissingResult,
    CorruptResult,
    Failed,
    ExitFailure,
    MissingApplied,
    Slow,
    Hang,
}

fn shell_quote(path: &Path) -> String {
    path.display().to_string().replace('\'', "'\\''")
}

fn write_morphe_script(
    directory: &Path,
    state: &Path,
    template: Option<&Path>,
    mode: MorpheMode,
    slow_seconds: &str,
    fail_option: Option<&str>,
) -> PathBuf {
    let mode_text = match mode {
        MorpheMode::Ok => "ok",
        MorpheMode::MissingResult => "missing",
        MorpheMode::CorruptResult => "corrupt",
        MorpheMode::Failed => "failed",
        MorpheMode::ExitFailure => "exitfail",
        MorpheMode::MissingApplied => "missingapplied",
        MorpheMode::Slow => "slow",
        MorpheMode::Hang => "hang",
    };
    let template_text = template.map(shell_quote).unwrap_or_default();
    let fail_option = fail_option
        .map(|value| value.replace('\'', "'\\''"))
        .unwrap_or_default();
    let script = format!(
        r#"#!/bin/sh
set -u
state='{state}'
template='{template}'
mode='{mode}'
sleeptime='{slow}'
failarg='{fail_option}'
out=""
res=""
names=""
first=""
label=""
fail=0
prev=""
for arg in "$@"; do
  case "$prev" in
    -o) out="$arg" ;;
    -r) res="$arg" ;;
    -e)
      if [ -z "$first" ]; then first="$arg"; fi
      if [ -z "$names" ]; then names="{{\"name\":\"$arg\"}}"; else names="$names,{{\"name\":\"$arg\"}}"; fi
      ;;
    -O)
      if [ -n "$failarg" ] && [ "$arg" = "$failarg" ]; then fail=1; fi
      if [ -z "$label" ]; then label="$arg"; else label="$label $arg"; fi
      ;;
  esac
  prev="$arg"
done
label="$first $label"
printf 'start:%s\n' "$label" >> "$state/invocations"
if [ "$mode" = "hang" ]; then
  echo $$ > "$state/pid"
  exec sleep '{slow}'
fi
if [ "$mode" = "slow" ]; then
  sleep '{slow}'
fi
if [ "$mode" = "missing" ]; then
  printf 'end:%s\n' "$label" >> "$state/invocations"
  exit 0
fi
if [ "$mode" = "exitfail" ]; then
  printf 'end:%s\n' "$label" >> "$state/invocations"
  exit 3
fi
if [ -n "$template" ] && [ -n "$out" ]; then cp "$template" "$out"; fi
case "$mode" in
  corrupt) printf '{{' > "$res" ;;
  failed)
    printf '{{"appliedPatches":[],"failedPatches":[{{"name":"%s","reason":"boom"}}]}}' "$first" > "$res"
    exit 1
    ;;
  missingapplied)
    printf '{{"appliedPatches":[{{"name":"Other"}}],"failedPatches":[]}}' > "$res"
    ;;
  *)
    if [ "$fail" -eq 1 ]; then
      printf '{{"appliedPatches":[],"failedPatches":[{{"name":"%s","reason":"option rejected"}}]}}' "$first" > "$res"
      exit 1
    fi
    printf '{{"appliedPatches":[%s],"failedPatches":[]}}' "$names" > "$res"
    ;;
esac
printf 'end:%s\n' "$label" >> "$state/invocations"
exit 0
"#,
        state = shell_quote(state),
        template = template_text,
        mode = mode_text,
        slow = slow_seconds,
        fail_option = fail_option,
    );
    let path = directory.join("fake-morphe");
    fs::write(&path, script).expect("write fake morphe");
    let mut permissions = fs::metadata(&path).expect("script metadata").permissions();
    permissions.set_mode(0o755);
    fs::set_permissions(&path, permissions).expect("chmod script");
    path
}

fn write_patches(path: &Path, patches: Value) {
    fs::write(
        path,
        serde_json::to_vec(&json!({"version": "1.2.3", "patches": patches}))
            .expect("serialize patches"),
    )
    .expect("write patches-list");
}

fn patch_json(name: &str, default: bool, dependencies: &[&str], options: Value) -> Value {
    json!({
        "name": name,
        "description": "",
        "default": default,
        "dependencies": dependencies,
        "compatiblePackages": [{"packageName": "com.test.app"}],
        "options": options,
    })
}

fn boolean_option(key: &str, default: bool) -> Value {
    json!({
        "key": key,
        "title": key,
        "description": "",
        "required": false,
        "default": default,
        "type": "kotlin.Boolean",
    })
}

fn string_option(key: &str, default: &str) -> Value {
    json!({
        "key": key,
        "title": key,
        "description": "",
        "required": false,
        "default": default,
        "type": "kotlin.String",
    })
}

fn resolved(path: &Path) -> PathBuf {
    fs::canonicalize(path)
        .unwrap_or_else(|_| std::path::absolute(path).unwrap_or_else(|_| path.to_path_buf()))
}

fn run_single_case(
    fixture: &Fixture,
    options: &CheckOptions,
) -> Result<(apk_lab::morphe::PatchCompatibilityReport, ExitCode), Error> {
    let input_path = fixture.input_path.clone();
    let inspector = Arc::new(MapInspector {
        input_path: resolved(&input_path),
        input: fixture.input_inspection.clone(),
        output: fixture.output_inspection.clone(),
    });
    let runner = CheckRunner::new(
        MorpheTool::executable(&fixture.script, "1.18.0"),
        inspector,
        Arc::new(fixture.dex.clone()),
    );
    runner.run(options)
}

struct Fixture {
    _temp: TempDir,
    artifact: PathBuf,
    mpp: PathBuf,
    patches: PathBuf,
    workspace: PathBuf,
    state: PathBuf,
    script: PathBuf,
    template: PathBuf,
    input_path: PathBuf,
    input_inspection: ArtifactInspection,
    output_inspection: ArtifactInspection,
    dex: FakeDex,
}

impl Fixture {
    fn new(
        input_entries: &[(&str, &[u8])],
        template_entries: &[(&str, &[u8])],
        patches: Value,
        mode: MorpheMode,
    ) -> Self {
        let temp = TempDir::new().expect("tempdir");
        let root = temp.path();
        let artifact = root.join("input.apk");
        write_zip(&artifact, input_entries);
        let mpp = root.join("bundle.mpp");
        fs::write(&mpp, b"fake bundle").expect("write mpp");
        let patches_path = root.join("patches-list.json");
        write_patches(&patches_path, patches);
        let state = root.join("state");
        fs::create_dir_all(&state).expect("state dir");
        let template = root.join("template.apk");
        write_zip(&template, template_entries);
        fs::write(state.join("invocations"), b"").expect("invocation log");
        let script = write_morphe_script(root, &state, Some(&template), mode, "0.05", None);
        let workspace = root.join("workspace");
        let input_path = resolved(&artifact);
        let input_inspection =
            inspect_package(&input_path, "com.test.app", 100, ContainerType::Apk);
        let output_inspection = inspect_package(
            &root.join("output.apk"),
            "com.test.app",
            100,
            ContainerType::Apk,
        );
        Self {
            _temp: temp,
            artifact,
            mpp,
            patches: patches_path,
            workspace,
            state,
            script,
            template,
            input_path,
            input_inspection,
            output_inspection,
            dex: FakeDex::healthy(),
        }
    }

    fn options(&self) -> CheckOptions {
        let mut options = CheckOptions::new(&self.artifact, &self.mpp);
        options.expected_package = Some("com.test.app".to_string());
        options.all_patches = true;
        options.jobs = Some(1);
        options.workspace_root = self.workspace.clone();
        options.patches_list_path = Some(self.patches.clone());
        options.tool_versions = ToolVersions::from_pairs([
            ("morphe".to_string(), "1.18.0".to_string()),
            ("jadx".to_string(), "1.5.6".to_string()),
        ]);
        options
    }
}

fn default_patch() -> Value {
    patch_json("Patch One", true, &[], json!([]))
}

// ---------------------------------------------------------------------------
// Selection metadata and option binding
// ---------------------------------------------------------------------------

#[test]
fn patchable_member_matches_python_contract() {
    for name in [
        "AndroidManifest.xml",
        "resources.arsc",
        "classes.dex",
        "classes2.dex",
        "res/values/strings.xml",
        "assets/config.json",
        "lib/arm64-v8a/libil2cpp.so",
    ] {
        assert!(is_patchable_member(name), "{name} must be patchable");
    }
    assert!(!is_patchable_member("META-INF/CERT.RSA"));
}

#[test]
fn expected_output_package_honors_only_valid_clone_package() {
    let base = PatchTestCase {
        patch_name: "Normal".to_string(),
        options: PatchOptions::from_pairs([("other", json!("x"))]),
        dependencies: Vec::new(),
    };
    assert_eq!(
        resolve_expected_output_package(&base, "com.example.app"),
        "com.example.app"
    );

    let same = PatchTestCase {
        patch_name: "Same".to_string(),
        options: PatchOptions::from_pairs([("packageName", json!("com.example.app"))]),
        dependencies: Vec::new(),
    };
    assert_eq!(
        resolve_expected_output_package(&same, "com.example.app"),
        "com.example.app"
    );

    let clone = PatchTestCase {
        patch_name: "Clone".to_string(),
        options: PatchOptions::from_pairs([("packageName", json!("com.example.app.morphe"))]),
        dependencies: Vec::new(),
    };
    assert_eq!(
        resolve_expected_output_package(&clone, "com.example.app"),
        "com.example.app.morphe"
    );

    let invalid = PatchTestCase {
        patch_name: "Invalid".to_string(),
        options: PatchOptions::from_pairs([("packageName", json!("not a package"))]),
        dependencies: Vec::new(),
    };
    assert_eq!(
        resolve_expected_output_package(&invalid, "com.example.app"),
        "com.example.app"
    );
}

#[test]
fn generate_cases_baseline_and_each_boolean_inversion_in_declaration_order() {
    let patch = PatchDef {
        name: "Test Patch".to_string(),
        description: String::new(),
        default: true,
        dependencies: vec!["Dep Patch".to_string()],
        options: vec![
            PatchOptionDef::new(
                "enableFeature",
                "",
                "",
                false,
                json!(true),
                "kotlin.Boolean",
            ),
            PatchOptionDef::new(
                "customString",
                "",
                "",
                false,
                json!("default_val"),
                "String",
            ),
            PatchOptionDef::new("disableExtra", "", "", false, json!(false), "Boolean"),
            PatchOptionDef::new(
                "typedButNoBoolDefault",
                "",
                "",
                false,
                json!("x"),
                "Boolean",
            ),
        ],
    };

    let cases = generate_test_cases(&patch);
    assert_eq!(cases.len(), 3);
    assert_eq!(cases[0].options.get("enableFeature"), Some(&json!(true)));
    assert_eq!(
        cases[0].options.get("customString"),
        Some(&json!("default_val"))
    );
    assert_eq!(cases[0].options.get("disableExtra"), Some(&json!(false)));
    assert_eq!(cases[1].options.get("enableFeature"), Some(&json!(false)));
    assert_eq!(cases[1].options.get("disableExtra"), Some(&json!(false)));
    assert_eq!(
        cases[1].options.get("customString"),
        Some(&json!("default_val"))
    );
    assert_eq!(cases[2].options.get("enableFeature"), Some(&json!(true)));
    assert_eq!(cases[2].options.get("disableExtra"), Some(&json!(true)));
    assert_eq!(cases[0].dependencies, vec!["Dep Patch".to_string()]);
}

#[test]
fn compatible_filtering_preserves_check_all_vs_default_closure() {
    let data = json!({
        "patches": [
            patch_json("Patch A", true, &[], json!([])),
            patch_json("Patch B", false, &[], json!([])),
            patch_json("Patch C", true, &[], json!([])),
        ]
    });
    // Patch C is compatible only with another package.
    let mut data = data;
    data["patches"][2]["compatiblePackages"] = json!([{"packageName": "com.other.app"}]);

    let defaults = get_compatible_patches("com.test.app", &data, None, false);
    assert_eq!(
        defaults.iter().map(|p| p.name.as_str()).collect::<Vec<_>>(),
        vec!["Patch A"]
    );
    let all = get_compatible_patches("com.test.app", &data, None, true);
    assert_eq!(
        all.iter().map(|p| p.name.as_str()).collect::<Vec<_>>(),
        vec!["Patch A", "Patch B"]
    );
    let filtered =
        get_compatible_patches("com.test.app", &data, Some(&["Patch B".to_string()]), false);
    assert_eq!(
        filtered.iter().map(|p| p.name.as_str()).collect::<Vec<_>>(),
        vec!["Patch B"]
    );
}

#[test]
fn transitive_dependencies_expand_in_metadata_order() {
    let data = json!({
        "patches": [
            patch_json("PatchDep", false, &[], json!([])),
            patch_json("PatchMid", false, &["PatchDep"], json!([])),
            patch_json("PatchMain", false, &["PatchMid"], json!([])),
            patch_json("PatchOther", false, &[], json!([])),
        ]
    });
    let selections = resolve_patch_selections(
        "com.test.app",
        Some(&["PatchMain".to_string()]),
        false,
        None,
        &data,
    )
    .expect("resolve");
    assert_eq!(
        selections
            .iter()
            .map(|s| s.definition.name.as_str())
            .collect::<Vec<_>>(),
        vec!["PatchDep", "PatchMid", "PatchMain"]
    );
}

#[test]
fn missing_dependency_and_unknown_patch_are_rejected() {
    let data = json!({
        "patches": [
            patch_json("PatchMain", false, &["PatchNope"], json!([])),
        ]
    });
    let error = resolve_patch_selections(
        "com.test.app",
        Some(&["PatchMain".to_string()]),
        false,
        None,
        &data,
    )
    .expect_err("missing dependency must fail");
    assert!(error
        .message()
        .contains("Dependency 'PatchNope' required by 'PatchMain'"));

    let error = resolve_patch_selections(
        "com.test.app",
        Some(&["NotCompatible".to_string()]),
        false,
        None,
        &data,
    )
    .expect_err("unknown patch must fail");
    assert!(error
        .message()
        .contains("Patch 'NotCompatible' is not compatible"));
}

#[test]
fn dependency_cycles_are_rejected_with_the_chain() {
    let data = json!({
        "patches": [
            patch_json("Patch1", true, &["Patch2"], json!([])),
            patch_json("Patch2", true, &["Patch1"], json!([])),
        ]
    });
    let error = resolve_patch_selections("com.test.app", None, true, None, &data)
        .expect_err("cycle must fail");
    assert!(error
        .message()
        .contains("Circular dependency detected: Patch1 -> Patch2 -> Patch1"));
}

#[test]
fn options_are_type_checked_required_and_ambiguous_across_selections() {
    let data = json!({
        "patches": [
            patch_json(
                "PatchA",
                true,
                &[],
                json!([
                    boolean_option("boolOpt", false),
                    string_option("strOpt", "initial"),
                    {"key": "requiredOpt", "title": "", "description": "", "required": true, "default": null, "type": "String"},
                ])
            ),
            patch_json("PatchB", true, &[], json!([boolean_option("shared", true)])),
            patch_json("PatchC", true, &[], json!([boolean_option("shared", false)])),
        ]
    });

    let selections = resolve_patch_selections(
        "com.test.app",
        None,
        true,
        Some(&[
            "boolOpt=TRUE".to_string(),
            "strOpt=custom_string".to_string(),
            "requiredOpt=value".to_string(),
        ]),
        &data,
    )
    .expect("resolve");
    assert_eq!(selections[0].options.get("boolOpt"), Some(&json!(true)));
    assert_eq!(
        selections[0].options.get("strOpt"),
        Some(&json!("custom_string"))
    );
    assert_eq!(
        selections[0].options.get("requiredOpt"),
        Some(&json!("value"))
    );

    let invalid_bool = resolve_patch_selections(
        "com.test.app",
        None,
        true,
        Some(&["boolOpt=yes".to_string(), "requiredOpt=value".to_string()]),
        &data,
    )
    .expect_err("invalid boolean");
    assert!(invalid_bool
        .message()
        .contains("Invalid boolean value 'yes' for option 'boolOpt'"));

    let unknown = resolve_patch_selections(
        "com.test.app",
        None,
        true,
        Some(&[
            "unknownOpt=val".to_string(),
            "requiredOpt=value".to_string(),
        ]),
        &data,
    )
    .expect_err("unknown option");
    assert!(unknown
        .message()
        .contains("Unknown patch option 'unknownOpt'"));

    let no_equals = resolve_patch_selections(
        "com.test.app",
        None,
        true,
        Some(&["requiredOpt".to_string()]),
        &data,
    )
    .expect_err("missing value");
    assert!(no_equals
        .message()
        .contains("Invalid option format 'requiredOpt', expected KEY=VALUE"));

    let missing_required = resolve_patch_selections("com.test.app", None, true, None, &data)
        .expect_err("required option");
    assert!(missing_required
        .message()
        .contains("Required patch option 'requiredOpt'"));

    let ambiguous = resolve_patch_selections(
        "com.test.app",
        None,
        true,
        Some(&["requiredOpt=value".to_string(), "shared=true".to_string()]),
        &data,
    )
    .expect_err("ambiguous option");
    assert!(ambiguous
        .message()
        .contains("Ambiguous patch option 'shared'"));
}

#[test]
fn argv_opens_one_group_per_selection_and_keeps_nondefault_options() {
    let data = json!({
        "patches": [
            patch_json("PatchA", true, &[], json!([boolean_option("k1", true)])),
            patch_json("PatchB", true, &[], json!([boolean_option("k2", false)])),
        ]
    });
    let selections = resolve_patch_selections(
        "com.test.app",
        None,
        true,
        Some(&["k1=false".to_string(), "k2=true".to_string()]),
        &data,
    )
    .expect("resolve");

    let temp = TempDir::new().expect("tempdir");
    let bundle = temp.path().join("patches.mpp");
    let artifact = temp.path().join("in.apk");
    let out_apk = temp.path().join("out.apk");
    let result = temp.path().join("result.json");
    let scratch = temp.path().join("scratch");
    for path in [&bundle, &artifact] {
        fs::write(path, b"x").expect("write fixture");
    }
    fs::create_dir_all(&scratch).expect("scratch");
    let paths =
        PatchCommandPaths::new(&bundle, &artifact, &out_apk, &result, &scratch).with_force(true);

    let command = build_morphe_patch_set_cmd(&selections, &paths);
    let expected = vec![
        "patch".to_string(),
        "--exclusive".to_string(),
        "-p".to_string(),
        resolved(&bundle).display().to_string(),
        "-O".to_string(),
        "k1=false".to_string(),
        "-e".to_string(),
        "PatchA".to_string(),
        "-p".to_string(),
        resolved(&bundle).display().to_string(),
        "-O".to_string(),
        "k2=true".to_string(),
        "-e".to_string(),
        "PatchB".to_string(),
        "--unsigned".to_string(),
        "-t".to_string(),
        resolved(&scratch).display().to_string(),
        "-o".to_string(),
        resolved(&out_apk).display().to_string(),
        "-r".to_string(),
        resolved(&result).display().to_string(),
        "-f".to_string(),
        resolved(&artifact).display().to_string(),
    ];
    // A merged `-p` group (or a dropped case) changes this exact sequence.
    assert_eq!(command, expected);
    assert_eq!(command.iter().filter(|arg| *arg == "-p").count(), 2);
}

#[test]
fn case_command_appends_dependency_groups_and_lowercases_booleans() {
    let temp = TempDir::new().expect("tempdir");
    let bundle = temp.path().join("patches.mpp");
    let artifact = temp.path().join("in.apk");
    let out_apk = temp.path().join("out.apk");
    let result = temp.path().join("result.json");
    let scratch = temp.path().join("scratch");
    for path in [&bundle, &artifact] {
        fs::write(path, b"x").expect("write fixture");
    }
    fs::create_dir_all(&scratch).expect("scratch");
    let paths = PatchCommandPaths::new(&bundle, &artifact, &out_apk, &result, &scratch);
    let options = PatchOptions::from_pairs([
        ("customOption", json!(false)),
        ("count", json!(5)),
        ("noneOption", Value::Null),
    ]);
    let command =
        build_morphe_patch_cmd("Target Patch", &options, &["Dep Patch".to_string()], &paths);

    let expected = vec![
        "patch".to_string(),
        "--exclusive".to_string(),
        "-p".to_string(),
        resolved(&bundle).display().to_string(),
        "-O".to_string(),
        "count=5".to_string(),
        "-O".to_string(),
        "customOption=false".to_string(),
        "-e".to_string(),
        "Target Patch".to_string(),
        "-p".to_string(),
        resolved(&bundle).display().to_string(),
        "-e".to_string(),
        "Dep Patch".to_string(),
        "--unsigned".to_string(),
        "-t".to_string(),
        resolved(&scratch).display().to_string(),
        "-o".to_string(),
        resolved(&out_apk).display().to_string(),
        "-r".to_string(),
        resolved(&result).display().to_string(),
        resolved(&artifact).display().to_string(),
    ];
    assert_eq!(command, expected);
    assert!(!command.iter().any(|arg| arg.contains("noneOption")));
}

// ---------------------------------------------------------------------------
// Hashing and descriptor parsing
// ---------------------------------------------------------------------------

#[test]
fn dexdump_descriptors_and_member_hashes_are_parsed() {
    let output = "\
Class #0            -
  Class descriptor  : 'Lcom/example/MyClass;'
Class #1            -
  Class descriptor  : 'Lapp/aidan/extension/CustomDialog;'
";
    let classes = parse_dexdump_class_descriptors(output);
    assert_eq!(classes.len(), 2);
    assert!(classes.contains("Lcom/example/MyClass;"));
    assert!(classes.contains("Lapp/aidan/extension/CustomDialog;"));

    let temp = TempDir::new().expect("tempdir");
    let apk = temp.path().join("app.apk");
    write_zip(
        &apk,
        &[
            ("classes.dex", b"base_dex_v1"),
            ("res/raw/data.bin", b"raw"),
        ],
    );
    let hashes = get_member_hashes(&apk).expect("hashes");
    assert_eq!(hashes.len(), 2);
    assert_ne!(hashes["classes.dex"], hashes["res/raw/data.bin"]);
}

#[test]
fn split_container_hashes_compare_all_contained_apks() {
    let temp = TempDir::new().expect("tempdir");
    let base = temp.path().join("base.apk");
    write_zip(&base, &[("classes.dex", b"base_dex_v1")]);
    let config = temp.path().join("config.apk");
    write_zip(&config, &[("lib/arm64-v8a/libtest.so", b"lib_code")]);
    let container = temp.path().join("app.apkm");
    write_zip(
        &container,
        &[
            ("base.apk", fs::read(&base).unwrap().as_slice()),
            ("config.arm64.apk", fs::read(&config).unwrap().as_slice()),
        ],
    );

    let hashes = get_split_container_input_member_hashes(&container).expect("split hashes");
    assert!(hashes.contains_key("classes.dex"));
    assert!(hashes.contains_key("lib/arm64-v8a/libtest.so"));

    let output = temp.path().join("out.apk");
    write_zip(
        &output,
        &[
            ("classes.dex", b"base_dex_v1"),
            ("lib/arm64-v8a/libtest.so", b"lib_code"),
        ],
    );
    let output_hashes = get_member_hashes(&output).expect("output hashes");
    for (name, hash) in &output_hashes {
        assert!(
            hashes[name].contains(hash),
            "identical member {name} changed"
        );
    }

    let modified = temp.path().join("out-mod.apk");
    write_zip(
        &modified,
        &[
            ("classes.dex", b"base_dex_v2_patched"),
            ("lib/arm64-v8a/libtest.so", b"lib_code"),
        ],
    );
    let modified_hashes = get_member_hashes(&modified).expect("modified hashes");
    let changed = modified_hashes.iter().any(|(name, hash)| {
        hashes
            .get(name)
            .is_some_and(|input_hashes| !input_hashes.contains(hash))
    });
    assert!(changed);
}

#[test]
fn patches_list_loader_reports_missing_file_as_usage() {
    let temp = TempDir::new().expect("tempdir");
    let error = load_patches_list(temp.path().join("absent.json")).expect_err("missing");
    assert!(error.message().contains("patches-list.json not found"));
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
}

// ---------------------------------------------------------------------------
// Real execution against fake Morphe and fake dexdump
// ---------------------------------------------------------------------------

#[test]
fn missing_result_json_is_a_case_failure_even_on_exit_zero() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::MissingResult,
    );
    let (report, exit_code) = run_single_case(&fixture, &fixture.options()).expect("run");
    assert_eq!(exit_code, ExitCode::CompatibilityFailure);
    assert_eq!(report.total_cases, 1);
    assert_eq!(report.failed_cases, 1);
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(message.contains("failed to write result file"), "{message}");
}

#[test]
fn corrupt_result_json_is_a_case_failure() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::CorruptResult,
    );
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(message.contains("Corrupt Morphe result JSON"), "{message}");
}

#[test]
fn exit_zero_with_failed_result_items_is_a_case_failure() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::Failed,
    );
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(
        message.contains("Morphe reported failure: Patch One: boom"),
        "{message}"
    );
}

#[test]
fn missing_target_in_applied_patches_is_a_case_failure() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::MissingApplied,
    );
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(
        message.contains("Target patch 'Patch One' was not reported"),
        "{message}"
    );
}

#[test]
fn nonzero_exit_without_result_items_reports_stderr() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::ExitFailure,
    );
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(message.contains("failed to write result file"), "{message}");
}

#[test]
fn missing_output_apk_after_success_is_a_case_failure() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::Ok,
    );
    // Remove the template so the fake tool cannot copy an output artifact.
    fs::remove_file(&fixture.template).expect("remove template");
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(message.contains("output APK was not created"), "{message}");
}

#[test]
fn wrong_output_package_and_version_are_rejected() {
    let mut fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::Ok,
    );
    fixture.output_inspection.package_name = "com.example.other".to_string();
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(message.contains("Package name changed"), "{message}");

    fixture.output_inspection.package_name = "com.test.app".to_string();
    fixture.output_inspection.version_code = 101;
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(
        message.contains("Version code changed: 100 -> 101"),
        "{message}"
    );
}

#[test]
fn clone_package_exception_requires_the_declared_valid_package() {
    let options = json!([string_option("packageName", "com.test.app.morphe")]);
    let mut fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([patch_json("Clone App", true, &[], options)]),
        MorpheMode::Ok,
    );
    fixture.output_inspection.package_name = "com.test.app.morphe".to_string();
    let (report, exit_code) = run_single_case(&fixture, &fixture.options()).expect("run");
    assert_eq!(exit_code, ExitCode::Success);
    assert!(report.test_cases[0].success);

    // A different identity is still rejected.
    fixture.output_inspection.package_name = "com.test.app.clone".to_string();
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(message.contains("Package name changed"), "{message}");
}

#[test]
fn invalid_dex_is_rejected_by_dexdump_postcondition() {
    let mut fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::Ok,
    );
    fixture.dex.verify_error =
        Some("dexdump verification failed for classes.dex: bad magic".to_string());
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(
        message.contains("SDK DEX verification failed: dexdump verification failed"),
        "{message}"
    );
}

#[test]
fn unchanged_patchable_members_are_rejected() {
    let fixture = Fixture::new(
        &[
            ("classes.dex", b"same"),
            ("res/raw/data.bin", b"raw"),
            ("META-INF/CERT.RSA", b"cert"),
        ],
        &[
            ("classes.dex", b"same"),
            ("res/raw/data.bin", b"raw"),
            ("META-INF/CERT.RSA", b"cert"),
        ],
        json!([default_patch()]),
        MorpheMode::Ok,
    );
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(
        message.contains("no DEX/resource/native/asset member changed"),
        "{message}"
    );
}

#[test]
fn resource_raw_and_asset_changes_count_as_success() {
    for (name, before, after) in [
        ("res/raw/data.bin", b"raw".as_slice(), b"raw2".as_slice()),
        (
            "assets/config.json",
            b"{}".as_slice(),
            b"{\"a\":1}".as_slice(),
        ),
        ("lib/arm64-v8a/libx.so", b"so".as_slice(), b"so2".as_slice()),
    ] {
        let fixture = Fixture::new(
            &[("classes.dex", b"same"), (name, before)],
            &[("classes.dex", b"same"), (name, after)],
            json!([default_patch()]),
            MorpheMode::Ok,
        );
        let (report, exit_code) = run_single_case(&fixture, &fixture.options()).expect("run");
        assert_eq!(exit_code, ExitCode::Success, "{name}");
        assert!(report.test_cases[0].success, "{name}");
    }
}

#[test]
fn new_dex_with_extension_classes_counts_and_is_inventoried() {
    let mut fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"base"), ("classes2.dex", b"extension")],
        json!([default_patch()]),
        MorpheMode::Ok,
    );
    fixture.dex.classes = [
        "Lcom/example/Existing;".to_string(),
        "Lapp/aidan/extension/Feature;".to_string(),
        "Lapp/aidan/extension/Other;".to_string(),
    ]
    .into_iter()
    .collect();
    let (report, exit_code) = run_single_case(&fixture, &fixture.options()).expect("run");
    assert_eq!(exit_code, ExitCode::Success);
    let case = &report.test_cases[0];
    assert!(case.success, "{:?}", case.error_message);
    assert_eq!(
        case.injected_classes,
        vec![
            "Lapp/aidan/extension/Feature;".to_string(),
            "Lapp/aidan/extension/Other;".to_string(),
        ]
    );
}

#[test]
fn new_dex_without_extension_inventory_does_not_count_as_a_change() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"base"), ("classes2.dex", b"extra")],
        json!([default_patch()]),
        MorpheMode::Ok,
    );
    // No extension class was injected, so an added DEX alone is not evidence
    // that a patch changed the artifact.
    let (report, exit_code) = run_single_case(&fixture, &fixture.options()).expect("run");
    assert_eq!(exit_code, ExitCode::CompatibilityFailure);
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(
        message.contains("no DEX/resource/native/asset member changed"),
        "{message}"
    );
}

#[test]
fn bounded_parallel_execution_restores_report_order_and_warms_once() {
    let patches = json!([
        patch_json(
            "Alpha Patch",
            true,
            &[],
            json!([boolean_option("featureA", true)])
        ),
        patch_json("Beta Patch", true, &[], json!([])),
        patch_json(
            "Gamma Patch",
            true,
            &[],
            json!([boolean_option("featureG", false)])
        ),
    ]);
    let temp = TempDir::new().expect("tempdir");
    let root = temp.path();
    let artifact = root.join("input.apk");
    write_zip(&artifact, &[("classes.dex", b"base")]);
    let mpp = root.join("bundle.mpp");
    fs::write(&mpp, b"mpp").expect("mpp");
    let patches_path = root.join("patches-list.json");
    write_patches(&patches_path, patches);
    let template = root.join("template.apk");
    write_zip(&template, &[("classes.dex", b"patched")]);
    let state = root.join("state");
    fs::create_dir_all(&state).expect("state");
    fs::write(state.join("invocations"), b"").expect("log");
    let script = write_morphe_script(
        root,
        &state,
        Some(&template),
        MorpheMode::Slow,
        "0.08",
        Some("featureG=true"),
    );

    let input_path = resolved(&artifact);
    let mut input = inspect_package(&input_path, "com.test.app", 100, ContainerType::Apk);
    input.sha256 = "b".repeat(64);
    let output = inspect_package(
        &root.join("output.apk"),
        "com.test.app",
        100,
        ContainerType::Apk,
    );
    let inspector = Arc::new(MapInspector {
        input_path,
        input,
        output,
    });
    let runner = CheckRunner::new(
        MorpheTool::executable(&script, "1.18.0"),
        inspector,
        Arc::new(FakeDex::healthy()),
    );
    let mut options = CheckOptions::new(&artifact, &mpp);
    options.expected_package = Some("com.test.app".to_string());
    options.all_patches = true;
    options.jobs = Some(2);
    options.workspace_root = root.join("workspace");
    options.patches_list_path = Some(patches_path);

    let (report, exit_code) = runner.run(&options).expect("run");
    assert_eq!(exit_code, ExitCode::CompatibilityFailure);
    assert_eq!(report.total_cases, 5);
    assert_eq!(report.passed_cases, 4);
    assert_eq!(report.failed_cases, 1);
    assert_eq!(report.test_cases[0].patch_name, "Alpha Patch");
    assert_eq!(
        report.test_cases[0].options.get("featureA"),
        Some(&json!(true))
    );
    assert_eq!(
        report.test_cases[1].options.get("featureA"),
        Some(&json!(false))
    );
    assert_eq!(report.test_cases[2].patch_name, "Beta Patch");
    assert_eq!(report.test_cases[3].patch_name, "Gamma Patch");
    assert_eq!(
        report.test_cases[3].options.get("featureG"),
        Some(&json!(false))
    );
    assert_eq!(
        report.test_cases[4].options.get("featureG"),
        Some(&json!(true))
    );
    assert!(!report.test_cases[4].success);
    assert!(
        report
            .failure_reason
            .as_deref()
            .unwrap_or("")
            .contains("[Gamma Patch] Morphe reported failure: Gamma Patch: option rejected")
            || report
                .failure_reason
                .as_deref()
                .unwrap_or("")
                .contains("[Gamma Patch]")
    );

    let log = fs::read_to_string(state.join("invocations")).expect("log");
    let lines: Vec<&str> = log.lines().collect();
    let starts = lines
        .iter()
        .filter(|line| line.starts_with("start:"))
        .count();
    let ends = lines.iter().filter(|line| line.starts_with("end:")).count();
    // The single failing case exits from the fake tool before writing its end
    // marker; every other invocation records both boundaries.
    assert_eq!(starts, 5, "all cases must run: {log}");
    assert_eq!(ends, 4, "four successful cases end cleanly: {log}");
    // Warm-up case runs alone first, before the bounded workers.
    assert_eq!(lines[0], "start:Alpha Patch featureA=true");
    assert_eq!(lines[1], "end:Alpha Patch featureA=true");
    let mut active: i64 = 0;
    let mut max_active: i64 = 0;
    for line in &lines[2..] {
        if line.starts_with("start:") {
            active += 1;
            max_active = max_active.max(active);
        } else {
            active -= 1;
        }
    }
    assert_eq!(active, 1, "only the failing case lacks an end marker");
    assert!(max_active <= 2, "worker bound exceeded: {max_active}");
}

#[test]
fn cancellation_reaps_child_and_removes_ephemeral_workspace() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::Hang,
    );
    let input_path = fixture.input_path.clone();
    let inspector = Arc::new(MapInspector {
        input_path: resolved(&input_path),
        input: fixture.input_inspection.clone(),
        output: fixture.output_inspection.clone(),
    });
    let cancellation = Cancellation::new();
    let runner = CheckRunner::new(
        MorpheTool::executable(&fixture.script, "1.18.0"),
        inspector,
        Arc::new(fixture.dex.clone()),
    )
    .with_cancellation(cancellation.clone());
    let options = fixture.options();

    let handle = std::thread::spawn(move || runner.run(&options));
    let pid_file = fixture.state.join("pid");
    let deadline = Instant::now() + Duration::from_secs(5);
    while !pid_file.is_file() && Instant::now() < deadline {
        std::thread::sleep(Duration::from_millis(20));
    }
    let pid = fs::read_to_string(&pid_file)
        .expect("fake tool pid")
        .trim()
        .to_string();
    cancellation.cancel();
    let result = handle.join().expect("join");
    let error = result.expect_err("cancellation must surface as a runtime error");
    assert!(error.message().contains("cancelled"), "{}", error.message());

    let status = Command::new("kill")
        .arg("-0")
        .arg(&pid)
        .stderr(std::process::Stdio::null())
        .status();
    let still_alive = status.map(|status| status.success()).unwrap_or(false);
    assert!(!still_alive, "child {pid} was not reaped");

    let package_root = fixture.workspace.join("com.test.app");
    assert!(
        !package_root.exists(),
        "ephemeral workspace was not removed: {}",
        package_root.display()
    );
}

#[test]
fn case_timeout_reaps_child_and_reports_failure() {
    let mut fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::Hang,
    );
    let temp = TempDir::new().expect("tempdir");
    let script = write_morphe_script(
        temp.path(),
        &fixture.state,
        Some(&fixture.template),
        MorpheMode::Hang,
        "10",
        None,
    );
    fixture.script = script;
    let mut options = fixture.options();
    options.case_timeout = Some(Duration::from_secs(3));
    let (report, exit_code) = run_single_case(&fixture, &options).expect("run");
    assert_eq!(exit_code, ExitCode::CompatibilityFailure);
    let message = report.test_cases[0].error_message.as_deref().unwrap_or("");
    assert!(message.contains("Morphe timed out after"), "{message}");

    let pid = fs::read_to_string(fixture.state.join("pid"))
        .expect("fake tool pid")
        .trim()
        .to_string();
    let still_alive = Command::new("kill")
        .arg("-0")
        .arg(&pid)
        .stderr(std::process::Stdio::null())
        .status()
        .map(|status| status.success())
        .unwrap_or(false);
    assert!(!still_alive, "timed-out child {pid} was not reaped");
}

#[test]
fn report_json_field_order_matches_the_python_contract() {
    let fixture = Fixture::new(
        &[("classes.dex", b"base")],
        &[("classes.dex", b"patched")],
        json!([default_patch()]),
        MorpheMode::Ok,
    );
    let (report, _) = run_single_case(&fixture, &fixture.options()).expect("run");
    let text = serde_json::to_string(&report).expect("serialize report");
    let keys = [
        "artifactSha256",
        "packageName",
        "versionName",
        "versionCode",
        "patchBundleVersion",
        "gitRevision",
        "toolVersions",
        "overallStatus",
        "totalCases",
        "passedCases",
        "failedCases",
        "testCases",
        "failureReason",
    ];
    let mut last = 0;
    for key in keys {
        let needle = format!("\"{key}\"");
        let position = text
            .find(&needle)
            .unwrap_or_else(|| panic!("missing {key}"));
        assert!(position >= last, "{key} is out of order");
        last = position;
    }

    let case_text = serde_json::to_string(&report.test_cases[0]).expect("serialize case");
    let case_keys = [
        "patchName",
        "options",
        "success",
        "errorMessage",
        "appliedPatches",
        "injectedClasses",
        "durationSeconds",
    ];
    let mut last = 0;
    for key in case_keys {
        let needle = format!("\"{key}\"");
        let position = case_text
            .find(&needle)
            .unwrap_or_else(|| panic!("missing {key}"));
        assert!(position >= last, "{key} is out of order");
        last = position;
    }
}

// ---------------------------------------------------------------------------
// Real dexdump adapter (fake executable, real zip parsing)
// ---------------------------------------------------------------------------

fn write_fake_dexdump(directory: &Path, fail: bool) -> PathBuf {
    let script = if fail {
        "#!/bin/sh\necho 'bad dex' >&2\nexit 1\n"
    } else {
        "#!/bin/sh\ncase \"$1\" in\n  -c) exit 0 ;;\nesac\nprintf \"Class descriptor  : 'Lapp/aidan/extension/Feature;'\\n\"\n"
    };
    let path = directory.join("dexdump");
    fs::write(&path, script).expect("write dexdump");
    let mut permissions = fs::metadata(&path).expect("metadata").permissions();
    permissions.set_mode(0o755);
    fs::set_permissions(&path, permissions).expect("chmod dexdump");
    path
}

#[test]
fn dexdump_adapter_verifies_and_extracts_from_dex_members() {
    let temp = TempDir::new().expect("tempdir");
    let apk = temp.path().join("app.apk");
    write_zip(
        &apk,
        &[("classes.dex", b"dex-bytes"), ("res/raw/x", b"raw")],
    );
    let dexdump = DexDump::new(write_fake_dexdump(temp.path(), false));
    assert!(dexdump.verify(&apk).is_ok());
    // Class inventory is read from the DEX tables directly; arbitrary bytes
    // yield no descriptors and the fake tool's stdout is not parsed.
    let classes = dexdump.class_descriptors(&apk).expect("classes");
    assert!(classes.is_empty());

    let valid = temp.path().join("valid.apk");
    write_zip(
        &valid,
        &[
            (
                "classes.dex",
                &mock_dex(&["Lapp/aidan/extension/Feature;"])[..],
            ),
            ("res/raw/x", b"raw"),
        ],
    );
    let classes = dexdump.class_descriptors(&valid).expect("classes");
    assert_eq!(
        classes.into_iter().collect::<Vec<_>>(),
        vec!["Lapp/aidan/extension/Feature;".to_string()]
    );

    let failing = DexDump::new(write_fake_dexdump(temp.path(), true));
    let error = failing.verify(&apk).expect_err("invalid dex");
    assert!(
        error.contains("dexdump verification failed for classes.dex"),
        "{error}"
    );
}

#[test]
fn dexdump_adapter_reports_missing_dex_without_invoking_a_tool() {
    let temp = TempDir::new().expect("tempdir");
    let apk = temp.path().join("app.apk");
    write_zip(&apk, &[("res/raw/x", b"raw")]);
    let dexdump = DexDump::new(temp.path().join("never-executed"));
    let error = dexdump.verify(&apk).expect_err("no dex");
    assert_eq!(error, "No DEX files found in patched output");
}

// Sanity: the synthetic ZIP helper only builds stored entries, so the tests
// never depend on a system unzip implementation.
#[test]
fn synthetic_zip_helper_round_trips() {
    let temp = TempDir::new().expect("tempdir");
    let path = temp.path().join("roundtrip.apk");
    write_zip(&path, &[("a", b"1"), ("b", b"2")]);
    let file = fs::File::open(&path).expect("open");
    let mut archive = zip::ZipArchive::new(file).expect("archive");
    let mut names = Vec::new();
    for index in 0..archive.len() {
        names.push(
            archive
                .by_index(index)
                .expect("entry")
                .name()
                .unwrap()
                .to_string(),
        );
    }
    assert_eq!(names, vec!["a".to_string(), "b".to_string()]);
}
