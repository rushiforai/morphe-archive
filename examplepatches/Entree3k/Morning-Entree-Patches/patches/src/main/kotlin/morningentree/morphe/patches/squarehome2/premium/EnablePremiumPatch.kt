package morningentree.morphe.patches.squarehome2.premium

import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.squarehome2.shared.Constants
import morningentree.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Premium",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        PurchaseResultFingerprint.method.returnEarly(true)
    }
}
