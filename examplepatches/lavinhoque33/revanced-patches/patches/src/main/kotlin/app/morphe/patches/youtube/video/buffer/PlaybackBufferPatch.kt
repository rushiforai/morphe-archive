/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3386
 * Modified by lavinhoque33, 2026-11-14.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.youtube.video.buffer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.fieldAccess
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.patch.PatchList.PLAYBACK_BUFFER
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val PLAYBACK_BUFFER_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/youtube/patches/PlaybackBufferPatch;"

@Suppress("unused")
val playbackBufferPatch = bytecodePatch( // TODO: Make this an internal patch of "Video quality" patch?
    name = "Playback buffer",
    description = "Adds an option to change the video playback buffer size."
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf("PREFERENCE_SCREEN: VIDEO", "SETTINGS: PLAYBACK_BUFFER"),
            PLAYBACK_BUFFER,
        )

        ShouldContinueLoadingFingerprint.let {
            it.method.apply {
                val bufferedDurationField = it.instructionMatches.first().fieldReference
                val scaleBufferedDuration = "$PLAYBACK_BUFFER_CLASS_DESCRIPTOR->scaleBufferedDurationUs(J)J"

                findInstructionIndicesReversedOrThrow(fieldAccess(bufferedDurationField)).forEach { bufferedIndex ->
                    val register = getInstruction<TwoRegisterInstruction>(bufferedIndex).registerA

                    addInstructions(
                        bufferedIndex + 1,
                        """
                            invoke-static/range { v$register .. v${register + 1} }, $scaleBufferedDuration
                            move-result-wide v$register
                        """
                    )
                }
            }
        }

        TracksSelectedFingerprint.let {
            it.method.apply {
                val limitIndex = it.instructionMatches.last().index
                val register = getInstruction<TwoRegisterInstruction>(limitIndex).registerA

                addInstructions(
                    limitIndex + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $PLAYBACK_BUFFER_CLASS_DESCRIPTOR->scaleByteLimit(I)I
                        move-result v$register
                    """
                )
            }
        }
    }
}
