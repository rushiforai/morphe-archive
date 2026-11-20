from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum, IntEnum
from typing import Any, Literal


class ExitCode(IntEnum):
    SUCCESS = 0
    COMPATIBILITY_FAILURE = 1
    USAGE_OR_TOOL_ERROR = 2
    INVALID_ARTIFACT = 3
    INFRASTRUCTURE_FAILURE = 4
    RUNTIME_FAILURE = 5


class ContainerType(str, Enum):
    APK = "APK"
    APKM = "APKM"
    XAPK = "XAPK"
    APKS = "APKS"
    UNKNOWN = "UNKNOWN"


class ArtifactRole(str, Enum):
    TARGET = "target"
    LATEST = "latest"


@dataclass
class AndroidManifestInfo:
    package_name: str
    version_code: int
    version_name: str
    min_sdk_version: int | None = None
    target_sdk_version: int | None = None
    permissions: list[str] = field(default_factory=list)
    components: list[str] = field(default_factory=list)
    split_name: str | None = None


@dataclass
class MemberInfo:
    name: str
    size: int
    compressed_size: int
    crc: int
    sha256: str


@dataclass
class SplitInfo:
    filename: str
    split_name: str
    sha256: str
    size: int
    is_base: bool = False


@dataclass
class ArtifactInspection:
    file_path: str
    container_type: ContainerType
    file_size: int
    sha256: str
    package_name: str
    version_name: str
    version_code: int
    min_sdk: int | None = None
    target_sdk: int | None = None
    signing_certificate_sha256: str | None = None
    splits: list[SplitInfo] = field(default_factory=list)
    dex_classes_count: int = 0
    dex_methods_count: int = 0
    dex_files: list[str] = field(default_factory=list)
    native_libraries: list[str] = field(default_factory=list)
    resources: list[str] = field(default_factory=list)
    assets: list[str] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)

    def to_dict(self) -> dict[str, Any]:
        return {
            "filePath": self.file_path,
            "containerType": self.container_type.value,
            "fileSize": self.file_size,
            "sha256": self.sha256,
            "packageName": self.package_name,
            "versionName": self.version_name,
            "versionCode": self.version_code,
            "minSdk": self.min_sdk,
            "targetSdk": self.target_sdk,
            "signingCertificateSha256": self.signing_certificate_sha256,
            "splits": [
                {
                    "filename": s.filename,
                    "splitName": s.split_name,
                    "sha256": s.sha256,
                    "size": s.size,
                    "isBase": s.is_base,
                }
                for s in self.splits
            ],
            "dexClassesCount": self.dex_classes_count,
            "dexMethodsCount": self.dex_methods_count,
            "dexFiles": self.dex_files,
            "nativeLibraries": self.native_libraries,
            "resources": self.resources,
            "assets": self.assets,
            "warnings": self.warnings,
        }


@dataclass
class ArtifactComparison:
    old_inspection: ArtifactInspection
    new_inspection: ArtifactInspection
    version_changed: bool
    version_code_delta: int
    signer_changed: bool
    added_splits: list[str] = field(default_factory=list)
    removed_splits: list[str] = field(default_factory=list)
    modified_splits: list[str] = field(default_factory=list)
    added_permissions: list[str] = field(default_factory=list)
    removed_permissions: list[str] = field(default_factory=list)
    added_components: list[str] = field(default_factory=list)
    removed_components: list[str] = field(default_factory=list)
    dex_classes_delta: int = 0
    dex_methods_delta: int = 0
    added_native_libraries: list[str] = field(default_factory=list)
    removed_native_libraries: list[str] = field(default_factory=list)
    modified_native_libraries: list[str] = field(default_factory=list)
    added_assets: list[str] = field(default_factory=list)
    removed_assets: list[str] = field(default_factory=list)
    modified_assets: list[str] = field(default_factory=list)
    classes_diff: dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> dict[str, Any]:
        return {
            "old": self.old_inspection.to_dict(),
            "new": self.new_inspection.to_dict(),
            "versionChanged": self.version_changed,
            "versionCodeDelta": self.version_code_delta,
            "signerChanged": self.signer_changed,
            "addedSplits": self.added_splits,
            "removedSplits": self.removed_splits,
            "modifiedSplits": self.modified_splits,
            "addedPermissions": self.added_permissions,
            "removedPermissions": self.removed_permissions,
            "addedComponents": self.added_components,
            "removedComponents": self.removed_components,
            "dexClassesDelta": self.dex_classes_delta,
            "dexMethodsDelta": self.dex_methods_delta,
            "addedNativeLibraries": self.added_native_libraries,
            "removedNativeLibraries": self.removed_native_libraries,
            "modifiedNativeLibraries": self.modified_native_libraries,
            "addedAssets": self.added_assets,
            "removedAssets": self.removed_assets,
            "modifiedAssets": self.modified_assets,
            "classesDiff": self.classes_diff,
        }


@dataclass
class PatchTestCaseResult:
    patch_name: str
    options: dict[str, Any]
    success: bool
    error_message: str | None = None
    applied_patches: list[str] = field(default_factory=list)
    injected_classes: list[str] = field(default_factory=list)
    duration_seconds: float = 0.0

    def to_dict(self) -> dict[str, Any]:
        return {
            "patchName": self.patch_name,
            "options": self.options,
            "success": self.success,
            "errorMessage": self.error_message,
            "appliedPatches": self.applied_patches,
            "injectedClasses": self.injected_classes,
            "durationSeconds": round(self.duration_seconds, 2),
        }


@dataclass
class PatchCompatibilityReport:
    artifact_sha256: str
    package_name: str
    version_name: str
    version_code: int
    patch_bundle_version: str
    git_revision: str
    tool_versions: dict[str, str]
    overall_status: str  # "compatible" | "incompatible" | "error"
    total_cases: int
    passed_cases: int
    failed_cases: int
    test_cases: list[PatchTestCaseResult] = field(default_factory=list)
    failure_reason: str | None = None

    def to_dict(self) -> dict[str, Any]:
        return {
            "artifactSha256": self.artifact_sha256,
            "packageName": self.package_name,
            "versionName": self.version_name,
            "versionCode": self.version_code,
            "patchBundleVersion": self.patch_bundle_version,
            "gitRevision": self.git_revision,
            "toolVersions": self.tool_versions,
            "overallStatus": self.overall_status,
            "totalCases": self.total_cases,
            "passedCases": self.passed_cases,
            "failedCases": self.failed_cases,
            "testCases": [tc.to_dict() for tc in self.test_cases],
            "failureReason": self.failure_reason,
        }


@dataclass
class ToolCheckResult:
    name: str
    configured_version: str
    installed: bool
    actual_version: str | None = None
    executable_path: str | None = None
    error: str | None = None


@dataclass
class HostPrerequisiteResult:
    name: str
    satisfied: bool
    version_or_path: str | None = None
    error: str | None = None


@dataclass
class DoctorReport:
    all_ready: bool
    tools: list[ToolCheckResult] = field(default_factory=list)
    prerequisites: list[HostPrerequisiteResult] = field(default_factory=list)
    workspace_writable: bool = True
    ci_mode: bool = False
    credentials_present: dict[str, bool] = field(default_factory=dict)

    def to_dict(self) -> dict[str, Any]:
        return {
            "allReady": self.all_ready,
            "workspaceWritable": self.workspace_writable,
            "ciMode": self.ci_mode,
            "tools": [
                {
                    "name": t.name,
                    "configuredVersion": t.configured_version,
                    "installed": t.installed,
                    "actualVersion": t.actual_version,
                    "executablePath": t.executable_path,
                    "error": t.error,
                }
                for t in self.tools
            ],
            "prerequisites": [
                {
                    "name": p.name,
                    "satisfied": p.satisfied,
                    "versionOrPath": p.version_or_path,
                    "error": p.error,
                }
                for p in self.prerequisites
            ],
            "credentialsPresent": self.credentials_present,
        }


@dataclass
class DeployResult:
    output_apk: str
    package_name: str
    device_serial: str
    applied_patches: list[str]
    install_mode: Literal["reinstall", "clean-install"]
    launch_component: str | None = None

    def to_dict(self) -> dict[str, Any]:
        return {
            "outputApk": self.output_apk,
            "packageName": self.package_name,
            "deviceSerial": self.device_serial,
            "appliedPatches": list(self.applied_patches),
            "installMode": self.install_mode,
            "launchComponent": self.launch_component,
        }

    def format_human(self) -> str:
        lines = [
            f"Output APK: {self.output_apk}",
            f"Package: {self.package_name}",
            f"Device: {self.device_serial}",
            f"Install mode: {self.install_mode}",
            f"Applied patches: {', '.join(self.applied_patches) if self.applied_patches else 'none'}",
        ]
        if self.launch_component:
            lines.append(f"Launched: {self.launch_component}")
        return "\n".join(lines)


@dataclass
class ResourceMatch:
    container_member: str | None
    split_name: str
    package_name: str | None
    resource_id: str | None
    resource_type: str | None
    resource_name: str | None
    qualifier: str | None
    value: str | None
    path: str | None
    kind: Literal["resource", "asset", "library", "manifest"]
    morphe_mode: Literal["resourcePatch", "rawResourcePatch"]
    sha256: str | None
    duplicate_status: Literal["unique", "equivalent", "conflict"]

    def to_dict(self) -> dict[str, Any]:
        return {
            "containerMember": self.container_member,
            "splitName": self.split_name,
            "packageName": self.package_name,
            "resourceId": self.resource_id,
            "resourceType": self.resource_type,
            "resourceName": self.resource_name,
            "qualifier": self.qualifier,
            "value": self.value,
            "path": self.path,
            "kind": self.kind,
            "morpheMode": self.morphe_mode,
            "sha256": self.sha256,
            "duplicateStatus": self.duplicate_status,
        }


@dataclass
class ResourceQueryReport:
    query: str
    matches: list[ResourceMatch] = field(default_factory=list)
    extracted_paths: list[str] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)

    def to_dict(self) -> dict[str, Any]:
        return {
            "query": self.query,
            "matches": [m.to_dict() for m in self.matches],
            "extractedPaths": list(self.extracted_paths),
            "warnings": list(self.warnings),
        }

    def format_human(self) -> str:
        lines = [f"Found {len(self.matches)} matching resources:"]
        for m in self.matches:
            res_id = m.resource_id if m.resource_id is not None else "-"
            if m.resource_type and m.resource_name:
                type_name = f"{m.resource_type}/{m.resource_name}"
            elif m.resource_name:
                type_name = m.resource_name
            elif m.resource_type:
                type_name = m.resource_type
            else:
                type_name = "-"
            qualifier = m.qualifier if m.qualifier is not None else "-"
            split_path = f"{m.split_name}:{m.path}" if m.path is not None else "-"
            lines.append(
                f"{res_id} | {type_name} | {qualifier} | {split_path} | {m.morphe_mode} | {m.duplicate_status}"
            )
        if self.extracted_paths:
            lines.append(f"Extracted {len(self.extracted_paths)} files:")
            for ep in self.extracted_paths:
                lines.append(f"  {ep}")
        if self.warnings:
            for w in self.warnings:
                lines.append(f"Warning: {w}")
        return "\n".join(lines)


@dataclass(frozen=True)
class UiNode:
    text: str
    content_desc: str
    resource_id: str
    class_name: str
    clickable: bool
    bounds: tuple[int, int, int, int]  # left, top, right, bottom

    @property
    def center(self) -> tuple[int, int]:
        left, top, right, bottom = self.bounds
        return ((left + right) // 2, (top + bottom) // 2)

    def matches(
        self,
        *,
        text: str | None = None,
        desc: str | None = None,
        resource_id: str | None = None,
    ) -> bool:
        if text and text.lower() not in self.text.lower():
            return False
        if desc and desc.lower() not in self.content_desc.lower():
            return False
        return not (resource_id and resource_id.lower() not in self.resource_id.lower())

    def to_dict(self) -> dict[str, Any]:
        return {
            "text": self.text,
            "contentDesc": self.content_desc,
            "resourceId": self.resource_id,
            "className": self.class_name,
            "clickable": self.clickable,
            "bounds": list(self.bounds),
            "center": list(self.center),
        }
