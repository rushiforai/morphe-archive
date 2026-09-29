/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.busuu.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.BUSUU)

    execute {
        IsPremiumFingerprint.match(ApiUserToStringFingerprint.classDef)
            .method.returnEarly(true)

        GetTierFingerprint.match(ApiUserAccessToStringFingerprint.classDef)
            .method.returnEarly("standard")

        GetHasActiveSubscriptionFingerprint.method.returnEarly(true)
        IsPremiumFingerprint.match(PremiumUserCtorFingerprint.classDef).method.returnEarly(true)
    }
}