package morningentree.morphe.patches.obdandroid.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.obdandroid.shared.Constants
import morningentree.morphe.util.returnEarly

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlock Premium",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        IsAppPurchasedFingerprint.method.returnEarly(true)
        SetPurchasedStateFingerprint.method.addInstructions(
            0,
            "const/4 p1, 0x1",
        )
        OnBillingSetupFinishedFingerprint.method.addInstruction(0, "return-void")
    }
}
