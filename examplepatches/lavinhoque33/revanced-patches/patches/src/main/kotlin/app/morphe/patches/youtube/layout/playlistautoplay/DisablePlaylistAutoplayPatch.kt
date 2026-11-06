/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2628
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.layout.playlistautoplay

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.DISABLE_PLAYLIST_AUTOPLAY
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/DisablePlaylistAutoplayPatch;"

@Suppress("unused")
val disablePlaylistAutoplayPatch = bytecodePatch(
    name = DISABLE_PLAYLIST_AUTOPLAY.title,
    description = DISABLE_PLAYLIST_AUTOPLAY.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: PLAYER",
                "SETTINGS: DISABLE_PLAYLIST_AUTOPLAY",
            ),
            DISABLE_PLAYLIST_AUTOPLAY,
        )

        navigationIntentHook(EXTENSION_CLASS, "shouldSkipPlaylistAutoplay")
    }
}
