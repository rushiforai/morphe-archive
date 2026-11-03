package app.template.patches.forzafootball.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FORZA_FOOTBALL

/**
 * Forza Football sells one subscription, Forza Legend, through RevenueCat. The app's only premium
 * gate is its own helper around the SDK: a static (CustomerInfo)Z that walks
 * `customerInfo.entitlements.active` and answers whether an entitlement named "Forza Legend" is
 * among them. The neighbouring (CustomerInfo) helper only reads the expiration date for display.
 *
 * The patch makes the gate answer true. RevenueCat itself keeps running (offerings, the purchase
 * screen and the expiration date the UI shows are untouched), so the subscription page still shows
 * the real plans and account-backed features still need a real account; only the local "is this
 * user a Legend" answer is forced.
 *
 * Verified 2026-10-27 against 6.15.10 (versionCode 731): see COMPATIBILITY_FORZA_FOOTBALL.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Forza Legend, the ad-free premium subscription.",
) {
    compatibleWith(COMPATIBILITY_FORZA_FOOTBALL)

    execute {
        ForzaLegendFingerprint.method.returnEarly(true)
    }
}
