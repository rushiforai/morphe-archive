//! Wire models shared by future native commands.
//!
//! Field names mirror the Python oracle's `to_dict` output exactly. Field
//! declaration order is the serialized order, so it is part of the contract.
//! Deserialization is fallible and never unwraps untrusted JSON.

use serde::de::{self, Deserializer};
use serde::ser::Serializer;
use serde::{Deserialize, Serialize};

/// Python `ExitCode` values. JSON encodes these as bare integers, matching
/// `json.dumps` for an `IntEnum`.
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub enum ExitCode {
    Success = 0,
    CompatibilityFailure = 1,
    UsageOrToolError = 2,
    InvalidArtifact = 3,
    InfrastructureFailure = 4,
    RuntimeFailure = 5,
}

impl ExitCode {
    pub const ALL: [ExitCode; 6] = [
        ExitCode::Success,
        ExitCode::CompatibilityFailure,
        ExitCode::UsageOrToolError,
        ExitCode::InvalidArtifact,
        ExitCode::InfrastructureFailure,
        ExitCode::RuntimeFailure,
    ];

    #[must_use]
    pub const fn as_u8(self) -> u8 {
        self as u8
    }

    #[must_use]
    pub const fn from_u8(value: u8) -> Option<Self> {
        match value {
            0 => Some(ExitCode::Success),
            1 => Some(ExitCode::CompatibilityFailure),
            2 => Some(ExitCode::UsageOrToolError),
            3 => Some(ExitCode::InvalidArtifact),
            4 => Some(ExitCode::InfrastructureFailure),
            5 => Some(ExitCode::RuntimeFailure),
            _ => None,
        }
    }

    #[must_use]
    pub const fn description(self) -> &'static str {
        match self {
            ExitCode::Success => "success",
            ExitCode::CompatibilityFailure => "compatibility failure",
            ExitCode::UsageOrToolError => "usage or tool error",
            ExitCode::InvalidArtifact => "invalid artifact",
            ExitCode::InfrastructureFailure => "infrastructure failure",
            ExitCode::RuntimeFailure => "runtime failure",
        }
    }
}

impl Serialize for ExitCode {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        serializer.serialize_u8(self.as_u8())
    }
}

impl<'de> Deserialize<'de> for ExitCode {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: Deserializer<'de>,
    {
        let raw = u8::deserialize(deserializer)?;
        ExitCode::from_u8(raw).ok_or_else(|| de::Error::custom(format!("unknown exit code {raw}")))
    }
}

/// Terminal classification carried in JSON error envelopes.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum ErrorClass {
    #[serde(rename = "compatibility")]
    Compatibility,
    #[serde(rename = "usage")]
    Usage,
    #[serde(rename = "invalid-artifact")]
    InvalidArtifact,
    #[serde(rename = "infrastructure")]
    Infrastructure,
    #[serde(rename = "runtime")]
    Runtime,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct ErrorReport {
    #[serde(rename = "class")]
    pub class: ErrorClass,
    #[serde(rename = "message")]
    pub message: String,
}

/// Stable JSON envelope for machine-readable command output.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct Envelope<T> {
    #[serde(rename = "schemaVersion")]
    pub schema_version: u32,
    #[serde(rename = "command")]
    pub command: String,
    #[serde(rename = "success")]
    pub success: bool,
    #[serde(rename = "exitCode")]
    pub exit_code: ExitCode,
    #[serde(rename = "error", skip_serializing_if = "Option::is_none")]
    pub error: Option<ErrorReport>,
    #[serde(rename = "data", skip_serializing_if = "Option::is_none")]
    pub data: Option<T>,
}

impl<T> Envelope<T> {
    pub const SCHEMA_VERSION: u32 = 1;

    #[must_use]
    pub fn success(command: impl Into<String>, data: T) -> Self {
        Self {
            schema_version: Self::SCHEMA_VERSION,
            command: command.into(),
            success: true,
            exit_code: ExitCode::Success,
            error: None,
            data: Some(data),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, Hash)]
pub enum ContainerType {
    #[serde(rename = "APK")]
    Apk,
    #[serde(rename = "APKM")]
    Apkm,
    #[serde(rename = "XAPK")]
    Xapk,
    #[serde(rename = "APKS")]
    Apks,
    #[serde(rename = "UNKNOWN")]
    Unknown,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, Hash)]
pub enum ArtifactRole {
    #[serde(rename = "target")]
    Target,
    #[serde(rename = "latest")]
    Latest,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct AndroidManifestInfo {
    #[serde(rename = "packageName")]
    pub package_name: String,
    #[serde(rename = "versionCode")]
    pub version_code: u64,
    #[serde(rename = "versionName")]
    pub version_name: String,
    #[serde(rename = "minSdkVersion")]
    pub min_sdk_version: Option<u32>,
    #[serde(rename = "targetSdkVersion")]
    pub target_sdk_version: Option<u32>,
    #[serde(rename = "permissions", default)]
    pub permissions: Vec<String>,
    #[serde(rename = "components", default)]
    pub components: Vec<String>,
    #[serde(rename = "splitName")]
    pub split_name: Option<String>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct MemberInfo {
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "size")]
    pub size: u64,
    #[serde(rename = "compressedSize")]
    pub compressed_size: u64,
    #[serde(rename = "crc")]
    pub crc: u32,
    #[serde(rename = "sha256")]
    pub sha256: String,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct SplitInfo {
    #[serde(rename = "filename")]
    pub filename: String,
    #[serde(rename = "splitName")]
    pub split_name: String,
    #[serde(rename = "sha256")]
    pub sha256: String,
    #[serde(rename = "size")]
    pub size: u64,
    #[serde(rename = "isBase", default)]
    pub is_base: bool,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct ArtifactInspection {
    #[serde(rename = "filePath")]
    pub file_path: String,
    #[serde(rename = "containerType")]
    pub container_type: ContainerType,
    #[serde(rename = "fileSize")]
    pub file_size: u64,
    #[serde(rename = "sha256")]
    pub sha256: String,
    #[serde(rename = "packageName")]
    pub package_name: String,
    #[serde(rename = "versionName")]
    pub version_name: String,
    #[serde(rename = "versionCode")]
    pub version_code: u64,
    #[serde(rename = "minSdk")]
    pub min_sdk: Option<u32>,
    #[serde(rename = "targetSdk")]
    pub target_sdk: Option<u32>,
    #[serde(rename = "signingCertificateSha256")]
    pub signing_certificate_sha256: Option<String>,
    #[serde(rename = "splits", default)]
    pub splits: Vec<SplitInfo>,
    #[serde(rename = "dexClassesCount", default)]
    pub dex_classes_count: u64,
    #[serde(rename = "dexMethodsCount", default)]
    pub dex_methods_count: u64,
    #[serde(rename = "dexFiles", default)]
    pub dex_files: Vec<String>,
    #[serde(rename = "nativeLibraries", default)]
    pub native_libraries: Vec<String>,
    #[serde(rename = "resources", default)]
    pub resources: Vec<String>,
    #[serde(rename = "assets", default)]
    pub assets: Vec<String>,
    #[serde(rename = "warnings", default)]
    pub warnings: Vec<String>,
}

/// One pinned tool version from `tools.lock.json`.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct ToolVersionRecord {
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "version")]
    pub version: String,
    #[serde(rename = "sha256")]
    pub sha256: String,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn exit_codes_round_trip_through_serde() {
        for code in ExitCode::ALL {
            let text = serde_json::to_string(&code).expect("serialize exit code");
            assert_eq!(text, code.as_u8().to_string());
            let decoded: ExitCode = serde_json::from_str(&text).expect("deserialize exit code");
            assert_eq!(decoded, code);
            assert_eq!(ExitCode::from_u8(decoded.as_u8()), Some(code));
        }
        assert!(ExitCode::from_u8(6).is_none());
    }

    #[test]
    fn envelope_field_order_and_renames_are_stable() {
        let envelope = Envelope::success("selftest", vec![1u8, 2]);
        let text = serde_json::to_string(&envelope).expect("serialize envelope");
        assert_eq!(
            text,
            r#"{"schemaVersion":1,"command":"selftest","success":true,"exitCode":0,"data":[1,2]}"#
        );
        let decoded: Envelope<Vec<u8>> = serde_json::from_str(&text).expect("deserialize envelope");
        assert_eq!(decoded, envelope);
    }

    #[test]
    fn artifact_wire_names_match_python_to_dict() {
        let inspection = ArtifactInspection {
            file_path: "app.apk".into(),
            container_type: ContainerType::Apk,
            file_size: 10,
            sha256: "ab".into(),
            package_name: "com.example".into(),
            version_name: "1.0".into(),
            version_code: 1,
            min_sdk: Some(24),
            target_sdk: None,
            signing_certificate_sha256: None,
            splits: Vec::new(),
            dex_classes_count: 0,
            dex_methods_count: 0,
            dex_files: Vec::new(),
            native_libraries: Vec::new(),
            resources: Vec::new(),
            assets: Vec::new(),
            warnings: Vec::new(),
        };
        let value = serde_json::to_value(&inspection).expect("serialize inspection");
        assert_eq!(value["filePath"], "app.apk");
        assert_eq!(value["containerType"], "APK");
        assert_eq!(value["minSdk"], 24);
        assert_eq!(value["targetSdk"], serde_json::Value::Null);
    }

    #[test]
    fn minimum_artifact_json_defaults_optional_fields_without_panicking() {
        let minimal = r#"{
            "filePath": "app.apk",
            "containerType": "APKR",
            "fileSize": 1,
            "sha256": "ab",
            "packageName": "com.example",
            "versionName": "1.0",
            "versionCode": 1
        }"#;
        let error = serde_json::from_str::<ArtifactInspection>(minimal)
            .expect_err("unknown container type must be rejected");
        assert!(error.to_string().contains("unknown variant"));

        let valid_json = minimal.replace("APKR", "APK");
        let inspection: ArtifactInspection =
            serde_json::from_str(&valid_json).expect("optional fields default");
        assert_eq!(inspection.min_sdk, None);
        assert_eq!(inspection.target_sdk, None);
        assert!(inspection.splits.is_empty());
    }

    #[test]
    fn malformed_exit_code_is_an_error_not_a_panic() {
        let result: Result<ExitCode, _> = serde_json::from_str("9");
        assert!(result.is_err());
        let result: Result<ExitCode, _> = serde_json::from_str("\"zero\"");
        assert!(result.is_err());
    }
}
