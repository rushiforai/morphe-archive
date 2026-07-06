/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/inshorts/ad/Fingerprints.kt
 */
package app.morphe.patches.inshorts.ad

import app.morphe.patcher.Fingerprint

internal object InshortsAdsFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("GoogleAdLoader", "exception in requestAd"),
)
