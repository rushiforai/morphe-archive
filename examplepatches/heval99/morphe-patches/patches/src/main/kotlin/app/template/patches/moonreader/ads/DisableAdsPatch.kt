package app.template.patches.moonreader.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_MOONREADER

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables Moon+ Reader's banner, interstitial, exit and native ads " +
        "by forcing the central ad gate to always report ads as disabled."
) {
    compatibleWith(COMPATIBILITY_MOONREADER)

    execute {
        // The single ad gate every ad path consults (constructor, interstitial,
        // exit and rewarded). Forcing it true makes the ad layer never initialize.
        DisableAdsFingerprint.method.returnEarly(true)
    }
}
