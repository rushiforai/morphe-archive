package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction51l
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction51l
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import org.w3c.dom.Element

/**
 * UI chrome themes, light and dark, chosen independently.
 *
 * Scope is exactly the chrome Waze paints with a fixed neutral ramp. Two independent halves:
 *
 * 1. Day (light) surfaces are Material 3 colour roles in `res/values/colors.xml` -
 *    `m3_sys_color_light_background`, `_surface`, the five `_surface_container_*` steps,
 *    `_on_surface`, `_on_surface_variant`, `_surface_variant` and `_outline`, plus the app's own
 *    `background_default`. Those roles are wired into the theme attributes
 *    (`colorSurface(0x7f04015e)=@color/m3_sys_color_light_surface`), so retargeting them moves
 *    dialogs, sheets, bars and search fields in light mode.
 *
 * 2. Night (dark) surfaces are the same idea in `res/values-night/colors.xml` (the Grey900/Grey800
 *    family, the Material dark backgrounds and the `m3_sys_color_dark_surface_container_*` ramp),
 *    plus five Compose palette literals that live in code, not resources: one static initialiser
 *    in `classes7.dex` (`com.waze.ui.q.a.e.a.b.<clinit>`) loads 46 distinct ARGB constants, each
 *    exactly once. Five of them paint the sheet greys and the light icons/text, so a dark theme
 *    without them leaves the Compose sheets stock. Any moved or duplicated literal throws instead
 *    of silently repainting the wrong thing.
 *
 * `AMOLED Pure Black` reproduces the previous AMOLED row exactly (all surfaces #000000, grey text and
 * icons to white). Every other palette is a tinted neutral ramp: sheet, chip, muted text and
 * light text, all measured to keep body text above 15:1 and muted text above 5:1 on the sheet.
 *
 * Deliberately untouched: the brand accent (0xFF33CCFF and friends), the semantic colours
 * (error red, alert green/amber), the `0xFF55595E` divider literal (its role is unproven), the
 * light-theme twins inside `res/values/`, and every drawable with a baked-in fill.
 */
private data class UiPalette(
    /** Window / map-adjacent background behind sheets. */
    val window: Long,
    /** Sheet, panel and search-field fill. */
    val sheet: Long,
    /** Chip / pill fill. */
    val chip: Long,
    /** Primary text and light icons. */
    val text: Long,
    /** Placeholder and secondary text. */
    val muted: Long,
    /** Icons and hairlines. */
    val icon: Long,
    /** Outline / hairline colour for light mode. */
    val hair: Long? = null,
)

/** Dark (night) palettes. `Pure Black` is the previously shipped AMOLED row. */
private val DARK_PALETTES: Map<String, UiPalette> = linkedMapOf(
    "AMOLED Pure Black" to UiPalette(0xFF000000L, 0xFF000000L, 0xFF000000L, 0xFFFFFFFFL, 0xFFFFFFFFL, 0xFFFFFFFFL),
    "AMOLED Ink" to UiPalette(0xFF04070DL, 0xFF070B13L, 0xFF0D1320L, 0xFFFFFFFFL, 0xFFAFC0D6L, 0xFF93A4BCL),
    "AMOLED Slate" to UiPalette(0xFF060708L, 0xFF0B0D0FL, 0xFF131619L, 0xFFF4F6F8L, 0xFFB6BEC6L, 0xFF9AA2AAL),
    "Dark Graphite" to UiPalette(0xFF15171AL, 0xFF1B1E22L, 0xFF242830L, 0xFFFFFFFFL, 0xFFC2C8CEL, 0xFFA7AEB6L),
    "Dark Navy" to UiPalette(0xFF0F1622L, 0xFF141D2CL, 0xFF1D2839L, 0xFFF2F6FCL, 0xFFB9C8DCL, 0xFF9FB0C7L),
)

/** Light (day) palettes. `Pure White` is Waze's stock white with neutral grey chips. */
private val LIGHT_PALETTES: Map<String, UiPalette> = linkedMapOf(
    "Pure White" to UiPalette(0xFFFFFFFFL, 0xFFFFFFFFL, 0xFFEEF1F4L, 0xFF141618L, 0xFF5C646DL, 0xFF5C646DL, 0xFFDFE4E9L),
    "Paper" to UiPalette(0xFFFAF8F3L, 0xFFFFFDF8L, 0xFFF0EBE1L, 0xFF1B1A17L, 0xFF6B665CL, 0xFF6B665CL, 0xFFE3DCCEL),
    "Porcelain" to UiPalette(0xFFF4F6F8L, 0xFFFFFFFFL, 0xFFE9EDF1L, 0xFF15181BL, 0xFF5A636CL, 0xFF5A636CL, 0xFFD9E0E6L),
    "Linen" to UiPalette(0xFFF7F2EAL, 0xFFFDF9F2L, 0xFFEDE4D6L, 0xFF1C1915L, 0xFF6D6459L, 0xFF6D6459L, 0xFFDFD4C2L),
)

private val DARK_CHOICES: Map<String, String> =
    linkedMapOf<String, String>("Stock" to "Stock").apply { DARK_PALETTES.keys.forEach { put(it, it) } }

private val LIGHT_CHOICES: Map<String, String> =
    linkedMapOf<String, String>("Stock" to "Stock").apply { LIGHT_PALETTES.keys.forEach { put(it, it) } }

/** Night resources that sit behind sheets and floating panels, grouped by which step they take. */
private val NIGHT_WINDOW_RESOURCES = setOf(
    "Grey900",
    "material_grey_900",
    "design_dark_default_color_background",
    "m3_ref_palette_neutral6",
)

private val NIGHT_SHEET_RESOURCES = setOf(
    "Grey800",
    "material_grey_850",
    "material_grey_800",
    "design_dark_default_color_surface",
    "m3_sys_color_dark_surface_container_lowest",
    "m3_sys_color_dark_surface_container_low",
    "m3_sys_color_dark_surface_container",
    "m3_sys_color_dark_surface_container_high",
    "m3_sys_color_dark_surface_container_highest",
)

private val NIGHT_MIC_RESOURCES = setOf("Grey200")

/** Day-side Material colour roles, and which step of the palette each one takes. */
private val DAY_ROLE_STEPS: Map<String, String> = linkedMapOf(
    "background_default" to "window",
    "m3_sys_color_light_background" to "window",
    "m3_sys_color_light_surface" to "sheet",
    "m3_sys_color_light_surface_container_lowest" to "sheet",
    "m3_sys_color_light_surface_container_low" to "sheet",
    "m3_sys_color_light_surface_container" to "sheet",
    "m3_sys_color_light_surface_container_high" to "sheet",
    "m3_sys_color_light_surface_container_highest" to "sheet",
    "m3_sys_color_light_surface_variant" to "chip",
    "m3_sys_color_light_on_surface" to "text",
    "m3_sys_color_light_on_surface_variant" to "muted",
    "m3_sys_color_light_outline" to "hair",
)

/** The five measured Compose palette literals and where each one goes in a dark palette. */
private val DARK_CONST_STEPS: Map<Long, String> = linkedMapOf(
    0xFF202124L to "sheet",   // profile / search panels, sheet headers
    0xFF3C4043L to "chip",    // the "See profile" chip fill
    0xFF72767DL to "icon",    // magnifier icon, hairline separators
    0xFF90959CL to "muted",   // placeholder text
    0xFFE8EAEDL to "text",    // microphone and other light icons
)

/** Anchors on the single method that loads the panel grey; every other literal is its sibling. */
private val PaletteGrayFingerprint = Fingerprint(filters = listOf(literal(0xFF202124L)))

private fun UiPalette.step(step: String): Long = when (step) {
    "window" -> window
    "sheet" -> sheet
    "chip" -> chip
    "text" -> text
    "muted" -> muted
    "icon" -> icon
    "hair" -> hair ?: icon
    else -> throw PatchException("uiThemePatch: unknown palette step '$step'")
}

private fun hex(value: Long): String = "#%06x".format(value and 0xFFFFFF)

/**
 * Hidden bytecode half: repaints the five Compose palette literals for the chosen dark theme.
 * Reads the visible row's option because the dependency runs before the resource half executes.
 */
@Suppress("unused")
val uiThemeDexPatch: Patch = bytecodePatch(
    name = null,
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        val choice = uiThemePatch.options["darkTheme"]?.value as? String ?: "Stock"
        if (choice == "Stock") {
            println("uiThemeDexPatch: dark theme is Stock - Compose palette left as Waze built it")
            return@execute
        }
        val palette = DARK_PALETTES[choice]
            ?: throw PatchException("uiThemeDexPatch: unknown dark theme '$choice'")

        val method = PaletteGrayFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException(
                "uiThemeDexPatch: the palette initialiser was found but has no implementation; " +
                    "refusing to report a repaint that would change nothing",
            )

        var repainted = 0
        for ((from, step) in DARK_CONST_STEPS) {
            val sites = implementation.instructions.withIndex()
                .filter { (_, instruction) -> instruction is Instruction51l && instruction.wideLiteral == from }
                .map { (index, _) -> index }
            if (sites.size != 1) {
                throw PatchException(
                    "uiThemeDexPatch: expected exactly 1 const-wide site for 0x${from.toString(16)} " +
                        "in ${method.definingClass}, found ${sites.size} - Waze's palette moved; " +
                        "refusing to report a repaint that did not happen",
                )
            }
            val register = (implementation.instructions.elementAt(sites[0]) as Instruction51l).registerA
            method.replaceInstruction(sites[0], BuilderInstruction51l(Opcode.CONST_WIDE, register, palette.step(step)))
            repainted++
        }
        println("uiThemeDexPatch: repainted $repainted Compose palette literal(s) for '$choice'")
    }
}

/**
 * The visible row: both pickers live here. The resource half runs from [uiThemePatch]; the
 * Compose literals are repainted by [uiThemeDexPatch], which reads this patch's option values.
 */
@Suppress("unused")
val uiThemePatch: Patch = resourcePatch(
    name = "UI Themes",
    description = "Chrome colour themes, picked separately for light and dark mode. Stock leaves each mode untouched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("UI Customization")

    val lightTheme by stringOption(
        "lightTheme", "Stock", LIGHT_CHOICES,
        title = "Light theme",
        description = "Applies in light mode: window, sheets, chips, text. Stock leaves light mode as Waze built it.",
    )

    val darkTheme by stringOption(
        "darkTheme", "AMOLED Pure Black", DARK_CHOICES,
        title = "Dark theme",
        description = "Applies in light-off mode. Pure Black is the original AMOLED row; Stock leaves dark mode untouched.",
    )

    dependsOn(uiThemeDexPatch)

    execute {
        val light = lightTheme ?: "Stock"
        val dark = darkTheme ?: "Stock"
        if (light == "Stock" && dark == "Stock") {
            throw PatchException(
                "uiThemePatch: both themes are Stock - pick at least one theme, or untick this row",
            )
        }
        fun palette(name: String, table: Map<String, UiPalette>, side: String): UiPalette? =
            if (name == "Stock") null else table[name]
                ?: throw PatchException("uiThemePatch: unknown $side theme '$name'")

        var edits = 0
        palette(dark, DARK_PALETTES, "dark")?.let { edits += applyNightResources(it) }
        palette(light, LIGHT_PALETTES, "light")?.let { edits += applyDayResources(it) }

        if (edits == 0) {
            throw PatchException(
                "uiThemePatch: the selected palettes matched none of the expected colour resources - " +
                    "refusing to install a theme that would change nothing",
            )
        }
        println("uiThemePatch: light='$light' dark='$dark', $edits resource value(s) themed")
    }
}

/** Night-side edits: the dark surface family and the microphone tint. */
private fun ResourcePatchContext.applyNightResources(palette: UiPalette): Int {
    var edits = 0
    // Waze declares the Grey family in res/values/colors.xml (night resolves from the same entry),
    // so both documents are scanned; only names in the night sets are touched.
    for (path in listOf("res/values-night/colors.xml", "res/values/colors.xml")) {
        val doc = try {
            document(path)
        } catch (e: Exception) {
            println("uiThemePatch: $path not present - skipping")
            continue
        }
        doc.use { d ->
            val nodes = d.getElementsByTagName("color")
            for (i in 0 until nodes.length) {
                val element = nodes.item(i) ?: continue
                val name = element.attributes?.getNamedItem("name")?.nodeValue ?: continue
                val target = when {
                    name in NIGHT_WINDOW_RESOURCES -> palette.window
                    name in NIGHT_SHEET_RESOURCES -> palette.sheet
                    name in NIGHT_MIC_RESOURCES -> palette.text
                    else -> continue
                }
                val wanted = hex(target)
                if (element.textContent.trim() != wanted) {
                    element.textContent = wanted
                    edits++
                }
            }
        }
    }
    // The night microphone drawable carries a baked fill; a colour override cannot reach it.
    try {
        document("res/drawable-night/voice_recog_icon_24px.xml").use { doc ->
            val paths = doc.getElementsByTagName("path")
            for (i in 0 until paths.length) {
                val path = paths.item(i) as? Element ?: continue
                val attrs = path.attributes ?: continue
                for (j in 0 until attrs.length) {
                    val attr = attrs.item(j) ?: continue
                    if (attr.nodeValue.equals("#e8eaed", true) || attr.nodeValue.equals("#ffe8eaed", true)) {
                        attr.nodeValue = hex(palette.text)
                        edits++
                    }
                }
            }
        }
    } catch (e: Exception) {
        println("uiThemePatch: night mic drawable not present - skipping")
    }
    return edits
}

/** Day-side edits: the Material 3 light roles wired into the theme attributes. */
private fun ResourcePatchContext.applyDayResources(palette: UiPalette): Int {
    var edits = 0
    val document = try {
        document("res/values/colors.xml")
    } catch (e: Exception) {
        throw PatchException("uiThemePatch: res/values/colors.xml is missing - cannot theme light mode")
    }
    document.use { doc ->
        val nodes = doc.getElementsByTagName("color")
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) ?: continue
            val name = element.attributes?.getNamedItem("name")?.nodeValue ?: continue
            val step = DAY_ROLE_STEPS[name] ?: continue
            val wanted = hex(palette.step(step))
            if (element.textContent.trim() != wanted) {
                element.textContent = wanted
                edits++
            }
        }
    }
    return edits
}
