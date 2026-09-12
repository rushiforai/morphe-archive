package app.asken.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

object AdjustInitFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("ogoukd4tlc74"),
        methodCall(name = "initSdk", definingClass = "Lcom/adjust/sdk/Adjust;")
    )
)

object AdMobInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(name = "initialize", definingClass = "Lcom/google/android/gms/ads/MobileAds;")
    )
)

object AdjustOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "onResume",
    returnType = "V",
    parameters = listOf()
)

object AdjustOnPauseFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "onPause",
    returnType = "V",
    parameters = listOf()
)

object AdStatusCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("ad_status")
    )
)
