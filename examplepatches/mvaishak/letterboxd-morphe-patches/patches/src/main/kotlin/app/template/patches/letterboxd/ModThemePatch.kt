package app.template.patches.letterboxd

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.letterboxd.theme.ACCENT_OVERLAYS
import app.template.patches.letterboxd.theme.buildColorOverlay
import app.template.patches.letterboxd.theme.ensurePublicColor
import app.template.patches.letterboxd.theme.setStyleItem
import app.template.patches.letterboxd.theme.styleItemValue
import app.template.patches.letterboxd.theme.upsertColor
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import org.w3c.dom.Element

/**
 * `Widget.Letterboxd.BottomSheet.Modal` (the log/rate/similar action sheets) paints its background
 * with `@color/colorPrimary`, an alias for `@color/gray445566` — the same resource the ratings
 * histogram bars use, kept at a deliberately visible grey (`#FF2E2E2E`) rather than true black so
 * the bars don't disappear (see [OLED_SURFACES] below). That grey shows through every modal sheet
 * as a "slate" colour instead of black. This indirection colour lets the sheet go pure black
 * without touching the shared histogram-bar tone: it starts as an alias for the same stock colour
 * (so nothing changes when OLED is off) and only [OLED_SURFACES] repoints it.
 */
private const val BOTTOM_SHEET_BG = "morphe_bottomsheet_bg"
// One past the app's real highest "color" type entry (0x7f060506 — confirmed via the compiled
// resources.arsc, a fully dense range with zero private extras beyond the public ones) so the
// generated overlay's entry array stays compact instead of stretching to cover a far-off id.
private const val BOTTOM_SHEET_BG_ID = "0x7f060507"

/**
 * Letterboxd's dark surface greys, remapped to true-black tones. Names match `res/values/public.xml`
 * (all frozen public colour ids); values are OLED tones — elevated
 * surfaces stay a faint grey so histogram bars etc. don't vanish on black.
 */
private val OLED_SURFACES = mapOf(
    "gray0D1012" to "#FF000000",
    "gray14181C" to "#FF000000",
    "gray181C20" to "#FF000000", // colorBackground
    "windowBackground" to "#FF000000",
    "gray1C242C" to "#FF121212",
    "gray202830" to "#FF121212",
    "gray283038" to "#FF121212",
    "gray223344" to "#FF1C1C1C",
    "gray2C3440" to "#FF1C1C1C",
    "gray303840" to "#FF1C1C1C",
    "gray334455" to "#FF2E2E2E", // colorPrimary / histogram bars — kept subtle
    "gray445566" to "#FF2E2E2E",
    // Unfilled rating stars (log sheet etc.) tint with colorPrimaryDark (= @color/gray334455);
    // a direct, lighter value here keeps them visible without brightening the histogram bars.
    "colorPrimaryDark" to "#FF4A4A4A",
    // Modal action sheets (log, rate, similar) — see the BOTTOM_SHEET_BG doc comment above.
    // #161616, not pure black: matches the shade the old full-app OLED patch used for this sheet
    // (and the one Mod settings' own dialogs already use) rather than a flatter true #000000.
    BOTTOM_SHEET_BG to "#FF161616",
)

/**
 * Emits the runtime overlay tables loaded by `ModThemeApi31`: `assets/morphe/oled.arsc`
 * and one `accent_<key>.arsc` per accent preset. (Material You surface tint is the patch-time
 * `materialYouThemePatch`, not a runtime overlay.)
 */
internal val modThemeResourcePatch = resourcePatch {
    execute {
        // Introduce the bottom-sheet indirection colour before reading public.xml below, so the
        // overlay-building step sees (and can target) its freshly pinned id.
        document("res/values/public.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values/public.xml has no root element")
            ensurePublicColor(document, resources, BOTTOM_SHEET_BG, BOTTOM_SHEET_BG_ID)
        }
        document("res/values/colors.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values/colors.xml has no root element")
            // Alias, not a literal hex: tracks colorPrimary's stock tone until OLED overlays it.
            upsertColor(document, resources, BOTTOM_SHEET_BG, "@color/colorPrimary")
        }
        // Tag chips (a-list, re-release, etc.) are deliberately left on plain colorPrimary, not
        // our indirection: user feedback was to always match whatever colour other colorPrimary
        // consumers (e.g. the "Film" pill button) use, in every theme, rather than force chips to
        // full black under OLED and risk a mismatch against everything around them. The pointed
        // ends aren't colour-resource-backed at all by default — tag_tail.xml and tag_nose.xml
        // hardcode "#445566" as a literal fillColor — so without this edit they'd silently diverge
        // from the (already-consistent) middle section under Material You. Point both at
        // colorPrimary explicitly so all three pieces track the same value everywhere.
        for (drawable in listOf("res/drawable/tag_tail.xml", "res/drawable/tag_nose.xml")) {
            document(drawable).use { document ->
                val paths = document.getElementsByTagName("path")
                for (i in 0 until paths.length) {
                    (paths.item(i) as Element).setAttribute("android:fillColor", "@color/colorPrimary")
                }
            }
        }
        document("res/values/styles.xml").use { document ->
            val current = styleItemValue(document, "Widget.Letterboxd.BottomSheet.Modal", "backgroundTint")
            // These two patches are independent, so execution order between them isn't guaranteed.
            // Only take over the stock value; if "Material You theme" already repointed this to its
            // own indirection colour (whichever order the two ran in), leave that alone — it wins.
            if (current == null || current == "@color/colorPrimary") {
                setStyleItem(document, "Widget.Letterboxd.BottomSheet.Modal", "backgroundTint", "@color/$BOTTOM_SHEET_BG")
            }
        }

        val manifest = get("AndroidManifest.xml")
        val public = get("res/values/public.xml")
        val packageName = packageMetadata.packageName

        buildColorOverlay(
            sourceManifest = manifest,
            sourcePublic = public,
            packageName = packageName,
            outputFile = get("assets/morphe/oled.arsc", copy = false),
            colors = OLED_SURFACES,
        )

        ACCENT_OVERLAYS.forEach { (key, colors) ->
            buildColorOverlay(
                sourceManifest = manifest,
                sourcePublic = public,
                packageName = packageName,
                outputFile = get("assets/morphe/accent_$key.arsc", copy = false),
                colors = colors,
            )
        }
    }
}

@Suppress("unused")
val modThemePatch = bytecodePatch(
    name = "Appearance",
    description = "In-app appearance controls, adjustable from the Letterboxd Mods screen without " +
        "re-patching: a true-black OLED surface, a custom accent colour (presets or any hex), and " +
        "the bottom-navigation selected style. Applied at runtime via resource overlays on " +
        "Android 12 and later. Needs the \"Mod settings\" patch. If the separate \"Material You " +
        "theme\" patch is also applied, its OLED and nav-bar-match switches are disabled here " +
        "automatically — the two theming systems can't run at once.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    // modSettingsPatch carries the MainActivity.setup hook (ModChrome.applyBottomNav) that
    // ModChrome also uses for the bottom-nav selected style (the pill); the selected-icon colour
    // is done by an overlay here.
    dependsOn(modThemeResourcePatch, modSettingsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Same method modSettingsPatch hooks; ModTheme.initialize also calls Prefs.load, so the
        // order the two prepends land in does not matter.
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, Lapp/template/extension/settings/ModTheme;->initialize(Landroid/content/Context;)V",
        )
    }
}
