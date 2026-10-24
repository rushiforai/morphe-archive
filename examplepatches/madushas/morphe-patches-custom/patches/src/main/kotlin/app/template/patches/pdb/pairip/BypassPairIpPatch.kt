package app.template.patches.pdb.pairip

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import app.template.patches.shared.killPairIpFull
import app.template.patches.shared.pairIPManifestPatch

/**
 * Bypasses Pdb's PairIP (Google Play application-licensing) protection.
 *
 * Pdb ships the *license-check-only* PairIP variant — there is **no** `VMRunner`
 * / `SignatureCheck` / `StartupLauncher` DEX VM, so the real app code is plain and
 * only `LicenseClient` needs neutralising:
 *
 *  • `com.pairip.application.Application` is a thin subclass of the real
 *    `pdb.app.App` whose only job is to call
 *    `LicenseClient.checkLicense()` from `attachBaseContext()`. Replacing the
 *    manifest `android:name` with `pdb.app.App` skips it entirely.
 *  • `LicenseActivity` (Play Store paywall) and the `CHECK_LICENSE` permission
 *    are removed by the shared manifest patch.
 *  • [killPairIpFull] additionally no-ops `LicenseClient.checkLicense` /
 *    `connectToLicensingService` / `processResponse` / `startPaywallActivity`
 *    and the repeated background checks, covering the provider path too.
 */
@Suppress("unused")
val pdbBypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables Pdb's PairIP / Play licence verification so the app runs " +
        "after Morphe re-signs it. Restores the real Application class (pdb.app.App).",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    dependsOn(
        pairIPManifestPatch("pdb.app.App"),
    )

    execute {
        killPairIpFull()
    }
}
