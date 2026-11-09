package app.mitrosoft.patches.tradingview

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_TRADINGVIEW

@Suppress("unused")
val disableBrokersFeaturePatch = bytecodePatch(
    name = "Disable brokers feature",
    description = "Turns off the brokers feature toggle, which broker trading entry points on charts, watchlist, and alerts check.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        BrokersIsFeatureEnabledFingerprint.method.returnEarly(false)
    }
}
