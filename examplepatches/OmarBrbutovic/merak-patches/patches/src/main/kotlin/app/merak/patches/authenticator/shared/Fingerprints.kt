package app.merak.patches.authenticator.shared

import app.morphe.patcher.Fingerprint

internal const val AUTHENTICATOR_PACKAGE_NAME = "com.google.android.apps.authenticator2"
internal const val MAIN_ACTIVITY = "Lcom/google/android/apps/authenticator2/main/MainActivity;"

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
