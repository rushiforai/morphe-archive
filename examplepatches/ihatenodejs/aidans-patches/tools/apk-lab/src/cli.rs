//! Command-line parsing and output formatting.
//!
//! Only commands that are implemented natively appear in this grammar.
//! Unknown commands and flags fail with exit 2; nothing is delegated to the
//! Python implementation and no placeholder command reports success.
//!
//! `--json` accepts an optional path because the Python CLI does:
//! bare `--json` and `--json -` write to stdout, `--json FILE` writes the same
//! document to `FILE`, and duplicates or empty paths are usage errors.
//!
//! `--workspace-root` is a global option before the command, matching the
//! Python parser. `setup`, `doctor`, `inspect` and `clean` keep the Python
//! stdout/stderr and exit-code contracts.

use crate::accounts_tui;
use crate::acquisition::{self, AcquiredArtifact};
use crate::analysis::{self, AnalyzeOptions};
use crate::asm;
use crate::code_inspection::{
    self, InspectCodeRequest, LiveArtifactInspector, NativeToolExecutor, ToolExecutor, ToolKind,
};
use crate::comparison;
use crate::compatibility_ci::{
    self, ArtifactAcquirer, CiDependencies, CiEnvironment, CiRunRequest, CompatibilityChecker,
    RunStartPayload, UreqWorkerPoster, WorkerPoster,
};
use crate::deployment::{self, DeploymentTools, PatchBuildRequest, PatchEngine};
use crate::device::{self, AdbClient, MonitorStream, RealClock};
use crate::dex_strings;
use crate::error::Error;
use crate::fixtures::{R2FixtureManager, SlotMetadata};
use crate::il2cpp;
use crate::inspection;
use crate::manifest;
use crate::models::{ArtifactInspection, Envelope, ExitCode};
use crate::morphe::{
    self, ArtifactInspector, CheckOptions, CheckRunner, DexDump, DexTool, MorpheTool,
    NativeInspector, PatchCommandPaths, PatchCompatibilityReport, ToolVersions,
};
use crate::process::{self, ProcessSpec};
use crate::resources;
use crate::smali::{self, SmaliAssemblerCommand};
use crate::tools::{
    self, DoctorOptions, DoctorReport, Profile, ToolEnvironment, ToolManager,
    DEFAULT_WORKSPACE_ROOT,
};
use crate::unity;
use crate::workspace::WorkspaceManager;
use regex::RegexBuilder;
use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::ffi::OsString;
use std::fs;
use std::io::{self, Read, Write};
use std::path::{Path, PathBuf};
use std::time::Duration;
use zip::ZipArchive;

const HELP: &str = "\
Native APK Lab host CLI.

Usage:
  apk-lab [--workspace-root DIR] <command> [options]
  apk-lab --help
  apk-lab --version

Commands:
  setup         Download and verify pinned tools
  doctor        Verify host prerequisites and cached tools
  acquire       Download and normalize an APK from Google Play
  play-accounts Manage Google Play accounts for authenticated acquisition
  fixtures      Manage R2 fixture slots
  ci            Compatibility CI matrix, run start, and reconciliation
  inspect       Inspect an APK/APKM/XAPK/APKS artifact
  analyze       Extract and analyze an artifact into a managed run
  compare       Compare two APK artifacts
  asm           Encode an ARM64 instruction and calculate relocations
  strings       Search string literal pools across DEX files
  unity         Inspect Unity assets and locate GameObject properties
  il2cpp       Query Unity IL2CPP symbols from an artifact
  manifest      Inspect AndroidManifest.xml components
  res           Inspect and query resources across split containers
  inspect-code  Disassemble/decompile a class or method and diff artifacts
  validate-smali  Validate a Smali snippet (alias: smali)
  check         Apply and verify patches with Morphe
  deploy        Apply patches, sign, and install to a device
  dev           Build patches, locate an artifact, deploy, and launch
  monitor       Monitor application process health, ANRs, and crashes
  crash-trace   Harvest recent Java crash reports from logcat
  ui            Device UI hierarchy inspection and click automation
  clean         Clean validated managed workspaces
  selftest      Validate native CLI, model, and exit-code contracts

Options:
  -h, --help     Print help
  -V, --version  Print version

Run 'apk-lab <command> --help' for command options.
";

const SELFTEST_HELP: &str = "\
Usage: apk-lab selftest [--json [FILE|-]]

Validate the native exit-code table and JSON envelope without external tools.

Options:
  --json [FILE|-]  Emit a JSON envelope; '-' or no value writes stdout
  -h, --help       Print help
";

const SETUP_HELP: &str = "\
Usage: apk-lab setup [--profile analysis|ci]

Download, verify and publish every tool in a profile.

Options:
  --profile PROFILE  Toolchain profile (default: analysis)
  -h, --help         Print help
";

const DOCTOR_HELP: &str = "\
Usage: apk-lab doctor [--ci] [--profile analysis|ci] [--json [FILE|-]]

Verify host prerequisites and cached tools without installing anything.

Options:
  --ci               Include CI credential checks
  --profile PROFILE  Prerequisite profile (default: ci with --ci, else analysis)
  --json [FILE|-]    Emit the doctor report as JSON
  -h, --help         Print help
";

const INSPECT_HELP: &str = "\
Usage: apk-lab inspect <artifact> [--json [FILE|-]]

Inspect an APK, APKM, XAPK or APKS artifact.

Options:
  --json [FILE|-]  Emit the inspection as JSON
  -h, --help       Print help
";

const CLEAN_HELP: &str = "\
Usage: apk-lab [--workspace-root DIR] clean [--run DIR | --package NAME | --stale DAYS] [--dry-run]

Remove only validated managed runs beneath the workspace root.

Options:
  --run DIR        Clean a specific run directory
  --package NAME   Clean all validated runs for a package
  --stale DAYS     Clean runs older than DAYS days
  --dry-run        List candidates without deleting
  -h, --help       Print help
";

const ASM_HELP: &str = "\
Usage: apk-lab asm statement [--pc PC] [--target TARGET] [--format {hex,kotlin,int,bytes}]

Encode an ARM64 instruction and calculate branch relocations.

Options:
  --pc PC                             Program counter (default: 0)
  --target TARGET                     Target address override
  --format {hex,kotlin,int,bytes}     Output format (default: hex)
  -h, --help                          Print help
";

const STRINGS_HELP: &str = "\
Usage: apk-lab strings artifact [-q QUERY] [--dex DEX] [-i | -s] [--json [FILE|-]]

Search string literal pools across all DEX files in an artifact.

Options:
  -q, --query QUERY   Regex query to filter strings
  --dex DEX           Filter by specific DEX filename
  -i, --ignore-case   Case-insensitive regex (default)
  -s, --case-sensitive
                      Case-sensitive regex
  --json [FILE|-]     Emit matches as JSON
  -h, --help          Print help
";

const UNITY_HELP: &str = "\
Usage: apk-lab unity artifact --gameobject NAME [--json [FILE|-]]

Inspect Unity serialized assets and locate GameObject properties.

Options:
  -g, --gameobject NAME  Target GameObject name to search
  --json [FILE|-]        Emit results as JSON
  -h, --help             Print help
";

const IL2CPP_HELP: &str = "\
Usage: apk-lab il2cpp artifact [-q QUERY] [--json [FILE|-]]

Extract and query Unity IL2CPP symbols from an artifact.

Options:
  -q, --query QUERY  Filter symbol or type name (substring or regex)
  --json [FILE|-]    Emit symbols as JSON
  -h, --help         Print help
";

const MANIFEST_HELP: &str = "\
Usage: apk-lab manifest artifact [--type {activity,service,receiver,provider}] [--filter REGEX] [--json [FILE|-]]

Inspect AndroidManifest.xml components, providers, receivers, and permissions.

Options:
  --type TYPE      Filter by component type
  --filter REGEX   Regex filter for component name
  --json [FILE|-]  Emit components as JSON
  -h, --help       Print help
";

const RES_HELP: &str = "\
Usage: apk-lab res artifact [--query QUERY | --text TEXT] [--extract DIR]

Inspect and query resources across split APK containers.

Options:
  -q, --query QUERY  Resource name, ID, path, or text: query
  --text, --value TEXT
                     Search resource string/text values
  --extract DIR      Extract matched file resources into DIR
  -h, --help         Print help
";

const INSPECT_CODE_HELP: &str = "\
Usage: apk-lab inspect-code artifact --class FQCN [--method METHOD] [--format {smali,java}] [--compare ARTIFACT]

Targeted class and method disassembly/decompilation and diff.

Options:
  --class FQCN      Fully qualified class name
  --method METHOD   Method name or descriptor
  --format FORMAT   Output format (default: smali)
  --compare PATH    Unpatched artifact for a side-by-side diff
  -h, --help        Print help
";

const COMPARE_HELP: &str = "\
Usage: apk-lab compare old_artifact new_artifact [--class CLASS] [--json [FILE|-]]

Compare two APK artifacts.

Options:
  --class CLASS    Decompile and diff a class (repeatable)
  --json [FILE|-]  Emit the comparison as JSON
  -h, --help       Print help
";

const ANALYZE_HELP: &str = "\
Usage: apk-lab [--workspace-root DIR] analyze artifact [--jadx] [--apktool] [--smali] [--class CLASS]

Extract and analyze an artifact into a managed run.

Options:
  --jadx          Run JADX decompiler
  --apktool       Run Apktool decoder
  --smali         Disassemble DEX with baksmali
  --class CLASS   Filter analysis to a class pattern (repeatable)
  -h, --help      Print help
";

const VALIDATE_SMALI_HELP: &str = "\
Usage: apk-lab validate-smali --snippet SNIPPET --locals N [--params N] [--descriptor DESCRIPTOR] [--is-static]

Validate Smali instruction registers, opcodes, and CFG.

Options:
  --snippet SNIPPET       Smali instruction snippet
  --locals N              Number of locals (.locals N)
  --params N              Single-width parameter count
  --descriptor DESCRIPTOR Method descriptor defining exact parameter widths
  --is-static             Whether the method is static
  -h, --help              Print help
";

const CHECK_HELP: &str = "\
Usage: apk-lab [--workspace-root DIR] check artifact [--mpp MPP] [--package NAME] [--all] [--patch NAME] [--force] [--keep-workspace] [--json [FILE|-]] [-j JOBS]

Apply and verify patches with Morphe, reporting every independent case.

Options:
  --mpp MPP          Path to compiled .mpp bundle (default: newest in patches/build/libs/)
  --package NAME     Expected package name
  --all              Test all compatible patches
  --patch NAME       Specific patch name to test (repeatable)
  --force            Force patch application regardless of version
  --keep-workspace   Keep workspace directory after check
  --json [FILE|-]    Emit the compatibility report as JSON
  -j, --jobs JOBS    Concurrent test-case workers (default: min(CPU count, 8))
  -h, --help         Print help
";

const DEPLOY_HELP: &str = "\
Usage: apk-lab deploy artifact [--mpp MPP | --build] [--package NAME] [--all | -e NAME] [-O KEY=VALUE] [--device SERIAL] [--launch] [--reinstall | --clean-install] [--out APK] [--keystore KS] [--ks-alias ALIAS] [--ks-pass PASS | --ks-pass-file PATH] [--key-pass PASS | --key-pass-file PATH]

Apply patches, sign with a debug or custom key, and install to a device.

Options:
  --mpp MPP           Path to patches .mpp file
  --build             Compile the newest .mpp bundle via Gradle
  --package NAME      Expected package name (auto-detected if omitted)
  --all               Apply all default-compatible patches
  -e, --enable NAME   Explicit patch name to enable (repeatable)
  -O, --option KEY=VALUE
                      Patch option (repeatable)
  --device SERIAL     Target ADB device serial
  --launch            Launch main activity after installation
  --reinstall         Reinstall preserving data (default)
  --clean-install     Clean install by uninstalling first
  --out APK           Path to write signed output APK
  --keystore KS       Path to custom keystore for signing
  --ks-alias ALIAS    Keystore key alias
  --ks-pass PASS      Keystore password (visible in process listings)
  --key-pass PASS     Key password (visible in process listings)
  --ks-pass-file PATH Read the keystore password from a 0600 regular file
  --key-pass-file PATH
                      Read the key password from a 0600 regular file
  -h, --help          Print help
";

const DEV_HELP: &str = "\
Usage: apk-lab dev [app] [--artifact APK] [--no-build] [--device SERIAL] [--launch] [--all] [--reinstall | --clean-install]

Build patches, locate an artifact, deploy to a device, and launch.

Options:
  --artifact APK      Explicit artifact path (bypasses auto-search)
  --no-build          Skip Gradle build and use the newest existing .mpp
  --device SERIAL     Target ADB device serial
  --launch            Launch main activity after installation (default)
  --all               Apply all compatible patches (default)
  --reinstall         Reinstall preserving data (default)
  --clean-install     Clean install by uninstalling first
  -h, --help          Print help
";

const MONITOR_HELP: &str = "\
Usage: apk-lab monitor --package NAME [--device SERIAL] [--timeout SECONDS] [--dump-threads]

Monitor application process health, ANRs, crashes, and high CPU spin.

Options:
  --package NAME      Package name to monitor
  --device SERIAL     Target ADB device serial
  --timeout SECONDS   Monitoring timeout in seconds
  --dump-threads      Capture a thread dump on ANR or spin
  -h, --help          Print help
";

const CRASH_TRACE_HELP: &str = "\
Usage: apk-lab crash-trace --package NAME [--device SERIAL] [--lines N] [--json]

Harvest recent Java crash reports from logcat.

Options:
  --package NAME     Package name to inspect
  --device SERIAL    Target ADB device serial
  --lines N          Recent logcat lines to inspect (default: 5000)
  --json             Output crash reports as JSON
  -h, --help         Print help
";

const UI_HELP: &str = "\
Usage: apk-lab ui <dump|click> [options]

Device UI hierarchy inspection and click automation.

Commands:
  dump    Dump and filter UI hierarchy nodes
  click   Click first matching UI node or direct coordinates

Run 'apk-lab ui <command> --help' for command options.
";

const UI_DUMP_HELP: &str = "\
Usage: apk-lab ui dump [--device SERIAL] [--clickable] [--text TEXT] [--desc DESC] [--json]

Dump and filter UI hierarchy nodes.

Options:
  --device SERIAL  Target ADB device serial
  --clickable      Filter to clickable nodes only
  --text TEXT      Filter by text substring
  --desc DESC      Filter by content-description substring
  --json           Output a JSON array of nodes
  -h, --help       Print help
";

const UI_CLICK_HELP: &str = "\
Usage: apk-lab ui click [--device SERIAL] [--text TEXT | --desc DESC | --coords X,Y]

Click the first matching UI node or direct coordinates.

Options:
  --device SERIAL  Target ADB device serial
  --text TEXT      Click first node matching text substring
  --desc DESC      Click first node matching content-description substring
  --coords X,Y     Direct X,Y click
  -h, --help       Print help
";

const ACQUIRE_HELP: &str = "\
Usage: apk-lab acquire <package> [--version NAME] [--version-code CODE] [--out-dir DIR]

Download and normalize an APK from Google Play.

Options:
  --version NAME       Expected version name
  --version-code CODE  Expected version code
  --out-dir DIR        Output directory (default: the system temp directory)
  -h, --help           Print help
";

const PLAY_ACCOUNTS_HELP: &str = "\
Usage: apk-lab play-accounts

Manage Google Play accounts for authenticated acquisition and metadata.
Cancelling any prompt exits successfully.

Options:
  -h, --help  Print help
";

const FIXTURES_HELP: &str = "\
Usage: apk-lab fixtures <seed|info|download> [options]

Manage R2 fixture slots.

Commands:
  seed      Seed a fixture slot from a local artifact
  info      Inspect fixture slot metadata
  download  Download a fixture slot

Run 'apk-lab fixtures <command> --help' for command options.
";

const FIXTURES_SEED_HELP: &str = "\
Usage: apk-lab fixtures seed --package NAME --role target|latest --artifact PATH

Seed a fixture slot from a local artifact.

Options:
  --package NAME   Package name
  --role ROLE      Slot role (target or latest)
  --artifact PATH  Path to the artifact
  -h, --help       Print help
";

const FIXTURES_INFO_HELP: &str = "\
Usage: apk-lab fixtures info --package NAME [--role target|latest]

Inspect fixture slot metadata.

Options:
  --package NAME  Package name
  --role ROLE     Slot role (default: both latest and target)
  -h, --help      Print help
";

const FIXTURES_DOWNLOAD_HELP: &str = "\
Usage: apk-lab fixtures download --package NAME --role target|latest --out PATH

Download a fixture slot.

Options:
  --package NAME  Package name
  --role ROLE     Slot role (target or latest)
  --out PATH      Destination file path
  -h, --help      Print help
";

const CI_HELP: &str = "\
Usage: apk-lab ci <matrix|start|run> [options]

Compatibility CI orchestration.

Commands:
  matrix  Compute the package matrix
  start   Post a run-start record to the Worker
  run     Reconcile fixtures and run the compatibility check

Run 'apk-lab ci <command> --help' for command options.
";

const CI_MATRIX_HELP: &str = "\
Usage: apk-lab ci matrix [--output-file PATH] [--patches-list PATH] [--changed-files LIST]

Compute the package matrix.

Options:
  --output-file PATH    Append the packages line to a GITHUB_OUTPUT file
  --patches-list PATH   Path to patches-list.json
  --changed-files LIST  Comma- or newline-separated changed files
  -h, --help            Print help
";

const CI_START_HELP: &str = "\
Usage: apk-lab ci start --package NAME --request-id ID --git-revision SHA [--patches-list PATH]

Post a run-start record to the Worker.

Options:
  --package NAME       Package name
  --request-id ID      Dispatch request ID
  --git-revision SHA   Git revision
  --patches-list PATH  Path to patches-list.json
  -h, --help           Print help
";

const CI_RUN_HELP: &str = "\
Usage: apk-lab ci run --package NAME [--mpp PATH] [--patches-list PATH]

Reconcile fixtures and run the compatibility check for a package.

Options:
  --package NAME       Package name
  --mpp PATH           Path to the .mpp patch bundle
  --patches-list PATH  Path to patches-list.json
  -h, --help           Print help
";

const USAGE: &str = "\
Usage: apk-lab [--workspace-root DIR] <command> [options]
       apk-lab --help
       apk-lab --version
";

#[derive(Debug, Clone, PartialEq, Eq)]
enum JsonTarget {
    Stdout,
    File(PathBuf),
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
struct SelftestCheck {
    #[serde(rename = "name")]
    name: String,
    #[serde(rename = "passed")]
    passed: bool,
    #[serde(rename = "detail")]
    detail: String,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
struct SelftestReport {
    #[serde(rename = "checks")]
    checks: Vec<SelftestCheck>,
}

/// Runs the native CLI. Arguments are what followed the program name.
///
/// Output is written through fallible helpers so a closed pipe can be mapped to
/// success at the binary boundary instead of panicking (`println!` panics).
pub fn run(raw_args: &[OsString]) -> Result<ExitCode, Error> {
    let args = decode_args(raw_args)?;
    let (workspace_root, args) = split_global_options(&args)?;
    let Some((command, rest)) = args.split_first() else {
        write_stderr(USAGE);
        return Err(Error::usage("a command is required"));
    };

    match command.as_str() {
        "-h" | "--help" => {
            write_stdout(HELP)?;
            Ok(ExitCode::Success)
        }
        "-V" | "--version" => {
            write_stdout(&format!("apk-lab {}\n", env!("CARGO_PKG_VERSION")))?;
            Ok(ExitCode::Success)
        }
        "setup" => run_setup(rest),
        "doctor" => run_doctor(rest, &workspace_root),
        "acquire" => run_acquire(rest),
        "play-accounts" => run_play_accounts(rest),
        "fixtures" => run_fixtures(rest),
        "ci" => run_ci(rest),
        "inspect" => run_inspect(rest),
        "analyze" => run_analyze(rest, &workspace_root),
        "compare" => run_compare(rest),
        "asm" => run_asm(rest),
        "strings" => run_strings(rest),
        "unity" => run_unity(rest),
        "il2cpp" => run_il2cpp(rest),
        "manifest" => run_manifest(rest),
        "res" => run_res(rest),
        "inspect-code" => run_inspect_code(rest),
        "validate-smali" | "smali" => run_validate_smali(rest),
        "check" => run_check(rest, &workspace_root),
        "deploy" => run_deploy_command(rest),
        "dev" => run_dev_command(rest),
        "monitor" => run_monitor_command(rest),
        "crash-trace" => run_crash_trace(rest, &workspace_root),
        "ui" => run_ui(rest),
        "clean" => run_clean(rest, &workspace_root),
        "selftest" => run_selftest(rest),
        other if other.starts_with('-') => {
            write_stderr(USAGE);
            Err(Error::usage(format!("unrecognized option '{other}'")))
        }
        other => {
            write_stderr(USAGE);
            Err(Error::usage(format!("unknown command '{other}'")))
        }
    }
}

fn decode_args(raw_args: &[OsString]) -> Result<Vec<String>, Error> {
    let mut args = Vec::with_capacity(raw_args.len());
    for arg in raw_args {
        match arg.to_str() {
            Some(text) => args.push(text.to_owned()),
            None => return Err(Error::usage("arguments must be valid UTF-8")),
        }
    }
    Ok(args)
}

/// Extracts the global `--workspace-root` option before the command.
fn split_global_options(args: &[String]) -> Result<(PathBuf, Vec<String>), Error> {
    let mut workspace_root = PathBuf::from(DEFAULT_WORKSPACE_ROOT);
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        if let Some(value) = arg.strip_prefix("--workspace-root=") {
            if value.is_empty() {
                write_stderr(USAGE);
                return Err(Error::usage("--workspace-root requires a non-empty path"));
            }
            workspace_root = PathBuf::from(value);
            index += 1;
        } else if arg == "--workspace-root" {
            let Some(value) = args.get(index + 1) else {
                write_stderr(USAGE);
                return Err(Error::usage("--workspace-root requires a path"));
            };
            if value.is_empty() {
                write_stderr(USAGE);
                return Err(Error::usage("--workspace-root requires a non-empty path"));
            }
            workspace_root = PathBuf::from(value);
            index += 2;
        } else {
            break;
        }
    }
    Ok((workspace_root, args[index..].to_vec()))
}

fn run_selftest(args: &[String]) -> Result<ExitCode, Error> {
    let mut json_target: Option<JsonTarget> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(SELFTEST_HELP)?;
                return Ok(ExitCode::Success);
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, SELFTEST_HELP)?;
            }
            _ if arg.starts_with('-') => {
                write_stderr(SELFTEST_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(SELFTEST_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let report = build_selftest_report();
    let all_passed = report.checks.iter().all(|check| check.passed);
    if !all_passed {
        return Err(Error::runtime("native selftest failed"));
    }

    match json_target {
        Some(target) => {
            let envelope = Envelope::success("selftest", report);
            write_json(&envelope, &target)?;
        }
        None => {
            let mut text = String::from("apk-lab selftest\n");
            for check in &report.checks {
                let status = if check.passed { "ok" } else { "FAIL" };
                text.push_str(&format!("  [{status}] {}: {}\n", check.name, check.detail));
            }
            text.push_str("Status: OK\n");
            write_stdout(&text)?;
        }
    }

    Ok(ExitCode::Success)
}

fn run_setup(args: &[String]) -> Result<ExitCode, Error> {
    let mut profile = Profile::Analysis;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(SETUP_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--profile" => {
                let Some(value) = args.get(index + 1) else {
                    write_stderr(SETUP_HELP);
                    return Err(Error::usage("--profile requires a value"));
                };
                profile = parse_profile(value)?;
                index += 2;
            }
            _ if arg.starts_with("--profile=") => {
                profile = parse_profile(&arg["--profile=".len()..])?;
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(SETUP_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(SETUP_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let manager = ToolManager::with_defaults().map_err(Error::from)?;
    let mut text = format!(
        "Setting up apk-lab toolchain (profile: {})...\n",
        profile.as_str()
    );
    let results = manager.setup_profile(profile).map_err(Error::from)?;
    let mut failed = false;
    for result in &results {
        if result.installed {
            text.push_str(&format!(
                "  [OK] {} v{} installed: {}\n",
                result.name,
                result.configured_version,
                result.executable_path.as_deref().unwrap_or("")
            ));
        } else {
            text.push_str(&format!(
                "  [FAILED] {}: {}\n",
                result.name,
                result.error.as_deref().unwrap_or("unknown error")
            ));
            failed = true;
        }
    }
    write_stdout(&text)?;
    Ok(if failed {
        ExitCode::UsageOrToolError
    } else {
        ExitCode::Success
    })
}

fn parse_profile(value: &str) -> Result<Profile, Error> {
    Profile::parse(value).ok_or_else(|| {
        Error::usage(format!(
            "argument --profile: invalid choice: '{value}' (choose from 'analysis', 'ci')"
        ))
    })
}

fn run_doctor(args: &[String], workspace_root: &Path) -> Result<ExitCode, Error> {
    let mut json_target: Option<JsonTarget> = None;
    let mut ci = false;
    let mut profile: Option<Profile> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(DOCTOR_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--ci" => {
                ci = true;
                index += 1;
            }
            "--profile" => {
                let Some(value) = args.get(index + 1) else {
                    write_stderr(DOCTOR_HELP);
                    return Err(Error::usage("--profile requires a value"));
                };
                profile = Some(parse_profile(value)?);
                index += 2;
            }
            _ if arg.starts_with("--profile=") => {
                profile = Some(parse_profile(&arg["--profile=".len()..])?);
                index += 1;
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, DOCTOR_HELP)?;
            }
            _ if arg.starts_with('-') => {
                write_stderr(DOCTOR_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(DOCTOR_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let manager = ToolManager::with_defaults().map_err(Error::from)?;
    let env = ToolEnvironment::from_process(&tools::default_repo_root());
    let report = tools::check_host_prerequisites(
        &manager,
        &env,
        &DoctorOptions {
            ci_mode: ci,
            profile,
            workspace_root: workspace_root.to_path_buf(),
        },
    );

    if let Some(target) = &json_target {
        write_sorted_json(&report, target)?;
    } else {
        write_stdout(&format_doctor_human(&report))?;
    }

    Ok(if report.all_ready {
        ExitCode::Success
    } else {
        ExitCode::UsageOrToolError
    })
}

fn format_doctor_human(report: &DoctorReport) -> String {
    let separator = "=".repeat(60);
    let mut text = String::new();
    text.push_str(&separator);
    text.push('\n');
    text.push_str("APK-LAB DOCTOR REPORT\n");
    text.push_str(&separator);
    text.push('\n');
    text.push_str("Host Prerequisites:\n");
    for prerequisite in &report.prerequisites {
        let status = if prerequisite.satisfied {
            "[OK]"
        } else {
            "[MISSING]"
        };
        let info = prerequisite
            .version_or_path
            .as_deref()
            .map(|value| format!(": {value}"))
            .unwrap_or_default();
        let error = prerequisite
            .error
            .as_deref()
            .map(|value| format!(" ({value})"))
            .unwrap_or_default();
        text.push_str(&format!("  {status} {}{info}{error}\n", prerequisite.name));
    }

    text.push_str("\nTools in Cache:\n");
    for tool in &report.tools {
        let status = if tool.installed { "[OK]" } else { "[MISSING]" };
        let path = tool
            .executable_path
            .as_deref()
            .map(|value| format!(" ({value})"))
            .unwrap_or_default();
        let error = tool
            .error
            .as_deref()
            .map(|value| format!(" - {value}"))
            .unwrap_or_default();
        text.push_str(&format!(
            "  {status} {} v{}{path}{error}\n",
            tool.name, tool.configured_version
        ));
    }

    text.push_str(&format!(
        "\nWorkspace writable: {}\n",
        if report.workspace_writable {
            "YES"
        } else {
            "NO"
        }
    ));
    if report.ci_mode {
        text.push_str("\nCI Credentials (presence only):\n");
        for (credential, present) in &report.credentials_present {
            text.push_str(&format!(
                "  {credential}: {}\n",
                if *present { "SET" } else { "UNSET" }
            ));
        }
    }

    text.push_str(&separator);
    text.push('\n');
    if report.all_ready {
        text.push_str("Status: ALL READY\n");
    } else {
        text.push_str("Status: PREREQUISITES OR TOOLS MISSING\n");
    }
    text
}

/// Acquisition boundary used by the `acquire` command.
///
/// The production implementation calls the native acquisition orchestrator;
/// integration tests inject a deterministic backend.
pub trait AcquireBackend {
    fn acquire(
        &self,
        package: &str,
        out_dir: &Path,
        expected_version: Option<&str>,
        expected_version_code: Option<u64>,
    ) -> Result<AcquiredArtifact, Error>;
}

/// Native Google Play / APKMirror acquisition backend.
#[derive(Debug, Clone, Copy, Default)]
pub struct NativeAcquireBackend;

impl AcquireBackend for NativeAcquireBackend {
    fn acquire(
        &self,
        package: &str,
        out_dir: &Path,
        expected_version: Option<&str>,
        expected_version_code: Option<u64>,
    ) -> Result<AcquiredArtifact, Error> {
        acquisition::acquire_artifact(package, out_dir, expected_version, expected_version_code)
    }
}

fn run_acquire(args: &[String]) -> Result<ExitCode, Error> {
    run_acquire_with(args, &NativeAcquireBackend)
}

/// Runs `acquire` with an explicit acquisition backend.
pub fn run_acquire_with(args: &[String], backend: &dyn AcquireBackend) -> Result<ExitCode, Error> {
    let mut package: Option<String> = None;
    let mut version: Option<String> = None;
    let mut version_code: Option<u64> = None;
    let mut out_dir: Option<PathBuf> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(ACQUIRE_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--version" => {
                version = Some(require_value(args, index, "--version", ACQUIRE_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--version=") => {
                version = Some(non_empty_value(
                    &arg["--version=".len()..],
                    "--version",
                    ACQUIRE_HELP,
                )?);
                index += 1;
            }
            "--version-code" => {
                version_code = Some(parse_version_code(&require_value(
                    args,
                    index,
                    "--version-code",
                    ACQUIRE_HELP,
                )?)?);
                index += 2;
            }
            _ if arg.starts_with("--version-code=") => {
                version_code = Some(parse_version_code(&non_empty_value(
                    &arg["--version-code=".len()..],
                    "--version-code",
                    ACQUIRE_HELP,
                )?)?);
                index += 1;
            }
            "--out-dir" => {
                out_dir = Some(PathBuf::from(require_value(
                    args,
                    index,
                    "--out-dir",
                    ACQUIRE_HELP,
                )?));
                index += 2;
            }
            _ if arg.starts_with("--out-dir=") => {
                out_dir = Some(PathBuf::from(non_empty_value(
                    &arg["--out-dir=".len()..],
                    "--out-dir",
                    ACQUIRE_HELP,
                )?));
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(ACQUIRE_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if package.is_none() => {
                package = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(ACQUIRE_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(package) = package else {
        write_stderr(ACQUIRE_HELP);
        return Err(Error::usage(
            "the following arguments are required: package",
        ));
    };
    let out_dir = out_dir.unwrap_or_else(std::env::temp_dir);
    let expected = version.as_deref().unwrap_or("latest");
    write_stdout(&format!(
        "Acquiring artifact for {package} (expected version: {expected})...\n"
    ))?;
    match backend.acquire(&package, &out_dir, version.as_deref(), version_code) {
        Ok(artifact) => {
            write_stdout(&format!(
                "[OK] Acquired {package} via {}: {}\n",
                artifact.source.label(),
                artifact.path.display()
            ))?;
            Ok(ExitCode::Success)
        }
        Err(error) => {
            write_stderr(&format!("Acquisition error: {}\n", error.message()));
            Ok(ExitCode::InfrastructureFailure)
        }
    }
}

fn parse_version_code(value: &str) -> Result<u64, Error> {
    let parsed: i64 = value.parse().map_err(|_| {
        Error::usage(format!(
            "argument --version-code: invalid int value: '{value}'"
        ))
    })?;
    Ok(u64::try_from(parsed).unwrap_or(0))
}

fn run_play_accounts(args: &[String]) -> Result<ExitCode, Error> {
    let mut ui = accounts_tui::TerminalUi;
    let checker = accounts_tui::GpapiChecker;
    run_play_accounts_with(args, &mut ui, &checker)
}

/// Runs `play-accounts` against an explicit prompt surface and checker.
///
/// Cancellation is not an error: `accounts_tui::run` reports it as `Ok(())`,
/// which maps to exit 0 exactly like the Python handler.
pub fn run_play_accounts_with<U: accounts_tui::Ui, C: accounts_tui::AccountChecker>(
    args: &[String],
    ui: &mut U,
    checker: &C,
) -> Result<ExitCode, Error> {
    if let Some(arg) = args.first() {
        match arg.as_str() {
            "-h" | "--help" => {
                write_stdout(PLAY_ACCOUNTS_HELP)?;
                return Ok(ExitCode::Success);
            }
            _ => {
                write_stderr(PLAY_ACCOUNTS_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
        }
    }

    match accounts_tui::run_play_accounts_tui(ui, checker) {
        Ok(()) => Ok(ExitCode::Success),
        Err(error) => {
            write_stderr(&format!("Error: {error}\n"));
            Ok(ExitCode::RuntimeFailure)
        }
    }
}

fn current_thread_runtime() -> Result<tokio::runtime::Runtime, Error> {
    // The CI pipeline awaits S3/HTTP work and also calls the synchronous
    // acquisition adapter. A multi-thread runtime lets that adapter use
    // block_in_place instead of nesting a second runtime.
    tokio::runtime::Builder::new_multi_thread()
        .enable_all()
        .build()
        .map_err(|error| Error::infrastructure(format!("cannot start runtime: {error}")))
}

fn run_fixtures(args: &[String]) -> Result<ExitCode, Error> {
    run_fixtures_dispatch(args, None)
}

/// Runs `fixtures` against an explicit manager, used by offline tests with an
/// in-memory S3 adapter.
pub fn run_fixtures_with(args: &[String], manager: &R2FixtureManager) -> Result<ExitCode, Error> {
    run_fixtures_dispatch(args, Some(manager))
}

fn run_fixtures_dispatch(
    args: &[String],
    manager: Option<&R2FixtureManager>,
) -> Result<ExitCode, Error> {
    let Some((subcommand, rest)) = args.split_first() else {
        write_stderr(FIXTURES_HELP);
        return Err(Error::usage(
            "the following arguments are required: fixtures command",
        ));
    };
    match subcommand.as_str() {
        "-h" | "--help" => {
            write_stdout(FIXTURES_HELP)?;
            Ok(ExitCode::Success)
        }
        "seed" => run_fixtures_seed(rest, manager),
        "info" => run_fixtures_info(rest, manager),
        "download" => run_fixtures_download(rest, manager),
        other => {
            write_stderr(FIXTURES_HELP);
            Err(Error::usage(format!("unknown fixtures command '{other}'")))
        }
    }
}

fn fixture_manager<'a>(
    manager: Option<&'a R2FixtureManager>,
    owned: &'a mut Option<R2FixtureManager>,
) -> Result<&'a R2FixtureManager, Error> {
    if let Some(manager) = manager {
        return Ok(manager);
    }
    *owned = Some(
        R2FixtureManager::from_env().map_err(|error| Error::infrastructure(error.to_string()))?,
    );
    Ok(owned.as_ref().expect("fixture manager was initialized"))
}

fn fixture_role(value: &str, help: &str) -> Result<String, Error> {
    match value {
        "target" | "latest" => Ok(value.to_string()),
        other => {
            write_stderr(help);
            Err(Error::usage(format!(
                "argument --role: invalid choice: '{other}' (choose from 'target', 'latest')"
            )))
        }
    }
}

fn fixture_failure(prefix: &str, error: &dyn std::fmt::Display) -> ExitCode {
    write_stderr(&format!("{prefix}: {error}\n"));
    ExitCode::InfrastructureFailure
}

fn run_fixtures_seed(
    args: &[String],
    manager: Option<&R2FixtureManager>,
) -> Result<ExitCode, Error> {
    let mut package: Option<String> = None;
    let mut role: Option<String> = None;
    let mut artifact: Option<String> = None;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(FIXTURES_SEED_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--package" => {
                package = Some(require_value(args, index, "--package", FIXTURES_SEED_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    FIXTURES_SEED_HELP,
                )?);
                index += 1;
            }
            "--role" => {
                role = Some(fixture_role(
                    &require_value(args, index, "--role", FIXTURES_SEED_HELP)?,
                    FIXTURES_SEED_HELP,
                )?);
                index += 2;
            }
            _ if arg.starts_with("--role=") => {
                role = Some(fixture_role(
                    &non_empty_value(&arg["--role=".len()..], "--role", FIXTURES_SEED_HELP)?,
                    FIXTURES_SEED_HELP,
                )?);
                index += 1;
            }
            "--artifact" => {
                artifact = Some(require_value(
                    args,
                    index,
                    "--artifact",
                    FIXTURES_SEED_HELP,
                )?);
                index += 2;
            }
            _ if arg.starts_with("--artifact=") => {
                artifact = Some(non_empty_value(
                    &arg["--artifact=".len()..],
                    "--artifact",
                    FIXTURES_SEED_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(FIXTURES_SEED_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(FIXTURES_SEED_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }
    let (Some(package), Some(role), Some(artifact)) = (package, role, artifact) else {
        write_stderr(FIXTURES_SEED_HELP);
        return Err(Error::usage(
            "the following arguments are required: --package, --role, --artifact",
        ));
    };

    let mut owned = None;
    let manager = fixture_manager(manager, &mut owned)?;
    write_stdout(&format!(
        "Seeding fixture for {package} (role: {role})...\n"
    ))?;
    let runtime = current_thread_runtime()?;
    match runtime.block_on(manager.seed_fixture(&package, &role, &artifact)) {
        Ok(metadata) => {
            let text = format!(
                "[OK] Seeded {} v{} ({}) to slot {role}\n",
                metadata.package_name, metadata.version_name, metadata.version_code
            );
            write_stdout(&text)?;
            Ok(ExitCode::Success)
        }
        Err(error) => Ok(fixture_failure("Fixtures error", &error)),
    }
}

fn format_slot(role: &str, metadata: Option<SlotMetadata>) -> String {
    metadata.map_or_else(
        || format!("Slot {role}: [EMPTY]\n"),
        |metadata| {
            let sha = metadata.sha256.get(..16).unwrap_or(&metadata.sha256);
            format!(
                "Slot {role}: {} ({}), SHA: {sha}..., src: {}\n",
                metadata.version_name, metadata.version_code, metadata.acquisition_source
            )
        },
    )
}

fn run_fixtures_info(
    args: &[String],
    manager: Option<&R2FixtureManager>,
) -> Result<ExitCode, Error> {
    let mut package: Option<String> = None;
    let mut role: Option<String> = None;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(FIXTURES_INFO_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--package" => {
                package = Some(require_value(args, index, "--package", FIXTURES_INFO_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    FIXTURES_INFO_HELP,
                )?);
                index += 1;
            }
            "--role" => {
                role = Some(fixture_role(
                    &require_value(args, index, "--role", FIXTURES_INFO_HELP)?,
                    FIXTURES_INFO_HELP,
                )?);
                index += 2;
            }
            _ if arg.starts_with("--role=") => {
                role = Some(fixture_role(
                    &non_empty_value(&arg["--role=".len()..], "--role", FIXTURES_INFO_HELP)?,
                    FIXTURES_INFO_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(FIXTURES_INFO_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(FIXTURES_INFO_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }
    let Some(package) = package else {
        write_stderr(FIXTURES_INFO_HELP);
        return Err(Error::usage(
            "the following arguments are required: --package",
        ));
    };
    let roles: Vec<String> = role
        .map(|role| vec![role])
        .unwrap_or_else(|| vec!["latest".to_string(), "target".to_string()]);

    let mut owned = None;
    let manager = fixture_manager(manager, &mut owned)?;
    let runtime = current_thread_runtime()?;
    let mut text = String::new();
    for role in roles {
        match runtime.block_on(manager.get_slot_metadata(&package, &role)) {
            Ok(metadata) => text.push_str(&format_slot(&role, metadata)),
            Err(error) => {
                write_stdout(&text)?;
                return Ok(fixture_failure("Fixtures info error", &error));
            }
        }
    }
    write_stdout(&text)?;
    Ok(ExitCode::Success)
}

fn run_fixtures_download(
    args: &[String],
    manager: Option<&R2FixtureManager>,
) -> Result<ExitCode, Error> {
    let mut package: Option<String> = None;
    let mut role: Option<String> = None;
    let mut out: Option<String> = None;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(FIXTURES_DOWNLOAD_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--package" => {
                package = Some(require_value(
                    args,
                    index,
                    "--package",
                    FIXTURES_DOWNLOAD_HELP,
                )?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    FIXTURES_DOWNLOAD_HELP,
                )?);
                index += 1;
            }
            "--role" => {
                role = Some(fixture_role(
                    &require_value(args, index, "--role", FIXTURES_DOWNLOAD_HELP)?,
                    FIXTURES_DOWNLOAD_HELP,
                )?);
                index += 2;
            }
            _ if arg.starts_with("--role=") => {
                role = Some(fixture_role(
                    &non_empty_value(&arg["--role=".len()..], "--role", FIXTURES_DOWNLOAD_HELP)?,
                    FIXTURES_DOWNLOAD_HELP,
                )?);
                index += 1;
            }
            "--out" => {
                out = Some(require_value(args, index, "--out", FIXTURES_DOWNLOAD_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--out=") => {
                out = Some(non_empty_value(
                    &arg["--out=".len()..],
                    "--out",
                    FIXTURES_DOWNLOAD_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(FIXTURES_DOWNLOAD_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(FIXTURES_DOWNLOAD_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }
    let (Some(package), Some(role), Some(out)) = (package, role, out) else {
        write_stderr(FIXTURES_DOWNLOAD_HELP);
        return Err(Error::usage(
            "the following arguments are required: --package, --role, --out",
        ));
    };
    let destination = std::path::absolute(&out).unwrap_or_else(|_| PathBuf::from(&out));

    let mut owned = None;
    let manager = fixture_manager(manager, &mut owned)?;
    let runtime = current_thread_runtime()?;
    match runtime.block_on(manager.download_slot(&package, &role, &destination)) {
        Ok(downloaded) => {
            write_stdout(&format!(
                "[OK] Downloaded slot {role} to {}\n",
                downloaded.display()
            ))?;
            Ok(ExitCode::Success)
        }
        Err(error) => Ok(fixture_failure("Fixtures download error", &error)),
    }
}

fn run_ci(args: &[String]) -> Result<ExitCode, Error> {
    let Some((subcommand, rest)) = args.split_first() else {
        write_stderr(CI_HELP);
        return Err(Error::usage(
            "the following arguments are required: ci command",
        ));
    };
    match subcommand.as_str() {
        "-h" | "--help" => {
            write_stdout(CI_HELP)?;
            Ok(ExitCode::Success)
        }
        "matrix" => run_ci_matrix(rest),
        "start" => run_ci_start(rest),
        "run" => run_ci_run(rest),
        other => {
            write_stderr(CI_HELP);
            Err(Error::usage(format!("unknown ci command '{other}'")))
        }
    }
}

fn ci_patches_path(patches_list: Option<PathBuf>) -> PathBuf {
    patches_list.unwrap_or_else(|| tools::default_repo_root().join("patches-list.json"))
}

fn run_ci_matrix(args: &[String]) -> Result<ExitCode, Error> {
    let mut output_file: Option<PathBuf> = None;
    let mut patches_list: Option<PathBuf> = None;
    let mut changed_files: Option<String> = None;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(CI_MATRIX_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--output-file" => {
                output_file = Some(PathBuf::from(require_value(
                    args,
                    index,
                    "--output-file",
                    CI_MATRIX_HELP,
                )?));
                index += 2;
            }
            _ if arg.starts_with("--output-file=") => {
                output_file = Some(PathBuf::from(non_empty_value(
                    &arg["--output-file=".len()..],
                    "--output-file",
                    CI_MATRIX_HELP,
                )?));
                index += 1;
            }
            "--patches-list" => {
                patches_list = Some(PathBuf::from(require_value(
                    args,
                    index,
                    "--patches-list",
                    CI_MATRIX_HELP,
                )?));
                index += 2;
            }
            _ if arg.starts_with("--patches-list=") => {
                patches_list = Some(PathBuf::from(non_empty_value(
                    &arg["--patches-list=".len()..],
                    "--patches-list",
                    CI_MATRIX_HELP,
                )?));
                index += 1;
            }
            "--changed-files" => {
                changed_files = Some(require_value(
                    args,
                    index,
                    "--changed-files",
                    CI_MATRIX_HELP,
                )?);
                index += 2;
            }
            _ if arg.starts_with("--changed-files=") => {
                changed_files = Some(non_empty_value(
                    &arg["--changed-files=".len()..],
                    "--changed-files",
                    CI_MATRIX_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(CI_MATRIX_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(CI_MATRIX_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let patches_data = morphe::load_patches_list(ci_patches_path(patches_list))?;
    let event_name =
        std::env::var("GITHUB_EVENT_NAME").unwrap_or_else(|_| "workflow_dispatch".to_string());
    let dispatch_package = std::env::var("DISPATCH_PACKAGE_NAME").ok();
    let input_package = std::env::var("INPUT_PACKAGE_NAME").ok();

    let changed_paths: Option<Vec<String>> = if let Some(changed_files) = changed_files {
        Some(
            changed_files
                .split([',', '\n'])
                .map(str::trim)
                .filter(|path| !path.is_empty())
                .map(str::to_string)
                .collect(),
        )
    } else if event_name == "push" {
        let before = std::env::var("BEFORE_SHA").ok();
        let commit = std::env::var("COMMIT_SHA")
            .ok()
            .or_else(|| std::env::var("GITHUB_SHA").ok());
        compatibility_ci::get_changed_patch_files(
            before.as_deref(),
            commit.as_deref(),
            Path::new("."),
        )
    } else {
        None
    };

    let selected = match compatibility_ci::resolve_matrix_packages(
        &patches_data,
        &event_name,
        dispatch_package.as_deref(),
        input_package.as_deref(),
        changed_paths.as_deref(),
        Path::new("patches"),
    ) {
        Ok(selected) => selected,
        Err(error) => {
            write_stderr(&format!("Matrix resolution error: {}\n", error.message()));
            return Ok(ExitCode::UsageOrToolError);
        }
    };

    let line = ci_packages_line(&selected);
    write_stdout(&format!("{line}\n"))?;
    if let Some(output_file) = output_file.as_deref() {
        let mut file = fs::OpenOptions::new()
            .create(true)
            .append(true)
            .open(output_file)
            .map_err(|error| {
                Error::io(
                    format!("open GITHUB_OUTPUT {}", output_file.display()),
                    error,
                )
            })?;
        writeln!(file, "{line}").map_err(|error| {
            Error::io(
                format!("append GITHUB_OUTPUT {}", output_file.display()),
                error,
            )
        })?;
    }
    Ok(ExitCode::Success)
}

/// Python emits `json.dumps(list)` with the default `", "` separator.
fn ci_packages_line(packages: &[String]) -> String {
    let items: Vec<String> = packages
        .iter()
        .map(|package| {
            let encoded = serde_json::to_string(package).expect("string serializes");
            escape_non_ascii(&encoded)
        })
        .collect();
    format!("packages=[{}]", items.join(", "))
}

fn run_ci_start(args: &[String]) -> Result<ExitCode, Error> {
    let poster = UreqWorkerPoster;
    run_ci_start_with(args, &poster)
}

/// Runs `ci start` with an explicit Worker poster.
pub fn run_ci_start_with(args: &[String], poster: &dyn WorkerPoster) -> Result<ExitCode, Error> {
    let mut package: Option<String> = None;
    let mut request_id: Option<String> = None;
    let mut git_revision: Option<String> = None;
    let mut patches_list: Option<PathBuf> = None;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(CI_START_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--package" => {
                package = Some(require_value(args, index, "--package", CI_START_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    CI_START_HELP,
                )?);
                index += 1;
            }
            "--request-id" => {
                request_id = Some(require_value(args, index, "--request-id", CI_START_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--request-id=") => {
                request_id = Some(non_empty_value(
                    &arg["--request-id=".len()..],
                    "--request-id",
                    CI_START_HELP,
                )?);
                index += 1;
            }
            "--git-revision" => {
                git_revision = Some(require_value(args, index, "--git-revision", CI_START_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--git-revision=") => {
                git_revision = Some(non_empty_value(
                    &arg["--git-revision=".len()..],
                    "--git-revision",
                    CI_START_HELP,
                )?);
                index += 1;
            }
            "--patches-list" => {
                patches_list = Some(PathBuf::from(require_value(
                    args,
                    index,
                    "--patches-list",
                    CI_START_HELP,
                )?));
                index += 2;
            }
            _ if arg.starts_with("--patches-list=") => {
                patches_list = Some(PathBuf::from(non_empty_value(
                    &arg["--patches-list=".len()..],
                    "--patches-list",
                    CI_START_HELP,
                )?));
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(CI_START_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(CI_START_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }
    let (Some(package), Some(request_id), Some(git_revision)) = (package, request_id, git_revision)
    else {
        write_stderr(CI_START_HELP);
        return Err(Error::usage(
            "the following arguments are required: --package, --request-id, --git-revision",
        ));
    };

    let patches_data = morphe::load_patches_list(ci_patches_path(patches_list))?;
    let metadata = compatibility_ci::get_package_run_metadata(&patches_data, &package);
    let Some(status_secret) = nonempty_environment("COMPATIBILITY_STATUS_SECRET") else {
        write_stderr("Missing COMPATIBILITY_STATUS_SECRET; cannot post run start.\n");
        return Ok(ExitCode::UsageOrToolError);
    };
    let worker_url = std::env::var("WORKER_STATUS_URL")
        .unwrap_or_else(|_| compatibility_ci::DEFAULT_WORKER_STATUS_URL.to_string());
    let payload = RunStartPayload {
        request_id,
        package_name: metadata.package_name,
        app_name: metadata.app_name,
        target_version: metadata.target_version,
        supported_versions: metadata.supported_versions,
        git_revision,
    };

    match poster.post_run_start(&worker_url, &status_secret, &payload) {
        Ok(status) if (200..300).contains(&status) => {
            write_stdout(&format!(
                "Registered run start for {package}: HTTP {status}\n"
            ))?;
            Ok(ExitCode::Success)
        }
        Ok(status) => {
            write_stderr(&format!("Worker rejected run start with HTTP {status}\n"));
            Ok(ExitCode::InfrastructureFailure)
        }
        Err(error) => {
            write_stderr(&format!("Failed to post run start to Worker: {error}\n"));
            Ok(ExitCode::InfrastructureFailure)
        }
    }
}

fn nonempty_environment(name: &str) -> Option<String> {
    std::env::var(name).ok().filter(|value| !value.is_empty())
}

/// Dependencies for `ci run`; injected by integration tests so no cloud or
/// Morphe process is touched.
pub struct CiRunBackends<'a> {
    pub fixtures: &'a R2FixtureManager,
    pub acquirer: Option<&'a dyn ArtifactAcquirer>,
    pub checker: &'a dyn CompatibilityChecker,
    pub poster: &'a dyn WorkerPoster,
    pub inspector: &'a dyn ArtifactInspector,
}

/// Native acquisition adapter for `ci run`.
struct NativeCiAcquirer;

impl ArtifactAcquirer for NativeCiAcquirer {
    fn acquire(
        &self,
        package: &str,
        output_dir: &Path,
        expected_version: &str,
    ) -> Result<(PathBuf, String), Error> {
        acquisition::acquire_artifact(package, output_dir, Some(expected_version), None)
            .map(|artifact| (artifact.path, artifact.source.label().to_string()))
    }
}

/// Native Morphe compatibility check adapter for `ci run`.
struct NativeCiChecker {
    workspace_root: PathBuf,
}

impl CompatibilityChecker for NativeCiChecker {
    fn check(
        &self,
        artifact: &Path,
        mpp: &Path,
        expected_package: &str,
    ) -> Result<(PatchCompatibilityReport, ExitCode), Error> {
        let runner = CheckRunner::native(native_morphe_tool()?);
        let mut options = CheckOptions::new(artifact, mpp);
        options.expected_package = Some(expected_package.to_string());
        options.all_patches = true;
        options.workspace_root = self.workspace_root.clone();
        options.tool_versions = collect_tool_versions();
        options.git_revision = git_revision();
        options.patches_list_path = Some(tools::default_repo_root().join("patches-list.json"));
        runner.run(&options)
    }
}

fn run_ci_run(args: &[String]) -> Result<ExitCode, Error> {
    run_ci_run_with(args, None)
}

/// Runs `ci run` with optional injected dependencies.
pub fn run_ci_run_with(
    args: &[String],
    backends: Option<&CiRunBackends<'_>>,
) -> Result<ExitCode, Error> {
    let mut package: Option<String> = None;
    let mut mpp: Option<String> = None;
    let mut patches_list: Option<PathBuf> = None;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(CI_RUN_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--package" => {
                package = Some(require_value(args, index, "--package", CI_RUN_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    CI_RUN_HELP,
                )?);
                index += 1;
            }
            "--mpp" => {
                mpp = Some(require_value(args, index, "--mpp", CI_RUN_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--mpp=") => {
                mpp = Some(non_empty_value(
                    &arg["--mpp=".len()..],
                    "--mpp",
                    CI_RUN_HELP,
                )?);
                index += 1;
            }
            "--patches-list" => {
                patches_list = Some(PathBuf::from(require_value(
                    args,
                    index,
                    "--patches-list",
                    CI_RUN_HELP,
                )?));
                index += 2;
            }
            _ if arg.starts_with("--patches-list=") => {
                patches_list = Some(PathBuf::from(non_empty_value(
                    &arg["--patches-list=".len()..],
                    "--patches-list",
                    CI_RUN_HELP,
                )?));
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(CI_RUN_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(CI_RUN_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }
    let Some(package) = package else {
        write_stderr(CI_RUN_HELP);
        return Err(Error::usage(
            "the following arguments are required: --package",
        ));
    };

    let mpp_path = match resolve_ci_mpp(mpp.as_deref()) {
        Some(path) => path,
        None => {
            write_stderr("Error: No MPP bundle found in patches/build/libs/\n");
            return Ok(ExitCode::UsageOrToolError);
        }
    };

    let patches_data = morphe::load_patches_list(ci_patches_path(patches_list))?;
    let runner_temp = std::env::var_os("RUNNER_TEMP")
        .map(PathBuf::from)
        .unwrap_or_else(std::env::temp_dir);
    let event_name =
        std::env::var("GITHUB_EVENT_NAME").unwrap_or_else(|_| "workflow_dispatch".to_string());
    let raw_roles = std::env::var("DISPATCH_EXPECTED_ROLES").ok();
    let requested_roles =
        match compatibility_ci::parse_requested_roles(raw_roles.as_deref(), Some(&event_name)) {
            Ok(roles) => roles,
            Err(error) => {
                write_stderr(&format!("Role parsing error: {}\n", error.message()));
                return Ok(ExitCode::UsageOrToolError);
            }
        };
    let mut environment = CiEnvironment::from_env();
    // Python keeps an explicitly empty WORKER_STATUS_URL (which disables the
    // callback) instead of substituting the default.
    if std::env::var("WORKER_STATUS_URL").is_ok_and(|value| value.is_empty()) {
        environment.worker_url = String::new();
    }
    let request = CiRunRequest {
        package: &package,
        mpp_path: &mpp_path,
        runner_temp: &runner_temp,
        patches_data: &patches_data,
        environment,
        requested_roles,
    };

    let runtime = current_thread_runtime()?;
    match backends {
        Some(backends) => {
            let dependencies = CiDependencies {
                r2: backends.fixtures,
                acquirer: backends.acquirer,
                checker: backends.checker,
                poster: backends.poster,
                inspector: backends.inspector,
            };
            runtime.block_on(compatibility_ci::run_ci_reconcile_and_test(
                &request,
                &dependencies,
            ))
        }
        None => {
            let fixtures = R2FixtureManager::from_env()
                .map_err(|error| Error::infrastructure(error.to_string()))?;
            let acquirer = NativeCiAcquirer;
            let checker = NativeCiChecker {
                workspace_root: PathBuf::from(DEFAULT_WORKSPACE_ROOT),
            };
            let poster = UreqWorkerPoster;
            let inspector = NativeInspector;
            let has_acquisition_credentials = request.environment.apkeep_accounts.is_some()
                || request.environment.r2_access_key_id.is_some();
            let dependencies = CiDependencies {
                r2: &fixtures,
                acquirer: if has_acquisition_credentials {
                    Some(&acquirer as &dyn ArtifactAcquirer)
                } else {
                    None
                },
                checker: &checker,
                poster: &poster,
                inspector: &inspector,
            };
            runtime.block_on(compatibility_ci::run_ci_reconcile_and_test(
                &request,
                &dependencies,
            ))
        }
    }
}

fn resolve_ci_mpp(mpp: Option<&str>) -> Option<PathBuf> {
    let path = match mpp {
        Some(mpp) => PathBuf::from(mpp),
        None => {
            let libs = Path::new("patches/build/libs");
            let mut candidates: Vec<PathBuf> = fs::read_dir(libs)
                .ok()?
                .filter_map(Result::ok)
                .map(|entry| entry.path())
                .filter(|path| {
                    path.file_name()
                        .and_then(|name| name.to_str())
                        .is_some_and(|name| name.starts_with("patches-") && name.ends_with(".mpp"))
                })
                .collect();
            candidates.sort();
            candidates.pop()?
        }
    };
    let resolved = std::path::absolute(&path).unwrap_or(path);
    resolved.is_file().then_some(resolved)
}

fn run_inspect(args: &[String]) -> Result<ExitCode, Error> {
    let mut json_target: Option<JsonTarget> = None;
    let mut artifact: Option<String> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(INSPECT_HELP)?;
                return Ok(ExitCode::Success);
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, INSPECT_HELP)?;
            }
            _ if arg.starts_with('-') => {
                write_stderr(INSPECT_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(INSPECT_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(INSPECT_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };

    match inspection::inspect_artifact(&artifact) {
        Ok(inspection) => {
            if let Some(target) = &json_target {
                write_sorted_json(&inspection, target)?;
            } else {
                write_stdout(&format_inspection_human(&inspection))?;
            }
            Ok(ExitCode::Success)
        }
        Err(error) => {
            if matches!(error, Error::Infrastructure(_) | Error::Io { .. }) {
                write_stderr(&format!("Unexpected error: {error}\n"));
                Ok(ExitCode::InfrastructureFailure)
            } else {
                write_stderr(&format!("Inspection error: {error}\n"));
                Ok(error.exit_code())
            }
        }
    }
}

fn format_inspection_human(inspection: &ArtifactInspection) -> String {
    let mut text = String::new();
    text.push_str(&format!("Artifact:          {}\n", inspection.file_path));
    text.push_str(&format!(
        "Container Type:    {}\n",
        container_type_label(inspection.container_type)
    ));
    text.push_str(&format!(
        "Size:              {} bytes\n",
        format_thousands(inspection.file_size)
    ));
    text.push_str(&format!("SHA-256:           {}\n", inspection.sha256));
    text.push_str(&format!("Package Name:      {}\n", inspection.package_name));
    text.push_str(&format!("Version Name:      {}\n", inspection.version_name));
    text.push_str(&format!("Version Code:      {}\n", inspection.version_code));
    text.push_str(&format!(
        "Min / Target SDK:  {} / {}\n",
        python_sdk(inspection.min_sdk),
        python_sdk(inspection.target_sdk)
    ));
    text.push_str(&format!(
        "Signer SHA-256:    {}\n",
        inspection
            .signing_certificate_sha256
            .as_deref()
            .unwrap_or("None")
    ));
    text.push_str(&format!("Splits:            {}\n", inspection.splits.len()));
    for split in &inspection.splits {
        text.push_str(&format!(
            "  - {} ({} bytes){}\n",
            split.filename,
            format_thousands(split.size),
            if split.is_base { " [BASE]" } else { "" }
        ));
    }
    text.push_str(&format!(
        "DEX Stats:         {} classes, {} methods ({} dex files)\n",
        format_thousands(inspection.dex_classes_count),
        format_thousands(inspection.dex_methods_count),
        inspection.dex_files.len()
    ));
    text.push_str(&format!(
        "Native Libraries:  {}\n",
        inspection.native_libraries.len()
    ));
    text.push_str(&format!("Assets:            {}\n", inspection.assets.len()));
    if !inspection.warnings.is_empty() {
        text.push_str(&format!("Warnings ({}):\n", inspection.warnings.len()));
        for warning in inspection.warnings.iter().take(5) {
            text.push_str(&format!("  ! {warning}\n"));
        }
    }
    text
}

fn container_type_label(container_type: crate::models::ContainerType) -> &'static str {
    match container_type {
        crate::models::ContainerType::Apk => "APK",
        crate::models::ContainerType::Apkm => "APKM",
        crate::models::ContainerType::Xapk => "XAPK",
        crate::models::ContainerType::Apks => "APKS",
        crate::models::ContainerType::Unknown => "UNKNOWN",
    }
}

fn python_sdk(value: Option<u32>) -> String {
    value.map_or_else(|| "None".to_string(), |number| number.to_string())
}

fn format_thousands(value: u64) -> String {
    let digits = value.to_string();
    let mut output = String::with_capacity(digits.len() + digits.len() / 3);
    for (index, character) in digits.chars().enumerate() {
        if index > 0 && (digits.len() - index).is_multiple_of(3) {
            output.push(',');
        }
        output.push(character);
    }
    output
}

fn parse_auto_int(value: &str) -> Result<i64, Error> {
    match asm::parse_base0(value) {
        Ok(asm::ParsedInteger::Value(number)) => i64::try_from(number)
            .map_err(|_| Error::usage(format!("Invalid integer or hex value: {value}"))),
        Ok(asm::ParsedInteger::Overflow) => Err(Error::usage(format!(
            "Invalid integer or hex value: {value}"
        ))),
        Err(()) => Err(Error::usage(format!(
            "Invalid integer or hex value: {value}"
        ))),
    }
}

fn parse_non_negative_int(value: &str) -> Result<usize, Error> {
    let number = match asm::parse_base0(value) {
        Ok(asm::ParsedInteger::Value(number)) => number,
        Ok(asm::ParsedInteger::Overflow) => {
            return Err(Error::usage(format!("Invalid integer value: {value}")))
        }
        Err(()) => return Err(Error::usage(format!("Invalid integer value: {value}"))),
    };
    if number < 0 {
        return Err(Error::usage(format!(
            "Value must be non-negative, got {value}"
        )));
    }
    usize::try_from(number).map_err(|_| Error::usage(format!("Invalid integer value: {value}")))
}

fn run_asm(args: &[String]) -> Result<ExitCode, Error> {
    let mut statement: Option<String> = None;
    let mut pc: i64 = 0;
    let mut target: Option<i64> = None;
    let mut format = "hex".to_string();
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(ASM_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--pc" => {
                let value = require_value(args, index, "--pc", ASM_HELP)?;
                pc = parse_auto_int(&value)?;
                index += 2;
            }
            _ if arg.starts_with("--pc=") => {
                pc = parse_auto_int(&arg["--pc=".len()..])?;
                index += 1;
            }
            "--target" => {
                let value = require_value(args, index, "--target", ASM_HELP)?;
                target = Some(parse_auto_int(&value)?);
                index += 2;
            }
            _ if arg.starts_with("--target=") => {
                target = Some(parse_auto_int(&arg["--target=".len()..])?);
                index += 1;
            }
            "--format" => {
                let value = require_value(args, index, "--format", ASM_HELP)?;
                format = parse_asm_format(&value)?;
                index += 2;
            }
            _ if arg.starts_with("--format=") => {
                format = parse_asm_format(&arg["--format=".len()..])?;
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(ASM_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if statement.is_none() => {
                statement = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(ASM_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(statement) = statement else {
        write_stderr(ASM_HELP);
        return Err(Error::usage(
            "the following arguments are required: statement",
        ));
    };

    match asm::assemble_statement(&statement, pc, target)
        .and_then(|opcode| asm::format_instruction(opcode, &format))
    {
        Ok(formatted) => {
            write_stdout(&format!("{formatted}\n"))?;
            Ok(ExitCode::Success)
        }
        Err(error) => {
            write_stderr(&format!("Assembly error: {error}\n"));
            Ok(error.exit_code())
        }
    }
}

fn parse_asm_format(value: &str) -> Result<String, Error> {
    match value {
        "hex" | "kotlin" | "int" | "bytes" => Ok(value.to_string()),
        _ => {
            write_stderr(ASM_HELP);
            Err(Error::usage(format!(
                "argument --format: invalid choice: '{value}' (choose from 'hex', 'kotlin', 'int', 'bytes')"
            )))
        }
    }
}

#[derive(Serialize)]
struct StringMatchRow {
    split: String,
    dex: String,
    string: String,
}

fn run_strings(args: &[String]) -> Result<ExitCode, Error> {
    let mut artifact: Option<String> = None;
    let mut query: Option<String> = None;
    let mut dex_filter: Option<String> = None;
    let mut ignore_case = true;
    let mut json_target: Option<JsonTarget> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(STRINGS_HELP)?;
                return Ok(ExitCode::Success);
            }
            "-q" | "--query" => {
                query = Some(require_value(args, index, "--query", STRINGS_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--query=") => {
                query = Some(non_empty_value(
                    &arg["--query=".len()..],
                    "--query",
                    STRINGS_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with("-q") && arg.len() > 2 => {
                query = Some(arg["-q".len()..].to_string());
                index += 1;
            }
            "--dex" => {
                dex_filter = Some(require_value(args, index, "--dex", STRINGS_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--dex=") => {
                dex_filter = Some(non_empty_value(
                    &arg["--dex=".len()..],
                    "--dex",
                    STRINGS_HELP,
                )?);
                index += 1;
            }
            "-i" | "--ignore-case" => {
                ignore_case = true;
                index += 1;
            }
            "-s" | "--case-sensitive" => {
                ignore_case = false;
                index += 1;
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, STRINGS_HELP)?;
            }
            _ if arg.starts_with('-') => {
                write_stderr(STRINGS_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(STRINGS_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(STRINGS_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };

    let pattern = match query.as_deref().filter(|value| !value.is_empty()) {
        Some(query) => match RegexBuilder::new(query)
            .case_insensitive(ignore_case)
            .build()
        {
            Ok(pattern) => Some(pattern),
            Err(error) => {
                write_stderr(&format!("Strings search error: {error}\n"));
                return Ok(ExitCode::InfrastructureFailure);
            }
        },
        None => None,
    };

    let matches = match collect_artifact_strings(&artifact, pattern.as_ref(), dex_filter.as_deref())
    {
        Ok(matches) => matches,
        Err(error) => {
            write_stderr(&format!("Strings search error: {error}\n"));
            return Ok(ExitCode::InfrastructureFailure);
        }
    };

    if let Some(target) = &json_target {
        write_python_json_unsorted(&matches, target, false)?;
    } else {
        let mut text = String::new();
        for row in &matches {
            text.push_str(&format!("[{}:{}] {}\n", row.split, row.dex, row.string));
        }
        write_stdout(&text)?;
    }

    Ok(ExitCode::Success)
}

fn collect_artifact_strings(
    artifact: &str,
    pattern: Option<&regex::Regex>,
    dex_filter: Option<&str>,
) -> Result<Vec<StringMatchRow>, Error> {
    let options = inspection::InspectionOptions::from_process();
    let (_inspection, materialized) =
        inspection::inspect_artifact_with_materialization(artifact, &options)?;

    let mut matches = Vec::new();
    for apk in materialized.as_slice() {
        let archive = open_zip(&apk.path)?;
        let mut archive = archive;
        let mut names: Vec<String> = zip_member_names(&mut archive)?;
        names.sort();
        for name in names {
            if !name.ends_with(".dex") {
                continue;
            }
            if let Some(filter) = dex_filter {
                if !name.contains(filter) {
                    continue;
                }
            }
            let bytes = read_zip_member(&mut archive, &name)?;
            for string in dex_strings::extract_strings_from_dex_bytes(&bytes) {
                if pattern.is_none_or(|pattern| pattern.is_match(&string)) {
                    matches.push(StringMatchRow {
                        split: apk.split_name.clone(),
                        dex: name.clone(),
                        string,
                    });
                }
            }
        }
    }
    Ok(matches)
}

#[derive(Serialize)]
struct UnityRow {
    member: String,
    name: String,
    path_id: i64,
    file_offset: usize,
    is_active_offset: usize,
    is_active_offset_hex: String,
    is_active_value: u8,
}

fn run_unity(args: &[String]) -> Result<ExitCode, Error> {
    let mut artifact: Option<String> = None;
    let mut gameobject: Option<String> = None;
    let mut json_target: Option<JsonTarget> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(UNITY_HELP)?;
                return Ok(ExitCode::Success);
            }
            "-g" | "--gameobject" => {
                gameobject = Some(require_value(args, index, "--gameobject", UNITY_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--gameobject=") => {
                gameobject = Some(non_empty_value(
                    &arg["--gameobject=".len()..],
                    "--gameobject",
                    UNITY_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with("-g") && arg.len() > 2 => {
                gameobject = Some(arg["-g".len()..].to_string());
                index += 1;
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, UNITY_HELP)?;
            }
            _ if arg.starts_with('-') => {
                write_stderr(UNITY_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(UNITY_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(UNITY_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };
    let Some(gameobject) = gameobject else {
        write_stderr(UNITY_HELP);
        return Err(Error::usage(
            "the following arguments are required: --gameobject/-g",
        ));
    };

    let rows = match collect_unity_rows(&artifact, &gameobject) {
        Ok(rows) => rows,
        Err(error) => {
            if let Error::Usage(message) = &error {
                write_stderr(&format!("Error: {message}\n"));
                return Ok(ExitCode::UsageOrToolError);
            }
            write_stderr(&format!("Unity asset inspection error: {error}\n"));
            return Ok(ExitCode::InfrastructureFailure);
        }
    };

    if let Some(target) = &json_target {
        write_sorted_json(&rows, target)?;
    } else if rows.is_empty() {
        write_stdout("No matching Unity GameObjects found.\n")?;
    } else {
        let mut text = format!("Found {} matching Unity GameObjects:\n", rows.len());
        text.push_str(&format!(
            "{:<45} {:<30} {:<10} {:<15} {:<6}\n",
            "Member", "Name", "Offset", "Active Offset", "Active"
        ));
        text.push_str(&format!("{}\n", "-".repeat(110)));
        for row in rows.iter().take(100) {
            text.push_str(&format!(
                "{:<45} {:<30} 0x{:x}     {:<15} {:<6}\n",
                row.member,
                row.name,
                row.file_offset,
                row.is_active_offset_hex,
                row.is_active_value
            ));
        }
        if rows.len() > 100 {
            text.push_str(&format!(
                "... and {} more (use --json to see all)\n",
                rows.len() - 100
            ));
        }
        write_stdout(&text)?;
    }

    Ok(ExitCode::Success)
}

fn collect_unity_rows(artifact: &str, gameobject: &str) -> Result<Vec<UnityRow>, Error> {
    let path = Path::new(artifact);
    if !path.is_file() {
        return Err(Error::usage(format!(
            "Artifact file not found: {}",
            path.display()
        )));
    }
    let mut archive = open_zip(path)?;
    let names: Vec<String> = zip_member_names(&mut archive)?;
    let direct_assets: Vec<String> = names
        .iter()
        .filter(|name| unity::is_unity_asset_path(name))
        .cloned()
        .collect();

    if !direct_assets.is_empty() {
        let mut sorted = direct_assets;
        sorted.sort();
        let mut rows = Vec::new();
        for member in sorted {
            let data = read_zip_member(&mut archive, &member)?;
            append_unity_rows(&mut rows, &member, &data, Some(gameobject));
        }
        return Ok(rows);
    }

    let mut rows = Vec::new();
    for apk_member in names.iter().filter(|name| name.ends_with(".apk")) {
        let inner_bytes = read_zip_member(&mut archive, apk_member)?;
        let mut inner = ZipArchive::new(io::Cursor::new(inner_bytes)).map_err(|error| {
            Error::infrastructure(format!("cannot read inner APK {apk_member}: {error}"))
        })?;
        let mut inner_assets: Vec<String> = zip_member_names(&mut inner)?
            .into_iter()
            .filter(|name| unity::is_unity_asset_path(name))
            .collect();
        inner_assets.sort();
        for member in inner_assets {
            let data = read_zip_member(&mut inner, &member)?;
            append_unity_rows(&mut rows, &member, &data, Some(gameobject));
        }
    }
    Ok(rows)
}

fn append_unity_rows(
    rows: &mut Vec<UnityRow>,
    member: &str,
    data: &[u8],
    gameobject: Option<&str>,
) {
    for record in unity::find_game_objects(data, gameobject) {
        rows.push(UnityRow {
            member: member.to_string(),
            name: record.name,
            path_id: record.path_id,
            file_offset: record.file_offset,
            is_active_offset: record.is_active_offset,
            is_active_offset_hex: format!("0x{:x}", record.is_active_offset),
            is_active_value: record.is_active_value,
        });
    }
}

fn run_il2cpp(args: &[String]) -> Result<ExitCode, Error> {
    let mut artifact: Option<String> = None;
    let mut query: Option<String> = None;
    let mut json_target: Option<JsonTarget> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(IL2CPP_HELP)?;
                return Ok(ExitCode::Success);
            }
            "-q" | "--query" => {
                query = Some(require_value(args, index, "--query", IL2CPP_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--query=") => {
                query = Some(non_empty_value(
                    &arg["--query=".len()..],
                    "--query",
                    IL2CPP_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with("-q") && arg.len() > 2 => {
                query = Some(arg["-q".len()..].to_string());
                index += 1;
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, IL2CPP_HELP)?;
            }
            _ if arg.starts_with('-') => {
                write_stderr(IL2CPP_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(IL2CPP_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(IL2CPP_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };

    let records = match collect_il2cpp_records(&artifact, query.as_deref()) {
        Ok(records) => records,
        Err(error) => match error {
            Error::Usage(message)
                if message.starts_with("Artifact file not found")
                    || message.starts_with("global-metadata.dat not found") =>
            {
                write_stderr(&format!("Error: {message}\n"));
                return Ok(ExitCode::UsageOrToolError);
            }
            Error::Usage(message) => {
                write_stderr(&format!("IL2CPP metadata error: {message}\n"));
                return Ok(ExitCode::UsageOrToolError);
            }
            other => {
                write_stderr(&format!("IL2CPP analysis error: {other}\n"));
                return Ok(ExitCode::InfrastructureFailure);
            }
        },
    };

    if let Some(target) = &json_target {
        write_sorted_json(&records, target)?;
    } else if records.is_empty() {
        write_stdout("No matching IL2CPP symbols found.\n")?;
    } else {
        let mut text = format!("Found {} matching IL2CPP symbols:\n", records.len());
        text.push_str(&format!(
            "{:<25} {:<35} {:<35} {:<6}\n",
            "Namespace", "Type", "Method", "Params"
        ));
        text.push_str(&format!("{}\n", "-".repeat(105)));
        for record in records.iter().take(100) {
            let namespace = if record.namespace.is_empty() {
                "<global>"
            } else {
                &record.namespace
            };
            text.push_str(&format!(
                "{:<25} {:<35} {:<35} {:<6}\n",
                namespace, record.type_name, record.method, record.parameters_count
            ));
        }
        if records.len() > 100 {
            text.push_str(&format!(
                "... and {} more (use --json to see all)\n",
                records.len() - 100
            ));
        }
        write_stdout(&text)?;
    }

    Ok(ExitCode::Success)
}

fn collect_il2cpp_records(
    artifact: &str,
    query: Option<&str>,
) -> Result<Vec<il2cpp::Il2CppAnalysisRecord>, Error> {
    const METADATA_PATH: &str = "assets/bin/Data/Managed/Metadata/global-metadata.dat";
    let path = Path::new(artifact);
    if !path.is_file() {
        return Err(Error::usage(format!(
            "Artifact file not found: {}",
            path.display()
        )));
    }
    let mut archive = open_zip(path)?;
    let names: Vec<String> = zip_member_names(&mut archive)?;
    let mut metadata: Option<Vec<u8>> = None;

    if names.iter().any(|name| name == METADATA_PATH) {
        metadata = Some(read_zip_member(&mut archive, METADATA_PATH)?);
    } else {
        for apk_member in names.iter().filter(|name| name.ends_with(".apk")) {
            let inner_bytes = read_zip_member(&mut archive, apk_member)?;
            let mut inner = ZipArchive::new(io::Cursor::new(inner_bytes)).map_err(|error| {
                Error::infrastructure(format!("cannot read inner APK {apk_member}: {error}"))
            })?;
            if zip_member_names(&mut inner)?
                .iter()
                .any(|name| name == METADATA_PATH)
            {
                metadata = Some(read_zip_member(&mut inner, METADATA_PATH)?);
            }
        }
    }

    let Some(metadata) = metadata else {
        return Err(Error::usage("global-metadata.dat not found in artifact"));
    };
    il2cpp::analyze_metadata(&metadata, query)
}

fn run_manifest(args: &[String]) -> Result<ExitCode, Error> {
    let mut artifact: Option<String> = None;
    let mut component_type: Option<String> = None;
    let mut filter: Option<String> = None;
    let mut json_target: Option<JsonTarget> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(MANIFEST_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--type" => {
                let value = require_value(args, index, "--type", MANIFEST_HELP)?;
                component_type = Some(parse_component_type(&value)?);
                index += 2;
            }
            _ if arg.starts_with("--type=") => {
                component_type = Some(parse_component_type(&arg["--type=".len()..])?);
                index += 1;
            }
            "--filter" => {
                filter = Some(require_value(args, index, "--filter", MANIFEST_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--filter=") => {
                filter = Some(non_empty_value(
                    &arg["--filter=".len()..],
                    "--filter",
                    MANIFEST_HELP,
                )?);
                index += 1;
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, MANIFEST_HELP)?;
            }
            _ if arg.starts_with('-') => {
                write_stderr(MANIFEST_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(MANIFEST_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(MANIFEST_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };

    let result = manifest::inspect_artifact_components(&artifact, component_type.as_deref());
    let components = match result {
        Ok(components) => components,
        Err(error) => {
            write_stderr(&format!("Manifest inspection error: {error}\n"));
            return Ok(ExitCode::InfrastructureFailure);
        }
    };

    let components = if let Some(filter) = &filter {
        let pattern = match RegexBuilder::new(filter).case_insensitive(true).build() {
            Ok(pattern) => pattern,
            Err(error) => {
                write_stderr(&format!("Manifest inspection error: {error}\n"));
                return Ok(ExitCode::InfrastructureFailure);
            }
        };
        components
            .into_iter()
            .filter(|component| pattern.is_match(&component.name))
            .collect()
    } else {
        components
    };

    if let Some(target) = &json_target {
        write_python_json_unsorted(&components, target, false)?;
    } else {
        let mut text = String::new();
        for component in &components {
            let exported = component
                .exported
                .map(|value| format!(" [exported={value}]"))
                .unwrap_or_default();
            let actions = if component.intent_actions.is_empty() {
                String::new()
            } else {
                format!(" (actions: {})", component.intent_actions.join(", "))
            };
            text.push_str(&format!(
                "[{}] {}{exported}{actions}\n",
                component.component_type.to_uppercase(),
                component.name
            ));
        }
        write_stdout(&text)?;
    }

    Ok(ExitCode::Success)
}

fn parse_component_type(value: &str) -> Result<String, Error> {
    match value {
        "activity" | "service" | "receiver" | "provider" => Ok(value.to_string()),
        _ => {
            write_stderr(MANIFEST_HELP);
            Err(Error::usage(format!(
                "argument --type: invalid choice: '{value}' (choose from 'activity', 'service', 'receiver', 'provider')"
            )))
        }
    }
}

fn run_res(args: &[String]) -> Result<ExitCode, Error> {
    let mut artifact: Option<String> = None;
    let mut query: Option<String> = None;
    let mut text: Option<String> = None;
    let mut extract: Option<String> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(RES_HELP)?;
                return Ok(ExitCode::Success);
            }
            "-q" | "--query" => {
                query = Some(require_value(args, index, "--query", RES_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--query=") => {
                query = Some(non_empty_value(
                    &arg["--query=".len()..],
                    "--query",
                    RES_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with("-q") && arg.len() > 2 => {
                query = Some(arg["-q".len()..].to_string());
                index += 1;
            }
            "--text" | "--value" => {
                text = Some(require_value(args, index, "--text", RES_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--text=") => {
                text = Some(non_empty_value(
                    &arg["--text=".len()..],
                    "--text",
                    RES_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with("--value=") => {
                text = Some(non_empty_value(
                    &arg["--value=".len()..],
                    "--value",
                    RES_HELP,
                )?);
                index += 1;
            }
            "--extract" => {
                extract = Some(require_value(args, index, "--extract", RES_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--extract=") => {
                extract = Some(non_empty_value(
                    &arg["--extract=".len()..],
                    "--extract",
                    RES_HELP,
                )?);
                index += 1;
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                write_stderr(RES_HELP);
                return Err(Error::usage("unrecognized option '--json'"));
            }
            _ if arg.starts_with('-') => {
                write_stderr(RES_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(RES_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(RES_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };

    let query = match (
        query.filter(|value| !value.is_empty()),
        text.filter(|value| !value.is_empty()),
    ) {
        (Some(query), _) => query,
        (None, Some(text)) => format!("text:{text}"),
        (None, None) => {
            write_stderr(
                "Resource inspection error: either --query or --text/--value is required\n",
            );
            return Ok(ExitCode::UsageOrToolError);
        }
    };

    match resources::inspect_resources(&artifact, &query, extract.as_deref().map(Path::new)) {
        Ok(report) => {
            write_stdout(&format!("{}\n", report.format_human()))?;
            Ok(ExitCode::Success)
        }
        Err(error) => match error {
            Error::Usage(message) if message.starts_with("Artifact not found") => {
                write_stderr(&format!("Inspection error: {message}\n"));
                Ok(ExitCode::UsageOrToolError)
            }
            Error::Usage(message) => {
                write_stderr(&format!("Resource inspection error: {message}\n"));
                Ok(ExitCode::UsageOrToolError)
            }
            Error::InvalidArtifact(message) => {
                write_stderr(&format!("Inspection error: {message}\n"));
                Ok(ExitCode::InvalidArtifact)
            }
            other => {
                write_stderr(&format!("Resource inspection error: {other}\n"));
                Ok(ExitCode::InfrastructureFailure)
            }
        },
    }
}

fn run_inspect_code(args: &[String]) -> Result<ExitCode, Error> {
    let mut artifact: Option<String> = None;
    let mut class_name: Option<String> = None;
    let mut method: Option<String> = None;
    let mut format = "smali".to_string();
    let mut compare: Option<String> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(INSPECT_CODE_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--class" => {
                class_name = Some(require_value(args, index, "--class", INSPECT_CODE_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--class=") => {
                class_name = Some(non_empty_value(
                    &arg["--class=".len()..],
                    "--class",
                    INSPECT_CODE_HELP,
                )?);
                index += 1;
            }
            "--method" => {
                method = Some(require_value(args, index, "--method", INSPECT_CODE_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--method=") => {
                method = Some(non_empty_value(
                    &arg["--method=".len()..],
                    "--method",
                    INSPECT_CODE_HELP,
                )?);
                index += 1;
            }
            "--format" => {
                let value = require_value(args, index, "--format", INSPECT_CODE_HELP)?;
                format = parse_code_format(&value)?;
                index += 2;
            }
            _ if arg.starts_with("--format=") => {
                format = parse_code_format(&arg["--format=".len()..])?;
                index += 1;
            }
            "--compare" => {
                compare = Some(require_value(args, index, "--compare", INSPECT_CODE_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--compare=") => {
                compare = Some(non_empty_value(
                    &arg["--compare=".len()..],
                    "--compare",
                    INSPECT_CODE_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(INSPECT_CODE_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(INSPECT_CODE_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(INSPECT_CODE_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };
    let Some(class_name) = class_name else {
        write_stderr(INSPECT_CODE_HELP);
        return Err(Error::usage(
            "the following arguments are required: --class",
        ));
    };
    let _ = class_name;

    let executor = match NativeToolExecutor::from_defaults() {
        Ok(executor) => executor,
        Err(error) => {
            write_stderr(&format!("Code inspection error: {error}\n"));
            return Ok(ExitCode::InfrastructureFailure);
        }
    };
    let request = InspectCodeRequest {
        artifact: PathBuf::from(&artifact),
        fqcn: class_name,
        method,
        format,
        compare_artifact: compare.map(PathBuf::from),
        use_color: code_inspection::stdout_is_tty(),
    };

    match code_inspection::inspect_or_compare_code(&request, &executor, &LiveArtifactInspector) {
        Ok(output) => {
            write_stdout(&output.text)?;
            Ok(ExitCode::Success)
        }
        Err(error) => {
            let (prefix, code) = match &error {
                Error::Usage(message) if message.starts_with("Artifact not found") => {
                    ("Inspection error", ExitCode::UsageOrToolError)
                }
                Error::Usage(_) => ("Code inspection error", ExitCode::UsageOrToolError),
                Error::InvalidArtifact(_) => ("Inspection error", ExitCode::InvalidArtifact),
                _ => ("Code inspection error", ExitCode::InfrastructureFailure),
            };
            write_stderr(&format!("{prefix}: {error}\n"));
            Ok(code)
        }
    }
}

fn parse_code_format(value: &str) -> Result<String, Error> {
    match value {
        "smali" | "java" => Ok(value.to_string()),
        _ => {
            write_stderr(INSPECT_CODE_HELP);
            Err(Error::usage(format!(
                "argument --format: invalid choice: '{value}' (choose from 'smali', 'java')"
            )))
        }
    }
}

fn run_compare(args: &[String]) -> Result<ExitCode, Error> {
    let mut old_artifact: Option<String> = None;
    let mut new_artifact: Option<String> = None;
    let mut classes: Vec<String> = Vec::new();
    let mut json_target: Option<JsonTarget> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(COMPARE_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--class" => {
                classes.push(require_value(args, index, "--class", COMPARE_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--class=") => {
                classes.push(non_empty_value(
                    &arg["--class=".len()..],
                    "--class",
                    COMPARE_HELP,
                )?);
                index += 1;
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, COMPARE_HELP)?;
            }
            _ if arg.starts_with('-') => {
                write_stderr(COMPARE_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if old_artifact.is_none() => {
                old_artifact = Some(arg.to_string());
                index += 1;
            }
            _ if new_artifact.is_none() => {
                new_artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(COMPARE_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let (Some(old_artifact), Some(new_artifact)) = (old_artifact, new_artifact) else {
        write_stderr(COMPARE_HELP);
        return Err(Error::usage(
            "the following arguments are required: old_artifact, new_artifact",
        ));
    };

    let executor = match NativeToolExecutor::from_defaults() {
        Ok(executor) => executor,
        Err(error) => {
            write_stderr(&format!("Unexpected error: {error}\n"));
            return Ok(ExitCode::InfrastructureFailure);
        }
    };

    let comparison = match comparison::compare_artifacts(
        Path::new(&old_artifact),
        Path::new(&new_artifact),
        &classes,
        &executor,
        &LiveArtifactInspector,
    ) {
        Ok(comparison) => comparison,
        Err(Error::Usage(message)) => {
            write_stderr(&format!("Comparison inspection error: {message}\n"));
            return Ok(ExitCode::UsageOrToolError);
        }
        Err(Error::InvalidArtifact(message)) => {
            write_stderr(&format!("Comparison inspection error: {message}\n"));
            return Ok(ExitCode::InvalidArtifact);
        }
        Err(other) => {
            write_stderr(&format!("Unexpected error: {other}\n"));
            return Ok(ExitCode::InfrastructureFailure);
        }
    };

    if let Some(target) = &json_target {
        write_sorted_json(&comparison, target)?;
    } else {
        write_stdout(&format!(
            "{}\n",
            comparison::format_comparison_summary(&comparison)
        ))?;
    }

    if !classes.is_empty()
        && comparison
            .classes_diff
            .iter()
            .any(|(_, diff)| diff.status == "error" || diff.status == "tool_unavailable")
    {
        return Ok(ExitCode::UsageOrToolError);
    }
    Ok(ExitCode::Success)
}

fn run_analyze(args: &[String], workspace_root: &Path) -> Result<ExitCode, Error> {
    let mut artifact: Option<String> = None;
    let mut jadx = false;
    let mut apktool = false;
    let mut smali = false;
    let mut classes: Vec<String> = Vec::new();
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(ANALYZE_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--jadx" => {
                jadx = true;
                index += 1;
            }
            "--apktool" => {
                apktool = true;
                index += 1;
            }
            "--smali" => {
                smali = true;
                index += 1;
            }
            "--class" => {
                classes.push(require_value(args, index, "--class", ANALYZE_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--class=") => {
                classes.push(non_empty_value(
                    &arg["--class=".len()..],
                    "--class",
                    ANALYZE_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(ANALYZE_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(ANALYZE_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(ANALYZE_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };

    let executor = match NativeToolExecutor::from_defaults() {
        Ok(executor) => executor,
        Err(error) => {
            write_stderr(&format!("Analysis error: {error}\n"));
            return Ok(ExitCode::InfrastructureFailure);
        }
    };
    let options = AnalyzeOptions {
        workspace_root: workspace_root.to_path_buf(),
        jadx,
        apktool,
        smali,
        classes,
    };

    match analysis::analyze_artifact(
        Path::new(&artifact),
        &options,
        &executor,
        &LiveArtifactInspector,
    ) {
        Ok(report) => {
            write_stdout(&report.render())?;
            Ok(ExitCode::Success)
        }
        Err(error) => match error {
            Error::InvalidArtifact(message) => {
                write_stderr(&format!("Inspection error: {message}\n"));
                Ok(ExitCode::InvalidArtifact)
            }
            Error::Usage(message) if message.starts_with("Artifact not found") => {
                write_stderr(&format!("Inspection error: {message}\n"));
                Ok(ExitCode::UsageOrToolError)
            }
            Error::Usage(message) => {
                write_stderr(&format!("Analysis error: {message}\n"));
                Ok(ExitCode::UsageOrToolError)
            }
            other => {
                write_stderr(&format!("Analysis error: {other}\n"));
                Ok(ExitCode::InfrastructureFailure)
            }
        },
    }
}

fn run_validate_smali(args: &[String]) -> Result<ExitCode, Error> {
    let mut snippet: Option<String> = None;
    let mut locals: Option<usize> = None;
    let mut params: Option<usize> = None;
    let mut descriptor: Option<String> = None;
    let mut is_static = false;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(VALIDATE_SMALI_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--snippet" => {
                snippet = Some(require_value(
                    args,
                    index,
                    "--snippet",
                    VALIDATE_SMALI_HELP,
                )?);
                index += 2;
            }
            _ if arg.starts_with("--snippet=") => {
                snippet = Some(non_empty_value(
                    &arg["--snippet=".len()..],
                    "--snippet",
                    VALIDATE_SMALI_HELP,
                )?);
                index += 1;
            }
            "--locals" => {
                let value = require_value(args, index, "--locals", VALIDATE_SMALI_HELP)?;
                locals = Some(parse_non_negative_int(&value)?);
                index += 2;
            }
            _ if arg.starts_with("--locals=") => {
                locals = Some(parse_non_negative_int(&arg["--locals=".len()..])?);
                index += 1;
            }
            "--params" => {
                let value = require_value(args, index, "--params", VALIDATE_SMALI_HELP)?;
                params = Some(parse_non_negative_int(&value)?);
                index += 2;
            }
            _ if arg.starts_with("--params=") => {
                params = Some(parse_non_negative_int(&arg["--params=".len()..])?);
                index += 1;
            }
            "--descriptor" => {
                descriptor = Some(require_value(
                    args,
                    index,
                    "--descriptor",
                    VALIDATE_SMALI_HELP,
                )?);
                index += 2;
            }
            _ if arg.starts_with("--descriptor=") => {
                descriptor = Some(non_empty_value(
                    &arg["--descriptor=".len()..],
                    "--descriptor",
                    VALIDATE_SMALI_HELP,
                )?);
                index += 1;
            }
            "--is-static" => {
                is_static = true;
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(VALIDATE_SMALI_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(VALIDATE_SMALI_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(snippet) = snippet else {
        write_stderr(VALIDATE_SMALI_HELP);
        return Err(Error::usage(
            "the following arguments are required: --snippet",
        ));
    };
    let Some(locals) = locals else {
        write_stderr(VALIDATE_SMALI_HELP);
        return Err(Error::usage(
            "the following arguments are required: --locals",
        ));
    };

    let mut report = match smali::validate_smali_snippet(
        &snippet,
        locals,
        params,
        is_static,
        descriptor.as_deref(),
    ) {
        Ok(report) => report,
        Err(error) => {
            write_stderr(&format!("Smali validation error: {error}\n"));
            return Ok(error.exit_code());
        }
    };

    if report.is_valid() {
        let executor = match NativeToolExecutor::from_defaults() {
            Ok(executor) => executor,
            Err(error) => {
                write_stderr(&format!("Smali validation error: {error}\n"));
                return Ok(ExitCode::InfrastructureFailure);
            }
        };
        if executor.is_available(ToolKind::Smali) {
            if let Err(error) = run_smali_assembler(&mut report, &executor) {
                write_stderr(&format!("Smali validation error: {error}\n"));
                return Ok(ExitCode::InfrastructureFailure);
            }
        }
    }

    write_stdout(&format!("{}\n", report.format_human()))?;
    Ok(if report.is_valid() {
        ExitCode::Success
    } else {
        ExitCode::UsageOrToolError
    })
}

fn run_smali_assembler(
    report: &mut smali::SmaliValidationReport,
    executor: &NativeToolExecutor,
) -> Result<(), Error> {
    let temp = tempfile::TempDir::new()
        .map_err(|error| Error::io("create Smali validation directory", error))?;
    let source_path = temp.path().join("Synthetic.smali");
    let dex_path = temp.path().join("classes.dex");
    let command = SmaliAssemblerCommand::new(
        &report.snippet,
        report.locals_count,
        &report.parameter_types,
        report.is_static,
        &source_path,
        &dex_path,
    );
    fs::write(&source_path, &command.source)
        .map_err(|error| Error::io(format!("write {}", source_path.display()), error))?;
    let result = executor.execute(ToolKind::Smali, &command.args)?;
    if result.exit_code != Some(0) {
        report.diagnostics.extend(command.diagnostics(
            &result.stderr,
            &result.stdout,
            result.exit_code,
        ));
    }
    Ok(())
}

fn open_zip(path: &Path) -> Result<ZipArchive<fs::File>, Error> {
    let file = fs::File::open(path)
        .map_err(|error| Error::io(format!("open {}", path.display()), error))?;
    ZipArchive::new(file)
        .map_err(|error| Error::infrastructure(format!("cannot read {}: {error}", path.display())))
}

fn zip_member_names<R: Read + io::Seek>(archive: &mut ZipArchive<R>) -> Result<Vec<String>, Error> {
    let mut names = Vec::with_capacity(archive.len());
    for index in 0..archive.len() {
        let entry = archive.by_index(index).map_err(|error| {
            Error::invalid_artifact(format!("cannot read archive member: {error}"))
        })?;
        let name = entry
            .name()
            .map_err(|error| {
                Error::invalid_artifact(format!("cannot read archive member name: {error}"))
            })?
            .into_owned();
        names.push(name);
    }
    Ok(names)
}

fn read_zip_member<R: Read + io::Seek>(
    archive: &mut ZipArchive<R>,
    name: &str,
) -> Result<Vec<u8>, Error> {
    let mut entry = archive
        .by_name(name)
        .map_err(|error| Error::invalid_artifact(format!("cannot read {name}: {error}")))?;
    let mut bytes = Vec::new();
    entry
        .read_to_end(&mut bytes)
        .map_err(|error| Error::io(format!("read {name}"), error))?;
    Ok(bytes)
}

fn write_python_json_unsorted<T: Serialize>(
    value: &T,
    target: &JsonTarget,
    create_parent: bool,
) -> Result<(), Error> {
    let text = serde_json::to_string_pretty(value)
        .map_err(|error| Error::runtime(format!("cannot serialize JSON: {error}")))?;
    let escaped = escape_non_ascii(&text);
    match target {
        JsonTarget::Stdout => {
            let mut stdout = io::stdout().lock();
            stdout
                .write_all(escaped.as_bytes())
                .and_then(|()| stdout.write_all(b"\n"))
                .and_then(|()| stdout.flush())
                .map_err(|error| Error::io("failed to write JSON to stdout", error))
        }
        JsonTarget::File(path) => {
            if create_parent {
                if let Some(parent) = path.parent() {
                    if !parent.as_os_str().is_empty() {
                        fs::create_dir_all(parent).map_err(|error| {
                            Error::io(
                                format!("cannot create directory '{}'", parent.display()),
                                error,
                            )
                        })?;
                    }
                }
            }
            fs::write(path, escaped.as_bytes()).map_err(|error| {
                Error::io(
                    format!("cannot write JSON file '{}'", path.display()),
                    error,
                )
            })
        }
    }
}

const NO_MPP_MESSAGE: &str =
    "No compiled .mpp found in patches/build/libs/. Run ./gradlew :patches:buildAndroid first.";

/// Production [`PatchEngine`]: applies a resolved selection set through the
/// pinned Morphe tool and verifies the output exactly like the Python oracle.
struct NativePatchEngine {
    morphe: MorpheTool,
    patches_list: Value,
    dex: DexDump,
}

impl NativePatchEngine {
    fn discover() -> Result<Self, Error> {
        let manager = ToolManager::with_defaults().map_err(Error::from)?;
        let environment = ToolEnvironment::from_process(&tools::default_repo_root());
        let morphe = MorpheTool::pinned(&manager, environment.find_java())?;
        let patches_list =
            morphe::load_patches_list(tools::default_repo_root().join("patches-list.json"))?;
        let dex = DexDump::from_environment(&environment);
        Ok(Self {
            morphe,
            patches_list,
            dex,
        })
    }
}

impl PatchEngine for NativePatchEngine {
    fn apply(&self, request: &PatchBuildRequest<'_>) -> Result<Vec<String>, Error> {
        let input = inspection::inspect_artifact(request.artifact)?;
        if input.package_name != request.package_name {
            return Err(Error::usage(format!(
                "Artifact package '{}' does not match expected '{}'",
                input.package_name, request.package_name
            )));
        }

        let selections = morphe::resolve_patch_selections(
            request.package_name,
            Some(request.enabled_patches),
            request.all_defaults,
            Some(request.raw_options),
            &self.patches_list,
        )?;
        if selections.is_empty() {
            return Err(Error::usage(format!(
                "No compatible patches selected for package '{}'. Use --all or specify valid -e patches.",
                request.package_name
            )));
        }

        fs::create_dir_all(request.scratch_dir).map_err(|error| {
            Error::io(
                format!("create scratch {}", request.scratch_dir.display()),
                error,
            )
        })?;
        let result_json = request.scratch_dir.join("result.json");
        let paths = PatchCommandPaths::new(
            request.mpp,
            request.artifact,
            request.output_apk,
            &result_json,
            request.scratch_dir,
        );
        let arguments = morphe::build_morphe_patch_set_cmd(&selections, &paths);
        let spec = ProcessSpec::new(self.morphe.program.clone())
            .args(self.morphe.prefix_args.iter().cloned())
            .args(arguments)
            .cwd(request.scratch_dir);
        let output = process::run(&spec)?;

        if !result_json.is_file() {
            let detail = if output.stderr.bytes.is_empty() {
                output.stdout.text_lossy()
            } else {
                output.stderr.text_lossy()
            };
            return Err(Error::infrastructure(format!(
                "Morphe result.json was not generated (exit code {}): {}",
                output.status.code().unwrap_or(-1),
                truncate_chars(&detail, 500)
            )));
        }

        let text = fs::read_to_string(&result_json).map_err(|error| {
            Error::infrastructure(format!("Corrupt Morphe result JSON: {error}"))
        })?;
        let data: Value = serde_json::from_str(&text).map_err(|error| {
            Error::infrastructure(format!("Corrupt Morphe result JSON: {error}"))
        })?;

        let failed: Vec<String> = data
            .get("failedPatches")
            .and_then(Value::as_array)
            .map(|patches| {
                patches
                    .iter()
                    .map(|patch| {
                        format!(
                            "{}: {}",
                            patch.get("name").and_then(Value::as_str).unwrap_or(""),
                            patch.get("reason").and_then(Value::as_str).unwrap_or("")
                        )
                    })
                    .collect()
            })
            .unwrap_or_default();
        if !output.status.success() || !failed.is_empty() {
            let detail = if failed.is_empty() {
                truncate_chars(&output.stderr.text_lossy(), 300)
            } else {
                failed.join("; ")
            };
            return Err(Error::infrastructure(format!(
                "Morphe patching failed: {detail}"
            )));
        }

        let applied: Vec<String> = data
            .get("appliedPatches")
            .and_then(Value::as_array)
            .map(|patches| {
                patches
                    .iter()
                    .filter_map(|patch| patch.get("name").and_then(Value::as_str))
                    .map(str::to_string)
                    .collect()
            })
            .unwrap_or_default();
        for selection in &selections {
            if !applied
                .iter()
                .any(|name| name == &selection.definition.name)
            {
                return Err(Error::infrastructure(format!(
                    "Patch '{}' was not reported in applied patches: {}",
                    selection.definition.name,
                    python_string_list(&applied)
                )));
            }
        }

        if !request.output_apk.is_file() {
            return Err(Error::infrastructure(
                "Morphe reported success but output APK was not created",
            ));
        }
        let output_inspection = inspection::inspect_artifact(request.output_apk)?;
        if output_inspection.package_name != request.package_name {
            return Err(Error::infrastructure(format!(
                "Patched output package '{}' does not match expected '{}'",
                output_inspection.package_name, request.package_name
            )));
        }
        if output_inspection.version_code != input.version_code {
            return Err(Error::infrastructure(format!(
                "Patched output version code '{}' does not match input '{}'",
                output_inspection.version_code, input.version_code
            )));
        }
        self.dex.verify(request.output_apk).map_err(|error| {
            Error::infrastructure(format!("Patched APK DEX verification failed: {error}"))
        })?;

        Ok(applied)
    }
}

fn truncate_chars(text: &str, limit: usize) -> String {
    let mut truncated: String = text.chars().take(limit).collect();
    if text.chars().count() > limit {
        truncated.push_str("...");
    }
    truncated
}

fn python_string_list(items: &[String]) -> String {
    let quoted: Vec<String> = items
        .iter()
        .map(|item| format!("'{}'", item.replace('\\', "\\\\").replace('\'', "\\'")))
        .collect();
    format!("[{}]", quoted.join(", "))
}

fn python_string_repr(text: &str) -> String {
    let mut escaped = String::with_capacity(text.len() + 2);
    escaped.push('\'');
    for character in text.chars() {
        match character {
            '\\' => escaped.push_str("\\\\"),
            '\'' => escaped.push_str("\\'"),
            '\n' => escaped.push_str("\\n"),
            '\r' => escaped.push_str("\\r"),
            '\t' => escaped.push_str("\\t"),
            other => escaped.push(other),
        }
    }
    escaped.push('\'');
    escaped
}

fn python_value_repr(value: &Value) -> String {
    match value {
        Value::Null => "None".to_string(),
        Value::Bool(flag) => {
            if *flag {
                "True".to_string()
            } else {
                "False".to_string()
            }
        }
        Value::Number(number) => number.to_string(),
        Value::String(text) => python_string_repr(text),
        other => other.to_string(),
    }
}

fn python_options_repr(options: &morphe::PatchOptions) -> String {
    let entries: Vec<String> = options
        .iter()
        .map(|(key, value)| format!("{}: {}", python_string_repr(key), python_value_repr(value)))
        .collect();
    format!("{{{}}}", entries.join(", "))
}

fn python_float(value: f64) -> String {
    if value.is_finite() && value.fract() == 0.0 {
        format!("{value:.1}")
    } else {
        format!("{value}")
    }
}

fn format_check_report(report: &morphe::PatchCompatibilityReport) -> String {
    let separator = "=".repeat(60);
    let mut text = String::new();
    text.push_str(&separator);
    text.push('\n');
    text.push_str(&format!(
        "PATCH COMPATIBILITY CHECK: {}\n",
        report.package_name
    ));
    text.push_str(&separator);
    text.push('\n');
    text.push_str(&format!(
        "Version:       {} ({})\n",
        report.version_name, report.version_code
    ));
    text.push_str(&format!(
        "Artifact SHA:  {}...\n",
        report.artifact_sha256.chars().take(16).collect::<String>()
    ));
    text.push_str(&format!(
        "Patch Bundle:  {} (rev: {})\n",
        report.patch_bundle_version,
        report.git_revision.chars().take(8).collect::<String>()
    ));
    text.push_str(&format!(
        "Results:       {}/{} passed\n",
        report.passed_cases, report.total_cases
    ));
    text.push_str(&format!("{}\n", "-".repeat(60)));
    for test_case in &report.test_cases {
        let status = if test_case.success {
            "[PASS]"
        } else {
            "[FAIL]"
        };
        let options = if test_case.options.is_empty() {
            String::new()
        } else {
            format!(" (opts: {})", python_options_repr(&test_case.options))
        };
        let injected = if test_case.injected_classes.is_empty() {
            String::new()
        } else {
            format!(" [injected: {} classes]", test_case.injected_classes.len())
        };
        let duration = format!(" ({})", python_float(test_case.duration_seconds));
        text.push_str(&format!(
            "  {status} {}{options}{injected}{duration}\n",
            test_case.patch_name
        ));
        if !test_case.success {
            if let Some(reason) = &test_case.error_message {
                text.push_str(&format!("         Reason: {reason}\n"));
            }
        }
    }
    text.push_str(&separator);
    text.push('\n');
    text.push_str(&format!(
        "Overall Status: {}\n",
        report.overall_status.to_uppercase()
    ));
    text
}

fn resolve_default_check_bundle() -> Result<PathBuf, Error> {
    let cwd = std::env::current_dir().map_err(|error| Error::io("current directory", error))?;
    let repo_root = deployment::find_repo_root(&cwd).map_err(|_| Error::usage(NO_MPP_MESSAGE))?;
    let libs_dir = repo_root.join("patches").join("build").join("libs");
    if !libs_dir.is_dir() {
        return Err(Error::usage(NO_MPP_MESSAGE));
    }
    deployment::newest_bundle(&libs_dir).map_err(|_| Error::usage(NO_MPP_MESSAGE))
}

fn git_revision() -> Option<String> {
    let spec = ProcessSpec::new("git").args(["rev-parse".to_string(), "HEAD".to_string()]);
    match process::run(&spec) {
        Ok(output) if output.status.success() => {
            let revision = output.stdout.text_lossy().trim().to_string();
            (!revision.is_empty()).then_some(revision)
        }
        _ => None,
    }
}

fn collect_tool_versions() -> ToolVersions {
    let mut versions = ToolVersions::new();
    if let Ok(manager) = ToolManager::with_defaults() {
        for name in ["morphe", "jadx", "apktool", "baksmali"] {
            if let Ok(spec) = manager.spec(name) {
                versions.insert(name, spec.version.clone());
            }
        }
    }
    versions
}

fn run_check(args: &[String], workspace_root: &Path) -> Result<ExitCode, Error> {
    let mut artifact: Option<String> = None;
    let mut mpp: Option<PathBuf> = None;
    let mut package: Option<String> = None;
    let mut all = false;
    let mut patches: Vec<String> = Vec::new();
    let mut force = false;
    let mut keep_workspace = false;
    let mut json_target: Option<JsonTarget> = None;
    let mut jobs: Option<usize> = None;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(CHECK_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--mpp" => {
                mpp = Some(PathBuf::from(require_value(
                    args, index, "--mpp", CHECK_HELP,
                )?));
                index += 2;
            }
            _ if arg.starts_with("--mpp=") => {
                mpp = Some(PathBuf::from(non_empty_value(
                    &arg["--mpp=".len()..],
                    "--mpp",
                    CHECK_HELP,
                )?));
                index += 1;
            }
            "--package" => {
                package = Some(require_value(args, index, "--package", CHECK_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    CHECK_HELP,
                )?);
                index += 1;
            }
            "--all" => {
                all = true;
                index += 1;
            }
            "--patch" => {
                patches.push(require_value(args, index, "--patch", CHECK_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--patch=") => {
                patches.push(non_empty_value(
                    &arg["--patch=".len()..],
                    "--patch",
                    CHECK_HELP,
                )?);
                index += 1;
            }
            "--force" => {
                force = true;
                index += 1;
            }
            "--keep-workspace" => {
                keep_workspace = true;
                index += 1;
            }
            _ if arg == "--json" || arg.starts_with("--json=") => {
                index = parse_json_occurrence(args, index, &mut json_target, CHECK_HELP)?;
            }
            "-j" | "--jobs" => {
                let value = require_value(args, index, "--jobs", CHECK_HELP)?;
                jobs = Some(parse_jobs(&value)?);
                index += 2;
            }
            _ if arg.starts_with("--jobs=") => {
                jobs = Some(parse_jobs(&arg["--jobs=".len()..])?);
                index += 1;
            }
            _ if arg.starts_with("-j") && arg.len() > 2 => {
                jobs = Some(parse_jobs(&arg[2..])?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(CHECK_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ if artifact.is_none() => {
                artifact = Some(arg.to_string());
                index += 1;
            }
            _ => {
                write_stderr(CHECK_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let Some(artifact) = artifact else {
        write_stderr(CHECK_HELP);
        return Err(Error::usage(
            "the following arguments are required: artifact",
        ));
    };

    let result = (|| -> Result<(morphe::PatchCompatibilityReport, ExitCode), Error> {
        let mpp = match mpp {
            Some(mpp) => mpp,
            None => resolve_default_check_bundle()?,
        };
        let mut options = CheckOptions::new(&artifact, &mpp);
        options.expected_package = package;
        options.requested_patches = patches;
        options.all_patches = all;
        options.force = force;
        options.keep_workspace = keep_workspace;
        options.workspace_root = workspace_root.to_path_buf();
        options.jobs = jobs;
        options.tool_versions = collect_tool_versions();
        options.git_revision = git_revision();
        options.patches_list_path = Some(tools::default_repo_root().join("patches-list.json"));
        let runner = CheckRunner::native(native_morphe_tool()?);
        runner.run(&options)
    })();

    match result {
        Ok((report, code)) => {
            if let Some(target) = &json_target {
                write_sorted_json(&report, target)?;
            } else {
                write_stdout(&format_check_report(&report))?;
            }
            Ok(code)
        }
        Err(error) => {
            let code = match &error {
                Error::Usage(_) => ExitCode::UsageOrToolError,
                _ => ExitCode::InfrastructureFailure,
            };
            let label = if code == ExitCode::UsageOrToolError {
                "Check error"
            } else {
                "Check unexpected error"
            };
            write_stderr(&format!("{label}: {}\n", error.message()));
            Ok(code)
        }
    }
}

fn parse_jobs(value: &str) -> Result<usize, Error> {
    let parsed: i64 = value
        .parse()
        .map_err(|_| Error::usage(format!("argument -j/--jobs: invalid int value: '{value}'")))?;
    Ok(usize::try_from(parsed.max(1)).unwrap_or(1))
}

fn native_morphe_tool() -> Result<MorpheTool, Error> {
    let manager = ToolManager::with_defaults().map_err(Error::from)?;
    let environment = ToolEnvironment::from_process(&tools::default_repo_root());
    MorpheTool::pinned(&manager, environment.find_java())
}

fn run_deploy_command(args: &[String]) -> Result<ExitCode, Error> {
    if args.iter().any(|arg| arg == "-h" || arg == "--help") {
        write_stdout(DEPLOY_HELP)?;
        return Ok(ExitCode::Success);
    }
    let parsed = deployment::parse_deploy_args(args).inspect_err(|_| {
        write_stderr(DEPLOY_HELP);
    })?;
    if parsed.mpp.is_none() && !parsed.build {
        write_stderr("Deployment error: Either --mpp or --build must be specified\n");
        return Ok(ExitCode::UsageOrToolError);
    }

    match run_deploy_native(args) {
        Ok(result) => {
            write_stdout(&format!("{}\n", result.format_human()))?;
            Ok(ExitCode::Success)
        }
        Err(error) => {
            write_stderr(&format!("Deployment error: {}\n", error.message()));
            Ok(deploy_error_code(&error))
        }
    }
}

fn run_deploy_native(args: &[String]) -> Result<deployment::DeployResult, Error> {
    let tools = DeploymentTools::discover()?;
    let engine = NativePatchEngine::discover()?;
    deployment::run_deploy(args, &tools, &engine)
}

fn deploy_error_code(error: &Error) -> ExitCode {
    match error {
        Error::Usage(_) => ExitCode::UsageOrToolError,
        _ => ExitCode::InfrastructureFailure,
    }
}

fn run_dev_command(args: &[String]) -> Result<ExitCode, Error> {
    if args.iter().any(|arg| arg == "-h" || arg == "--help") {
        write_stdout(DEV_HELP)?;
        return Ok(ExitCode::Success);
    }
    deployment::parse_dev_args(args).inspect_err(|_| {
        write_stderr(DEV_HELP);
    })?;

    let cwd = std::env::current_dir().map_err(|error| Error::io("current directory", error))?;
    let home = std::env::var_os("HOME")
        .map(PathBuf::from)
        .unwrap_or_else(|| cwd.clone());
    match run_dev_native(args, &cwd, &home) {
        Ok(result) => {
            write_stdout(&format!("{}\n", result.format_human()))?;
            Ok(ExitCode::Success)
        }
        Err(error) => {
            write_stderr(&format!("Dev iteration error: {}\n", error.message()));
            Ok(deploy_error_code(&error))
        }
    }
}

fn run_dev_native(
    args: &[String],
    cwd: &Path,
    home: &Path,
) -> Result<deployment::DeployResult, Error> {
    let command = deployment::parse_dev_args(args)?;
    let repo_root = deployment::find_repo_root(cwd)?;
    write_stdout(&format!("Repository root: {}\n", repo_root.display()))?;

    let bundle = if command.no_build {
        let libs_dir = repo_root.join("patches").join("build").join("libs");
        if !libs_dir.is_dir() {
            return Err(Error::infrastructure(format!(
                "No .mpp bundle found in {}",
                libs_dir.display()
            )));
        }
        let bundle = deployment::newest_bundle(&libs_dir)?;
        write_stdout(&format!("Using existing bundle: {}\n", bundle.display()))?;
        bundle
    } else {
        write_stdout("Building patch bundle via Gradle...\n")?;
        let bundle = deployment::build_patch_bundle(&repo_root)?;
        write_stdout(&format!("Built bundle: {}\n", bundle.display()))?;
        bundle
    };

    let artifact = deployment::resolve_dev_artifact(
        command.artifact.as_deref(),
        command.app.as_deref(),
        &repo_root,
        home,
    )?;
    write_stdout(&format!("Found artifact: {}\n", artifact.display()))?;
    let inspection = inspection::inspect_artifact(&artifact)?;
    let package_name = inspection.package_name.clone();
    write_stdout(&format!("Resolved package: {package_name}\n"))?;

    let tools = DeploymentTools::discover()?;
    let engine = NativePatchEngine::discover()?;
    let options = deployment::DeployOptions {
        artifact,
        mpp: Some(bundle),
        build: false,
        repo_start: repo_root,
        package_name,
        all_defaults: command.all,
        enabled_patches: Vec::new(),
        raw_options: Vec::new(),
        device_serial: command.device,
        launch: command.launch,
        clean_install: command.clean_install,
        out_apk: None,
        keystore: None,
        ks_alias: None,
        ks_pass: None,
        key_pass: None,
    };
    deployment::deploy_artifact(&options, &tools, &engine)
}

fn parse_non_negative_float(value: &str) -> Result<f64, Error> {
    let parsed: f64 = value
        .parse()
        .map_err(|_| Error::usage(format!("Invalid float value: {value}")))?;
    if parsed < 0.0 {
        return Err(Error::usage(format!(
            "Stale age must be non-negative, got {value}"
        )));
    }
    Ok(parsed)
}

/// Python accepts any float, and `nan`/`inf`/overflowing deadlines simply
/// never elapse. `None` represents "no deadline" in the native monitor.
fn monitor_timeout(value: &str) -> Result<Option<Duration>, Error> {
    let seconds = parse_non_negative_float(value)?;
    Ok(Duration::try_from_secs_f64(seconds).ok())
}

fn run_monitor_command(args: &[String]) -> Result<ExitCode, Error> {
    if args.iter().any(|arg| arg == "-h" || arg == "--help") {
        write_stdout(MONITOR_HELP)?;
        return Ok(ExitCode::Success);
    }
    let mut package: Option<String> = None;
    let mut device: Option<String> = None;
    let mut timeout: Option<Duration> = None;
    let mut dump_threads = false;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "--package" => {
                package = Some(require_value(args, index, "--package", MONITOR_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    MONITOR_HELP,
                )?);
                index += 1;
            }
            "--device" => {
                device = Some(require_value(args, index, "--device", MONITOR_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--device=") => {
                device = Some(non_empty_value(
                    &arg["--device=".len()..],
                    "--device",
                    MONITOR_HELP,
                )?);
                index += 1;
            }
            "--timeout" => {
                let value = require_value(args, index, "--timeout", MONITOR_HELP)?;
                timeout = monitor_timeout(&value)?;
                index += 2;
            }
            _ if arg.starts_with("--timeout=") => {
                timeout = monitor_timeout(&arg["--timeout=".len()..])?;
                index += 1;
            }
            "--dump-threads" => {
                dump_threads = true;
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(MONITOR_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(MONITOR_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }
    let Some(package) = package else {
        write_stderr(MONITOR_HELP);
        return Err(Error::usage(
            "the following arguments are required: --package",
        ));
    };

    let adb = match AdbClient::new() {
        Ok(adb) => adb,
        Err(error) => {
            write_stderr(&format!("Monitor error: {}\n", error.message()));
            return Ok(monitor_error_code(&error));
        }
    };
    let serial = match device::resolve_device(&adb, device.as_deref()) {
        Ok(serial) => serial,
        Err(error) => {
            write_stderr(&format!("Monitor error: {}\n", error.message()));
            return Ok(monitor_error_code(&error));
        }
    };
    let mut request = device::MonitorRequest::new(package);
    request.serial = Some(serial);
    request.timeout = timeout;
    request.dump_threads = dump_threads;
    let outcome = device::monitor_application(&adb, &RealClock::default(), &request);
    for message in &outcome.messages {
        match message.stream {
            MonitorStream::Stdout => write_stdout(&format!("{}\n", message.text))?,
            MonitorStream::Stderr => write_stderr(&format!("{}\n", message.text)),
        }
    }
    Ok(outcome.exit_code)
}

fn monitor_error_code(error: &Error) -> ExitCode {
    match error {
        Error::Usage(_) => ExitCode::UsageOrToolError,
        _ => ExitCode::InfrastructureFailure,
    }
}

fn run_crash_trace(args: &[String], workspace_root: &Path) -> Result<ExitCode, Error> {
    if args.iter().any(|arg| arg == "-h" || arg == "--help") {
        write_stdout(CRASH_TRACE_HELP)?;
        return Ok(ExitCode::Success);
    }
    let mut package: Option<String> = None;
    let mut device: Option<String> = None;
    let mut lines: usize = 5000;
    let mut json = false;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "--package" => {
                package = Some(require_value(args, index, "--package", CRASH_TRACE_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    CRASH_TRACE_HELP,
                )?);
                index += 1;
            }
            "--device" => {
                device = Some(require_value(args, index, "--device", CRASH_TRACE_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--device=") => {
                device = Some(non_empty_value(
                    &arg["--device=".len()..],
                    "--device",
                    CRASH_TRACE_HELP,
                )?);
                index += 1;
            }
            "--lines" => {
                let value = require_value(args, index, "--lines", CRASH_TRACE_HELP)?;
                lines = parse_non_negative_int(&value)?;
                index += 2;
            }
            _ if arg.starts_with("--lines=") => {
                lines = parse_non_negative_int(&arg["--lines=".len()..])?;
                index += 1;
            }
            "--json" => {
                json = true;
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(CRASH_TRACE_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(CRASH_TRACE_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }
    let Some(package) = package else {
        write_stderr(CRASH_TRACE_HELP);
        return Err(Error::usage(
            "the following arguments are required: --package",
        ));
    };

    let reports = match crash_trace_reports(&package, device.as_deref(), lines, workspace_root) {
        Ok(reports) => reports,
        Err(error) => {
            write_stderr(&format!("Crash trace error: {}\n", error.message()));
            return Ok(ExitCode::InfrastructureFailure);
        }
    };

    if json {
        write_python_json_unsorted(&reports, &JsonTarget::Stdout, false)?;
        return Ok(ExitCode::Success);
    }
    if reports.is_empty() {
        write_stdout(&format!(
            "No recent crashes detected for package {package}\n"
        ))?;
        return Ok(ExitCode::Success);
    }

    let mut text = String::new();
    for (index, report) in reports.iter().enumerate() {
        if index > 0 {
            text.push('\n');
        }
        text.push_str(&format!("Process: {}\n", report.process));
        if let Some(pid) = report.pid {
            text.push_str(&format!("PID: {pid}\n"));
        }
        if let Some(timestamp) = &report.timestamp {
            text.push_str(&format!("Timestamp: {timestamp}\n"));
        }
        text.push_str(&format!("Exception: {}\n", report.exception_type));
        text.push_str(&format!("Message: {}\n", report.message));
        if !report.stack_trace.is_empty() {
            text.push_str("Stack trace:\n");
            let frames = report
                .resolved_frames
                .as_deref()
                .filter(|frames| !frames.is_empty());
            if let Some(frames) = frames {
                for frame in frames {
                    text.push_str(&frame.raw_frame);
                    text.push('\n');
                    if let Some(path) = &frame.smali_path {
                        text.push_str(&format!("  -> Smali: {}\n", path.display()));
                    }
                    if let Some(signature) = &frame.method_signature {
                        text.push_str(&format!("  -> Method: {signature}\n"));
                    }
                    if let Some(snippet) = &frame.code_snippet {
                        for line in snippet {
                            text.push_str(&format!("       {line}\n"));
                        }
                    }
                }
            } else {
                text.push_str(&report.stack_trace.join("\n"));
                text.push('\n');
            }
        }
    }
    write_stdout(&text)?;
    Ok(ExitCode::Success)
}

fn crash_trace_reports(
    package: &str,
    device: Option<&str>,
    lines: usize,
    workspace_root: &Path,
) -> Result<Vec<device::CrashReport>, Error> {
    let adb = AdbClient::new()?;
    let mut reports = device::harvest_recent_crashes(&adb, package, device, lines)?;
    if let Some(smali_dir) = find_package_smali_dir(workspace_root, package) {
        reports = reports
            .into_iter()
            .map(|report| device::resolve_crash_report(report, &smali_dir))
            .collect();
    }
    Ok(reports)
}

fn find_package_smali_dir(workspace_root: &Path, package: &str) -> Option<PathBuf> {
    let package_dir = workspace_root.join(package);
    if !package_dir.is_dir() {
        return None;
    }
    let mut smali_dirs = Vec::new();
    collect_smali_dirs(&package_dir, &mut smali_dirs);
    smali_dirs.into_iter().max_by_key(|path| {
        fs::metadata(path)
            .and_then(|metadata| metadata.modified())
            .unwrap_or(std::time::UNIX_EPOCH)
    })
}

fn collect_smali_dirs(directory: &Path, out: &mut Vec<PathBuf>) {
    let Ok(entries) = fs::read_dir(directory) else {
        return;
    };
    for entry in entries.flatten() {
        let path = entry.path();
        let Ok(file_type) = entry.file_type() else {
            continue;
        };
        if !file_type.is_dir() {
            continue;
        }
        if path.file_name().and_then(|name| name.to_str()) == Some("smali") {
            out.push(path.clone());
        }
        collect_smali_dirs(&path, out);
    }
}

fn run_ui(args: &[String]) -> Result<ExitCode, Error> {
    let Some((subcommand, rest)) = args.split_first() else {
        write_stderr(UI_HELP);
        return Err(Error::usage(
            "the following arguments are required: ui command",
        ));
    };
    match subcommand.as_str() {
        "-h" | "--help" => {
            write_stdout(UI_HELP)?;
            Ok(ExitCode::Success)
        }
        "dump" => run_ui_dump(rest),
        "click" => run_ui_click(rest),
        other => {
            write_stderr(UI_HELP);
            Err(Error::usage(format!("unknown ui command '{other}'")))
        }
    }
}

fn run_ui_dump(args: &[String]) -> Result<ExitCode, Error> {
    let mut device: Option<String> = None;
    let mut clickable = false;
    let mut text: Option<String> = None;
    let mut desc: Option<String> = None;
    let mut json = false;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(UI_DUMP_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--device" => {
                device = Some(require_value(args, index, "--device", UI_DUMP_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--device=") => {
                device = Some(non_empty_value(
                    &arg["--device=".len()..],
                    "--device",
                    UI_DUMP_HELP,
                )?);
                index += 1;
            }
            "--clickable" => {
                clickable = true;
                index += 1;
            }
            "--text" => {
                text = Some(require_value(args, index, "--text", UI_DUMP_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--text=") => {
                text = Some(non_empty_value(
                    &arg["--text=".len()..],
                    "--text",
                    UI_DUMP_HELP,
                )?);
                index += 1;
            }
            "--desc" => {
                desc = Some(require_value(args, index, "--desc", UI_DUMP_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--desc=") => {
                desc = Some(non_empty_value(
                    &arg["--desc=".len()..],
                    "--desc",
                    UI_DUMP_HELP,
                )?);
                index += 1;
            }
            "--json" => {
                json = true;
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(UI_DUMP_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(UI_DUMP_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let matched = match dump_ui_nodes(
        device.as_deref(),
        text.as_deref(),
        desc.as_deref(),
        clickable,
    ) {
        Ok(nodes) => nodes,
        Err(error) => {
            write_stderr(&format!(
                "Error dumping UI hierarchy: {}\n",
                error.message()
            ));
            return Ok(ExitCode::UsageOrToolError);
        }
    };

    if json {
        write_python_json_unsorted(&matched, &JsonTarget::Stdout, false)?;
    } else {
        let mut text = String::new();
        for node in &matched {
            let (x, y) = node.center();
            let (left, top, right, bottom) = node.bounds;
            let text_part = if node.text.is_empty() {
                String::new()
            } else {
                format!(" text=\"{}\"", node.text)
            };
            let desc_part = if node.content_desc.is_empty() {
                String::new()
            } else {
                format!(" desc=\"{}\"", node.content_desc)
            };
            let id_part = if node.resource_id.is_empty() {
                String::new()
            } else {
                format!(" id=\"{}\"", node.resource_id)
            };
            let clickable = if node.clickable { " [clickable]" } else { "" };
            text.push_str(&format!(
                "{} center=({x}, {y}) bounds=({left}, {top}, {right}, {bottom}){clickable}{text_part}{desc_part}{id_part}\n",
                node.class_name
            ));
        }
        write_stdout(&text)?;
    }
    Ok(ExitCode::Success)
}

fn dump_ui_nodes(
    device: Option<&str>,
    text: Option<&str>,
    desc: Option<&str>,
    clickable_only: bool,
) -> Result<Vec<device::UiNode>, Error> {
    let adb = AdbClient::new()?;
    let nodes = device::dump_ui_hierarchy(&adb, device)?;
    Ok(device::find_ui_nodes(
        &nodes,
        device::UiFilter {
            text,
            desc,
            resource_id: None,
            clickable_only,
        },
    ))
}

fn run_ui_click(args: &[String]) -> Result<ExitCode, Error> {
    let mut device: Option<String> = None;
    let mut text: Option<String> = None;
    let mut desc: Option<String> = None;
    let mut coords: Option<String> = None;
    let mut index = 0;
    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(UI_CLICK_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--device" => {
                device = Some(require_value(args, index, "--device", UI_CLICK_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--device=") => {
                device = Some(non_empty_value(
                    &arg["--device=".len()..],
                    "--device",
                    UI_CLICK_HELP,
                )?);
                index += 1;
            }
            "--text" => {
                text = Some(require_value(args, index, "--text", UI_CLICK_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--text=") => {
                text = Some(non_empty_value(
                    &arg["--text=".len()..],
                    "--text",
                    UI_CLICK_HELP,
                )?);
                index += 1;
            }
            "--desc" => {
                desc = Some(require_value(args, index, "--desc", UI_CLICK_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--desc=") => {
                desc = Some(non_empty_value(
                    &arg["--desc=".len()..],
                    "--desc",
                    UI_CLICK_HELP,
                )?);
                index += 1;
            }
            "--coords" => {
                coords = Some(require_value(args, index, "--coords", UI_CLICK_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--coords=") => {
                coords = Some(non_empty_value(
                    &arg["--coords=".len()..],
                    "--coords",
                    UI_CLICK_HELP,
                )?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(UI_CLICK_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(UI_CLICK_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    if let Some(coords) = coords {
        let Some((x, y)) = parse_coords(&coords) else {
            write_stderr(&format!(
                "Error: Invalid coords format '{coords}', expected 'X,Y'\n"
            ));
            return Ok(ExitCode::UsageOrToolError);
        };
        let adb = match AdbClient::new() {
            Ok(adb) => adb,
            Err(error) => {
                write_stderr(&format!("Error clicking UI node: {}\n", error.message()));
                return Ok(ExitCode::UsageOrToolError);
            }
        };
        if let Err(error) = device::click_ui_coordinates(&adb, device.as_deref(), x, y) {
            write_stderr(&format!("Error clicking UI node: {}\n", error.message()));
            return Ok(ExitCode::UsageOrToolError);
        }
        write_stdout(&format!("Clicked coordinates: ({x}, {y})\n"))?;
        return Ok(ExitCode::Success);
    }

    if text.is_none() && desc.is_none() {
        write_stderr("Error: Must specify --text, --desc, or --coords for click\n");
        return Ok(ExitCode::UsageOrToolError);
    }

    let matched = match dump_ui_nodes(device.as_deref(), text.as_deref(), desc.as_deref(), false) {
        Ok(nodes) => nodes,
        Err(error) => {
            write_stderr(&format!("Error clicking UI node: {}\n", error.message()));
            return Ok(ExitCode::UsageOrToolError);
        }
    };
    let Some(node) = matched.first() else {
        write_stderr(&format!(
            "Error: No matching UI node found (text='{}', desc='{}')\n",
            text.as_deref().unwrap_or("None"),
            desc.as_deref().unwrap_or("None")
        ));
        return Ok(ExitCode::UsageOrToolError);
    };

    let adb = match AdbClient::new() {
        Ok(adb) => adb,
        Err(error) => {
            write_stderr(&format!("Error clicking UI node: {}\n", error.message()));
            return Ok(ExitCode::UsageOrToolError);
        }
    };
    if let Err(error) = device::click_ui_node(&adb, device.as_deref(), node) {
        write_stderr(&format!("Error clicking UI node: {}\n", error.message()));
        return Ok(ExitCode::UsageOrToolError);
    }
    let (x, y) = node.center();
    write_stdout(&format!(
        "Clicked node at ({x}, {y}): {}\n",
        python_ui_node_repr(node)
    ))?;
    Ok(ExitCode::Success)
}

fn parse_coords(text: &str) -> Option<(i32, i32)> {
    let parts: Vec<&str> = text.split(',').map(str::trim).collect();
    if parts.len() != 2 {
        return None;
    }
    let parse = |part: &str| -> Option<i32> {
        let digits = part.strip_prefix('-').unwrap_or(part);
        if digits.is_empty() || !digits.chars().all(|character| character.is_ascii_digit()) {
            return None;
        }
        part.parse().ok()
    };
    Some((parse(parts[0])?, parse(parts[1])?))
}

fn python_ui_node_repr(node: &device::UiNode) -> String {
    let (left, top, right, bottom) = node.bounds;
    format!(
        "UiNode(text={}, content_desc={}, resource_id={}, class_name={}, clickable={}, bounds=({left}, {top}, {right}, {bottom}))",
        python_string_repr(&node.text),
        python_string_repr(&node.content_desc),
        python_string_repr(&node.resource_id),
        python_string_repr(&node.class_name),
        if node.clickable { "True" } else { "False" }
    )
}

fn run_clean(args: &[String], workspace_root: &Path) -> Result<ExitCode, Error> {
    let mut run: Option<String> = None;
    let mut package: Option<String> = None;
    let mut stale: Option<f64> = None;
    let mut dry_run = false;
    let mut index = 0;

    while index < args.len() {
        let arg = args[index].as_str();
        match arg {
            "-h" | "--help" => {
                write_stdout(CLEAN_HELP)?;
                return Ok(ExitCode::Success);
            }
            "--dry-run" => {
                dry_run = true;
                index += 1;
            }
            "--run" => {
                run = Some(require_value(args, index, "--run", CLEAN_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--run=") => {
                run = Some(non_empty_value(
                    &arg["--run=".len()..],
                    "--run",
                    CLEAN_HELP,
                )?);
                index += 1;
            }
            "--package" => {
                package = Some(require_value(args, index, "--package", CLEAN_HELP)?);
                index += 2;
            }
            _ if arg.starts_with("--package=") => {
                package = Some(non_empty_value(
                    &arg["--package=".len()..],
                    "--package",
                    CLEAN_HELP,
                )?);
                index += 1;
            }
            "--stale" => {
                let value = require_value(args, index, "--stale", CLEAN_HELP)?;
                stale = Some(parse_stale(&value)?);
                index += 2;
            }
            _ if arg.starts_with("--stale=") => {
                stale = Some(parse_stale(&arg["--stale=".len()..])?);
                index += 1;
            }
            _ if arg.starts_with('-') => {
                write_stderr(CLEAN_HELP);
                return Err(Error::usage(format!("unrecognized option '{arg}'")));
            }
            _ => {
                write_stderr(CLEAN_HELP);
                return Err(Error::usage(format!("unexpected argument '{arg}'")));
            }
        }
    }

    let manager = WorkspaceManager::new(workspace_root);
    if let Some(run_path) = &run {
        let action = if dry_run { "Would remove" } else { "Removed" };
        if let Err(error) = manager.clean_run(run_path, dry_run) {
            return workspace_clean_error(&error);
        }
        write_stdout(&format!("{action} run: {run_path}\n"))?;
        return Ok(ExitCode::Success);
    }

    if let Some(package_name) = &package {
        let action = if dry_run { "Would remove" } else { "Removed" };
        match manager.clean_package(package_name, dry_run) {
            Ok(runs) => {
                let mut text = format!("{action} {} runs for package {package_name}\n", runs.len());
                for path in &runs {
                    text.push_str(&format!("  - {}\n", path.display()));
                }
                write_stdout(&text)?;
                Ok(ExitCode::Success)
            }
            Err(error) => workspace_clean_error(&error),
        }
    } else if let Some(days) = stale {
        let action = if dry_run { "Would remove" } else { "Removed" };
        match manager.clean_stale(days, dry_run) {
            Ok(runs) => {
                let mut text = format!(
                    "{action} {} stale runs (older than {:?} days)\n",
                    runs.len(),
                    days
                );
                for path in &runs {
                    text.push_str(&format!("  - {}\n", path.display()));
                }
                write_stdout(&text)?;
                Ok(ExitCode::Success)
            }
            Err(error) => workspace_clean_error(&error),
        }
    } else {
        write_stderr("Error: Specify --run, --package, or --stale\n");
        Ok(ExitCode::UsageOrToolError)
    }
}

fn workspace_clean_error(error: &crate::workspace::WorkspaceError) -> Result<ExitCode, Error> {
    write_stderr(&format!("Workspace error: {error}\n"));
    Ok(ExitCode::UsageOrToolError)
}

fn require_value(args: &[String], index: usize, option: &str, help: &str) -> Result<String, Error> {
    let Some(value) = args.get(index + 1) else {
        write_stderr(help);
        return Err(Error::usage(format!("{option} requires a value")));
    };
    non_empty_value(value, option, help)
}

fn non_empty_value(value: &str, option: &str, help: &str) -> Result<String, Error> {
    if value.is_empty() {
        write_stderr(help);
        return Err(Error::usage(format!("{option} requires a non-empty value")));
    }
    Ok(value.to_string())
}

fn parse_stale(value: &str) -> Result<f64, Error> {
    let days: f64 = value
        .parse()
        .map_err(|_| Error::usage(format!("Invalid float value: {value}")))?;
    if days < 0.0 {
        return Err(Error::usage(format!(
            "Stale age must be non-negative, got {value}"
        )));
    }
    Ok(days)
}

/// Parses one `--json` or `--json=...` occurrence and returns the next index.
fn parse_json_occurrence(
    args: &[String],
    index: usize,
    slot: &mut Option<JsonTarget>,
    help: &str,
) -> Result<usize, Error> {
    let arg = args[index].as_str();
    if arg == "--json" {
        if slot.is_some() {
            write_stderr(help);
            return Err(Error::usage("--json may be specified only once"));
        }
        match args.get(index + 1).map(String::as_str) {
            Some("-") => {
                *slot = Some(JsonTarget::Stdout);
                Ok(index + 2)
            }
            Some(value) if !value.starts_with('-') => {
                if value.is_empty() {
                    write_stderr(help);
                    return Err(Error::usage("--json requires a non-empty file path or '-'"));
                }
                *slot = Some(JsonTarget::File(PathBuf::from(value)));
                Ok(index + 2)
            }
            _ => {
                *slot = Some(JsonTarget::Stdout);
                Ok(index + 1)
            }
        }
    } else {
        if slot.is_some() {
            write_stderr(help);
            return Err(Error::usage("--json may be specified only once"));
        }
        let value = &arg["--json=".len()..];
        if value.is_empty() {
            write_stderr(help);
            return Err(Error::usage("--json requires a non-empty file path or '-'"));
        }
        *slot = Some(if value == "-" {
            JsonTarget::Stdout
        } else {
            JsonTarget::File(PathBuf::from(value))
        });
        Ok(index + 1)
    }
}

fn build_selftest_report() -> SelftestReport {
    let exit_codes_ok = ExitCode::ALL
        .iter()
        .all(|code| ExitCode::from_u8(code.as_u8()) == Some(*code));
    let unknown_exit_rejected = ExitCode::from_u8(6).is_none();

    let envelope_ok = envelope_round_trips();

    SelftestReport {
        checks: vec![
            SelftestCheck {
                name: "exitCodes".to_owned(),
                passed: exit_codes_ok && unknown_exit_rejected,
                detail: "six Python exit classes round-trip; unknown values rejected".to_owned(),
            },
            SelftestCheck {
                name: "models".to_owned(),
                passed: envelope_ok,
                detail: "JSON envelope round-trips with stable renames".to_owned(),
            },
        ],
    }
}

fn envelope_round_trips() -> bool {
    let sample = Envelope::success("selftest", SelftestReport { checks: Vec::new() });
    match serde_json::to_string(&sample) {
        Ok(text) => match serde_json::from_str::<Envelope<SelftestReport>>(&text) {
            Ok(decoded) => decoded == sample,
            Err(_) => false,
        },
        Err(_) => false,
    }
}

fn write_json<T: Serialize>(value: &T, target: &JsonTarget) -> Result<(), Error> {
    let bytes = serde_json::to_vec_pretty(value)
        .map_err(|error| Error::runtime(format!("cannot serialize JSON: {error}")))?;

    match target {
        JsonTarget::Stdout => {
            let mut stdout = io::stdout().lock();
            stdout
                .write_all(&bytes)
                .and_then(|()| stdout.write_all(b"\n"))
                .and_then(|()| stdout.flush())
                .map_err(|error| Error::io("failed to write JSON to stdout", error))
        }
        JsonTarget::File(path) => {
            if let Some(parent) = path.parent() {
                if !parent.as_os_str().is_empty() {
                    fs::create_dir_all(parent).map_err(|error| {
                        Error::io(
                            format!("cannot create directory '{}'", parent.display()),
                            error,
                        )
                    })?;
                }
            }
            fs::write(path, &bytes).map_err(|error| {
                Error::io(
                    format!("cannot write JSON file '{}'", path.display()),
                    error,
                )
            })
        }
    }
}

/// Serializes through `serde_json::Value` so object keys are sorted, matching
/// Python's `json.dumps(..., sort_keys=True)`, then escapes non-ASCII exactly
/// like `ensure_ascii=True` (serde_json always emits raw UTF-8).
fn write_sorted_json<T: Serialize>(value: &T, target: &JsonTarget) -> Result<(), Error> {
    let value = serde_json::to_value(value)
        .map_err(|error| Error::runtime(format!("cannot serialize JSON: {error}")))?;
    let text = serde_json::to_string_pretty(&value)
        .map_err(|error| Error::runtime(format!("cannot serialize JSON: {error}")))?;
    let escaped = escape_non_ascii(&text);
    let bytes = escaped.as_bytes();
    match target {
        JsonTarget::Stdout => {
            let mut stdout = io::stdout().lock();
            stdout
                .write_all(bytes)
                .and_then(|()| stdout.write_all(b"\n"))
                .and_then(|()| stdout.flush())
                .map_err(|error| Error::io("failed to write JSON to stdout", error))
        }
        JsonTarget::File(path) => {
            if let Some(parent) = path.parent() {
                if !parent.as_os_str().is_empty() {
                    fs::create_dir_all(parent).map_err(|error| {
                        Error::io(
                            format!("cannot create directory '{}'", parent.display()),
                            error,
                        )
                    })?;
                }
            }
            fs::write(path, bytes).map_err(|error| {
                Error::io(
                    format!("cannot write JSON file '{}'", path.display()),
                    error,
                )
            })
        }
    }
}

/// Escapes every non-ASCII scalar as a JSON `\uXXXX` sequence, using a
/// surrogate pair above the BMP. Python's JSON encoder does the same whenever
/// `ensure_ascii` is true (the default).
fn escape_non_ascii(text: &str) -> String {
    let mut escaped = String::with_capacity(text.len());
    for character in text.chars() {
        let code = character as u32;
        if code < 0x7f {
            escaped.push(character);
        } else if code <= 0xffff {
            escaped.push_str(&format!("\\u{code:04x}"));
        } else {
            let offset = code - 0x1_0000;
            let high = 0xd800 + (offset >> 10);
            let low = 0xdc00 + (offset & 0x3ff);
            escaped.push_str(&format!("\\u{high:04x}\\u{low:04x}"));
        }
    }
    escaped
}

fn write_stdout(text: &str) -> Result<(), Error> {
    let mut stdout = io::stdout().lock();
    stdout
        .write_all(text.as_bytes())
        .and_then(|()| stdout.flush())
        .map_err(|error| Error::io("failed to write stdout", error))
}

fn write_stderr(text: &str) {
    let mut stderr = io::stderr().lock();
    let _ = stderr.write_all(text.as_bytes());
    let _ = stderr.flush();
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::tools::ToolCheckResult;

    fn args(values: &[&str]) -> Vec<OsString> {
        values.iter().map(OsString::from).collect()
    }

    #[test]
    fn missing_command_is_a_usage_error() {
        let error = run(&[]).expect_err("missing command must fail");
        assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    }

    #[test]
    fn unknown_command_is_a_usage_error() {
        let error = run(&args(&["frobnicate"])).expect_err("unknown command must fail");
        assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    }

    #[test]
    fn duplicate_json_flag_is_a_usage_error() {
        let error = run(&args(&["selftest", "--json", "--json"])).expect_err("duplicate --json");
        assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    }

    #[test]
    fn empty_json_path_is_a_usage_error() {
        let error = run(&args(&["selftest", "--json="])).expect_err("empty --json path");
        assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
    }

    #[test]
    fn non_utf8_arguments_are_a_usage_error() {
        #[cfg(unix)]
        {
            use std::os::unix::ffi::OsStringExt;
            let raw = OsString::from_vec(vec![0xff, 0xfe]);
            let error = run(&[raw]).expect_err("non-UTF-8 argument");
            assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
        }
    }

    #[test]
    fn global_workspace_root_is_parsed_before_the_command() {
        let (root, rest) = split_global_options(&args_strings(&[
            "--workspace-root",
            "space root",
            "clean",
            "--dry-run",
        ]))
        .expect("parse");
        assert_eq!(root, PathBuf::from("space root"));
        assert_eq!(rest, vec!["clean", "--dry-run"]);

        let (root, rest) =
            split_global_options(&args_strings(&["--workspace-root=other", "doctor"]))
                .expect("parse");
        assert_eq!(root, PathBuf::from("other"));
        assert_eq!(rest, vec!["doctor"]);
    }

    fn args_strings(values: &[&str]) -> Vec<String> {
        values.iter().map(|value| (*value).to_string()).collect()
    }

    #[test]
    fn non_ascii_json_escaping_matches_python_ensure_ascii() {
        assert_eq!(escape_non_ascii("plain"), "plain");
        assert_eq!(escape_non_ascii("\u{7f}"), "\\u007f");
        assert_eq!(escape_non_ascii("\u{394}"), "\\u0394");
        assert_eq!(escape_non_ascii("\u{1f600}"), "\\ud83d\\ude00");
        assert_eq!(escape_non_ascii("a\\nb"), "a\\nb");
    }

    #[test]
    fn thousands_format_matches_python() {
        assert_eq!(format_thousands(0), "0");
        assert_eq!(format_thousands(999), "999");
        assert_eq!(format_thousands(1000), "1,000");
        assert_eq!(format_thousands(2147483647), "2,147,483,647");
    }

    #[test]
    fn tool_check_row_names_match_the_wire_contract() {
        let row = ToolCheckResult {
            name: "jadx".into(),
            configured_version: "1.5.6".into(),
            installed: false,
            actual_version: None,
            executable_path: None,
            error: Some("Not installed in cache".into()),
        };
        let value = serde_json::to_value(&row).expect("serialize");
        assert_eq!(value["configuredVersion"], "1.5.6");
        assert_eq!(value["actualVersion"], serde_json::Value::Null);
        assert_eq!(value["error"], "Not installed in cache");
    }
}
