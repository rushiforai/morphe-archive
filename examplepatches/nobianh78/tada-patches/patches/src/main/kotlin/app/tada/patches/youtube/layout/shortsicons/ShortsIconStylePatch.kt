/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3287
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.layout.shortsicons

import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.youtube.layout.player.icons.CustomIcons
import app.tada.patches.youtube.layout.player.icons.copyIconStyles
import app.tada.patches.youtube.layout.player.icons.customIconsOptionDescription
import app.tada.patches.youtube.layout.player.icons.wrapAppBitmapIcon
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

// App icon of a Shorts action button and the wrapper that takes its place.
// The yt_delhi icons are the Shorts player since 21.21, the youtube_shorts icons are the older one.
private val shortsIcons = listOf(
    "yt_delhi_heart_outline_24dp" to "DelhiHeart",
    "yt_delhi_heart_fill_white_24dp" to "DelhiHeartFill",
    "yt_delhi_comment_24dp" to "DelhiComment",
    "yt_delhi_bookmark_not_filled_24dp" to "DelhiSave",
    "yt_delhi_bookmark_filled_24dp" to "DelhiSaveFill",
    "yt_delhi_share_24dp" to "DelhiShare",
    "yt_delhi_remix_24dp" to "DelhiRemix",
    "yt_delhi_thumbs_up_not_filled_24dp" to "DelhiLike",
    "yt_delhi_thumbs_up_filled_24dp" to "DelhiLikeFill",
    "yt_delhi_thumbs_down_not_filled_24dp" to "DelhiDislike",
    "yt_delhi_thumbs_down_filled_24dp" to "DelhiDislikeFill",
    "youtube_shorts_heart_outline_32dp" to "ShortsHeart",
    "youtube_shorts_heart_fill_32dp" to "ShortsHeartFill",
    "youtube_shorts_heart_off_32dp" to "ShortsHeartOff",
    "youtube_shorts_comment_outline_32dp" to "ShortsComment",
    "youtube_shorts_save_outline_32dp" to "ShortsSave",
    "youtube_shorts_save_fill_32dp" to "ShortsSaveFill",
    "youtube_shorts_share_outline_32dp" to "ShortsShare",
    "youtube_shorts_remix_outline_32dp" to "ShortsRemix",
    "youtube_shorts_like_outline_32dp" to "ShortsLike",
    "youtube_shorts_like_fill_32dp" to "ShortsLikeFill",
    "youtube_shorts_dislike_outline_32dp" to "ShortsDislike",
    "youtube_shorts_dislike_fill_32dp" to "ShortsDislikeFill",
)

@Suppress("unused")
val shortsIconStylePatch = resourcePatch(
    name = "Shorts icon style",
    description = "Adds an option to change the style of the Shorts action button icons.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    val customIcons by filePathOption(
        key = "customIcons",
        title = "Custom icons",
        description = customIconsOptionDescription("tada_shorts_heart.xml"),
        allowedExtensions = listOf("zip"),
    )

    var custom: CustomIcons? = null

    execute {
        custom = customIcons?.takeIf { it.isNotBlank() }?.let(::CustomIcons)

        PreferenceScreen.SHORTS.addPreferences(
            if (custom == null) {
                ListPreference(
                    key = "tada_shorts_icon_style",
                    tag = "app.morphe.extension.youtube.settings.preference.PlayerIconStyleListPreference"
                )
            } else {
                ListPreference(
                    key = "tada_shorts_icon_style",
                    tag = "app.morphe.extension.youtube.settings.preference.PlayerIconStyleListPreference",
                    entriesKey = "tada_shorts_icon_style_custom_entries",
                    entryValuesKey = "tada_shorts_icon_style_custom_entry_values"
                )
            }
        )

        copyIconStyles(
            "shortsicons",
            arrayOf(
                "tada_shorts_heart",
                "tada_shorts_heart_fill",
                "tada_shorts_comment",
                "tada_shorts_save",
                "tada_shorts_save_fill",
                "tada_shorts_share",
                "tada_shorts_remix",
                "tada_shorts_like",
                "tada_shorts_like_fill",
                "tada_shorts_dislike",
                "tada_shorts_dislike_fill"
            ),
            custom
        )

        // The buttons are Litho components that load these by resource id, so the resource itself is replaced.
        // The original is kept under a new name for the default style.
        shortsIcons.forEach { (appName, wrapperClass) ->
            wrapAppBitmapIcon(appName, wrapperClass, originalName = "tada_$appName")
        }
    }

    finalize {
        custom?.warnUnused()
    }
}
