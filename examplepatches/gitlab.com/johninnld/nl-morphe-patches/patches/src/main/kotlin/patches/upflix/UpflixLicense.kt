package patches.upflix

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import patches.upflix.shared.COMPATIBILITY_UPFLIX

/**
 * PairIP ("automatic integrity protection") license client. `checkLicense` is called from the
 * Application and from a ContentProvider; on a re-signed APK it fails and the app shows a
 * "get this app from Play" paywall and exits. Same neutralisation as the BOL patch.
 */
internal object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val disableLicenseCheck = bytecodePatch(
    name = "Disable Play license check",
    description = "Required for a patched (re-signed) Upflix: skips the Google Play (PairIP) license " +
        "check that would otherwise close the app.",
) {
    compatibleWith(COMPATIBILITY_UPFLIX)
    execute {
        CheckLicenseFingerprint.method.addInstruction(0, "return-void")
    }
}
