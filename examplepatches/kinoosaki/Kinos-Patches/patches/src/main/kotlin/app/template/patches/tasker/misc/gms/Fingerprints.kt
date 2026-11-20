package app.template.patches.tasker.misc.gms

import app.morphe.patcher.Fingerprint

// The launch activity. Its class is declared in the manifest, so R8 keeps the name; onCreate(Bundle)
// is a framework override.
internal object TaskerOnCreateFingerprint : Fingerprint(
    definingClass = "Lnet/dinglisch/android/taskerm/Tasker;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
