package app.template.patches.materialcapsule.pairip

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MATERIAL_CAPSULE_COMPATIBILITY
import app.template.patches.shared.killPairIpFull
import app.template.patches.shared.pairIPManifestPatch

/**
 * Bypasses Material Capsule's PairIP (Google Play application-licensing) protection.
 *
 * Material Capsule ships the *license-check-only* PairIP variant — exactly the same
 * shape as Pdb: there is **no** `VMRunner` / `SignatureCheck` / `StartupLauncher` DEX
 * VM and **no** `libpairipcore.so` native library (the base APK carries no native libs
 * at all; the only ABI split libs are four androidx/mlkit `.so`s). The whole protection
 * is `com.pairip.licensecheck.LicenseClient`:
 *
 *  • `com.pairip.application.Application` is a thin subclass of the real
 *    `com.pryshedko.mtisland.App` whose only job is to call
 *    `LicenseClient.checkLicense()` from `attachBaseContext()`. Replacing the manifest
 *    `android:name` with `com.pryshedko.mtisland.App` skips it entirely.
 *  • `LicenseActivity` (Play Store paywall) and the `CHECK_LICENSE` permission are
 *    removed by the shared manifest patch.
 *  • [killPairIpFull] no-ops `LicenseClient.initializeLicenseCheck` / `processResponse` /
 *    `startPaywallActivity` / `performLocalInstallerCheck` (→ true) and the repeated
 *    background checks; the extra no-op below also kills the retained
 *    `checkLicense(Context)` entry point itself (belt-and-suspenders, in case any other
 *    component invokes it). Missing methods are skipped gracefully.
 */
@Suppress("unused")
val materialCapsuleBypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables Material Capsule's PairIP / Play licence verification so the " +
        "app runs after Morphe re-signs it. Restores the real Application class " +
        "(com.pryshedko.mtisland.App).",
    default = true,
) {
    compatibleWith(MATERIAL_CAPSULE_COMPATIBILITY)

    dependsOn(
        pairIPManifestPatch("com.pryshedko.mtisland.App"),
    )

    execute {
        killPairIpFull(
            "Lcom/pairip/licensecheck/LicenseClient;" to "checkLicense",
        )
    }
}
