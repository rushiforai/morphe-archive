/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.layout.buttons.action

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.fix.proto.fixProtoLibraryPatch
import app.tada.patches.shared.misc.litho.filter.addLithoFilter
import app.tada.patches.shared.misc.litho.node.hookTreeNodeResult
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.PreferenceCategory
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.fix.videoactionbar.restoreOldVideoActionBarPatch
import app.tada.patches.youtube.misc.litho.filter.lithoFilterPatch
import app.tada.patches.youtube.misc.litho.node.treeNodeElementHookPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.WatchNextResponseParserFingerprint
import app.tada.patches.youtube.video.information.videoInformationPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val VIDEO_ACTION_FILTER =
    "Lapp/morphe/extension/youtube/patches/components/VideoActionButtonsFilter;"
private const val QUICK_ACTIONS_FILTER =
    "Lapp/morphe/extension/youtube/patches/components/QuickActionButtonsFilter;"

@Suppress("unused")
val hideVideoActionButtonsPatch = bytecodePatch(
    name = "Hide video action buttons",
    description = "Adds options to hide video action buttons in fullscreen and portrait modes."
) {
    dependsOn(
        settingsPatch,
        sharedExtensionPatch,
        lithoFilterPatch,
        treeNodeElementHookPatch,
        fixProtoLibraryPatch,
        videoInformationPatch,
        quickActionsMarginPatch,
        restoreOldVideoActionBarPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.PLAYER.addPreferences(
            PreferenceScreenPreference(
                key = "tada_action_buttons_screen",
                preferences = setOf(
                    PreferenceCategory(
                        titleKey = "tada_portrait_buttons",
                        preferences = setOf(
                            SwitchPreference("tada_disable_like_subscribe_glow", summary = true),
                            SwitchPreference("tada_hide_action_bar"),
                            SwitchPreference("tada_hide_ask_button"),
                            SwitchPreference("tada_hide_channel_profile_button", summary = true),
                            SwitchPreference("tada_hide_channel_profile_subscribe_button", summary = true),
                            SwitchPreference("tada_hide_clip_button", summary = true),
                            SwitchPreference("tada_hide_comments_button"),
                            SwitchPreference("tada_hide_connect_button"),
                            SwitchPreference("tada_hide_download_button"),
                            SwitchPreference("tada_hide_hype_button"),
                            SwitchPreference("tada_hide_like_dislike_button"),
                            SwitchPreference("tada_hide_more_button"),
                            SwitchPreference("tada_hide_promote_button"),
                            SwitchPreference("tada_hide_remix_button"),
                            SwitchPreference("tada_hide_report_button"),
                            SwitchPreference("tada_hide_save_button"),
                            SwitchPreference("tada_hide_share_button"),
                            SwitchPreference("tada_hide_shop_button"),
                            SwitchPreference("tada_hide_stop_ads_button"),
                            SwitchPreference("tada_hide_thanks_button")
                        )
                    ),
                    PreferenceCategory(
                        titleKey = "tada_fullscreen_buttons",
                        preferences = setOf(
                            NonInteractivePreference(
                                key = "tada_quick_actions_top_margin",
                                tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference"
                            ),
                            SwitchPreference("tada_hide_quick_actions"),
                            SwitchPreference("tada_hide_quick_actions_ask_button"),
                            SwitchPreference("tada_hide_quick_actions_comments_button"),
                            SwitchPreference("tada_hide_quick_actions_dislike_button"),
                            SwitchPreference("tada_hide_quick_actions_like_button"),
                            SwitchPreference("tada_hide_quick_actions_live_chat_button"),
                            SwitchPreference("tada_hide_quick_actions_mix_button"),
                            SwitchPreference("tada_hide_quick_actions_more_button"),
                            SwitchPreference("tada_hide_quick_actions_more_videos_button"),
                            SwitchPreference("tada_hide_quick_actions_playlist_button"),
                            SwitchPreference("tada_hide_quick_actions_save_button"),
                            SwitchPreference("tada_hide_quick_actions_share_button")
                        )
                    )
                )
            )
        )

        addLithoFilter(VIDEO_ACTION_FILTER)
        addLithoFilter(QUICK_ACTIONS_FILTER)

        hookTreeNodeResult("$VIDEO_ACTION_FILTER->onLazilyConvertedElementLoaded")

        WatchNextResponseParserFingerprint.let {
            it.clearMatch() // Fingerprint is shared and indexes may no longer be correct.
            it.method.apply {
                val index = it.instructionMatches[5].index
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                addInstruction(
                    index + 1,
                    "invoke-static { v$register }, $VIDEO_ACTION_FILTER->" +
                            "onSingleColumnWatchNextResultsLoaded(Lcom/google/protobuf/MessageLite;)V"
                )
            }
        }
    }
}
