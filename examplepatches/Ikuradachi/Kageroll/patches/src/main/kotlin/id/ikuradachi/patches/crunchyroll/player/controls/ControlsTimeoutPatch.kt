package id.ikuradachi.patches.crunchyroll.player.controls

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val controlsTimeoutPatch = bytecodePatch(
    name = "Controls auto-hide timeout",
    description = "Customizes the delay before player controls automatically hide, or disables auto-hiding.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")

    val controlsTimeoutMs = intOption(
        key = "controlsTimeoutMs",
        default = 4000,
        title = "Controls auto-hide timeout (ms)",
        description = "Delay in milliseconds before player controls auto-hide. Set to 0 or less to keep controls visible until toggled.",
        validator = { it != null },
    )

    execute {
        val timeoutMs = requireNotNull(controlsTimeoutMs.value) {
            "Controls auto-hide timeout must not be null"
        }

        val match = ControlsAutoHideTimerFingerprint.matchAll(1..1).single()
        val literalMatch = match.instructionMatches[2]
        if (timeoutMs <= 0) {
            match.method.replaceInstruction(literalMatch.index, "return-void")
        } else {
            val reg = literalMatch.getInstruction<OneRegisterInstruction>().registerA
            match.method.replaceInstruction(
                literalMatch.index,
                "const-wide v$reg, 0x${timeoutMs.toLong().toString(16)}L",
            )
        }
    }
}
