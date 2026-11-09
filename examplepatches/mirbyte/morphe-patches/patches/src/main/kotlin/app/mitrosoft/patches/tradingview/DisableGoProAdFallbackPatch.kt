package app.mitrosoft.patches.tradingview

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_TRADINGVIEW

@Suppress("unused")
val disableGoProAdFallbackPatch = bytecodePatch(
    name = "Disable GoPro ad fallback",
    description = "Disables the GoPro promo fallback triggered by AdMob load failures.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        ShowGoProAdFingerprint.method.returnEarly()
    }
}
