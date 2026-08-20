package app.template.patches.iptvremote.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_IPTVREMOTE
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Forces IptvFreeApplication's pro/trial gate to return true, " +
            "keeping pro features unlocked after the 20-minute trial expires " +
            "and suppressing the in-app review / buy-pro upsell prompts."
) {
    compatibleWith(COMPATIBILITY_IPTVREMOTE)

    execute {
        IptvFreeApplicationIsProFingerprint.methodOrNull?.returnEarly(value = true)
    }
}