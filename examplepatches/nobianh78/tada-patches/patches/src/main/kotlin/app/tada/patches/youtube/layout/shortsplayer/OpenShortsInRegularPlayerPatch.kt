/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.layout.shortsplayer

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.youtube.interaction.reload.reloadVideoButtonPatch
import app.tada.patches.youtube.layout.player.fullscreen.openVideosFullscreenHookPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.navigation.navigationBarHookPatch
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.hookVideoIntent
import app.tada.patches.youtube.shared.openVideoIntentPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/OpenShortsInRegularPlayerPatch;"

@Suppress("unused")
val openShortsInRegularPlayerPatch = bytecodePatch(
    name = "Open Shorts in regular player",
    description = "Adds options to open Shorts in the regular video player.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        openVideoIntentPatch,
        openVideosFullscreenHookPatch,
        reloadVideoButtonPatch,
        navigationBarHookPatch,
        versionCheckPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.SHORTS.addPreferences(
            ListPreference("tada_shorts_player_type")
        )

        hookVideoIntent(EXTENSION_CLASS, detectVideo = false, detectShorts = true)
    }
}
