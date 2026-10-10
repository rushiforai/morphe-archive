/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.layout.hide.general

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.litho.filter.lithoFilterPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.litho.filter.addLithoFilter
import app.tada.patches.shared.misc.settings.preference.InputType
import app.tada.patches.shared.misc.settings.preference.PreferenceCategory
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference.Sorting
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.TextPreference
import app.tada.patches.youtube.ad.injectHideViewCall
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val COMMENTS_FILTER =
    "Lapp/morphe/extension/music/patches/components/CommentsFilter;"
private const val CUSTOM_FILTER =
    "Lapp/morphe/extension/music/patches/components/CustomFilter;"
private const val LAYOUT_COMPONENTS_FILTER =
    "Lapp/morphe/extension/music/patches/components/LayoutComponentsFilter;"

@Suppress("unused")
val hideLayoutComponentsPatch = bytecodePatch(
    name = "Hide layout components",
    description = "Adds options to hide general layout components."
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        lithoFilterPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        PreferenceScreen.FEED.addPreferences(
            SwitchPreference("tada_music_hide_explore_shelf"),
            SwitchPreference("tada_music_hide_grid_shelves"),
            SwitchPreference("tada_music_hide_horizontal_shelves"),
            SwitchPreference("tada_music_hide_list_shelves"),
            SwitchPreference("tada_music_hide_new_from_shelf"),
            SwitchPreference("tada_music_hide_playlist_shelves"),
            SwitchPreference("tada_music_hide_speed_dial_shelf")
        )

        PreferenceScreen.GENERAL.addPreferences(
            SwitchPreference("tada_music_hide_podcast_episode_download_button"),
            PreferenceScreenPreference(
                key = "tada_music_custom_filter_screen",
                titleKey = "tada_custom_filter_screen_title",
                summaryKey = "tada_custom_filter_screen_summary",
                sorting = Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference(
                        key = "tada_music_custom_filter",
                        titleKey = "tada_custom_filter_title"
                    ),
                    TextPreference(
                        key = "tada_music_custom_filter_strings",
                        titleKey = "tada_custom_filter_strings_title",
                        summaryKey = "tada_custom_filter_strings_summary",
                        inputType = InputType.TEXT_MULTI_LINE
                    )
                )
            )
        )

        PreferenceScreen.PLAYER.addPreferences(
            PreferenceScreenPreference(
                key = "tada_music_comments_screen",
                titleKey = "tada_music_comments_screen_title",
                summaryKey = "tada_music_comments_screen_summary",
                sorting = Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference("tada_music_hide_comments_community_guidelines"),
                    SwitchPreference("tada_music_hide_comments_context"),
                    SwitchPreference("tada_music_hide_comments_emoji_button"),
                    SwitchPreference("tada_music_hide_comments_info_button"),
                    SwitchPreference("tada_music_hide_comments_timestamp_button")
                )
            ),
            SwitchPreference("tada_music_hide_audio_video_toggle"),
            PreferenceCategory(
                titleKey = "tada_music_hide_lyrics_panel_category_title",
                preferences = setOf(
                    SwitchPreference("tada_music_hide_lyrics_share_button"),
                    SwitchPreference("tada_music_hide_lyrics_translate_button")
                )
            ),
            SwitchPreference("tada_music_hide_repeat_button"),
            SwitchPreference("tada_music_hide_shuffle_button"),
        )

        addLithoFilter(COMMENTS_FILTER)
        addLithoFilter(CUSTOM_FILTER)
        addLithoFilter(LAYOUT_COMPONENTS_FILTER)

        // region hide audio / video toggle
        AudioVideoSwitchPillContainerFingerprint.matchAll().forEach { match ->
            match.method.injectHideViewCall(
                match.instructionMatches.last().index,
                LAYOUT_COMPONENTS_FILTER,
                "hideAudioVideoToggle"
            )
        }
        // endregion

        // region hide comments info button
        InformationButtonFingerprint.let {
            it.method.apply {
                val checkCastIndex = it.instructionMatches[1].index
                val viewRegister = getInstruction<OneRegisterInstruction>(checkCastIndex).registerA

                addInstruction(
                    checkCastIndex + 1,
                    "invoke-static { v$viewRegister }, $COMMENTS_FILTER->hideCommentsInfoButton(Landroid/view/View;)V"
                )
            }
        }
        //endregion

        // region hide repeat button
        val repeatFingerprints = listOf(
            OverlayQueueLoopButtonFingerprint,
            PlaybackQueueLoopButtonFingerprint
        )

        repeatFingerprints.forEach { fingerprint ->
            fingerprint.matchAllOrNull()?.forEach { match ->
                match.method.injectHideViewCall(
                    match.instructionMatches.last().index,
                    LAYOUT_COMPONENTS_FILTER,
                    "hideRepeatButton"
                )
            }
        }
        // endregion

        // region hide shuffle button
        val shuffleFingerprints = listOf(
            OverlayQueueShuffleButtonFingerprint,
            PlaybackQueueShuffleButtonFingerprint
        )

        shuffleFingerprints.forEach { fingerprint ->
            fingerprint.matchAllOrNull()?.forEach { match ->
                match.method.injectHideViewCall(
                    match.instructionMatches.last().index,
                    LAYOUT_COMPONENTS_FILTER,
                    "hideShuffleButton"
                )
            }
        }
        // endregion
    }
}
