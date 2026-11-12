package app.template.patches.glassdoor.pairip

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.GLASSDOOR_COMPATIBILITY
import app.template.patches.shared.killPairIpFull
import app.template.patches.shared.pairIPManifestPatch
import app.template.patches.shared.restorePairIpHolders

/**
 * Bypasses Glassdoor's PairIP (Google Play application-integrity) protection.
 *
 * Glassdoor ships the **full-VM** variant: `com.pairip.VMRunner` + `StartupLauncher` +
 * `SignatureCheck` + `VmDecryptor` + the native `libpairipcore.so`, and 22 methods are
 * virtualized (their bodies live only in the encrypted VM programs under `assets/`).
 *
 * Two facts were proven on-device (RootEmu):
 *  - the **original** signed app runs (reaches the `com.pairip.licensecheck.LicenseActivity`
 *    paywall), so ARM translation is not the issue;
 *  - an **unmodified merged + re-signed** APK dies with `Fatal signal 11 (SIGSEGV)` in the
 *    native layer. So the VM cannot survive re-signing and must be neutralised.
 *
 * Therefore: [killPairIpFull] kills the licence/trial checks, the native signature check and
 * the VM, [pairIPManifestPatch] restores the real `com.glassdoor.app.MainApplication` and
 * drops `LicenseActivity`, and [restorePairIpHolders] bakes the ~1.4k strings that the VM
 * would have decrypted at runtime into the generated holder classes' `<clinit>`s (captured
 * from a root heap dump of the *original* signed app).
 */
@Suppress("unused")
val glassdoorBypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP",
    description = "Disables Glassdoor's PairIP integrity/licence verification (full VM + " +
        "native check), restores the real Application class, removes the licence activity, " +
        "and restores the runtime strings the VM would have provided.",
    default = true,
) {
    compatibleWith(GLASSDOOR_COMPATIBILITY)

    dependsOn(
        pairIPManifestPatch("com.glassdoor.app.MainApplication"),
        // The launcher's splash theme is swapped at runtime by a PairIP-VM-only call site,
        // so it must be pointed at the AppCompat theme directly.
        glassdoorFixSplashThemePatch,
    )

    execute {
        killPairIpFull()
        restorePairIpHolders("glassdoor")
    }
}
