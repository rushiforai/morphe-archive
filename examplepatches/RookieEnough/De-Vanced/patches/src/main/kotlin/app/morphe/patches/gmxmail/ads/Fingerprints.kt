/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/gmxmail/ads/Fingerprints.kt
 */
package app.morphe.patches.gmxmail.ads

import app.morphe.patcher.Fingerprint

internal object GetAdvertisementStatusFingerprint : Fingerprint(
    definingClass = "/PayMailManager;",
    name = "getAdvertisementStatus",
)

