package app.template.patches.notialarm.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_NOTIALARM

/**
 * Premium is a local SharedPreferences flag ("is_premium_user" in the "app_preference" file), not
 * a server entitlement: AppPreference.isPremiumUser() reads it with a false default, and every
 * premium gate calls that getter. The Play Billing wrapper (d10) seeds its cached premium state
 * from it and the billing UI state (k10) starts from it, so one returnEarly(true) unlocks every
 * screen. The BillingClient, the product (premium_upgrade_2026) and the setPremiumUser writer are
 * left intact.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the premium features.",
) {
    compatibleWith(COMPATIBILITY_NOTIALARM)

    execute {
        IsPremiumUserFingerprint.method.returnEarly(true)
    }
}
