package app.template.patches.crimeradar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRIMERADAR

/**
 * Bypasses ALL premium subscription checks by patching multiple choke points:
 *
 * 1. PremiumEntitlementHelper.isPremiumActive() → true
 *    Entitlement layer: ads, replay/audio limits, saved location count.
 *
 * 2. SubscriptionAccountHelper.shouldSuppressPremiumPromotions() → true
 *    Promotion/paywall layer: all premium banners, cards, upgrade popups.
 *    Also covers RadarMapSubscriptionGateway.hasPaidEver() which delegates here.
 *
 * 3. RadarMapSubscriptionGateway.isActiveNow() → true
 *    Map layer: "follow more locations" limit popup → paywall.
 *
 * Note: Server-side location limits are NOT bypassed — the API rejects saves
 * beyond the account's real limit (error 816). Only client-side UI checks
 * are overridden.
 */
@Suppress("unused")
val premiumBypassPatch = bytecodePatch(
    name = "Premium Bypass",
    description = "Bypasses premium subscription checks to unlock all premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CRIMERADAR)

    execute {
        // Entitlement layer: ads, replay, audio, saved locations
        PremiumActiveFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Promotion layer: all premium banners/cards/popups
        SuppressPremiumPromotionsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Map layer: location limit popup
        IsActiveNowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )    }
}
