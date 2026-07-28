package app.sofatime.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.sofatime.fingerprints.isPremiumFingerprint
import app.sofatime.fingerprints.isPremiumPurchasedFingerprint
import app.sofatime.fingerprints.isPurchasedFingerprint
import app.sofatime.shared.Constants.SOFATIME_COMPATIBILITY

@Suppress("unused")
val premiumPatch = bytecodePatch(
    name = "SofaTime Premium",
    description = "Unlocks all premium features.",
    default = true,
) {
    compatibleWith(SOFATIME_COMPATIBILITY)

    execute {
        isPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        isPremiumPurchasedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        isPurchasedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
