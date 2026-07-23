package app.morphe.patches.shared

import app.morphe.patcher.Fingerprint

/** The sole shared app fingerprint needed by the pin-only settings screen. */
internal object GoogleApiActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/api/GoogleApiActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)
