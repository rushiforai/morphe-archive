/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.layout.sponsorblock

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tada.patches.all.misc.resources.addAppResources
import app.tada.patches.all.misc.resources.addResourcesPatch
import app.tada.patches.shared.misc.settings.preference.BasePreference
import app.tada.patches.shared.misc.settings.preference.InputType
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settings.preference.NonInteractivePreference
import app.tada.patches.shared.misc.settings.preference.PreferenceCategory
import app.tada.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.TextPreference
import app.tada.patches.youtube.layout.player.icons.copyPlayerButtonIcons
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playercontrols.addTopControl
import app.tada.patches.youtube.misc.playercontrols.disableNewPlayerControlsFeatureFlag
import app.tada.patches.youtube.misc.playercontrols.initializeTopControl
import app.tada.patches.youtube.misc.playercontrols.legacyPlayerControlsPatch
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch
import app.tada.patches.youtube.misc.playservice.is_21_36_or_greater
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.SeekbarOnDrawFingerprint
import app.tada.patches.youtube.video.information.onCreateHook
import app.tada.patches.youtube.video.information.videoInformationPatch
import app.tada.patches.youtube.video.information.videoTimeHook
import app.tada.patches.youtube.video.videoid.hookBackgroundPlayVideoId
import app.tada.patches.youtube.video.videoid.hookVideoId
import app.tada.patches.youtube.video.videoid.videoIdPatch
import app.morphe.util.ResourceGroup
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.copyResources
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SB_PREFERENCES_PACKAGE = "app.morphe.extension.youtube.sponsorblock.preferences"
private const val YOUTUBE_PREFERENCES_PACKAGE = "app.morphe.extension.youtube.settings.preference"
private const val SEGMENT_CATEGORY_PREFERENCE_TAG =
    "app.morphe.extension.shared.sponsorblock.objects.SegmentCategoryPreference"

fun categoryPreference(settingKey: String): BasePreference =
    object : BasePreference(settingKey, null, null, null, null, null, SEGMENT_CATEGORY_PREFERENCE_TAG) {}

private val sponsorBlockResourcePatch = resourcePatch {
    dependsOn(
        settingsPatch,
        legacyPlayerControlsPatch,
        addResourcesPatch
    )

    execute {
        addAppResources("sponsorblock")

        PreferenceScreen.SPONSORBLOCK.addPreferences(
            SwitchPreference("tada_sb_enabled", summary = true),
            PreferenceCategory(
                key = "tada_sb_appearance_category",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference("tada_sb_voting_button", summary = true),
                    SwitchPreference("tada_sb_compact_skip_button", summary = true),
                    SwitchPreference("tada_sb_auto_hide_skip_button", summary = true),
                    ListPreference(key = "tada_sb_auto_hide_skip_button_duration"),
                    SwitchPreference("tada_sb_toast_on_skip", summary = true),
                    ListPreference(key = "tada_sb_toast_on_skip_duration"),
                    SwitchPreference("tada_sb_video_length_without_segments", summary = true),
                    SwitchPreference("tada_sb_square_layout", summary = true)
                )
            ),
            PreferenceCategory(
                key = "tada_sb_diff_segments",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = setOf(
                    categoryPreference("tada_sb_sponsor_color"),
                    categoryPreference("tada_sb_selfpromo_color"),
                    categoryPreference("tada_sb_interaction_color"),
                    categoryPreference("tada_sb_highlight_color"),
                    categoryPreference("tada_sb_intro_color"),
                    categoryPreference("tada_sb_outro_color"),
                    categoryPreference("tada_sb_preview_color"),
                    categoryPreference("tada_sb_hook_color"),
                    categoryPreference("tada_sb_filler_color"),
                    categoryPreference("tada_sb_music_offtopic_color")
                )
            ),
            PreferenceCategory(
                key = "tada_sb_create_segment_category",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference(
                        key = "tada_sb_create_new_segment",
                        summary = true,
                        tag = "$SB_PREFERENCES_PACKAGE.SponsorBlockCreateSegmentSwitchPreference"
                    ),
                    TextPreference(
                        key = "tada_sb_create_new_segment_step",
                        tag = "$SB_PREFERENCES_PACKAGE.SponsorBlockSegmentStepPreference",
                        inputType = InputType.NUMBER
                    ),
                    NonInteractivePreference(
                        key = "tada_sb_guidelines",
                        tag = "$SB_PREFERENCES_PACKAGE.SponsorBlockGuidelinesPreference",
                        selectable = true
                    )
                )
            ),
            PreferenceCategory(
                key = "tada_sb_general",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference("tada_sb_toast_on_connection_error", summary = true),
                    SwitchPreference("tada_sb_track_skip_count", summary = true),
                    TextPreference(
                        key = "tada_sb_min_segment_duration",
                        inputType = InputType.NUMBER_DECIMAL
                    ),
                    TextPreference(
                        key = "tada_sb_private_user_id_Do_Not_Share",
                        tag = "$SB_PREFERENCES_PACKAGE.SponsorBlockPrivateUserIdPreference"
                    ),
                    NonInteractivePreference(
                        key = "tada_sb_api_url",
                        tag = "$SB_PREFERENCES_PACKAGE.SponsorBlockApiUrlPreference",
                        selectable = true
                    ),
                    NonInteractivePreference(
                        key = "tada_sb_channel_whitelist",
                        tag = "$YOUTUBE_PREFERENCES_PACKAGE.ChannelWhitelistPreference",
                        selectable = true
                    ),
                    SwitchPreference("tada_sb_toast_on_whitelisted_channel", summary = true),
                    TextPreference(
                        key = null,
                        titleKey = "tada_sb_settings_ie_title",
                        summaryKey = "tada_sb_settings_ie_summary",
                        tag = "$SB_PREFERENCES_PACKAGE.SponsorBlockImportExportPreference"
                    )
                )
            ),
            PreferenceCategory(
                key = "tada_sb_stats",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = emptySet(), // Preferences are added by custom class at runtime.
                tag = "app.morphe.extension.youtube.sponsorblock.ui.SponsorBlockStatsPreferenceCategory"
            ),
            PreferenceCategory(
                key = "tada_sb_about",
                sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                preferences = setOf(
                    NonInteractivePreference(
                        key = "tada_sb_about_api",
                        tag = "app.morphe.extension.shared.sponsorblock.ui.SponsorBlockAboutPreference",
                        selectable = true
                    )
                )
            )
        )

        copyResources(
            "sponsorblock",
            ResourceGroup(
                "layout",
                "tada_sb_inline_sponsor_overlay.xml",
                "tada_sb_new_segment.xml",
                "tada_sb_skip_sponsor_button.xml"
            )
        )

        copyPlayerButtonIcons(
            "sponsorblock",
            "tada_sb_adjust",
            "tada_sb_backward",
            "tada_sb_compare",
            "tada_sb_edit",
            "tada_sb_forward",
            "tada_sb_logo",
            "tada_sb_publish",
            "tada_sb_voting"
        )

        addTopControl(
            "sponsorblock",
            "@+id/tada_sb_voting_button",
            "@+id/tada_sb_create_segment_button"
        )
    }
}

internal const val EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS =
    "Lapp/morphe/extension/youtube/sponsorblock/YouTubeSponsorBlockConfig;"
private const val EXTENSION_CREATE_SEGMENT_BUTTON_CONTROLLER_CLASS =
    "Lapp/morphe/extension/youtube/sponsorblock/ui/CreateSegmentButton;"
private const val EXTENSION_VOTING_BUTTON_CONTROLLER_CLASS =
    "Lapp/morphe/extension/youtube/sponsorblock/ui/VotingButton;"
private const val EXTENSION_SPONSORBLOCK_VIEW_CONTROLLER_CLASS =
    "Lapp/morphe/extension/youtube/sponsorblock/ui/SponsorBlockViewController;"

@Suppress("unused")
val sponsorBlockPatch = bytecodePatch(
    name = "SponsorBlock",
    description = "Adds options to enable and configure SponsorBlock, which can skip undesired video segments such as sponsored content."
) {
    dependsOn(
        sharedExtensionPatch,
        videoIdPatch,
        videoInformationPatch,
        playerTypeHookPatch,
        legacyPlayerControlsPatch,
        sponsorBlockResourcePatch,
        versionCheckPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        // Hook the video time methods.
        videoTimeHook(
            EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS,
            "setVideoTime"
        )

        hookBackgroundPlayVideoId(
            EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS +
                    "->setCurrentVideoId(Ljava/lang/String;)V"
        )
        // Some app versions do not reach the background play hook for regular playback.
        hookVideoId(
            EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS +
                    "->setCurrentVideoId(Ljava/lang/String;)V"
        )

        // Set seekbar draw rectangle.
        val rectangleFieldName: FieldReference
        RectangleFieldInvalidatorFingerprint.let {
            it.method.apply {
                val rectangleIndex = indexOfFirstInstructionReversedOrThrow(
                    it.instructionMatches.first().index
                ) {
                    getReference<FieldReference>()?.type == "Landroid/graphics/Rect;"
                }
                rectangleFieldName = getInstruction<ReferenceInstruction>(rectangleIndex).reference as FieldReference
            }
        }

        // Seekbar drawing.

        // Shared fingerprint and indexes may have changed.
        SeekbarOnDrawFingerprint.clearMatch()
        // Cannot match using original immutable class because
        // class may have been modified by other patches
        SeekbarOnDrawFingerprint.let {
            it.method.apply {
                // Set seekbar thickness.
                val thicknessIndex = it.instructionMatches.last().index
                val thicknessRegister = getInstruction<OneRegisterInstruction>(thicknessIndex).registerA
                addInstruction(
                    thicknessIndex + 1,
                    "invoke-static { v$thicknessRegister }, " +
                            "$EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS->setSeekbarThickness(I)V"
                )

                // Find the drawCircle call and draw the segment before it.
                val drawCircleIndex = indexOfFirstInstructionReversedOrThrow {
                    getReference<MethodReference>()?.name == "drawCircle"
                }
                val drawCircleInstruction = getInstruction<FiveRegisterInstruction>(drawCircleIndex)
                val canvasInstanceRegister = drawCircleInstruction.registerC
                val centerYRegister = drawCircleInstruction.registerE

                addInstruction(
                    drawCircleIndex,
                    "invoke-static { v$canvasInstanceRegister, v$centerYRegister }, " +
                            "$EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS->" +
                            "drawSegmentTimeBars(Landroid/graphics/Canvas;F)V"
                )

                // Set seekbar bounds.
                addInstructions(
                    0,
                    """
                        move-object/from16 v0, p0
                        iget-object v0, v0, $rectangleFieldName
                        invoke-static { v0 }, $EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS->setSeekbarRectangle(Landroid/graphics/Rect;)V
                    """
                )
            }
        }

        // Change visibility of the buttons.
        initializeTopControl(EXTENSION_CREATE_SEGMENT_BUTTON_CONTROLLER_CLASS)
        initializeTopControl(EXTENSION_VOTING_BUTTON_CONTROLLER_CLASS)

        // Append the new time to the player layout.
        AppendTimeFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.last().index
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                addInstructions(
                    index + 1,
                    """
                        invoke-static { v$register }, $EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS->appendTimeWithoutSegments(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """
                )
            }
        }

        // Initialize the player controller.
        onCreateHook(EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS, "initialize")

        // Initialize the SponsorBlock view.
        ControlsOverlayFingerprint.let {
            it.clearMatch() // Parent fingerprint is shared and may have changed.
            it.method.apply {
                val checkCastIndex = it.instructionMatches.last().index
                val frameLayoutRegister = getInstruction<OneRegisterInstruction>(checkCastIndex).registerA
                addInstruction(
                    checkCastIndex + 1,
                    "invoke-static {v$frameLayoutRegister}, $EXTENSION_SPONSORBLOCK_VIEW_CONTROLLER_CLASS->initialize(Landroid/view/ViewGroup;)V"
                )
            }
        }

        AdProgressTextViewVisibilityFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.first().index
                val register = getInstruction<FiveRegisterInstruction>(index).registerD

                addInstructionsAtControlFlowLabel(
                    index,
                    "invoke-static { v$register }, $EXTENSION_SEGMENT_PLAYBACK_CONTROLLER_CLASS->setAdProgressTextVisibility(I)V"
                )
            }
        }

        // FIXME: Skip buttons do not show in new player controls layout.
        //        Skip buttons may need to be added at runtime like other overlay buttons.
        if (is_21_36_or_greater) {
            disableNewPlayerControlsFeatureFlag()
        }
    }
}
