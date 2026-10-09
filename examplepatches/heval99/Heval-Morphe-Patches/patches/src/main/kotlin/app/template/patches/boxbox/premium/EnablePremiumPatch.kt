package app.template.patches.boxbox.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BOXBOX
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks premium features by bypassing RevenueCat subscription checks."
) {
    compatibleWith(COMPATIBILITY_BOXBOX)

    execute {
        // Force all RevenueCat entitlements to appear active. That is the only gate: the
        // purchase flow is left alone (a former "block launchBillingFlow" step matched no
        // method in 5.4.9 or 5.4.16 and added nothing once entitlements are active).
        EntitlementInfoIsActiveFingerprint.method.returnEarly(value = true)
    }
}
