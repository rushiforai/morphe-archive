package app.template.patches.librera.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_LIBRERA

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_LIBRERA)

    execute {
        IsShowAdsInAppFingerprint.method.returnEarly(false)

        // Every isRewardActivated copy (ADS and, since 10.0, the inlined AdsFragmentActivity one).
        val rewardGates = IsRewardActivatedFingerprint.matchAllOrNull().orEmpty()
            .filter { it.method.implementation != null }
        if (rewardGates.isEmpty()) throw PatchException("Disable ads: no isRewardActivated()Z found")
        rewardGates.forEach { it.method.returnEarly(true) }
    }
}
