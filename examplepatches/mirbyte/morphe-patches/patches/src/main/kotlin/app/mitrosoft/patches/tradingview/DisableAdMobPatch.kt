package app.mitrosoft.patches.tradingview

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_TRADINGVIEW

@Suppress("unused")
val disableAdMobPatch = bytecodePatch(
    name = "Disable AdMob",
    description = "Makes the AdMob availability check return false.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        AreAdsAvailableFingerprint.method.returnEarly(false)
    }
}
