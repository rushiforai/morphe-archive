from unittest.mock import MagicMock

from apk_lab.fixtures import R2FixtureManager, SlotMetadata


def test_slot_metadata_s3_conversion():
    meta = SlotMetadata(
        role="latest",
        package_name="com.ashtoncofer.Buzz",
        version_name="1.54.0",
        version_code=400032,
        container_type="APKM",
        sha256="abc123sha",
        signer_sha256="signer123",
        size_bytes=50000000,
        acquisition_source="apkeep",
        timestamp="2026-10-06T00:00:00Z",
    )

    s3_meta = meta.to_s3_metadata()
    assert s3_meta["role"] == "latest"
    assert s3_meta["package-name"] == "com.ashtoncofer.Buzz"
    assert s3_meta["version-code"] == "400032"

    restored = SlotMetadata.from_s3_metadata(s3_meta)
    assert restored.package_name == meta.package_name
    assert restored.version_name == meta.version_name
    assert restored.version_code == meta.version_code
    assert restored.sha256 == meta.sha256
    assert restored.signer_sha256 == meta.signer_sha256


def test_mock_s3_slot_operations():
    mock_s3 = MagicMock()
    mgr = R2FixtureManager(bucket_name="test-bucket", s3_client=mock_s3)

    mock_s3.head_object.return_value = {
        "Metadata": {
            "role": "latest",
            "package-name": "com.test.app",
            "version-name": "2.0.0",
            "version-code": "200",
            "container-type": "APKM",
            "sha256": "sha200",
            "size-bytes": "1000",
            "acquisition-source": "apkeep",
            "timestamp": "2026-10-06T00:00:00Z",
        }
    }

    meta = mgr.get_slot_metadata("com.test.app", "latest")
    assert meta is not None
    assert meta.version_name == "2.0.0"
    assert meta.version_code == 200

    mgr.delete_slot("com.test.app", "target")
    mock_s3.delete_object.assert_called_once_with(
        Bucket="test-bucket",
        Key="fixtures/com.test.app/target",
    )


def test_rotate_slots_package_mismatch_rejected(monkeypatch, tmp_path):
    import pytest
    from apk_lab.fixtures import FixtureError
    from apk_lab.models import ArtifactInspection, ContainerType

    mock_s3 = MagicMock()
    mgr = R2FixtureManager(bucket_name="test-bucket", s3_client=mock_s3)

    fake_apk = tmp_path / "fake.apkm"
    fake_apk.write_bytes(b"dummy")

    # Mock inspection to return a different package
    def mock_inspect(path):
        return ArtifactInspection(
            file_path=str(path),
            container_type=ContainerType.APKM,
            file_size=1000,
            sha256="abc",
            package_name="com.different.package",
            version_name="1.0.0",
            version_code=100,
        )

    monkeypatch.setattr("apk_lab.fixtures.inspect_artifact", mock_inspect)

    with pytest.raises(
        FixtureError,
        match="Artifact package 'com.different.package' != requested 'com.expected.app'",
    ):
        mgr.rotate_slots_on_new_latest("com.expected.app", fake_apk, "1.0.0")

    # No S3 method should have been called
    mock_s3.upload_file.assert_not_called()
    mock_s3.copy_object.assert_not_called()
    mock_s3.head_object.assert_not_called()
    mock_s3.delete_object.assert_not_called()
