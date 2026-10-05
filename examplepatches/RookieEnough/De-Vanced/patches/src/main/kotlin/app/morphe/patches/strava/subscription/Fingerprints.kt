/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/strava/subscription/Fingerprints.kt
 */
package app.morphe.patches.strava.subscription

import app.morphe.patcher.Fingerprint

internal object GetSubscribedFingerprint : Fingerprint(
    definingClass = "/SubscriptionDetailResponse;",
    name = "getSubscribed",
    returnType = "Z"
)

