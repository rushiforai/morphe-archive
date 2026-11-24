package app.deadcrossing.patches.mono

import app.deadcrossing.patches.shared.Constants.UNITY_ANDROID_ACTIVITY
import app.morphe.patcher.Fingerprint

internal object ShowYoumiFingerprint : Fingerprint(
    definingClass = UNITY_ANDROID_ACTIVITY,
    name = "showYoumi",
    returnType = "V",
    parameters = listOf(),
)

internal object GetAndSpendYoumiPointsFingerprint : Fingerprint(
    definingClass = UNITY_ANDROID_ACTIVITY,
    name = "getAndSpendYoumiPoints",
    returnType = "V",
    parameters = listOf(),
)

internal object ActivityOnCreateFingerprint : Fingerprint(
    definingClass = UNITY_ANDROID_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object ActivityOnResumeFingerprint : Fingerprint(
    definingClass = UNITY_ANDROID_ACTIVITY,
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)
