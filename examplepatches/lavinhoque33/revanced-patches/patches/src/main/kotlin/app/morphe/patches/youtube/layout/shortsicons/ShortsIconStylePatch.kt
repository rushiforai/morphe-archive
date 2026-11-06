/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-25
 */

package app.morphe.patches.youtube.layout.shortsicons

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.SHORTS_ICON_STYLE
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.ResourceGroup
import app.morphe.util.Utils.printWarn
import app.morphe.util.copyResources
import java.io.File

private const val EXTENSION_ICON_DRAWABLE_PATH = "app.morphe.extension.youtube.patches.shortsicons.ShortsIconDrawable"

private const val ORIGINAL_NAME_PREFIX = "morphe_"

private const val RESOURCE_DIRECTORY = "youtube/shortsicons"

private val styleSuffixes = listOf(
    "_fluent",
    "_phosphor",
    "_phosphor_light",
    "_phosphor_duotone",
    "_ionicons",
    "_sharp",
)

private val styledIconBaseNames = listOf(
    "morphe_shorts_heart",
    "morphe_shorts_heart_fill",
    "morphe_shorts_comment",
    "morphe_shorts_save",
    "morphe_shorts_save_fill",
    "morphe_shorts_share",
    "morphe_shorts_remix",
    "morphe_shorts_like",
    "morphe_shorts_like_fill",
    "morphe_shorts_dislike",
    "morphe_shorts_dislike_fill",
)

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
    SHORTS_ICON_STYLE.title,
    SHORTS_ICON_STYLE.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: SHORTS",
                "SETTINGS: SHORTS_ICON_STYLE",
            ),
            SHORTS_ICON_STYLE
        )

        copyResources(
            RESOURCE_DIRECTORY,
            ResourceGroup(
                "drawable",
                *styledIconBaseNames.flatMap { baseName ->
                    styleSuffixes.map { suffix -> "$baseName$suffix.xml" }
                }.toTypedArray()
            )
        )
    }

    // The icons are replaced once every other patch has executed, because Custom Shorts action buttons
    // swaps the same bitmaps and the original kept here must be the icon that patch chose.
    finalize {
        val wrapped = wrapAppBitmapIcons(shortsIcons)
        if (wrapped == 0) {
            printWarn("No Shorts action button icon found, the Shorts icon style has no effect.")
        }
    }
}

/**
 * Replaces app icons that are density specific bitmaps with a wrapper drawable.
 * A density specific bitmap wins over a default drawable, so every bitmap is removed.
 * The app can still have bitmaps this patch cannot remove, like the density splits of an installed bundle,
 * so the wrapper is also put in drawable-anydpi, which wins over every density.
 * The original bitmaps stay under a new name for the default style.
 * An icon the app does not have is left out.
 *
 * @param icons The app icon names, each with its wrapper class.
 * @return The number of icons that were replaced.
 */
private fun ResourcePatchContext.wrapAppBitmapIcons(icons: List<Pair<String, String>>): Int {
    val drawableDirectories = get("res").listFiles { file ->
        file.isDirectory && file.name.startsWith("drawable")
    }.orEmpty()

    var wrapped = 0
    icons.forEach { (appName, wrapperClass) ->
        val bitmaps = drawableDirectories.flatMap { directory ->
            listOf("png", "webp").map { extension -> File(directory, "$appName.$extension") }
        }.filter(File::exists)
        if (bitmaps.isEmpty()) return@forEach

        bitmaps.forEach { bitmap ->
            bitmap.copyTo(
                File(bitmap.parentFile, "$ORIGINAL_NAME_PREFIX$appName.${bitmap.extension}"),
                overwrite = true
            )
            bitmap.delete()
        }

        val wrapper = iconWrapper(wrapperClass)
        get("res/drawable/$appName.xml").writeText(wrapper)
        get("res/drawable-anydpi/$appName.xml").apply { parentFile.mkdirs() }.writeText(wrapper)
        wrapped++
    }
    return wrapped
}

private fun iconWrapper(wrapperClass: String) = """
    <?xml version="1.0" encoding="utf-8"?>
    <drawable xmlns:android="http://schemas.android.com/apk/res/android"
        class="$EXTENSION_ICON_DRAWABLE_PATH${'$'}$wrapperClass" />
""".trimIndent()
