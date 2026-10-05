/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/letterboxd/ads/Fingerprints.kt
 */
package app.morphe.patches.letterboxd.ads

import app.morphe.patcher.Fingerprint

internal const val ADMOB_HELPER_CLASS_NAME = "Lcom/letterboxd/letterboxd/helpers/AdmobHelper;"

internal object AdmobHelperSetShowAdsFingerprint : Fingerprint(
    definingClass = ADMOB_HELPER_CLASS_NAME,
    name = "setShowAds",
)

internal object AdmobHelperShouldShowAdsFingerprint : Fingerprint(
    definingClass = ADMOB_HELPER_CLASS_NAME,
    name = "shouldShowAds",
)

internal object FilmFragmentShowAdsFingerprint : Fingerprint(
    definingClass = "/FilmFragment;",
    name = "showAds",
)

internal object MemberExtensionShowAdsFingerprint : Fingerprint(
    definingClass = "/AMemberExtensionKt;",
    name = "showAds",
)

