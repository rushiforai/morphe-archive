package app.template.patches.everythingwidgets.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.EVERYTHING_WIDGETS_COMPATIBILITY

/**
 * Unlock Premium (license bypass) — Everything Widgets.
 *
 * Verified against 2.1.014 (versionCode 63, built 2026-01-21).
 *
 * THE APP'S OWN PURCHASE MODEL (byte-verified, sets expectations):
 *   - Everything Widgets is a PAID Play store app; its license gate is
 *     Google's Pairip stack (com/pairip/licensecheck), wired to start itself
 *     via LicenseContentProvider in the merged manifest. That is the ONLY
 *     paywall: there is no in-app feature paywall — BillingManager
 *     (com/jndapp/nothing/widgets/pack/billing) lists only optional
 *     "donation_coffee/lunch/dinner/premium" SKUs ($1.99–$19.99) that drive a
 *     cosmetic "Premium supporter" badge in Settings. Nothing else is locked
 *     (all 400+ widgets ship with the paid app).
 *   - "Unlock premium" therefore means: make the paid app run without the
 *     store purchase/license. Which is precisely this patch.
 *
 * HOW (fail-open, two prologue kills):
 *   1. LicenseContentProvider.onCreate -> return true: the license client
 *      never boots (no Play licensing service bind, no paywall activity).
 *   2. LicenseClient.initializeLicenseCheck -> return-void: belt-and-braces
 *      for any direct call path outside the provider seam.
 *
 * Leave the response/signature machinery alone — that belongs to the
 * "Spoof Play Store signature" patch, which is the resilience layer that
 * keeps this bypass working across repeated/background license re-checks.
 */
@Suppress("unused")
val everythingWidgetsUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Bypasses the Google license (Pairip) purchase check of the " +
        "paid Everything Widgets app: the app runs fully without a Play purchase. " +
        "Donation SKUs are cosmetic and untouched.",
    default = true,
) {
    compatibleWith(EVERYTHING_WIDGETS_COMPATIBILITY)

    execute {
        // 1. Kill the autostart seam: provider onCreate returns "attached" instantly.
        EwLicenseProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. Kill the license client boot for any direct call path.
        EwInitializeLicenseCheckFingerprint.method.addInstructions(0, "return-void")

        println("Everything Widgets premium unlock: Pairip license boot neutralized (provider + client).")
    }
}
