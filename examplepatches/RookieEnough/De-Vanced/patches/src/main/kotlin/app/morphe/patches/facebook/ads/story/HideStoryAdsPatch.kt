/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/facebook/ads/story/HideStoryAdsPatch.kt
 */
package app.morphe.patches.facebook.ads.story

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val hideStoryAdsPatch = bytecodePatch(
    name = "Hide story ads",
    description = "Hides the ads in the Facebook app stories.",
) {
    compatibleWith(AppCompatibilities.FACEBOOK)

    execute {
        AdsInsertionMethodFingerprint.method.returnEarly()
        FetchMoreAdsMethodFingerprint.method.returnEarly()
    }
}

