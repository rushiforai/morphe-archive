package app.template.patches.scannerradio

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SCANNERRADIO

/**
 * Bypasses the central premium check by patching yf.c.V() (isProVersion):
 *
 * - Forces return true, unlocking: no ads, recording, all themes, pro subscriptions.
 * - PlayerActivity.onResume() checks !V() to gate ad display → ads disabled.
 * - Settings, unlock screens, and subscription prompts all check V().
 */
@Suppress("unused")
val premiumBypassPatch = bytecodePatch(
    name = "Premium Bypass",
    description = "Bypasses premium subscription checks to unlock all premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SCANNERRADIO)

    execute {
        // Force isProVersion() to return true
        IsProVersionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
