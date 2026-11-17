package app.zdrgon.patches.drapes.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.drapes.shared.Constants.COMPATIBILITY_DRAPES

/**
 * Bypasses Drapes' PairIP license check so the re-signed app can run.
 *
 * Drapes ships the licensecheck-only variant of PairIP (no VM, no
 * signature verification): the PairIP Application class calls
 * LicenseClient.checkLicense from attachBaseContext, and the license
 * content provider triggers the same check from its onCreate. For a
 * re-signed build the check fails and the app is blocked by the
 * license dialog. Stubbing both entry points — checkLicense returns
 * immediately, the provider reports success without constructing a
 * LicenseClient — removes the check entirely.
 *
 * Verified against Drapes 3.9.3 by dex read: attachBaseContext's only
 * PairIP call is checkLicense, and no other PairIP machinery
 * (VMRunner, StartupLauncher, SignatureCheck) exists in the APK.
 */
@Suppress("unused")
val bypassPairIpLicenseCheckPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Lets the patched app run: stubs out PairIP's license check, which " +
        "otherwise blocks re-signed builds with a license dialog. Drapes 3.9.3 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DRAPES)

    execute {
        LicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        LicenseProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
