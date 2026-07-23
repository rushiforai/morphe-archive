package patches.investify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * Investify is wrapped in Google's PairIP license protection (com.pairip.licensecheck.*, the
 * Java-only "licensecheck" variant — no com.pairip.VMRunner / libpairipcore.so native VM here).
 * On launch `LicenseContentProvider.onCreate()` runs `new LicenseClient(ctx).initializeLicenseCheck()`,
 * which does a local installer check (`installingPackageName == "com.android.vending"`) + a Play
 * licensing-service round-trip. A re-signed sideload fails ("Local install check failed due to wrong
 * installer" → NOT_LICENSED) and PairIP fires `startPaywallActivity` → `LicenseActivity` → sends the
 * Play-Store paywall intent and `System.exit(0)` — so any patched build is killed on a real device.
 *
 * Bypass: neutralize the two entry chokepoints (PairIP names are unobfuscated — Google injects this
 * after R8, so they're stable across every PairIP app):
 *   - `LicenseContentProvider.onCreate()Z`  → return true without constructing/running the client.
 *   - `LicenseClient.initializeLicenseCheck()V` → return-void (defense in depth; also covers any other
 *     caller). With this, connectToLicensingService / processResponse / startPaywallActivity /
 *     LicenseActivity are never reached, so nothing checks the installer or exits.
 *
 * The app itself never reads PairIP state (PairIP polices independently), so skipping it is transparent.
 * Required for ANY re-signed build of this app to run on a device with Google Play; pairs with the
 * premium patch. Generalizes to other pairip-licensecheck apps (only the compatibleWith differs).
 */

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"
private const val LICENSE_PROVIDER = "Lcom/pairip/licensecheck/LicenseContentProvider;"

internal val pairipInitLicenseCheckFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { m, c -> c.type == LICENSE_CLIENT && m.name == "initializeLicenseCheck" },
)

internal val pairipProviderOnCreateFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { m, c -> c.type == LICENSE_PROVIDER && m.name == "onCreate" },
)

@Suppress("unused")
val bypassPairipLicensePatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables Google PairIP's license/installer check (com.pairip.licensecheck) so a " +
        "re-signed build runs on a real device instead of being redirected to the Play Store and killed. " +
        "No-ops the LicenseContentProvider entry point and LicenseClient.initializeLicenseCheck().",
) {
    compatibleWith(COMPATIBILITY_INVESTIFY)

    execute {
        var patched = 0

        // Provider entry point: skip constructing/running the client entirely.
        try {
            pairipProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
            )
            patched++
        } catch (_: Exception) {
        }

        // Defense in depth: no-op the check itself regardless of caller.
        try {
            pairipInitLicenseCheckFingerprint.method.addInstructions(0, "return-void")
            patched++
        } catch (_: Exception) {
        }

        check(patched >= 1) { "Investify: PairIP licensecheck classes not found — protection may have changed" }
    }
}
