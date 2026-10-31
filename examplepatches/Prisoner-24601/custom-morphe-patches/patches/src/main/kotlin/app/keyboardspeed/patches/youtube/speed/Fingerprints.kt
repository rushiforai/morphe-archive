package app.keyboardspeed.patches.youtube.speed

import app.morphe.patcher.Fingerprint

internal const val MAIN_ACTIVITY_CLASS_TYPE = "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;"

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object SpeedStepFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "getSpeedStep",
    returnType = "I",
    parameters = listOf(),
)
