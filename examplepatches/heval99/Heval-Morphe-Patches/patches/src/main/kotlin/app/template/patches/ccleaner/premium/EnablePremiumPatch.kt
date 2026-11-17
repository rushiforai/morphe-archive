package app.template.patches.ccleaner.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_CCLEANER

/**
 * CCleaner's entitlement lives in the Avast Cleaner subscription service. The single no-arg
 * boolean that reads the active flag of the billing license (`AclLicenseInfo`) has 75 call sites:
 * the dashboard premium cards, the feature gates, the adviser and the ad service's
 * `areAdsAllowed()`. That method answers true now.
 *
 * Play Billing and the Avast account are untouched, so a real purchase still works. The product
 * type getter is left alone: it only feeds two adviser cards, and the Pro features ask the
 * boolean, not the tier. Server-side services (Avast account, cloud) are not affected.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the premium features.",
) {
    compatibleWith(COMPATIBILITY_CCLEANER)

    execute {
        PremiumGateFingerprint.method.returnEarly(true)
    }
}
