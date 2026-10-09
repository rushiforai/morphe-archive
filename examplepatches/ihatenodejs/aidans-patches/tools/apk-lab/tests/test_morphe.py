from apk_lab.morphe import (
    PatchDef,
    PatchOptionDef,
    generate_test_cases,
    get_compatible_patches,
    is_patchable_member,
)


def test_is_patchable_member_includes_manifest_and_mutable_members():
    assert is_patchable_member("AndroidManifest.xml")
    assert is_patchable_member("resources.arsc")
    assert is_patchable_member("classes.dex")
    assert is_patchable_member("res/values/strings.xml")
    assert is_patchable_member("assets/config.json")
    assert is_patchable_member("lib/arm64-v8a/libil2cpp.so")
    assert not is_patchable_member("META-INF/CERT.RSA")


def test_generate_test_cases_boolean_inversion():
    patch = PatchDef(
        name="Test Patch",
        description="A test patch",
        default=True,
        dependencies=["Dep Patch"],
        options=[
            PatchOptionDef(
                key="enableFeature",
                title="Enable Feature",
                description="",
                required=False,
                default=True,
                type="kotlin.Boolean",
            ),
            PatchOptionDef(
                key="customString",
                title="Custom String",
                description="",
                required=False,
                default="default_val",
                type="String",
            ),
        ],
    )

    cases = generate_test_cases(patch)
    # Expect 2 cases: default, and inverted boolean
    assert len(cases) == 2

    # Case 1: default
    assert cases[0].options["enableFeature"] is True
    assert cases[0].options["customString"] == "default_val"

    # Case 2: inverted boolean
    assert cases[1].options["enableFeature"] is False
    assert cases[1].options["customString"] == "default_val"


def test_get_compatible_patches_filtering():
    raw_data = {
        "patches": [
            {
                "name": "Patch A",
                "default": True,
                "dependencies": [],
                "compatiblePackages": [{"packageName": "com.target.app"}],
                "options": [],
            },
            {
                "name": "Patch B",
                "default": False,
                "dependencies": [],
                "compatiblePackages": [{"packageName": "com.target.app"}],
                "options": [],
            },
            {
                "name": "Patch C",
                "default": True,
                "dependencies": [],
                "compatiblePackages": [{"packageName": "com.other.app"}],
                "options": [],
            },
        ]
    }

    # Default: only default=True for com.target.app
    defaults = get_compatible_patches("com.target.app", raw_data)
    assert len(defaults) == 1
    assert defaults[0].name == "Patch A"

    # All: both Patch A and Patch B for com.target.app
    all_p = get_compatible_patches("com.target.app", raw_data, all_patches=True)
    assert len(all_p) == 2
    assert {p.name for p in all_p} == {"Patch A", "Patch B"}

    # Filter by specific name
    filtered = get_compatible_patches(
        "com.target.app", raw_data, requested_patches=["Patch B"]
    )
    assert len(filtered) == 1
    assert filtered[0].name == "Patch B"


import io
import zipfile

from apk_lab.morphe import (
    build_morphe_patch_cmd,
    parse_dexdump_class_descriptors,
)


def test_build_morphe_patch_cmd_option_binding_and_dependencies():
    # Target option must be placed before -e Target Patch, and dependency must follow
    cmd = build_morphe_patch_cmd(
        mpp_path="/path/to/bundle.mpp",
        patch_name="Target Patch",
        options={"customOption": True, "count": 5},
        dependencies=["Dep Patch"],
        artifact_path="/path/to/app.apk",
        out_apk="/path/to/out.apk",
        result_json="/path/to/result.json",
        scratch_dir="/path/to/scratch",
        force=True,
    )

    # Verify -O options appear BEFORE -e Target Patch
    idx_target = cmd.index("Target Patch")
    idx_dep = cmd.index("Dep Patch")
    assert idx_target < idx_dep

    opt_idx_count = cmd.index("count=5")
    opt_idx_custom = cmd.index("customOption=true")
    assert opt_idx_count < idx_target
    assert opt_idx_custom < idx_target

    # Verify inverted boolean produces false
    cmd_inverted = build_morphe_patch_cmd(
        mpp_path="/path/to/bundle.mpp",
        patch_name="Target Patch",
        options={"customOption": False},
        dependencies=["Dep Patch"],
        artifact_path="/path/to/app.apk",
        out_apk="/path/to/out.apk",
        result_json="/path/to/result.json",
        scratch_dir="/path/to/scratch",
    )
    assert "-O" in cmd_inverted
    assert "customOption=false" in cmd_inverted


def test_parse_dexdump_class_descriptors():
    dexdump_output = (
        "Processing 'classes.dex'...\n"
        "Opened 'classes.dex', DEX version '035'\n"
        "Class #0            -\n"
        "  Class descriptor  : 'Lcom/example/MyClass;'\n"
        "  Access flags      : 0x0001 (PUBLIC)\n"
        "Class #1            -\n"
        "  Class descriptor  : 'Lapp/aidan/extension/CustomDialog;'\n"
        "  Access flags      : 0x0001 (PUBLIC)\n"
    )
    classes = parse_dexdump_class_descriptors(dexdump_output)
    assert "Lcom/example/MyClass;" in classes
    assert "Lapp/aidan/extension/CustomDialog;" in classes
    assert len(classes) == 2


def test_get_split_container_input_member_hashes(tmp_path):
    from apk_lab.morphe import (
        get_member_hashes,
        get_split_container_input_member_hashes,
    )

    # Create inner split APKs
    base_apk_bytes = io.BytesIO()
    with zipfile.ZipFile(base_apk_bytes, "w") as zf:
        zf.writestr("classes.dex", b"base_dex_v1")
        zf.writestr("res/values/strings.xml", b"base_strings")

    config_apk_bytes = io.BytesIO()
    with zipfile.ZipFile(config_apk_bytes, "w") as zf:
        zf.writestr("lib/arm64-v8a/libtest.so", b"lib_code")

    container_path = tmp_path / "app.apkm"
    with zipfile.ZipFile(container_path, "w") as zf:
        zf.writestr("base.apk", base_apk_bytes.getvalue())
        zf.writestr("config.arm64.apk", config_apk_bytes.getvalue())

    member_map = get_split_container_input_member_hashes(container_path)
    assert "classes.dex" in member_map
    assert "res/values/strings.xml" in member_map
    assert "lib/arm64-v8a/libtest.so" in member_map

    # Output APK with identical members has matching hashes
    out_apk_path = tmp_path / "out.apk"
    with zipfile.ZipFile(out_apk_path, "w") as zf:
        zf.writestr("classes.dex", b"base_dex_v1")
        zf.writestr("res/values/strings.xml", b"base_strings")
        zf.writestr("lib/arm64-v8a/libtest.so", b"lib_code")

    out_hashes = get_member_hashes(out_apk_path)
    # Invariant: identical hashes must not count as changed members
    changed = any(
        out_hashes[name] not in member_map[name]
        for name in out_hashes
        if name in member_map
    )
    assert changed is False

    # Modified member has different hash
    out_mod_path = tmp_path / "out_mod.apk"
    with zipfile.ZipFile(out_mod_path, "w") as zf:
        zf.writestr("classes.dex", b"base_dex_v2_patched")
        zf.writestr("res/values/strings.xml", b"base_strings")
        zf.writestr("lib/arm64-v8a/libtest.so", b"lib_code")

    out_mod_hashes = get_member_hashes(out_mod_path)
    changed_mod = any(
        out_mod_hashes[name] not in member_map[name]
        for name in out_mod_hashes
        if name in member_map
    )
    assert changed_mod is True
