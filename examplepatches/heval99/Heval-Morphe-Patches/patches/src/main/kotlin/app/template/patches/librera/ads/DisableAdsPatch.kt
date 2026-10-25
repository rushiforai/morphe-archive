package app.template.patches.librera.ads

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
        IsRewardActivatedFingerprint.method.returnEarly(true)
    }
}
