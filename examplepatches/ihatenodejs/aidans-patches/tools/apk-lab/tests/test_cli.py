import argparse
import io
import shlex
import zipfile

import pytest
from apk_lab.archives import ArchiveSecurityError
from apk_lab.cli import (
    extract_native_libraries,
    handle_analyze,
    materialize_split_member,
    non_negative_float,
    validate_dex_entry_name,
)
from apk_lab.models import AndroidManifestInfo, ExitCode


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
