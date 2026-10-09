from apk_lab.comparison import format_comparison_summary
from apk_lab.models import (
    ArtifactComparison,
    ArtifactInspection,
    ContainerType,
    SplitInfo,
)


def create_mock_inspection(
    pkg="com.example.app",
    ver_name="1.0.0",
    ver_code=100,
    signer="622850867847ccb7a1371bc42c865b1137fa51bd19987dc81b53815c9a9817bf",
    classes=1000,
    methods=5000,
    splits=None,
) -> ArtifactInspection:
    return ArtifactInspection(
        file_path="/mock/path.apk",
        container_type=ContainerType.APKM,
        file_size=10_000_000,
        sha256="mock_sha256",
        package_name=pkg,
        version_name=ver_name,
        version_code=ver_code,
        min_sdk=23,
        target_sdk=34,
        signing_certificate_sha256=signer,
        splits=splits or [],
        dex_classes_count=classes,
        dex_methods_count=methods,
        dex_files=["classes.dex"],
        native_libraries=["lib/arm64-v8a/libfoo.so"],
        resources=["res/values/strings.xml"],
        assets=["assets/config.json"],
    )


def test_comparison_summary_formatting():
    old_i = create_mock_inspection(
        ver_name="1.0.0", ver_code=100, classes=1000, methods=5000
    )
    new_i = create_mock_inspection(
        ver_name="1.1.0",
        ver_code=110,
        classes=1200,
        methods=5500,
        splits=[
            SplitInfo(
                filename="config.fr.apk", split_name="config.fr", sha256="abc", size=100
            )
        ],
    )

    cmp = ArtifactComparison(
        old_inspection=old_i,
        new_inspection=new_i,
        version_changed=True,
        version_code_delta=10,
        signer_changed=False,
        added_splits=["config.fr.apk"],
        removed_splits=[],
        modified_splits=[],
        dex_classes_delta=200,
        dex_methods_delta=500,
    )

    summary = format_comparison_summary(cmp)
    assert "com.example.app" in summary
    assert "1.0.0 (100) -> 1.1.0 (110) [delta: +10]" in summary
    assert "[MATCH]" in summary
    assert "+ Added:    config.fr.apk" in summary
    assert "DEX Classes:  1000 -> 1200 [delta: +200]" in summary


import subprocess
import zipfile
from pathlib import Path
from unittest.mock import MagicMock

from apk_lab.comparison import (
    compare_artifacts,
    compare_class_sources,
    locate_class_source,
)


def test_locate_class_source_and_compare_class_sources(tmp_path):
    sources_old = tmp_path / "old" / "sources"
    sources_old.mkdir(parents=True)
    sources_new = tmp_path / "new" / "sources"
    sources_new.mkdir(parents=True)

    # 1. Unchanged class
    pkg_dir_old = sources_old / "com" / "example"
    pkg_dir_old.mkdir(parents=True)
    pkg_dir_new = sources_new / "com" / "example"
    pkg_dir_new.mkdir(parents=True)

    (pkg_dir_old / "Same.java").write_text("class Same { int x = 1; }\n")
    (pkg_dir_new / "Same.java").write_text("class Same { int x = 1; }\n")

    f_old = locate_class_source(sources_old, "com.example.Same")
    f_new = locate_class_source(sources_new, "com.example.Same")
    res_same = compare_class_sources(f_old, f_new, "com.example.Same")
    assert res_same["status"] == "unchanged"
    assert res_same["diff"] is None

    # 2. Modified class (Kotlin)
    (pkg_dir_old / "Mod.kt").write_text("class Mod { val v = 1 }\n")
    (pkg_dir_new / "Mod.kt").write_text("class Mod { val v = 2 }\n")
    res_mod = compare_class_sources(
        locate_class_source(sources_old, "com.example.Mod"),
        locate_class_source(sources_new, "com.example.Mod"),
        "com.example.Mod",
    )
    assert res_mod["status"] == "modified"
    assert "-class Mod { val v = 1 }" in res_mod["diff"]
    assert "+class Mod { val v = 2 }" in res_mod["diff"]

    # 3. Added class
    (pkg_dir_new / "Added.java").write_text("class Added {}\n")
    res_add = compare_class_sources(
        locate_class_source(sources_old, "com.example.Added"),
        locate_class_source(sources_new, "com.example.Added"),
        "com.example.Added",
    )
    assert res_add["status"] == "added"

    # 4. Removed class
    (pkg_dir_old / "Removed.java").write_text("class Removed {}\n")
    res_rem = compare_class_sources(
        locate_class_source(sources_old, "com.example.Removed"),
        locate_class_source(sources_new, "com.example.Removed"),
        "com.example.Removed",
    )
    assert res_rem["status"] == "removed"

    # 5. Missing class
    res_miss = compare_class_sources(
        locate_class_source(sources_old, "com.example.Nonexistent"),
        locate_class_source(sources_new, "com.example.Nonexistent"),
        "com.example.Nonexistent",
    )
    assert res_miss["status"] == "missing"

    # 6. Inner class in outer file
    (pkg_dir_old / "Outer.java").write_text("class Outer { class Inner {} }\n")
    f_inner = locate_class_source(sources_old, "com.example.Outer$Inner")
    assert f_inner == pkg_dir_old / "Outer.java"


def test_artifact_content_hashes_modified_native_libs_and_assets(tmp_path, monkeypatch):
    apk1_path = tmp_path / "v1.apk"
    with zipfile.ZipFile(apk1_path, "w") as zf:
        zf.writestr("lib/arm64-v8a/libunchanged.so", b"same_code")
        zf.writestr("lib/arm64-v8a/libmodified.so", b"old_code")
        zf.writestr("assets/config.json", b'{"version": 1}')

    apk2_path = tmp_path / "v2.apk"
    with zipfile.ZipFile(apk2_path, "w") as zf:
        zf.writestr("lib/arm64-v8a/libunchanged.so", b"same_code")
        zf.writestr("lib/arm64-v8a/libmodified.so", b"new_code_modified")
        zf.writestr("assets/config.json", b'{"version": 2}')
        zf.writestr("assets/new_asset.txt", b"new")

    def mock_inspect(p):
        return ArtifactInspection(
            file_path=str(p),
            container_type=ContainerType.APK,
            file_size=100,
            sha256="abc",
            package_name="com.test.app",
            version_name="1",
            version_code=1,
        )

    monkeypatch.setattr("apk_lab.comparison.inspect_artifact", mock_inspect)

    cmp = compare_artifacts(apk1_path, apk2_path)
    assert "lib/arm64-v8a/libmodified.so" in cmp.modified_native_libraries
    assert "lib/arm64-v8a/libunchanged.so" not in cmp.modified_native_libraries
    assert "assets/config.json" in cmp.modified_assets
    assert "assets/new_asset.txt" in cmp.added_assets


def test_compare_artifacts_with_jadx_mock(tmp_path, monkeypatch):
    apk1_path = tmp_path / "v1.apk"
    with zipfile.ZipFile(apk1_path, "w") as zf:
        zf.writestr("classes.dex", b"dex1")
    apk2_path = tmp_path / "v2.apk"
    with zipfile.ZipFile(apk2_path, "w") as zf:
        zf.writestr("classes.dex", b"dex2")

    def mock_inspect(p):
        return ArtifactInspection(
            file_path=str(p),
            container_type=ContainerType.APK,
            file_size=100,
            sha256="abc",
            package_name="com.test.app",
            version_name="1",
            version_code=1,
        )

    monkeypatch.setattr("apk_lab.comparison.inspect_artifact", mock_inspect)

    mock_tool_mgr = MagicMock()
    mock_tool_mgr.is_tool_installed.return_value = True

    def mock_run_jadx(tool, args):
        # args has -d <dir>
        out_dir = Path(args[args.index("-d") + 1])
        src_dir = out_dir / "sources" / "com" / "test"
        src_dir.mkdir(parents=True, exist_ok=True)
        if "v1.apk" in args[-1]:
            (src_dir / "Target.java").write_text("class Target { int a = 1; }\n")
        else:
            (src_dir / "Target.java").write_text("class Target { int a = 2; }\n")
        return subprocess.CompletedProcess(args, returncode=0, stdout="", stderr="")

    mock_tool_mgr.run_tool_cmd = mock_run_jadx

    cmp = compare_artifacts(
        apk1_path,
        apk2_path,
        requested_classes=["com.test.Target"],
        tool_mgr=mock_tool_mgr,
    )

    assert "com.test.Target" in cmp.classes_diff
    assert cmp.classes_diff["com.test.Target"]["status"] == "modified"
    assert "-class Target { int a = 1; }" in cmp.classes_diff["com.test.Target"]["diff"]

    summary = format_comparison_summary(cmp)
    assert "[MODIFIED] com.test.Target" in summary
