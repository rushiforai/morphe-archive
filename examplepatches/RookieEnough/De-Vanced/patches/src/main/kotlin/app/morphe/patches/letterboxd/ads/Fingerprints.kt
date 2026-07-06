/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/letterboxd/ads/Fingerprints.kt
 */
package app.morphe.patches.letterboxd.ads

import app.morphe.patcher.Fingerprint

internal const val ADMOB_HELPER_CLASS_NAME = "Lcom/letterboxd/letterboxd/helpers/AdmobHelper;"

internal object AdmobHelperSetShowAdsFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "setShowAds" && classDef.type == ADMOB_HELPER_CLASS_NAME
    },
)

internal object AdmobHelperShouldShowAdsFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "shouldShowAds" && classDef.type == ADMOB_HELPER_CLASS_NAME
    },
)

internal object FilmFragmentShowAdsFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "showAds" && classDef.type.endsWith("/FilmFragment;")
    },
)

internal object MemberExtensionShowAdsFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "showAds" && classDef.type.endsWith("/AMemberExtensionKt;")
    },
)

