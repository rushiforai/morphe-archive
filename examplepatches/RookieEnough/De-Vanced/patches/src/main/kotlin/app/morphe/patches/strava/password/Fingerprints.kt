/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/strava/password/Fingerprints.kt
 */
package app.morphe.patches.strava.password

import app.morphe.patcher.Fingerprint

internal object LogInGetUsePasswordFingerprint : Fingerprint(
    definingClass = "/RequestOtpLogInNetworkResponse;",
    name = "getUsePassword",
    returnType = "Z"
)

internal object EmailChangeGetUsePasswordFingerprint : Fingerprint(
    definingClass = "/RequestEmailChangeWithOtpOrPasswordResponse;",
    name = "getUsePassword",
    returnType = "Z"
)

