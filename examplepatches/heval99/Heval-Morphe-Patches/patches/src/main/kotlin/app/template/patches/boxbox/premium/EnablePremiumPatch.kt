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
        // Force all RevenueCat entitlements to appear active.
        EntitlementInfoIsActiveFingerprint.methodOrNull?.returnEarly(value = true)

        // Disable billing flow launch to prevent purchase dialogs.
        BillingLaunchFlowFingerprint.methodOrNull?.returnEarly()
    }
}
