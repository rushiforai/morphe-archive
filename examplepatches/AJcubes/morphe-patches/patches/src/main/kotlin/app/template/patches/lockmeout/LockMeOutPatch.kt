package app.template.patches.lockmeout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.LOCKMEOUT_COMPATIBILITY // 1. ADD THIS IMPORT

@Suppress("unused")
val lockMeOutPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Dynamically injects a return-early bypass into the main license gate.",
    default = true
) {
    // 2. ADD THIS PROPERTY BLOCK: Hooks the patch to your app definition properties
    compatibleWith(LOCKMEOUT_COMPATIBILITY)

    execute {
        IsPremiumLicenseCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
