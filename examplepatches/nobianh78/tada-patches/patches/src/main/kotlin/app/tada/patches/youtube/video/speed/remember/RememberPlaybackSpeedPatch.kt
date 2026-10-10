/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.video.speed.remember

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.InitializePlaybackSpeedValuesFingerprint
import app.tada.patches.youtube.video.information.EXTENSION_PLAYBACK_SPEED_MENU_INTERFACE
import app.tada.patches.youtube.video.information.onCreateHook
import app.tada.patches.youtube.video.information.userSelectedPlaybackSpeedHook
import app.tada.patches.youtube.video.information.videoInformationPatch
import app.tada.patches.youtube.video.speed.custom.customPlaybackSpeedPatch
import app.tada.patches.youtube.video.speed.settingsMenuVideoSpeedGroup
import app.tada.patches.youtube.video.videoid.hookPlayerResponseVideoId
import app.tada.patches.youtube.video.videoid.videoIdPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/playback/speed/RememberPlaybackSpeedPatch;"

internal val rememberPlaybackSpeedPatch = bytecodePatch {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        videoIdPatch,
        videoInformationPatch,
        customPlaybackSpeedPatch
    )

    execute {
        settingsMenuVideoSpeedGroup.addAll(
            listOf(
                ListPreference(
                    key = "tada_playback_speed_default",
                    // Entries and values are set by the extension code based on the actual speeds available.
                    entriesKey = null,
                    entryValuesKey = null,
                    tag = "app.morphe.extension.youtube.settings.preference.CustomVideoSpeedListPreference"
                ),
                ListPreference(
                    key = "tada_playback_audio_pitch_default",
                    // List is shared with video speeds.
                    entriesKey = null,
                    entryValuesKey = null,
                    tag = "app.morphe.extension.youtube.settings.preference.CustomVideoSpeedListPreference"
                ),
                SwitchPreference("tada_remember_playback_speed_last_selected", summary = true),
                SwitchPreference("tada_remember_playback_speed_last_selected_toast", summary = true),
                SwitchPreference("tada_disable_playback_speed_music", summary = true)
            )
        )

        onCreateHook(EXTENSION_CLASS, "newVideoStarted")

        userSelectedPlaybackSpeedHook(
            EXTENSION_CLASS,
            "userSelectedPlaybackSpeed",
        )

        hookPlayerResponseVideoId("$EXTENSION_CLASS->preloadMusicVideoFetch(Ljava/lang/String;Z)V")

        /*
         * Hook the code that is called when the playback speeds are initialized, and sets the playback speed
         */
        InitializePlaybackSpeedValuesFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->setDefaultPlaybackSpeed($EXTENSION_PLAYBACK_SPEED_MENU_INTERFACE)V"
        )
    }
}
