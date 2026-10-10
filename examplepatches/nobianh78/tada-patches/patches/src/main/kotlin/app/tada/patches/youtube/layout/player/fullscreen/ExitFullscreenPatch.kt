/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.layout.player.fullscreen

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.video.information.playerStatusHook
import app.tada.patches.youtube.video.information.videoInformationPatch

@Suppress("unused")
internal val exitFullscreenPatch = bytecodePatch(
    name = "Exit fullscreen mode",
    description = "Adds options to automatically exit fullscreen mode when a video reaches the end."
) {

    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        playerTypeHookPatch,
        videoInformationPatch
    )

    // Cannot declare as top level since this patch is in the same package as
    // other patches that declare same constant name with internal visibility.
    @Suppress("LocalVariableName")
    val EXTENSION_CLASS =
        "Lapp/morphe/extension/youtube/patches/ExitFullscreenPatch;"

    execute {
        PreferenceScreen.PLAYER.addPreferences(
            ListPreference("tada_exit_fullscreen")
        )

        playerStatusHook(EXTENSION_CLASS, "endOfVideoReached")
    }
}
