package app.epxec.patches.notizenwidget

import app.epxec.patches.shared.Constants.COMPATIBILITY_NotizenWidget
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch


@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks all premium features in NotiZen Widget for Notion.",
    default = true
) {

    compatibleWith(COMPATIBILITY_NotizenWidget)
    dependsOn(changePackageInstallerPatch())

    execute {
        // ── Patch 1: we0.b()Z ────────────────────────────────────────────────
        // Force the SharedPreferences read of "premium_monthly_active" to always
        // return true. This is the single boolean gate consumed by b46.b()
        // (hasUsablePremiumAccess), which in turn gates PremiumFeatureGateActivity,
        // PremiumWidgetConfigGateActivity, and all feature-gated UI branches.
        //
        // Class name was "tc0" in v0.1.1782848579; is "we0" in v0.1.1790444417.
        // The fingerprint is version-agnostic via the "premium_monthly_active" string.
        NotiZenPremiumReadFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // ── Patch 2: we0.f(J)V ───────────────────────────────────────────────
        // No-op the SharedPreferences writer that sets premium_monthly_active = false.
        // Called by the billing callback when Google Play Billing finds no active
        // purchase. Without this, the billing callback would overwrite the premium
        // flag with false on every app start that fails to find a purchase.
        //
        // NOTE: In v0.1.1782848579 the write method was b(Z)V (boolean param).
        //       In v0.1.1790444417+ it is f(J)V (long param — timestamp).
        //       The fingerprint matches on J parameter to handle the new version.
        NotiZenPremiumWriteFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // ── Patch 3: LicenseClient.processResponse(I, Bundle) ────────────────
        // Force the Pairip (Play Integrity API) license check response code to 0
        // (LICENSED) so the client-side check always passes. Prevents the app from
        // showing a paywall or closing itself after a failed Play Integrity check.
        //
        // Class name is non-obfuscated — stable across versions.
        NotiZenPairIpFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
            """
        )
    }
}
