package app.template.patches.everythingwidgets.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.EVERYTHING_WIDGETS_COMPATIBILITY

/**
 * Spoof Play Store signature — Everything Widgets.
 *
 * Verified against 2.1.014 (versionCode 63).
 *
 * WHY: when a paid app is patched and re-signed it no longer carries the
 * store-known signing key. Pairip's license layer would then get
 * NOT_LICENSED verdicts (or fail RSA response validation) on repeated,
 * background license re-checks and re-show the paywall. This patch makes
 * the app treat the store verdict as if it came back positively signed:
 *
 *   1. LicenseClient.processResponse -> responseCode forced to 0
 *      (LICENSED) at method entry: every verdict — including the failed
 *      cert/NOT_LICENSED one — processes down the "licensed" branch.
 *   2. LicenseResponseHelper.validateResponse -> return-void: the RSA
 *      signature check of the license payload becomes a no-op, so a
 *      re-signed APK can never fail response validation.
 *   3. LicenseActivity.onStart -> finish() + return: if the paywall
 *      activity ever gets started (edge path), it instantly sees itself
 *      out instead of blocking the UI.
 *
 * Keep "Unlock Premium" enabled alongside: that patch kills the license
 * boot; this one is the spoof/immunity layer for anything that still fires.
 */
@Suppress("unused")
val everythingWidgetsSpoofPlayStoreSignaturePatch = bytecodePatch(
    name = "Spoof Play Store signature",
    description = "Forces the Google license (Pairip) verdict branch to LICENSED " +
        "and neutralizes the license payload's signature verification, so the " +
        "patched/re-signed Everything Widgets build always passes store validation.",
    default = true,
) {
    compatibleWith(EVERYTHING_WIDGETS_COMPATIBILITY)

    execute {
        // 1. Any response verdict → LICENSED (0) branch.
        EwProcessResponseFingerprint.method.addInstructions(0, "const/4 p1, 0x0")

        // 2. License payload RSA signature check → no-op.
        EwValidateResponseFingerprint.method.addInstructions(0, "return-void")

        // 3. Paywall activity self-closes if it is ever reached.
        EwLicenseActivityOnStartFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """
        )

        println("Everything Widgets signature spoof: LICENSED branch forced, RSA validation dead, paywall self-closes.")
    }
}
