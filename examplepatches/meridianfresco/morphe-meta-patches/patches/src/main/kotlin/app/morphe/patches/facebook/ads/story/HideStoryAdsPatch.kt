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
        try {
            AdsInsertionMethodFingerprint.method.returnEarly()
            FetchMoreAdsMethodFingerprint.method.returnEarly()
        } catch (e: Exception) {
            throw IllegalStateException("Failed to resolve fingerprint. Universal (non-split) Facebook APKs from APKMirror are not supported due to heavy Redex obfuscation. Please download the split APK bundle (.apkm) and merge it with AntiSplit-M, or patch the split bundle directly.", e)
        }
    }
}

