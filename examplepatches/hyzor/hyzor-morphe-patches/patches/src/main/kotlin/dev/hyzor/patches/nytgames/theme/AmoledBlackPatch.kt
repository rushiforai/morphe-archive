package dev.hyzor.patches.nytgames.theme

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction51l
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import dev.hyzor.patches.nytgames.shared.Constants.NYT_GAMES
import java.io.File

/** Pure black as an opaque ARGB literal. */
private const val BLACK = 0xFF000000L

/** The hex spelling written into the resource files. */
private const val BLACK_HEX = "#ff000000"

/**
 * The dark-theme page greys used by the games design system in 6.48.0.
 *
 * `#121212` is the page background, `#2A2A2A` the modal / subdued page background.
 */
private val DARK_GREYS = setOf(0xFF121212L, 0xFF2A2A2AL)

/**
 * Colours of `res/values-night/colors.xml` that paint the dark theme's pages and surfaces.
 *
 * `backgroundTertiary` (#424242) is intentionally not in this set: it is the third elevation
 * level (chips and cards on cards), and flattening it to black removes the only separation those
 * small surfaces have.
 */
private val DARK_COLORS = setOf(
    "backgroundPage",
    "backgroundPrimary",
    "backgroundPageSubdued",
    "backgroundSecondary",
    "backgroundElevated",
    "backgroundModal",
    // The toolbar of the puzzle activities.
    "game_screen_toolbar_color",
    // Wordle's own dark tone (#121213). Its board is drawn by a WebView (see README) and keeps the
    // web bundle's colours; this only affects the native surfaces that use the resource.
    "wordlePrimary",
)

/**
 * The `*AlwaysDark` variants live in the default configuration because they are used by surfaces
 * that stay dark no matter which theme the user picked, so they need the same treatment.
 */
private val ALWAYS_DARK_COLORS = setOf(
    "backgroundPrimaryAlwaysDark",
    "backgroundSecondaryAlwaysDark",
    "backgroundElevatedAlwaysDark",
    // AppCompat's `?android:colorBackground` for dark themes; this is the window background that
    // shows behind the gesture bar and around activities.
    "background_material_dark",
    "material_grey_850",
    "m3_ref_palette_grey20",
)

private val COLOR_ENTRY = Regex("""<color name="([^"]+)">[^<]*</color>""")

/**
 * Adds items to an existing `<style>` block of a decoded values file.
 *
 * Used to force the window background and the navigation bar colour, which are not plain
 * `<color>` resources but theme attributes pointing at the library themes.
 */
private fun String.addStyleItems(styleName: String, items: List<String>): String {
    val marker = Regex("""<style name="${Regex.escape(styleName)}"(\s[^>]*)?>""")
    val match = marker.find(this) ?: throw PatchException("style $styleName not found")
    val insertAt = match.range.last + 1
    return substring(0, insertAt) + items.joinToString("") { "<item name=\"$it\">$BLACK_HEX</item>" } + substring(insertAt)
}

private fun String.recolor(names: Set<String>): String = COLOR_ENTRY.replace(this) { match ->
    if (match.groupValues[1] in names) {
        """<color name="${match.groupValues[1]}">$BLACK_HEX</color>"""
    } else {
        match.value
    }
}

/**
 * The resource half of the patch: the XML views (bottom tab bar, archive sheets, dialogs, the
 * puzzle activities) resolve their backgrounds from `colors.xml`, not from the Compose palette.
 *
 * Not a separate entry in the patch list: it is pulled in by [amoledBlackPatch].
 */
private val amoledBlackColorsPatch = resourcePatch(
    name = null,
    default = false,
) {
    execute {
        listOf(
            "res/values-night/colors.xml" to DARK_COLORS,
            "res/values/colors.xml" to ALWAYS_DARK_COLORS,
        ).forEach { (path, names) ->
            val file = get(path)
            val text = file.readText()

            val missing = names.filterNot { text.contains("""name="$it"""") }
            if (missing.isNotEmpty()) {
                throw PatchException("$path is missing ${missing.joinToString()} — re-resolve the colours for this version")
            }

            val edited = text.recolor(names)
            if (edited == text) {
                throw PatchException("$path was not changed by the AMOLED black patch")
            }
            file.writeText(edited)
        }

        // The navigation bar and the window background are theme attributes, not colour values.
        get("res/values-night/styles.xml").editText { text ->
            text.addStyleItems(
                "AppTheme",
                listOf("android:windowBackground", "android:navigationBarColor"),
            )
        }
    }
}

private fun File.editText(edit: (String) -> String) {
    val text = readText()
    val edited = edit(text)
    if (edited != text) writeText(edited)
}

/**
 * The app already has a dark theme, but it paints its pages `#121212` and its surfaces `#2A2A2A`
 * — dark grey rather than black, so an OLED panel still lights those pixels up.
 *
 * The theme comes from two places, and both have to be covered:
 *
 *  - the Compose design system keeps its palettes as plain ARGB constants in the static
 *    initialiser of `ExtendedColorsKt` (see [DarkPaletteFingerprint]), one `const-wide` per
 *    colour, which is what most of the modern screens use;
 *  - the XML views resolve `res/values-night/colors.xml` instead, which is what the bottom tab
 *    bar and the puzzle activities use.
 *
 * The light values are left alone: the night file only applies in dark mode, and the light
 * palette only reuses `#121212` as its content text, which is invisible as a change.
 */
@Suppress("unused")
val amoledBlackPatch = bytecodePatch(
    name = "AMOLED Black",
    description = "Paints the app's own dark theme pure black (#000000) instead of dark grey, for OLED screens. " +
        "Native UI only: the games themselves are WebViews with their own web CSS and stay dark grey.",
    default = true,
) {
    compatibleWith(NYT_GAMES)

    dependsOn(amoledBlackColorsPatch)

    execute {
        val method = DarkPaletteFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        var replaced = 0
        instructions.forEachIndexed { index, instruction ->
            if (instruction !is WideLiteralInstruction || instruction.wideLiteral !in DARK_GREYS) {
                return@forEachIndexed
            }

            method.replaceInstruction(
                index,
                BuilderInstruction51l(Opcode.CONST_WIDE, (instruction as OneRegisterInstruction).registerA, BLACK),
            )
            replaced++
        }

        if (replaced == 0) {
            throw PatchException("No dark-theme colours found in ExtendedColorsKt.<clinit> — re-resolve the palette")
        }
    }
}
