//! AndroidManifest component queries through `aapt2 dump xmltree`.
//!
//! Native port of the retired Python implementation.
//!
//! Parsing mirrors the Python oracle line for line: element depth comes from
//! leading-whitespace character count, attributes only apply while the current
//! element is the component itself (so child `meta-data` cannot overwrite
//! `exported`), and `action` names collect into `intent_actions` only while an
//! intent filter's action element is current.
//!
//! External failures keep distinct classes. A missing `aapt2` (or another
//! spawn-time tool failure) is a usage/tool error; a non-zero dump means the
//! artifact's manifest could not be decoded and is an invalid artifact; host
//! I/O and timeouts are infrastructure failures. Output bytes are decoded
//! lossily and parsed with bounded comparisons, so malformed UTF-8 cannot
//! panic the process.

use crate::archives;
use crate::error::Error;
use crate::inspection::{inspect_artifact_with_options, InspectionOptions, DEFAULT_TOOL_TIMEOUT};
use crate::models::ContainerType;
use crate::process::{self, ProcessSpec};
use crate::tools::find_build_tools_bin;
use regex::Regex;
use serde::{Deserialize, Serialize};
use std::path::Path;
use std::sync::LazyLock;
use std::time::Duration;

const COMPONENT_TAGS: [&str; 4] = ["activity", "service", "receiver", "provider"];
const STDERR_EXCERPT_CHARS: usize = 200;

static ELEMENT_LINE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"^(\s*)E:\s+([a-zA-Z0-9_\-]+)").expect("static element regex is valid")
});

static ANDROID_ATTRIBUTE: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(
        r#"A:\s+http://schemas\.android\.com/apk/res/android:(\w+)[^=]*=(?:"([^"]+)"|([^\s(]+))"#,
    )
    .expect("static attribute regex is valid")
});

/// One manifest component in declaration order.
///
/// Field order matches the Python handler's JSON projection exactly, and
/// `Option` fields serialize as `null` (they are never skipped).
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct ManifestComponent {
    #[serde(rename = "type")]
    pub component_type: String,
    pub name: String,
    pub exported: Option<bool>,
    pub permission: Option<String>,
    pub authorities: Option<String>,
    pub intent_actions: Vec<String>,
}

/// Parses decoded `aapt2 dump xmltree AndroidManifest.xml` output.
#[must_use]
pub fn parse_manifest_xmltree(xmltree_output: &str) -> Vec<ManifestComponent> {
    let mut components = Vec::new();
    let mut current: Option<ManifestComponent> = None;
    let mut current_depth = 0usize;
    let mut current_tag: Option<&str> = None;

    for line in python_splitlines(xmltree_output) {
        if let Some(captures) = ELEMENT_LINE.captures(line) {
            let indentation = captures.get(1).map_or("", |value| value.as_str());
            let depth = indentation.chars().count();
            let tag = captures.get(2).map_or("", |value| value.as_str());

            if current.is_some() && depth <= current_depth {
                if let Some(component) = current.take() {
                    components.push(component);
                }
            }

            if COMPONENT_TAGS.contains(&tag) {
                current = Some(ManifestComponent {
                    component_type: tag.to_string(),
                    name: String::new(),
                    exported: None,
                    permission: None,
                    authorities: None,
                    intent_actions: Vec::new(),
                });
                current_depth = depth;
                current_tag = Some(tag);
            } else {
                current_tag = Some(tag);
            }
            continue;
        }

        let Some(component) = current.as_mut() else {
            continue;
        };
        let trimmed = line.trim();
        let Some(captures) = ANDROID_ATTRIBUTE.captures(trimmed) else {
            continue;
        };
        let attribute_name = captures.get(1).map_or("", |value| value.as_str());
        let attribute_value = captures
            .get(2)
            .or_else(|| captures.get(3))
            .map_or("", |value| value.as_str());

        let is_component_element = current_tag == Some(component.component_type.as_str());
        if attribute_name == "name" {
            if current_tag == Some("action") {
                component.intent_actions.push(attribute_value.to_string());
            } else if is_component_element && component.name.is_empty() {
                component.name = attribute_value.to_string();
            }
        } else if is_component_element {
            match attribute_name {
                "exported" => {
                    component.exported = Some(
                        attribute_value.to_lowercase() == "true" || attribute_value == "0xffffffff",
                    );
                }
                "permission" => component.permission = Some(attribute_value.to_string()),
                "authorities" => component.authorities = Some(attribute_value.to_string()),
                _ => {}
            }
        }
    }

    if let Some(component) = current {
        components.push(component);
    }
    components
}

/// Parses raw xmltree bytes, replacing invalid UTF-8 instead of failing.
#[must_use]
pub fn parse_manifest_xmltree_bytes(xmltree_output: &[u8]) -> Vec<ManifestComponent> {
    parse_manifest_xmltree(&String::from_utf8_lossy(xmltree_output))
}

/// Runs the pinned `aapt2 dump xmltree` for `apk_path` and parses components.
pub fn read_manifest_components(
    apk_path: &Path,
    aapt2: &Path,
    component_type: Option<&str>,
) -> Result<Vec<ManifestComponent>, Error> {
    read_manifest_components_with_timeout(apk_path, aapt2, component_type, DEFAULT_TOOL_TIMEOUT)
}

/// [`read_manifest_components`] with an explicit tool timeout.
pub fn read_manifest_components_with_timeout(
    apk_path: &Path,
    aapt2: &Path,
    component_type: Option<&str>,
    timeout: Duration,
) -> Result<Vec<ManifestComponent>, Error> {
    let spec = ProcessSpec::new(aapt2)
        .args([
            "dump".to_string(),
            "xmltree".to_string(),
            "--file".to_string(),
            "AndroidManifest.xml".to_string(),
            apk_path.to_string_lossy().into_owned(),
        ])
        .timeout(timeout);
    let output = process::run(&spec)?;

    if output.timed_out {
        return Err(Error::infrastructure(format!(
            "aapt2 dump xmltree timed out for {}",
            apk_path.display()
        )));
    }
    if !output.success() {
        let stderr = output.stderr.text_lossy();
        let excerpt: String = stderr.trim().chars().take(STDERR_EXCERPT_CHARS).collect();
        let code = output.exit_code().unwrap_or(-1);
        return Err(Error::invalid_artifact(format!(
            "aapt2 dump xmltree returned code {code} for {}: {excerpt}",
            apk_path.display()
        )));
    }

    let mut components = parse_manifest_xmltree(&output.stdout.text_lossy());
    if let Some(filter) = component_type {
        components.retain(|component| component.component_type == filter);
    }
    Ok(components)
}

/// Inspects an artifact and returns components from its base split.
pub fn inspect_artifact_components(
    artifact_path: impl AsRef<Path>,
    component_type: Option<&str>,
) -> Result<Vec<ManifestComponent>, Error> {
    let options = InspectionOptions::from_process();
    inspect_artifact_components_with_options(artifact_path, component_type, &options)
}

/// [`inspect_artifact_components`] with explicit host/tool inputs.
pub fn inspect_artifact_components_with_options(
    artifact_path: impl AsRef<Path>,
    component_type: Option<&str>,
    options: &InspectionOptions,
) -> Result<Vec<ManifestComponent>, Error> {
    let path = artifact_path.as_ref();
    let inspection = inspect_artifact_with_options(path, options)?;
    let aapt2 = find_build_tools_bin(&options.env, "aapt2")?;
    let materialized = archives::materialize_artifact_apks(
        path,
        &inspection.splits,
        inspection.container_type == ContainerType::Apk,
    )?;
    let apks = materialized.as_slice();

    let base = apks.iter().find(|apk| {
        apk.is_base
            || apk.split_name.contains("base")
            || apk.container_member.as_deref() == Some("base.apk")
            || apks.len() == 1
    });
    let Some(base) = base else {
        return Ok(Vec::new());
    };

    read_manifest_components_with_timeout(&base.path, &aapt2, component_type, options.timeout)
}

/// Python `str.splitlines` boundaries, including the Unicode separators that
/// can appear in tool output.
fn python_splitlines(text: &str) -> Vec<&str> {
    let mut lines = Vec::new();
    let mut start = 0usize;
    let mut chars = text.char_indices().peekable();
    while let Some((index, character)) = chars.next() {
        if !is_line_break(character) {
            continue;
        }
        lines.push(&text[start..index]);
        start = index + character.len_utf8();
        if character == '\r' {
            if let Some(&(next_index, '\n')) = chars.peek() {
                chars.next();
                start = next_index + 1;
            }
        }
    }
    if start < text.len() {
        lines.push(&text[start..]);
    }
    lines
}

fn is_line_break(character: char) -> bool {
    matches!(
        character,
        '\n' | '\r'
            | '\u{0b}'
            | '\u{0c}'
            | '\u{1c}'
            | '\u{1d}'
            | '\u{1e}'
            | '\u{85}'
            | '\u{2028}'
            | '\u{2029}'
    )
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::tools::ToolEnvironment;
    use serde_json::Value;
    use std::fs;
    use std::path::PathBuf;

    const MOCK_XMLTREE: &str = r#"N: android=http://schemas.android.com/apk/res/android (line=2)
  E: manifest (line=2)
    A: package="com.example.testapp" (Raw: "com.example.testapp")
    E: application (line=10)
      E: activity (line=12)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.MainActivity" (Raw: "com.example.testapp.MainActivity")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true
        E: intent-filter (line=15)
          E: action (line=16)
            A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.intent.action.MAIN" (Raw: "android.intent.action.MAIN")
          E: category (line=18)
            A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.intent.category.LAUNCHER" (Raw: "android.intent.category.LAUNCHER")
      E: service (line=22)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.SyncService" (Raw: "com.example.testapp.SyncService")
        A: http://schemas.android.com/apk/res/android:permission(0x01010006)="android.permission.BIND_JOB_SERVICE" (Raw: "android.permission.BIND_JOB_SERVICE")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=false
      E: receiver (line=28)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.BootReceiver" (Raw: "com.example.testapp.BootReceiver")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)="0xffffffff"
        E: intent-filter (line=31)
          E: action (line=32)
            A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.intent.action.BOOT_COMPLETED" (Raw: "android.intent.action.BOOT_COMPLETED")
      E: provider (line=36)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.FileProvider" (Raw: "com.example.testapp.FileProvider")
        A: http://schemas.android.com/apk/res/android:authorities(0x01010018)="com.example.testapp.fileprovider" (Raw: "com.example.testapp.fileprovider")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=false
        A: http://schemas.android.com/apk/res/android:grantUriPermissions(0x0101001b)=true
        E: meta-data (line=41)
          A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.support.FILE_PROVIDER_PATHS" (Raw: "android.support.FILE_PROVIDER_PATHS")
"#;

    #[test]
    fn parses_every_component_in_declaration_order() {
        let components = parse_manifest_xmltree(MOCK_XMLTREE);
        assert_eq!(components.len(), 4);

        assert_eq!(components[0].component_type, "activity");
        assert_eq!(components[0].name, "com.example.testapp.MainActivity");
        assert_eq!(components[0].exported, Some(true));
        assert_eq!(
            components[0].intent_actions,
            vec!["android.intent.action.MAIN"]
        );

        assert_eq!(components[1].component_type, "service");
        assert_eq!(components[1].name, "com.example.testapp.SyncService");
        assert_eq!(components[1].exported, Some(false));
        assert_eq!(
            components[1].permission.as_deref(),
            Some("android.permission.BIND_JOB_SERVICE")
        );
        assert!(components[1].intent_actions.is_empty());

        assert_eq!(components[2].component_type, "receiver");
        assert_eq!(components[2].name, "com.example.testapp.BootReceiver");
        assert_eq!(components[2].exported, Some(true));
        assert_eq!(
            components[2].intent_actions,
            vec!["android.intent.action.BOOT_COMPLETED"]
        );

        assert_eq!(components[3].component_type, "provider");
        assert_eq!(components[3].name, "com.example.testapp.FileProvider");
        assert_eq!(components[3].exported, Some(false));
        assert_eq!(
            components[3].authorities.as_deref(),
            Some("com.example.testapp.fileprovider")
        );
    }

    #[test]
    fn empty_and_activity_alias_manifests_yield_nothing() {
        assert!(parse_manifest_xmltree("").is_empty());
        let alias = r#"N: android=http://schemas.android.com/apk/res/android (line=2)
  E: manifest (line=2)
    E: application (line=10)
      E: activity-alias (line=12)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.AliasActivity" (Raw: "com.example.testapp.AliasActivity")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true
"#;
        assert!(parse_manifest_xmltree(alias).is_empty());
    }

    #[test]
    fn child_metadata_cannot_overwrite_exported() {
        let xml = r#"N: android=http://schemas.android.com/apk/res/android (line=2)
  E: manifest (line=2)
    E: application (line=10)
      E: activity (line=12)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.MainActivity" (Raw: "com.example.testapp.MainActivity")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true
        E: meta-data (line=14)
          A: http://schemas.android.com/apk/res/android:name(0x01010003)="foo" (Raw: "foo")
          A: http://schemas.android.com/apk/res/android:exported(0x01010010)=false
"#;
        let components = parse_manifest_xmltree(xml);
        assert_eq!(components.len(), 1);
        assert_eq!(components[0].name, "com.example.testapp.MainActivity");
        assert_eq!(components[0].exported, Some(true));
    }

    #[test]
    fn queries_action_does_not_leak_into_activity() {
        let xml = r#"N: android=http://schemas.android.com/apk/res/android (line=2)
  E: manifest (line=2)
    E: application (line=10)
      E: activity (line=12)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.MainActivity" (Raw: "com.example.testapp.MainActivity")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true
        E: intent-filter (line=15)
          E: action (line=16)
            A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.intent.action.MAIN" (Raw: "android.intent.action.MAIN")
    E: queries (line=20)
      E: intent (line=21)
        E: action (line=22)
          A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.intent.action.VIEW" (Raw: "android.intent.action.VIEW")
"#;
        let components = parse_manifest_xmltree(xml);
        assert_eq!(components.len(), 1);
        assert_eq!(components[0].name, "com.example.testapp.MainActivity");
        assert_eq!(
            components[0].intent_actions,
            vec!["android.intent.action.MAIN"]
        );
    }

    #[test]
    fn exported_values_follow_python_truth_rules() {
        for (raw, expected) in [
            ("true", true),
            ("TRUE", true),
            ("0xffffffff", true),
            ("false", false),
            ("0x1", false),
            ("1", false),
        ] {
            let xml = format!(
                "  E: activity (line=1)\n    A: http://schemas.android.com/apk/res/android:name(0x1)=\"x\"\n    A: http://schemas.android.com/apk/res/android:exported(0x2)={raw}\n"
            );
            let components = parse_manifest_xmltree(&xml);
            assert_eq!(components.len(), 1, "raw value {raw}");
            assert_eq!(components[0].exported, Some(expected), "raw value {raw}");
        }
    }

    #[test]
    fn invalid_utf8_and_unicode_attributes_are_parsed_lossily() {
        let mut bytes = b"  E: activity (line=1)\n    A: http://schemas.android.com/apk/res/android:name(0x1)=\"caf\xe9."
            .to_vec();
        bytes.extend_from_slice("Main\"\n".as_bytes());
        let components = parse_manifest_xmltree_bytes(&bytes);
        assert_eq!(components.len(), 1);
        assert_eq!(components[0].name, "caf\u{fffd}.Main");

        let unicode = "  E: service (line=1)\n    A: http://schemas.android.com/apk/res/android:name(0x1)=\" ünïcode.Service \"\n";
        let components = parse_manifest_xmltree(unicode);
        assert_eq!(components[0].name, " ünïcode.Service ");
    }

    #[test]
    fn json_projection_uses_python_field_names() {
        let component = ManifestComponent {
            component_type: "activity".to_string(),
            name: "com.example.MainActivity".to_string(),
            exported: Some(true),
            permission: None,
            authorities: None,
            intent_actions: vec!["android.intent.action.MAIN".to_string()],
        };
        let text = serde_json::to_string(&component).expect("serialize component");
        assert_eq!(
            text,
            "{\"type\":\"activity\",\"name\":\"com.example.MainActivity\",\"exported\":true,\"permission\":null,\"authorities\":null,\"intent_actions\":[\"android.intent.action.MAIN\"]}"
        );
        let value: Value = serde_json::from_str(&text).expect("decode component");
        assert_eq!(value["intent_actions"][0], "android.intent.action.MAIN");
        assert!(value["permission"].is_null());
    }

    #[test]
    fn component_type_filter_is_exact() {
        let components = parse_manifest_xmltree(MOCK_XMLTREE);
        let providers: Vec<_> = components
            .into_iter()
            .filter(|component| component.component_type == "provider")
            .collect();
        assert_eq!(providers.len(), 1);
        assert_eq!(providers[0].name, "com.example.testapp.FileProvider");
    }

    #[cfg(unix)]
    fn write_executable(path: &Path, body: &str) {
        use std::os::unix::fs::PermissionsExt;

        fs::write(path, body).expect("write stub tool");
        let mut permissions = fs::metadata(path).expect("stat stub tool").permissions();
        permissions.set_mode(0o755);
        fs::set_permissions(path, permissions).expect("chmod stub tool");
    }

    #[cfg(unix)]
    fn temp_dir() -> (tempfile::TempDir, PathBuf) {
        let directory = tempfile::tempdir().expect("create temp dir");
        let root = fs::canonicalize(directory.path()).expect("canonicalize temp dir");
        (directory, root)
    }

    #[cfg(unix)]
    #[test]
    fn read_components_uses_the_process_adapter_and_filters() {
        let (_guard, root) = temp_dir();
        let tool = root.join("aapt2");
        let escaped = MOCK_XMLTREE.replace('\'', "'\\''");
        write_executable(&tool, &format!("#!/bin/sh\nprintf '%s' '{escaped}'\n"));
        let apk = root.join("mock.apk");
        fs::write(&apk, b"not a real apk").expect("write apk placeholder");

        let components = read_manifest_components(&apk, &tool, None).expect("read components");
        assert_eq!(components.len(), 4);

        let providers =
            read_manifest_components(&apk, &tool, Some("provider")).expect("filter providers");
        assert_eq!(providers.len(), 1);
        assert_eq!(providers[0].component_type, "provider");
    }

    #[cfg(unix)]
    #[test]
    fn missing_tool_is_usage_and_dump_failure_is_invalid_artifact() {
        let (_guard, root) = temp_dir();
        let apk = root.join("mock.apk");
        fs::write(&apk, b"placeholder").expect("write apk placeholder");

        let error = read_manifest_components(&apk, &root.join("missing-aapt2"), None)
            .expect_err("missing tool must fail");
        assert_eq!(
            error.exit_code(),
            crate::models::ExitCode::UsageOrToolError,
            "{error:?}"
        );

        let failing = root.join("aapt2");
        write_executable(
            &failing,
            "#!/bin/sh\necho 'error: bad manifest' >&2\nexit 7\n",
        );
        let error =
            read_manifest_components(&apk, &failing, None).expect_err("non-zero dump must fail");
        assert_eq!(error.exit_code(), crate::models::ExitCode::InvalidArtifact);
        assert!(error.message().contains("returned code 7"));
        assert!(error.message().contains("error: bad manifest"));
    }

    #[cfg(unix)]
    #[test]
    fn malformed_utf8_stdout_is_parsed_without_panicking() {
        let (_guard, root) = temp_dir();
        let apk = root.join("mock.apk");
        fs::write(&apk, b"placeholder").expect("write apk placeholder");
        let tool = root.join("aapt2");
        write_executable(
            &tool,
            "#!/bin/sh\nprintf '  E: activity (line=1)\\n    A: http://schemas.android.com/apk/res/android:name(0x1)=\"caf\\351.Main\"\\n'\n",
        );
        let components = read_manifest_components(&apk, &tool, None).expect("read components");
        assert_eq!(components.len(), 1);
        assert_eq!(components[0].name, "caf\u{fffd}.Main");
    }

    #[cfg(unix)]
    #[test]
    fn inspect_selects_base_split_and_honours_options() {
        let (_guard, root) = temp_dir();
        let bin = root.join("bin");
        fs::create_dir(&bin).expect("create bin dir");

        let badging = "package: name='com.example.testapp' versionCode='1' versionName='1.0'\n";
        let resources = "Package name=com.example.testapp id=7f\n";
        let escaped_badging = badging.replace('\'', "'\\''");
        let escaped_resources = resources.replace('\'', "'\\''");
        let escaped_xmltree = MOCK_XMLTREE.replace('\'', "'\\''");
        write_executable(
            &bin.join("aapt2"),
            &format!(
                "#!/bin/sh\ncase \"$*\" in\n  *badging*) printf '%s' '{escaped_badging}' ;;\n  *resources*) printf '%s' '{escaped_resources}' ;;\n  *xmltree*) printf '%s' '{escaped_xmltree}' ;;\n  *) exit 9 ;;\nesac\n"
            ),
        );
        write_executable(&bin.join("apksigner"), "#!/bin/sh\nexit 1\n");

        let apk = root.join("base.apk");
        write_zip(
            &apk,
            &[
                ("AndroidManifest.xml", b"<manifest/>"),
                ("res/drawable/icon.png", b"icon"),
            ],
        );

        let options = InspectionOptions {
            env: ToolEnvironment {
                path: Some(bin.into_os_string()),
                ..ToolEnvironment::default()
            },
            timeout: DEFAULT_TOOL_TIMEOUT,
        };
        let components = inspect_artifact_components_with_options(&apk, Some("activity"), &options)
            .expect("inspect components");
        assert_eq!(components.len(), 1);
        assert_eq!(components[0].name, "com.example.testapp.MainActivity");
    }

    fn write_zip(path: &Path, members: &[(&str, &[u8])]) {
        use zip::write::SimpleFileOptions;

        let file = fs::File::create(path).expect("create zip");
        let mut writer = zip::ZipWriter::new(file);
        for (name, bytes) in members {
            writer
                .start_file(*name, SimpleFileOptions::default())
                .expect("start zip member");
            use std::io::Write;
            writer.write_all(bytes).expect("write zip member");
        }
        writer.finish().expect("finish zip");
    }
}
