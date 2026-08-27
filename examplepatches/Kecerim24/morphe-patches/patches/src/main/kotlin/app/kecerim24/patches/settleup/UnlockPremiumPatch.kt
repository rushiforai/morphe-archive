package app.kecerim24.patches.settleup

import app.kecerim24.patches.shared.Constants.COMPATIBILITY_SETTLE_UP
import app.kecerim24.patches.shared.pairipLicenseCheckPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks all premium features that the app gates on the client.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SETTLE_UP)

    // Google Play's PairIP check kills any re-signed build on startup.
    dependsOn(pairipLicenseCheckPatch)

    execute {
        // The app has two generations of premium gates and both have to be answered.

        // Legacy MVP screens: Plan.isPremiumForFeature(feature).
        IsPremiumForFeatureFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Compose transaction screen: TransactionViewModel.isPremium(feature). Returning
        // early here also skips the code that would otherwise open the upsell sheet.
        TransactionViewModelIsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
