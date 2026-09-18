package app.template.patches.monefy.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MONEFY
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the Monefy Pro features."
) {
    compatibleWith(COMPATIBILITY_MONEFY)

    execute {
        // Master check: pro app id or cached purchase.
        MasterProFingerprint.methodOrNull?.returnEarly(true)

        // Cached purchase flag itself (read directly by the main activity).
        ProBoughtFingerprint.methodOrNull?.returnEarly(true)

        // RevenueCat can mark the subscription expired on every sync; treat it as never
        // expired so premium is not revoked client-side.
        SubscriptionExpiredFingerprint.methodOrNull?.returnEarly(false)
    }
}
