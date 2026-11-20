package id.ikuradachi.patches.crunchyroll.player.seek

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val seekIntervalPatch = bytecodePatch(
    name = "Seek interval",
    description = "Customizes the double-tap and rewind/fast-forward seek interval in the video player.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")

    val seekIntervalSeconds = intOption(
        key = "seekIntervalSeconds",
        default = 10,
        title = "Seek interval (seconds)",
        description = "Number of seconds to rewind or fast-forward when double-tapping or pressing skip buttons.",
        validator = { it != null && it > 0 },
    )

    execute {
        val seekSeconds = requireNotNull(seekIntervalSeconds.value?.takeIf { it > 0 }) {
            "Seek interval must be greater than 0 seconds"
        }
        val seekMs = seekSeconds * 1000L

        // 1. Update double-tap HUD seconds in both rewind and fast-forward accumulators.
        val tapToSeekViewModelType = TapToSeekViewModelGetterFingerprint.matchAll(1..1)
            .single()
            .method
            .returnType
        val deltaMatches = createTapToSeekDeltaFingerprint(tapToSeekViewModelType).matchAll(2..2)
        for (match in deltaMatches) {
            val literalMatch = match.instructionMatches[0]
            val reg = literalMatch.getInstruction<OneRegisterInstruction>().registerA
            val constInstr = if (seekSeconds <= Short.MAX_VALUE) {
                "const/16 v$reg, 0x${seekSeconds.toString(16)}"
            } else {
                "const v$reg, 0x${seekSeconds.toString(16)}"
            }
            match.method.replaceInstruction(literalMatch.index, constInstr)
        }

        // 2. Update ExoPlayer seekBack/seekForward increments (used by buttons, gestures, and XR).
        val exoMatch = ExoplayerInitSeekIncrementFingerprint.matchAll(1..1).single()
        val exoLiteralMatch = exoMatch.instructionMatches[2]
        val exoReg = exoLiteralMatch.getInstruction<OneRegisterInstruction>().registerA
        exoMatch.method.replaceInstruction(
            exoLiteralMatch.index,
            "const-wide v$exoReg, 0x${seekMs.toString(16)}L",
        )
    }
}
