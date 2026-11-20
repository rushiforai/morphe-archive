from __future__ import annotations

import os
import subprocess
from pathlib import Path
from unittest.mock import MagicMock

import pytest
from apk_lab.deployment import (
    MORPHE_KEYSTORE_SHA256,
    deploy_artifact,
    ensure_debug_keystore,
    find_app_artifact,
    is_derivative_artifact_name,
    resolve_signing_keystore,
    zipalign_and_sign,
)
from apk_lab.inspection import ArtifactInspection
from apk_lab.models import ContainerType
from apk_lab.morphe import (
    PatchDef,
    PatchOptionDef,
    PatchSelection,
    build_morphe_patch_set_cmd,
    resolve_patch_selections,
)


def test_ensure_debug_keystore_creates_keystore(tmp_path, monkeypatch):
    ks_path = tmp_path / "sub" / "debug.keystore"
    mock_run = MagicMock(return_value=subprocess.CompletedProcess([], 0, "", ""))
    monkeypatch.setattr(subprocess, "run", mock_run)

    # When keytool runs, pretend it creates the file
    def fake_keytool(cmd, **kwargs):
        ks_path.write_bytes(b"fake_keystore_bytes")
        return subprocess.CompletedProcess(cmd, 0, "", "")

    monkeypatch.setattr(subprocess, "run", fake_keytool)

    out = ensure_debug_keystore(ks_path)
    assert out == ks_path.resolve()
    assert ks_path.is_file()
    # Check permissions
    assert (ks_path.stat().st_mode & 0o777) == 0o600


def test_ensure_debug_keystore_existing_not_overwritten(tmp_path, monkeypatch):
    ks_path = tmp_path / "debug.keystore"
    ks_path.write_bytes(b"existing_key")
    mock_run = MagicMock()
    monkeypatch.setattr(subprocess, "run", mock_run)

    out = ensure_debug_keystore(ks_path)
    assert out == ks_path.resolve()
    assert ks_path.read_bytes() == b"existing_key"
    mock_run.assert_not_called()


def test_zipalign_and_sign(tmp_path, monkeypatch):
    unsigned = tmp_path / "unsigned.apk"
    unsigned.write_bytes(b"unsigned")
    aligned = tmp_path / "aligned.apk"
    ks = tmp_path / "debug.keystore"
    ks.write_bytes(b"keystore")

    commands: list[list[str]] = []

    def fake_run(cmd, **kwargs):
        commands.append(cmd)
        return subprocess.CompletedProcess(cmd, 0, "", "")

    monkeypatch.setattr(subprocess, "run", fake_run)
    monkeypatch.setattr(
        "apk_lab.deployment.find_build_tools_bin", lambda name: Path(f"/sdk/bin/{name}")
    )
    monkeypatch.setattr("apk_lab.deployment.ensure_debug_keystore", lambda path: ks)

    zipalign_and_sign(unsigned, aligned, keystore_path=ks)

    assert len(commands) == 3
    # 1. zipalign
    assert commands[0][0] == "/sdk/bin/zipalign"
    assert commands[0][1:3] == ["-f", "4"]
    # 2. apksigner sign
    assert commands[1][0] == "/sdk/bin/apksigner"
    assert commands[1][1] == "sign"
    assert "--ks" in commands[1]
    # 3. apksigner verify
    assert commands[2][0] == "/sdk/bin/apksigner"
    assert commands[2][1] == "verify"


def test_resolve_patch_selections_all_defaults():
    data = {
        "patches": [
            {
                "name": "PatchA",
                "default": True,
                "dependencies": [],
                "compatiblePackages": [{"packageName": "com.test.app"}],
                "options": [],
            },
            {
                "name": "PatchB",
                "default": False,
                "dependencies": [],
                "compatiblePackages": [{"packageName": "com.test.app"}],
                "options": [],
            },
            {
                "name": "PatchC",
                "default": True,
                "dependencies": [],
                "compatiblePackages": [{"packageName": "com.other.app"}],
                "options": [],
            },
        ]
    }
    selections = resolve_patch_selections(
        package_name="com.test.app",
        requested_patches=None,
        all_defaults=True,
        raw_options=None,
        patches_list_data=data,
    )
    assert len(selections) == 1
    assert selections[0].definition.name == "PatchA"


def test_resolve_patch_selections_transitive_dependencies():
    data = {
        "patches": [
            {
                "name": "PatchDep",
                "default": False,
                "dependencies": [],
                "compatiblePackages": [{"packageName": "com.test.app"}],
                "options": [],
            },
            {
                "name": "PatchMain",
                "default": False,
                "dependencies": ["PatchDep"],
                "compatiblePackages": [{"packageName": "com.test.app"}],
                "options": [],
            },
        ]
    }
    selections = resolve_patch_selections(
        package_name="com.test.app",
        requested_patches=["PatchMain"],
        all_defaults=False,
        raw_options=None,
        patches_list_data=data,
    )
    # Metadata order preserved: PatchDep, PatchMain
    assert [s.definition.name for s in selections] == ["PatchDep", "PatchMain"]


def test_resolve_patch_selections_dependency_cycle_rejected():
    data = {
        "patches": [
            {
                "name": "Patch1",
                "default": True,
                "dependencies": ["Patch2"],
                "compatiblePackages": [{"packageName": "com.test.app"}],
                "options": [],
            },
            {
                "name": "Patch2",
                "default": True,
                "dependencies": ["Patch1"],
                "compatiblePackages": [{"packageName": "com.test.app"}],
                "options": [],
            },
        ]
    }
    with pytest.raises(ValueError, match="Circular dependency detected"):
        resolve_patch_selections(
            package_name="com.test.app",
            requested_patches=None,
            all_defaults=True,
            raw_options=None,
            patches_list_data=data,
        )


def test_resolve_patch_selections_typed_options():
    data = {
        "patches": [
            {
                "name": "ThePatch",
                "default": True,
                "dependencies": [],
                "compatiblePackages": [{"packageName": "com.test.app"}],
                "options": [
                    {
                        "key": "boolOpt",
                        "type": "Boolean",
                        "default": False,
                    },
                    {
                        "key": "strOpt",
                        "type": "String",
                        "default": "initial",
                    },
                ],
            }
        ]
    }
    # Valid options
    selections = resolve_patch_selections(
        package_name="com.test.app",
        requested_patches=None,
        all_defaults=True,
        raw_options=["boolOpt=true", "strOpt=custom_string"],
        patches_list_data=data,
    )
    assert selections[0].options["boolOpt"] is True
    assert selections[0].options["strOpt"] == "custom_string"

    # Invalid boolean
    with pytest.raises(ValueError, match="Invalid boolean value 'yes'"):
        resolve_patch_selections(
            package_name="com.test.app",
            requested_patches=None,
            all_defaults=True,
            raw_options=["boolOpt=yes"],
            patches_list_data=data,
        )

    # Unknown option
    with pytest.raises(ValueError, match="Unknown patch option 'unknownOpt'"):
        resolve_patch_selections(
            package_name="com.test.app",
            requested_patches=None,
            all_defaults=True,
            raw_options=["unknownOpt=val"],
            patches_list_data=data,
        )


def test_build_morphe_patch_set_cmd_ordering():
    p1 = PatchSelection(
        definition=PatchDef(
            "PatchA",
            "",
            True,
            [],
            [PatchOptionDef("k1", "", "", False, "v1", "String")],
        ),
        options={"k1": "v1"},
    )
    p2 = PatchSelection(
        definition=PatchDef("PatchB", "", True, [], []),
        options={},
    )
    cmd = build_morphe_patch_set_cmd(
        mpp_path="patches.mpp",
        selections=[p1, p2],
        artifact_path="in.apk",
        out_apk="out.apk",
        result_json="res.json",
        scratch_dir="scratch",
    )
    # Options for PatchA precede -e PatchA
    idx_k1 = cmd.index("-O")
    assert cmd[idx_k1 + 1] == "k1=v1"
    idx_ea = cmd.index("-e")
    assert cmd[idx_ea + 1] == "PatchA"
    assert idx_k1 < idx_ea

    # PatchB follows
    assert cmd.count("-e") == 2
    assert cmd[idx_ea + 2 :] == [
        "-e",
        "PatchB",
        "--unsigned",
        "-t",
        str(Path("scratch").resolve()),
        "-o",
        str(Path("out.apk").resolve()),
        "-r",
        str(Path("res.json").resolve()),
        str(Path("in.apk").resolve()),
    ]


def test_deploy_artifact_preserves_existing_output_on_pre_replace_failure(
    tmp_path, monkeypatch
):
    out_dir = tmp_path / "build"
    out_dir.mkdir()
    final_output = out_dir / "target-patched.apk"
    final_output.write_bytes(b"ORIGINAL_FILE_BYTES")

    in_apk = tmp_path / "input.apk"
    in_apk.write_bytes(b"INPUT_BYTES")

    # Mock patches-list.json
    monkeypatch.setattr(
        "apk_lab.deployment.load_patches_list",
        lambda: {
            "patches": [
                {
                    "name": "P1",
                    "default": True,
                    "dependencies": [],
                    "compatiblePackages": [{"packageName": "com.test.app"}],
                    "options": [],
                }
            ]
        },
    )

    # Mock ADB client
    mock_client = MagicMock()
    mock_client.run.return_value = subprocess.CompletedProcess(
        [], 0, "List of devices attached\nemulator-5554\tdevice\n", ""
    )

    # Mock Morphe apply_patch_set to fail
    def fail_apply(*args, **kwargs):
        raise RuntimeError("Morphe failed during compilation")

    monkeypatch.setattr("apk_lab.deployment.apply_patch_set", fail_apply)

    with pytest.raises(RuntimeError, match="Morphe failed during compilation"):
        deploy_artifact(
            artifact_path=in_apk,
            mpp_path=tmp_path / "p.mpp",
            package_name="com.test.app",
            all_defaults=True,
            enabled_patches=[],
            raw_options=[],
            out_apk_path=final_output,
            adb_client=mock_client,
        )

    # Final output must be untouched byte-for-byte!
    assert final_output.read_bytes() == b"ORIGINAL_FILE_BYTES"


def test_deploy_artifact_install_reinstall_vs_clean_install(tmp_path, monkeypatch):
    in_apk = tmp_path / "in.apk"
    in_apk.write_bytes(b"INPUT")
    final_apk = tmp_path / "out.apk"

    monkeypatch.setattr(
        "apk_lab.deployment.load_patches_list",
        lambda: {
            "patches": [
                {
                    "name": "P1",
                    "default": True,
                    "dependencies": [],
                    "compatiblePackages": [{"packageName": "com.test.app"}],
                    "options": [],
                }
            ]
        },
    )

    mock_client = MagicMock()
    # Devices list
    mock_client.run.side_effect = [
        subprocess.CompletedProcess(
            [], 0, "List of devices attached\nemulator-5554\tdevice\n", ""
        ),  # devices
        subprocess.CompletedProcess([], 0, "Success\n", ""),  # install
    ]

    monkeypatch.setattr("apk_lab.deployment.apply_patch_set", lambda **kw: ["P1"])
    monkeypatch.setattr(
        "apk_lab.deployment.zipalign_and_sign",
        lambda unsigned_apk, aligned_and_signed_apk, **kw: (
            aligned_and_signed_apk.write_bytes(b"ALIGNED")
        ),
    )

    # Mock inspect_artifact on staged signed APK
    fake_inspection = ArtifactInspection(
        file_path=str(final_apk),
        container_type=ContainerType.APK,
        file_size=100,
        sha256="sha",
        package_name="com.test.app",
        version_name="1.0",
        version_code=1,
    )
    monkeypatch.setattr(
        "apk_lab.deployment.inspect_artifact", lambda path: fake_inspection
    )

    # Run default install (reinstall)
    res = deploy_artifact(
        artifact_path=in_apk,
        mpp_path=tmp_path / "p.mpp",
        package_name="com.test.app",
        all_defaults=True,
        enabled_patches=[],
        raw_options=[],
        out_apk_path=final_apk,
        clean_install=False,
        adb_client=mock_client,
    )
    assert res.install_mode == "reinstall"
    assert res.applied_patches == ["P1"]
    assert res.launch_component is None

    # Check install command was adb install -r
    install_call = mock_client.run.call_args_list[1]
    assert install_call[0][0] == ["install", "-r", str(final_apk.resolve())]

    # Now test clean-install
    mock_client.reset_mock()
    mock_client.run.side_effect = [
        subprocess.CompletedProcess(
            [], 0, "List of devices attached\nemulator-5554\tdevice\n", ""
        ),  # devices
        subprocess.CompletedProcess([], 0, "Success\n", ""),  # uninstall
        subprocess.CompletedProcess([], 0, "Success\n", ""),  # install
    ]

    res_clean = deploy_artifact(
        artifact_path=in_apk,
        mpp_path=tmp_path / "p.mpp",
        package_name="com.test.app",
        all_defaults=True,
        enabled_patches=[],
        raw_options=[],
        out_apk_path=final_apk,
        clean_install=True,
        adb_client=mock_client,
    )
    assert res_clean.install_mode == "clean-install"
    assert mock_client.run.call_args_list[1][0][0] == ["uninstall", "com.test.app"]
    assert mock_client.run.call_args_list[2][0][0] == [
        "install",
        str(final_apk.resolve()),
    ]


@pytest.mark.parametrize(
    "alias_mode",
    ["identical", "relative", "symlink"],
)
def test_deploy_artifact_rejects_output_aliasing_input(
    tmp_path, monkeypatch, alias_mode
):
    in_apk = tmp_path / "original.apk"
    original_bytes = b"ORIGINAL_APK_UNTOUCHED"
    in_apk.write_bytes(original_bytes)

    if alias_mode == "identical":
        out_apk = in_apk
    elif alias_mode == "relative":
        monkeypatch.chdir(tmp_path)
        out_apk = Path("original.apk")
    elif alias_mode == "symlink":
        out_apk = tmp_path / "link_to_original.apk"
        out_apk.symlink_to(in_apk)

    mock_client = MagicMock()
    mock_tm = MagicMock()

    with pytest.raises(
        ValueError, match="Deployment output must not overwrite the input artifact"
    ):
        deploy_artifact(
            artifact_path=in_apk,
            mpp_path=tmp_path / "test.mpp",
            package_name="com.test.app",
            all_defaults=True,
            enabled_patches=[],
            raw_options=[],
            out_apk_path=out_apk,
            tool_manager=mock_tm,
            adb_client=mock_client,
        )

    # Assert input was not clobbered
    assert in_apk.read_bytes() == original_bytes
    if alias_mode == "symlink":
        assert out_apk.is_symlink()

    # Assert no device or tool calls were made
    mock_client.run.assert_not_called()
    mock_tm.run.assert_not_called()


def test_zipalign_and_sign_with_custom_credentials(tmp_path, monkeypatch):
    unsigned = tmp_path / "unsigned.apk"
    unsigned.write_bytes(b"unsigned")
    aligned = tmp_path / "aligned.apk"
    ks = tmp_path / "custom.keystore"
    ks.write_bytes(b"custom_key")

    commands: list[list[str]] = []

    def fake_run(cmd, **kwargs):
        commands.append(cmd)
        return subprocess.CompletedProcess(cmd, 0, "", "")

    monkeypatch.setattr(subprocess, "run", fake_run)
    monkeypatch.setattr(
        "apk_lab.deployment.find_build_tools_bin", lambda name: Path(f"/sdk/bin/{name}")
    )
    monkeypatch.setattr("apk_lab.deployment.ensure_debug_keystore", lambda path: ks)

    zipalign_and_sign(
        unsigned_apk=unsigned,
        aligned_and_signed_apk=aligned,
        keystore_path=ks,
        ks_alias="custom_alias",
        ks_pass="secret123",
        key_pass="keysecret456",
    )

    assert len(commands) == 3
    # 1. zipalign
    assert commands[0][0] == "/sdk/bin/zipalign"
    # 2. apksigner sign
    sign_cmd = commands[1]
    assert sign_cmd[0] == "/sdk/bin/apksigner"
    assert sign_cmd[1] == "sign"
    assert "--ks-key-alias" in sign_cmd
    alias_idx = sign_cmd.index("--ks-key-alias")
    assert sign_cmd[alias_idx + 1] == "custom_alias"
    assert "--ks-pass" in sign_cmd
    ks_pass_idx = sign_cmd.index("--ks-pass")
    assert sign_cmd[ks_pass_idx + 1] == "pass:secret123"
    assert "--key-pass" in sign_cmd
    key_pass_idx = sign_cmd.index("--key-pass")
    assert sign_cmd[key_pass_idx + 1] == "pass:keysecret456"


def test_resolve_signing_keystore_auto_matches_morphe_when_installed(
    tmp_path, monkeypatch
):
    morphe_ks = tmp_path / "morphe-install" / "morphe-data" / "morphe.keystore"
    morphe_ks.parent.mkdir(parents=True)
    morphe_ks.write_bytes(b"morphe_keystore_bytes")

    mock_tm = MagicMock()
    mock_tm.get_tool_install_dir.return_value = tmp_path / "morphe-install"
    mock_tm.get_cache_dir.return_value = tmp_path / "morphe-install"

    monkeypatch.setattr(
        "apk_lab.deployment.get_installed_package_signature",
        lambda pkg, device=None: MORPHE_KEYSTORE_SHA256,
    )

    ks, alias, ks_pass, key_pass = resolve_signing_keystore(
        package_name="com.test.app",
        device="emulator-5554",
        explicit_keystore=None,
        explicit_alias=None,
        explicit_pass=None,
        tool_manager=mock_tm,
    )

    assert ks == morphe_ks.resolve()
    assert alias == "Morphe"
    assert ks_pass == "Morphe"
    assert key_pass == "Morphe"


def test_resolve_signing_keystore_defaults_to_debug_keystore(tmp_path, monkeypatch):
    debug_ks = tmp_path / "debug.keystore"
    debug_ks.write_bytes(b"debug_ks")

    monkeypatch.setattr(
        "apk_lab.deployment.get_installed_package_signature",
        lambda pkg, device=None: None,
    )
    monkeypatch.setattr(
        "apk_lab.deployment.ensure_debug_keystore",
        lambda keystore_path=None: debug_ks,
    )

    ks, alias, ks_pass, key_pass = resolve_signing_keystore(
        package_name="com.unknown.app",
        device="emulator-5554",
        explicit_keystore=None,
        explicit_alias=None,
        explicit_pass=None,
    )

    assert ks == debug_ks
    assert alias == "androiddebugkey"
    assert ks_pass == "android"
    assert key_pass == "android"


def test_is_derivative_artifact_name():
    assert is_derivative_artifact_name("app-patched.apk") is True
    assert is_derivative_artifact_name("NHL-17.0.0-patches-1.8.0.apk") is True
    assert is_derivative_artifact_name("foo_patched.apk") is True
    assert is_derivative_artifact_name("something.mpe") is True
    assert is_derivative_artifact_name("com.nhl.gc1112.free_17.0.0.apkm") is False
    assert is_derivative_artifact_name("app-release.apk") is False


def test_find_app_artifact_prefers_clean_split_over_newer_derivative(tmp_path):
    repo_root = tmp_path / "repo"
    app_dir = repo_root / "apk" / "NHL"
    app_dir.mkdir(parents=True)

    clean_apkm = app_dir / "com.nhl.gc1112.free_17.0.0.apkm"
    clean_apkm.write_bytes(b"clean apkm")
    os.utime(clean_apkm, (1000, 1000))

    derivative_apk = app_dir / "NHL-17.0.0-patches-1.8.0.apk"
    derivative_apk.write_bytes(b"derivative apk")
    os.utime(derivative_apk, (2000, 2000))

    found = find_app_artifact("NHL", repo_root)
    assert found == clean_apkm
