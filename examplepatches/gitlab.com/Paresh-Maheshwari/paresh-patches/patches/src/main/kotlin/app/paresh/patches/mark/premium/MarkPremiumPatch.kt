package app.paresh.patches.mark.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.mark.shared.Constants.COMPATIBILITY_MARK

@Suppress("unused")
val markPremiumPatch = bytecodePatch(
    name = "Mark Premium",
    description = "Unlocks premium features and removes ads."
) {
    compatibleWith(COMPATIBILITY_MARK)

    execute {
        // Always return true for isPremiumPurchased
        IsPremiumPurchasedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Always return true for isAdsRemoved
        IsAdsRemovedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // NUCLEAR: Kill license check at the root — ContentProvider.onCreate returns true
        LicenseContentProviderFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Safety net: block initializeLicenseCheck
        InitializeLicenseCheckFingerprint.method.addInstructions(0, "return-void")

        // Safety net: suppress error dialogs
        LicenseHandleErrorFingerprint.method.addInstructions(0, "return-void")

        // Safety net: force LICENSED response
        ProcessLicenseResponseFingerprint.method.addInstructions(0, "const/4 p1, 0x0")

        // Safety net: skip validation
        ValidateLicenseResponseFingerprint.method.addInstructions(0, "return-void")
    }
}
