/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/letterboxd/ads/HideAdsPatch.kt
 */
package app.morphe.patches.letterboxd.ads

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
) {
    compatibleWith(AppCompatibilities.LETTERBOXD)

    execute {
        AdmobHelperSetShowAdsFingerprint.method.addInstruction(0, "const p1, 0x0")
        // Force shouldShowAds() to always return false.
        AdmobHelperShouldShowAdsFingerprint.method.returnEarly(false)

        fun blockShowAds(fingerprintName: String, method: MutableMethod) {
            when (method.returnType) {
                "V" -> method.returnEarly()
                "Z" -> method.returnEarly(false)
                else -> throw PatchException(
                    "Unsupported returnType for $fingerprintName: ${method.returnType}",
                )
            }
        }

        // Don’t silently skip: if these exist in the app, they must be patched.
        blockShowAds("FilmFragmentShowAdsFingerprint", FilmFragmentShowAdsFingerprint.method)
        blockShowAds("MemberExtensionShowAdsFingerprint", MemberExtensionShowAdsFingerprint.method)
    }
}

