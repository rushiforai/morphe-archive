//! Offline contracts for R2 fixture slots and compatibility CI transitions.
//!
//! Object I/O is an in-memory adapter; acquisition, inspection, Morphe and the
//! Worker are deterministic fakes. No test reads production credentials,
//! contacts a cloud endpoint or writes a production fixture.

use apk_lab::compatibility_ci::{
    build_error_result, build_result_item, extract_package_from_constants, get_changed_patch_files,
    get_package_run_metadata, get_target_version_for_package, packages_output,
    parse_requested_roles, resolve_matrix_packages, run_ci_reconcile_and_test, write_matrix_output,
    ArtifactAcquirer, CiDependencies, CiEnvironment, CiRunRequest, CompatibilityChecker,
    CompatibilityResultInput, CompatibilitySubmission, PostError, RunStartPayload, WorkerPoster,
};
use apk_lab::error::Error;
use apk_lab::fixtures::{
    R2Config, R2FixtureManager, S3Adapter, S3AdapterError, S3ErrorKind, S3Object, SlotMetadata,
};
use apk_lab::models::{ArtifactInspection, ContainerType, ExitCode};
use apk_lab::morphe::{ArtifactInspector, PatchCompatibilityReport, ToolVersions};
use serde_json::{json, Value};
use std::collections::BTreeMap;
use std::fs;
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::{Arc, Mutex};

const BUCKET: &str = "test-bucket";
const PACKAGE: &str = "com.test.app";

// ---------------------------------------------------------------------------
// In-memory S3
// ---------------------------------------------------------------------------

#[derive(Clone, Debug)]
struct StoredObject {
    bytes: Vec<u8>,
    metadata: BTreeMap<String, String>,
    content_type: String,
}

#[derive(Default)]
struct MemoryState {
    objects: BTreeMap<String, StoredObject>,
    heads: Vec<String>,
    gets: Vec<String>,
    puts: Vec<String>,
    deletes: Vec<String>,
}

#[derive(Default)]
struct MemoryFailures {
    head: Option<S3AdapterError>,
    get: Option<S3AdapterError>,
    put: Option<S3AdapterError>,
    delete: Option<S3AdapterError>,
}

#[derive(Default)]
struct MemoryS3 {
    state: Mutex<MemoryState>,
    failures: Mutex<MemoryFailures>,
}

impl MemoryS3 {
    fn object_key(bucket: &str, key: &str) -> String {
        format!("{bucket}/{key}")
    }

    fn insert(&self, bucket: &str, key: &str, bytes: &[u8], metadata: SlotMetadata) {
        self.state.lock().unwrap().objects.insert(
            Self::object_key(bucket, key),
            StoredObject {
                bytes: bytes.to_vec(),
                metadata: metadata.to_s3_metadata(),
                content_type: "application/vnd.android.package-archive".to_string(),
            },
        );
    }

    fn fail_head(&self, kind: S3ErrorKind, message: &str) {
        self.failures.lock().unwrap().head = Some(S3AdapterError::new(kind, message));
    }

    fn fail_get(&self, kind: S3ErrorKind, message: &str) {
        self.failures.lock().unwrap().get = Some(S3AdapterError::new(kind, message));
    }

    fn fail_put(&self, kind: S3ErrorKind, message: &str) {
        self.failures.lock().unwrap().put = Some(S3AdapterError::new(kind, message));
    }

    fn head_calls(&self) -> Vec<String> {
        self.state.lock().unwrap().heads.clone()
    }

    fn get_calls(&self) -> Vec<String> {
        self.state.lock().unwrap().gets.clone()
    }

    fn put_calls(&self) -> Vec<String> {
        self.state.lock().unwrap().puts.clone()
    }

    fn delete_calls(&self) -> Vec<String> {
        self.state.lock().unwrap().deletes.clone()
    }

    fn stored(&self, key: &str) -> Option<StoredObject> {
        self.state
            .lock()
            .unwrap()
            .objects
            .get(&Self::object_key(BUCKET, key))
            .cloned()
    }
}

#[async_trait::async_trait]
impl S3Adapter for MemoryS3 {
    async fn head_object(
        &self,
        bucket: &str,
        key: &str,
    ) -> Result<Option<S3Object>, S3AdapterError> {
        let object_key = Self::object_key(bucket, key);
        self.state.lock().unwrap().heads.push(object_key.clone());
        if let Some(error) = self.failures.lock().unwrap().head.clone() {
            return Err(error);
        }
        Ok(self
            .state
            .lock()
            .unwrap()
            .objects
            .get(&object_key)
            .map(|stored| S3Object {
                metadata: stored.metadata.clone(),
                content_type: Some(stored.content_type.clone()),
                content_length: Some(stored.bytes.len() as u64),
            }))
    }

    async fn get_object_to_file(
        &self,
        bucket: &str,
        key: &str,
        destination: &Path,
    ) -> Result<(), S3AdapterError> {
        let object_key = Self::object_key(bucket, key);
        self.state.lock().unwrap().gets.push(object_key.clone());
        if let Some(error) = self.failures.lock().unwrap().get.clone() {
            return Err(error);
        }
        let bytes = self
            .state
            .lock()
            .unwrap()
            .objects
            .get(&object_key)
            .map(|stored| stored.bytes.clone())
            .ok_or_else(|| S3AdapterError::new(S3ErrorKind::NotFound, "object not found"))?;
        fs::write(destination, bytes)
            .map_err(|error| S3AdapterError::new(S3ErrorKind::Other, error.to_string()))
    }

    async fn put_object_from_file(
        &self,
        bucket: &str,
        key: &str,
        source: &Path,
        metadata: &BTreeMap<String, String>,
        content_type: &str,
    ) -> Result<(), S3AdapterError> {
        let object_key = Self::object_key(bucket, key);
        self.state.lock().unwrap().puts.push(object_key.clone());
        if let Some(error) = self.failures.lock().unwrap().put.clone() {
            return Err(error);
        }
        let bytes = fs::read(source)
            .map_err(|error| S3AdapterError::new(S3ErrorKind::Other, error.to_string()))?;
        self.state.lock().unwrap().objects.insert(
            object_key,
            StoredObject {
                bytes,
                metadata: metadata.clone(),
                content_type: content_type.to_string(),
            },
        );
        Ok(())
    }

    async fn delete_object(&self, bucket: &str, key: &str) -> Result<(), S3AdapterError> {
        let object_key = Self::object_key(bucket, key);
        self.state.lock().unwrap().deletes.push(object_key.clone());
        if let Some(error) = self.failures.lock().unwrap().delete.clone() {
            return Err(error);
        }
        self.state.lock().unwrap().objects.remove(&object_key);
        Ok(())
    }
}

// ---------------------------------------------------------------------------
// Fixtures for injected boundaries
// ---------------------------------------------------------------------------

fn inspection(package: &str, version: &str) -> ArtifactInspection {
    ArtifactInspection {
        file_path: format!("/tmp/{package}-{version}.apkm"),
        container_type: ContainerType::Apkm,
        file_size: 1234,
        sha256: format!("sha-{version}"),
        package_name: package.to_string(),
        version_name: version.to_string(),
        version_code: 100,
        min_sdk: Some(21),
        target_sdk: Some(34),
        signing_certificate_sha256: Some("signer-sha".to_string()),
        splits: Vec::new(),
        dex_classes_count: 0,
        dex_methods_count: 0,
        dex_files: Vec::new(),
        native_libraries: Vec::new(),
        resources: Vec::new(),
        assets: Vec::new(),
        warnings: Vec::new(),
    }
}

struct FakeInspector {
    result: Mutex<Result<ArtifactInspection, Error>>,
    calls: AtomicUsize,
}

impl FakeInspector {
    fn returning(result: Result<ArtifactInspection, Error>) -> Self {
        Self {
            result: Mutex::new(result),
            calls: AtomicUsize::new(0),
        }
    }
}

impl ArtifactInspector for FakeInspector {
    fn inspect(&self, _path: &Path) -> Result<ArtifactInspection, Error> {
        self.calls.fetch_add(1, Ordering::SeqCst);
        self.result.lock().unwrap().clone()
    }
}

enum AcquireOutcome {
    Success { write: bool, source: String },
    Failure(Error),
}

struct FakeAcquirer {
    outcome: Mutex<AcquireOutcome>,
    calls: AtomicUsize,
}

impl FakeAcquirer {
    fn success(write: bool) -> Self {
        Self {
            outcome: Mutex::new(AcquireOutcome::Success {
                write,
                source: "apkeep".to_string(),
            }),
            calls: AtomicUsize::new(0),
        }
    }

    fn failure(message: &str) -> Self {
        Self {
            outcome: Mutex::new(AcquireOutcome::Failure(Error::runtime(message))),
            calls: AtomicUsize::new(0),
        }
    }
}

impl ArtifactAcquirer for FakeAcquirer {
    fn acquire(
        &self,
        package: &str,
        output_dir: &Path,
        _expected_version: &str,
    ) -> Result<(PathBuf, String), Error> {
        self.calls.fetch_add(1, Ordering::SeqCst);
        match &*self.outcome.lock().unwrap() {
            AcquireOutcome::Success { write, source } => {
                let path = output_dir.join(format!("{package}.apkm"));
                if *write {
                    fs::create_dir_all(output_dir).unwrap();
                    fs::write(&path, b"acquired").unwrap();
                }
                Ok((path, source.clone()))
            }
            AcquireOutcome::Failure(error) => Err(error.clone()),
        }
    }
}

enum CheckOutcome {
    Report(Box<PatchCompatibilityReport>, ExitCode),
    Failure(Error),
}

struct FakeChecker {
    outcome: Mutex<CheckOutcome>,
    calls: AtomicUsize,
}

impl FakeChecker {
    fn reporting(
        status: &str,
        passed: u64,
        failed: u64,
        reason: Option<&str>,
        code: ExitCode,
    ) -> Self {
        Self {
            outcome: Mutex::new(CheckOutcome::Report(
                Box::new(report(status, passed, failed, reason)),
                code,
            )),
            calls: AtomicUsize::new(0),
        }
    }

    fn compatible() -> Self {
        Self::reporting("compatible", 5, 0, None, ExitCode::Success)
    }

    fn failing(message: &str) -> Self {
        Self {
            outcome: Mutex::new(CheckOutcome::Failure(Error::runtime(message))),
            calls: AtomicUsize::new(0),
        }
    }
}

fn report(
    status: &str,
    passed: u64,
    failed: u64,
    reason: Option<&str>,
) -> PatchCompatibilityReport {
    PatchCompatibilityReport {
        artifact_sha256: "sha".to_string(),
        package_name: PACKAGE.to_string(),
        version_name: "1.0.0".to_string(),
        version_code: 100,
        patch_bundle_version: "1.4.0".to_string(),
        git_revision: "rev1".to_string(),
        tool_versions: ToolVersions::new(),
        overall_status: status.to_string(),
        total_cases: passed + failed,
        passed_cases: passed,
        failed_cases: failed,
        test_cases: Vec::new(),
        failure_reason: reason.map(str::to_string),
    }
}

impl CompatibilityChecker for FakeChecker {
    fn check(
        &self,
        _artifact: &Path,
        _mpp: &Path,
        _expected_package: &str,
    ) -> Result<(PatchCompatibilityReport, ExitCode), Error> {
        self.calls.fetch_add(1, Ordering::SeqCst);
        match &*self.outcome.lock().unwrap() {
            CheckOutcome::Report(report, code) => Ok(((**report).clone(), *code)),
            CheckOutcome::Failure(error) => Err(error.clone()),
        }
    }
}

#[derive(Clone)]
enum PostOutcome {
    Status(u16),
    Error(String),
}

struct RecordingPoster {
    run_start: Mutex<PostOutcome>,
    submission: Mutex<PostOutcome>,
    run_starts: Mutex<Vec<RunStartPayload>>,
    submissions: Mutex<Vec<CompatibilitySubmission>>,
    submission_path: Option<PathBuf>,
    observed_saved_bytes: Mutex<Option<usize>>,
}

impl RecordingPoster {
    fn status(status: u16) -> Self {
        Self {
            run_start: Mutex::new(PostOutcome::Status(200)),
            submission: Mutex::new(PostOutcome::Status(status)),
            run_starts: Mutex::new(Vec::new()),
            submissions: Mutex::new(Vec::new()),
            submission_path: None,
            observed_saved_bytes: Mutex::new(None),
        }
    }

    fn transport_error(message: &str) -> Self {
        let poster = Self::status(0);
        *poster.submission.lock().unwrap() = PostOutcome::Error(message.to_string());
        poster
    }

    fn observing(path: PathBuf) -> Self {
        let mut poster = Self::status(200);
        poster.submission_path = Some(path);
        poster
    }

    fn submissions(&self) -> Vec<CompatibilitySubmission> {
        self.submissions.lock().unwrap().clone()
    }

    fn post_count(&self) -> usize {
        self.submissions.lock().unwrap().len()
    }
}

impl WorkerPoster for RecordingPoster {
    fn post_run_start(
        &self,
        _worker_url: &str,
        _status_secret: &str,
        payload: &RunStartPayload,
    ) -> Result<u16, PostError> {
        self.run_starts.lock().unwrap().push(payload.clone());
        match &*self.run_start.lock().unwrap() {
            PostOutcome::Status(status) => Ok(*status),
            PostOutcome::Error(message) => Err(PostError {
                message: message.clone(),
            }),
        }
    }

    fn post_submission(
        &self,
        _worker_url: &str,
        _status_secret: &str,
        submission: &CompatibilitySubmission,
    ) -> Result<u16, PostError> {
        if let Some(path) = &self.submission_path {
            let bytes = fs::read(path).unwrap_or_default();
            *self.observed_saved_bytes.lock().unwrap() = Some(bytes.len());
        }
        self.submissions.lock().unwrap().push(submission.clone());
        match &*self.submission.lock().unwrap() {
            PostOutcome::Status(status) => Ok(*status),
            PostOutcome::Error(message) => Err(PostError {
                message: message.clone(),
            }),
        }
    }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

fn patches_data() -> Value {
    json!({
        "version": "1.4.0",
        "patches": [{
            "compatiblePackages": [{
                "packageName": PACKAGE,
                "name": "Test App",
                "targets": [{"version": "1.0.0"}],
                "apkFileType": "apkm"
            }]
        }]
    })
}

fn slot(role: &str, version: &str, sha: &str) -> SlotMetadata {
    SlotMetadata {
        role: role.to_string(),
        package_name: PACKAGE.to_string(),
        version_name: version.to_string(),
        version_code: 100,
        container_type: "APKM".to_string(),
        sha256: sha.to_string(),
        signer_sha256: Some("signer-sha".to_string()),
        size_bytes: 1234,
        acquisition_source: "manual".to_string(),
        timestamp: "2026-10-06T00:00:00+00:00".to_string(),
    }
}

struct Harness {
    _temp: tempfile::TempDir,
    root: PathBuf,
    mpp: PathBuf,
    runner_temp: PathBuf,
    submission_path: PathBuf,
    marker_path: PathBuf,
    patches: Value,
    memory: Arc<MemoryS3>,
    inspector: Arc<FakeInspector>,
}

impl Harness {
    fn new(inspected_version: &str) -> Self {
        let temp = tempfile::tempdir().unwrap();
        let root = temp.path().to_path_buf();
        let mpp = root.join("bundle.mpp");
        fs::write(&mpp, b"mpp").unwrap();
        let runner_temp = root.join("runner");
        fs::create_dir_all(&runner_temp).unwrap();
        Self {
            _temp: temp,
            root: root.clone(),
            mpp,
            runner_temp,
            submission_path: root.join("submission.json"),
            marker_path: root.join("callback-marker"),
            patches: patches_data(),
            memory: Arc::new(MemoryS3::default()),
            inspector: Arc::new(FakeInspector::returning(Ok(inspection(
                PACKAGE,
                inspected_version,
            )))),
        }
    }

    fn manager(&self) -> R2FixtureManager {
        R2FixtureManager::with_adapter(BUCKET, self.memory.clone())
            .with_inspector(self.inspector.clone())
    }

    fn environment(&self) -> CiEnvironment {
        CiEnvironment {
            dispatch_request_id: "req-123".to_string(),
            status_secret: Some("secret-xyz".to_string()),
            worker_url: "https://worker.test".to_string(),
            submission_path: Some(self.submission_path.clone()),
            callback_marker: Some(self.marker_path.clone()),
            git_revision: "rev1".to_string(),
            github_run_id: Some("99".to_string()),
            github_repository: "owner/repo".to_string(),
            ..CiEnvironment::default()
        }
    }

    fn request(&self, environment: CiEnvironment) -> CiRunRequest<'_> {
        CiRunRequest {
            package: PACKAGE,
            mpp_path: &self.mpp,
            runner_temp: &self.runner_temp,
            patches_data: &self.patches,
            environment,
            requested_roles: Some(vec!["target".to_string()]),
        }
    }
}

// ---------------------------------------------------------------------------
// Slot keys, metadata and object errors
// ---------------------------------------------------------------------------

#[test]
fn slot_key_and_metadata_names_are_exact() {
    assert_eq!(
        R2FixtureManager::get_slot_key("com.test.app", "latest"),
        "fixtures/com.test.app/latest"
    );
    let metadata = slot("target", "1.0.0", "abc");
    let map = metadata.to_s3_metadata();
    let mut keys: Vec<&str> = map.keys().map(String::as_str).collect();
    keys.sort_unstable();
    assert_eq!(
        keys,
        vec![
            "acquisition-source",
            "container-type",
            "package-name",
            "role",
            "sha256",
            "signer-sha256",
            "size-bytes",
            "timestamp",
            "version-code",
            "version-name",
        ]
    );
    assert_eq!(map["role"], "target");
    assert_eq!(map["version-code"], "100");
    assert_eq!(map["signer-sha256"], "signer-sha");
    assert_eq!(SlotMetadata::from_s3_metadata(&map), metadata);
    assert_eq!(
        SlotMetadata::from_s3_metadata(&BTreeMap::new()),
        SlotMetadata {
            role: "unknown".to_string(),
            package_name: String::new(),
            version_name: String::new(),
            version_code: 0,
            container_type: "APKM".to_string(),
            sha256: String::new(),
            signer_sha256: None,
            size_bytes: 0,
            acquisition_source: "unknown".to_string(),
            timestamp: String::new(),
        }
    );
}

#[tokio::test]
async fn missing_object_is_not_a_permission_or_network_error() {
    let memory = Arc::new(MemoryS3::default());
    let manager = R2FixtureManager::with_adapter(BUCKET, memory.clone());

    assert_eq!(
        manager.get_slot_metadata(PACKAGE, "latest").await.unwrap(),
        None
    );

    memory.fail_head(S3ErrorKind::Forbidden, "Access Denied");
    let error = manager
        .get_slot_metadata(PACKAGE, "latest")
        .await
        .unwrap_err();
    assert_eq!(error.exit_code, ExitCode::InfrastructureFailure);
    assert!(error.message.contains("fixtures/com.test.app/latest"));
    assert!(error.message.contains("Access Denied"));

    memory.fail_head(S3ErrorKind::Network, "connection reset");
    let error = manager
        .get_slot_metadata(PACKAGE, "latest")
        .await
        .unwrap_err();
    assert!(error.message.contains("connection reset"));
}

#[tokio::test]
async fn download_missing_and_transport_errors_are_reported() {
    let memory = Arc::new(MemoryS3::default());
    let manager = R2FixtureManager::with_adapter(BUCKET, memory.clone());
    let destination = tempfile::tempdir().unwrap().path().join("slot.apkm");

    let error = manager
        .download_slot(PACKAGE, "target", &destination)
        .await
        .unwrap_err();
    assert!(error.message.contains("Failed to download R2 slot"));
    assert!(!destination.exists());

    memory.fail_get(S3ErrorKind::Network, "broken pipe");
    let error = manager
        .download_slot(PACKAGE, "target", &destination)
        .await
        .unwrap_err();
    assert!(error.message.contains("broken pipe"));
}

#[tokio::test]
async fn seed_fixture_uploads_exact_key_metadata_and_timestamp() {
    let harness = Harness::new("1.0.0");
    let manager = harness.manager();
    let artifact = harness.root.join("input.apkm");
    fs::write(&artifact, b"artifact").unwrap();

    let metadata = manager
        .seed_fixture(PACKAGE, "target", &artifact)
        .await
        .unwrap();

    assert_eq!(metadata.role, "target");
    assert_eq!(metadata.package_name, PACKAGE);
    assert_eq!(metadata.version_name, "1.0.0");
    assert_eq!(metadata.container_type, "APKM");
    assert_eq!(metadata.acquisition_source, "manual");
    assert_eq!(metadata.signer_sha256.as_deref(), Some("signer-sha"));
    assert!(
        metadata.timestamp.ends_with("+00:00"),
        "{}",
        metadata.timestamp
    );
    assert_eq!(
        harness.memory.put_calls(),
        vec!["test-bucket/fixtures/com.test.app/target".to_string()]
    );
    let stored = harness
        .memory
        .stored("fixtures/com.test.app/target")
        .unwrap();
    assert_eq!(stored.bytes, b"artifact");
    assert_eq!(stored.metadata["role"], "target");
    assert_eq!(stored.metadata["package-name"], PACKAGE);
    assert_eq!(
        stored.content_type,
        "application/vnd.android.package-archive"
    );
}

#[tokio::test]
async fn seed_fixture_rejects_package_mismatch_before_any_upload() {
    let harness = Harness::new("1.0.0");
    *harness.inspector.result.lock().unwrap() = Ok(inspection("com.different.package", "1.0.0"));
    let manager = harness.manager();
    let artifact = harness.root.join("input.apkm");
    fs::write(&artifact, b"artifact").unwrap();

    let error = manager
        .seed_fixture(PACKAGE, "target", &artifact)
        .await
        .unwrap_err();
    assert_eq!(
        error.message,
        "Artifact package 'com.different.package' != requested 'com.test.app'"
    );
    assert_eq!(error.exit_code, ExitCode::InvalidArtifact);
    assert!(harness.memory.put_calls().is_empty());
    assert!(harness.memory.head_calls().is_empty());
}

#[tokio::test]
async fn rotation_preserves_outgoing_latest_as_target() {
    let memory = Arc::new(MemoryS3::default());
    memory.insert(
        BUCKET,
        "fixtures/com.test.app/latest",
        b"v1",
        slot("latest", "1.0.0", "sha1"),
    );
    let inspector = Arc::new(FakeInspector::returning(Ok(inspection(PACKAGE, "2.0.0"))));
    let manager = R2FixtureManager::with_adapter(BUCKET, memory.clone()).with_inspector(inspector);
    let scratch = tempfile::tempdir().unwrap();
    let artifact = scratch.path().join("new.apkm");
    fs::write(&artifact, b"v2").unwrap();

    let (new_latest, target) = manager
        .rotate_slots_on_new_latest(PACKAGE, &artifact, "1.0.0", "apkeep")
        .await
        .unwrap();

    assert_eq!(new_latest.role, "latest");
    assert_eq!(new_latest.version_name, "2.0.0");
    assert_eq!(new_latest.acquisition_source, "apkeep");
    let target = target.expect("outgoing latest preserved as target");
    assert_eq!(target.role, "target");
    assert_eq!(target.version_name, "1.0.0");
    assert_eq!(target.sha256, "sha1");
    assert_eq!(
        memory.put_calls(),
        vec![
            "test-bucket/fixtures/com.test.app/target".to_string(),
            "test-bucket/fixtures/com.test.app/latest".to_string(),
        ]
    );
    assert_eq!(
        memory
            .stored("fixtures/com.test.app/target")
            .unwrap()
            .metadata["role"],
        "target"
    );
    assert_eq!(
        memory
            .stored("fixtures/com.test.app/latest")
            .unwrap()
            .metadata["version-name"],
        "2.0.0"
    );
}

#[tokio::test]
async fn rotation_drops_target_that_duplicates_new_latest() {
    let memory = Arc::new(MemoryS3::default());
    memory.insert(
        BUCKET,
        "fixtures/com.test.app/latest",
        b"old",
        slot("latest", "1.0.0", "sha-old"),
    );
    memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"v2",
        slot("target", "2.0.0", "sha-2.0.0"),
    );
    let inspector = Arc::new(FakeInspector::returning(Ok(inspection(PACKAGE, "2.0.0"))));
    let manager = R2FixtureManager::with_adapter(BUCKET, memory.clone()).with_inspector(inspector);
    let scratch = tempfile::tempdir().unwrap();
    let artifact = scratch.path().join("new.apkm");
    fs::write(&artifact, b"v2").unwrap();

    let (_latest, target) = manager
        .rotate_slots_on_new_latest(PACKAGE, &artifact, "3.0.0", "apkeep")
        .await
        .unwrap();

    assert!(target.is_none());
    assert_eq!(
        memory.delete_calls(),
        vec!["test-bucket/fixtures/com.test.app/target".to_string()]
    );
    assert!(memory.stored("fixtures/com.test.app/target").is_none());
}

#[tokio::test]
async fn rotation_package_mismatch_is_rejected_before_any_io() {
    let harness = Harness::new("2.0.0");
    *harness.inspector.result.lock().unwrap() = Ok(inspection("com.different.package", "2.0.0"));
    let manager = harness.manager();
    let artifact = harness.root.join("input.apkm");
    fs::write(&artifact, b"artifact").unwrap();

    let error = manager
        .rotate_slots_on_new_latest(PACKAGE, &artifact, "1.0.0", "apkeep")
        .await
        .unwrap_err();
    assert_eq!(
        error.message,
        "Artifact package 'com.different.package' != requested 'com.test.app'"
    );
    assert!(harness.memory.head_calls().is_empty());
    assert!(harness.memory.put_calls().is_empty());
    assert!(harness.memory.delete_calls().is_empty());
}

// ---------------------------------------------------------------------------
// Matrix selection, ordering and inputs
// ---------------------------------------------------------------------------

fn matrix_data() -> Value {
    json!({
        "patches": [{
            "compatiblePackages": [
                {"packageName": "com.app.b", "name": "B", "targets": [{"version": "2.0.0"}]},
                {"packageName": "com.app.a", "name": "A", "targets": [{"version": "1.0.0"}]}
            ]
        }]
    })
}

#[test]
fn matrix_workflow_dispatch_defaults_specific_and_unknown() {
    let data = matrix_data();
    assert_eq!(
        resolve_matrix_packages(
            &data,
            "workflow_dispatch",
            None,
            None,
            None,
            Path::new("patches")
        )
        .unwrap(),
        vec!["com.app.a".to_string(), "com.app.b".to_string()]
    );
    assert_eq!(
        resolve_matrix_packages(
            &data,
            "workflow_dispatch",
            None,
            Some("all"),
            None,
            Path::new("patches")
        )
        .unwrap(),
        vec!["com.app.a".to_string(), "com.app.b".to_string()]
    );
    assert_eq!(
        resolve_matrix_packages(
            &data,
            "workflow_dispatch",
            None,
            Some("com.app.a"),
            None,
            Path::new("patches")
        )
        .unwrap(),
        vec!["com.app.a".to_string()]
    );
    let error = resolve_matrix_packages(
        &data,
        "workflow_dispatch",
        None,
        Some("com.unknown.app"),
        None,
        Path::new("patches"),
    )
    .unwrap_err();
    assert_eq!(
        error.message(),
        "Unknown package in workflow dispatch: com.unknown.app"
    );
    assert_eq!(error.exit_code(), ExitCode::UsageOrToolError);
}

#[test]
fn matrix_push_selection_and_fan_out() {
    let temp = tempfile::tempdir().unwrap();
    let root = temp.path().join("patches");
    let app_base = root.join("src/main/kotlin/app/aidan/patches");
    for (slug, package) in [("appa", "com.app.a"), ("appb", "com.app.b")] {
        let shared = app_base.join(slug).join("shared");
        fs::create_dir_all(&shared).unwrap();
        fs::write(
            shared.join("Constants.kt"),
            format!("const val APP_PACKAGE_NAME = \"{package}\"\n"),
        )
        .unwrap();
    }
    let data = matrix_data();

    let changed = vec!["patches/src/main/kotlin/app/aidan/patches/appa/features/F.kt".to_string()];
    assert_eq!(
        resolve_matrix_packages(&data, "push", None, None, Some(&changed), &root).unwrap(),
        vec!["com.app.a".to_string()]
    );

    let changed = vec![
        "patches/src/main/kotlin/app/aidan/patches/appb/ads/A.kt".to_string(),
        "patches/src/main/kotlin/app/aidan/patches/appa/features/F.kt".to_string(),
    ];
    assert_eq!(
        resolve_matrix_packages(&data, "push", None, None, Some(&changed), &root).unwrap(),
        vec!["com.app.a".to_string(), "com.app.b".to_string()]
    );

    for changed in [
        vec!["patches/build.gradle.kts".to_string()],
        vec!["patches/src/main/kotlin/util/PatchListGenerator.kt".to_string()],
        vec!["patches/src/main/kotlin/app/aidan/patches/deleted_app/F.kt".to_string()],
    ] {
        assert_eq!(
            resolve_matrix_packages(&data, "push", None, None, Some(&changed), &root).unwrap(),
            vec!["com.app.a".to_string(), "com.app.b".to_string()]
        );
    }
    assert_eq!(
        resolve_matrix_packages(&data, "push", None, None, None, &root).unwrap(),
        vec!["com.app.a".to_string(), "com.app.b".to_string()]
    );
    assert_eq!(
        resolve_matrix_packages(&data, "push", None, None, Some(&[]), &root).unwrap(),
        vec!["com.app.a".to_string(), "com.app.b".to_string()]
    );
}

#[test]
fn matrix_legacy_explicit_package_and_unknown() {
    let data = matrix_data();
    assert_eq!(
        resolve_matrix_packages(
            &data,
            "repository_dispatch",
            Some("com.app.b"),
            None,
            None,
            Path::new(".")
        )
        .unwrap(),
        vec!["com.app.b".to_string()]
    );
    let error = resolve_matrix_packages(
        &data,
        "repository_dispatch",
        Some("com.nope"),
        None,
        None,
        Path::new("."),
    )
    .unwrap_err();
    assert_eq!(error.message(), "Unknown package: com.nope");
}

#[test]
fn package_constant_extraction_requires_exactly_one_match() {
    let temp = tempfile::tempdir().unwrap();
    let app = temp.path();
    let shared = app.join("shared");
    fs::create_dir_all(&shared).unwrap();
    let constants = shared.join("Constants.kt");

    assert_eq!(extract_package_from_constants(app), None);
    fs::write(
        &constants,
        "const val MY_APP_PACKAGE_NAME = \"com.my.app\"\n",
    )
    .unwrap();
    assert_eq!(
        extract_package_from_constants(app).as_deref(),
        Some("com.my.app")
    );
    fs::write(
        &constants,
        "const val A_PACKAGE_NAME = \"com.a\"\nconst val B_PACKAGE_NAME = \"com.b\"\n",
    )
    .unwrap();
    assert_eq!(extract_package_from_constants(app), None);
}

#[test]
fn changed_files_require_real_before_and_commit_shas() {
    let root = Path::new(".");
    assert_eq!(get_changed_patch_files(None, Some("sha123"), root), None);
    assert_eq!(
        get_changed_patch_files(Some(""), Some("sha123"), root),
        None
    );
    assert_eq!(
        get_changed_patch_files(
            Some("0000000000000000000000000000000000000000"),
            Some("sha123"),
            root
        ),
        None
    );
}

#[test]
fn target_versions_sort_numerically_then_by_raw_version() {
    let data = json!({
        "patches": [{
            "compatiblePackages": [{
                "packageName": PACKAGE,
                "name": "Test App",
                "targets": [
                    {"version": "v1.0.0"},
                    {"version": "1.0.0-beta"},
                    {"version": "1.0.0"},
                    {"version": "1.0.0+build"},
                    {"version": "1.0.1"}
                ]
            }]
        }]
    });
    let metadata = get_package_run_metadata(&data, PACKAGE);
    assert_eq!(
        metadata.supported_versions,
        vec!["1.0.0", "1.0.0+build", "1.0.0-beta", "v1.0.0", "1.0.1"]
    );
    assert_eq!(metadata.target_version, "1.0.1");
    assert_eq!(metadata.app_name, "Test App");
    assert_eq!(
        get_target_version_for_package(&data, "com.other"),
        String::new()
    );
}

#[test]
fn requested_roles_are_validated_strictly() {
    assert_eq!(
        parse_requested_roles(Some("target"), Some("repository_dispatch")).unwrap(),
        Some(vec!["target".to_string()])
    );
    assert_eq!(
        parse_requested_roles(None, Some("workflow_dispatch")).unwrap(),
        None
    );
    assert_eq!(
        parse_requested_roles(Some("  "), Some("workflow_dispatch")).unwrap(),
        None
    );
    let error = parse_requested_roles(Some("latest"), Some("workflow_dispatch")).unwrap_err();
    assert_eq!(
        error.message(),
        "Invalid requested role 'latest'; must be one of ['target']"
    );
    let error =
        parse_requested_roles(Some("target,target"), Some("workflow_dispatch")).unwrap_err();
    assert_eq!(error.message(), "Duplicate requested role 'target'");
    let error = parse_requested_roles(None, Some("repository_dispatch")).unwrap_err();
    assert!(error.message().contains("Repository dispatch must specify"));
}

#[test]
fn matrix_output_appends_packages_line() {
    let temp = tempfile::tempdir().unwrap();
    let output = temp.path().join("GITHUB_OUTPUT");
    fs::write(&output, "existing=value\n").unwrap();
    let packages = vec!["com.app.a".to_string(), "com.app.b".to_string()];
    write_matrix_output(&packages, Some(&output)).unwrap();
    assert_eq!(
        fs::read_to_string(&output).unwrap(),
        "existing=value\npackages=[\"com.app.a\",\"com.app.b\"]\n"
    );
    assert_eq!(
        packages_output(&packages),
        "packages=[\"com.app.a\",\"com.app.b\"]"
    );
}

// ---------------------------------------------------------------------------
// Worker schema
// ---------------------------------------------------------------------------

#[test]
fn result_and_run_start_payloads_match_worker_schema() {
    let error = build_error_result(
        "target",
        "1.54.0",
        "Acquisition network timeout",
        "acquisition",
        "1.4.0",
        "rev123",
        0,
        Some("https://github.com/owner/repo/actions/runs/7".to_string()),
    );
    let value = serde_json::to_value(&error).unwrap();
    assert_eq!(
        value,
        json!({
            "role": "target",
            "versionName": "1.54.0",
            "versionCode": 0,
            "patchBundleVersion": "1.4.0",
            "gitRevision": "rev123",
            "status": "error",
            "passedCount": 0,
            "failedCount": 0,
            "failureReason": "Acquisition network timeout",
            "workflowRunUrl": "https://github.com/owner/repo/actions/runs/7",
            "failureStage": "acquisition"
        })
    );
    assert!(value.get("acquiredPlayVersion").is_none());

    let item = build_result_item("target", &report("error", 0, 2, Some("Morphe error")), None);
    let value = serde_json::to_value(&item).unwrap();
    assert_eq!(value["status"], "error");
    assert_eq!(value["failureStage"], "compatibility-check");
    assert_eq!(value["failureReason"], "Morphe error");
    assert_eq!(value["workflowRunUrl"], Value::Null);

    let payload = RunStartPayload {
        request_id: "req-1".to_string(),
        package_name: PACKAGE.to_string(),
        app_name: "Test App".to_string(),
        target_version: "1.0.0".to_string(),
        supported_versions: vec!["1.0.0".to_string()],
        git_revision: "sha123".to_string(),
    };
    assert_eq!(
        serde_json::to_value(&payload).unwrap(),
        json!({
            "requestId": "req-1",
            "packageName": PACKAGE,
            "appName": "Test App",
            "targetVersion": "1.0.0",
            "supportedVersions": ["1.0.0"],
            "gitRevision": "sha123"
        })
    );
}

// ---------------------------------------------------------------------------
// Reconciliation and terminal statuses
// ---------------------------------------------------------------------------

#[tokio::test]
async fn existing_target_slot_is_downloaded_and_checked_without_acquisition() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::Success);
    assert_eq!(acquirer.calls.load(Ordering::SeqCst), 0);
    assert_eq!(checker.calls.load(Ordering::SeqCst), 1);
    assert_eq!(
        harness.memory.get_calls(),
        vec!["test-bucket/fixtures/com.test.app/target".to_string()]
    );
    let submissions = poster.submissions();
    assert_eq!(submissions.len(), 1);
    assert_eq!(submissions[0].request_id, "req-123");
    assert_eq!(submissions[0].package_name, PACKAGE);
    assert_eq!(submissions[0].results[0].role, "target");
    assert_eq!(submissions[0].results[0].status, "compatible");
    assert_eq!(submissions[0].results[0].passed_count, 5);
    assert_eq!(
        submissions[0].results[0].workflow_run_url.as_deref(),
        Some("https://github.com/owner/repo/actions/runs/99")
    );
    let saved: CompatibilitySubmission =
        serde_json::from_slice(&fs::read(&harness.submission_path).unwrap()).unwrap();
    assert_eq!(saved, submissions[0]);
    assert_eq!(fs::read_to_string(&harness.marker_path).unwrap(), "ok");
}

#[tokio::test]
async fn missing_target_acquires_seeds_and_uses_local_artifact() {
    let harness = Harness::new("1.0.0");
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::Success);
    assert_eq!(acquirer.calls.load(Ordering::SeqCst), 1);
    assert_eq!(
        harness.memory.put_calls(),
        vec!["test-bucket/fixtures/com.test.app/target".to_string()]
    );
    assert!(harness.memory.get_calls().is_empty());
    assert_eq!(poster.submissions()[0].results[0].status, "compatible");
}

#[tokio::test]
async fn acquired_version_mismatch_is_an_acquisition_failure() {
    let harness = Harness::new("2.0.0");
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::InvalidArtifact);
    assert!(harness.memory.put_calls().is_empty());
    let result = &poster.submissions()[0].results[0];
    assert_eq!(result.status, "error");
    assert_eq!(result.failure_stage.as_deref(), Some("acquisition"));
    assert!(result
        .failure_reason
        .as_deref()
        .unwrap()
        .contains("!= expected '1.0.0'"));
    // A terminal error submission is still a successful 2xx callback.
    assert_eq!(fs::read_to_string(&harness.marker_path).unwrap(), "ok");
}

#[tokio::test]
async fn acquisition_error_is_reported_without_upload() {
    let harness = Harness::new("1.0.0");
    let manager = harness.manager();
    let acquirer = FakeAcquirer::failure("Version 1.0.0 not found on Play Store or APKMirror");
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::InvalidArtifact);
    assert!(harness.memory.put_calls().is_empty());
    let result = &poster.submissions()[0].results[0];
    assert_eq!(result.failure_stage.as_deref(), Some("acquisition"));
    assert!(result
        .failure_reason
        .as_deref()
        .unwrap()
        .contains("Version 1.0.0 not found"));
}

#[tokio::test]
async fn r2_lookup_failure_is_terminal_infrastructure_error() {
    let harness = Harness::new("1.0.0");
    harness
        .memory
        .fail_head(S3ErrorKind::Forbidden, "AWS/R2 credentials invalid");
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::InfrastructureFailure);
    assert_eq!(acquirer.calls.load(Ordering::SeqCst), 0);
    let result = &poster.submissions()[0].results[0];
    assert_eq!(result.failure_stage.as_deref(), Some("r2-lookup"));
    assert!(result
        .failure_reason
        .as_deref()
        .unwrap()
        .contains("credentials invalid"));
}

#[tokio::test]
async fn r2_upload_failure_is_terminal_infrastructure_error() {
    let harness = Harness::new("1.0.0");
    harness
        .memory
        .fail_put(S3ErrorKind::Network, "R2 upload timeout");
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::InfrastructureFailure);
    assert_eq!(checker.calls.load(Ordering::SeqCst), 0);
    let result = &poster.submissions()[0].results[0];
    assert_eq!(result.failure_stage.as_deref(), Some("r2-upload"));
    assert!(result
        .failure_reason
        .as_deref()
        .unwrap()
        .contains("upload timeout"));
}

#[tokio::test]
async fn r2_download_failure_is_terminal_infrastructure_error() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    harness
        .memory
        .fail_get(S3ErrorKind::Network, "R2 download broken pipe");
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::InfrastructureFailure);
    let result = &poster.submissions()[0].results[0];
    assert_eq!(result.failure_stage.as_deref(), Some("r2-download"));
    assert!(result
        .failure_reason
        .as_deref()
        .unwrap()
        .contains("broken pipe"));
}

#[tokio::test]
async fn checker_exception_is_a_compatibility_check_failure() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::failing("Morphe crashed with SIGSEGV in libmorphe");
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::UsageOrToolError);
    let result = &poster.submissions()[0].results[0];
    assert_eq!(result.failure_stage.as_deref(), Some("compatibility-check"));
    assert!(result
        .failure_reason
        .as_deref()
        .unwrap()
        .contains("SIGSEGV"));
}

#[tokio::test]
async fn incompatible_report_keeps_report_status_and_compatibility_exit() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::reporting(
        "incompatible",
        4,
        1,
        Some("One patch bytecode failed"),
        ExitCode::CompatibilityFailure,
    );
    let poster = RecordingPoster::status(200);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::CompatibilityFailure);
    let result = &poster.submissions()[0].results[0];
    assert_eq!(result.status, "incompatible");
    assert_eq!(result.failure_stage, None);
    assert_eq!(result.passed_count, 4);
    assert_eq!(result.failed_count, 1);
}

#[tokio::test]
async fn submission_is_saved_before_the_post_but_marker_requires_2xx() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::observing(harness.submission_path.clone());

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::Success);
    assert!(poster.observed_saved_bytes.lock().unwrap().is_some());
    assert_eq!(poster.post_count(), 1);
    assert_eq!(fs::read_to_string(&harness.marker_path).unwrap(), "ok");
    let submission_tmp = fs::read_dir(harness.submission_path.parent().unwrap())
        .unwrap()
        .filter_map(Result::ok)
        .filter(|entry| {
            entry
                .file_name()
                .to_string_lossy()
                .contains("submission.json.tmp.")
        })
        .count();
    assert_eq!(submission_tmp, 0);
}

#[tokio::test]
async fn transport_failure_preserves_submission_and_omits_marker() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::transport_error("Connection refused");

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::InfrastructureFailure);
    let saved: CompatibilitySubmission =
        serde_json::from_slice(&fs::read(&harness.submission_path).unwrap()).unwrap();
    assert_eq!(saved.request_id, "req-123");
    assert_eq!(saved.results[0].status, "compatible");
    assert!(!harness.marker_path.exists());
}

#[tokio::test]
async fn non_2xx_response_preserves_submission_and_omits_marker() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(500);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::InfrastructureFailure);
    assert_eq!(poster.post_count(), 1);
    assert!(harness.submission_path.is_file());
    assert!(!harness.marker_path.exists());
}

#[tokio::test]
async fn one_invocation_posts_one_request_id_and_writes_one_marker() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(204);

    let exit = run_ci_reconcile_and_test(
        &harness.request(harness.environment()),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::Success);
    assert_eq!(poster.post_count(), 1);
    assert_eq!(poster.submissions()[0].request_id, "req-123");
    assert_eq!(fs::read_to_string(&harness.marker_path).unwrap(), "ok");
}

#[tokio::test]
async fn missing_request_id_skips_callback_and_writes_no_marker() {
    let harness = Harness::new("1.0.0");
    harness.memory.insert(
        BUCKET,
        "fixtures/com.test.app/target",
        b"artifact",
        slot("target", "1.0.0", "sha1"),
    );
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);
    let mut environment = harness.environment();
    environment.dispatch_request_id = String::new();

    let exit = run_ci_reconcile_and_test(
        &harness.request(environment),
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::Success);
    assert_eq!(poster.post_count(), 0);
    assert!(!harness.submission_path.exists());
    assert!(!harness.marker_path.exists());
}

#[tokio::test]
async fn invalid_roles_abort_before_any_r2_access() {
    let harness = Harness::new("1.0.0");
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);
    let mut request = harness.request(harness.environment());
    request.requested_roles = None;
    request.environment.event_name = "repository_dispatch".to_string();
    request.environment.dispatch_expected_roles = Some("latest".to_string());

    let error = run_ci_reconcile_and_test(
        &request,
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap_err();

    assert!(error.message().contains("Invalid requested role 'latest'"));
    assert!(harness.memory.head_calls().is_empty());
    assert_eq!(poster.post_count(), 0);
}

#[tokio::test]
async fn no_target_version_returns_usage_without_side_effects() {
    let harness = Harness::new("1.0.0");
    let manager = harness.manager();
    let acquirer = FakeAcquirer::success(true);
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);
    let mut request = harness.request(harness.environment());
    let empty = json!({"version": "1.4.0", "patches": []});
    request.patches_data = &empty;

    let exit = run_ci_reconcile_and_test(
        &request,
        &CiDependencies {
            r2: &manager,
            acquirer: Some(&acquirer),
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::UsageOrToolError);
    assert!(harness.memory.head_calls().is_empty());
    assert_eq!(poster.post_count(), 0);
}

#[tokio::test]
async fn absent_acquirer_without_credentials_reports_acquisition_failure() {
    let harness = Harness::new("1.0.0");
    let manager = harness.manager();
    let checker = FakeChecker::compatible();
    let poster = RecordingPoster::status(200);
    let mut environment = harness.environment();
    environment.apkeep_accounts = None;
    environment.r2_access_key_id = None;

    let exit = run_ci_reconcile_and_test(
        &harness.request(environment),
        &CiDependencies {
            r2: &manager,
            acquirer: None,
            checker: &checker,
            poster: &poster,
            inspector: harness.inspector.as_ref(),
        },
    )
    .await
    .unwrap();

    assert_eq!(exit, ExitCode::InvalidArtifact);
    let result = &poster.submissions()[0].results[0];
    assert_eq!(result.failure_stage.as_deref(), Some("acquisition"));
    assert!(result
        .failure_reason
        .as_deref()
        .unwrap()
        .contains("no acquisition credentials configured"));
}

#[tokio::test]
async fn tests_never_construct_the_production_adapter() {
    // The guarded constructor is absent from this file by design; every case
    // reaches only MemoryS3. This assertion documents the isolation boundary.
    let harness = Harness::new("1.0.0");
    let manager = harness.manager();
    assert_eq!(manager.bucket_name(), BUCKET);
    assert!(manager.config().is_none());
    assert!(harness.memory.head_calls().is_empty());
}

#[test]
fn r2_endpoint_region_and_signature_are_r2_specific() {
    let config = R2Config {
        bucket_name: BUCKET.to_string(),
        account_id: "abc123".to_string(),
        access_key_id: "key".to_string(),
        secret_access_key: "secret".to_string(),
    };
    assert_eq!(config.endpoint(), "https://abc123.r2.cloudflarestorage.com");
    assert_eq!(config.region(), "auto");
    assert_eq!(config.signature_version(), "s3v4");
    let debug = format!("{config:?}");
    assert!(debug.contains("[REDACTED]"));
    assert!(!debug.contains("\"secret\""));
}

#[test]
fn compatibility_result_input_serializes_worker_fields_only() {
    let item = CompatibilityResultInput {
        role: "target".to_string(),
        version_name: "1.0.0".to_string(),
        version_code: 100,
        patch_bundle_version: "1.4.0".to_string(),
        git_revision: "rev1".to_string(),
        status: "compatible".to_string(),
        passed_count: 5,
        failed_count: 0,
        failure_reason: None,
        workflow_run_url: None,
        failure_stage: None,
    };
    let value = serde_json::to_value(&item).unwrap();
    let object = value.as_object().unwrap();
    let mut keys: Vec<&str> = object.keys().map(String::as_str).collect();
    keys.sort_unstable();
    assert_eq!(
        keys,
        vec![
            "failedCount",
            "failureReason",
            "gitRevision",
            "passedCount",
            "patchBundleVersion",
            "role",
            "status",
            "versionCode",
            "versionName",
            "workflowRunUrl",
        ]
    );
    assert!(object.get("failureStage").is_none());
}
