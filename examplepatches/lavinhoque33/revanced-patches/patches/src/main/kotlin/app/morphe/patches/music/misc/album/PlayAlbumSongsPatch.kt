/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2556
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.music.misc.album

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.fix.streamingdata.spoofStreamingDataPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.music.video.playerresponse.Hook
import app.morphe.patches.music.video.playerresponse.addPlayerResponseMethodHook
import app.morphe.patches.music.video.playerresponse.playerResponseMethodHookPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/album/PlayAlbumSongsPatch;"

private const val SPOOF_VIDEO_STREAMS_KEY = "morphe_spoof_video_streams"

@Suppress("unused")
val playAlbumSongsPatch = bytecodePatch(
    name = "Play albums songs",
    description = "Adds an option to play the song version of album tracks instead of music videos."
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        playerResponseMethodHookPatch,
        // The song is played by serving its streams under the video id of the music video,
        // which is only possible while the streams are fetched by the extension.
        spoofStreamingDataPatch,
    )

    execute {
        addSwitchPreference(
            CategoryType.MISC,
            "morphe_music_play_album_songs",
            "false",
            SPOOF_VIDEO_STREAMS_KEY
        )

        addPlayerResponseMethodHook(
            Hook.VideoIdAndPlaylistId(
                "$EXTENSION_CLASS->newPlayerResponse(Ljava/lang/String;Ljava/lang/String;I)V"
            )
        )

        SharedPreferencesGetBooleanFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS->ignoreDontPlayMusicVideoSetting(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :read
                const/4 v0, 0x0
                return v0
                :read
                nop
            """
        )
    }
}
