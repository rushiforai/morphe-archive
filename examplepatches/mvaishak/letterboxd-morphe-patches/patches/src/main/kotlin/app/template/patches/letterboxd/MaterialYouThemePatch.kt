package app.template.patches.letterboxd

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import org.w3c.dom.Document
import org.w3c.dom.Element

/** Letterboxd's stock accent green, as a full-alpha ARGB string. */
private const val STOCK_GREEN = "#FF00E054"

/**
 * A surface colour in each of the patch's modes.
 *
 * - [fallback] — plain ARGB used on Android 11 and below (no dynamic palette there).
 * - [dynamic]  — wallpaper-palette reference, only valid under `-v31`.
 * - [oled]     — used by the "Pure black (OLED)" mode on every API level: true black
 *   backgrounds, with elevated surfaces kept just visible against them.
 */
private data class Tone(val fallback: String, val dynamic: String, val oled: String)

/**
 * Letterboxd hard-codes its dark palette as named colours (e.g. `@color/gray181C20`)
 * that the theme and ~400 component styles reference directly, so runtime dynamic
 * colour would recolour almost nothing. This patch redefines the dark background /
 * surface greys instead.
 *
 * Text, icon and hint greys and white are left alone so contrast is preserved.
 * Higher `system_neutralN_M` numbers are darker tones.
 */
private val PALETTE = mapOf(
    "gray0D1012" to Tone("#FF0D1012", "@android:color/system_neutral1_1000", "#FF000000"),
    "gray14181C" to Tone("#FF14181C", "@android:color/system_neutral1_900", "#FF000000"),
    "gray181C20" to Tone("#FF181C20", "@android:color/system_neutral1_900", "#FF000000"), // colorBackground
    "windowBackground" to Tone("#FF181C20", "@android:color/system_neutral1_900", "#FF000000"),
    "gray1C242C" to Tone("#FF1C242C", "@android:color/system_neutral2_900", "#FF121212"),
    "gray202830" to Tone("#FF202830", "@android:color/system_neutral1_800", "#FF121212"),
    "gray283038" to Tone("#FF283038", "@android:color/system_neutral1_800", "#FF121212"),
    "gray223344" to Tone("#FF223344", "@android:color/system_neutral2_800", "#FF1C1C1C"),
    "gray2C3440" to Tone("#FF2C3440", "@android:color/system_neutral2_800", "#FF1C1C1C"),
    "gray303840" to Tone("#FF303840", "@android:color/system_neutral1_700", "#FF1C1C1C"),
    // colorPrimaryDark / colorPrimary — also the ratings-histogram bar colour, so the
    // OLED value is a visible dark grey rather than near-black.
    "gray334455" to Tone("#FF334455", "@android:color/system_neutral2_700", "#FF2E2E2E"),
    "gray445566" to Tone("#FF445566", "@android:color/system_neutral2_700", "#FF2E2E2E"),
)

/**
 * Indirection colours the patch creates and the chrome style-edits point at, so
 * the edits in the (unqualified) styles.xml always resolve — `@android:color/system_*`
 * would crash when inflated on Android 11 and below.
 */
private val CHROME = mapOf(
    "morphe_my_surface" to Tone("#FF181C20", "@android:color/system_neutral1_900", "#FF000000"),
    "morphe_my_surface_elevated" to Tone("#FF202830", "@android:color/system_neutral1_800", "#FF161616"),
    "morphe_my_divider" to Tone("#FF334455", "@android:color/system_neutral2_600", "#FF333333"),
)

/** Named presets shown as swatches on the accent colour picker (label → hex). */
private val ACCENT_PRESETS = mapOf(
    "Letterboxd green" to STOCK_GREEN,
    "Amber" to "#FFC24B",
    "Orange" to "#FF8A3D",
    "Coral" to "#FF6B6B",
    "Pink" to "#FF7DC4",
    "Violet" to "#B69CFF",
    "Blue" to "#5AA9FF",
    "Teal" to "#3DD9C8",
    "Mono (near-white)" to "#E6E6E6",
)

@Suppress("unused")
val materialYouThemePatch = resourcePatch(
    name = "Material You theme",
    description = "Repaints Letterboxd's dark chrome — window background, surfaces, cards, the top " +
        "bar, tab strip and bottom nav. 'Wallpaper tint' follows the device's Material You palette on " +
        "Android 12+ (no effect below). 'Pure black (OLED)' forces true black on any version. " +
        "Optional accent colour recolours Letterboxd's green; optional bottom-nav selected style " +
        "replaces the grey pill. No effect on Jetpack Compose screens. Overlaps \"Match bottom nav " +
        "to top bar color\" — enable one, not both.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    val surfaceStyle by stringOption(
        key = "surfaceStyle",
        default = "wallpaper",
        values = mapOf(
            "Wallpaper tint (Android 12+)" to "wallpaper",
            "Pure black (OLED)" to "black",
        ),
        title = "Surface style",
        description = "How the dark chrome is recoloured.",
    )

    val accent by colorOption(
        key = "accent",
        default = STOCK_GREEN,
        values = ACCENT_PRESETS,
        title = "Accent colour",
        description = "Recolours Letterboxd's green (stars, rating indicators, primary buttons). " +
            "Pick a preset swatch or any custom colour. Letterboxd green is left untouched, except " +
            "in OLED mode where it is brightened for contrast; lighter and darker shades for " +
            "gradients and pressed states are derived automatically.",
    )

    val bottomNavIndicator by stringOption(
        key = "bottomNavIndicator",
        default = "stock",
        values = mapOf(
            "Stock (grey pill + blue icon)" to "stock",
            "No pill (keep blue icon)" to "nopill",
            "No pill, white selected icon" to "white",
            "No pill, accent selected icon" to "accent",
            "Accent pill + accent icon" to "accentPill",
        ),
        title = "Bottom nav selected style",
        description = "How the selected tab in the bottom navigation bar is shown. The green + " +
            "button is never affected.",
    )

    execute {
        val oled = surfaceStyle == "black"

        // Accent: any hex (or a preset). Stock green is left alone unless OLED, where it is
        // brightened. dim / bright shades are derived from the chosen colour.
        val chosen = normaliseArgb(accent)
        val isStockGreen = chosen.equals(STOCK_GREEN, ignoreCase = true)
        val applyAccent = !isStockGreen || oled
        val accentPrimary = if (isStockGreen && oled) "#FF1FE86A" else chosen
        val accentBright = blend(accentPrimary, 0xFFFFFFFF.toInt(), 0.30f)
        val accentDim = blend(accentPrimary, 0xFF000000.toInt(), 0.42f)

        // Bottom-nav selected-tab treatment.
        val navMode = bottomNavIndicator ?: "stock"
        // Selected icon fill; null = leave Letterboxd's blue. Falls back to white when the accent
        // is stock green so the selected tab stays distinct from the always-green + button.
        val navIconColor = when (navMode) {
            "white" -> "#FFF2F2F2"
            "accent" -> if (isStockGreen) "#FFF2F2F2" else accentPrimary
            "accentPill" -> accentPrimary
            else -> null
        }
        // Active-indicator pill colour.
        val navPillColor = when (navMode) {
            "stock" -> null
            "accentPill" -> "#38" + accentPrimary.substring(3) // ~22% alpha
            else -> "@android:color/transparent"
        }

        // res/values/colors.xml — base values that must resolve on every API level.
        document("res/values/colors.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values/colors.xml has no root element")

            // Always create the chrome indirection colours.
            CHROME.forEach { (name, tone) ->
                upsertColor(document, resources, name, if (oled) tone.oled else tone.fallback)
            }
            // In OLED mode also flatten the raw palette here so it works below Android 12.
            if (oled) PALETTE.forEach { (name, tone) -> upsertColor(document, resources, name, tone.oled) }

            // Accent recolour.
            if (applyAccent) {
                listOf("green00A010", "green00B020", "green00C030").forEach {
                    upsertColor(document, resources, it, accentDim)
                }
                upsertColor(document, resources, "colorAccent", accentPrimary)
                upsertColor(document, resources, "green00E054", accentPrimary)
                upsertColor(document, resources, "green0ADE53", accentBright)
            }
        }

        // res/values-v31/colors.xml — Android 12+ overrides.
        document("res/values-v31/colors.xml").use { document ->
            val resources = document.documentElement
                ?: throw PatchException("res/values-v31/colors.xml has no root element")

            CHROME.forEach { (name, tone) ->
                upsertColor(document, resources, name, if (oled) tone.oled else tone.dynamic)
            }
            PALETTE.forEach { (name, tone) ->
                upsertColor(document, resources, name, if (oled) tone.oled else tone.dynamic)
            }
        }

        // res/values/styles.xml — flatten the chrome onto the indirection colours.
        document("res/values/styles.xml").use { document ->
            setStyleItem(document, "Widget.Letterboxd.AppBarLayout", "android:background", "@color/morphe_my_surface")
            setStyleItem(document, "Widget.Letterboxd.AppBarLayout", "liftOnScrollColor", "@color/morphe_my_surface")
            setStyleItem(document, "Widget.Letterboxd.TabLayout", "android:background", "@color/morphe_my_surface")
            setStyleItem(document, "Widget.Letterboxd.BottomNavigationView", "android:background", "@color/morphe_my_surface")
            setStyleItem(document, "Widget.Letterboxd.BottomSheet.Modal", "backgroundTint", "@color/morphe_my_surface_elevated")
            setStyleItem(document, "Widget.Letterboxd.Divider", "dividerColor", "@color/morphe_my_divider")

            navPillColor?.let {
                setStyleItem(document, "Widget.Letterboxd.BottomNavigationView.ActiveIndicator", "android:color", it)
            }
        }

        // Selected bottom-nav icon fill — the *_filled vectors, never ic_log_filled (the +).
        navIconColor?.let { color ->
            listOf(
                "res/drawable/ic_popular_filled.xml",
                "res/drawable/ic_search_filled.xml",
                "res/drawable/ic_activity_filled.xml",
                "res/drawable/ic_profile_filled.xml",
            ).forEach { path ->
                document(path).use { doc ->
                    val paths = doc.getElementsByTagName("path")
                    if (paths.length == 0) throw PatchException("No <path> in $path")
                    for (i in 0 until paths.length) {
                        val el = paths.item(i) as Element
                        if (el.getAttribute("android:fillColor").isNotEmpty()) {
                            el.setAttribute("android:fillColor", color)
                        }
                    }
                }
            }
        }
    }
}

/** Normalise a colour picker value to `#FFRRGGBB`. Falls back to [STOCK_GREEN] on anything unparseable. */
private fun normaliseArgb(raw: String?): String {
    val h = raw?.trim()?.removePrefix("#")?.uppercase() ?: return STOCK_GREEN
    val hex = when (h.length) {
        6 -> "FF$h"
        8 -> h
        else -> return STOCK_GREEN
    }
    if (!hex.all { it in "0123456789ABCDEF" }) return STOCK_GREEN
    return "#$hex"
}

/** Per-channel linear blend of RGB [from] (a `#..RRGGBB` string) toward ARGB [to] by [t] (0..1). */
private fun blend(from: String, to: Int, t: Float): String {
    val f = from.removePrefix("#").let { if (it.length == 6) "FF$it" else it }.toLong(16).toInt()
    fun channel(shift: Int): Int {
        val a = (f ushr shift) and 0xFF
        val b = (to ushr shift) and 0xFF
        return (a + (b - a) * t).toInt().coerceIn(0, 255)
    }
    return "#FF%02X%02X%02X".format(channel(16), channel(8), channel(0))
}

/** Replace the value of `<color name="[name]">` in [resources], or add it if absent. */
private fun upsertColor(document: Document, resources: Element, name: String, value: String) {
    val colors = resources.getElementsByTagName("color")
    for (i in 0 until colors.length) {
        val color = colors.item(i) as Element
        if (color.getAttribute("name") == name) {
            color.textContent = value
            return
        }
    }
    resources.appendChild(
        document.createElement("color").apply {
            setAttribute("name", name)
            textContent = value
        },
    )
}

/** Replace `<item name="[itemName]">` inside `<style name="[styleName]">`, or add it if absent. */
private fun setStyleItem(document: Document, styleName: String, itemName: String, value: String) {
    val styles = document.getElementsByTagName("style")
    val style = (0 until styles.length)
        .map { styles.item(it) as Element }
        .firstOrNull { it.getAttribute("name") == styleName }
        ?: throw PatchException("Style \"$styleName\" not found in res/values/styles.xml")

    val items = style.getElementsByTagName("item")
    for (i in 0 until items.length) {
        val item = items.item(i) as Element
        if (item.getAttribute("name") == itemName) {
            item.textContent = value
            return
        }
    }
    style.appendChild(
        document.createElement("item").apply {
            setAttribute("name", itemName)
            textContent = value
        },
    )
}
