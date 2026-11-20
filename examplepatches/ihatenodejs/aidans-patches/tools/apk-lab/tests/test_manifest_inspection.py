from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from unittest.mock import patch

import pytest
from apk_lab.cli import handle_manifest, main
from apk_lab.manifest_inspection import (
    ManifestComponent,
    inspect_artifact_components,
    parse_manifest_xmltree,
)
from apk_lab.models import ExitCode

MOCK_XMLTREE = """N: android=http://schemas.android.com/apk/res/android (line=2)
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
"""


def test_parse_manifest_xmltree_components():
    components = parse_manifest_xmltree(MOCK_XMLTREE)
    assert len(components) == 4

    # Activity
    act = components[0]
    assert act.component_type == "activity"
    assert act.name == "com.example.testapp.MainActivity"
    assert act.exported is True
    assert "android.intent.action.MAIN" in act.intent_actions

    # Service
    srv = components[1]
    assert srv.component_type == "service"
    assert srv.name == "com.example.testapp.SyncService"
    assert srv.exported is False
    assert srv.permission == "android.permission.BIND_JOB_SERVICE"
    assert srv.intent_actions == []

    # Receiver
    rcv = components[2]
    assert rcv.component_type == "receiver"
    assert rcv.name == "com.example.testapp.BootReceiver"
    assert rcv.exported is True
    assert "android.intent.action.BOOT_COMPLETED" in rcv.intent_actions

    # Provider
    prv = components[3]
    assert prv.component_type == "provider"
    assert prv.name == "com.example.testapp.FileProvider"
    assert prv.exported is False
    assert prv.authorities == "com.example.testapp.fileprovider"


def test_parse_manifest_xmltree_empty():
    assert parse_manifest_xmltree("") == []


def test_manifest_component_filtering():
    components = parse_manifest_xmltree(MOCK_XMLTREE)

    # Filter by type
    providers = [c for c in components if c.component_type == "provider"]
    assert len(providers) == 1
    assert providers[0].name == "com.example.testapp.FileProvider"

    activities = [c for c in components if c.component_type == "activity"]
    assert len(activities) == 1
    assert activities[0].name == "com.example.testapp.MainActivity"

    # Filter by name regex
    pat = re.compile(r"Receiver|Service", re.IGNORECASE)
    matched = [c for c in components if pat.search(c.name)]
    assert len(matched) == 2
    assert {c.name for c in matched} == {
        "com.example.testapp.SyncService",
        "com.example.testapp.BootReceiver",
    }


def test_handle_manifest_stdout(capsys):
    args = argparse.Namespace(
        artifact="dummy.apk",
        type=None,
        filter="MainActivity",
        json=None,
    )
    mock_comps = [
        ManifestComponent(
            component_type="activity",
            name="com.example.MainActivity",
            exported=True,
            intent_actions=["android.intent.action.MAIN"],
        )
    ]
    with patch(
        "apk_lab.manifest_inspection.inspect_artifact_components",
        return_value=mock_comps,
    ):
        code = handle_manifest(args)
        assert code == ExitCode.SUCCESS

    captured = capsys.readouterr()
    assert (
        "[ACTIVITY] com.example.MainActivity [exported=True] (actions: android.intent.action.MAIN)"
        in captured.out
    )


def test_handle_manifest_json_stdout(capsys):
    args = argparse.Namespace(
        artifact="dummy.apk",
        type="service",
        filter=None,
        json="-",
    )
    mock_comps = [
        ManifestComponent(
            component_type="service",
            name="com.example.TestService",
            exported=False,
            permission="android.permission.BIND",
        )
    ]
    with patch(
        "apk_lab.manifest_inspection.inspect_artifact_components",
        return_value=mock_comps,
    ):
        code = handle_manifest(args)
        assert code == ExitCode.SUCCESS

    captured = capsys.readouterr()
    data = json.loads(captured.out)
    assert len(data) == 1
    assert data[0]["type"] == "service"
    assert data[0]["name"] == "com.example.TestService"
    assert data[0]["exported"] is False
    assert data[0]["permission"] == "android.permission.BIND"


def test_handle_manifest_json_file(tmp_path):
    out_file = tmp_path / "manifest.json"
    args = argparse.Namespace(
        artifact="dummy.apk",
        type="provider",
        filter=None,
        json=str(out_file),
    )
    mock_comps = [
        ManifestComponent(
            component_type="provider",
            name="com.example.Provider",
            authorities="com.example.auth",
        )
    ]
    with patch(
        "apk_lab.manifest_inspection.inspect_artifact_components",
        return_value=mock_comps,
    ):
        code = handle_manifest(args)
        assert code == ExitCode.SUCCESS

    assert out_file.exists()
    data = json.loads(out_file.read_text(encoding="utf-8"))
    assert len(data) == 1
    assert data[0]["authorities"] == "com.example.auth"


def test_cli_manifest_help(capsys):
    with pytest.raises(SystemExit) as exc_info:
        main(["manifest", "--help"])
    assert exc_info.value.code == 0
    captured = capsys.readouterr()
    assert "usage: apk-lab manifest" in captured.out
    assert "--type" in captured.out
    assert "--filter" in captured.out
    assert "--json" in captured.out


def test_inspect_artifact_components_integration():
    sample_apkm = Path("apk/com.adobe.scan.android.apkm")
    if not sample_apkm.exists():
        pytest.skip("Test artifact apk/com.adobe.scan.android.apkm not present")

    components = inspect_artifact_components(sample_apkm, component_type="provider")
    assert len(components) > 0
    names = [c.name for c in components]
    assert any("ScanDocumentProvider" in n for n in names)


def test_parse_manifest_xmltree_activity_alias_ignored():
    xml = """N: android=http://schemas.android.com/apk/res/android (line=2)
  E: manifest (line=2)
    E: application (line=10)
      E: activity-alias (line=12)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.AliasActivity" (Raw: "com.example.testapp.AliasActivity")
        A: http://schemas.android.com/apk/res/android:targetActivity(0x01010202)="com.example.testapp.MainActivity" (Raw: "com.example.testapp.MainActivity")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true
"""
    components = parse_manifest_xmltree(xml)
    assert len(components) == 0


def test_parse_manifest_xmltree_child_metadata_does_not_overwrite_exported():
    xml = """N: android=http://schemas.android.com/apk/res/android (line=2)
  E: manifest (line=2)
    E: application (line=10)
      E: activity (line=12)
        A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.testapp.MainActivity" (Raw: "com.example.testapp.MainActivity")
        A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true
        E: meta-data (line=14)
          A: http://schemas.android.com/apk/res/android:name(0x01010003)="foo" (Raw: "foo")
          A: http://schemas.android.com/apk/res/android:exported(0x01010010)=false
"""
    components = parse_manifest_xmltree(xml)
    assert len(components) == 1
    assert components[0].name == "com.example.testapp.MainActivity"
    assert components[0].exported is True


def test_parse_manifest_xmltree_queries_action_does_not_leak_into_activity():
    xml = """N: android=http://schemas.android.com/apk/res/android (line=2)
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
"""
    components = parse_manifest_xmltree(xml)
    assert len(components) == 1
    assert components[0].name == "com.example.testapp.MainActivity"
    assert components[0].intent_actions == ["android.intent.action.MAIN"]
