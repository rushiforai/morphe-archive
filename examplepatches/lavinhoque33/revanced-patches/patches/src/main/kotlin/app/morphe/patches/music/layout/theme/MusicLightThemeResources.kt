/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.patches.music.layout.theme

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceType
import app.morphe.util.asSequence
import app.morphe.util.childElementsSequence
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val LIGHT_QUALIFIER = "mcc816"
private const val SURFACE = "#FFF8F9FA"
private const val RAISED = "#FFFFFFFF"
private const val CONTROL_SURFACE = "#FFF1F3F4"
private const val FOREGROUND = "#FF0F0F0F"
private const val SECONDARY = "#FF41464C"
private const val MUTED = "#FF5F6368"
private const val ACCENT = "#FF065FD4"
private const val RIPPLE = "#1F000000"
private const val DIVIDER = "#290F0F0F"
private const val NATIVE_LIGHT_THEME = "@style/Themed.YouTube.Light.AppCompat.Light"
private const val STOCK_BACK = "@drawable/yt_outline_arrow_left_white_24"
private const val THEMED_BACK = "@drawable/yt_outline_arrow_left_vd_theme_24"

// Some native consumers (including WatchFragment) ask for a color resource ID, not an ARGB
// value. Keep style color items as references so both resource-ID and color lookups work.
private val lightStyleColors = mapOf(
    SURFACE to "morphe_music_light_surface",
    RAISED to "morphe_music_light_raised",
    CONTROL_SURFACE to "morphe_music_light_control_surface",
    FOREGROUND to "morphe_music_light_foreground",
    SECONDARY to "morphe_music_light_secondary",
    MUTED to "morphe_music_light_muted",
    ACCENT to "morphe_music_light_accent",
    RIPPLE to "morphe_music_light_ripple",
)

// Keep literal Music whites/blacks and translucent overlay text intact: they're also used over media.
private val lightColorRoles = mapOf(
    "theme_main_window_background" to SURFACE,
    // Native header setters and the live Search song rows read these colors directly.
    "black_header_color" to SURFACE,
    "ytm_theme_main_color_dark" to SURFACE,
    "general_background_black4" to SURFACE,
    "ytm_text_color_primary" to FOREGROUND,
    "ytm_text_color_secondary" to SECONDARY,
    "ytm_text_color_tertiary" to MUTED,
    "ytm_text_color_active" to ACCENT,
)

private val lightControls = listOf(
    "android:colorForeground" to FOREGROUND,
    "android:colorAccent" to ACCENT,
    "android:colorControlNormal" to FOREGROUND,
    "android:colorControlActivated" to ACCENT,
    "android:colorControlHighlight" to RIPPLE,
    "colorAccent" to ACCENT,
    "colorControlNormal" to FOREGROUND,
    "colorControlActivated" to ACCENT,
    "colorControlHighlight" to RIPPLE,
    "colorSwitchThumbNormal" to MUTED,
)

private val lightWindow = listOf(
    "android:colorBackground" to SURFACE,
    "android:statusBarColor" to SURFACE,
    "android:navigationBarColor" to SURFACE,
    "android:windowLightStatusBar" to "true",
    "android:windowLightNavigationBar" to "true",
    "colorPrimary" to SURFACE,
    "colorPrimaryDark" to SURFACE,
    "colorPrimaryAlternate" to FOREGROUND,
    "colorBackgroundFloating" to RAISED,
    "colorOnSurface" to FOREGROUND,
)

private val lightYouTubeRoles = listOf(
    "ytBaseBackground" to SURFACE,
    "ytBrandBackgroundPrimary" to SURFACE,
    "ytBrandBackgroundSecondary" to RAISED,
    "ytBrandBackgroundSolid" to SURFACE,
    "ytGeneralBackgroundA" to RAISED,
    "ytGeneralBackgroundB" to SURFACE,
    "ytGeneralBackgroundC" to SURFACE,
    "ytRaisedBackground" to RAISED,
    "ytMenuBackground" to RAISED,
    "ytPivotBarBackground" to SURFACE,
    "ytStatusBarBackground" to SURFACE,
    "ytChipBackground" to CONTROL_SURFACE,
    "ytBadgeChipBackground" to CONTROL_SURFACE,
    "yt10PercentLayer" to RIPPLE,
    "ytVerifiedBadgeBackground" to CONTROL_SURFACE,
    "ytTextPrimary" to FOREGROUND,
    "ytTextSecondary" to SECONDARY,
    "ytHeaderIcon" to FOREGROUND,
    "ytIconActiveOther" to FOREGROUND,
    "ytIconInactive" to SECONDARY,
    "ytBrandIconInactive" to SECONDARY,
    // The stock light ancestor otherwise substitutes a lighter value for this static media role.
    "ytStaticDarkBackground1" to "@color/yt_static_dark_background_1_dark",
)

private val lightText = listOf(
    "android:textColorPrimary" to "@color/ytm_text_color_primary",
    "android:textColorSecondary" to "@color/ytm_text_color_secondary",
    "android:textColorTertiary" to "@color/ytm_text_color_tertiary",
    "android:textColorLink" to "@color/ytm_text_color_active",
)

private val lightSnackbar = listOf(
    "musicSnackbarBackgroundColor" to RAISED,
    "musicSnackbarTextColor" to FOREGROUND,
    "musicSnackbarActionColor" to ACCENT,
)

internal fun ResourcePatchContext.addMusicLightThemeResources() {
    addLightColors()
    addLightStyles()
    addLightChrome()
    addLightBrowseChrome()
    addLightSearch()
    addLightSheets()
    addLightDrawables()
}

private fun ResourcePatchContext.addLightColors() {
    document("res/values/colors.xml").use { output ->
        lightStyleColors.forEach { (color, name) ->
            output.appendResourceItem(output.documentElement, "color", name, color)
        }
    }

    val path = "res/values-$LIGHT_QUALIFIER/colors.xml"
    prepareValuesFile(path)

    document(path).use { output ->
        // Qualified-only definitions can override existing ARSC IDs, but cannot declare new IDs.
        lightColorRoles.forEach { (name, color) ->
            if (resourceIds.has(ResourceType.COLOR, name)) {
                output.appendResourceItem(output.documentElement, "color", name, color)
            }
        }
    }
}

private fun ResourcePatchContext.addLightStyles() {
    val path = "res/values-$LIGHT_QUALIFIER/styles.xml"
    prepareValuesFile(path)

    document("res/values/styles.xml").use { stock ->
        val stockStyles = stock.documentElement.childElementsSequence()
            .filter { it.tagName == "style" }
            .associateBy { it.getAttribute("name") }

        document(path).use { output ->
            fun style(name: String, items: List<Pair<String, String>>, parent: String? = null) {
                val original = stockStyles[name] ?: return
                val copy = output.importNode(original, true) as Element
                val originalItems = copy.childElementsSequence().associateBy { it.getAttribute("name") }

                parent?.let { copy.setAttribute("parent", it) }
                items.forEach { (attribute, value) ->
                    val styleValue = if (value.startsWith('#')) {
                        "@color/${lightStyleColors.getValue(value)}"
                    } else {
                        value
                    }
                    val item = originalItems[attribute]
                    if (item != null) {
                        item.textContent = styleValue
                    } else if (attribute.startsWith("android:") || resourceIds.has(ResourceType.ATTR, attribute)) {
                        output.appendResourceItem(copy, "item", attribute, styleValue)
                    }
                }
                output.documentElement.appendChild(copy)
            }

            // This ancestor already supplies Light AppCompat, including the stock light YouTube color
            // and typography chain on newer versions. Restore the NoActionBar flags from the old parent.
            val noActionBar = listOf("windowActionBar" to "false", "windowNoTitle" to "true")
            style(
                "Base.Theme.YouTubeMusic",
                noActionBar + lightWindow + lightControls + lightText + lightYouTubeRoles + listOf(
                    "ytErrorBackground" to "?ytInvertedBackground",
                    "ytSnackbarBackground" to "?ytInvertedBackground",
                ),
                NATIVE_LIGHT_THEME,
            )
            style("Theme.YouTubeMusic", listOf("colorControlNormal" to FOREGROUND))
            style(
                "Theme.YouTubeMusic.NoActionBar",
                lightSnackbar + listOf(
                    "android:homeAsUpIndicator" to THEMED_BACK,
                    "homeAsUpIndicator" to THEMED_BACK,
                    "colorPrimary" to SURFACE,
                    "tabHeaderColor" to SURFACE,
                    "loadingFrameTextColor" to FOREGROUND,
                ),
            )

            // Stock Settings already inherits AppCompat Light; keep its preference/list style wiring.
            // Its Light YouTube ancestor also supplies the attrs used by legacy RVX widgets.
            style(
                "Theme.YouTubeMusic.Settings.Compat.Base",
                noActionBar + lightWindow + lightControls + lightText + lightYouTubeRoles + lightSnackbar + listOf(
                    "android:windowBackground" to SURFACE,
                    "homeAsUpIndicator" to THEMED_BACK,
                ),
                NATIVE_LIGHT_THEME,
            )
            style("PreferenceThemeOverlay.Settings", listOf("android:textColor" to "?android:textColorPrimary"))
            style("Widget.YouTubeMusic.Toolbar", listOf("android:textColor" to FOREGROUND))
            style("Theme.YouTubeMusic.Toolbar.TitleText", listOf("android:textColor" to FOREGROUND))
            style("TextAppearance.YouTubeMusic.SearchInput", listOf("android:textColorHint" to MUTED))

            val raisedWindow = listOf("android:windowBackground" to RAISED)
            style("Theme.YouTubeMusic.Dialog.Solid", raisedWindow)
            style("Theme.YouTubeMusic.FullscreenDialog.Solid", raisedWindow)
            style(
                "Theme.YouTubeMusic.MediaRouter",
                lightControls + listOf("colorBackgroundFloating" to RAISED),
                "@style/Theme.MediaRouter.Light",
            )
            style(
                "AccountSwitcherYtMusic",
                lightWindow + lightControls + listOf("android:windowBackground" to SURFACE),
                "@style/Theme.AppCompat.Light",
            )
            style("PositiveButtonStyle", listOf("android:textColor" to ACCENT))
            style("NegativeButtonStyle", listOf("android:textColor" to ACCENT))
        }
    }
}

private fun ResourcePatchContext.addLightChrome() {
    listOf("preference_activity", "two_pane_preference_activity", "browser_activity").forEach { name ->
        lightXml("layout", name) { view ->
            view.replaceAttribute("android:background", "@color/ytm_color_white_at_20pct", DIVIDER)
            if (view.resourceId() == "@id/toolbar") {
                view.replaceAttribute("android:background", "@color/ytm_theme_main_color_dark", SURFACE)
                // The Settings layout references a white PNG directly, bypassing the theme's up indicator.
                view.attributes.named("navigationIcon").forEach {
                    if (it.nodeValue == STOCK_BACK) it.nodeValue = THEMED_BACK
                }
            }
        }
    }

    lightXml("layout", "avatar_menu") { view ->
        view.replaceAttribute("android:background", "@color/black_header_color", SURFACE)
        view.replaceAttribute("android:background", "@color/ytm_color_black", SURFACE)
        view.replaceAttribute("android:background", "@color/ytm_color_white_at_10pct", DIVIDER)
        if (view.resourceId() == "@id/upgrade_unlimited_button") {
            view.replaceAttribute("android:textColor", "?android:textColorPrimary", RAISED)
            view.replaceAttribute("android:textColor", "?android:attr/textColorPrimary", RAISED)
        }
    }

    lightXml("layout", "main_activity_launch_animation") { view ->
        // The separate launch animation keeps its stock background and artwork.
        view.replaceAttribute("android:background", "?attr/musicBackgroundColor", "@color/ytm_color_black")
        view.replaceAttribute("android:background", "?musicBackgroundColor", "@color/ytm_color_black")
    }
}

private fun ResourcePatchContext.addLightBrowseChrome() {
    lightXml("layout", "top_bar_menu_item") { view ->
        if (view.resourceId() == "@id/top_bar_menu_item_image_view") {
            // The notification presenter tints its drawable before assigning it to this ImageView.
            view.setAttribute("android:tint", FOREGROUND)
        }
    }
    lightXml("layout", "library_browse_fragment") { view ->
        if (view.resourceId() == "@id/header_container") {
            view.setAttribute("android:tag", "morphe_light_library_chip_header")
        }
    }
    lightXml("layout", "music_two_row_item") { view ->
        if (view.resourceId() == "@id/title") {
            view.replaceAttribute("android:textColor", "@color/ytm_color_white", FOREGROUND)
        }
    }
    listOf("message_item", "message_item_horizontal").forEach { name ->
        lightXml("layout", name) { view ->
            val secondary = "@color/ytm_text_color_secondary"
            when (view.resourceId()) {
                "@id/message_icon" -> {
                    view.attributes.named("tint").forEach { it.nodeValue = secondary }
                    view.setAttribute("android:tint", secondary)
                }
                "@id/message_text", "@id/simple_header_message_text" ->
                    view.setAttribute("android:textColor", secondary)
                "@id/message_subtext" ->
                    view.setAttribute("android:textColor", "@color/ytm_text_color_tertiary")
            }
        }
    }
}

private fun ResourcePatchContext.addLightSearch() {
    listOf("search_input_fragment", "search_result_fragment", "playlist_filter_search_input_fragment").forEach { name ->
        lightXml("layout", name) { view ->
            view.replaceAttribute("android:background", "@color/ytm_color_black", SURFACE)
            if (view.resourceId() == "@id/search_clear") view.tintSearchGlyph()
        }
    }

    listOf("search_toolbar_view", "search_toolbar_view_v2").forEach { name ->
        lightXml("layout", name) { view ->
            when (view.resourceId()) {
                "@id/toolbar_back_navigation", "@id/toolbar_search_logo", "@id/search_clear",
                "@id/voice_search", "@id/sound_search" -> view.tintSearchGlyph()
            }
        }
    }
    lightXml("layout", "search_button") { view ->
        if (view.resourceId() == "@id/action_search_button") view.tintSearchGlyph()
    }
    lightXml("layout", "search_suggestion_entry") { view ->
        if (view.resourceId() in listOf("@id/search_type_icon", "@id/edit_suggestion")) view.tintSearchGlyph()
    }
    lightXml("layout", "search_suggestions_section_header") { view ->
        view.replaceAttribute("android:textColor", "@color/ytm_color_grey_06", SECONDARY)
    }
    lightXml("layout", "music_two_column_item") { view ->
        when (view.resourceId()) {
            "@id/contextual_menu_anchor", "@id/drag_handle_indicator" -> view.tintSearchGlyph()
            "@id/title" -> view.replaceAttribute("android:textColor", "@color/ytm_color_white", FOREGROUND)
            "@id/subtitle" -> view.setAttribute("android:textColor", SECONDARY)
        }
    }
    lightXml("layout", "chip_cloud_chip") { view ->
        if (view.resourceId() == "@id/chip_cloud_chip_text") {
            view.replaceAttribute("android:textColor", "@color/ytm_color_white", FOREGROUND)
        }
    }
}

private fun ResourcePatchContext.addLightSheets() {
    lightFill("context_menu_background", "@color/ytm_theme_main_color_primary", RAISED)
    lightXml("layout", "music_menu_item") { view ->
        // Tint the row glyph, not its media thumbnail.
        if (view.resourceId() == "@id/icon") view.setAttribute("android:tint", FOREGROUND)
    }

    listOf("comment_dialog", "comment_dialog_with_dismiss_button").forEach { name ->
        lightXml("layout", name) { view ->
            when (view.resourceId()) {
                "@id/comment_dialog_wrapper" -> view.setAttribute("android:background", RAISED)
                "@id/comment_dialog_root" -> {
                    if (name == "comment_dialog") view.setAttribute("android:background", RAISED)
                }
                "@id/comment" -> {
                    view.setAttribute("android:textColor", FOREGROUND)
                    view.setAttribute("android:textColorHint", MUTED)
                }
            }
        }
    }
}

private fun ResourcePatchContext.addLightDrawables() {
    lightFill("splash_screen", "@color/ytm_theme_main_color_dark", SURFACE)
    lightFill("search_query_background", "@color/ytm_color_white_at_10pct", CONTROL_SURFACE)
    lightFill("action_button_background", "@color/ytm_color_white_at_10pct", CONTROL_SURFACE)
    lightFill("chip_cloud_chip_translucent_background", "@color/yt_white1_opacity10", CONTROL_SURFACE)
    lightFill("clear_search_chip_background_rectangular", "@color/ytm_color_white", CONTROL_SURFACE)
    listOf("dialog_background", "popup_window_background").forEach { name ->
        lightXml("drawable", name) { element ->
            when (element.tagName) {
                "solid" -> element.replaceAttribute("android:color", "@color/ytm_theme_main_color_primary", RAISED)
                "stroke" -> element.replaceAttribute("android:color", "@color/ytm_color_divider", DIVIDER)
            }
        }
    }
}

private fun ResourcePatchContext.lightFill(name: String, stock: String, light: String) =
    lightXml("drawable", name) { element ->
        if (element.tagName == "solid" || element.tagName == "stroke") {
            element.replaceAttribute("android:color", stock, light)
        }
    }

private fun ResourcePatchContext.lightXml(type: String, name: String, edit: (Element) -> Unit) {
    // All current targets use an unqualified entry for these files. Preserve any stock file qualifier
    // if present, so this override cannot replace a more specific layout in Light.
    listDecodableFiles("res/$type*/$name.xml").forEach { path ->
        val source = get(path)
        val qualifier = source.parentFile.name.removePrefix(type)
        val target = "res/$type-$LIGHT_QUALIFIER$qualifier/$name.xml"
        source.copyTo(get(target), overwrite = true)

        document(target).use { copy ->
            copy.getElementsByTagName("*").asSequence().filterIsInstance<Element>().forEach(edit)
        }
    }
}

private fun ResourcePatchContext.prepareValuesFile(path: String) {
    get(path).apply {
        parentFile.mkdirs()
        writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?><resources />")
    }
}

private fun Document.appendResourceItem(parent: Element, tag: String, name: String, value: String) {
    parent.appendChild(createElement(tag).apply {
        setAttribute("name", name)
        textContent = value
    })
}

private fun Element.resourceId() = getAttribute("android:id")

private fun Element.replaceAttribute(attribute: String, old: String, value: String) {
    if (getAttribute(attribute) == old) setAttribute(attribute, value)
}

private fun Element.tintSearchGlyph() {
    attributes.named("tint").forEach { it.nodeValue = FOREGROUND }
    setAttribute("android:tint", FOREGROUND)
}

private fun org.w3c.dom.NamedNodeMap.named(name: String) =
    (0 until length).asSequence().map(::item).filter { it.nodeName.substringAfter(':') == name }
