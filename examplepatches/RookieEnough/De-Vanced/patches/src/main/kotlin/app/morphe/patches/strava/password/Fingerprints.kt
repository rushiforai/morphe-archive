/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/strava/password/Fingerprints.kt
 */
package app.morphe.patches.strava.password

import app.morphe.patcher.Fingerprint

internal object LogInGetUsePasswordFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        method.name == "getUsePassword" && classDef.endsWith("/RequestOtpLogInNetworkResponse;")
    },
)

internal object EmailChangeGetUsePasswordFingerprint : Fingerprint(
    returnType = "Z",
    custom = { method, classDef ->
        method.name == "getUsePassword" && classDef.endsWith("/RequestEmailChangeWithOtpOrPasswordResponse;")
    },
)

