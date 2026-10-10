/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.video.voiceovertranslation

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.TextPreference
import app.tada.patches.youtube.layout.player.buttons.addPlayerBottomButton
import app.tada.patches.youtube.layout.player.buttons.playerOverlayButtonsHookPatch
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playercontrols.addLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.initializeLegacyBottomControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.video.information.videoInformationPatch
import app.tada.patches.youtube.video.information.videoTimeHook
import app.tada.patches.youtube.video.videoid.hookVideoId
import app.tada.patches.youtube.video.volume.playerVolumeHookPatch

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/voiceovertranslation/VoiceOverTranslationPatch;"

private const val EXTENSION_BUTTON =
    "Lapp/morphe/extension/youtube/videoplayer/VoiceOverTranslationButton;"

private val voiceOverTranslationResourcePatch = resourcePatch {
    dependsOn(
        legacyPlayerControlsPatch
    )

    execute {
        copyPlayerButtonIcons("voiceovertranslationbutton", "tada_yt_vot")

        addLegacyBottomControl("voiceovertranslationbutton")
    }
}

@Suppress("unused")
val voiceOverTranslationPatch = bytecodePatch(
    name = "Voice over translation",
    description = "Adds additional voice over languages using text-to-speech synchronized to the video playback.",
) {
    dependsOn(
        sharedExtensionPatch,
        videoInformationPatch,
        playerTypeHookPatch,
        playerOverlayButtonsHookPatch,
        legacyPlayerControlsPatch,
        voiceOverTranslationResourcePatch,
        playerVolumeHookPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.VIDEO.addPreferences(
            PreferenceScreenPreference(
                key = "tada_vot_screen",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference("tada_vot_enabled", summary = true),
                    ListPreference("tada_vot_caption_language"),
                    NonInteractivePreference("tada_vot_max_speech_rate",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true),
                    ListPreference("tada_vot_translation_service"),
                    NonInteractivePreference("tada_vot_openrouter_info",
                        titleKey = "tada_vot_service_openrouter",
                        tag = "app.morphe.extension.youtube.settings.preference.VoiceOverTranslationOpenRouterInfoPreference",
                        selectable = true),
                    TextPreference("tada_vot_openrouter_api_key"),
                    TextPreference("tada_vot_openrouter_model",
                        summaryKey = null,
                        tag = "app.morphe.extension.youtube.settings.preference.VoiceOverTranslationModelPreference"),
                    NonInteractivePreference("tada_vot_mymemory_info",
                        titleKey = "tada_vot_service_mymemory",
                        tag = "app.morphe.extension.youtube.settings.preference.VoiceOverTranslationMyMemoryInfoPreference",
                        selectable = true),
                    TextPreference("tada_vot_mymemory_email")
                )
            )
        )

        hookVideoId("$EXTENSION_CLASS->newVideoLoaded(Ljava/lang/String;)V")
        videoTimeHook(EXTENSION_CLASS, "videoTimeChanged")

        addPlayerBottomButton(EXTENSION_BUTTON)
        initializeLegacyBottomControl(EXTENSION_BUTTON)
    }
}
