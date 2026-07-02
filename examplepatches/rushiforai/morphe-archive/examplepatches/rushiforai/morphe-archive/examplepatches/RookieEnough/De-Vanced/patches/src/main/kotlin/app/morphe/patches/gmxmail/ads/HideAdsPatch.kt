/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/gmxmail/ads/HideAdsPatch.kt
 */
package app.morphe.patches.gmxmail.ads

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides sponsored ads.",
) {
    compatibleWith(AppCompatibilities.GMX_MAIL)

    execute {
        GetAdvertisementStatusFingerprint.method.returnEarly(2)
    }
}

