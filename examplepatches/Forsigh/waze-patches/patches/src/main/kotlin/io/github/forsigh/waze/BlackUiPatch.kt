package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction51l
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction51l
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import org.w3c.dom.Element

/**
 * Black UI background - repaints Waze's dark app chrome to pure #000000.
 *
 * Two halves, one user-visible row ("AMOLED Dark Mode For UI" lives on [blackUiDexPatch]; the
 * resource half [blackUiPatch] is hidden and runs as its dependency):
 *
 * 1. Resource half. The app's screens (bottom sheet, menus, dialogs, bars) take their dark
 * surfaces from a small set of named colours in `res/values/colors.xml` plus the Material 3
 * `m3_sys_color_dark_surface_container_*` family (the neutral 4/10/12/17/22 ramp that paints
 * recent sheets, search fields and full-screen panels), and turns off the theme's elevation
 * overlay in `res/values/styles.xml` - the colorPrimary-tinted wash Waze enables on its dark
 * themes that lifts black surfaces back up to grey. On the live app the dominant one measures
 * #202124 - exactly `Grey900`, which is the leaf behind Waze's own `background_default`
 * (night), `background_default_negative`, `always_dark_background_default` and the night ETA
 * bar drawable; the rest are the AppCompat / Material `background`/`surface` sets that paint
 * floating windows and dialogs. This half rewrites those leaves to #000000, so every surface
 * that aliases them lands on true black in one step.
 *
 * 2. Palette-constant half. The screens Waze has moved to Compose do not read those resources
 * at all: one static initialiser builds the whole UI palette in code, loading each colour as a
 * `const-wide` ARGB literal into `ColorKt.Color(J)J`. Five of those literals are the pixels
 * users actually flagged. Rewritten to opaque black: 0xFF202124 (the profile / search panels
 * and sheet headers) and 0xFF3C4043 (the chip fill, e.g. "See profile"). Rewritten to pure
 * white (measured from dark-mode screenshots of the "Where to?" bubble): 0xFF72767D (the left
 * magnifier icon and hairline separators), 0xFF90959C (the placeholder text) and 0xFFE8EAED
 * (the microphone and other light icons). Located on 5.25.4.900 by scanning every `classes*.dex`
 * for the raw int32 patterns: each occurs exactly once in the whole app, all in one method
 * (`com.waze.ui.q.a.e.a.b.<clinit>` in classes7.dex). The patch anchors on the 0xFF202124
 * literal and throws if any site moves or duplicates - it never reports a repaint it did not
 * make. The remaining ramp entries (0xFF55595E and friends) are left alone; extend this table
 * by evidence, never by guess.
 *
 * The resource half runs through the patcher's resource pipeline: with the row selected the
 * patcher decodes resources, edits the decoded documents, and the incremental encoder writes
 * only the changed entries back into the resource table - the rest of the table is reused
 * byte-for-byte. (No asset files are touched, so the build stays in the same pack-safety class
 * as the code-only patches.)
 *
 * Scope: dark-mode backgrounds only - the light theme stays as Waze built it; text, icons,
 * buttons and the map keep their colours. Day/night map palettes are the Theme row's job, not
 * this one's.
 */
private val BLACK_UI_COLORS = mapOf(
    // Waze's own dark surface family (the measured #202124 sheet + ETA bar + dark defaults),
    // plus the mid grey behind the "See profile" pill and the takeover panels.
    "Grey900" to "#000000",
    "Grey800" to "#000000",
    // AppCompat dark themes: window background and floating windows (dialogs/popups).
    "material_grey_850" to "#000000",
    "material_grey_800" to "#000000",
    "material_grey_900" to "#000000",
    // Google design library dark background/surface (#121212).
    "design_dark_default_color_background" to "#000000",
    "design_dark_default_color_surface" to "#000000",
    // Material 3 dark background/surface/dim - one shared leaf.
    "m3_ref_palette_neutral6" to "#000000",
    // Material 3 surface containers - the one extra layer over the base surface that paints
    // bottom sheets, search fields, pills and full-screen panels. The light-theme twins live
    // under different names, and the palette ramps they reference stay untouched, so light
    // mode and light-mode text keep their stock colours.
    "m3_sys_color_dark_surface_container_lowest" to "#000000",
    "m3_sys_color_dark_surface_container_low" to "#000000",
    "m3_sys_color_dark_surface_container" to "#000000",
    "m3_sys_color_dark_surface_container_high" to "#000000",
    "m3_sys_color_dark_surface_container_highest" to "#000000",
)

/** Dark bases and DayNight bridges whose elevation-tint wash must go. Light bases stay as built. */
private val LIFT_OFF_STYLES = setOf(
    "Base.V14.Theme.Material3.Dark",
    "Base.V14.Theme.Material3.Dark.Dialog",
    "Base.V14.Theme.MaterialComponents.Bridge",
    "Base.V14.Theme.MaterialComponents.Dialog.Bridge",
)

/** Compose palette literals this row repaints, and what they become. */
private val DARK_GREY_CONSTS = mapOf(
    // The profile / search panels and sheet headers ("still grey" after a resource-only edit).
    0xFF202124L to 0xFF000000L,
    // The chip fill - the "See profile" pill and friends.
    0xFF3C4043L to 0xFF000000L,
    // The "Where to?" bubble's content, measured in dark mode on the search screen:
    // the left magnifier icon and hairline separators (Grey600),
    0xFF72767DL to 0xFFFFFFFFL,
    // the placeholder text (Grey500),
    0xFF90959CL to 0xFFFFFFFFL,
    // and the microphone / light icons (grey-200).
    0xFFE8EAEDL to 0xFFFFFFFFL,
)

/** Anchors on the single method that loads the panel grey; the chip grey is its sibling there. */
private val PaletteGrayFingerprint = Fingerprint(
    filters = listOf(literal(0xFF202124L)),
)

/** Night-only resource override: the microphone tint (Grey200) goes pure white. */
private const val NIGHT_MIC_OVERRIDE_NAME = "Grey200"
private const val NIGHT_MIC_OVERRIDE_VALUE = "#ffffff"

/**
 * The visible "AMOLED Dark Mode For UI" row: repaints the two hardcoded Compose palette greys the
 * resource table cannot reach, and pulls in the resource half above for the named colours.
 */
@Suppress("unused")
val blackUiDexPatch = bytecodePatch(
    name = null,
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        val method = PaletteGrayFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException(
                "blackUiDexPatch: the palette initialiser was found but has no implementation; " +
                    "refusing to report a repaint that would change nothing",
            )

        var repainted = 0
        for ((from, to) in DARK_GREY_CONSTS) {
            val sites = implementation.instructions.withIndex()
                .filter { (_, instruction) ->
                    instruction is Instruction51l && instruction.wideLiteral == from
                }
                .map { (index, _) -> index }
            if (sites.size != 1) {
                throw PatchException(
                    "blackUiDexPatch: expected exactly 1 const-wide site for " +
                        "0x${from.toString(16)} in ${method.definingClass}, found ${sites.size} - " +
                        "Waze's palette moved; refusing to report a repaint that did not happen",
                )
            }
            val register = (implementation.instructions.elementAt(sites[0]) as Instruction51l).registerA
            method.replaceInstruction(sites[0], BuilderInstruction51l(Opcode.CONST_WIDE, register, to))
            repainted++
        }
        println("blackUiDexPatch: repainted $repainted compose palette literal(s) (dark greys -> black, bubble content -> white)")
    }
}

/**
 * Hidden resource half of the "AMOLED Dark Mode For UI" row ([blackUiDexPatch] depends on it).
 * Not listed and not selectable on its own; its edits run whenever the row is ticked.
 */
@Suppress("unused")
val blackUiPatch = resourcePatch(
    name = "AMOLED Dark Mode For UI",
    description = "Makes the dark UI pure black.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("UI Customization")



    dependsOn(blackUiDexPatch)

    execute {
        var edited = 0
        var checked = 0
        for (path in listOf("res/values/colors.xml", "res/values-night/colors.xml")) {
            val doc = try {
                document(path)
            } catch (e: Exception) {
                println("blackUiPatch: $path not present in this build - skipping")
                continue
            }
            checked++
            doc.use { d ->
                val nodes = d.getElementsByTagName("color")
                for (i in 0 until nodes.length) {
                    val element = nodes.item(i) ?: continue
                    val name = element.attributes?.getNamedItem("name")?.nodeValue ?: continue
                    val target = BLACK_UI_COLORS[name] ?: continue
                    if (element.textContent.trim() != target) {
                        element.textContent = target
                        println("blackUiPatch: $path: $name -> $target")
                        edited++
                    }
                }
            }
        }
        // Second pass: kill the elevation tint on the dark themes so surfaces that sit at an
        // elevation stay #000000 instead of lifting back to a grey wash.
        var lifts = 0
        for (path in listOf("res/values/styles.xml", "res/values-night/styles.xml")) {
            val doc = try {
                document(path)
            } catch (e: Exception) {
                println("blackUiPatch: $path not present in this build - skipping")
                continue
            }
            doc.use { d ->
                val styles = d.getElementsByTagName("style")
                for (i in 0 until styles.length) {
                    val style = styles.item(i) as? Element ?: continue
                    val styleName = style.attributes?.getNamedItem("name")?.nodeValue ?: continue
                    if (styleName !in LIFT_OFF_STYLES) continue
                    val items = style.getElementsByTagName("item")
                    for (j in 0 until items.length) {
                        val item = items.item(j) ?: continue
                        if (item.attributes?.getNamedItem("name")?.nodeValue == "elevationOverlayEnabled" &&
                            item.textContent.trim() == "true"
                        ) {
                            item.textContent = "false"
                            println("blackUiPatch: $path: elevationOverlayEnabled -> false in $styleName")
                            lifts++
                        }
                    }
                }
            }
        }
        if (edited == 0 && lifts == 0) {
            throw PatchException(
                "blackUiPatch: neither the expected UI background colours nor any elevation overlay flags were found in the decoded resources - refusing to install an edit that would do nothing",
            )
        }

        // Third pass: the microphone icon's tint is a light grey RESOURCE (Grey200 #e8eaed), not
        // part of the Compose palette. Override it to pure white for night mode ONLY, so light
        // mode keeps the value its light hairlines rely on.
        var nightEdits = 0
        try {
            document("res/values-night/colors.xml").use { d ->
                val nodes = d.getElementsByTagName("color")
                var found = false
                for (i in 0 until nodes.length) {
                    val element = nodes.item(i) ?: continue
                    if (element.attributes?.getNamedItem("name")?.nodeValue == NIGHT_MIC_OVERRIDE_NAME) {
                        found = true
                        if (element.textContent.trim() != NIGHT_MIC_OVERRIDE_VALUE) {
                            element.textContent = NIGHT_MIC_OVERRIDE_VALUE
                            nightEdits++
                        }
                    }
                }
                if (!found) {
                    val element = d.createElement("color")
                    element.setAttribute("name", NIGHT_MIC_OVERRIDE_NAME)
                    element.textContent = NIGHT_MIC_OVERRIDE_VALUE
                    d.documentElement.appendChild(element)
                    nightEdits++
                }
            }
        } catch (e: Exception) {
            println("blackUiPatch: res/values-night/colors.xml not present - skipping the mic override")
        }
        if (nightEdits > 0) {
            println(
                "blackUiPatch: res/values-night/colors.xml: " +
                    "$NIGHT_MIC_OVERRIDE_NAME -> $NIGHT_MIC_OVERRIDE_VALUE (night-only mic override)",
            )
        }

        // Fourth pass: the microphone glyph itself is a NIGHT VECTOR DRAWABLE with #e8eaed
        // baked into its fill (res/drawable-night/voice_recog_icon_24px.xml). No colour
        // override reaches a baked fill, so repaint the drawable's fill attributes directly.
        // The day twin stays as Waze built it.
        var micDrawableFound = false
        var micDrawableEdits = 0
        try {
            document("res/drawable-night/voice_recog_icon_24px.xml").use { d ->
                micDrawableFound = true
                val paths = d.getElementsByTagName("path")
                for (i in 0 until paths.length) {
                    val path = paths.item(i) as? Element ?: continue
                    val attrs = path.attributes ?: continue
                    for (j in 0 until attrs.length) {
                        val attr = attrs.item(j) ?: continue
                        val value = attr.nodeValue ?: continue
                        if (value.equals("#e8eaed", ignoreCase = true) ||
                            value.equals("#ffe8eaed", ignoreCase = true)
                        ) {
                            attr.nodeValue = "#ffffff"
                            micDrawableEdits++
                        }
                    }
                }
            }
        } catch (e: Exception) {
            println("blackUiPatch: res/drawable-night/voice_recog_icon_24px.xml not present - skipping the mic drawable")
        }
        if (micDrawableFound && micDrawableEdits == 0) {
            throw PatchException(
                "blackUiPatch: the mic drawable shipped with no #e8eaed fill to repaint - refusing to report a repaint that did not happen",
            )
        }
        if (micDrawableEdits > 0) {
            println("blackUiPatch: mic drawable repainted to white at $micDrawableEdits fill(s)")
        }

        println("blackUiPatch: $edited colour value(s) repainted to #000000")
        println("blackUiPatch: $lifts elevation overlay lift(s) disabled")
    }
}

