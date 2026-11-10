/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

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

// The color tables below are written as "name=value" lines, several of them per call, because the same
// source maps to the same system token over and over and the full spellings are hard to compare by eye.

/** Resource color to system color, e.g. "mercado_mvp_blue_70=system_accent1_600". Order is kept. */
private fun colors(vararg entries: String): Map<String, String> =
    entries.associate { entry ->
        val at = entry.indexOf('=')
        entry.substring(0, at) to entry.substring(at + 1)
    }

/** (style, attribute) to color resource, written "style|attribute=color". Order is kept. */
private fun themed(vararg entries: String): Map<Pair<String, String>, String> =
    entries.associate { entry ->
        val at = entry.indexOf('=')
        val styleEnd = entry.indexOf('|')
        (entry.substring(0, styleEnd) to entry.substring(styleEnd + 1, at)) to entry.substring(at + 1)
    }

/**
 * LinkedIn's blue (blue_* and the design system's mercado_mvp_blue_*) per tone, mapped to the tone of the
 * system accent palette: tone 70 is the action color on light backgrounds, tone 50 on dark ones.
 */
private val BLUE_TONES = listOf(
    "10=10", "20=50", "30=100", "40=200", "50=200", "60=400", "70=600", "80=700", "90=800", "100=900",
)

/** The older ArtDeco blue (used for links in messages, for instance), mapped like LinkedIn blue. */
private val ARTDECO_BLUES = colors(
    "ad_blue_1=system_accent1_50", "ad_blue_2=system_accent1_100", "ad_blue_5=system_accent1_400",
    "ad_blue_6=system_accent1_500", "ad_blue_7=system_accent1_600", "ad_blue_8=system_accent1_700",
    "ad_blue_9=system_accent1_800",
)

/**
 * The greens behind selected states (checked chips and filters, notification filters among them) mapped to the
 * accent palette tone by tone: 70 to 600, 60 to 400, 50 to 200, 40 and 30 to 100, 80 to 800. The translucent
 * ones stay green.
 */
private val CHECKED_GREENS = colors(
    "mercado_mvp_color_checked=system_accent1_600",
    "mercado_mvp_color_checked_offset=system_accent1_400",
    "mercado_mvp_color_checked_offset_active=system_accent1_600",
    "mercado_mvp_color_checked_offset_on_dark=system_accent1_200",
    "mercado_mvp_color_checked_offset_on_dark_active=system_accent1_400",
    "mercado_mvp_color_checked_on_dark=system_accent1_200",
    "mercado_mvp_color_checked_on_dark_active=system_accent1_100",
    "mercado_mvp_color_checked_tint=system_accent1_100",
    "mercado_mvp_color_checked_tint_on_dark=system_accent1_800",
    "mercado_mvp_dark_color_checked_offset=system_accent1_200",
    "mercado_mvp_dark_color_checked_offset_active=system_accent1_400",
    "mercado_mvp_dark_color_checked_offset_on_dark=system_accent1_200",
    "mercado_mvp_dark_color_checked_offset_on_dark_active=system_accent1_400",
    "mercado_mvp_dark_color_checked_on_dark=system_accent1_200",
    "mercado_mvp_dark_color_checked_on_dark_active=system_accent1_100",
    "mercado_mvp_dark_color_checked_tint=system_accent1_800",
    "mercado_mvp_dark_color_checked_tint_on_dark=system_accent1_800",
)

/**
 * The light and dark backgrounds of the design system, mapped to the tinted system neutrals so that the
 * canvas and the cards take on the wallpaper as well. A container (card, bar, list) sits one tone above the
 * canvas behind it; the container tint, which marks unread notifications, one tone below the container.
 */
private val BACKGROUNDS = colors(
    "mercado_mvp_color_background_canvas=system_neutral2_100",
    "mercado_mvp_color_background_canvas_mobile=system_neutral2_100",
    "mercado_mvp_color_background_canvas_tint=system_neutral1_10",
    "mercado_mvp_color_background_container=system_neutral2_50",
    "mercado_mvp_color_background_container_tint=system_neutral2_100",
    "mercado_mvp_dark_color_background_canvas=system_neutral1_1000",
    "mercado_mvp_dark_color_background_canvas_mobile=system_neutral1_1000",
    "mercado_mvp_dark_color_background_canvas_tint=system_neutral2_800",
    "mercado_mvp_dark_color_background_canvas_dark_tint=system_neutral2_800",
    "mercado_mvp_dark_color_background_container=system_neutral1_900",
    "mercado_mvp_dark_color_background_container_dark=system_neutral1_900",
    "mercado_mvp_dark_color_background_container_tint=system_neutral2_800",
    "mercado_mvp_dark_color_background_container_dark_tint=system_neutral2_800",
    // The dark variants that the light theme uses for its dark surfaces.
    "mercado_mvp_color_background_canvas_dark=system_neutral1_1000",
    "mercado_mvp_color_background_canvas_dark_tint=system_neutral2_800",
    "mercado_mvp_color_background_container_dark=system_neutral1_900",
    "mercado_mvp_color_background_container_dark_tint=system_neutral2_800",
    "color_splash_canvas_background=system_neutral2_50",
    // The faint border (the outline of a card) becomes an opaque outline tone. The themes point at these
    // (see THEME_SURFACES): their own translucent gray doubles as the disabled and pressed background.
    "mercado_mvp_color_border_faint=system_neutral2_200",
    "mercado_mvp_dark_color_border_faint_on_dark=system_neutral2_700",
)

/**
 * The same backgrounds as the Material 3 surface roles that Android 14 adds: surface for the containers, the
 * low container surface for the canvas, the high one for tinted rows and inputs, the highest for the faint
 * borders. Dark containers take the container surface, as in Google's apps.
 */
private val BACKGROUNDS_V34 = colors(
    "mercado_mvp_color_background_canvas=system_surface_container_low_light",
    "mercado_mvp_color_background_canvas_mobile=system_surface_container_low_light",
    "mercado_mvp_color_background_canvas_tint=system_surface_light",
    "mercado_mvp_color_background_container=system_surface_light",
    "mercado_mvp_color_background_container_tint=system_surface_container_high_light",
    "mercado_mvp_dark_color_background_canvas=system_surface_dark",
    "mercado_mvp_dark_color_background_canvas_mobile=system_surface_dark",
    "mercado_mvp_dark_color_background_canvas_tint=system_surface_container_high_dark",
    "mercado_mvp_dark_color_background_canvas_dark_tint=system_surface_container_high_dark",
    "mercado_mvp_dark_color_background_container=system_surface_container_dark",
    "mercado_mvp_dark_color_background_container_dark=system_surface_container_dark",
    "mercado_mvp_dark_color_background_container_tint=system_surface_container_high_dark",
    "mercado_mvp_dark_color_background_container_dark_tint=system_surface_container_high_dark",
    "mercado_mvp_color_background_canvas_dark=system_surface_dark",
    "mercado_mvp_color_background_canvas_dark_tint=system_surface_container_high_dark",
    "mercado_mvp_color_background_container_dark=system_surface_container_dark",
    "mercado_mvp_color_background_container_dark_tint=system_surface_container_high_dark",
    "color_splash_canvas_background=system_surface_light",
    "mercado_mvp_color_border_faint=system_surface_container_highest_light",
    "mercado_mvp_dark_color_border_faint_on_dark=system_surface_container_highest_dark",
)

/** The colors LinkedIn declares separately for dark mode (values-night). */
private val NIGHT_BACKGROUNDS = colors(
    "color_splash_canvas_background=system_neutral1_900",
    "color_status_bar=system_neutral1_900",
)

/** [NIGHT_BACKGROUNDS] as Material 3 surface roles. */
private val NIGHT_BACKGROUNDS_V34 = colors(
    "color_splash_canvas_background=system_surface_container_dark",
    "color_status_bar=system_surface_container_dark",
)

/**
 * Theme attributes that point at a generic white or gray, also used by text and icons, instead of at a
 * background: (style, attribute) to the background color they get instead. The top and bottom bar of the home
 * screen, cards, carousels, the games streak widget and the sheet background behind the grip bar. The resource
 * encoder refuses new resource names, so these reuse colors that look the same below Android 12 (white, and
 * #1d2226 in place of #1b1f23).
 */
private val THEME_SURFACES = themed(
    "VoyagerAppTheme.Mercado|voyagerColorNavHomeTopBar=mercado_mvp_color_background_container",
    "VoyagerAppTheme.Mercado|voyagerColorNavHome=mercado_mvp_color_background_container",
    "VoyagerAppTheme.Mercado|voyagerColorBackgroundCard=mercado_mvp_color_background_container",
    "VoyagerAppTheme.Mercado|voyagerColorBackgroundCarousel=mercado_mvp_color_background_container",
    "VoyagerAppTheme.Mercado|voyagerGameWidgetStreakBackgroundColor=mercado_mvp_color_background_container",
    "Delux.Theme.Light|deluxColorBackground=mercado_mvp_color_background_container",
    "Delux.Theme.Dark|deluxColorBackground=mercado_mvp_dark_color_background_container",
    // Window backgrounds: the gaps between the items of server drawn lists, and the empty space below
    // lists (Groups).
    "VoyagerAppTheme.Mercado|android:windowBackground=mercado_mvp_color_background_canvas_mobile",
    "Delux.Theme.Light|deluxColorBackgroundOffset=mercado_mvp_color_background_canvas",
    // Faint borders: the outlines around cards, and the dividers of the View based screens.
    // Inputs, search boxes, skeletons and table rows: warm and cool grays to the canvas tones.
    "VoyagerAppTheme.Mercado|voyagerColorBackgroundCanvasShaded=mercado_mvp_color_background_canvas_mobile",
    "VoyagerAppTheme.Mercado|voyagerColorBackgroundRecyclerView=mercado_mvp_color_background_canvas_mobile",
    "VoyagerAppTheme.Mercado|voyagerColorBackgroundSearch=mercado_mvp_color_background_canvas",
    "Mercado.MVP.AppTheme|voyagerColorBackgroundInputSearch=mercado_mvp_color_background_canvas",
    "Mercado.MVP.AppTheme|voyagerColorBackgroundInputSearchActive=mercado_mvp_color_background_container_tint",
    "Mercado.MVP.AppTheme|voyagerMessengerColorBackgroundInputMessage=mercado_mvp_color_background_canvas",
    "Mercado.MVP.AppTheme|voyagerMessengerColorBackgroundInputMessageActive=mercado_mvp_color_background_canvas_mobile",
    "Mercado.MVP.AppTheme.Dark|voyagerColorBackgroundInputSearch=mercado_mvp_dark_color_background_container_tint",
    "Mercado.MVP.AppTheme.Dark|voyagerColorBackgroundInputSearchActive=mercado_mvp_dark_color_background_container_tint",
    "Delux.Theme.Light|deluxColorBackgroundNeutralSoft=mercado_mvp_color_background_canvas",
    // Pale blue cards (cool gray 20).
    "Delux.Theme.Light|deluxColorBackgroundAccentSoft4=mercado_mvp_color_background_container_tint",
    "Delux.Theme.Dark|deluxColorBackgroundAccentSoft4=mercado_mvp_dark_color_background_container",
    "Delux.Theme.Light|deluxColorBackgroundAccentStrong4=mercado_mvp_color_background_container_tint",
    "Delux.Theme.Dark|deluxColorBackgroundAccentStrong4=mercado_mvp_dark_color_background_container_tint",
    "Mercado.MVP.AppTheme|voyagerColorBackgroundContainerTint2=mercado_mvp_color_background_container_tint",
    "Mercado.MVP.AppTheme.Dark|voyagerColorBackgroundContainerTint2=mercado_mvp_dark_color_background_container_tint",
    "Delux.Theme.Light|deluxColorBackgroundNeutralStrong=mercado_mvp_color_background_canvas_mobile",
    "Delux.Theme.Light|deluxColorTableBackgroundOffset=mercado_mvp_color_background_container_tint",
    "Delux.Theme.Light|deluxColorSearchInputBackground=mercado_mvp_color_background_canvas",
    "Delux.Theme.Light|deluxColorSearchInputBackgroundActive=mercado_mvp_color_background_container_tint",
    "Delux.Theme.Dark|deluxColorBackgroundNeutralSoft=mercado_mvp_dark_color_background_container",
    "Delux.Theme.Dark|deluxColorBackgroundNeutralStrong=mercado_mvp_dark_color_background_container_tint",
    "Delux.Theme.Dark|deluxColorTableBackgroundOffset=mercado_mvp_dark_color_background_container",
    "Delux.Theme.Dark|deluxColorSearchInputBackground=mercado_mvp_dark_color_background_container_tint",
    "Delux.Theme.Dark|deluxColorSearchInputBackgroundActive=mercado_mvp_dark_color_background_container_tint",
    "Mercado.MVP.AppTheme|mercadoColorBorderFaint=mercado_mvp_color_border_faint",
    "Delux.Theme.Light|deluxColorBorderFaint=mercado_mvp_color_border_faint",
    "Mercado.MVP.AppTheme.Dark|mercadoColorBorderFaint=mercado_mvp_dark_color_border_faint_on_dark",
    "Delux.Theme.Dark|deluxColorBorderFaint=mercado_mvp_dark_color_border_faint_on_dark",
)

/**
 * Theme attributes of selected tabs (the Groups and Newsletters tabs), green in LinkedIn's palette, pointing
 * at the [CHECKED_GREENS] color of the same tone.
 */
private val THEME_ACCENTS = themed(
    "Delux.Theme.Light|deluxColorCurrentContextualOverride=mercado_mvp_color_checked",
    "Delux.Theme.Light|deluxColorCurrentActiveContextualOverride=mercado_mvp_color_checked_tint_on_dark",
    "Delux.Theme.Dark|deluxColorCurrentContextualOverride=mercado_mvp_color_checked_on_dark",
    "Delux.Theme.Dark|deluxColorCurrentActiveContextualOverride=mercado_mvp_color_checked_on_dark_active",
    // Checked chips, radio buttons, switches and selection badges.
    "Delux.Theme.Light|deluxColorChecked=mercado_mvp_color_checked",
    "Delux.Theme.Light|deluxColorCheckedActive=mercado_mvp_color_checked_tint_on_dark",
    "Delux.Theme.Light|deluxColorInputAndroidTrackChecked=mercado_mvp_color_checked_offset",
    "Delux.Theme.Dark|deluxColorChecked=mercado_mvp_color_checked_on_dark",
    "Delux.Theme.Dark|deluxColorCheckedActive=mercado_mvp_color_checked_on_dark_active",
    "Delux.Theme.Dark|deluxColorInputAndroidTrackChecked=mercado_mvp_color_checked_on_dark_active",
    "Mercado.MVP.AppTheme|mercadoColorChecked=mercado_mvp_color_checked",
    "Mercado.MVP.AppTheme|mercadoColorCheckedActive=mercado_mvp_color_checked_tint_on_dark",
    "Mercado.MVP.AppTheme|voyagerColorBackgroundBadgeSelection=mercado_mvp_color_checked",
    "Mercado.MVP.AppTheme.Dark|mercadoColorChecked=mercado_mvp_color_checked_on_dark",
    "Mercado.MVP.AppTheme.Dark|mercadoColorCheckedActive=mercado_mvp_color_checked_on_dark_active",
    "Mercado.MVP.AppTheme.Dark|voyagerColorBackgroundBadgeSelection=mercado_mvp_color_checked",
    "VoyagerAppTheme.Mercado|voyagerTabLayoutTextColor=mercado_mvp_color_checked",
    // Unread notification rows: pale blue in the light theme, which follows the accent, a cool gray in the
    // dark one, which gets the dark accent tint instead.
    "Mercado.MVP.AppTheme.Dark|voyagerColorBackgroundNewSolid=mercado_mvp_blue_90",
    // Selected tabs on dark screens (the Groups tabs in dark mode), whose text uses the success green.
    "Mercado.Lite.TabLayout.Fixed.Inverse|tabIndicatorColor=mercado_mvp_color_checked_on_dark",
    "Mercado.Lite.TabLayout.Fixed.Inverse|tabSelectedTextColor=mercado_mvp_color_checked_on_dark",
    // The teal of the analytics charts, to LinkedIn blue of the same tone.
    "Delux.Theme.Light|deluxColorAccent5=mercado_mvp_blue_70",
    "Delux.Theme.Light|deluxColorAccent5Active=mercado_mvp_blue_80",
    "Delux.Theme.Dark|deluxColorAccent5=mercado_mvp_blue_50",
    "Delux.Theme.Dark|deluxColorAccent5Active=mercado_mvp_blue_40",
)

/** Backgrounds that show through the gaps between the items of server drawn lists. */
private val GAP_ATTRIBUTES = setOf(
    "android:windowBackground", "voyagerColorBackgroundCanvasShaded", "voyagerColorBackgroundRecyclerView",
)

/**
 * The canvas of the View based screens (behind the group feeds, for one), which shows between the cards and
 * the posts: (style, attribute) to the card color of the same theme.
 */
private val CANVAS_ATTRIBUTES = themed(
    "Mercado.MVP.AppTheme|mercadoColorBackgroundCanvas=mercado_mvp_color_background_container",
    "Mercado.MVP.AppTheme|mercadoColorBackgroundCanvasMobile=mercado_mvp_color_background_container",
    "Mercado.MVP.AppTheme.Dark|mercadoColorBackgroundCanvas=mercado_mvp_dark_color_background_container",
    "Mercado.MVP.AppTheme.Dark|mercadoColorBackgroundCanvasMobile=mercado_mvp_dark_color_background_container",
)

/** The light and dark styles of the app's windows. */
private val APP_THEMES = listOf("VoyagerAppTheme.Mercado", "VoyagerAppTheme.Mercado.Dark")

/** The background of cards and lists, which "Remove gaps and dividers" also gives the window. */
private const val CONTAINER_COLOR = "@color/mercado_mvp_color_background_container"

/** Accent resource colors: the layouts and the View based screens. */
private val materialYouResourcePatch = resourcePatch {
    execute {
        // blue_90 and mercado_mvp_blue_100 are not in LinkedIn's palette.
        val accents = mutableMapOf<String, String>()
        for (tone in BLUE_TONES) {
            val (from, to) = tone.split('=')
            if (from != "90") accents["blue_$from"] = "system_accent1_$to"
            if (from != "100") accents["mercado_mvp_blue_$from"] = "system_accent1_$to"
        }
        accents.putAll(CHECKED_GREENS)
        accents.putAll(ARTDECO_BLUES)
        val themed = rewriteThemeItems { style, item, _ -> THEME_ACCENTS[style to item]?.let { "@color/$it" } }
        if (themed != THEME_ACCENTS.size) throw PatchException("Theme accent attributes not found")
        // values-v31: the system palette only exists from Android 12 on, older versions keep LinkedIn's colors.
        writeColorResources("values-v31", accents)
    }
}

/** Background resource colors, and the theme attributes that use a generic white or gray as a background. */
private val materialYouBackgroundsResourcePatch = resourcePatch {
    execute {
        // A window background that "Remove gaps and dividers" already set to the card color keeps it.
        val surfaces = rewriteThemeItems { style, item, current ->
            THEME_SURFACES[style to item]?.let { if (current == CONTAINER_COLOR) current else "@color/$it" }
        }
        if (surfaces != THEME_SURFACES.size) throw PatchException("Theme surface attributes not found")

        // Android draws a white scrim behind the gesture bar, over the tinted bottom bar, unless the theme
        // switches its contrast off.
        APP_THEMES.forEach { appendThemeItem(it, "android:enforceNavigationBarContrast", "false") }

        writeColorResources("values-v31", BACKGROUNDS)
        writeColorResources("values-night-v31", NIGHT_BACKGROUNDS)
        writeColorResources("values-v34", BACKGROUNDS_V34)
        writeColorResources("values-night-v34", NIGHT_BACKGROUNDS_V34)
    }
}

/** Gives the window and list backgrounds, which show through the gaps of server drawn lists, the card color. */
private val removeGapsResourcePatch = resourcePatch {
    execute {
        val windows = rewriteThemeItems { style, item, _ ->
            if (style == "VoyagerAppTheme.Mercado" && item in GAP_ATTRIBUTES) CONTAINER_COLOR
            else CANVAS_ATTRIBUTES[style to item]?.let { "@color/$it" }
        }
        if (windows != GAP_ATTRIBUTES.size + CANVAS_ATTRIBUTES.size) throw PatchException("Window background not found")

        // A thick view with the faint border, canvas or divider background is a gap between list items (search
        // results, saved posts, analytics cards); the 1dp ones are dividers and outlines, which keep it.
        val dimensions = document("res/values/dimens.xml").use { document ->
            val nodes = document.getElementsByTagName("dimen")
            (0 until nodes.length).map { nodes.item(it) as Element }
                .associate { it.getAttribute("name") to it.textContent }
        }
        fun dpOf(value: String, depth: Int = 0): Float? = when {
            value.startsWith("@dimen/") && depth < 5 -> dimensions[value.removePrefix("@dimen/")]?.let { dpOf(it, depth + 1) }
            else -> DP_VALUE.matchEntire(value)?.groupValues?.get(1)?.toFloatOrNull()
        }
        var gaps = 0
        val directories = get("res").listFiles { file -> file.isDirectory && file.name.startsWith("layout") }!!
        for (directory in directories) {
            val layouts = directory.listFiles { file -> file.extension == "xml" }!!.filter { file ->
                // Most layouts have no candidate view at all, so only those get parsed.
                GAP_VIEW.findAll(file.readText()).any { it.isGapView(::dpOf) }
            }
            for (file in layouts) {
                document("res/${directory.name}/${file.name}").use { document ->
                    val views = document.getElementsByTagName("*")
                    for (i in 0 until views.length) {
                        val view = views.item(i) as Element
                        if (!GAP_VIEW_BACKGROUND.matches(view.getAttribute("android:background"))) continue
                        val height = dpOf(view.getAttribute("android:layout_height")) ?: continue
                        if (height < 4 || height > 12) continue
                        view.setAttribute("android:background", "@android:color/transparent")
                        gaps++
                    }
                }
            }
        }
        if (gaps == 0) throw PatchException("No gap views found")
    }
}

/** Backgrounds of the thick spacer views between list items: theme canvases, dividers and faint borders. */
private val GAP_VIEW_BACKGROUND = Regex("""\?attr/\w*(Canvas|Divider|BorderFaint)\w*""")

/** One view tag of a layout file. */
private val GAP_VIEW = Regex("""<[\w.]+\b[^>]*>""")

/** A dimension in dp, as written in dimens.xml or a layout. */
private val DP_VALUE = Regex("""(-?[\d.]+)(dp|dip)""")

private val BACKGROUND_ATTRIBUTE = Regex("""android:background="([^"]+)"""")
private val HEIGHT_ATTRIBUTE = Regex("""android:layout_height="([^"]+)"""")

/** Whether this tag is a view 4 to 12 dp high whose background is a [GAP_VIEW_BACKGROUND]. */
private fun MatchResult.isGapView(dp: (String) -> Float?): Boolean {
    val background = BACKGROUND_ATTRIBUTE.find(value)?.groupValues?.get(1) ?: return false
    if (!GAP_VIEW_BACKGROUND.matches(background)) return false
    val height = HEIGHT_ATTRIBUTE.find(value)?.groupValues?.get(1)?.let(dp) ?: return false
    return height in 4f..12f
}

/**
 * Rewrites every item of res/values/styles.xml for which [value] (style name, item name, current value)
 * returns a value. Returns how many items were rewritten.
 */
private fun ResourcePatchContext.rewriteThemeItems(value: (String, String, String) -> String?): Int {
    var rewritten = 0
    document("res/values/styles.xml").use { document ->
        val styles = document.getElementsByTagName("style")
        for (i in 0 until styles.length) {
            val items = (styles.item(i) as Element).getElementsByTagName("item")
            val styleName = (styles.item(i) as Element).getAttribute("name")
            for (j in 0 until items.length) {
                val item = items.item(j) as Element
                val itemName = item.getAttribute("name")
                item.textContent = value(styleName, itemName, item.textContent) ?: continue
                rewritten++
            }
        }
    }
    return rewritten
}

/** Appends the item [name] with [value] to the style [style] of res/values/styles.xml. */
private fun ResourcePatchContext.appendThemeItem(style: String, name: String, value: String) {
    document("res/values/styles.xml").use { document ->
        val styles = document.getElementsByTagName("style")
        val target = (0 until styles.length).map { styles.item(it) as Element }
            .firstOrNull { it.getAttribute("name") == style }
            ?: throw PatchException("Style $style not found")
        target.appendChild(document.createElement("item").also { item ->
            item.setAttribute("name", name)
            item.textContent = value
        })
    }
}

/**
 * Writes [colors] (resource name to system color) into the colors.xml of [directory]. New entries are appended
 * to the file LinkedIn may already have there, so its other colors stay and none is defined twice.
 */
private fun ResourcePatchContext.writeColorResources(directory: String, colors: Map<String, String>) {
    val file = get("res").resolve(directory).resolve("colors.xml")
    if (!file.exists()) {
        file.parentFile.mkdirs()
        file.writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>\n")
    }
    document("res/$directory/colors.xml").use { document ->
        val resources = document.documentElement
        val nodes = resources.getElementsByTagName("color")
        val known = (0 until nodes.length).map { nodes.item(it) as Element }.associateBy { it.getAttribute("name") }
        for ((name, system) in colors) {
            val color = known[name] ?: document.createElement("color").also {
                it.setAttribute("name", name)
                resources.appendChild(it)
            }
            color.textContent = "@android:color/$system"
        }
    }
}

/**
 * Packages of the Compose themes (Delux and Mercado). They keep their palettes in the static initializers of
 * the color classes, so the colors are rewritten there, once the values are final.
 */
private val COMPOSE_THEME_PACKAGES = listOf(
    "Lcom/linkedin/android/delux/compose/theme",
    "Lcom/linkedin/android/mercado/mvp/compose/",
)

/** The blue colors replaced at runtime, in step with MaterialYou.java. */
private val COMPOSE_ACCENTS = setOf(
    0xF6FBFF, 0xE8F3FF, 0xD0E8FF, 0xD2E9FF, 0xA8D4FF, 0xAAD6FF, 0x70B5F9, 0x71B7FB,
    0x378FE9, 0x0A66C2, 0x004182, 0x09223B, 0x0A2037,
).map { 0xFF000000L or it.toLong() }.toSet()

/** The background colors replaced at runtime, in step with MaterialYou.java. */
private val COMPOSE_BACKGROUNDS = setOf(
    0x1B1F23, 0x1D2226, 0x293037, 0x293138, 0xF4F2EE, 0xF3F2EF, 0xF8FAFD, 0xEDF3F8, 0xEEF3F8, 0xDDE7F1,
).map { 0xFF000000L or it.toLong() }.toSet()

/**
 * Compose tokens of the selected states (checked boxes, selected filter pills). Their green is the same
 * constant as the one of the success tokens, so they are rewritten by field and not by value.
 */
private val COMPOSE_CHECKED_FIELDS = setOf(
    "checked", "checkedHover", "checkedActive", "currentLegacy", "currentLegacyHover", "currentLegacyActive",
    // The teal of the analytics charts.
    "accent5", "accent5Hover", "accent5Active",
)

/** The Compose token of the post card and of the other containers. */
private const val COMPOSE_SURFACE_FIELD = "background"

/** The Compose tokens drawn behind the cards, visible as the gaps between posts and profile sections. */
private val COMPOSE_GAP_FIELDS = setOf("backgroundNeutralStrong", "backgroundOffset")

/** The Compose token of the faint border, the outline of a card. */
private const val COMPOSE_BORDER_FIELD = "borderFaint"

/** Smali that passes each of [fields] and the theme's card color through MaterialYou.[method](J,J)J. */
private fun MutableClass.gapHook(fields: Collection<String>, method: String) = fields.joinToString("\n") { field ->
    """
        sget-wide v0, $type->$field:J
        sget-wide v2, $type->$COMPOSE_SURFACE_FIELD:J
        invoke-static/range { v0 .. v3 }, $EXTENSION_PACKAGE/MaterialYou;->$method(JJ)J
        move-result-wide v0
        sput-wide v0, $type->$field:J
    """
}

/**
 * The divider composables of server drawn lists: (class, method or null for all of them) and the color getter
 * whose result they draw with. The getters are shared with other components, so only these calls are touched.
 */
private val COMPOSE_DIVIDERS = listOf(
    Triple("Lcom/linkedin/android/infra/sdui/components/DividerKt;", null, "getBackgroundFaint-0d7_KjU"),
    Triple("Lcom/linkedin/android/infra/sdui/components/LazyColumnItemsKt;", "ListDivider", "getBorderFaint-0d7_KjU"),
)

/** LinkedIn's Application class. */
private const val APPLICATION = "Lcom/linkedin/android/app/FlagshipApplication;"

/** Resolves the colors of server drawn screens: theme tokens, or raw and palette colors the server sends. */
private const val SDUI_COLORS = "Lcom/linkedin/android/infra/sdui/utils/ColorUtilsKt;"

/**
 * The Mercado MVP Compose themes, whose tokens are getters. The canvas is the background of every server drawn
 * screen: it shows as the gaps between list items and behind the loading skeletons.
 */
private val MVP_THEMES = listOf(
    "Lcom/linkedin/android/mercado/mvp/compose/theme/light/MercadoMVPLightThemeColors;",
    "Lcom/linkedin/android/mercado/mvp/compose/theme/dark/MercadoMVPDarkThemeColors;",
)

/** Mercado MVP getters and the MaterialYou hook their result goes through. */
private val MVP_GETTERS = mapOf(
    "getBackgroundCanvas-0d7_KjU" to "mvpCanvas",
    "getBackgroundCanvasMobile-0d7_KjU" to "mvpCanvas",
    "getBackgroundContainer-0d7_KjU" to "surface",
)

/**
 * The hooks shared by "Remove gaps and dividers" and "Material You": the canvas and container of the Mercado
 * MVP theme, and the raw and palette colors of server drawn screens. Each hook checks both settings.
 */
private val sharedColorsPatch = bytecodePatch {
    dependsOn(settingsPatch)

    execute {
        // The Compose themes are loaded before an Application exists, so the extension is handed the context
        // it needs for the wallpaper colors here.
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

        // The overload that takes the theme lookup map as well; the other one calls it.
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

/** The theme of server drawn screens, which merges the colors the server sends over the theme's tokens. */
private const val SDUI_THEME = "Lcom/linkedin/android/delux/theme/DeluxSDUIThemeProviderKt;"

/** The games streak card, which sets its background color in code. */
private const val STREAK_CARD = "Lcom/linkedin/android/profile/components/games/postgame/GamesStreakCardPresenter;"

/** Sets the system bar colors of every screen. */
private const val THEME_MANAGER = "Lcom/linkedin/android/infra/ui/theme/ThemeManager;"

/** The mutable class with [type]. */
private fun BytecodePatchContext.mutableClass(type: String): MutableClass {
    var found: MutableClass? = null
    classDefForEach { if (it.type == type) found = mutableClassDefBy(it) }
    return found ?: throw PatchException("$type not found")
}

/**
 * In the methods of [type] named [method] (all of them when null), adds [smali] (built from the result
 * register) after each wide result of a call to the method named [called]. Returns how many calls were found.
 */
private fun BytecodePatchContext.hookAfterWideResults(
    type: String,
    method: String?,
    called: String,
    smali: (Int) -> String,
): Int {
    var found = 0
    mutableClass(type).methods.filter { method == null || it.name == method }.forEach { target ->
        val code = target.implementation?.instructions?.toList() ?: return@forEach
        code.withIndex().filter { (_, instruction) ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == called
        }.reversed().forEach { (index, _) ->
            if (code.getOrNull(index + 1)?.opcode != Opcode.MOVE_RESULT_WIDE) return@forEach
            val result = code[index + 1] as? OneRegisterInstruction ?: return@forEach
            target.addInstructions(index + 2, smali(result.registerA))
            found++
        }
    }
    return found
}

/** Whether this is a call to Window.setNavigationBarContrastEnforced(boolean) or Window.setNavigationBarColor(int). */
private fun Instruction.isContrastCall(): Boolean {
    val ref = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return ref.definingClass == "Landroid/view/Window;" &&
        ref.name in setOf("setNavigationBarContrastEnforced", "setNavigationBarColor")
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

/** The static long fields of the class named in [names], in declaration order. */
private fun MutableClass.longFields(names: Set<String>) =
    fields.filter { it.name in names && it.type == "J" && AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.name }

/**
 * Inserts [smali] before every return of the static initializer, where the fields already hold their final
 * values and no register is in use. Returns false when the initializer has fewer than [registers] registers.
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

/** Smali that passes the static long field [field] of this theme through MaterialYou.[method](J)J. */
private fun MutableClass.fieldHook(field: String, method: String) = """
    sget-wide v0, $type->$field:J
    invoke-static/range { v0 .. v1 }, $EXTENSION_PACKAGE/MaterialYou;->$method(J)J
    move-result-wide v0
    sput-wide v0, $type->$field:J
"""

/**
 * Passes every wide constant of the static initializer that is one of [colors] through MaterialYou.[method](J)J.
 * Returns how many constants were found.
 */
private fun MutableClass.convertConstants(colors: Set<Long>, method: String): Int {
    val initializer = methods.first { it.name == "<clinit>" }
    val constants = initializer.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.CONST_WIDE && (instruction as WideLiteralInstruction).wideLiteral in colors
    }
    // Last first, so that the indexes of the constants before it stay valid.
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
    description = "Removes the gray gaps between posts and the dividers between list items, so the feed and the " +
        "lists read as one flat surface.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch, removeGapsResourcePatch, sharedColorsPatch)

    execute {
        var themes = 0
        composeThemes().forEach { theme ->
            if (theme.longFields(setOf(COMPOSE_SURFACE_FIELD)).isEmpty()) return@forEach
            val gaps = theme.longFields(COMPOSE_GAP_FIELDS)
            if (gaps.isEmpty()) return@forEach
            if (!theme.beforeInitializerReturns(4, theme.gapHook(gaps, "flatGap"))) {
                throw PatchException("${theme.type} has too few registers")
            }
            themes++
        }
        if (themes == 0) throw PatchException("No Compose gap tokens found")

        COMPOSE_DIVIDERS.forEach { (type, method, getter) ->
            val found = hookAfterWideResults(type, method, getter) { register ->
                """
                    invoke-static/range { v$register .. v${register + 1} }, $EXTENSION_PACKAGE/MaterialYou;->flatDivider(J)J
                    move-result-wide v$register
                """
            }
            if (found == 0) throw PatchException("No divider color in $type")
        }
        markIncluded("isRemoveGapsAndDividersIncluded")
    }
}

@Suppress("unused")
val materialYouPatch = bytecodePatch(
    name = "Material You",
    description = "Takes the colors from your wallpaper (Android 12+): the accent replaces LinkedIn blue and the " +
        "green of the selected filters, and the backgrounds, cards, bars and borders become Material 3 surfaces. " +
        "Some screens LinkedIn draws from its servers may keep their own colors.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch, materialYouResourcePatch, materialYouBackgroundsResourcePatch, sharedColorsPatch)

    execute {
        var accents = 0
        var checked = 0
        composeThemes().forEach { theme ->
            accents += theme.convertConstants(COMPOSE_ACCENTS, "accent")

            // Translucent blues (search fields, pressed states) are built from other colors, not constants.
            val translucent = theme.fields.filter { it.type == "J" && AccessFlags.STATIC.isSet(it.accessFlags) }
                .map { it.name }
            if (translucent.isNotEmpty() &&
                !theme.beforeInitializerReturns(2, translucent.joinToString("\n") { theme.fieldHook(it, "translucentAccent") })
            ) throw PatchException("${theme.type} has too few registers")

            val fields = theme.longFields(COMPOSE_CHECKED_FIELDS)
            if (fields.isEmpty()) return@forEach
            if (!theme.beforeInitializerReturns(2, fields.joinToString("\n") { theme.fieldHook(it, "checked") })) {
                throw PatchException("${theme.type} has too few registers")
            }
            checked += fields.size
        }
        if (accents == 0) throw PatchException("No Compose theme accent colors found")
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
        var surfaces = 0
        composeThemes().forEach { theme ->
            backgrounds += theme.convertConstants(COMPOSE_BACKGROUNDS, "background")

            // The surface tokens are rewritten by field, not by value: their constants (white, for one) are
            // shared with the text and icon tokens. The gaps are mapped first, while the card still has
            // LinkedIn's color, so a gap that "Remove gaps and dividers" made equal to the card gets it.
            val fields = theme.longFields(COMPOSE_GAP_FIELDS + COMPOSE_SURFACE_FIELD + COMPOSE_BORDER_FIELD)
            if (COMPOSE_SURFACE_FIELD !in fields) return@forEach
            val smali = buildString {
                // The faint border is the same translucent gray in both themes, so the theme picks the tone.
                if (COMPOSE_BORDER_FIELD in fields) {
                    append(theme.fieldHook(COMPOSE_BORDER_FIELD, if ("Dark" in theme.type) "borderDark" else "borderLight"))
                }
                appendLine(theme.gapHook(fields.filter { it in COMPOSE_GAP_FIELDS }, "canvas"))
                append(theme.fieldHook(COMPOSE_SURFACE_FIELD, "surface"))
            }
            if (!theme.beforeInitializerReturns(4, smali)) throw PatchException("${theme.type} has too few registers")
            surfaces += fields.size
        }
        if (backgrounds == 0) throw PatchException("No Compose theme background colors found")
        if (surfaces == 0) throw PatchException("No Compose surface tokens found")

        // The status and navigation bar colors ThemeManager sets: white, or the dark container.
        var bars = 0
        mutableClass(THEME_MANAGER).methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.withIndex().filter { (_, instruction) ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Landroid/view/Window;" &&
                    ref.name in setOf("setStatusBarColor", "setNavigationBarColor")
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
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.withIndex().filter { (_, instruction) ->
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

        // LinkedIn (and AndroidX's edge-to-edge) switch the navigation bar contrast on, or give the navigation
        // bar a white scrim as its color, which covers the tinted bottom bar behind the gesture bar.
        var contrasts = 0
        val callers = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.isContrastCall() } == true
                }) callers += classDef
        }
        callers.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val code = method.implementation?.instructions?.toList() ?: return@forEach
                code.withIndex().filter { (_, instruction) -> instruction.isContrastCall() }
                    .reversed()
                    .forEach { (index, instruction) ->
                        val argument = instruction.secondArgument()
                        val hook =
                            if (instruction.isNavigationBarColorCall()) "navigationBarColor(I)I" else "navigationBarContrast(Z)Z"
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
 * up to five registers, or a range once the registers go above v15.
 */
private fun Instruction.secondArgument(): Int = when (this) {
    is FiveRegisterInstruction -> registerD
    is RegisterRangeInstruction -> startRegister + 1
    else -> throw PatchException("Unexpected call $opcode")
}

/** The dark background colors of [colors], which AMOLED black turns black: containers and canvases, not the tints. */
private fun amoledColors(colors: Map<String, String>) =
    colors.keys.filter { "dark" in it && "tint" !in it }.associateWith { "black" }

@Suppress("unused")
val amoledBlackBarsPatch = resourcePatch(
    name = "AMOLED black bars",
    description = "Turns the dark top bar, bottom bar, side menu and the other screens the app draws pure black, " +
        "matching the feed that the AMOLED black setting already covers. Needs Material You.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    // Runs after Material You, which set these colors to the tinted dark surface of the wallpaper.
    dependsOn(materialYouPatch)

    execute {
        writeColorResources("values-v31", amoledColors(BACKGROUNDS))
        writeColorResources("values-v34", amoledColors(BACKGROUNDS_V34))
        val night = mapOf("color_splash_canvas_background" to "black", "color_status_bar" to "black")
        writeColorResources("values-night-v31", night)
        writeColorResources("values-night-v34", night)
    }
}
