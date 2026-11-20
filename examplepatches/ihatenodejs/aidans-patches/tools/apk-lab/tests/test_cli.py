import argparse
import io
import shlex
import zipfile

import pytest
from apk_lab.archives import ArchiveSecurityError
from apk_lab.cli import (
    build_parser,
    extract_native_libraries,
    handle_analyze,
    materialize_split_member,
    non_negative_float,
    non_negative_int,
    validate_dex_entry_name,
)
from apk_lab.models import (
    AndroidManifestInfo,
    DeployResult,
    ExitCode,
    ResourceMatch,
    ResourceQueryReport,
)


def test_validate_dex_entry_name_valid():
    assert validate_dex_entry_name("classes.dex") == "classes.dex"
    assert validate_dex_entry_name("classes2.dex") == "classes2.dex"
    assert validate_dex_entry_name("classes10.dex") == "classes10.dex"


def test_validate_dex_entry_name_traversal_rejected():
    with pytest.raises(ArchiveSecurityError, match="Invalid or unsafe DEX"):
        validate_dex_entry_name("../classes.dex")
    with pytest.raises(ArchiveSecurityError, match="Invalid or unsafe DEX"):
        validate_dex_entry_name("foo/classes.dex")
    with pytest.raises(ArchiveSecurityError, match="Invalid or unsafe DEX"):
        validate_dex_entry_name("/classes.dex")
    with pytest.raises(ArchiveSecurityError, match="Invalid or unsafe DEX"):
        validate_dex_entry_name("notdex.txt")


def test_materialize_nested_split_creates_parents(tmp_path):
    zip_bytes = io.BytesIO()
    with zipfile.ZipFile(zip_bytes, "w") as zf:
        zf.writestr("splits/base-master.apk", b"fake_split_content")

    zip_bytes.seek(0)
    extracted_dir = tmp_path / "extracted"
    extracted_dir.mkdir()

    with zipfile.ZipFile(zip_bytes, "r") as zf:
        dest = materialize_split_member(zf, "splits/base-master.apk", extracted_dir)
        assert dest.is_file()
        assert dest.read_bytes() == b"fake_split_content"
        assert dest.parent == extracted_dir / "splits"


def test_materialize_split_traversal_rejected(tmp_path):
    zip_bytes = io.BytesIO()
    with zipfile.ZipFile(zip_bytes, "w") as zf:
        zf.writestr("../escaped.apk", b"evil")

    zip_bytes.seek(0)
    extracted_dir = tmp_path / "extracted"
    extracted_dir.mkdir()

    with (
        zipfile.ZipFile(zip_bytes, "r") as zf,
        pytest.raises(ArchiveSecurityError, match="escapes extraction directory"),
    ):
        materialize_split_member(zf, "../escaped.apk", extracted_dir)


def test_stale_negative_cli_parser_rejected():
    with pytest.raises(argparse.ArgumentTypeError, match="non-negative"):
        non_negative_float("-1")
    with pytest.raises(argparse.ArgumentTypeError, match="non-negative"):
        non_negative_float("-0.5")
    assert non_negative_float("0") == 0.0
    assert non_negative_float("2.5") == 2.5


def test_cleanup_command_formatting_custom_root_and_spaces(tmp_path):
    custom_root = tmp_path / "my custom workspace"
    run_dir = custom_root / "com.example.app" / "1-abc" / "digest123"

    cleanup_cmd = ["uv", "run", "--project", "tools/apk-lab", "apk-lab"]
    if str(custom_root) != ".apk-lab":
        cleanup_cmd.extend(["--workspace-root", str(custom_root)])
    cleanup_cmd.extend(["clean", "--run", str(run_dir)])

    cmd_str = shlex.join(cleanup_cmd)
    tokens = shlex.split(cmd_str)
    assert tokens[0:5] == ["uv", "run", "--project", "tools/apk-lab", "apk-lab"]
    assert "--workspace-root" in tokens
    assert str(custom_root) in tokens
    assert tokens.index("--workspace-root") < tokens.index("clean")
    assert tokens[tokens.index("clean") + 1 :] == ["--run", str(run_dir)]


def test_extract_native_libraries_success_and_traversal(tmp_path):
    apk_file = tmp_path / "split_config.arm64_v8a.apk"
    with zipfile.ZipFile(apk_file, "w") as zf:
        zf.writestr("lib/arm64-v8a/libtest.so", b"arm64_test_so")
        zf.writestr("lib/armeabi-v7a/libtest_v7.so", b"v7_test_so")
        zf.writestr("assets/some_file.txt", b"not_a_lib")

    lib_dir = tmp_path / "lib"
    extracted = extract_native_libraries([apk_file], lib_dir)

    assert extracted == {
        "arm64-v8a": ["libtest.so"],
        "armeabi-v7a": ["libtest_v7.so"],
    }
    assert (lib_dir / "arm64-v8a" / "libtest.so").read_bytes() == b"arm64_test_so"
    assert (lib_dir / "armeabi-v7a" / "libtest_v7.so").read_bytes() == b"v7_test_so"

    # Traversal attack via ..
    bad_apk = tmp_path / "bad.apk"
    with zipfile.ZipFile(bad_apk, "w") as zf:
        zf.writestr("lib/arm64-v8a/../../evil.so", b"evil")
    with pytest.raises(ArchiveSecurityError, match="escapes library directory"):
        extract_native_libraries([bad_apk], lib_dir)

    # Traversal / malformed entry with extra nesting
    bad_nested_apk = tmp_path / "bad_nested.apk"
    with zipfile.ZipFile(bad_nested_apk, "w") as zf:
        zf.writestr("lib/arm64-v8a/nested/evil.so", b"evil")
    with pytest.raises(ArchiveSecurityError, match="Invalid native library"):
        extract_native_libraries([bad_nested_apk], lib_dir)


def test_extract_native_libraries_duplicate_collisions(tmp_path):
    apk1 = tmp_path / "split1.apk"
    with zipfile.ZipFile(apk1, "w") as zf:
        zf.writestr("lib/arm64-v8a/libshared.so", b"identical_content_bytes")

    apk2_identical = tmp_path / "split2_identical.apk"
    with zipfile.ZipFile(apk2_identical, "w") as zf:
        zf.writestr("lib/arm64-v8a/libshared.so", b"identical_content_bytes")

    lib_dir = tmp_path / "lib"
    extracted = extract_native_libraries([apk1, apk2_identical], lib_dir)
    assert extracted == {"arm64-v8a": ["libshared.so"]}
    dest_file = lib_dir / "arm64-v8a" / "libshared.so"
    assert dest_file.read_bytes() == b"identical_content_bytes"

    # Conflicting bytes in second APK
    apk2_conflicting = tmp_path / "split2_conflicting.apk"
    with zipfile.ZipFile(apk2_conflicting, "w") as zf:
        zf.writestr("lib/arm64-v8a/libshared.so", b"different_conflicting_content")

    lib_dir2 = tmp_path / "lib2"
    with pytest.raises(ArchiveSecurityError, match=r"lib/arm64-v8a/libshared\.so"):
        extract_native_libraries([apk1, apk2_conflicting], lib_dir2)

    # First APK's bytes are preserved and never overwritten
    assert (
        lib_dir2 / "arm64-v8a" / "libshared.so"
    ).read_bytes() == b"identical_content_bytes"


@pytest.mark.parametrize("second_content", [b"first_content", b"different_content"])
def test_extract_native_libraries_duplicate_entries_in_same_apk(
    tmp_path, second_content
):
    apk_file = tmp_path / "duplicate.apk"
    name = "lib/arm64-v8a/libshared.so"
    with zipfile.ZipFile(apk_file, "w") as zf:
        zf.writestr(name, b"first_content")
        with pytest.warns(UserWarning, match="Duplicate name"):
            zf.writestr(name, second_content)

    lib_dir = tmp_path / "lib"
    if second_content == b"first_content":
        assert extract_native_libraries([apk_file], lib_dir) == {
            "arm64-v8a": ["libshared.so"]
        }
    else:
        with pytest.raises(
            ArchiveSecurityError, match="Conflicting native library content"
        ):
            extract_native_libraries([apk_file], lib_dir)

    assert (lib_dir / "arm64-v8a" / "libshared.so").read_bytes() == b"first_content"


def test_analyze_extracts_native_libs(tmp_path, monkeypatch):
    # Create synthetic split APKs
    base_apk = tmp_path / "base.apk"
    with zipfile.ZipFile(base_apk, "w") as zf:
        zf.writestr("AndroidManifest.xml", b"<manifest/>")
        zf.writestr("classes.dex", b"dex\n035\x00")

    split_apk = tmp_path / "split_config.arm64_v8a.apk"
    with zipfile.ZipFile(split_apk, "w") as zf:
        zf.writestr("AndroidManifest.xml", b"<manifest/>")
        zf.writestr("lib/arm64-v8a/libgame.so", b"binary_data_arm64")

    container_path = tmp_path / "app.apks"
    with zipfile.ZipFile(container_path, "w") as zf:
        zf.writestr("splits/base-master.apk", base_apk.read_bytes())
        zf.writestr("splits/split_config.arm64_v8a.apk", split_apk.read_bytes())

    def mock_inspect_single_apk_zip(zf, apk_file):
        filename = apk_file.name
        if "base" in filename:
            manifest = AndroidManifestInfo(
                package_name="com.example.game",
                version_code=10,
                version_name="1.0",
                min_sdk_version=21,
                target_sdk_version=34,
                split_name=None,
            )
            return (manifest, "a" * 64, 10, 20, ["classes.dex"], [], [], [], [])
        else:
            manifest = AndroidManifestInfo(
                package_name="com.example.game",
                version_code=10,
                version_name="1.0",
                min_sdk_version=21,
                target_sdk_version=34,
                split_name="config.arm64_v8a",
            )
            return (
                manifest,
                "a" * 64,
                0,
                0,
                [],
                ["lib/arm64-v8a/libgame.so"],
                [],
                [],
                [],
            )

    monkeypatch.setattr(
        "apk_lab.inspection.inspect_single_apk_zip", mock_inspect_single_apk_zip
    )
    monkeypatch.setattr(
        "apk_lab.tools.ToolManager.run_tool_cmd", lambda self, tool, cmd, **kw: None
    )

    ws_root = tmp_path / "workspace"
    args = argparse.Namespace(
        artifact=container_path,
        workspace_root=ws_root,
        jadx=False,
        apktool=False,
        smali=True,
        classes=[],
    )
    result = handle_analyze(args)
    assert result == ExitCode.SUCCESS

    run_dirs = list(ws_root.glob("com.example.game/*/*"))
    assert len(run_dirs) == 1
    run_dir = run_dirs[0]

    extracted_so = run_dir / "lib" / "arm64-v8a" / "libgame.so"
    assert extracted_so.is_file()
    assert extracted_so.read_bytes() == b"binary_data_arm64"


def test_non_negative_int_validator():
    assert non_negative_int("0") == 0
    assert non_negative_int("42") == 42
    assert non_negative_int("0x10") == 16
    with pytest.raises(argparse.ArgumentTypeError, match="non-negative"):
        non_negative_int("-1")
    with pytest.raises(argparse.ArgumentTypeError, match="Invalid integer"):
        non_negative_int("abc")


def test_parser_deploy_arguments():
    parser = build_parser()
    # Omitted --package and patch selection is allowed (auto-detected / defaulted)
    args_minimal = parser.parse_args(["deploy", "app.apk", "--mpp", "p.mpp"])
    assert args_minimal.artifact == "app.apk"
    assert args_minimal.mpp == "p.mpp"
    assert args_minimal.package is None
    assert args_minimal.all is False
    assert args_minimal.enable == []

    # --all works
    args = parser.parse_args(
        ["deploy", "app.apk", "--mpp", "p.mpp", "--package", "com.test", "--all"]
    )
    assert args.all is True
    assert args.enable == []
    assert args.artifact == "app.apk"
    assert args.package == "com.test"

    # -e works
    args = parser.parse_args(
        [
            "deploy",
            "app.apk",
            "--mpp",
            "p.mpp",
            "--package",
            "com.test",
            "-e",
            "Patch1",
            "-e",
            "Patch2",
            "-O",
            "key=val",
            "--device",
            "emulator-5554",
            "--launch",
            "--reinstall",
            "--out",
            "out.apk",
        ]
    )
    assert args.all is False
    assert args.enable == ["Patch1", "Patch2"]
    assert args.options == ["key=val"]
    assert args.device == "emulator-5554"
    assert args.launch is True
    assert args.reinstall is True
    assert args.out == "out.apk"

    # --all and -e are mutually exclusive
    with pytest.raises(SystemExit):
        parser.parse_args(
            [
                "deploy",
                "app.apk",
                "--mpp",
                "p.mpp",
                "--all",
                "-e",
                "Patch1",
            ]
        )
    # --reinstall and --clean-install mutually exclusive
    with pytest.raises(SystemExit):
        parser.parse_args(
            [
                "deploy",
                "app.apk",
                "--mpp",
                "p.mpp",
                "--package",
                "com.test",
                "--all",
                "--reinstall",
                "--clean-install",
            ]
        )


def test_dev_subcommand_parser():
    parser = build_parser()
    args = parser.parse_args(["dev", "geocaching"])
    assert args.app == "geocaching"
    assert args.launch is True
    assert args.all is True
    assert args.device is None
    assert args.clean_install is False
    assert args.reinstall is False

    args_custom = parser.parse_args(
        ["dev", "sezzle", "--device", "emulator-5554", "--clean-install"]
    )
    assert args_custom.app == "sezzle"
    assert args_custom.device == "emulator-5554"
    assert args_custom.clean_install is True

    args_flags = parser.parse_args(["dev", "--artifact", "custom.apk", "--no-build"])
    assert args_flags.app is None
    assert args_flags.artifact == "custom.apk"
    assert args_flags.no_build is True
    with pytest.raises(SystemExit):
        parser.parse_args(["dev", "sezzle", "--reinstall", "--clean-install"])


def test_handle_dev_dispatches_build_and_deploy(monkeypatch, tmp_path):
    from argparse import Namespace

    from apk_lab.cli import handle_dev

    fake_repo = tmp_path / "repo"
    fake_repo.mkdir()
    fake_bundle = fake_repo / "patches" / "build" / "libs" / "patches-test.mpp"
    fake_artifact = fake_repo / "apk" / "my-app.apk"

    monkeypatch.setattr("apk_lab.deployment.find_repo_root", lambda: fake_repo)
    monkeypatch.setattr("apk_lab.deployment.build_patch_bundle", lambda r: fake_bundle)
    monkeypatch.setattr(
        "apk_lab.deployment.find_app_artifact", lambda target, r: fake_artifact
    )

    class MockInspection:
        package_name = "com.example.mockapp"

    monkeypatch.setattr(
        "apk_lab.inspection.inspect_artifact", lambda p: MockInspection()
    )

    deployed_args = {}

    def mock_deploy_artifact(**kwargs):
        deployed_args.update(kwargs)
        return DeployResult(
            output_apk=str(tmp_path / "out.apk"),
            package_name=kwargs["package_name"],
            device_serial=kwargs.get("device_serial"),
            applied_patches=["PatchA"],
            install_mode="reinstall",
            launch_component="com.example.mockapp/.MainActivity",
        )

    monkeypatch.setattr("apk_lab.deployment.deploy_artifact", mock_deploy_artifact)

    args = Namespace(
        app="mockapp",
        device="emulator-1234",
        launch=True,
        all=True,
        clean_install=False,
    )
    exit_code = handle_dev(args)
    assert exit_code == ExitCode.SUCCESS
    assert deployed_args["artifact_path"] == fake_artifact
    assert deployed_args["mpp_path"] == fake_bundle
    assert deployed_args["package_name"] == "com.example.mockapp"
    assert deployed_args["device_serial"] == "emulator-1234"
    assert deployed_args["launch"] is True
    assert deployed_args["all_defaults"] is True


def test_deploy_build_flag(monkeypatch, tmp_path):
    from argparse import Namespace

    from apk_lab.deployment import run_deploy

    fake_repo = tmp_path / "repo"
    fake_repo.mkdir()
    fake_bundle = fake_repo / "patches" / "build" / "libs" / "patches-built.mpp"

    monkeypatch.setattr("apk_lab.deployment.find_repo_root", lambda: fake_repo)
    monkeypatch.setattr("apk_lab.deployment.build_patch_bundle", lambda r: fake_bundle)

    captured = {}

    def mock_deploy(**kwargs):
        captured.update(kwargs)
        return DeployResult(
            output_apk=str(tmp_path / "out.apk"),
            package_name=kwargs["package_name"],
            device_serial=None,
            applied_patches=["PatchA"],
            install_mode="reinstall",
            launch_component=None,
        )

    monkeypatch.setattr("apk_lab.deployment.deploy_artifact", mock_deploy)

    # Deploy with --build and without --mpp
    args = Namespace(
        artifact="app.apk",
        mpp=None,
        build=True,
        package="com.example.test",
        all=True,
        enable=[],
        options=[],
        device=None,
        launch=False,
        clean_install=False,
        out=None,
        keystore=None,
        ks_alias=None,
        ks_pass=None,
        key_pass=None,
    )
    exit_code = run_deploy(args)
    assert exit_code == ExitCode.SUCCESS
    assert captured["mpp_path"] == fake_bundle
    assert captured["package_name"] == "com.example.test"

    # Deploy without --mpp and without --build fails with ValueError
    args_missing = Namespace(
        artifact="app.apk",
        mpp=None,
        build=False,
        package="com.example.test",
        all=True,
        enable=[],
        options=[],
        device=None,
        launch=False,
        clean_install=False,
        out=None,
    )
    with pytest.raises(ValueError, match="Either --mpp or --build"):
        run_deploy(args_missing)


def test_deploy_auto_detect_package_and_default_all(monkeypatch, tmp_path):
    from argparse import Namespace

    from apk_lab.cli import handle_deploy

    fake_mpp = tmp_path / "bundle.mpp"
    fake_mpp.write_bytes(b"mpp")
    fake_apk = tmp_path / "sample.apk"
    fake_apk.write_bytes(b"apk")

    class MockInspection:
        package_name = "com.autodetected.package"

    monkeypatch.setattr(
        "apk_lab.inspection.inspect_artifact", lambda p: MockInspection()
    )

    deployed = {}

    def mock_deploy_artifact(**kwargs):
        deployed.update(kwargs)
        return DeployResult(
            output_apk=str(tmp_path / "out.apk"),
            package_name=kwargs["package_name"],
            device_serial=None,
            applied_patches=["PatchA"],
            install_mode="reinstall",
            launch_component=None,
        )

    monkeypatch.setattr("apk_lab.deployment.deploy_artifact", mock_deploy_artifact)

    args = Namespace(
        artifact=str(fake_apk),
        mpp=str(fake_mpp),
        build=False,
        package=None,
        all=False,
        enable=[],
        options=[],
        device=None,
        launch=False,
        clean_install=False,
        out=None,
        keystore=None,
        ks_alias=None,
        ks_pass=None,
        key_pass=None,
    )
    ret = handle_deploy(args)
    assert ret == ExitCode.SUCCESS
    assert deployed["package_name"] == "com.autodetected.package"
    assert deployed["all_defaults"] is True


def test_dev_honors_artifact_and_no_build(monkeypatch, tmp_path):
    from argparse import Namespace

    from apk_lab.cli import handle_dev

    fake_repo = tmp_path / "repo"
    fake_repo.mkdir()
    gradlew = fake_repo / "gradlew"
    gradlew.write_text("#!/bin/sh\nexit 0\n")

    libs_dir = fake_repo / "patches" / "build" / "libs"
    libs_dir.mkdir(parents=True)
    mpp_existing = libs_dir / "patches-existing.mpp"
    mpp_existing.write_bytes(b"mpp")

    explicit_apk = tmp_path / "custom.apk"
    explicit_apk.write_bytes(b"apk")

    monkeypatch.setattr("apk_lab.deployment.find_repo_root", lambda: fake_repo)

    def fail_if_built(repo_root):
        raise AssertionError("build_patch_bundle should not be called with --no-build")

    monkeypatch.setattr("apk_lab.deployment.build_patch_bundle", fail_if_built)

    def fail_if_searched(target, repo_root):
        raise AssertionError(
            "find_app_artifact should not be called when --artifact is set"
        )

    monkeypatch.setattr("apk_lab.deployment.find_app_artifact", fail_if_searched)

    class MockInspection:
        package_name = "com.custom.app"

    monkeypatch.setattr(
        "apk_lab.inspection.inspect_artifact", lambda p: MockInspection()
    )

    deployed = {}

    def mock_deploy_artifact(**kwargs):
        deployed.update(kwargs)
        return DeployResult(
            output_apk=str(tmp_path / "out.apk"),
            package_name=kwargs["package_name"],
            device_serial=None,
            applied_patches=["PatchA"],
            install_mode="reinstall",
            launch_component="com.custom.app/.MainActivity",
        )

    monkeypatch.setattr("apk_lab.deployment.deploy_artifact", mock_deploy_artifact)

    args = Namespace(
        app=None,
        artifact=str(explicit_apk),
        no_build=True,
        device=None,
        launch=True,
        all=True,
        clean_install=False,
    )

    exit_code = handle_dev(args)
    assert exit_code == ExitCode.SUCCESS
    assert deployed["artifact_path"] == explicit_apk.resolve()
    assert deployed["mpp_path"] == mpp_existing
    assert deployed["package_name"] == "com.custom.app"


def test_parser_monitor_arguments():
    parser = build_parser()
    args = parser.parse_args(
        ["monitor", "--package", "com.test", "--timeout", "10.5", "--dump-threads"]
    )
    assert args.package == "com.test"
    assert args.timeout == 10.5
    assert args.dump_threads is True


def test_parser_inspect_code_arguments():
    parser = build_parser()
    args = parser.parse_args(["inspect-code", "app.apk", "--class", "com.test.Foo"])
    assert args.class_name == "com.test.Foo"
    assert args.format == "smali"
    assert args.method is None

    args = parser.parse_args(
        [
            "inspect-code",
            "app.apk",
            "--class",
            "com.test.Foo",
            "--method",
            "bar",
            "--format",
            "java",
            "--compare",
            "old.apk",
        ]
    )
    assert args.format == "java"
    assert args.method == "bar"
    assert args.compare == "old.apk"


def test_parser_validate_smali_arguments():
    parser = build_parser()
    args = parser.parse_args(
        [
            "validate-smali",
            "--snippet",
            "return-void",
            "--locals",
            "2",
            "--params",
            "1",
            "--is-static",
        ]
    )
    assert args.snippet == "return-void"
    assert args.locals == 2
    assert args.params == 1
    assert args.is_static is True


def test_parser_res_arguments():
    parser = build_parser()
    args = parser.parse_args(
        ["res", "app.apk", "--query", "0x7f080001", "--extract", "/tmp/res"]
    )
    assert args.artifact == "app.apk"
    assert args.query == "0x7f080001"
    assert args.extract == "/tmp/res"


def test_deploy_result_to_dict_and_human():
    res = DeployResult(
        output_apk="/path/to/patched.apk",
        package_name="com.test.app",
        device_serial="emulator-5554",
        applied_patches=["PatchA", "PatchB"],
        install_mode="reinstall",
        launch_component="com.test.app/.MainActivity",
    )
    d = res.to_dict()
    assert d["outputApk"] == "/path/to/patched.apk"
    assert d["packageName"] == "com.test.app"
    assert d["deviceSerial"] == "emulator-5554"
    assert d["appliedPatches"] == ["PatchA", "PatchB"]
    assert d["installMode"] == "reinstall"
    assert d["launchComponent"] == "com.test.app/.MainActivity"

    human = res.format_human()
    assert "Output APK: /path/to/patched.apk" in human
    assert "Package: com.test.app" in human
    assert "Device: emulator-5554" in human
    assert "Install mode: reinstall" in human
    assert "Applied patches: PatchA, PatchB" in human
    assert "Launched: com.test.app/.MainActivity" in human


def test_resource_match_and_report_to_dict_and_human():
    match = ResourceMatch(
        container_member="splits/base.apk",
        split_name="base",
        package_name="com.test.app",
        resource_id="0x7f08028e",
        resource_type="drawable",
        resource_name="map_preview",
        qualifier="xxhdpi",
        value=None,
        path="res/drawable-xxhdpi/map_preview.webp",
        kind="resource",
        morphe_mode="resourcePatch",
        sha256="abcd1234",
        duplicate_status="unique",
    )
    d = match.to_dict()
    assert d["resourceId"] == "0x7f08028e"
    assert d["resourceType"] == "drawable"
    assert d["resourceName"] == "map_preview"
    assert d["qualifier"] == "xxhdpi"
    assert d["path"] == "res/drawable-xxhdpi/map_preview.webp"
    assert d["morpheMode"] == "resourcePatch"
    assert d["duplicateStatus"] == "unique"

    report = ResourceQueryReport(
        query="0x7f08028e",
        matches=[match],
        extracted_paths=["/tmp/res/map_preview.webp"],
        warnings=[],
    )
    rd = report.to_dict()
    assert rd["query"] == "0x7f08028e"
    assert len(rd["matches"]) == 1
    assert rd["extractedPaths"] == ["/tmp/res/map_preview.webp"]

    human = report.format_human()
    assert "Found 1 matching resources:" in human
    # Field order: ID | type/name | qualifier | split:path | Morphe mode | duplicate status
    assert (
        "0x7f08028e | drawable/map_preview | xxhdpi | base:res/drawable-xxhdpi/map_preview.webp | resourcePatch | unique"
        in human
    )

    # Test null handling
    null_match = ResourceMatch(
        container_member=None,
        split_name="base",
        package_name=None,
        resource_id=None,
        resource_type=None,
        resource_name=None,
        qualifier=None,
        value="123",
        path=None,
        kind="resource",
        morphe_mode="resourcePatch",
        sha256=None,
        duplicate_status="equivalent",
    )
    null_report = ResourceQueryReport(query="test", matches=[null_match])
    null_human = null_report.format_human()
    assert "- | - | - | - | resourcePatch | equivalent" in null_human


def test_handle_inspect_code_and_res_exception_handling(monkeypatch):
    from argparse import Namespace

    from apk_lab.archives import ArchiveSecurityError
    from apk_lab.cli import handle_inspect_code, handle_res
    from apk_lab.code_inspection import CodeInspectionError
    from apk_lab.inspection import InspectionError
    from apk_lab.models import ExitCode

    args = Namespace(
        artifact="dummy.apk",
        class_name="com.example.Foo",
        method="bar",
        format="smali",
        compare=None,
        query="app_name",
        extract=None,
    )

    # 1. CodeInspectionError -> exit_code
    def raise_code_insp(a):
        raise CodeInspectionError("custom err", exit_code=ExitCode.USAGE_OR_TOOL_ERROR)

    monkeypatch.setattr("apk_lab.code_inspection.run_inspect_code", raise_code_insp)
    monkeypatch.setattr("apk_lab.resources.run_res", raise_code_insp)
    assert handle_inspect_code(args) == ExitCode.USAGE_OR_TOOL_ERROR
    assert handle_res(args) == ExitCode.USAGE_OR_TOOL_ERROR

    # 2. InspectionError -> exit_code
    def raise_insp(a):
        raise InspectionError("bad zip", exit_code=ExitCode.INVALID_ARTIFACT)

    monkeypatch.setattr("apk_lab.code_inspection.run_inspect_code", raise_insp)
    monkeypatch.setattr("apk_lab.resources.run_res", raise_insp)
    assert handle_inspect_code(args) == ExitCode.INVALID_ARTIFACT
    assert handle_res(args) == ExitCode.INVALID_ARTIFACT

    # 3. ArchiveSecurityError -> ExitCode.INVALID_ARTIFACT
    def raise_security(a):
        raise ArchiveSecurityError("path traversal detected")

    monkeypatch.setattr("apk_lab.code_inspection.run_inspect_code", raise_security)
    monkeypatch.setattr("apk_lab.resources.run_res", raise_security)
    assert handle_inspect_code(args) == ExitCode.INVALID_ARTIFACT
    assert handle_res(args) == ExitCode.INVALID_ARTIFACT


def test_handle_inspect_code_broken_pipe_returns_success(monkeypatch):
    import io
    import sys
    from argparse import Namespace

    from apk_lab.cli import handle_inspect_code, main
    from apk_lab.models import ExitCode

    dummy_stdout = io.StringIO()
    monkeypatch.setattr(sys, "stdout", dummy_stdout)

    args = Namespace(
        artifact="dummy.apk",
        class_name="com.example.Foo",
        method=None,
        format="smali",
        compare=None,
    )

    def raise_broken_pipe(a):
        raise BrokenPipeError("Broken pipe")

    monkeypatch.setattr("apk_lab.code_inspection.run_inspect_code", raise_broken_pipe)
    assert handle_inspect_code(args) == ExitCode.SUCCESS
    assert dummy_stdout.closed

    dummy_stdout2 = io.StringIO()
    monkeypatch.setattr(sys, "stdout", dummy_stdout2)

    def raise_broken_pipe_dispatch(argv=None):
        raise BrokenPipeError("Broken pipe")

    monkeypatch.setattr("apk_lab.cli.build_parser", raise_broken_pipe_dispatch)
    assert main([]) == ExitCode.SUCCESS
    assert dummy_stdout2.closed


def test_parser_check_arguments_without_mpp_and_package():
    parser = build_parser()
    args = parser.parse_args(["check", "dummy.apk", "--all"])
    assert args.artifact == "dummy.apk"
    assert args.mpp is None
    assert args.package is None
    assert args.all is True


def test_handle_check_auto_resolves_mpp(monkeypatch, tmp_path):
    import os
    from argparse import Namespace

    from apk_lab.cli import handle_check
    from apk_lab.models import ExitCode

    repo_root = tmp_path / "repo"
    libs_dir = repo_root / "patches" / "build" / "libs"
    libs_dir.mkdir(parents=True)
    mpp_old = libs_dir / "patches-1.0.0.mpp"
    mpp_new = libs_dir / "patches-1.1.0.mpp"
    mpp_old.write_bytes(b"old")
    mpp_new.write_bytes(b"new")
    os.utime(mpp_old, (1000, 1000))
    os.utime(mpp_new, (2000, 2000))

    monkeypatch.setattr("apk_lab.deployment.find_repo_root", lambda: repo_root)

    resolved_mpp = []

    def mock_run_check(**kwargs):
        resolved_mpp.append(kwargs["mpp_path"])

        class MockReport:
            def __init__(self) -> None:
                self.package_name = "com.example.app"
                self.version_name = "1.0.0"
                self.version_code = 1
                self.artifact_sha256 = "1234567890abcdef" * 4
                self.patch_bundle_version = "1.1.0"
                self.git_revision = "abcdef123456"
                self.passed_cases = 1
                self.total_cases = 1
                self.test_cases: list[str] = []
                self.overall_status = "compatible"

        return MockReport(), ExitCode.SUCCESS

    monkeypatch.setattr("apk_lab.morphe.run_compatibility_check", mock_run_check)

    args = Namespace(
        artifact="test.apk",
        mpp=None,
        package=None,
        patches=None,
        all=True,
        force=False,
        keep_workspace=False,
        workspace_root=".apk-lab",
        json=None,
    )
    assert handle_check(args) == ExitCode.SUCCESS
    assert resolved_mpp == [mpp_new]


def test_handle_check_no_mpp_raises_error(monkeypatch, tmp_path):
    from argparse import Namespace

    from apk_lab.cli import handle_check
    from apk_lab.models import ExitCode

    repo_root = tmp_path / "repo"
    libs_dir = repo_root / "patches" / "build" / "libs"
    libs_dir.mkdir(parents=True)

    monkeypatch.setattr("apk_lab.deployment.find_repo_root", lambda: repo_root)

    args = Namespace(
        artifact="test.apk",
        mpp=None,
        package=None,
        patches=None,
        all=True,
        force=False,
        keep_workspace=False,
        workspace_root=".apk-lab",
        json=None,
    )
    assert handle_check(args) == ExitCode.USAGE_OR_TOOL_ERROR
