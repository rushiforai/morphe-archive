/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.bunpo.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.bunpo.shared.stripPairipPatch
import hoodles.morphe.patches.shared.revenuecat.getAddEntitlementPatch
import hoodles.morphe.util.requireArm64

val addEntitlementPatch = getAddEntitlementPatch("platinum",
    activityOnCreateExtensionHook("/SplashActivity;")
)

val enablePremiumPatch = bytecodePatch(
    name = "Enable Platinum",
    description = "Enables app features locked behind the subscription paywall. Requirements: arm64-v8a, strict apk version"
) {
    compatibleWith(Compat.BUNPO)

    availability(requireArm64())

    dependsOn(stripPairipPatch, addEntitlementPatch)
}
