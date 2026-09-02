/*
 * Copyright 2026 Dual VoT Patches contributors.
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.patches.youtube.video.voiceovertranslation

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.misc.settings.preference.ListPreference
import app.morphe.patches.shared.misc.settings.preference.NonInteractivePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.shared.misc.settings.preference.TextPreference
import app.morphe.patches.youtube.layout.player.buttons.addPlayerBottomButton
import app.morphe.patches.youtube.layout.player.buttons.playerOverlayButtonsHookPatch
import app.morphe.patches.youtube.misc.extension.sharedExtensionPatch
import app.morphe.patches.youtube.misc.playercontrols.addLegacyBottomControl
import app.morphe.patches.youtube.misc.playercontrols.initializeLegacyBottomControl
import app.morphe.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.morphe.patches.youtube.misc.settings.PreferenceScreen
import app.morphe.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources

private const val YANDEX_BUTTON =
    "Lapp/morphe/extension/youtube/videoplayer/YandexVoiceOverTranslationButton;"

private val yandexVoiceOverTranslationResourcePatch = resourcePatch {
    dependsOn(legacyPlayerControlsPatch)

    execute {
        copyResources(
            "yandexvoiceovertranslationbutton",
            ResourceGroup(
                "drawable",
                "dualvot_yt_yandex_vot.xml",
                "dualvot_yt_yandex_vot_bold.xml",
            )
        )

        addLegacyBottomControl("yandexvoiceovertranslationbutton")
    }
}

/**
 * Adds the Yandex-specific controls. It depends on the official Morphe VoT
 * patch because that patch owns the shared playback coordinator and lifecycle
 * hooks; applying this option therefore always produces the dual-engine UI.
 */
@Suppress("unused")
val yandexVoiceOverTranslationPatch = bytecodePatch(
    name = "Yandex voice-over translation",
    description = "Adds a separate Yandex translation button alongside Morphe voice-over translation.",
) {
    dependsOn(
        voiceOverTranslationPatch,
        sharedExtensionPatch,
        playerOverlayButtonsHookPatch,
        legacyPlayerControlsPatch,
        yandexVoiceOverTranslationResourcePatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.VIDEO.addPreferences(
            PreferenceScreenPreference(
                key = "dualvot_yandex_screen",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference("dualvot_yandex_enabled"),
                    ListPreference(
                        key = "dualvot_yandex_timer_position",
                        entriesKey = "dualvot_yandex_timer_position_entries",
                        entryValuesKey = "dualvot_yandex_timer_position_entry_values",
                    ),
                    SwitchPreference("dualvot_yandex_progress_ring_enabled"),
                    NonInteractivePreference(
                        key = "dualvot_yandex_progress_ring_color",
                        tag = "app.morphe.extension.shared.settings.preference.ColorPickerPreference",
                        selectable = true,
                    ),
                    NonInteractivePreference(
                        key = "dualvot_yandex_progress_ring_thickness",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true,
                    ),
                    ListPreference(
                        key = "dualvot_yandex_source_language",
                        entriesKey = "dualvot_yandex_source_language_entries",
                        entryValuesKey = "dualvot_yandex_source_language_entry_values",
                    ),
                    ListPreference(
                        key = "dualvot_yandex_target_language",
                        entriesKey = "dualvot_yandex_target_language_entries",
                        entryValuesKey = "dualvot_yandex_target_language_entry_values",
                    ),
                    NonInteractivePreference(
                        key = "dualvot_yandex_translation_volume",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true,
                    ),
                    NonInteractivePreference(
                        key = "dualvot_yandex_original_audio_volume",
                        tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
                        selectable = true,
                    ),
                    SwitchPreference("dualvot_yandex_use_live_voices"),
                    NonInteractivePreference(
                        key = "dualvot_yandex_oauth_token",
                        tag = "app.morphe.extension.youtube.settings.preference.YandexVotOAuthPreference",
                        selectable = true,
                    ),
                    SwitchPreference(
                        key = "dualvot_yandex_audio_proxy_enabled",
                        titleKey = "dualvot_yandex_audio_proxy_title",
                    ),
                    TextPreference("dualvot_yandex_proxy_url"),
                    NonInteractivePreference("dualvot_yandex_credits"),
                )
            )
        )

        addPlayerBottomButton(YANDEX_BUTTON)
        initializeLegacyBottomControl(YANDEX_BUTTON)
    }
}
