package app.template.patches.builtwithscience

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.BUILT_WITH_SCIENCE_COMPATIBILITY
import app.template.patches.shared.injectRevenueCatHybridCustomerInfo
import app.template.patches.shared.revenueCatHybridCustomerInfoMapFingerprint

@Suppress("unused")
val builtWithScienceUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Built With Science Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(BUILT_WITH_SCIENCE_COMPATIBILITY)

    execute {
        val fingerprint = revenueCatHybridCustomerInfoMapFingerprint()
        fingerprint
            .match(classDefBy(fingerprint.definingClass!!))
            .method
            .injectRevenueCatHybridCustomerInfo(
                appName = "Built With Science",
                primaryEntitlement = "premium",
                primaryProduct = "bws_plus",
                entitlementIds = listOf(
                    "pro",
                    "plus",
                    "bws_plus",
                    "bws-auth-pro",
                    "subscription",
                    "membership",
                    "full_access",
                    "all_access"
                ),
                productIds = listOf(
                    "BF_PRO",
                    "WEIGHT_PRO",
                    "PROVISIONAL_PRO",
                    "annual_black_friday"
                )
            )
    }
}
