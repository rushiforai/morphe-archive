package app.morphe.patches.googlephotos.misc.flags

import app.morphe.patcher.Fingerprint

object SettingsActivityV2OnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/photos/settings/SettingsActivityV2;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)
