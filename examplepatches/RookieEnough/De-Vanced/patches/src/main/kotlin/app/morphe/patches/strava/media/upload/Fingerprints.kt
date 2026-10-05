/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/strava/media/upload/Fingerprints.kt
 */
package app.morphe.patches.strava.media.upload

import app.morphe.patcher.Fingerprint

internal object GetCompressionQualityFingerprint : Fingerprint(
    name = "getCompressionQuality",
)

internal object GetMaxDurationFingerprint : Fingerprint(
    name = "getMaxDuration",
)

internal object GetMaxSizeFingerprint : Fingerprint(
    name = "getMaxSize",
)

