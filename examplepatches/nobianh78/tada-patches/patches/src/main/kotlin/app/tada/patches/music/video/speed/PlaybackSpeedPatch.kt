/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3295
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.video.speed

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.music.video.information.musicVideoInformationPatch
import app.tada.patches.music.video.information.musicVideoTimeHook
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.noTitleUnsortedPreferenceCategory
import app.tada.patches.youtube.video.information.addExoPlayerHooks

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/PlaybackSpeedPatch;"

@Suppress("unused")
val playbackSpeedPatch = bytecodePatch(
    name = "Playback speed",
    description = "Adds options to change the playback speed and pitch of tracks.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        // Used to apply a changed speed setting while a track is playing.
        musicVideoInformationPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        PreferenceScreen.PLAYER.addPreferences(
            noTitleUnsortedPreferenceCategory(
                NonInteractivePreference(
                    key = "tada_music_playback_speed",
                    tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                    selectable = true
                ),
                SwitchPreference("tada_music_playback_speed_change_pitch")
            )
        )

        addExoPlayerHooks(EXTENSION_CLASS)

        // Apply a changed speed setting without waiting for the next track.
        musicVideoTimeHook(EXTENSION_CLASS, "setVideoTime")
    }
}
