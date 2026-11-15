package app.memorizepi.patches.pairip

import app.memorizepi.patches.mtisland.shared.Constants.COMPATIBILITY_MATERIAL_CAPSULE
import app.memorizepi.patches.pi.shared.Constants.COMPATIBILITY_PI
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly

/**
 * PairIP entry points shared by every app that ships the license-check-only
 * variant of Google's wrapper (no `libpairipcore.so`, no
 * `com.pairip.VMRunner`).
 *
 * The whole check starts in `LicenseClient.checkLicense(Context)`, which is
 * called from both entry points:
 *
 * - `com.pairip.application.Application#attachBaseContext(Context)`
 * - `com.pairip.licensecheck.LicenseContentProvider#onCreate()` (only where
 *   the wrapper registers the provider)
 *
 * All names and signatures below are stable, non-obfuscated framework glue
 * shipped by the wrapper, so the same fingerprints work for every app that
 * uses this PairIP variant.
 */
object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

object LicenseInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList(),
)

object LicenseStopTrialFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "stopTrial",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

object LicenseLocalInstallerCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "performLocalInstallerCheck",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Disables the PairIP license check so a re-signed (patched) build can start.
 *
 * Without this, a sideloaded build is redirected to the Play Store listing on
 * launch: `LicenseClient.performLocalInstallerCheck()` requires the installer
 * package to be `com.android.vending`, and the Play licensing response fails
 * for a signature that Google Play does not know.
 *
 * This patch is required for the patched build to run on devices without
 * root. Users who install the patched APK over the Play Store version via a
 * root/mount based installer do not need it.
 */
val bypassPairIpPatch = patch(
    name = "Bypass PairIP license check",
    description = "Disables the Play PairIP license check that forces a re-signed build " +
            "to the Play Store on launch. Required for a sideloaded (non-root) install " +
            "of the patched APK.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PI, COMPATIBILITY_MATERIAL_CAPSULE)

    execute {
        // Primary hook: no LicenseClient is ever constructed.
        LicenseCheckFingerprint.method.returnEarly()

        // Defense in depth in case any other path calls into the client.
        LicenseInitializeFingerprint.method.returnEarly()
        LicenseStopTrialFingerprint.method.returnEarly()
        LicenseLocalInstallerCheckFingerprint.method.returnEarly(true)
    }
}
