"""Check the actual Morphe output for the LinkedIn patch suite against stock APK."""
import argparse
import json
import pathlib
import re
import struct
import subprocess
import tempfile
import zipfile
from collections import Counter

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("apk", type=pathlib.Path)
parser.add_argument("result", type=pathlib.Path)
parser.add_argument("build_tools", type=pathlib.Path)
args = parser.parse_args()
APK = args.apk
SDK = args.build_tools

SDUI_FILTER = "Lapp/badfella/extension/linkedin/SduiComponentFilter;"
POST_MENU = "Lapp/badfella/extension/linkedin/PostMenu;"
COMPONENT_TRANSFORMER = "Lcom/linkedin/sdui/transformer/impl/ComponentTransformer;"
SETTINGS = "Lapp/badfella/extension/linkedin/Settings;"
SETTINGS_ACTIVITY = "Lapp/badfella/extension/linkedin/SettingsActivity;"
MATERIAL_YOU = "Lapp/badfella/extension/linkedin/MaterialYou;"
HIDE_ADS = "Lapp/badfella/extension/linkedin/HideAdsPatch;"
APP_COMPAT = "Landroidx/appcompat/app/AppCompatActivity;"
MAIN_ACTIVITY = "Lcom/linkedin/android/infra/navigation/MainActivity;"

result = json.loads(args.result.read_text())
assert result["success"] and not result["failedPatches"], result
applied = set(result["appliedPatches"])
assert len(applied) >= 18, f"Expected at least 18 default patches applied, got {len(applied)}: {applied}"

manifest = subprocess.check_output(
    [str(SDK / "aapt2.exe"), "dump", "badging", str(APK)],
    text=True, encoding="utf-8", errors="replace")
assert "package: name='com.linkedin.android' versionCode='217900' versionName='4.1.1271'" in manifest


def class_descriptors(data):
    assert data.startswith(b"dex\n")
    _, string_offset = struct.unpack_from("<II", data, 56)
    _, type_offset = struct.unpack_from("<II", data, 64)
    class_count, class_offset = struct.unpack_from("<II", data, 96)

    def string(index):
        offset = struct.unpack_from("<I", data, string_offset + 4 * index)[0]
        while data[offset] & 128:
            offset += 1
        offset += 1
        return data[offset:data.index(0, offset)].decode("utf-8")

    for index in range(class_count):
        type_index = struct.unpack_from("<I", data, class_offset + index * 32)[0]
        string_index = struct.unpack_from("<I", data, type_offset + 4 * type_index)[0]
        yield string(string_index)


with tempfile.TemporaryDirectory() as workspace:
    root = pathlib.Path(workspace)
    classes = Counter()
    targets = {}
    with zipfile.ZipFile(APK) as archive:
        dex_names = sorted(name for name in archive.namelist()
                           if re.fullmatch(r"classes\d*\.dex", name))
        assert dex_names, "Patched APK has no DEX files"
        for name in dex_names:
            data = archive.read(name)
            file = root / name
            file.write_bytes(data)
            for descriptor in class_descriptors(data):
                classes[descriptor] += 1
                if descriptor in (SDUI_FILTER, POST_MENU, COMPONENT_TRANSFORMER, SETTINGS, SETTINGS_ACTIVITY,
                                  MATERIAL_YOU, HIDE_ADS, APP_COMPAT, MAIN_ACTIVITY):
                    targets.setdefault(descriptor, name)

    assert classes[SDUI_FILTER] == 1, "LinkedIn SDUI filter is missing or duplicated"
    assert classes[SETTINGS] == 1, "LinkedIn Settings is missing or duplicated"
    assert classes[HIDE_ADS] == 1, "LinkedIn legacy ad filter is missing or duplicated"
    assert classes[COMPONENT_TRANSFORMER] == 1, "ComponentTransformer missing or duplicated"
    assert classes[MAIN_ACTIVITY] == 1, "MainActivity missing or duplicated"
    assert all(count == 1 for count in classes.values()), "Duplicate DEX classes"

    def disassemble(name):
        return subprocess.check_output(
            [str(SDK / "dexdump.exe"), "-d", str(root / name)],
            text=True, encoding="utf-8", errors="replace")

    transformer = disassemble(targets[COMPONENT_TRANSFORMER])
    assert "SduiComponentFilter" in transformer, "SDUI filter class not referenced from ComponentTransformer"
    assert ";.shouldHide:" in transformer or ".shouldHide:" in transformer, \
        "SDUI shouldHide hook not injected into ComponentTransformer"
    assert ";.rewrite:" in transformer or ".rewrite:" in transformer, \
        "SDUI rewrite hook not injected into ComponentTransformer"

    main_act = disassemble(targets[MAIN_ACTIVITY])
    assert "SettingsShortcut" in main_act and "onMainActivityCreated:" in main_act, \
        "SettingsShortcut hook not injected into MainActivity"

    # The scroll hot path must carry the per-component memo and must not serialize every component.
    filter_dex = disassemble(targets[SDUI_FILTER])
    for method in ("SduiComponentFilter.memo:", "SduiComponentFilter.viewName:", "SduiComponentFilter.payload:",
                   "SduiComponentFilter.screenName:"):
        assert method in filter_dex, f"Missing fast-path method {method}"
    post_menu_dex = disassemble(targets[POST_MENU])
    assert "PostMenu.signature:" in post_menu_dex, "Missing post-menu payload dedupe"

    # Promoted, boosted and sponsored detection under any view name, plus label-only posts.
    for marker in ("sponsoredContentV2", "sponsoredCreative", "sponsoredUpdate", "adCreative",
                   "adUpdate", "promotedUpdate", "leadGenForm", "leadgen"):
        assert marker in filter_dex, f"Missing SDUI ad marker {marker}"
    for method in ("hasSponsoredTracking", "hasPromotedLabel"):
        assert method in filter_dex, f"Missing SDUI ad check {method}"

    # The legacy Pegasus feed path carries the same comprehensive checks.
    hide_ads_dex = disassemble(targets[HIDE_ADS])
    for method in ("hasSponsoredUrn", "hasSponsoredTracking", "hasCallToAction",
                   "hasPromotedLabel", "hasSponsoredCarouselItem", "hasSponsoredAggregatedUpdate"):
        assert method in hide_ads_dex, f"Missing legacy ad check {method}"
    for token in ("sponsoredcontent", "sponsoredcreative", "sponsoredupdate",
                  "adcreative", "adupdate", "promotedupdate"):
        assert token in hide_ads_dex, f"Missing legacy sponsored URN token {token}"

    # Pitch black: the full app AMOLED theme, on by default once its patch is included.
    settings_dex = disassemble(targets[SETTINGS])
    assert re.search(r"name\s+: 'pitchBlack'", settings_dex), "Pitch black switch missing from Settings"
    assert "pitch_black" in settings_dex, "Pitch black preference key missing"
    assert "amoled_black" in settings_dex, "Legacy AMOLED preference key is not migrated"

    material_you = disassemble(targets[MATERIAL_YOU])
    assert re.search(r"name\s+: 'amoled'", material_you), "Pitch black tone mapping missing"
    assert re.search(r"name\s+: 'pitchBlackContext'", material_you), "Pitch black context hook missing"
    for tone in ("ff000000", "ff0d0d0d", "ff1a1a1a"):
        assert tone in material_you, f"Missing Pitch black tone {tone}"

    app_compat = disassemble(targets[APP_COMPAT])
    assert "MaterialYou;.pitchBlackContext:" in app_compat, \
        "Pitch black context hook not injected into AppCompatActivity.attachBaseContext"

    # The three AMOLED tones must reach the dark View themes through values-notlong-night.
    resources = subprocess.check_output(
        [str(SDK / "aapt2.exe"), "dump", "resources", str(APK)],
        text=True, encoding="utf-8", errors="replace")

    def notlong_color(name):
        entry = re.search(r"resource 0x[0-9a-f]+ color/" + re.escape(name) + r"\n(.*?)(?=\n    resource |\Z)",
                          resources, re.S)
        assert entry, f"Color {name} missing from resources"
        value = re.search(r"\(notlong-night\) (#[0-9a-fA-F]+)", entry.group(1))
        assert value, f"Color {name} has no notlong-night value"
        return value.group(1).lower()

    assert notlong_color("mercado_mvp_dark_color_background_canvas") == "#ff000000"
    assert notlong_color("mercado_mvp_dark_color_background_container") == "#ff0d0d0d"
    assert notlong_color("mercado_mvp_dark_color_background_canvas_tint") == "#ff1a1a1a"

subprocess.run([str(SDK / "zipalign.exe"), "-c", "4", str(APK)], check=True)
print(f"PASS: LinkedIn 4.1.1271, {len(applied)} patches, SDUI transformer hooks, "
      f"SettingsShortcut hook, sponsored/promoted/boosted filters, Pitch black resources and hooks, "
      f"{len(classes)} unique classes, ZIP alignment")
