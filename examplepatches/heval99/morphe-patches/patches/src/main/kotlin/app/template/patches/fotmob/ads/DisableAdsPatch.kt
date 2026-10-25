package app.template.patches.fotmob.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        // shouldShowAds() answers false, the path FotMob takes for FotMob+ subscribers. Its
        // callers (20 in 239) include the MobileAds initialisation, which then never runs, and
        // the screens that set up ad slots.
        val shouldShowAds = ShouldShowAdsFingerprint.method
        if (shouldShowAds.implementation == null) {
            throw PatchException("FotMob shouldShowAds() has no implementation")
        }
        shouldShowAds.returnEarly(false)
    }
}
