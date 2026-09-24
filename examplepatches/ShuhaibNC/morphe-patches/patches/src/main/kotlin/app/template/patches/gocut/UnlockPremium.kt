package app.template.patches.gocut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.gocut.IsProFourFingerprint
import app.template.patches.shared.Constants
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock GoCut Pro",
    description = "Enables premium features and functionality in the GoCut application.",
    default = true
) {
    compatibleWith(Constants.GOCUT_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        IsProFourFingerprint.method.apply {
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
