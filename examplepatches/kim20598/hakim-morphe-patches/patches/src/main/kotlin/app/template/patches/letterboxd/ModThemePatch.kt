package app.template.patches.letterboxd

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.letterboxd.theme.ACCENT_OVERLAYS
import app.template.patches.letterboxd.theme.MIDNIGHT_SURFACES
import app.template.patches.letterboxd.theme.PURPLE_SURFACES
import app.template.patches.letterboxd.theme.buildColorOverlay
import app.template.patches.letterboxd.theme.ensurePublicColor
import app.template.patches.letterboxd.theme.setStyleItem
import app.template.patches.letterboxd.theme.styleItemValue
import app.template.patches.letterboxd.theme.upsertColor
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import org.w3c.dom.Element

private const val BOTTOM_SHEET_BG = "morphe_bottomsheet_bg"
private const val BOTTOM_SHEET_BG_ID = "0x7f060507"

private val OLED_SURFACES = mapOf(
    "gray0D1012" to "#FF000000",
    "gray14181C" to "#FF000000",
    "gray181C20" to "#FF000000",
    "windowBackground" to "#FF000000",
    "gray1C242C" to "#FF121212",
    "gray202830" to "#FF121212",
    "gray283038" to "#FF121212",
    "gray223344" to "#FF1C1C1C",
    "gray2C3440" to "#FF1C1C1C",
    "gray303840" to "#FF1C1C1C",
    "gray334455" to "#FF2E2E2E",
    "gray445566" to "#FF2E2E2E",
    "colorPrimaryDark" to "#FF4A4A4A",
    BOTTOM_SHEET_BG to "#FF161616",
)

/**
 * Every runtime theme overlay the "Appearance" patch can load. Keys match `Prefs.surface()`
 * values and the file names written into `assets/morphe/`:
 *   oled     -> assets/morphe/oled.arsc
 *   purple   -> assets/morphe/theme_purple.arsc
 *   midnight -> assets/morphe/theme_midnight.arsc
 * `stock` is intentionally absent — no overlay, Letterboxd's own colours.
 */
private val THEME_OVERLAYS: Map<String, Map<String, String>> = mapOf(
    "oled" to OLED_SURFACES,
    "purple" to PURPLE_SURFACES,
    "midnight" to MIDNIGHT_SURFACES,
)

private fun overlayFileName(key: String): String =
    if (key == "oled") "oled.arsc" else "theme_$key.arsc"

internal val modThemeResourcePatch = resourcePatch {
    execute {
        document("res/values/public.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values/public.xml has no root element")
            ensurePublicColor(document, resources, BOTTOM_SHEET_BG, BOTTOM_SHEET_BG_ID)
        }
        document("res/values/colors.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values/colors.xml has no root element")
            upsertColor(document, resources, BOTTOM_SHEET_BG, "@color/colorPrimary")
        }
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
            if (current == null || current == "@color/colorPrimary") {
                setStyleItem(document, "Widget.Letterboxd.BottomSheet.Modal", "backgroundTint", "@color/$BOTTOM_SHEET_BG")
            }
        }

        val manifest = get("AndroidManifest.xml")
        val public = get("res/values/public.xml")
        val packageName = packageMetadata.packageName

        THEME_OVERLAYS.forEach { (key, colors) ->
            buildColorOverlay(
                sourceManifest = manifest,
                sourcePublic = public,
                packageName = packageName,
                outputFile = get("assets/morphe/${overlayFileName(key)}", copy = false),
                colors = colors,
            )
        }

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
        "re-patching: a dark surface theme (Pure Black / Purple / Midnight Blue), a custom accent " +
        "colour (presets or any hex), and the bottom-navigation selected style. Applied at runtime " +
        "via resource overlays on Android 12 and later. Needs the \"Mod settings\" patch. If the " +
        "separate \"Material You theme\" patch is also applied, its OLED and nav-bar-match " +
        "switches are disabled here automatically — the two theming systems can't run at once.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    dependsOn(modThemeResourcePatch, modSettingsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, Lapp/template/extension/settings/ModTheme;->initialize(Landroid/content/Context;)V",
        )
    }
}
