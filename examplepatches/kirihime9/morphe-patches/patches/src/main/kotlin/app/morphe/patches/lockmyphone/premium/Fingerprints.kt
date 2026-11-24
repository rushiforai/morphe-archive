package app.morphe.patches.lockmyphone.premium

import app.morphe.patcher.Fingerprint

object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Ltomka/lockmyphone/activities/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
