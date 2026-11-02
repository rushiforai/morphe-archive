package app.template.patches.trebedit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.IDM_COMPATIBILITY
import app.template.patches.shared.clearBody

object pipandbackgroundFingerprint : Fingerprint(
    definingClass = "Li/oj7;",
    name = "ۦۘ۬ۗ",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

@Suppress("unused")
val pipandbackgroundPatch = bytecodePatch(
    name = "Unlock PiP and Bg Play Features in Youtube",
    description = "Unlocks picture-in-picture mode and background play features in Youtube.",
    default = true
) {
    compatibleWith(IDM_COMPATIBILITY)
    execute {
        pipandbackgroundFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}
