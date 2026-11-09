package app.mitrosoft.patches.tradingview

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_TRADINGVIEW

@Suppress("unused")
val hideProfileBannerPatch = bytecodePatch(
    name = "Hide profile upsell banner",
    description = "Hides the subscription upsell banner below the profile on the Menu tab. Also hidden by Force local Pro plan.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        GetProfileBannerFingerprint.method.returnEarly(null)
    }
}
