"""LinkedIn patch registration and source-anchor checks; no APKs or network required."""
import json
import os
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
PACKAGE = "com.linkedin.android"
PATCHES_DIR = ROOT / "patches/src/main/kotlin/app/badfella/patches/linkedin"
EXT_DIR = ROOT / "extensions/extension/src/main/java/app/badfella/extension/linkedin"
CLONE_KT = PATCHES_DIR / "misc/ClonePatch.kt"

EXPECTED_LINKEDIN_PATCHES = {
    "Always show navigation bar",
    "Anonymous profile viewing",
    "Block tracking",
    "Copy post text",
    "Copy text",
    "Customize navigation bar",
    "Dark app icon",
    "Disable double-tap like",
    "Download media",
    "Expand posts",
    "Feed filters",
    "Glass navigation bar",
    "GmsCore support",
    "Hide Premium upsells",
    "Hide ads",
    "Hide bottom tabs",
    "Hide promoted jobs",
    "Hide suggested posts",
    "Icon-only post actions",
    "Install next to LinkedIn",
    "Keep feed on reopen",
    "Material You",
    "Material icons in the bottom bar",
    "Messaging",
    "More tab",
    "Navigation bar",
    "Open links directly",
    "Pitch black",
    "Post menu items",
    "Remove gaps and dividers",
    "Sanitize share links",
    "Swipe between feeds",
    "Swipe between tabs",
    "Tap to hide in viewers",
}

NON_DEFAULT_PATCHES = {
    "Dark app icon",
    "Pitch black",
    "Glass navigation bar",
    "GmsCore support",
    "Install next to LinkedIn",
    "Material You",
    "Material icons in the bottom bar",
    "Remove gaps and dividers",
}


class LinkedInCatalogTests(unittest.TestCase):
    def setUp(self):
        self.catalog = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
        self.patches = {
            patch["name"]: patch for patch in self.catalog["patches"]
            if any((compat or {}).get("packageName") == PACKAGE
                   for compat in patch["compatiblePackages"] or [])
        }

    def test_all_34_patches_declared(self):
        self.assertEqual(set(self.patches.keys()), EXPECTED_LINKEDIN_PATCHES)
        self.assertEqual(len(self.patches), 34)

    def test_reviewed_targets_and_version_agnosticism(self):
        for name, patch in self.patches.items():
            targets = patch["compatiblePackages"][0]["targets"]
            self.assertEqual(len(targets), 3, f"{name} should have 3 targets")
            self.assertEqual(targets[0]["version"], "4.1.1267")
            self.assertEqual(targets[1]["version"], "4.1.1271")
            self.assertEqual(set(targets[1]["versionCodes"].values()), {217900})
            self.assertFalse(targets[1]["isExperimental"])
            # Third target is experimental wildcard for future version support
            self.assertIsNone(targets[2]["version"])
            self.assertTrue(targets[2]["isExperimental"])

    def test_default_patches(self):
        for name, patch in self.patches.items():
            is_default = patch.get("default", True)
            if name in NON_DEFAULT_PATCHES:
                self.assertFalse(is_default, f"{name} should be default=False")
            else:
                self.assertTrue(is_default, f"{name} should be default=True")


class LinkedInSourceTests(unittest.TestCase):
    def test_subpackages_structure(self):
        subdirs = {p.name for p in PATCHES_DIR.iterdir() if p.is_dir()}
        expected_dirs = {"ads", "download", "feed", "links", "messaging", "misc", "navigation", "shared", "theme", "tracking"}
        self.assertTrue(expected_dirs.issubset(subdirs))

    def test_constants_and_compatibility(self):
        constants_kt = (PATCHES_DIR / "shared/Constants.kt").read_text(encoding="utf-8")
        self.assertIn('"com.linkedin.android"', constants_kt)
        self.assertIn('"4.1.1271"', constants_kt)
        self.assertIn('versionCode = 217900', constants_kt)
        self.assertIn('isExperimental = true', constants_kt)
        self.assertIn('EXTENSION_PACKAGE = "Lapp/badfella/extension/linkedin"', constants_kt)

    def test_shared_sdui_component_filter_patch(self):
        shared_kt = (PATCHES_DIR / "shared/SharedPatches.kt").read_text(encoding="utf-8")
        self.assertIn("sduiComponentFilterPatch", shared_kt)
        self.assertIn("settingsPatch", shared_kt)
        self.assertIn("SduiComponentTransformFingerprint", shared_kt)
        self.assertIn("Lcom/linkedin/sdui/transformer/impl/ComponentTransformer;", shared_kt)
        self.assertIn("MainActivityOnCreateFingerprint", shared_kt)
        self.assertIn("NavPanelTransformFingerprint", shared_kt)
        self.assertIn("->shouldHide(Ljava/lang/Object;)Z", shared_kt)
        self.assertIn("SDUI_FILTER_CLASS", shared_kt)

    def test_hide_ads_patch_and_legacy_feed(self):
        hide_ads_kt = (PATCHES_DIR / "ads/HideAdsPatch.kt").read_text(encoding="utf-8")
        self.assertIn("hideAdsPatch", hide_ads_kt)
        self.assertIn("sduiComponentFilterPatch", hide_ads_kt)
        self.assertIn("SponsoredDuplicatesFilterFingerprint", hide_ads_kt)
        self.assertIn("copyWithoutSponsored", hide_ads_kt)
        self.assertIn("CollectionTemplate", hide_ads_kt)

    def test_extension_classes_exist(self):
        expected_classes = [
            "SduiComponentFilter.java",
            "Settings.java",
            "SettingsActivity.java",
            "SduiMediaDownload.java",
            "PostMenu.java",
            "DocumentPdf.java",
            "DownloadMediaPatch.java",
            "FeedSwipe.java",
            "HideAdsPatch.java",
            "LinkCleaner.java",
            "MessagingPatch.java",
            "MaterialYou.java",
            "NavPanelPatch.java",
            "NavigationBar.java",
            "GlassCapsule.java",
            "GlassNavigationBar.java",
            "SwipeTabs.java",
            "MoreMenu.java",
            "OpenLinksDirectlyPatch.java",
            "Proto.java",
            "ProtoEdit.java",
            "ProtoScanner.java",
            "Reflect.java",
            "ShareLinkPatch.java",
            "ShortLinkResolver.java",
            "TrackingPatch.java",
            "ViewerChrome.java",
            "WhatsNew.java",
            "PremiumTakeover.java",
            "ActionBarStyle.java",
            "CopyPostText.java",
        ]
        for cls in expected_classes:
            self.assertTrue((EXT_DIR / cls).is_file(), f"Missing extension class: {cls}")

    def test_sdui_component_filter_has_essential_hooks(self):
        sdui_src = (EXT_DIR / "SduiComponentFilter.java").read_text(encoding="utf-8")
        self.assertIn("public static boolean shouldHide(Object component)", sdui_src)
        self.assertIn("public static Object rewrite(Object component)", sdui_src)
        self.assertIn("isAiView", sdui_src)
        self.assertIn("isGameView", sdui_src)
        self.assertIn("hideFeedUpdate", sdui_src)
        self.assertIn("hidePromotedJob", sdui_src)
        self.assertIn("hasViewTracking", sdui_src)

    def test_sponsored_tracking_hides_any_view_name(self):
        """A promoted component under any view name is dropped, not only feed-full-update."""
        sdui_src = (EXT_DIR / "SduiComponentFilter.java").read_text(encoding="utf-8")
        self.assertIn("if (Settings.hideAds() && hasSponsoredTracking(viewTracking))", sdui_src)
        # That fast path sits in shouldHide before the view-name switch.
        should_hide = sdui_src.split("public static boolean shouldHide", 1)[1]
        fast_path = should_hide.split("switch (viewName)", 1)[0]
        self.assertIn("hasSponsoredTracking(viewTracking)", fast_path)

    def test_sdui_feed_update_covers_all_sponsored_markers_and_labels(self):
        sdui_src = (EXT_DIR / "SduiComponentFilter.java").read_text(encoding="utf-8")
        for marker in ("urn:li:sponsoredContentV2:", "urn:li:sponsoredContent:",
                       "urn:li:sponsoredCreative:", "urn:li:sponsoredUpdate:",
                       "urn:li:adCreative:", "urn:li:adUpdate:", "urn:li:promotedUpdate:",
                       "sponsoredcontent", "sponsoredcreative", "leadgen"):
            self.assertIn(f'"{marker}"', sdui_src)
        self.assertIn("hasPromotedLabel(scanner.strings)", sdui_src)
        self.assertIn('"Promoted"', sdui_src)
        self.assertIn('"Sponsored"', sdui_src)
        self.assertIn('"Dipromosikan"', sdui_src)
        self.assertIn("containsAny(payload, SPONSORED_MARKERS)", sdui_src)

    def test_legacy_feed_filter_ports_comprehensive_pegasus_checks(self):
        hide_ads_src = (EXT_DIR / "HideAdsPatch.java").read_text(encoding="utf-8")
        for token in ("sponsoredcontent", "sponsoredcreative", "sponsoredupdate",
                      "adcreative", "adupdate", "promotedupdate"):
            self.assertIn(f'"{token}"', hide_ads_src)
        for check in ("hasSponsoredUrn", "hasSponsoredTracking", "hasCallToAction",
                      "hasPromotedLabel", "hasBoostHeader", "boostHeader",
                      "leadGenFormContent", "hasSponsoredCarouselItem",
                      "hasSponsoredAggregatedUpdate", "resharedUpdate",
                      "supplementaryActorInfo", "subDescription",
                      "contextualTitleSupplementaryInfo", "MAX_UPDATE_DEPTH"):
            self.assertIn(check, hide_ads_src)
        # Labels are matched in every relevant locale, like the SDUI path.
        self.assertIn('lower.contains("promoted")', hide_ads_src)
        self.assertIn('lower.contains("sponsored")', hide_ads_src)
        self.assertIn('lower.contains("dipromosikan")', hide_ads_src)

    def test_sdui_component_filter_does_not_serialize_every_component(self):
        """doTransform also runs per viewport sample while scrolling: no path may serialize unconditionally."""
        sdui_src = (EXT_DIR / "SduiComponentFilter.java").read_text(encoding="utf-8")
        # rewrite returns before touching the view name when no feature that edits components is on.
        self.assertIn("if (!expandPosts && !viewer && !postMenu && !copyPostText) return component;", sdui_src)
        # Every editing branch is gated on the component's own view name.
        self.assertIn('private static final String COMMENTARY = "feed-commentary";', sdui_src)
        self.assertIn('private static final String VIEWER_CONTAINER = "feed-update-screen-container";', sdui_src)
        self.assertIn('private static final String CONTROL_MENU = "feed-control-menu";', sdui_src)
        self.assertIn("expandPosts && COMMENTARY.equals(viewName)", sdui_src)
        self.assertIn("viewer && VIEWER_CONTAINER.equals(viewName)", sdui_src)
        self.assertIn("postMenu && viewName.startsWith(CONTROL_MENU)", sdui_src)
        # One reflective view name and one serialization per component per thread, shared by rewrite and shouldHide.
        self.assertIn("ThreadLocal<Object[]> MEMO", sdui_src)
        self.assertIn("memo[0] != component", sdui_src)
        self.assertIn("private static String viewName(Object component)", sdui_src)
        self.assertIn("private static byte[] payload(Object component)", sdui_src)
        # The AI check must not allocate a pattern/array for every component.
        self.assertNotIn("viewName.split(", sdui_src)

    def test_post_menu_scans_a_post_once(self):
        postmenu_src = (EXT_DIR / "PostMenu.java").read_text(encoding="utf-8")
        self.assertIn("private static long signature(byte[] payload)", postmenu_src)
        self.assertIn("if (remembered.containsKey(signature)) return;", postmenu_src)
        # The payload is parsed once and shared with the media extraction.
        self.assertIn("ProtoScanner scanner = ProtoScanner.scan(payload);", postmenu_src)
        self.assertIn("MediaItem.extract(scanner, false)", postmenu_src)
        self.assertNotIn("MediaItem.extract(ProtoScanner.scan(payload)", postmenu_src)


class LinkedInUpstreamSyncTests(unittest.TestCase):
    """The patches ported from loki-patches, fakh-patches and michii-patches."""

    def test_premium_takeover_closes_only_the_shown_page(self):
        src = (EXT_DIR / "PremiumTakeover.java").read_text(encoding="utf-8")
        self.assertIn(".premium.upsells.PremiumUpsellFullPageTakeoverNavGraphScreen", src)
        self.assertIn("Settings.hidePremium()", src)
        self.assertIn("SduiMediaDownload.resumedScreen().endsWith(SCREEN)", src)
        self.assertIn("isShown(fragment)", src)
        self.assertIn("host.onBackPressed()", src)
        # Only closed once the page is really in front and visible, never for a prepared one behind it.
        self.assertIn("host.isFinishing() || host.isDestroyed()", src)
        hook = (EXT_DIR / "SduiMediaDownload.java").read_text(encoding="utf-8")
        self.assertIn("PremiumTakeover.onScreenResumed(activity, fragment, screen);", hook)

    def test_feed_swipe_resolves_the_my_network_tab(self):
        src = (EXT_DIR / "FeedSwipe.java").read_text(encoding="utf-8")
        # The hidden My Network tab is found from the visible tab row, then placed from memory.
        self.assertIn("private static Rect tabNextTo(Rect openLabel, int tab, List<Rect> tappable)", src)
        self.assertIn("private static Rect movedWith(View root, int tab, Rect otherNow)", src)
        self.assertIn("private static Rect remembered(View root, int tab)", src)
        self.assertIn("lastTabBounds", src)
        self.assertIn("onMyNetwork()", src)
        self.assertIn("cancelledSwipe(view, event)", src)
        # A parked Copy text selection must not block the swipe.
        self.assertIn("TextSelectionOverlay.isShowing()", src)
        overlay = (EXT_DIR / "TextSelectionOverlay.java").read_text(encoding="utf-8")
        self.assertIn("static boolean isShowing()", overlay)
        self.assertIn("!a.suspended && a.root.getVisibility() == View.VISIBLE", overlay)

    def test_dark_app_icon_patch_is_a_resource_patch(self):
        src = (PATCHES_DIR / "theme/DarkAppIconPatch.kt").read_text(encoding="utf-8")
        self.assertIn("val darkAppIconPatch = resourcePatch(", src)
        self.assertIn("default = false", src)
        self.assertIn('category("Theme")', src)
        self.assertIn('"res/drawable/ic_launcher_background.xml"', src)
        self.assertIn('LINKEDIN_BLUE_RGB = "0a66c2"', src)
        self.assertIn('BLACK = "#ff000000"', src)
        self.assertIn("getElementsByTagName(\"path\")", src)

    def test_icon_only_actions_hook_measure_and_render_mode(self):
        kt = (PATCHES_DIR / "theme/IconOnlyActionsPatch.kt").read_text(encoding="utf-8")
        self.assertIn("ButtonBarMeasureFingerprint", kt)
        self.assertIn("ButtonBarKt\\$ButtonBarLayout\\$1\\$1;", kt)
        self.assertIn("measure-3p2s80s", kt)
        self.assertIn("->renderMode(Ljava/lang/Object;)Ljava/lang/Object;", kt)
        self.assertIn("->onBarMeasure(Ljava/lang/Object;)V", kt)
        src = (EXT_DIR / "ActionBarStyle.java").read_text(encoding="utf-8")
        for view in ("reaction-button", "feed-comment-button", "feed-share-button",
                     "feed-combined-share-message"):
            self.assertIn(f'case "{view}":', src)
        self.assertIn('"IconOnly"', src)
        self.assertIn('field(policy, "$buttonBarViewData")', src)

    def test_bottom_bar_material_icons_do_not_duplicate_label_and_badge_hooks(self):
        kt = (PATCHES_DIR / "navigation/BottomBarIconsPatch.kt").read_text(encoding="utf-8")
        self.assertIn("val bottomBarIconsPatch = resourcePatch(", kt)
        self.assertIn('MATERIAL_ICONS_OPTION = "materialIcons"', kt)
        self.assertIn("default = false", kt)
        for name in ("ic_nav_mercado_feed_selector_24dp", "ic_nav_mercado_people_selector_24dp",
                     "ic_nav_mercado_notifications_selector_24dp", "ic_nav_mercado_jobs_selector_24dp",
                     "ic_nav_mercado_video_tab_selector_24dp"):
            self.assertIn(f'"{name}"', kt)
        self.assertIn('android:state_selected=\\"true\\"', kt)
        # Labels, badges and hidden tabs stay in NavigationBar's single pair of hooks.
        self.assertNotIn("resizeTabsToCorrectSizes", kt)
        self.assertNotIn("SlimNotificationBadge", kt)

    def test_copy_post_text_reads_the_text_block_payload(self):
        kt = (PATCHES_DIR / "feed/CopyPostTextPatch.kt").read_text(encoding="utf-8")
        self.assertIn("LongClickActionsFingerprint", kt)
        self.assertIn("Lcom/linkedin/sdui/viewdata/action/ClickActions;", kt)
        self.assertIn("dependsOn(sduiComponentFilterPatch)", kt)
        self.assertIn("CopyPostText;->longClick(Ljava/lang/Object;)Ljava/lang/Object;", kt)
        src = (EXT_DIR / "CopyPostText.java").read_text(encoding="utf-8")
        self.assertIn("TEXT_BLOCK_TYPE = 13158", src)
        self.assertIn("isCopyPostTextIncluded", (EXT_DIR / "Settings.java").read_text(encoding="utf-8"))
        self.assertIn("copyPostText", src)
        # The filter hands it the text before the transform builds the ClickActions.
        sdui = (EXT_DIR / "SduiComponentFilter.java").read_text(encoding="utf-8")
        self.assertIn("CopyPostText.onComponent(component, viewName)", sdui)

    def test_always_show_navigation_bar_skips_the_scroll_direction_hook(self):
        kt = (PATCHES_DIR / "navigation/NavigationBarPatch.kt").read_text(encoding="utf-8")
        self.assertIn("val alwaysShowNavigationBarPatch = bytecodePatch(", kt)
        self.assertIn("ScrollDirectionFingerprint", kt)
        self.assertIn("SlimBottomNavigationBehavior;", kt)
        self.assertIn("handleDirection", kt)
        self.assertIn("->alwaysShowNavigationBar()Z", kt)
        self.assertIn('markIncluded("isAlwaysShowNavigationBarIncluded")', kt)
        # The method lives on Settings, not on NavigationBar, which is what EXTENSION_CLASS points at here.
        self.assertIn(
            'invoke-static { }, $SETTINGS_CLASS->alwaysShowNavigationBar()Z', kt)
        self.assertIn('SETTINGS_CLASS = "$EXTENSION_PACKAGE/Settings;"', kt)
        src = (EXT_DIR / "Settings.java").read_text(encoding="utf-8")
        self.assertIn("public static boolean isAlwaysShowNavigationBarIncluded()", src)
        self.assertIn("public static boolean alwaysShowNavigationBar()", src)

    def test_glass_bar_floats_above_the_system_navigation_bar(self):
        src = (EXT_DIR / "GlassNavigationBar.java").read_text(encoding="utf-8")
        # The bar keeps its own padding and adds the capsule's room, the floating margin and the nav bar inset.
        self.assertIn("CAPSULE_ROOM_DP = 6", src)
        self.assertIn("FLOATING_MARGIN_DP = 10", src)
        self.assertIn("void floatOverSystemBar()", src)
        self.assertIn("bar.setPadding(own[0], above, own[2], down)", src)
        self.assertIn("getStableInsetBottom()", src)
        self.assertIn("bar.getRootWindowInsets()", src)
        # A slide that hides the bar must not change the padding, or the bar would relayout while it moves.
        self.assertIn("bar.getTranslationY()", src)
        # The capsule covers the room above and below the tabs, and the pill is inset from it on all sides.
        self.assertIn("top = row.getTop() + tabs.getTop() - room", src)
        self.assertIn("bottom = top + tabs.getHeight() + 2 * room", src)
        self.assertIn("PILL_INSET_DP = 4", src)
        self.assertIn("top + inset", src)
        self.assertIn("bottom - inset", src)

    def test_glass_bar_slides_its_full_height_when_hidden(self):
        src = (EXT_DIR / "NavigationBar.java").read_text(encoding="utf-8")
        # The stock offset is the tab row's height; the padded glass bar is taller, so it slides by its own height.
        self.assertIn("public static int slideOffset(View bar, int offset)", src)
        self.assertIn("offset <= 0", src)
        self.assertIn("Math.max(offset, height + below)", src)
        self.assertIn("bar.getParent() instanceof View", src)
        # The stock bar keeps its own scrolling when the glass bar is off.
        self.assertIn("!Settings.glassNavigationBar()", src)
        kt = (PATCHES_DIR / "navigation/NavigationBarPatch.kt").read_text(encoding="utf-8")
        self.assertIn("AnimateOffsetFingerprint", kt)
        self.assertIn('name = "animateOffset"', kt)
        self.assertIn('"Lcom/linkedin/android/home/bottomnav/SlimBottomBar;"', kt)
        self.assertIn("->slideOffset(Landroid/view/View;I)I", kt)
        # animateOffset is an instance method: p1 is the bar and p2 is the offset.
        self.assertIn("invoke-static { p1, p2 }, $EXTENSION_CLASS->slideOffset", kt)
        self.assertIn("move-result p2", kt)

    def test_hidden_tab_labels_leave_the_icon_centered(self):
        src = (EXT_DIR / "NavigationBar.java").read_text(encoding="utf-8")
        # A hidden label takes no room, and the icon's own constraints center it once its margins are cleared.
        self.assertIn('ICON = "slim_notification_badge_icon"', src)
        self.assertIn('LABEL = "slim_notification_badge_label"', src)
        self.assertIn("label.setVisibility(show ? View.VISIBLE : View.GONE)", src)
        self.assertIn("setMargins(icon, show ? own[0] : 0, show ? own[1] : 0)", src)
        self.assertIn("private static int[] ownMargins(View icon)", src)
        self.assertIn("private static void setMargins(View icon, int top, int bottom)", src)
        # The icon and its label are moved together until the pair sits in the middle of the tab.
        self.assertIn("(tab.getHeight() - (below - above)) / 2f - above", src)
        self.assertNotIn("View.INVISIBLE", src)
        # A tab is laid out again on its own when a label is shown or hidden, so every layout pass is shaped.
        self.assertIn("addOnGlobalLayoutListener(() -> arrange(bar, tabs))", src)


class LinkedInCloneTests(unittest.TestCase):
    """The Install next to LinkedIn patch: its catalog entry, its manifest rename and its code rename."""

    def test_catalog_entry_options_and_default(self):
        catalog = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
        patch = next(patch for patch in catalog["patches"] if patch["name"] == "Install next to LinkedIn")
        self.assertFalse(patch["default"])
        self.assertEqual(patch["category"], "Misc")
        self.assertEqual([compat["packageName"] for compat in patch["compatiblePackages"]], [PACKAGE])
        options = {option["key"]: option for option in patch["options"]}
        self.assertEqual(set(options), {"packageName", "appName"})
        self.assertEqual(options["packageName"]["default"], "com.linkedin.android.clone")
        self.assertEqual(options["appName"]["default"], "LinkedIn Clone")
        self.assertEqual(options["packageName"]["type"], "kotlin.String")
        self.assertEqual(options["appName"]["type"], "kotlin.String")
        self.assertTrue(options["packageName"]["required"] and options["appName"]["required"])

    def test_patch_is_opt_in_and_linkedin_only(self):
        source = CLONE_KT.read_text(encoding="utf-8")
        self.assertIn('name = PATCH_NAME', source)
        self.assertIn('default = false', source)
        self.assertIn('category("Misc")', source)
        self.assertIn("compatibleWith(COMPATIBILITY_LINKEDIN)", source)
        self.assertIn("key = \"packageName\"", source)
        self.assertIn("key = \"appName\"", source)
        self.assertIn("clonePackageProblem(it) == null", source)
        self.assertIn("cloneLabelProblem(it) == null", source)

    def test_manifest_rename_covers_package_permissions_authorities_and_classes(self):
        source = CLONE_KT.read_text(encoding="utf-8")
        for token in (
            'root.setAttribute("package", clone)',
            'private const val AUTHORITIES = "android:authorities"',
            'private const val AFFINITY = "android:taskAffinity"',
            'private const val PROCESS = "android:process"',
            "PERMISSION_DECLARATIONS",
            "PERMISSION_REQUESTS",
            "GUARDS",
            "underClone(name, clone)",
            "cloneAuthority(",
            'private const val TAB_HOST = "cct.$LINKEDIN"',
            'element.setAttribute(HOST, "cct.$clone")',
            "SPOOFED_PACKAGE_NAME",
            "CLONE_LABEL_RESOURCE",
            "CLASS_NAMES",
            'value.startsWith(".")',
            "LINKEDIN + value",
        ):
            self.assertIn(token, source)

    def test_spoofed_package_name_stays_linkedin_for_google_sign_in(self):
        """microG may only ask Google for the client registered to LinkedIn's package and certificate."""
        source = CLONE_KT.read_text(encoding="utf-8")
        self.assertIn("SPOOFED_PACKAGE_NAME", source)
        self.assertIn("Google OAuth", source)
        # The value is read to count it, never rewritten to the copy's package.
        self.assertNotIn("setAttribute(VALUE, clone)", source)
        spoof = source.split('endsWith(".gms.SPOOFED_PACKAGE_NAME")', 1)[1].split("spoofedNames++", 1)[0]
        self.assertNotIn("setAttribute(VALUE", spoof)

    def test_code_rename_handles_authorities_content_uris_and_host(self):
        source = CLONE_KT.read_text(encoding="utf-8")
        for token in (
            "renameCloneStrings",
            "CONST_STRING_JUMBO",
            '"content://"',
            "namesAuthority",
            "cloneAuthority(authority, clone)",
        ):
            self.assertIn(token, source)

    def test_package_and_app_name_validation_refuse_stock_names(self):
        source = CLONE_KT.read_text(encoding="utf-8")
        self.assertIn("private val TAKEN = listOf(", source)
        self.assertIn('"$LINKEDIN.debug"', source)
        self.assertIn('"$LINKEDIN.learning"', source)
        self.assertIn('"$LINKEDIN.salesnavigator"', source)
        self.assertIn("private val PACKAGE_PART = Regex", source)
        self.assertIn("LABEL_MARKS", source)


if __name__ == "__main__":
    unittest.main()
