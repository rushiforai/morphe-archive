package app.masareef.patches.integrity

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Masareef 2.6.1 ships with Google Play Automatic Integrity Protection ("pairip"). Unlike the
 * app's own code, the `com.pairip.*` classes are injected after R8 and keep their real names,
 * so these match on defining class plus method name.
 */

/**
 * `SignatureCheck.verifyIntegrity(Context)` — compares the SHA-256 of the installed signing
 * certificate against the hard-coded Play signature and throws `SignatureTamperedException`
 * on mismatch. Called first from `com.pairip.application.Application.attachBaseContext`.
 */
object VerifyIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * `LicenseClient.checkLicense(Context)` — the single static entry point into the licensing
 * flow. Both `com.pairip.application.Application.attachBaseContext` and
 * `LicenseContentProvider.onCreate` call it, so stubbing it alone kills the whole flow
 * (service binding, response handling, error dialog, paywall, repeated re-checks).
 */
object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
