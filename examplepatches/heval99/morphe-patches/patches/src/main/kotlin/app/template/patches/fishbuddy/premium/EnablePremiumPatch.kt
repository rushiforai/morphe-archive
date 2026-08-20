package app.template.patches.fishbuddy.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FISHBUDDY
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Forces User.hasPremium() to return true, unlocking premium " +
            "features locked behind the RevenueCat subscription entitlement."
) {
    compatibleWith(COMPATIBILITY_FISHBUDDY)

    execute {
        UserHasPremiumFingerprint.methodOrNull?.returnEarly(value = true)
    }
}