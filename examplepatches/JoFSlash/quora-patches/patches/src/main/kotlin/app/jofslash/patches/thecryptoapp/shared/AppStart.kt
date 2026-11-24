package app.jofslash.patches.thecryptoapp.shared

import app.morphe.patcher.Fingerprint

// The app's own Application.onCreate, which runs once when the process starts. The manifest's
// android:name is com.pairip.application.Application, which extends this App and only overrides
// attachBaseContext, so App.onCreate is the real startup hook.
internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/crypter/cryptocyrrency/app/App;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)
