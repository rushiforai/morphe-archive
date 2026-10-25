package app.template.patches.bluetoothfinder.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BLUETOOTH_FINDER

/**
 * Bluetooth Scanner loads both of its GMA ads (the main-screen banner and the interstitial) from
 * one place: MainActivity's MobileAds init-complete listener. MobileAds.initialize is not touched,
 * so AGENTS.md rule 9 does not apply.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_BLUETOOTH_FINDER)

    execute {
        // The listener returns at once, so neither ad is requested. The banner AdView is GONE in
        // the layout and only its onAdLoaded callback makes it VISIBLE, and the interstitial show
        // is skipped while no ad has loaded.
        MobileAdsInitCompleteFingerprint.method.returnEarly()
    }
}
