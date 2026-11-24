//! Cloudflare R2 fixture slots.
//!
//! Native port of the retired Python implementation. Object keys, S3 user-metadata names and
//! rotation rules are byte-for-byte compatible with the Python oracle:
//!
//! * every slot lives at `fixtures/{package}/{role}`,
//! * metadata travels as `x-amz-meta-*` headers mirroring `SlotMetadata`,
//! * a new `latest` only becomes visible after the old `latest` has been
//!   preserved as `target` when the configured target was still current,
//! * an obsolete `target` that duplicates the new `latest` is removed.
//!
//! Object I/O is behind [`S3Adapter`]. Production uses the maintained
//! `rust-s3` client with the R2 endpoint, `auto` region and SigV4 signing;
//! contract tests use an isolated in-memory adapter and never reach a real
//! bucket.

use crate::error::Error;
use crate::models::{ArtifactInspection, ContainerType, ExitCode};
use crate::morphe::{ArtifactInspector, NativeInspector};
use async_trait::async_trait;
use chrono::{SecondsFormat, Utc};
use std::collections::BTreeMap;
use std::fmt;
use std::path::{Path, PathBuf};
use std::sync::Arc;
use tempfile::TempDir;

/// Bucket used when `R2_BUCKET_NAME` is unset.
pub const DEFAULT_BUCKET_NAME: &str = "aidans-patches-apk-fixtures";

/// Content type written for seeded and rotated artifacts.
pub const FIXTURE_CONTENT_TYPE: &str = "application/vnd.android.package-archive";

/// A fixture slot operation failed.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FixtureError {
    pub message: String,
    pub exit_code: ExitCode,
}

impl FixtureError {
    #[must_use]
    pub fn infrastructure(message: impl Into<String>) -> Self {
        Self {
            message: message.into(),
            exit_code: ExitCode::InfrastructureFailure,
        }
    }

    #[must_use]
    pub fn usage(message: impl Into<String>) -> Self {
        Self {
            message: message.into(),
            exit_code: ExitCode::UsageOrToolError,
        }
    }

    #[must_use]
    pub fn invalid_artifact(message: impl Into<String>) -> Self {
        Self {
            message: message.into(),
            exit_code: ExitCode::InvalidArtifact,
        }
    }
}

impl fmt::Display for FixtureError {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        formatter.write_str(&self.message)
    }
}

impl std::error::Error for FixtureError {}

impl From<FixtureError> for Error {
    fn from(error: FixtureError) -> Self {
        match error.exit_code {
            ExitCode::UsageOrToolError => Error::usage(error.message),
            ExitCode::InvalidArtifact => Error::invalid_artifact(error.message),
            _ => Error::infrastructure(error.message),
        }
    }
}

/// Failure classes exposed by the S3 boundary.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum S3ErrorKind {
    NotFound,
    Forbidden,
    Network,
    Other,
}

/// Typed S3 adapter failure. Callers must distinguish an absent object from a
/// permission or transport failure; only [`S3ErrorKind::NotFound`] may become
/// [`Option::None`].
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct S3AdapterError {
    pub kind: S3ErrorKind,
    pub message: String,
}

impl S3AdapterError {
    #[must_use]
    pub fn new(kind: S3ErrorKind, message: impl Into<String>) -> Self {
        Self {
            kind,
            message: message.into(),
        }
    }
}

impl fmt::Display for S3AdapterError {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        formatter.write_str(&self.message)
    }
}

impl std::error::Error for S3AdapterError {}

/// The subset of object attributes fixture semantics require.
#[derive(Debug, Clone, PartialEq, Eq, Default)]
pub struct S3Object {
    pub metadata: BTreeMap<String, String>,
    pub content_type: Option<String>,
    pub content_length: Option<u64>,
}

/// S3 operations used by fixture slots. Implementations are injectable so
/// contract tests never depend on network or production credentials.
#[async_trait]
pub trait S3Adapter: Send + Sync {
    async fn head_object(
        &self,
        bucket: &str,
        key: &str,
    ) -> Result<Option<S3Object>, S3AdapterError>;

    async fn get_object_to_file(
        &self,
        bucket: &str,
        key: &str,
        destination: &Path,
    ) -> Result<(), S3AdapterError>;

    async fn put_object_from_file(
        &self,
        bucket: &str,
        key: &str,
        source: &Path,
        metadata: &BTreeMap<String, String>,
        content_type: &str,
    ) -> Result<(), S3AdapterError>;

    async fn delete_object(&self, bucket: &str, key: &str) -> Result<(), S3AdapterError>;
}

/// Credential/endpoint inputs for R2.
#[derive(Clone, PartialEq, Eq)]
pub struct R2Config {
    pub bucket_name: String,
    pub account_id: String,
    pub access_key_id: String,
    pub secret_access_key: String,
}

impl R2Config {
    /// Reads the exact environment names used by the Python implementation.
    /// Partial configuration yields `None`, matching its "not configured"
    /// behavior rather than silently mixing sources.
    #[must_use]
    pub fn from_env() -> Option<Self> {
        let account_id = nonempty(std::env::var("R2_ACCOUNT_ID").ok());
        let access_key_id = nonempty(std::env::var("R2_ACCESS_KEY_ID").ok());
        let secret_access_key = nonempty(std::env::var("R2_SECRET_ACCESS_KEY").ok());
        let (account_id, access_key_id, secret_access_key) =
            (account_id?, access_key_id?, secret_access_key?);
        Some(Self {
            bucket_name: nonempty(std::env::var("R2_BUCKET_NAME").ok())
                .unwrap_or_else(|| DEFAULT_BUCKET_NAME.to_string()),
            account_id,
            access_key_id,
            secret_access_key,
        })
    }

    #[must_use]
    pub fn endpoint(&self) -> String {
        format!("https://{}.r2.cloudflarestorage.com", self.account_id)
    }

    #[must_use]
    pub fn region(&self) -> &'static str {
        "auto"
    }

    #[must_use]
    pub fn signature_version(&self) -> &'static str {
        "s3v4"
    }
}

impl fmt::Debug for R2Config {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        formatter
            .debug_struct("R2Config")
            .field("bucket_name", &self.bucket_name)
            .field("account_id", &self.account_id)
            .field("access_key_id", &"[REDACTED]")
            .field("secret_access_key", &"[REDACTED]")
            .field("endpoint", &self.endpoint())
            .field("region", &self.region())
            .field("signature_version", &self.signature_version())
            .finish()
    }
}

fn nonempty(value: Option<String>) -> Option<String> {
    value.filter(|item| !item.trim().is_empty())
}

/// Slot metadata as stored in object user metadata.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SlotMetadata {
    pub role: String,
    pub package_name: String,
    pub version_name: String,
    pub version_code: u64,
    pub container_type: String,
    pub sha256: String,
    pub signer_sha256: Option<String>,
    pub size_bytes: u64,
    pub acquisition_source: String,
    pub timestamp: String,
}

impl SlotMetadata {
    #[must_use]
    pub fn to_s3_metadata(&self) -> BTreeMap<String, String> {
        BTreeMap::from([
            (
                "acquisition-source".to_string(),
                self.acquisition_source.clone(),
            ),
            ("container-type".to_string(), self.container_type.clone()),
            ("package-name".to_string(), self.package_name.clone()),
            ("role".to_string(), self.role.clone()),
            ("sha256".to_string(), self.sha256.clone()),
            (
                "signer-sha256".to_string(),
                self.signer_sha256.clone().unwrap_or_default(),
            ),
            ("size-bytes".to_string(), self.size_bytes.to_string()),
            ("timestamp".to_string(), self.timestamp.clone()),
            ("version-code".to_string(), self.version_code.to_string()),
            ("version-name".to_string(), self.version_name.clone()),
        ])
    }

    #[must_use]
    pub fn from_s3_metadata(metadata: &BTreeMap<String, String>) -> Self {
        Self {
            role: metadata
                .get("role")
                .cloned()
                .unwrap_or_else(|| "unknown".to_string()),
            package_name: metadata.get("package-name").cloned().unwrap_or_default(),
            version_name: metadata.get("version-name").cloned().unwrap_or_default(),
            version_code: metadata
                .get("version-code")
                .and_then(|value| value.parse().ok())
                .unwrap_or(0),
            container_type: metadata
                .get("container-type")
                .cloned()
                .unwrap_or_else(|| "APKM".to_string()),
            sha256: metadata.get("sha256").cloned().unwrap_or_default(),
            signer_sha256: metadata
                .get("signer-sha256")
                .filter(|value| !value.is_empty())
                .cloned(),
            size_bytes: metadata
                .get("size-bytes")
                .and_then(|value| value.parse().ok())
                .unwrap_or(0),
            acquisition_source: metadata
                .get("acquisition-source")
                .cloned()
                .unwrap_or_else(|| "unknown".to_string()),
            timestamp: metadata.get("timestamp").cloned().unwrap_or_default(),
        }
    }
}

/// R2-backed fixture slot manager.
///
/// Construct with [`R2FixtureManager::from_env`] in production or
/// [`R2FixtureManager::with_adapter`] in tests.
pub struct R2FixtureManager {
    bucket_name: String,
    config: Option<R2Config>,
    adapter: Option<Arc<dyn S3Adapter>>,
    inspector: Arc<dyn ArtifactInspector>,
}

impl fmt::Debug for R2FixtureManager {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        formatter
            .debug_struct("R2FixtureManager")
            .field("bucket_name", &self.bucket_name)
            .field("configured", &self.adapter.is_some())
            .finish()
    }
}

impl R2FixtureManager {
    /// Production constructor. Missing credentials do not fail construction;
    /// the first slot operation reports the Python-compatible usage error.
    pub fn from_env() -> Result<Self, FixtureError> {
        match R2Config::from_env() {
            Some(config) => {
                let adapter: Arc<dyn S3Adapter> = Arc::new(RustS3Adapter::new(&config)?);
                Ok(Self {
                    bucket_name: config.bucket_name.clone(),
                    config: Some(config),
                    adapter: Some(adapter),
                    inspector: Arc::new(NativeInspector),
                })
            }
            None => Ok(Self {
                bucket_name: nonempty(std::env::var("R2_BUCKET_NAME").ok())
                    .unwrap_or_else(|| DEFAULT_BUCKET_NAME.to_string()),
                config: None,
                adapter: None,
                inspector: Arc::new(NativeInspector),
            }),
        }
    }

    /// Test/development constructor with explicit object I/O.
    #[must_use]
    pub fn with_adapter(bucket_name: impl Into<String>, adapter: Arc<dyn S3Adapter>) -> Self {
        Self {
            bucket_name: bucket_name.into(),
            config: None,
            adapter: Some(adapter),
            inspector: Arc::new(NativeInspector),
        }
    }

    /// Replaces the artifact inspector used by seeding and rotation.
    #[must_use]
    pub fn with_inspector(mut self, inspector: Arc<dyn ArtifactInspector>) -> Self {
        self.inspector = inspector;
        self
    }

    #[must_use]
    pub fn bucket_name(&self) -> &str {
        &self.bucket_name
    }

    #[must_use]
    pub fn config(&self) -> Option<&R2Config> {
        self.config.as_ref()
    }

    fn require_adapter(&self) -> Result<&dyn S3Adapter, FixtureError> {
        self.adapter.as_deref().ok_or_else(|| {
            FixtureError::usage(
                "R2 credentials (R2_ACCOUNT_ID, R2_ACCESS_KEY_ID, R2_SECRET_ACCESS_KEY) not configured",
            )
        })
    }

    /// Exact object key for a slot.
    #[must_use]
    pub fn get_slot_key(package: &str, role: &str) -> String {
        format!("fixtures/{package}/{role}")
    }

    /// Reads slot metadata. A missing object yields `Ok(None)`; permission and
    /// transport failures are errors.
    pub async fn get_slot_metadata(
        &self,
        package: &str,
        role: &str,
    ) -> Result<Option<SlotMetadata>, FixtureError> {
        let adapter = self.require_adapter()?;
        let key = Self::get_slot_key(package, role);
        match adapter.head_object(&self.bucket_name, &key).await {
            Ok(Some(object)) => Ok(Some(SlotMetadata::from_s3_metadata(&object.metadata))),
            Ok(None) => Ok(None),
            Err(error) => Err(FixtureError::infrastructure(format!(
                "Failed to check R2 slot {key}: {error}"
            ))),
        }
    }

    /// Streams a slot object to a local file.
    pub async fn download_slot(
        &self,
        package: &str,
        role: &str,
        destination: impl AsRef<Path>,
    ) -> Result<PathBuf, FixtureError> {
        let adapter = self.require_adapter()?;
        let destination = destination.as_ref().to_path_buf();
        if let Some(parent) = destination.parent() {
            std::fs::create_dir_all(parent).map_err(|error| {
                FixtureError::infrastructure(format!(
                    "Failed to prepare download directory {}: {error}",
                    parent.display()
                ))
            })?;
        }
        let key = Self::get_slot_key(package, role);
        adapter
            .get_object_to_file(&self.bucket_name, &key, &destination)
            .await
            .map_err(|error| {
                FixtureError::infrastructure(format!("Failed to download R2 slot {key}: {error}"))
            })?;
        Ok(destination)
    }

    /// Uploads an artifact with multipart-capable streaming and metadata.
    pub async fn upload_slot(
        &self,
        package: &str,
        role: &str,
        artifact_path: impl AsRef<Path>,
        metadata: &SlotMetadata,
    ) -> Result<(), FixtureError> {
        let adapter = self.require_adapter()?;
        let key = Self::get_slot_key(package, role);
        adapter
            .put_object_from_file(
                &self.bucket_name,
                &key,
                artifact_path.as_ref(),
                &metadata.to_s3_metadata(),
                FIXTURE_CONTENT_TYPE,
            )
            .await
            .map_err(|error| {
                FixtureError::infrastructure(format!("Failed to upload R2 slot {key}: {error}"))
            })
    }

    /// Copies a slot and replaces only its `role` metadata, like the Python
    /// copy with `MetadataDirective=REPLACE`.
    pub async fn copy_slot(
        &self,
        package: &str,
        source_role: &str,
        destination_role: &str,
    ) -> Result<(), FixtureError> {
        let adapter = self.require_adapter()?;
        let source_key = Self::get_slot_key(package, source_role);
        let destination_key = Self::get_slot_key(package, destination_role);
        let failure = |detail: String| {
            FixtureError::infrastructure(format!(
                "Failed to copy R2 slot {source_key} -> {destination_key}: {detail}"
            ))
        };

        let object = adapter
            .head_object(&self.bucket_name, &source_key)
            .await
            .map_err(|error| failure(error.to_string()))?
            .ok_or_else(|| failure("source object not found".to_string()))?;

        let scratch = TempDir::new()
            .map_err(|error| failure(format!("temporary directory unavailable: {error}")))?;
        let staged = scratch.path().join("slot");
        adapter
            .get_object_to_file(&self.bucket_name, &source_key, &staged)
            .await
            .map_err(|error| failure(error.to_string()))?;

        let mut metadata = object.metadata;
        metadata.insert("role".to_string(), destination_role.to_string());
        let content_type = object
            .content_type
            .unwrap_or_else(|| FIXTURE_CONTENT_TYPE.to_string());
        adapter
            .put_object_from_file(
                &self.bucket_name,
                &destination_key,
                &staged,
                &metadata,
                &content_type,
            )
            .await
            .map_err(|error| failure(error.to_string()))
    }

    /// Deletes a slot object.
    pub async fn delete_slot(&self, package: &str, role: &str) -> Result<(), FixtureError> {
        let adapter = self.require_adapter()?;
        let key = Self::get_slot_key(package, role);
        adapter
            .delete_object(&self.bucket_name, &key)
            .await
            .map_err(|error| {
                FixtureError::infrastructure(format!("Failed to delete R2 slot {key}: {error}"))
            })
    }

    /// Seeds a slot from a local artifact after validating package identity.
    pub async fn seed_fixture(
        &self,
        package: &str,
        role: &str,
        artifact_path: impl AsRef<Path>,
    ) -> Result<SlotMetadata, FixtureError> {
        let path = artifact_path.as_ref();
        let inspection = self.inspect(path)?;
        if inspection.package_name != package {
            return Err(FixtureError::invalid_artifact(format!(
                "Artifact package '{}' != requested '{package}'",
                inspection.package_name
            )));
        }
        let metadata = slot_metadata(role, package, &inspection, "manual", now_timestamp());
        self.upload_slot(package, role, path, &metadata).await?;
        Ok(metadata)
    }

    /// Rotates slots when a new latest artifact is acquired.
    ///
    /// Ordering is the contract: preserve the outgoing latest as target when
    /// it is still the configured target, then publish the new latest, then
    /// drop a target that now duplicates latest.
    pub async fn rotate_slots_on_new_latest(
        &self,
        package: &str,
        new_latest_path: impl AsRef<Path>,
        desired_target_version: &str,
        source: &str,
    ) -> Result<(SlotMetadata, Option<SlotMetadata>), FixtureError> {
        let path = new_latest_path.as_ref();
        let inspection = self.inspect(path)?;
        if inspection.package_name != package {
            return Err(FixtureError::invalid_artifact(format!(
                "Artifact package '{}' != requested '{package}'",
                inspection.package_name
            )));
        }

        let new_metadata = slot_metadata("latest", package, &inspection, source, now_timestamp());
        let current_latest = self.get_slot_metadata(package, "latest").await?;
        let mut current_target = self.get_slot_metadata(package, "target").await?;

        if let Some(latest) = &current_latest {
            if latest.version_name == desired_target_version
                && (latest.version_name != inspection.version_name
                    || latest.sha256 != inspection.sha256)
            {
                self.copy_slot(package, "latest", "target").await?;
                current_target = self.get_slot_metadata(package, "target").await?;
            }
        }

        self.upload_slot(package, "latest", path, &new_metadata)
            .await?;

        if let Some(target) = &current_target {
            if target.version_name == inspection.version_name && target.sha256 == inspection.sha256
            {
                self.delete_slot(package, "target").await?;
                current_target = None;
            }
        }

        Ok((new_metadata, current_target))
    }

    fn inspect(&self, path: &Path) -> Result<ArtifactInspection, FixtureError> {
        self.inspector.inspect(path).map_err(|error| {
            FixtureError::invalid_artifact(format!(
                "Artifact inspection failed for {}: {}",
                path.display(),
                error.message()
            ))
        })
    }
}

/// Deterministic mapping from inspection to slot metadata.
fn slot_metadata(
    role: &str,
    package: &str,
    inspection: &ArtifactInspection,
    source: &str,
    timestamp: String,
) -> SlotMetadata {
    SlotMetadata {
        role: role.to_string(),
        package_name: package.to_string(),
        version_name: inspection.version_name.clone(),
        version_code: inspection.version_code,
        container_type: container_name(inspection.container_type),
        sha256: inspection.sha256.clone(),
        signer_sha256: inspection.signing_certificate_sha256.clone(),
        size_bytes: inspection.file_size,
        acquisition_source: source.to_string(),
        timestamp,
    }
}

/// Python serializes `ContainerType.value`; recover the same upper-case tag.
fn container_name(container: ContainerType) -> String {
    match container {
        ContainerType::Apk => "APK",
        ContainerType::Apkm => "APKM",
        ContainerType::Xapk => "XAPK",
        ContainerType::Apks => "APKS",
        ContainerType::Unknown => "UNKNOWN",
    }
    .to_string()
}

/// Python emits `datetime.now(UTC).isoformat()` with a `+00:00` offset and
/// microsecond precision; keep that representation.
fn now_timestamp() -> String {
    Utc::now().to_rfc3339_opts(SecondsFormat::Micros, false)
}

/// Production S3 adapter backed by `rust-s3`.
pub struct RustS3Adapter {
    bucket: Box<s3::Bucket>,
}

impl RustS3Adapter {
    /// Builds an R2 bucket handle using the configured endpoint, `auto`
    /// region and AWS Signature Version 4.
    pub fn new(config: &R2Config) -> Result<Self, FixtureError> {
        let region = s3::Region::Custom {
            region: config.region().to_string(),
            endpoint: config.endpoint(),
        };
        let credentials = s3::creds::Credentials::new(
            Some(&config.access_key_id),
            Some(&config.secret_access_key),
            None,
            None,
            None,
        )
        .map_err(|error| {
            FixtureError::infrastructure(format!("R2 credentials are invalid: {error}"))
        })?;
        let bucket = s3::Bucket::new(&config.bucket_name, region, credentials)
            .map_err(|error| {
                FixtureError::infrastructure(format!("R2 client initialization failed: {error}"))
            })?
            .with_path_style();
        Ok(Self { bucket })
    }
}

fn classify_s3_error(error: s3::error::S3Error) -> S3AdapterError {
    match &error {
        s3::error::S3Error::HttpFailWithBody(status, body) => {
            let kind = match *status {
                404 => S3ErrorKind::NotFound,
                401 | 403 => S3ErrorKind::Forbidden,
                _ => S3ErrorKind::Other,
            };
            S3AdapterError::new(kind, format!("S3 HTTP {status}: {body}"))
        }
        s3::error::S3Error::Reqwest(_)
        | s3::error::S3Error::Io(_)
        | s3::error::S3Error::Http(_) => {
            S3AdapterError::new(S3ErrorKind::Network, error.to_string())
        }
        _ => S3AdapterError::new(S3ErrorKind::Other, error.to_string()),
    }
}

#[async_trait]
impl S3Adapter for RustS3Adapter {
    async fn head_object(
        &self,
        _bucket: &str,
        key: &str,
    ) -> Result<Option<S3Object>, S3AdapterError> {
        match self.bucket.head_object(key).await {
            Ok((head, _status)) => Ok(Some(S3Object {
                metadata: head.metadata.unwrap_or_default().into_iter().collect(),
                content_type: head.content_type,
                content_length: head.content_length.and_then(|value| value.try_into().ok()),
            })),
            Err(error) => match classify_s3_error(error) {
                S3AdapterError {
                    kind: S3ErrorKind::NotFound,
                    ..
                } => Ok(None),
                error => Err(error),
            },
        }
    }

    async fn get_object_to_file(
        &self,
        _bucket: &str,
        key: &str,
        destination: &Path,
    ) -> Result<(), S3AdapterError> {
        let mut file = tokio::fs::File::create(destination)
            .await
            .map_err(|error| S3AdapterError::new(S3ErrorKind::Other, error.to_string()))?;
        self.bucket
            .get_object_to_writer(key, &mut file)
            .await
            .map_err(classify_s3_error)?;
        Ok(())
    }

    async fn put_object_from_file(
        &self,
        _bucket: &str,
        key: &str,
        source: &Path,
        metadata: &BTreeMap<String, String>,
        content_type: &str,
    ) -> Result<(), S3AdapterError> {
        let mut file = tokio::fs::File::open(source)
            .await
            .map_err(|error| S3AdapterError::new(S3ErrorKind::Other, error.to_string()))?;
        let mut request = self
            .bucket
            .put_object_stream_builder(key)
            .with_content_type(content_type);
        for (name, value) in metadata {
            request = request
                .with_metadata(name, value)
                .map_err(|error| S3AdapterError::new(S3ErrorKind::Other, error.to_string()))?;
        }
        request
            .execute_stream(&mut file)
            .await
            .map_err(classify_s3_error)?;
        Ok(())
    }

    async fn delete_object(&self, _bucket: &str, key: &str) -> Result<(), S3AdapterError> {
        self.bucket
            .delete_object(key)
            .await
            .map_err(classify_s3_error)?;
        Ok(())
    }
}
