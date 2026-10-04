package app.template.patches.trebedit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TREBEDIT_COMPATIBILITY
import app.template.patches.shared.clearBody

object PremiumFingerprint : Fingerprint(
    definingClass = "Lz9/b;",
    name = "g",
    returnType = "Z",
    parameters = listOf("Ljava/util/List;"),
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock TrebEdit Premium",
    description = "Unlocks lifetime access to TrebEdit Premium.",
    default = true
) {
    compatibleWith(TREBEDIT_COMPATIBILITY)
    execute {
        PremiumFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
