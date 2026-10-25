package app.morphe.patches.zona

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Customizes the ExoPlayer buffer duration in FreeZona to prevent playback stalls
 * and rebuffering, especially on slow or fluctuating network connections.
 */
private object ExoPlayerLoadControlFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    strings = listOf("ExoPlayer is created, hash:"),
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/media3/exoplayer/c;",
            name = "<init>",
            returnType = "V",
        ),
    ),
)

@Suppress("unused")
val videoBufferPatch = bytecodePatch(
    name = "Video buffer",
    description = "Increases ExoPlayer video buffer duration to eliminate stutter and rebuffering on slow connections.",
    default = true,
) {
    compatibleWith(ZONA_COMPATIBILITY)

    val maxBufferMinutesOption = intOption(
        key = "maxBufferMinutes",
        default = 20,
        title = "Max buffer duration (minutes)",
        description = "Maximum duration of video ahead to buffer (default 20 min, original was 6 min).",
        required = true,
    ) { it != null && it in 1..120 }

    val minBufferMinutesOption = intOption(
        key = "minBufferMinutes",
        default = 10,
        title = "Min buffer duration (minutes)",
        description = "Minimum duration of video to buffer before playback considers itself adequately buffered (default 10 min, original was 5 min).",
        required = true,
    ) { it != null && it in 1..120 }

    val bufferForPlaybackSecondsOption = intOption(
        key = "bufferForPlaybackSeconds",
        default = 3,
        title = "Buffer for playback (seconds)",
        description = "Duration of media to buffer before initial playback starts (default 3 s, original was 2.5 s).",
        required = true,
    ) { it != null && it in 1..30 }

    val bufferForPlaybackAfterRebufferSecondsOption = intOption(
        key = "bufferForPlaybackAfterRebufferSeconds",
        default = 5,
        title = "Buffer after rebuffer (seconds)",
        description = "Duration of media to buffer before playback resumes after rebuffering (default 5 s, original was 5 s).",
        required = true,
    ) { it != null && it in 1..60 }

    execute {
        val maxMinutes = maxBufferMinutesOption.value!!
        val minMinutes = minOf(minBufferMinutesOption.value!!, maxMinutes)
        val playbackSec = bufferForPlaybackSecondsOption.value!!
        val rebufferSec = minOf(bufferForPlaybackAfterRebufferSecondsOption.value!!, minMinutes * 60)

        val minBufferMs = minMinutes * 60 * 1000
        val maxBufferMs = maxMinutes * 60 * 1000
        val playbackMs = playbackSec * 1000
        val rebufferMs = rebufferSec * 1000

        ExoPlayerLoadControlFingerprint.method.apply {
            val constructorIndex = ExoPlayerLoadControlFingerprint.instructionMatches.single().index

            // Replace original buffer constants preceding the LoadControl constructor call.
            // Original values in FreeZona:
            // - bufferForPlaybackMs = 2500
            // - bufferForPlaybackAfterRebufferMs = 5000
            // - minBufferMs = 300000 (0x000493e0)
            // - maxBufferMs = 360000 (0x00057e40)
            for (index in 0 until constructorIndex) {
                val instruction = implementation!!.instructions[index]
                if (instruction is NarrowLiteralInstruction && instruction is OneRegisterInstruction) {
                    val reg = instruction.registerA
                    when (instruction.narrowLiteral) {
                        2500 -> replaceInstruction(index, "const v$reg, $playbackMs")
                        5000 -> replaceInstruction(index, "const v$reg, $rebufferMs")
                        300000 -> replaceInstruction(index, "const v$reg, 0x${minBufferMs.toString(16)}")
                        360000 -> replaceInstruction(index, "const v$reg, 0x${maxBufferMs.toString(16)}")
                    }
                }
            }
        }
    }
}
