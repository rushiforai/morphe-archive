/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3471
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-12.
 *
 * modified by lavinhoque33, 2026-10-17: ported to the RVX fork (fork settings helpers, fork
 * extension/video information patches, 9.00+ gate because 8.x has no matching queue manager).
 */

package app.morphe.patches.music.misc.audiovideoswitch

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.interaction.jam.installQueueConstructorCapture
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.playservice.is_9_00_or_greater
import app.morphe.patches.music.utils.playservice.versionCheckPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.music.video.information.videoInformationPatch
import app.morphe.patches.music.video.playerresponse.Hook
import app.morphe.patches.music.video.playerresponse.addPlayerResponseMethodHook
import app.morphe.patches.music.video.playerresponse.playerResponseMethodHookPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.returnEarly
import app.morphe.patches.shared.mapping.resourceMappingPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/misc/EnableAudioVideoSwitchPatch;"
internal const val AUTO_SONG_VERSION_CLASS =
    "Lapp/morphe/extension/music/patches/misc/AutoSongVersionPatch;"

@Suppress("unused")
val enableAudioVideoSwitchPatch = bytecodePatch(
    name = "Enable audio/video switch",
    description = "Adds an option to switch between the audio and the video version of a track by redirecting videoId."
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        resourceMappingPatch,
        versionCheckPatch,
        videoInformationPatch,
        playerResponseMethodHookPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        // The queue manager this patch drives ("enqueue item, QueueTarget" diagnostics) only
        // exists from YouTube Music 9.00 on. Older targets keep the stock Song/Video toggle.
        if (!is_9_00_or_greater) {
            return@execute printWarn(
                "Enable audio/video switch requires YouTube Music 9.00 or newer. Skipping."
            )
        }

        AudioVideoSwitchPillContainerFingerprint.matchAll().forEach { match ->
            match.method.apply {
                val moveResultIndex = match.instructionMatches.last().index
                val viewRegister = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

                addInstruction(
                    moveResultIndex + 1,
                    "invoke-static { v$viewRegister }, $EXTENSION_CLASS->" +
                            "installAudioVideoSwitchInterceptor(Landroid/view/View;)V"
                )
            }
        }

        installAudioVideoSwitchQueue(resolveAudioVideoQueue())

        installQueueConstructorCapture(
            AccountPreferencesConstructorFingerprint.originalMethod,
            "$AUTO_SONG_VERSION_CLASS->setAccountPreferences(Landroid/content/SharedPreferences;)V",
        )
        mutableClassDefBy(AUTO_SONG_VERSION_CLASS).methods.single { it.name == "supported" }.returnEarly(true)

        addPlayerResponseMethodHook(
            Hook.VideoIdAndPlaylistId(
                "$AUTO_SONG_VERSION_CLASS->trackPlaylist(Ljava/lang/String;Ljava/lang/String;I)V"
            )
        )

        addSwitchPreference(
            CategoryType.PLAYER,
            "morphe_music_enable_audio_video_switch",
            "false",
            true
        )
        addSwitchPreference(
            CategoryType.PLAYER,
            "morphe_music_auto_song_version",
            "false"
        )
    }
}
