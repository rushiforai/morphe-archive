package morningentree.morphe.patches.sendfilestotv.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.sendfilestotv.shared.Constants

@Suppress("unused")
val sendFilesToTVUnlockPremiumPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes ads",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        CheckPurchaseFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                invoke-interface { p1, v0 }, Lcom/yablio/sendfilestotv/ui/BilladsActivity${'$'}onPurchaseListener;->onPurchase(Z)V
                return-void
            """,
        )
    }
}
