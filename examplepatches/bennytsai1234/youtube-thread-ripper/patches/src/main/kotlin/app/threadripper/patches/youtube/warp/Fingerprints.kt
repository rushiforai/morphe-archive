package app.threadripper.patches.youtube.warp

import app.morphe.patcher.Fingerprint

/** onCreate of the app's main activity; activity names are kept, as the manifest refers to them. */
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
