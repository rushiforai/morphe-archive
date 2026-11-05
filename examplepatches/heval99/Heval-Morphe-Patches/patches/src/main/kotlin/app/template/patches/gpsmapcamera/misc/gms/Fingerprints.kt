package app.template.patches.gpsmapcamera.misc.gms

import app.morphe.patcher.Fingerprint

// The launch activity (MAIN/LAUNCHER in the manifest). The app keeps its own class names, and a
// manifest-declared class cannot be renamed anyway; onCreate(Bundle) is a framework override.
internal object SplashActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/gkfriend/gpsmapcameraeditor/SplashActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
