package app.template.patches.ipoji

import app.morphe.patcher.Fingerprint

object Fingerprints {
    // com.revenuecat.purchases.EntitlementInfo -> isActive() : boolean
    // The single gatekeeper for all entitlement/subscription status.
    // Returns true if the entitlement is currently active (not expired, not cancelled).
    // Non-obfuscated (Parcelable, public API) — stable across app versions.
    // Patching this makes ALL entitlements appear active, unlocking all premium features
    // and suppressing ads (if gated by entitlement check in Flutter).
    val EntitlementIsActiveFingerprint = Fingerprint(
        definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
        name = "isActive"
    )
}
