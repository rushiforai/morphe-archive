package app.jaybyte.patches.ifunny.theme

import app.jaybyte.patches.ifunny.shared.Constants.COMPATIBILITY_IFUNNY
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

/** Android 14+: iFunny semantic color tokens -> Material 3 dark role colors. */
private val M3_TOKENS = mapOf(
    "surface_primary" to "system_surface_container_dark",
    "surface_secondary" to "system_surface_container_high_dark",
    "surface_disabled" to "system_surface_container_highest_dark",
    "surface_bg_inverted" to "system_on_surface_dark",
    "text_icons_primary" to "system_on_surface_dark",
    "text_icons_secondary" to "system_on_surface_variant_dark",
    "text_icons_tertiary" to "system_outline_dark",
    "text_icons_quaternary" to "system_outline_dark",
    "text_icons_quinary" to "system_neutral2_500",
    "text_icons_inverted" to "system_surface_container_dark",
    "stroke_primary" to "system_on_surface_dark",
    "stroke_secondary" to "system_on_surface_variant_dark",
    "stroke_tertiary" to "system_outline_dark",
    "stroke_quaternary" to "system_neutral2_500",
    "stroke_quinary" to "system_outline_variant_dark",
    "stroke_septenary" to "system_surface_container_high_dark",
    "stroke_hexagonal" to "system_surface_container_highest_dark",
    "stroke_inverted" to "system_surface_container_dark",
    "accent_primary" to "system_primary_dark",
    "accent_secondary" to "system_accent3_400",
    "reaction_like" to "system_primary_dark",
    "action_primary_normal" to "system_primary_dark",
    "action_primary_foreground" to "system_on_primary_dark",
    "action_primary_normal_inactive" to "system_primary_container_dark",
    "action_primary_foreground_inactive" to "system_on_primary_container_dark",
    "action_info_normal" to "system_tertiary_container_dark",
    "action_info_foreground" to "system_on_tertiary_container_dark",
    "action_info_normal_inactive" to "system_surface_container_highest_dark",
    "action_accent_secondary_normal" to "system_tertiary_container_dark",
    "action_accent_secondary_foreground" to "system_on_tertiary_container_dark",
    "action_accent_secondary_normal_inactive" to "system_surface_container_highest_dark",
    "action_secondary_normal" to "system_secondary_container_dark",
    "action_secondary_foreground" to "system_on_secondary_container_dark",
    "action_secondary_normal_inactive" to "system_surface_container_highest_dark",
    "action_tertiary_normal" to "system_surface_container_high_dark",
    "action_tertiary_normal_inactive" to "system_surface_container_dark",
    "action_neutral_normal" to "system_neutral1_100",
    "action_neutral_normal_inactive" to "system_neutral2_500",
    "action_inverted_neutral_normal" to "system_surface_container_low_dark",
    "action_inverted_neutral_normal_inactive" to "system_surface_container_low_dark",
    "disabled_normal" to "system_surface_container_highest_dark",
    "disabled_foreground" to "system_neutral2_500",
)

/** Android 12+: raw palette -> nearest-lightness Material You tonal palette step. */
private val TONAL_PALETTE = mapOf(
    "blue_50" to "system_accent3_50", "blue_100" to "system_accent3_100", "blue_200" to "system_accent3_100",
    "blue_300" to "system_accent3_200", "blue_400" to "system_accent3_300", "blue_500" to "system_accent3_400",
    "blue_600" to "system_accent3_500", "blue_700" to "system_accent3_600", "blue_800" to "system_accent3_700",
    "blue_900" to "system_accent3_700", "blue_950" to "system_accent3_800",
    "gray_50" to "system_neutral1_10", "gray_100" to "system_neutral1_50", "gray_150" to "system_neutral1_100",
    "gray_200" to "system_neutral1_100", "gray_250" to "system_neutral1_200", "gray_300" to "system_neutral1_400",
    "gray_350" to "system_neutral1_500", "gray_400" to "system_neutral1_600", "gray_500" to "system_neutral1_600",
    "gray_600" to "system_neutral1_700", "gray_700" to "system_neutral1_800", "gray_800" to "system_neutral1_900",
    "gray_900" to "system_neutral1_900", "gray_950" to "system_neutral1_1000",
    "yellow_50" to "system_accent1_10", "yellow_100" to "system_accent1_10", "yellow_200" to "system_accent1_50",
    "yellow_300" to "system_accent1_100", "yellow_400" to "system_accent1_100", "yellow_500" to "system_accent1_200",
    "yellow_600" to "system_accent1_300", "yellow_700" to "system_accent1_500", "yellow_800" to "system_accent1_600",
    "yellow_900" to "system_accent1_700", "yellow_950" to "system_accent1_800",
)

/** Layouts that colour text/icons with a *surface* token, which is unreadable once surfaces are tinted. */
private val SURFACE_AS_TEXT_LAYOUTS = listOf(
    "activity_fullscreen_notification_collage", "activity_fullscreen_popup_notification",
    "activity_fullscreen_snackbar_notification", "explore_two_search", "invite_dialog", "meme_summary",
    "new_map_panel_anon_user", "popup_location_request", "profile_details_layout", "resend_meme_dialog",
    "toolbar_chat_screen", "user_cluster_map_panel_content",
)

@Suppress("unused")
val materialYouThemePatch = patch(
    name = "Material You theme",
    description = "Recolors iFunny with your wallpaper-based Material You (dynamic) colors on Android 12+, " +
        "and fixes low-contrast date / view-count text.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    val amoled by booleanOption(
        key = "amoled",
        default = true,
        title = "AMOLED black",
        description = "Use a pure black background. Cards and toolbars keep a subtle Material You tint.",
    )

    execute {
        resourceXml("res/values-v34/colors.xml", copy = false).use { colors ->
            val tokens = M3_TOKENS.mapValues { "@android:color/${it.value}" } + if (amoled == true) mapOf(
                "surface_bg" to "#ff000000",
                "surface_surface" to "@android:color/system_surface_container_lowest_dark",
            ) else mapOf(
                "surface_bg" to "@android:color/system_background_dark",
                "surface_surface" to "@android:color/system_surface_container_low_dark",
            )
            tokens.forEach { (name, value) ->
                colors.root.appendChild("color") {
                    setAttribute("name", name)
                    text = value
                }
            }
        }

        resourceXml("res/values-v31/colors.xml", copy = false).use { colors ->
            TONAL_PALETTE.forEach { (name, value) ->
                colors.root.appendChild("color") {
                    setAttribute("name", name)
                    text = "@android:color/$value"
                }
            }
        }

        SURFACE_AS_TEXT_LAYOUTS.forEach { layout ->
            resourceXml("res/layout/$layout.xml").use { xml ->
                xml.elements().forEach { element ->
                    listOf("android:textColor", "android:tint").forEach { attr ->
                        if (element.attribute(attr) == "@color/surface_disabled") {
                            element.setAttribute(attr, "@color/text_icons_tertiary")
                        }
                    }
                }
            }
        }
    }
}
