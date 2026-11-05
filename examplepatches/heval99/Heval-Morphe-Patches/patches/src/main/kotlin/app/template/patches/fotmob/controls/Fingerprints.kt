package app.template.patches.fotmob.controls

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// The Settings screen: SettingsActivity is a manifest-declared (exported) activity, so R8 keeps its
// name; onCreate(Bundle) inflates activity_settings with setContentView(int) right after
// super.onCreate.
internal object SettingsActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/fotmob/android/feature/setting/ui/SettingsActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(name = "setContentView", parameters = listOf("I"), returnType = "V"),
    ),
)

// FotMobApp is the manifest-declared Application, so R8 keeps its name and onCreate().
internal object FotMobAppOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/fotmob/android/FotMobApp;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)
