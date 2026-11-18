package io.github.henr1klmb.patches.dbnavigator

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml

private val darkBackgroundColors = setOf(
    "greyBackground",
    "lightBackground",
    "lightBackgroundDisabled",
    "lightBackgroundDisabledWithoutAlpha",
    "map_background",
    "contextualBottomSheetBackgroundColorExpand",
    "contextualItemBackground",
    "mapsMarkerIconBackgroundColor",
    "notizenGrayBackground",
    "reiseBenachrichtigungenTimeGoxBackgroundColor",
    "reiseloesungAngebotInfoBackground",
    "spinnerItemBackground",
    "verbindungsdetailsGreyBackground",
    "verbindungsdetailsGreyWalkway",
    "wagenreihungAttributeListBackground",
    "wagenreihungPagerBackground",
    "wagenreihungSidescrollBackground",
    "widgetButtonBackground",
    "akamaiCCAcolorDialogBackground",
    "akamaiCCAcolorProgressBackground",
    "timepickerBackgroundColorDeactivated",
    "publicTransportTicketingBannerBackground",
    "cardview_dark_background",
    "background_material_dark",
    "design_dark_default_color_background",
    "design_dark_default_color_surface",
)

private const val PURE_BLACK = "#FF000000"

@Suppress("unused", "DEPRECATION")
val amoledDarkModePatch = resourcePatch(
    name = "AMOLED dark mode",
    description = "Replaces dark background colors in night mode with pure black (#FF000000).",
) {
    compatibleWith(DB_NAVIGATOR_COMPATIBILITY)

    execute {
        resourceXml("res/values-night/colors.xml").use { colors ->
            darkBackgroundColors.forEach { colorName ->
                val element = colors.resourceOrNull(colorName)
                if (element != null) {
                    element.text = PURE_BLACK
                } else {
                    colors.root.appendChild("color") {
                        setAttribute("name", colorName)
                        text = PURE_BLACK
                    }
                }
            }
        }
    }
}
