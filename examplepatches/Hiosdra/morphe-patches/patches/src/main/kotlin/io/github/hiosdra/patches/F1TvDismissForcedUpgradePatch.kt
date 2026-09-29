package io.github.hiosdra.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val F1_TV_GENERIC_ACTIVITY = "Lcom/avs/f1/ui/GenericActivity;"
private const val F1_TV_UPGRADE_EVENT = "Lcom/avs/f1/interactors/upgrade/UpgradeEvent;"

private val f1TvDismissForcedUpgradeFingerprint = Fingerprint(
    definingClass = F1_TV_GENERIC_ACTIVITY,
    name = "showUpgradeDialog\$lambda\$1",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "$F1_TV_UPGRADE_EVENT->isForce()Z",
        ),
    ),
)

@Suppress("unused")
internal val f1TvDismissForcedUpgradePatch = bytecodePatch(
    name = "F1 TV - Dismiss forced update prompt",
    description = "Allows closing F1 TV's forced-update dialog without exiting the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_F1_TV)

    execute {
        val dismissAction = f1TvDismissForcedUpgradeFingerprint.matchOrNull()
            ?: error("F1 TV forced-update dialog dismiss action was not found")
        check(dismissAction.instructionMatches.size == 1) {
            "Expected one force-upgrade check in the dismiss action, found ${dismissAction.instructionMatches.size}"
        }

        val forceCheckIndex = dismissAction.instructionMatches.single().index
        val instructions = dismissAction.method.implementation!!.instructions
        val resultIndex = forceCheckIndex + 1
        check(instructions.elementAtOrNull(resultIndex)?.opcode == Opcode.MOVE_RESULT) {
            "F1 TV forced-update dialog did not return a boolean result"
        }

        val resultRegister = (instructions.elementAt(resultIndex) as? OneRegisterInstruction)?.registerA
            ?: error("F1 TV forced-update result register could not be read")

        // GenericActivity normally calls finishAndRemoveTask() when a forced
        // update dialog is dismissed. Keep the update/download button intact,
        // but treat a close/back dismissal as non-forced so playback can stay open.
        dismissAction.method.replaceInstruction(
            resultIndex,
            "const/4 v$resultRegister, 0x0",
        )
    }
}
