package app.akkay.patches.batteryguru

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.akkay.patches.shared.Constants.COMPATIBILITY_BATTERYGURU

@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Unlock Premium",
    description = "Unlocks premium subscription features and automatically disables advertisements.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BATTERYGURU)

    execute {
        SubscriptionCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        PurchaseQueryFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
