package app.template.patches.sofascore.misc.gms

import app.morphe.patcher.Fingerprint

// The launch activity. Its class is declared in the manifest, so R8 keeps the name; onCreate(Bundle)
// is a framework override. Until 26.10.26 the launcher entry was main.start.StartActivity; since
// 26.11.03 StartActivity is an <activity-alias> targeting main.MainActivity (MAIN/LAUNCHER), so the
// hook sits in MainActivity.onCreate.
internal object StartActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/results/main/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
