package app.goodnight.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// PairIP tamper check, called from the app entry Application.attachBaseContext.
// Throws SignatureTamperedException when the APK signature differs from the
// Play release (always the case for a patched APK). Anchored on the two
// string constants of verifyIntegrity (see reference/NOTES.md).
object SignatureCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("SHA-256"),
        string("Apk signature is invalid."),
    )
)

// PairIP Play-license check, called from Application.attachBaseContext and
// LicenseContentProvider.onCreate. Fails (paywall activity -> Play Store)
// when the installer is not com.android.vending. Anchored on the two log
// strings of checkLicense (see reference/NOTES.md).
object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("Cannot check license with null context."),
        string("Skipping license check in isolated process."),
    )
)
