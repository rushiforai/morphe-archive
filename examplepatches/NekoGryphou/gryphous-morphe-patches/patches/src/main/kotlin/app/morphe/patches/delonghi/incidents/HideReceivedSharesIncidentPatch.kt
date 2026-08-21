package app.morphe.patches.delonghi.incidents

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.delonghi.shared.COMPATIBILITY_DELONGHI_COMFORT

@Suppress("unused")
val hideReceivedSharesIncidentPatch = bytecodePatch(
    name = "Hide shared-devices incident popup",
    description = "Prevents the GetReceivedShares-003 incident popup from appearing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DELONGHI_COMFORT)

    execute {
        ReceivedSharesIncidentDialogFingerprint.let { fingerprint ->
            val showDialogCall = fingerprint.instructionMatches.last()
            fingerprint.method.replaceInstruction(showDialogCall.index, "nop")
        }
    }
}
