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
parser.add_argument(
    "--clone-package", metavar="PACKAGE",
    help="The copy's package name; verifies Install next to LinkedIn renamed the app, authorities and permissions")
parser.add_argument("--clone-label", metavar="LABEL", default="LinkedIn Clone",
                    help="The copy's home screen name, checked with --clone-package")
parser.add_argument("--expected-version", default="4.1.1272",
                    help="Reviewed LinkedIn version the patched APK must report")
parser.add_argument("--expected-build", default="218000", type=int,
                    help="Reviewed LinkedIn versionCode the patched APK must report")
args = parser.parse_args()
APK = args.apk
SDK = args.build_tools
CLONE = args.clone_package
VERSION = args.expected_version
BUILD = args.expected_build

SDUI_FILTER = "Lapp/badfella/extension/linkedin/SduiComponentFilter;"
POST_MENU = "Lapp/badfella/extension/linkedin/PostMenu;"
POST_COMMENTARY = "Lapp/badfella/extension/linkedin/PostCommentary;"
COMPONENT_TRANSFORMER = "Lcom/linkedin/sdui/transformer/impl/ComponentTransformer;"
SETTINGS = "Lapp/badfella/extension/linkedin/Settings;"
SETTINGS_ACTIVITY = "Lapp/badfella/extension/linkedin/SettingsActivity;"
MATERIAL_YOU = "Lapp/badfella/extension/linkedin/MaterialYou;"
HIDE_ADS = "Lapp/badfella/extension/linkedin/HideAdsPatch;"
GLASS_BAR = "Lapp/badfella/extension/linkedin/GlassNavigationBar;"
NAVIGATION_BAR = "Lapp/badfella/extension/linkedin/NavigationBar;"
SLIM_BEHAVIOR = "Lcom/linkedin/android/home/bottomnav/SlimBottomNavigationBehavior;"
APP_COMPAT = "Landroidx/appcompat/app/AppCompatActivity;"
MAIN_ACTIVITY = "Lcom/linkedin/android/infra/navigation/MainActivity;"
NAV_PANEL_TRANSFORMER = "Lcom/linkedin/android/home/navpanel/HomeNavPanelTransformer;"
NAV_PANEL_PRESENTER = "Lcom/linkedin/android/home/navpanel/presenter/HomeNavPanelSectionV2Presenter;"
DIVIDER_CLASSES = (
    "Lcom/linkedin/android/infra/sdui/components/DividerKt;",
    "Lcom/linkedin/android/infra/sdui/components/LazyColumnItemsKt;",
)

NEW_PATCH_HOOKS = {
    "Disable screenshot share sheet": (
        ("Lcom/linkedin/android/feed/pages/shareactions/UpdateScreenCaptureManagerImpl;", "Settings;.blockScreenshotShare:"),
    ),
    "Hide top bar buttons": (
        ("Lcom/linkedin/android/home/HomeBottomNavFragment;", "HomeTopBar;.install:"),
    ),
    "Video tab": (
        ("Lcom/linkedin/android/media/player/simpleplayer/SimpleMediaPlayer;", "VideoTab;.onPlayWhenReady:"),
    ),
}
NEW_HOOK_CALLERS = {caller for hooks in NEW_PATCH_HOOKS.values() for caller, _ in hooks}
LINKEDIN_SIGNATURE = "443cb997718d0ac5162888bae5e4724582862676"


def meta_data_value(tree, name):
    """The literal android:value aapt2 prints for the meta-data named [name], or None."""
    for block in re.split(r"\n\s*E: ", tree):
        if block.startswith("meta-data") and f':name(0x01010003)="{name}"' in block:
            value = re.search(r':value\(0x01010024\)="([^"]*)"', block)
            return value.group(1) if value else None
    return None


result = json.loads(args.result.read_text())
assert result["success"] and not result["failedPatches"], result
applied = set(result["appliedPatches"])
assert len(applied) >= 18, f"Expected at least 18 default patches applied, got {len(applied)}: {applied}"

manifest = subprocess.check_output(
    [str(SDK / "aapt2.exe"), "dump", "badging", str(APK)],
    text=True, encoding="utf-8", errors="replace")
expected_package = CLONE or "com.linkedin.android"
assert f"package: name='{expected_package}' versionCode='{BUILD}' versionName='{VERSION}'" in manifest, \
    f"expected {VERSION} build {BUILD}: " + manifest[:400]
tree = subprocess.check_output(
    [str(SDK / "aapt2.exe"), "dump", "xmltree", "--file", "AndroidManifest.xml", str(APK)],
    text=True, encoding="utf-8", errors="replace")
gms = "GmsCore support" in applied
push_vendor = "app.revanced" if gms else "com.google"
assert f'"{push_vendor}.android.c2dm.intent.RECEIVE"' in tree, "Push receiver uses the wrong service"
assert (meta_data_value(tree, "app.revanced.MICROG_PACKAGE_NAME") is not None) == gms, \
    "microG metadata does not match the selected patches"
if CLONE:
    assert "Install next to LinkedIn" in applied, "Clone patch not applied"
    assert f"application-label:'{args.clone_label}'" in manifest, "Clone app name missing"
    assert f'package="{CLONE}"' in tree, "Clone package missing from the manifest"
    for authority in ("fileprovider", "androidx-startup", "meridian-provider", "appfinder.suggestions",
                      "RealTimeSystemSubscriptions", "persona.provider", "mlkitinitprovider", "firebaseinitprovider"):
        assert f'"{CLONE}.{authority}"' in tree, f"Provider authority {authority} not moved"
        assert f'"com.linkedin.android.{authority}"' not in tree, f"Provider authority {authority} still the stock one"
    assert f'"{CLONE}.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"' in tree, "Not-exported receiver permission not moved"
    assert '"com.linkedin.android.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"' not in tree
    assert f'"cct.{CLONE}"' in tree, "Custom tab return host not moved"
    assert '"cct.com.linkedin.android"' not in tree
    # microG presents the copy to Google with LinkedIn's own package and certificate, because
    # LinkedIn's OAuth client is registered for those. Renaming the spoof made Google reject sign-in.
    if gms:
        spoofed_name = meta_data_value(tree, "app.revanced.android.gms.SPOOFED_PACKAGE_NAME")
        assert spoofed_name == "com.linkedin.android", \
            f"SPOOFED_PACKAGE_NAME is {spoofed_name!r}; Google only knows LinkedIn's own package"
        spoofed_signature = meta_data_value(tree, "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE")
        assert spoofed_signature == LINKEDIN_SIGNATURE, \
            f"SPOOFED_PACKAGE_SIGNATURE is {spoofed_signature!r}, not LinkedIn's certificate"
        print(f"Clone package: {CLONE}, label: {args.clone_label}, Google identity: {spoofed_name}")


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
    firebase_dex = []
    with zipfile.ZipFile(APK) as archive:
        dex_names = sorted(name for name in archive.namelist()
                           if re.fullmatch(r"classes\d*\.dex", name))
        assert dex_names, "Patched APK has no DEX files"
        for name in dex_names:
            data = archive.read(name)
            if b"X-Android-Cert" in data:
                firebase_dex.append(name)
            file = root / name
            file.write_bytes(data)
            for descriptor in class_descriptors(data):
                classes[descriptor] += 1
                if descriptor in NEW_HOOK_CALLERS or descriptor in DIVIDER_CLASSES or descriptor in (
                        SDUI_FILTER, POST_MENU, COMPONENT_TRANSFORMER, SETTINGS, SETTINGS_ACTIVITY,
                                  MATERIAL_YOU, HIDE_ADS, GLASS_BAR, NAVIGATION_BAR, SLIM_BEHAVIOR,
                                  APP_COMPAT, MAIN_ACTIVITY, NAV_PANEL_TRANSFORMER, NAV_PANEL_PRESENTER) or descriptor.startswith(
                                      "Lcom/linkedin/android/home/navpanel/HomeNavPanelFeature$"):
                    targets.setdefault(descriptor, name)

    assert classes[SDUI_FILTER] == 1, "LinkedIn SDUI filter is missing or duplicated"
    assert classes[SETTINGS] == 1, "LinkedIn Settings is missing or duplicated"
    assert classes[HIDE_ADS] == 1, "LinkedIn legacy ad filter is missing or duplicated"
    assert classes[POST_COMMENTARY] == 1, "LinkedIn post-text parser is missing or duplicated"
    for helper in ("MenuIconIds", "AccentPalette", "SlidingPill"):
        assert classes[f"Lapp/badfella/extension/linkedin/{helper};"] == 1, f"{helper} missing or duplicated"
    assert classes[GLASS_BAR] == 1, "LinkedIn glass navigation bar is missing or duplicated"
    assert classes[NAVIGATION_BAR] == 1, "LinkedIn navigation bar helper is missing or duplicated"
    assert classes[COMPONENT_TRANSFORMER] == 1, "ComponentTransformer missing or duplicated"
    assert classes[MAIN_ACTIVITY] == 1, "MainActivity missing or duplicated"
    assert all(count == 1 for count in classes.values()), "Duplicate DEX classes"

    def disassemble(name):
        return subprocess.check_output(
            [str(SDK / "dexdump.exe"), "-d", str(root / name)],
            text=True, encoding="utf-8", errors="replace")

    for patch, hooks in NEW_PATCH_HOOKS.items():
        if patch in applied:
            for caller, hook in hooks:
                assert hook in disassemble(targets[caller]), f"{patch}: missing {hook}"

    if "Remove gaps and dividers" in applied:
        for caller in DIVIDER_CLASSES:
            dex = disassemble(targets[caller])
            section = next(block for block in re.split(r"\nClass #", dex)
                           if re.search(r"Class descriptor\s+: '" + re.escape(caller) + "'", block))
            assert "MaterialYou;.flatDivider:" in section, f"Missing divider hook in {caller}"
        print("Divider hooks present in both SDUI components")

    # Check the header's actual value register at every Firebase request call.
    identity_headers = {"X-Android-Cert": LINKEDIN_SIGNATURE.upper(), "X-Android-Package": "com.linkedin.android"}
    verified_headers = Counter()
    for name in firebase_dex:
        instructions = re.findall(r"\|[0-9a-f]+: (.+)", disassemble(name))
        for index, instruction in enumerate(instructions):
            header = re.match(r'const-string(?:/jumbo)? (v\d+), "(X-Android-Cert|X-Android-Package)"', instruction)
            if not header:
                continue
            verified_headers[header[2]] += 1
            calls = [(offset, re.match(
                r'invoke-virtual \{v\d+, ' + header[1] + r', (v\d+)\}, '
                r'Ljava/net/URLConnection;\.(?:add|set)RequestProperty:', candidate))
                for offset, candidate in enumerate(instructions[index + 1:index + 7], index + 1)]
            call = next(((offset, match) for offset, match in calls if match), None)
            assert call, "Firebase identity request call not found"
            offset, match = call
            expected = f'const-string {match[1]}, "{identity_headers[header[2]]}"'
            assert instructions[offset - 1].startswith(expected), \
                f"Firebase identity header is not restored in {name}: {instructions[offset - 1]}"
    assert verified_headers.keys() == identity_headers.keys(), "Firebase identity headers missing"
    print(f"Firebase: {dict(verified_headers)} restored; push uses {push_vendor}")

    transformer = disassemble(targets[COMPONENT_TRANSFORMER])
    assert "SduiComponentFilter" in transformer, "SDUI filter class not referenced from ComponentTransformer"
    assert ";.shouldHide:" in transformer or ".shouldHide:" in transformer, \
        "SDUI shouldHide hook not injected into ComponentTransformer"
    assert ";.rewrite:" in transformer or ".rewrite:" in transformer, \
        "SDUI rewrite hook not injected into ComponentTransformer"

    main_act = disassemble(targets[MAIN_ACTIVITY])
    assert "SettingsShortcut" in main_act and "onMainActivityCreated:" in main_act, \
        "SettingsShortcut hook not injected into MainActivity"

    panel = disassemble(targets[NAV_PANEL_TRANSFORMER])
    assert "NavPanelPatch;.filterPanel:" in panel, "Native Games filter missing"
    assert "NavPanelPatch;.addSettingsItem:" not in panel, "Old full-width settings entry remains"
    presenter = disassemble(targets[NAV_PANEL_PRESENTER])
    assert "MoreMenu;.onSectionBind:" in presenter, "Shared shortcut card binding missing"
    footer_dex = {name for descriptor, name in targets.items()
                  if descriptor.startswith("Lcom/linkedin/android/home/navpanel/HomeNavPanelFeature$")}
    assert any("MoreMenu;.addToFooter:" in disassemble(name) for name in footer_dex), \
        "Footer settings card insertion missing"

    # The scroll hot path must carry the per-component memo and must not serialize every component.
    filter_dex = disassemble(targets[SDUI_FILTER])
    for method in ("SduiComponentFilter.memo:", "SduiComponentFilter.viewName:", "SduiComponentFilter.payload:",
                   "SduiComponentFilter.screenName:"):
        assert method in filter_dex, f"Missing fast-path method {method}"
    post_menu_dex = disassemble(targets[POST_MENU])
    assert "PostCommentary;.text:" in post_menu_dex, "Post menu still uses the tracking-metadata text lookup"
    assert "MenuIconIds;.swap:" in post_menu_dex, "Post menu icon rewrite is not wired"
    assert "PostMenu.signature:" in post_menu_dex, "Missing post-menu payload dedupe"

    # Promoted, boosted and sponsored detection under any view name, plus label-only posts.
    for marker in ("sponsoredContentV2", "sponsoredCreative", "sponsoredUpdate", "adCreative",
                   "adUpdate", "promotedUpdate", "leadGenForm", "leadgen"):
        assert marker in filter_dex, f"Missing SDUI ad marker {marker}"
    for method in ("hasSponsoredTracking", "hasFieldStartingWith"):
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
    assert "AccentPalette;.shade:" in material_you, "Custom accent palette is not wired into theme colors"
    assert re.search(r"name\s+: 'amoled'", material_you), "Pitch black tone mapping missing"
    assert re.search(r"name\s+: 'pitchBlackContext'", material_you), "Pitch black context hook missing"
    for tone in ("ff000000", "ff0d0d0d", "ff1a1a1a"):
        assert tone in material_you, f"Missing Pitch black tone {tone}"

    app_compat = disassemble(targets[APP_COMPAT])
    assert "MaterialYou;.pitchBlackContext:" in app_compat, \
        "Pitch black context hook not injected into AppCompatActivity.attachBaseContext"

    # The glass bar keeps its own padding and pads the bar so the capsule floats above the system navigation bar.
    glass_bar = disassemble(targets[GLASS_BAR])
    assert "SlidingPill;.select:" in glass_bar, "Glass bar is not using the spring model"
    for method in ("GlassNavigationBar$Selection;.floatOverSystemBar:",
                   "GlassNavigationBar$Selection;.navigationBar:"):
        assert method in glass_bar, f"Missing glass bar layout method {method}"
    assert "getStableInsetBottom" in glass_bar, "Glass bar does not read the system navigation bar inset"
    assert "setPadding" in glass_bar, "Glass bar does not make room for the floating capsule"

    # A hidden tab label takes no room, and the icon's margins are cleared so its constraints center it.
    navigation_bar = disassemble(targets[NAVIGATION_BAR])
    for method in ("NavigationBar.showLabel:", "NavigationBar.ownMargins:", "NavigationBar.setMargins:",
                   "NavigationBar.slideOffset:"):
        assert method in navigation_bar, f"Missing navigation bar method {method}"
    assert "Math;.max:" in navigation_bar and "View;.getHeight:" in navigation_bar, \
        "NavigationBar.slideOffset does not use the bar's own height"

    # Hiding the glass bar slides it by its padded height, so no part of the capsule stays on screen.
    behavior = disassemble(targets[SLIM_BEHAVIOR])
    assert "NavigationBar;.slideOffset:" in behavior, \
        "slideOffset hook not injected into SlimBottomNavigationBehavior.animateOffset"

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

    if CLONE:
        # The searchable activity names its suggestion provider through this string resource.
        entry = re.search(r"resource 0x[0-9a-f]+ string/appfinder_authority\n(.*?)(?=\n    resource |\Z)",
                          resources, re.S)
        assert entry, "appfinder_authority string missing from resources"
        assert f'"{CLONE}.appfinder.suggestions"' in entry.group(1), \
            "appfinder_authority still names the stock suggestion provider"

subprocess.run([str(SDK / "zipalign.exe"), "-c", "4", str(APK)], check=True)
print(f"PASS: LinkedIn {VERSION} build {BUILD}, {len(applied)} patches, SDUI transformer hooks, "
      f"SettingsShortcut hook, sponsored/promoted/boosted filters, Pitch black resources and hooks, "
      f"floating glass navigation bar with a full-height slide, "
      f"{len(classes)} unique classes, ZIP alignment" +
      (f", clone package {CLONE} keeping LinkedIn's Google identity" if CLONE else ""))
