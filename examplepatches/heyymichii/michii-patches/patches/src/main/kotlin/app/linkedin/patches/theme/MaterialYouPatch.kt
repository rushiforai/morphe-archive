package app.linkedin.patches.theme

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

/**
 * LinkedIn's blue palette (blue_* and the Mercado design system's mercado_mvp_blue_*) mapped to
 * the system accent palette. Tone 70 is the action color on light backgrounds, tone 50 on dark ones.
 */
private val ACCENT_SHADES = mapOf(
    "10" to "10",
    "20" to "50",
    "30" to "100",
    "40" to "200",
    "50" to "200",
    "60" to "400",
    "70" to "600",
    "80" to "700",
    "90" to "800",
    "100" to "900",
)

/** ArtDeco's older blue palette (links in messages, for one) mapped to the accent palette like LinkedIn blue. */
private val ARTDECO_BLUES = mapOf(
    "ad_blue_1" to "system_accent1_50",
    "ad_blue_2" to "system_accent1_100",
    "ad_blue_5" to "system_accent1_400",
    "ad_blue_6" to "system_accent1_500",
    "ad_blue_7" to "system_accent1_600",
    "ad_blue_8" to "system_accent1_700",
    "ad_blue_9" to "system_accent1_800",
)

/**
 * Selected states (checked chips and filters, such as the notification filters), green in LinkedIn's palette,
 * mapped to the accent palette by the green tone they use: 70 to 600, 60 to 400, 50 to 200, 40 to 100, 30 to 100
 * and 80 to 800. The semi-transparent variants keep their green.
 */
private val CHECKED = mapOf(
    "mercado_mvp_color_checked" to "system_accent1_600",
    "mercado_mvp_color_checked_offset" to "system_accent1_400",
    "mercado_mvp_color_checked_offset_active" to "system_accent1_600",
    "mercado_mvp_color_checked_offset_on_dark" to "system_accent1_200",
    "mercado_mvp_color_checked_offset_on_dark_active" to "system_accent1_400",
    "mercado_mvp_color_checked_on_dark" to "system_accent1_200",
    "mercado_mvp_color_checked_on_dark_active" to "system_accent1_100",
    "mercado_mvp_color_checked_tint" to "system_accent1_100",
    "mercado_mvp_color_checked_tint_on_dark" to "system_accent1_800",
    "mercado_mvp_dark_color_checked_offset" to "system_accent1_200",
    "mercado_mvp_dark_color_checked_offset_active" to "system_accent1_400",
    "mercado_mvp_dark_color_checked_offset_on_dark" to "system_accent1_200",
    "mercado_mvp_dark_color_checked_offset_on_dark_active" to "system_accent1_400",
    "mercado_mvp_dark_color_checked_on_dark" to "system_accent1_200",
    "mercado_mvp_dark_color_checked_on_dark_active" to "system_accent1_100",
    "mercado_mvp_dark_color_checked_tint" to "system_accent1_800",
    "mercado_mvp_dark_color_checked_tint_on_dark" to "system_accent1_800",
)

/**
 * Backgrounds of the Mercado light and dark themes mapped to the tinted system neutral palettes, so the canvas
 * and cards follow the wallpaper too instead of staying gray. Containers (cards, bars, lists) are one tone, the
 * canvas behind them a step darker. The container tint marks unread notifications, so it stays a step darker too.
 */
private val BACKGROUNDS = mapOf(
    "mercado_mvp_color_background_canvas" to "system_neutral2_100",
    "mercado_mvp_color_background_canvas_mobile" to "system_neutral2_100",
    "mercado_mvp_color_background_canvas_tint" to "system_neutral1_10",
    "mercado_mvp_color_background_container" to "system_neutral2_50",
    "mercado_mvp_color_background_container_tint" to "system_neutral2_100",
    "mercado_mvp_dark_color_background_canvas" to "system_neutral1_1000",
    "mercado_mvp_dark_color_background_canvas_mobile" to "system_neutral1_1000",
    "mercado_mvp_dark_color_background_canvas_tint" to "system_neutral2_800",
    "mercado_mvp_dark_color_background_canvas_dark_tint" to "system_neutral2_800",
    "mercado_mvp_dark_color_background_container" to "system_neutral1_900",
    "mercado_mvp_dark_color_background_container_dark" to "system_neutral1_900",
    "mercado_mvp_dark_color_background_container_tint" to "system_neutral2_800",
    "mercado_mvp_dark_color_background_container_dark_tint" to "system_neutral2_800",
    // Dark variants that the light theme uses for dark surfaces.
    "mercado_mvp_color_background_canvas_dark" to "system_neutral1_1000",
    "mercado_mvp_color_background_canvas_dark_tint" to "system_neutral2_800",
    "mercado_mvp_color_background_container_dark" to "system_neutral1_900",
    "mercado_mvp_color_background_container_dark_tint" to "system_neutral2_800",
    "color_splash_canvas_background" to "system_neutral2_50",
    // Faint borders (outlines around cards), light and dark theme, as an opaque outline tone. The themes point
    // their faint border at these (see THEME_SURFACES): their own translucent gray is shared with disabled and
    // pressed backgrounds.
    "mercado_mvp_color_border_faint" to "system_neutral2_200",
    "mercado_mvp_dark_color_border_faint_on_dark" to "system_neutral2_700",
)

/**
 * The same backgrounds as Material 3 surface roles, which Android 14 adds: surface for containers, a container
 * low surface for the canvas behind them, a container high surface for tinted rows and inputs, and the highest
 * one for faint borders. Dark containers use the container surface, like Google's apps.
 */
private val BACKGROUNDS_V34 = mapOf(
    "mercado_mvp_color_background_canvas" to "system_surface_container_low_light",
    "mercado_mvp_color_background_canvas_mobile" to "system_surface_container_low_light",
    "mercado_mvp_color_background_canvas_tint" to "system_surface_light",
    "mercado_mvp_color_background_container" to "system_surface_light",
    "mercado_mvp_color_background_container_tint" to "system_surface_container_high_light",
    "mercado_mvp_dark_color_background_canvas" to "system_surface_dark",
    "mercado_mvp_dark_color_background_canvas_mobile" to "system_surface_dark",
    "mercado_mvp_dark_color_background_canvas_tint" to "system_surface_container_high_dark",
    "mercado_mvp_dark_color_background_canvas_dark_tint" to "system_surface_container_high_dark",
    "mercado_mvp_dark_color_background_container" to "system_surface_container_dark",
    "mercado_mvp_dark_color_background_container_dark" to "system_surface_container_dark",
    "mercado_mvp_dark_color_background_container_tint" to "system_surface_container_high_dark",
    "mercado_mvp_dark_color_background_container_dark_tint" to "system_surface_container_high_dark",
    "mercado_mvp_color_background_canvas_dark" to "system_surface_dark",
    "mercado_mvp_color_background_canvas_dark_tint" to "system_surface_container_high_dark",
    "mercado_mvp_color_background_container_dark" to "system_surface_container_dark",
    "mercado_mvp_color_background_container_dark_tint" to "system_surface_container_high_dark",
    "color_splash_canvas_background" to "system_surface_light",
    "mercado_mvp_color_border_faint" to "system_surface_container_highest_light",
    "mercado_mvp_dark_color_border_faint_on_dark" to "system_surface_container_highest_dark",
)

/** Colors that LinkedIn defines separately for dark mode (values-night). */
private val NIGHT_BACKGROUNDS = mapOf(
    "color_splash_canvas_background" to "system_neutral1_900",
    "color_status_bar" to "system_neutral1_900",
)

/** [NIGHT_BACKGROUNDS] as Material 3 surface roles. */
private val NIGHT_BACKGROUNDS_V34 = mapOf(
    "color_splash_canvas_background" to "system_surface_container_dark",
    "color_status_bar" to "system_surface_container_dark",
)

/**
 * Theme attributes that point at a generic white or gray (also used for text and icons) instead of a background
 * color: (style, attribute) to the background color from [BACKGROUNDS] they use instead. The home top bar and
 * bottom bar, cards, carousels, the games streak widget, and the bottom sheet background behind the grip bar.
 * The resource encoder rejects new resource names, so these reuse colors that look the same below Android 12
 * (white, and #1d2226 instead of #1b1f23).
 */
private val THEME_SURFACES = mapOf(
    ("VoyagerAppTheme.Mercado" to "voyagerColorNavHomeTopBar") to "mercado_mvp_color_background_container",
    ("VoyagerAppTheme.Mercado" to "voyagerColorNavHome") to "mercado_mvp_color_background_container",
    ("VoyagerAppTheme.Mercado" to "voyagerColorBackgroundCard") to "mercado_mvp_color_background_container",
    ("VoyagerAppTheme.Mercado" to "voyagerColorBackgroundCarousel") to "mercado_mvp_color_background_container",
    ("VoyagerAppTheme.Mercado" to "voyagerGameWidgetStreakBackgroundColor") to "mercado_mvp_color_background_container",
    ("Delux.Theme.Light" to "deluxColorBackground") to "mercado_mvp_color_background_container",
    ("Delux.Theme.Dark" to "deluxColorBackground") to "mercado_mvp_dark_color_background_container",
    // Window backgrounds: the gaps between items of server drawn lists, and empty space below lists (Groups).
    ("VoyagerAppTheme.Mercado" to "android:windowBackground") to "mercado_mvp_color_background_canvas_mobile",
    ("Delux.Theme.Light" to "deluxColorBackgroundOffset") to "mercado_mvp_color_background_canvas",
    // Faint borders: outlines around cards, and dividers in the View based screens.
    // Inputs, search boxes, skeletons and table rows: warm and cool grays to the canvas tones, light and dark.
    ("VoyagerAppTheme.Mercado" to "voyagerColorBackgroundCanvasShaded") to "mercado_mvp_color_background_canvas_mobile",
    ("VoyagerAppTheme.Mercado" to "voyagerColorBackgroundRecyclerView") to "mercado_mvp_color_background_canvas_mobile",
    ("VoyagerAppTheme.Mercado" to "voyagerColorBackgroundSearch") to "mercado_mvp_color_background_canvas",
    ("Mercado.MVP.AppTheme" to "voyagerColorBackgroundInputSearch") to "mercado_mvp_color_background_canvas",
    ("Mercado.MVP.AppTheme" to "voyagerColorBackgroundInputSearchActive") to "mercado_mvp_color_background_container_tint",
    ("Mercado.MVP.AppTheme" to "voyagerMessengerColorBackgroundInputMessage") to "mercado_mvp_color_background_canvas",
    ("Mercado.MVP.AppTheme" to "voyagerMessengerColorBackgroundInputMessageActive") to "mercado_mvp_color_background_canvas_mobile",
    ("Mercado.MVP.AppTheme.Dark" to "voyagerColorBackgroundInputSearch") to "mercado_mvp_dark_color_background_container_tint",
    ("Mercado.MVP.AppTheme.Dark" to "voyagerColorBackgroundInputSearchActive") to "mercado_mvp_dark_color_background_container_tint",
    ("Delux.Theme.Light" to "deluxColorBackgroundNeutralSoft") to "mercado_mvp_color_background_canvas",
    // Pale blue cards (cool gray 20), light and dark.
    ("Delux.Theme.Light" to "deluxColorBackgroundAccentSoft4") to "mercado_mvp_color_background_container_tint",
    ("Delux.Theme.Dark" to "deluxColorBackgroundAccentSoft4") to "mercado_mvp_dark_color_background_container",
    ("Delux.Theme.Light" to "deluxColorBackgroundAccentStrong4") to "mercado_mvp_color_background_container_tint",
    ("Delux.Theme.Dark" to "deluxColorBackgroundAccentStrong4") to "mercado_mvp_dark_color_background_container_tint",
    ("Mercado.MVP.AppTheme" to "voyagerColorBackgroundContainerTint2") to "mercado_mvp_color_background_container_tint",
    ("Mercado.MVP.AppTheme.Dark" to "voyagerColorBackgroundContainerTint2") to "mercado_mvp_dark_color_background_container_tint",
    ("Delux.Theme.Light" to "deluxColorBackgroundNeutralStrong") to "mercado_mvp_color_background_canvas_mobile",
    ("Delux.Theme.Light" to "deluxColorTableBackgroundOffset") to "mercado_mvp_color_background_container_tint",
    ("Delux.Theme.Light" to "deluxColorSearchInputBackground") to "mercado_mvp_color_background_canvas",
    ("Delux.Theme.Light" to "deluxColorSearchInputBackgroundActive") to "mercado_mvp_color_background_container_tint",
    ("Delux.Theme.Dark" to "deluxColorBackgroundNeutralSoft") to "mercado_mvp_dark_color_background_container",
    ("Delux.Theme.Dark" to "deluxColorBackgroundNeutralStrong") to "mercado_mvp_dark_color_background_container_tint",
    ("Delux.Theme.Dark" to "deluxColorTableBackgroundOffset") to "mercado_mvp_dark_color_background_container",
    ("Delux.Theme.Dark" to "deluxColorSearchInputBackground") to "mercado_mvp_dark_color_background_container_tint",
    ("Delux.Theme.Dark" to "deluxColorSearchInputBackgroundActive") to "mercado_mvp_dark_color_background_container_tint",
    ("Mercado.MVP.AppTheme" to "mercadoColorBorderFaint") to "mercado_mvp_color_border_faint",
    ("Delux.Theme.Light" to "deluxColorBorderFaint") to "mercado_mvp_color_border_faint",
    ("Mercado.MVP.AppTheme.Dark" to "mercadoColorBorderFaint") to "mercado_mvp_dark_color_border_faint_on_dark",
    ("Delux.Theme.Dark" to "deluxColorBorderFaint") to "mercado_mvp_dark_color_border_faint_on_dark",
)

/**
 * Theme attributes of selected tabs (the Groups and Newsletters tabs, for one), green in LinkedIn's palette, to
 * the [CHECKED] color of the same green tone.
 */
private val THEME_ACCENTS = mapOf(
    ("Delux.Theme.Light" to "deluxColorCurrentContextualOverride") to "mercado_mvp_color_checked",
    ("Delux.Theme.Light" to "deluxColorCurrentActiveContextualOverride") to "mercado_mvp_color_checked_tint_on_dark",
    ("Delux.Theme.Dark" to "deluxColorCurrentContextualOverride") to "mercado_mvp_color_checked_on_dark",
    ("Delux.Theme.Dark" to "deluxColorCurrentActiveContextualOverride") to "mercado_mvp_color_checked_on_dark_active",
    // Checked chips, radio buttons, switches and selection badges.
    ("Delux.Theme.Light" to "deluxColorChecked") to "mercado_mvp_color_checked",
    ("Delux.Theme.Light" to "deluxColorCheckedActive") to "mercado_mvp_color_checked_tint_on_dark",
    ("Delux.Theme.Light" to "deluxColorInputAndroidTrackChecked") to "mercado_mvp_color_checked_offset",
    ("Delux.Theme.Dark" to "deluxColorChecked") to "mercado_mvp_color_checked_on_dark",
    ("Delux.Theme.Dark" to "deluxColorCheckedActive") to "mercado_mvp_color_checked_on_dark_active",
    ("Delux.Theme.Dark" to "deluxColorInputAndroidTrackChecked") to "mercado_mvp_color_checked_on_dark_active",
    ("Mercado.MVP.AppTheme" to "mercadoColorChecked") to "mercado_mvp_color_checked",
    ("Mercado.MVP.AppTheme" to "mercadoColorCheckedActive") to "mercado_mvp_color_checked_tint_on_dark",
    ("Mercado.MVP.AppTheme" to "voyagerColorBackgroundBadgeSelection") to "mercado_mvp_color_checked",
    ("Mercado.MVP.AppTheme.Dark" to "mercadoColorChecked") to "mercado_mvp_color_checked_on_dark",
    ("Mercado.MVP.AppTheme.Dark" to "mercadoColorCheckedActive") to "mercado_mvp_color_checked_on_dark_active",
    ("Mercado.MVP.AppTheme.Dark" to "voyagerColorBackgroundBadgeSelection") to "mercado_mvp_color_checked",
    ("VoyagerAppTheme.Mercado" to "voyagerTabLayoutTextColor") to "mercado_mvp_color_checked",
    // Unread rows (notifications): the light theme uses a pale blue, which follows the accent; the dark one a cool
    // gray, so it gets the dark accent tint instead.
    ("Mercado.MVP.AppTheme.Dark" to "voyagerColorBackgroundNewSolid") to "mercado_mvp_blue_90",
    // Selected tabs on dark screens (the Groups tabs in dark mode), which use the success green for their text.
    ("Mercado.Lite.TabLayout.Fixed.Inverse" to "tabIndicatorColor") to "mercado_mvp_color_checked_on_dark",
    ("Mercado.Lite.TabLayout.Fixed.Inverse" to "tabSelectedTextColor") to "mercado_mvp_color_checked_on_dark",
    // Teal accent of charts (analytics), to LinkedIn blue of the same tone, which follows the accent.
    ("Delux.Theme.Light" to "deluxColorAccent5") to "mercado_mvp_blue_70",
    ("Delux.Theme.Light" to "deluxColorAccent5Active") to "mercado_mvp_blue_80",
    ("Delux.Theme.Dark" to "deluxColorAccent5") to "mercado_mvp_blue_50",
    ("Delux.Theme.Dark" to "deluxColorAccent5Active") to "mercado_mvp_blue_40",
)

/**
 * Backgrounds that show through the gaps between items of server drawn lists: the app's window, and the
 * containers of some lists (Jobs, for one) and of their loading skeletons.
 */
private val GAP_ATTRIBUTES = setOf(
    "android:windowBackground", "voyagerColorBackgroundCanvasShaded", "voyagerColorBackgroundRecyclerView",
)

/**
 * The canvas of the View based screens (behind group feeds, for one), which shows between cards and posts:
 * (style, attribute) to the card color of the same theme.
 */
private val CANVAS_ATTRIBUTES = mapOf(
    ("Mercado.MVP.AppTheme" to "mercadoColorBackgroundCanvas") to "mercado_mvp_color_background_container",
    ("Mercado.MVP.AppTheme" to "mercadoColorBackgroundCanvasMobile") to "mercado_mvp_color_background_container",
    ("Mercado.MVP.AppTheme.Dark" to "mercadoColorBackgroundCanvas") to "mercado_mvp_dark_color_background_container",
    ("Mercado.MVP.AppTheme.Dark" to "mercadoColorBackgroundCanvasMobile") to "mercado_mvp_dark_color_background_container",
)

/** Styles of the app's windows, light and dark. */
private val APP_THEMES = listOf("VoyagerAppTheme.Mercado", "VoyagerAppTheme.Mercado.Dark")

/** Background color of cards and lists, which "Remove gaps and dividers" also gives the window. */
private const val CONTAINER_COLOR = "@color/mercado_mvp_color_background_container"

/** Accent resource colors: XML layouts and the View based screens. */
private val materialYouResourcePatch = resourcePatch {
    execute {
        val colors = mutableMapOf<String, String>()
        for ((tone, accent) in ACCENT_SHADES) {
            // blue_90 and mercado_mvp_blue_100 do not exist in LinkedIn's palette.
            if (tone != "90") colors["blue_$tone"] = "system_accent1_$accent"
            if (tone != "100") colors["mercado_mvp_blue_$tone"] = "system_accent1_$accent"
        }
        colors += CHECKED
        colors += ARTDECO_BLUES
        val accents = editThemeItems { style, item, _ -> THEME_ACCENTS[style to item]?.let { "@color/$it" } }
        if (accents != THEME_ACCENTS.size) throw PatchException("Theme accent attributes not found")
        // -v31: the system palette only exists on Android 12+, older versions keep LinkedIn's colors.
        writeColors("values-v31", colors)
    }
}

/** Background resource colors, and the theme attributes that use a generic white or gray as a background. */
private val materialYouBackgroundsResourcePatch = resourcePatch {
    execute {
        // A window background that "Remove gaps and dividers" already gave the card color keeps it.
        val surfaces = editThemeItems { style, item, current ->
            THEME_SURFACES[style to item]?.let { if (current == CONTAINER_COLOR) current else "@color/$it" }
        }
        if (surfaces != THEME_SURFACES.size) throw PatchException("Theme surface attributes not found")

        // The system draws a white scrim behind the gesture bar, over the tinted bottom bar, unless the theme
        // turns its contrast off.
        APP_THEMES.forEach { addThemeItem(it, "android:enforceNavigationBarContrast", "false") }

        writeColors("values-v31", BACKGROUNDS)
        writeColors("values-night-v31", NIGHT_BACKGROUNDS)
        writeColors("values-v34", BACKGROUNDS_V34)
        writeColors("values-night-v34", NIGHT_BACKGROUNDS_V34)
    }
}

/** Gives the window and list backgrounds, which show through the gaps of server drawn lists, the card color. */
private val removeGapsResourcePatch = resourcePatch {
    execute {
        val windows = editThemeItems { style, item, _ ->
            if (style == "VoyagerAppTheme.Mercado" && item in GAP_ATTRIBUTES) CONTAINER_COLOR
            else CANVAS_ATTRIBUTES[style to item]?.let { "@color/$it" }
        }
        if (windows != GAP_ATTRIBUTES.size + CANVAS_ATTRIBUTES.size) throw PatchException("Window background not found")

        // Thick views with the faint border, canvas or divider background are gaps between list items (search
        // results, saved posts and analytics cards, for one); the 1dp ones are dividers and outlines, which keep it.
        val dimens = document("res/values/dimens.xml").use { document ->
            val nodes = document.getElementsByTagName("dimen")
            (0 until nodes.length).map { nodes.item(it) as Element }.associate { it.getAttribute("name") to it.textContent }
        }
        fun dp(value: String, depth: Int): Float? = when {
            value.startsWith("@dimen/") && depth < 5 -> dimens[value.removePrefix("@dimen/")]?.let { dp(it, depth + 1) }
            else -> Regex("""(-?[\d.]+)(dp|dip)""").matchEntire(value)?.groupValues?.get(1)?.toFloatOrNull()
        }
        var gapViews = 0
        get("res").listFiles { file -> file.isDirectory && file.name.startsWith("layout") }!!.forEach { directory ->
            directory.listFiles { file -> file.extension == "xml" }!!.filter { file ->
                // Parse only layouts with a candidate view, most have none.
                GAP_VIEW_TAG.findAll(file.readText()).any { it.isGapView { value -> dp(value, 0) } }
            }.forEach { file ->
                document("res/${directory.name}/${file.name}").use { document ->
                    val all = document.getElementsByTagName("*")
                    for (i in 0 until all.length) {
                        val view = all.item(i) as Element
                        if (!GAP_VIEW_BACKGROUND.matches(view.getAttribute("android:background"))) continue
                        val height = dp(view.getAttribute("android:layout_height"), 0) ?: continue
                        if (height < 4 || height > 12) continue
                        view.setAttribute("android:background", "@android:color/transparent")
                        gapViews++
                    }
                }
            }
        }
        if (gapViews == 0) throw PatchException("No gap views found")
    }
}

/** Backgrounds of thick spacer views between list items: theme canvases, dividers and faint borders. */
private val GAP_VIEW_BACKGROUND = Regex("""\?attr/\w*(Canvas|Divider|BorderFaint)\w*""")

/** A view tag in a layout file. */
private val GAP_VIEW_TAG = Regex("""<[\w.]+\b[^>]*>""")

/** Whether this tag is a view 4 to 12dp high with a [GAP_VIEW_BACKGROUND]. */
private fun MatchResult.isGapView(dp: (String) -> Float?): Boolean {
    val background = Regex("""android:background="([^"]+)"""").find(value)?.groupValues?.get(1) ?: return false
    if (!GAP_VIEW_BACKGROUND.matches(background)) return false
    val height = Regex("""android:layout_height="([^"]+)"""").find(value)?.groupValues?.get(1)?.let(dp) ?: return false
    return height in 4f..12f
}

/**
 * Sets every theme item for which [value] (style name, item name, current value) returns a value, in
 * res/values/styles.xml. Returns how many items were set.
 */
private fun ResourcePatchContext.editThemeItems(value: (String, String, String) -> String?): Int {
    var edited = 0
    document("res/values/styles.xml").use { document ->
        val styles = document.getElementsByTagName("style")
        for (i in 0 until styles.length) {
            val style = styles.item(i) as Element
            val items = style.getElementsByTagName("item")
            for (j in 0 until items.length) {
                val item = items.item(j) as Element
                item.textContent =
                    value(style.getAttribute("name"), item.getAttribute("name"), item.textContent) ?: continue
                edited++
            }
        }
    }
    return edited
}

/** Adds the item [name] with [value] to the style [style] in res/values/styles.xml. */
private fun ResourcePatchContext.addThemeItem(style: String, name: String, value: String) {
    document("res/values/styles.xml").use { document ->
        val styles = document.getElementsByTagName("style")
        val element = (0 until styles.length).map { styles.item(it) as Element }
            .firstOrNull { it.getAttribute("name") == style } ?: throw PatchException("Style $style not found")
        element.appendChild(document.createElement("item").also {
            it.setAttribute("name", name)
            it.textContent = value
        })
    }
}

/**
 * Sets [colors] (resource name to system color) in the directory's colors.xml. Entries are merged into the file
 * LinkedIn may already have, so its other colors stay and no name is defined twice.
 */
private fun ResourcePatchContext.writeColors(directory: String, colors: Map<String, String>) {
    val file = get("res").resolve(directory).resolve("colors.xml")
    if (!file.exists()) {
        file.parentFile.mkdirs()
        file.writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>\n")
    }
    document("res/$directory/colors.xml").use { document ->
        val resources = document.documentElement
        val nodes = resources.getElementsByTagName("color")
        val existing = (0 until nodes.length).map { nodes.item(it) as Element }.associateBy { it.getAttribute("name") }
        for ((name, system) in colors) {
            val color = existing[name] ?: document.createElement("color").also {
                it.setAttribute("name", name)
                resources.appendChild(it)
            }
            color.textContent = "@android:color/$system"
        }
    }
}

/** Packages of the Compose themes (Delux and Mercado), which hardcode their palettes in static initializers. */
private val COMPOSE_THEME_PACKAGES = listOf(
    "Lcom/linkedin/android/delux/compose/theme",
    "Lcom/linkedin/android/mercado/mvp/compose/",
)

/** Blue colors replaced at runtime, keep in sync with MaterialYou.java. */
private val COMPOSE_ACCENTS = setOf(
    0xF6FBFF, 0xE8F3FF, 0xD0E8FF, 0xD2E9FF, 0xA8D4FF, 0xAAD6FF, 0x70B5F9, 0x71B7FB,
    0x378FE9, 0x0A66C2, 0x004182, 0x09223B, 0x0A2037,
).map { 0xFF000000L or it.toLong() }.toSet()

/** Background colors replaced at runtime, keep in sync with MaterialYou.java. */
private val COMPOSE_BACKGROUNDS = setOf(
    0x1B1F23, 0x1D2226, 0x293037, 0x293138, 0xF4F2EE, 0xF3F2EF, 0xF8FAFD, 0xEDF3F8, 0xEEF3F8, 0xDDE7F1,
).map { 0xFF000000L or it.toLong() }.toSet()

/**
 * Compose tokens of selected states (checked boxes, selected filter pills). They share their green constant with tokens that mean success, so they
 * are rewritten by field.
 */
private val COMPOSE_CHECKED_FIELDS = setOf(
    "checked", "checkedHover", "checkedActive", "currentLegacy", "currentLegacyHover", "currentLegacyActive",
    // Teal accent of charts (analytics).
    "accent5", "accent5Hover", "accent5Active",
)

/** Compose token of the post card and other containers. */
private const val COMPOSE_SURFACE_FIELD = "background"

/**
 * Compose tokens drawn behind cards, which show as gaps between them: between posts, and between profile sections.
 */
private val COMPOSE_GAP_FIELDS = setOf("backgroundNeutralStrong", "backgroundOffset")

/** Smali that passes each gap field of this theme and its card through MaterialYou.[method](JJ)J. */
private fun MutableClass.mapGaps(fields: Collection<String>, method: String) = fields.joinToString("\n") { field ->
    """
        sget-wide v0, $type->$field:J
        sget-wide v2, $type->$COMPOSE_SURFACE_FIELD:J
        invoke-static/range { v0 .. v3 }, $EXTENSION_PACKAGE/MaterialYou;->$method(JJ)J
        move-result-wide v0
        sput-wide v0, $type->$field:J
    """
}

/** Compose token of the faint borders: outlines around cards. */
private const val COMPOSE_BORDER_FIELD = "borderFaint"

/**
 * Divider components of server drawn lists: (class, method or null for every method) to the color getter whose
 * result they draw with. The getters are shared with other components, so only these calls are made transparent.
 */
private val COMPOSE_DIVIDERS = mapOf(
    ("Lcom/linkedin/android/infra/sdui/components/DividerKt;" to null) to "getBackgroundFaint-0d7_KjU",
    ("Lcom/linkedin/android/infra/sdui/components/LazyColumnItemsKt;" to "ListDivider") to "getBorderFaint-0d7_KjU",
)

/** LinkedIn's Application. */
private const val APPLICATION = "Lcom/linkedin/android/app/FlagshipApplication;"

/** Resolves the colors of server drawn screens: theme tokens, or raw and base palette colors the server sends. */
private const val SDUI_COLORS = "Lcom/linkedin/android/infra/sdui/utils/ColorUtilsKt;"

/**
 * Mercado MVP Compose themes, whose tokens are getters. The canvas is the background of every server drawn
 * screen, which shows through the gaps between list items and behind loading skeletons.
 */
private val MVP_THEMES = listOf(
    "Lcom/linkedin/android/mercado/mvp/compose/theme/light/MercadoMVPLightThemeColors;",
    "Lcom/linkedin/android/mercado/mvp/compose/theme/dark/MercadoMVPDarkThemeColors;",
)

/** Mercado MVP getters to the MaterialYou hook their result goes through. */
private val MVP_GETTERS = mapOf(
    "getBackgroundCanvas-0d7_KjU" to "mvpCanvas",
    "getBackgroundCanvasMobile-0d7_KjU" to "mvpCanvas",
    "getBackgroundContainer-0d7_KjU" to "surface",
)

/**
 * Hooks that both "Remove gaps and dividers" and "Material You" need: the Mercado MVP canvas and container, and
 * the raw and base palette colors of server drawn screens. Each hook checks both settings.
 */
private val sharedColorsPatch = bytecodePatch {
    dependsOn(settingsPatch)

    execute {
        // The Compose themes load before the Application exists; the extension needs a context for the wallpaper
        // colors by then.
        mutableClass(APPLICATION).methods.first { it.name == "attachBaseContext" }.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/Settings;->attachBaseContext(Landroid/content/Context;)V"
        )

        var getters = 0
        MVP_THEMES.forEach { type ->
            mutableClass(type).methods.filter { it.name in MVP_GETTERS }.forEach { method ->
                val hook = MVP_GETTERS.getValue(method.name)
                method.implementation!!.instructions.withIndex()
                    .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_WIDE }
                    .reversed()
                    .forEach { (index, instruction) ->
                        val register = (instruction as OneRegisterInstruction).registerA
                        method.addInstructions(
                            index,
                            """
                                invoke-static/range { v$register .. v${register + 1} }, $EXTENSION_PACKAGE/MaterialYou;->$hook(J)J
                                move-result-wide v$register
                            """
                        )
                    }
                getters++
            }
        }
        if (getters != MVP_GETTERS.size * MVP_THEMES.size) throw PatchException("Mercado MVP getters not found")

        // The resolver that takes the theme lookup map as well; the other overload calls it.
        val resolver = mutableClass(SDUI_COLORS).methods.first { it.name == "toUIColor" && it.parameterTypes.size > 2 }
        resolver.implementation!!.instructions.withIndex()
            .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
            .reversed()
            .forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                resolver.addInstructions(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/MaterialYou;->sduiUIColor(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, Landroidx/compose/ui/graphics/Color;
                    """
                )
            }
    }
}

/** Theme of server drawn screens, which merges the colors the server sends over the theme's tokens. */
private const val SDUI_THEME = "Lcom/linkedin/android/delux/theme/DeluxSDUIThemeProviderKt;"

/** The games streak card, which sets its background color in code. */
private const val STREAK_CARD = "Lcom/linkedin/android/profile/components/games/postgame/GamesStreakCardPresenter;"

/** Sets the system bar colors of every screen. */
private const val THEME_MANAGER = "Lcom/linkedin/android/infra/ui/theme/ThemeManager;"

/** The class with type [type]. */
private fun BytecodePatchContext.mutableClass(type: String): MutableClass {
    var found: MutableClass? = null
    classDefForEach { if (it.type == type) found = mutableClassDefBy(it) }
    return found ?: throw PatchException("$type not found")
}

/**
 * In the methods of [type] named [method] (every method when null), adds [smali] (for the result register) after
 * each wide result of a call to a method named [called]. Returns how many calls were found.
 */
private fun BytecodePatchContext.afterCallResults(
    type: String,
    method: String?,
    called: String,
    smali: (Int) -> String,
): Int {
    var found = 0
    mutableClass(type).methods.filter { method == null || it.name == method }.forEach { mutableMethod ->
        val instructions = mutableMethod.implementation?.instructions?.toList() ?: return@forEach
        instructions.withIndex().filter { (_, instruction) ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == called
        }.reversed().forEach { (index, _) ->
            val result = instructions.getOrNull(index + 1) as? OneRegisterInstruction ?: return@forEach
            if (instructions[index + 1].opcode != Opcode.MOVE_RESULT_WIDE) return@forEach
            mutableMethod.addInstructions(index + 2, smali(result.registerA))
            found++
        }
    }
    return found
}

/** Whether this is a call to Window.setNavigationBarContrastEnforced(boolean) or setNavigationBarColor(int). */
private fun Instruction.isContrastCall(): Boolean {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.definingClass == "Landroid/view/Window;" &&
        reference.name in setOf("setNavigationBarContrastEnforced", "setNavigationBarColor")
}

/** Whether this is a call to Window.setNavigationBarColor(int). */
private fun Instruction.isNavigationBarColorCall() =
    ((this as ReferenceInstruction).reference as MethodReference).name == "setNavigationBarColor"

/** The Compose theme classes that have a static initializer. */
private fun BytecodePatchContext.composeThemes(): List<MutableClass> {
    val themes = mutableListOf<MutableClass>()
    classDefForEach { classDef ->
        if (COMPOSE_THEME_PACKAGES.any { classDef.type.startsWith(it) } &&
            classDef.methods.any { it.name == "<clinit>" }
        ) themes += mutableClassDefBy(classDef)
    }
    return themes
}

/** The theme's static color fields (Compose colors are longs) with one of [names]. */
private fun MutableClass.colorFields(names: Set<String>) =
    fields.filter { it.name in names && it.type == "J" && AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.name }

/**
 * Adds [smali] before every return of the theme's static initializer, where the fields hold their final values
 * and every register is free. Returns false when the initializer has fewer than [registers] registers.
 */
private fun MutableClass.beforeInitializerReturns(registers: Int, smali: String): Boolean {
    val initializer = methods.first { it.name == "<clinit>" }
    if (initializer.implementation!!.registerCount < registers) return false
    initializer.implementation!!.instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_VOID }
        .reversed()
        .forEach { (index, _) -> initializer.addInstructions(index, smali) }
    return true
}

/** Smali that passes the static color field [field] of this theme through MaterialYou.[method](J)J. */
private fun MutableClass.mapField(field: String, method: String) = """
    sget-wide v0, $type->$field:J
    invoke-static/range { v0 .. v1 }, $EXTENSION_PACKAGE/MaterialYou;->$method(J)J
    move-result-wide v0
    sput-wide v0, $type->$field:J
"""

/**
 * Passes every color constant in [colors] of the theme's static initializer through MaterialYou.[method](J)J.
 * Returns how many constants were found.
 */
private fun MutableClass.mapColorConstants(colors: Set<Long>, method: String): Int {
    val initializer = methods.first { it.name == "<clinit>" }
    val constants = initializer.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.CONST_WIDE && (instruction as WideLiteralInstruction).wideLiteral in colors
    }
    // From the end, so the indexes of the earlier constants stay valid.
    constants.reversed().forEach { (index, instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        initializer.addInstructions(
            index + 1,
            """
                invoke-static/range { v$register .. v${register + 1} }, $EXTENSION_PACKAGE/MaterialYou;->$method(J)J
                move-result-wide v$register
            """
        )
    }
    return constants.size
}

@Suppress("unused")
val removeGapsAndDividersPatch = bytecodePatch(
    name = "Remove gaps and dividers",
    description = "Removes the gray gaps between posts and the dividers between list items, so the feed and " +
        "lists are one flat surface.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch, removeGapsResourcePatch, sharedColorsPatch)

    execute {
        var gaps = 0
        composeThemes().forEach { theme ->
            if (theme.colorFields(setOf(COMPOSE_SURFACE_FIELD)).isEmpty()) return@forEach
            val fields = theme.colorFields(COMPOSE_GAP_FIELDS)
            if (fields.isEmpty()) return@forEach
            if (!theme.beforeInitializerReturns(4, theme.mapGaps(fields, "flatGap"))) {
                throw PatchException("${theme.type} has too few registers")
            }
            gaps++
        }
        if (gaps == 0) throw PatchException("No Compose gap tokens found")

        COMPOSE_DIVIDERS.forEach { (location, getter) ->
            val found = afterCallResults(location.first, location.second, getter) { register ->
                """
                    invoke-static/range { v$register .. v${register + 1} }, $EXTENSION_PACKAGE/MaterialYou;->flatDivider(J)J
                    move-result-wide v$register
                """
            }
            if (found == 0) throw PatchException("No divider color in ${location.first}")
        }
        markIncluded("isRemoveGapsAndDividersIncluded")
    }
}

@Suppress("unused")
val materialYouPatch = bytecodePatch(
    name = "Material You",
    description = "Uses your wallpaper's colors (Android 12+): the accent color instead of LinkedIn blue and the " +
        "green of selected filters, and Material 3 surface colors for backgrounds, cards, bars and borders. " +
        "Some screens drawn by LinkedIn's servers may keep their own colors.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch, materialYouResourcePatch, materialYouBackgroundsResourcePatch, sharedColorsPatch)

    execute {
        var replaced = 0
        var checked = 0
        composeThemes().forEach { theme ->
            replaced += theme.mapColorConstants(COMPOSE_ACCENTS, "accent")

            // Translucent blues (search fields, pressed states) are built from components, not constants.
            val translucent = theme.fields.filter { it.type == "J" && AccessFlags.STATIC.isSet(it.accessFlags) }
                .map { it.name }
            if (translucent.isNotEmpty() &&
                !theme.beforeInitializerReturns(2, translucent.joinToString("\n") { theme.mapField(it, "translucentAccent") })
            ) throw PatchException("${theme.type} has too few registers")

            val fields = theme.colorFields(COMPOSE_CHECKED_FIELDS)
            if (fields.isEmpty()) return@forEach
            if (!theme.beforeInitializerReturns(2, fields.joinToString("\n") { theme.mapField(it, "checked") })) {
                throw PatchException("${theme.type} has too few registers")
            }
            checked += fields.size
        }
        if (replaced == 0) throw PatchException("No Compose theme accent colors found")
        if (checked == 0) throw PatchException("No Compose checked tokens found")

        // p2 is the map of colors a server drawn screen sends to override the theme's tokens.
        mutableClass(SDUI_THEME).methods.first { it.name == "DeluxSduiTheme" }.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $EXTENSION_PACKAGE/MaterialYou;->sduiColors(Ljava/util/Map;)Ljava/util/Map;
                move-result-object p2
            """
        )

        var backgrounds = 0
        var surfaced = 0
        composeThemes().forEach { theme ->
            backgrounds += theme.mapColorConstants(COMPOSE_BACKGROUNDS, "background")

            // Surface tokens are rewritten by field, not by value: their constants (white, for one) are shared
            // with text and icon tokens. The gap is mapped first, while the card still has LinkedIn's color, so a
            // gap that "Remove gaps and dividers" made equal to the card gets the card's color.
            val fields = theme.colorFields(COMPOSE_GAP_FIELDS + COMPOSE_SURFACE_FIELD + COMPOSE_BORDER_FIELD)
            if (COMPOSE_SURFACE_FIELD !in fields) return@forEach
            val smali = buildString {
                // The faint border is the same translucent gray in both themes, so the theme picks the tone.
                if (COMPOSE_BORDER_FIELD in fields) {
                    append(theme.mapField(COMPOSE_BORDER_FIELD, if ("Dark" in theme.type) "borderDark" else "borderLight"))
                }
                appendLine(theme.mapGaps(fields.filter { it in COMPOSE_GAP_FIELDS }, "canvas"))
                append(theme.mapField(COMPOSE_SURFACE_FIELD, "surface"))
            }
            if (!theme.beforeInitializerReturns(4, smali)) throw PatchException("${theme.type} has too few registers")
            surfaced += fields.size
        }
        if (backgrounds == 0) throw PatchException("No Compose theme background colors found")
        if (surfaced == 0) throw PatchException("No Compose surface tokens found")

        // The status bar and navigation bar colors that ThemeManager sets: white, or the dark container.
        var bars = 0
        mutableClass(THEME_MANAGER).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.withIndex().filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/view/Window;" &&
                    reference.name in setOf("setStatusBarColor", "setNavigationBarColor")
            }.reversed().forEach { (index, instruction) ->
                val color = instruction.secondArgument()
                method.addInstructions(
                    index,
                    """
                        invoke-static/range { v$color .. v$color }, $EXTENSION_PACKAGE/MaterialYou;->bar(I)I
                        move-result v$color
                    """
                )
                bars++
            }
        }
        if (bars == 0) throw PatchException("No system bar colors found")

        // The games streak card sets its background in code: white, or the dark container.
        var streaks = 0
        mutableClass(STREAK_CARD).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.withIndex().filter { (_, instruction) ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setBackgroundColor"
            }.reversed().forEach { (index, instruction) ->
                val color = instruction.secondArgument()
                method.addInstructions(
                    index,
                    """
                        invoke-static/range { v$color .. v$color }, $EXTENSION_PACKAGE/MaterialYou;->bar(I)I
                        move-result v$color
                    """
                )
                streaks++
            }
        }
        if (streaks == 0) throw PatchException("No streak card background found")

        // LinkedIn (and AndroidX's edge-to-edge) turn the navigation bar contrast on, or give the navigation bar a
        // white scrim as its color, which covers the tinted bottom bar behind the gesture bar.
        var contrasts = 0
        val callers = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.isContrastCall() } == true
                }) callers += classDef
        }
        callers.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.withIndex().filter { (_, instruction) -> instruction.isContrastCall() }
                    .reversed()
                    .forEach { (index, instruction) ->
                        val argument = instruction.secondArgument()
                        val hook = if (instruction.isNavigationBarColorCall()) "navigationBarColor(I)I" else "navigationBarContrast(Z)Z"
                        method.addInstructions(
                            index,
                            """
                                invoke-static/range { v$argument .. v$argument }, $EXTENSION_PACKAGE/MaterialYou;->$hook
                                move-result v$argument
                            """
                        )
                        contrasts++
                    }
            }
        }
        if (contrasts == 0) throw PatchException("No navigation bar contrast calls found")
        markIncluded("isMaterialYouIncluded")
    }
}

/**
 * The register of the second argument of a call (the color or flag after the receiver), in either invoke form:
 * up to five registers, or a range when the registers are above v15.
 */
private fun Instruction.secondArgument(): Int = when (this) {
    is FiveRegisterInstruction -> registerD
    is RegisterRangeInstruction -> startRegister + 1
    else -> throw PatchException("Unexpected call $opcode")
}
