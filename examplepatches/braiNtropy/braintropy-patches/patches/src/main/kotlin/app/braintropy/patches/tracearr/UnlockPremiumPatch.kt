package app.braintropy.patches.tracearr

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.braintropy.patches.shared.Constants.COMPATIBILITY_TRACEARR

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Disables the Google Play license check (Pairip) that redirects " +
        "installs not purchased through the Play Store to the buy page.",
    default = true
) {
    category("Unlock")
    compatibleWith(COMPATIBILITY_TRACEARR)

    execute {
        // Never run the Pairip license check. Both call sites
        // (com.pairip.application.Application.attachBaseContext and
        // LicenseContentProvider.onCreate) route through this method, so the
        // Play Store paywall redirect and the license error dialog can never
        // be triggered.
        LicenseCheckFingerprint.method.addInstructions(0, "return-void")
    }
}
