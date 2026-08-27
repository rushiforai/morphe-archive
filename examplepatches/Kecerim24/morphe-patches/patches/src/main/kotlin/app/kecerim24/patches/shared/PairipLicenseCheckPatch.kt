package app.kecerim24.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `com.pairip.licensecheck.LicenseClient.checkLicense(context)`, the only public entry point
 * into Google Play's anti-piracy license check.
 *
 * PairIP is injected into the APK by Google Play after the developer uploads it, so these
 * class and method names are Google's rather than the app's, and are identical across every
 * protected app.
 */
internal object PairipCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Disables Google Play's PairIP license check.
 *
 * PairIP verifies at startup that the app was installed by the Play Store and that its
 * signature is intact. Patching necessarily re-signs the APK, so the check always fails and
 * the app closes itself with a dialog sending the user to the Play Store listing.
 *
 * `checkLicense` is called from `LicenseContentProvider.onCreate` and from
 * `com.pairip.application.Application.attachBaseContext`, both of which run before any app
 * code. Returning immediately stops the service binding, so the error dialog and the
 * scheduled app shutdown are never reached.
 *
 * This is an internal patch rather than a user facing one: no patched build can survive the
 * check, so there is no useful reason to leave it enabled.
 */
val pairipLicenseCheckPatch = bytecodePatch {
    execute {
        PairipCheckLicenseFingerprint.method.addInstructions(0, "return-void")
    }
}
