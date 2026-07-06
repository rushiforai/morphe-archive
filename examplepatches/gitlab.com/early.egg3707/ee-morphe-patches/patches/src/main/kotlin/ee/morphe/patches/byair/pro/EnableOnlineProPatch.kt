package ee.morphe.patches.byair

import app.morphe.patcher.patch.bytecodePatch
import ee.morphe.util.returnRequestResultBoxedBooleanEarly
import ee.morphe.util.returnRequestResultUnitEarly

@Suppress("unused")
val enableOnlineProPatch = bytecodePatch(
    name = "Enable Online Pro",
    description = "Experimental companion patch that keeps byAir's online Pro gates open without forcing the crash-prone global entitlement refresh path.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(enableProPatch)

    execute {
        // Some remote-gated surfaces ask this mediator directly before showing Pro-backed UI.
        HasProEntitlementRequestFingerprint.method.returnRequestResultBoxedBooleanEarly(true)

        // The crashy behavior came from forcing the shared RevenueCat path globally and then letting
        // its sync/update side effects run. Returning successful Unit here keeps sign-in and
        // background refresh flows from tripping over that sidecar.
        UpdateSubscriptionUserIdUseCaseFingerprint.method.returnRequestResultUnitEarly()
        UpdateRemoteProStatusUseCaseFingerprint.method.returnRequestResultUnitEarly()
        UpdateUserSubscriptionStatusRequestFingerprint.method.returnRequestResultUnitEarly()
    }
}
