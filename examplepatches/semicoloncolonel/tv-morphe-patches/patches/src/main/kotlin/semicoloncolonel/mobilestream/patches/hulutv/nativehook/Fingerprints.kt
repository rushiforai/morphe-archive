package semicoloncolonel.mobilestream.patches.hulutv.nativehook

import app.morphe.patcher.Fingerprint

// WKFapplication is Hulu TV's Application subclass (manifest android:name
// ".WKFapplication" under com.hulu.livingroomplus). Its onCreate()V already
// does System.loadLibrary("wkf_fs"); Skip ads injects NativeHookLoader.load()
// at the top so the native SSL_read hook is armed before any playback session.
internal object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/hulu/livingroomplus/WKFapplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)
