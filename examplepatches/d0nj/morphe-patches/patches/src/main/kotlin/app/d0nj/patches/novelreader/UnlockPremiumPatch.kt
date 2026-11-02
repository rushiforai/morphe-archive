package app.d0nj.patches.novelreader

import app.d0nj.patches.novelreader.Constants.COMPATIBILITY_NOVEL_READER
import app.d0nj.patches.shared.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium features and stops the 10-hour trial countdown.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOVEL_READER)

    execute {
        IsPremiumFingerprint.method.apply {
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }
    }
}
