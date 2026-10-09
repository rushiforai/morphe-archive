from __future__ import annotations

import os
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

import boto3
from botocore.client import Config
from botocore.exceptions import ClientError

from apk_lab.inspection import inspect_artifact
from apk_lab.models import ExitCode

BUCKET_NAME = os.environ.get("R2_BUCKET_NAME", "aidans-patches-apk-fixtures")


class FixtureError(Exception):
    def __init__(
        self, message: str, exit_code: ExitCode = ExitCode.INFRASTRUCTURE_FAILURE
    ):
        super().__init__(message)
        self.exit_code = exit_code


@dataclass
class SlotMetadata:
    role: str
    package_name: str
    version_name: str
    version_code: int
    container_type: str
    sha256: str
    signer_sha256: str | None
    size_bytes: int
    acquisition_source: str
    timestamp: str

    def to_s3_metadata(self) -> dict[str, str]:
        return {
            "role": self.role,
            "package-name": self.package_name,
            "version-name": self.version_name,
            "version-code": str(self.version_code),
            "container-type": self.container_type,
            "sha256": self.sha256,
            "signer-sha256": self.signer_sha256 or "",
            "size-bytes": str(self.size_bytes),
            "acquisition-source": self.acquisition_source,
            "timestamp": self.timestamp,
        }

    @classmethod
    def from_s3_metadata(cls, meta: dict[str, str]) -> SlotMetadata:
        return cls(
            role=meta.get("role", "unknown"),
            package_name=meta.get("package-name", ""),
            version_name=meta.get("version-name", ""),
            version_code=int(meta.get("version-code", 0)),
            container_type=meta.get("container-type", "APKM"),
            sha256=meta.get("sha256", ""),
            signer_sha256=meta.get("signer-sha256") or None,
            size_bytes=int(meta.get("size-bytes", 0)),
            acquisition_source=meta.get("acquisition-source", "unknown"),
            timestamp=meta.get("timestamp", ""),
        )


class R2FixtureManager:
    def __init__(
        self,
        bucket_name: str = BUCKET_NAME,
        account_id: str | None = None,
        access_key_id: str | None = None,
        secret_access_key: str | None = None,
        s3_client: Any | None = None,
    ):
        self.bucket_name = bucket_name
        self.account_id = account_id or os.environ.get("R2_ACCOUNT_ID")
        self.access_key_id = access_key_id or os.environ.get("R2_ACCESS_KEY_ID")
        self.secret_access_key = secret_access_key or os.environ.get(
            "R2_SECRET_ACCESS_KEY"
        )

        if s3_client:
            self.s3 = s3_client
        else:
            if (
                not self.account_id
                or not self.access_key_id
                or not self.secret_access_key
            ):
                self.s3 = None
            else:
                endpoint_url = f"https://{self.account_id}.r2.cloudflarestorage.com"
                self.s3 = boto3.client(
                    "s3",
                    endpoint_url=endpoint_url,
                    aws_access_key_id=self.access_key_id,
                    aws_secret_access_key=self.secret_access_key,
                    region_name="auto",
                    config=Config(signature_version="s3v4"),
                )

    def _require_s3(self) -> Any:
        if not self.s3:
            raise FixtureError(
                "R2 credentials (R2_ACCOUNT_ID, R2_ACCESS_KEY_ID, R2_SECRET_ACCESS_KEY) not configured",
                ExitCode.USAGE_OR_TOOL_ERROR,
            )
        return self.s3

    def get_slot_key(self, package: str, role: str) -> str:
        return f"fixtures/{package}/{role}"

    def get_slot_metadata(self, package: str, role: str) -> SlotMetadata | None:
        """Gets metadata for a fixture slot in R2, or None if not found."""
        s3 = self._require_s3()
        key = self.get_slot_key(package, role)
        try:
            head = s3.head_object(Bucket=self.bucket_name, Key=key)
            meta = head.get("Metadata", {})
            return SlotMetadata.from_s3_metadata(meta)
        except ClientError as e:
            code = e.response.get("Error", {}).get("Code")
            if code in ("404", "NoSuchKey", "NotFound"):
                return None
            raise FixtureError(f"Failed to check R2 slot {key}: {e}") from e

    def download_slot(self, package: str, role: str, dest_path: Path | str) -> Path:
        """Downloads a slot object to local disk."""
        s3 = self._require_s3()
        dest = Path(dest_path).resolve()
        dest.parent.mkdir(parents=True, exist_ok=True)

        key = self.get_slot_key(package, role)
        try:
            s3.download_file(self.bucket_name, key, str(dest))
            return dest
        except ClientError as e:
            raise FixtureError(f"Failed to download R2 slot {key}: {e}") from e

    def upload_slot(
        self,
        package: str,
        role: str,
        artifact_path: Path | str,
        metadata: SlotMetadata,
    ) -> None:
        """Uploads an artifact to a slot with S3 metadata using multipart upload."""
        s3 = self._require_s3()
        path = Path(artifact_path).resolve()
        key = self.get_slot_key(package, role)

        extra_args = {
            "Metadata": metadata.to_s3_metadata(),
            "ContentType": "application/vnd.android.package-archive",
        }

        try:
            s3.upload_file(str(path), self.bucket_name, key, ExtraArgs=extra_args)
        except ClientError as e:
            raise FixtureError(f"Failed to upload R2 slot {key}: {e}") from e

    def copy_slot(self, package: str, src_role: str, dst_role: str) -> None:
        """Copies an R2 slot object from src_role to dst_role preserving metadata."""
        s3 = self._require_s3()
        src_key = self.get_slot_key(package, src_role)
        dst_key = self.get_slot_key(package, dst_role)

        try:
            head = s3.head_object(Bucket=self.bucket_name, Key=src_key)
            meta = head.get("Metadata", {})
            meta["role"] = dst_role

            copy_source = {"Bucket": self.bucket_name, "Key": src_key}
            s3.copy_object(
                Bucket=self.bucket_name,
                CopySource=copy_source,
                Key=dst_key,
                Metadata=meta,
                MetadataDirective="REPLACE",
            )
        except ClientError as e:
            raise FixtureError(
                f"Failed to copy R2 slot {src_key} -> {dst_key}: {e}"
            ) from e

    def delete_slot(self, package: str, role: str) -> None:
        """Deletes a slot object in R2."""
        s3 = self._require_s3()
        key = self.get_slot_key(package, role)
        try:
            s3.delete_object(Bucket=self.bucket_name, Key=key)
        except ClientError as e:
            raise FixtureError(f"Failed to delete R2 slot {key}: {e}") from e

    def seed_fixture(
        self, package: str, role: str, artifact_path: Path | str
    ) -> SlotMetadata:
        """Seeds a fixture slot directly from a local valid artifact."""
        path = Path(artifact_path).resolve()
        inspection = inspect_artifact(path)

        if inspection.package_name != package:
            raise FixtureError(
                f"Artifact package '{inspection.package_name}' != requested '{package}'",
                ExitCode.INVALID_ARTIFACT,
            )

        metadata = SlotMetadata(
            role=role,
            package_name=package,
            version_name=inspection.version_name,
            version_code=inspection.version_code,
            container_type=inspection.container_type.value,
            sha256=inspection.sha256,
            signer_sha256=inspection.signing_certificate_sha256,
            size_bytes=inspection.file_size,
            acquisition_source="manual",
            timestamp=datetime.now(timezone.utc).isoformat(),
        )

        self.upload_slot(package, role, path, metadata)
        return metadata

    def rotate_slots_on_new_latest(
        self,
        package: str,
        new_latest_path: Path | str,
        desired_target_version: str,
        source: str = "apkeep",
    ) -> tuple[SlotMetadata, SlotMetadata | None]:
        """Safely rotates slots when a new latest artifact is acquired."""
        path = Path(new_latest_path).resolve()
        new_insp = inspect_artifact(path)
        if new_insp.package_name != package:
            raise FixtureError(
                f"Artifact package '{new_insp.package_name}' != requested '{package}'",
                ExitCode.INVALID_ARTIFACT,
            )

        new_meta = SlotMetadata(
            role="latest",
            package_name=package,
            version_name=new_insp.version_name,
            version_code=new_insp.version_code,
            container_type=new_insp.container_type.value,
            sha256=new_insp.sha256,
            signer_sha256=new_insp.signing_certificate_sha256,
            size_bytes=new_insp.file_size,
            acquisition_source=source,
            timestamp=datetime.now(timezone.utc).isoformat(),
        )

        current_latest_meta = self.get_slot_metadata(package, "latest")
        current_target_meta = self.get_slot_metadata(package, "target")

        # 1. If target matches current latest and latest is about to diverge:
        # copy current latest to target before uploading new latest
        if (
            current_latest_meta
            and current_latest_meta.version_name == desired_target_version
            and (
                current_latest_meta.version_name != new_insp.version_name
                or current_latest_meta.sha256 != new_insp.sha256
            )
        ):
            self.copy_slot(package, "latest", "target")
            current_target_meta = self.get_slot_metadata(package, "target")

        # 2. Upload new latest
        self.upload_slot(package, "latest", path, new_meta)

        # 3. If target and latest now have same version & sha256, remove obsolete target slot
        if (
            current_target_meta
            and current_target_meta.version_name == new_insp.version_name
            and current_target_meta.sha256 == new_insp.sha256
        ):
            self.delete_slot(package, "target")
            current_target_meta = None

        return new_meta, current_target_meta
