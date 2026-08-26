package morningentree.morphe.patches.athena.premium

import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.athena.shared.Constants
import morningentree.morphe.util.returnEarly

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Ppremium",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        GetPremiumUnlockedFingerprint.method.returnEarly(true)
    }
}
