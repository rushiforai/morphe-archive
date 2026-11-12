package app.template.patches.shima.pairip

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SHIMA_COMPATIBILITY
import app.template.patches.shared.killPairIpFull
import app.template.patches.shared.pairIPManifestPatch

/**
 * Bypasses Shima+'s PairIP (Google Play application-licensing) protection.
 *
 * Shima+ ships the **lite** PairIP variant: `com.pairip.application.Application` wrapping
 * the real `com.piyush.island.App`, plus the `licensecheck` package (`LicenseClient`,
 * `TrialClient`, `LicenseContentProvider`, `LicenseActivity`) — but **no** `VMRunner`,
 * `StartupLauncher`/`SignatureCheck` and no `libpairipcore.so`. So there is no VM to
 * preserve: [killPairIpFull] neutralises the licence + trial checks (it skips the
 * VM/attestation classes that do not exist here) and [pairIPManifestPatch] restores the
 * real Application class and drops `LicenseActivity` / `CHECK_LICENSE`.
 */
@Suppress("unused")
val shimaBypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP",
    description = "Disables Shima+'s PairIP licence/trial verification, restores the " +
        "real Application class and removes the licence activity.",
    default = true,
) {
    category("PairIP")
    compatibleWith(SHIMA_COMPATIBILITY)

    dependsOn(
        pairIPManifestPatch("com.piyush.island.App"),
    )

    execute {
        killPairIpFull()
    }
}
