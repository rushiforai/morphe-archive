/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.youtube.interaction.seekbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.shared.misc.settings.preference.noTitleUnsortedPreferenceCategory
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/LiveStreamDVRPatch;"

@Suppress("unused")
val liveStreamDVRPatch = bytecodePatch(
    description = "Enables video seeking on live streams that have disabled DVR (Digital Video Recorder).",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    execute {
        PreferenceScreen.SEEKBAR.addPreferences(
            noTitleUnsortedPreferenceCategory(
                SwitchPreference(
                    key = "tada_live_stream_dvr",
                    summary = true,
                    tag = "app.morphe.extension.youtube.settings.preference.LiveStreamDVRPreference"
                ),
                SwitchPreference(
                    key = "tada_expand_live_stream_dvr_duration",
                    summary = true,
                    tag = "app.morphe.extension.youtube.settings.preference.LiveStreamDVRDurationPreference"
                )
            )
        )

        VideoStreamingDataAllowSeekingFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN).forEach { returnIndex ->
                val returnRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA

                addInstructionsAtControlFlowLabel(
                    returnIndex,
                    """
                        invoke-static { v$returnRegister }, $EXTENSION_CLASS->enableLiveStreamDVR(Z)Z
                        move-result v$returnRegister
                    """
                )
            }
        }

        FormatStreamModelMaxDVRDurationFingerprint.method.apply {
            val index = FormatStreamModelMaxDVRDurationFingerprint.instructionMatches.last().index
            val register = getInstruction<OneRegisterInstruction>(index).registerA

            addInstructions(
                index,
                """
                    invoke-static { v$register, v${register + 1} }, $EXTENSION_CLASS->overrideMaxDVRDurationSeconds(D)D
                    move-result-wide v$register
                """
            )
        }
    }
}
