package app.blackmagic.patches.misc.licensecheck

import app.blackmagic.patches.shared.Constants.COMPATIBILITY_BLACKMAGIC_CAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * PairIP's `LicenseClient.checkLicense(Context)` kicks off Google Play license
 * verification and, when a build is not installed/signed by Play, terminates the
 * process ~1 s after launch. Since any re-signed (patched) build is by definition
 * not the Play build, this check must be neutralized for the app to run at all.
 *
 * The `com.pairip.licensecheck` package is never obfuscated, so matching by the
 * fully-qualified class + method name is stable across app versions. Prepending
 * `return-void` makes the check a no-op; because the verification never starts,
 * the failure path that exits the app is never reached.
 */
internal val licenseCheckFingerprint = Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Disables the PairIP license verification that force-quits a re-signed build. " +
        "Required for any patched build to launch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLACKMAGIC_CAM)

    execute {
        licenseCheckFingerprint.method.returnEarly()
    }
}
