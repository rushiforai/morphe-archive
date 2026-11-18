package semicoloncolonel.mobilestream.patches.espn.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.espn.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in 8.27.0: Braze (marketing), New Relic (app monitoring),
// Conviva (video measurement), Nielsen and comScore (audience measurement),
// Kochava (install attribution), Adobe Experience Platform (analytics and
// media tracking) and Firebase Analytics. ESPN keeps OkHttp's names, so both
// blocking layers apply (see BlockTrackers.kt).
//
// Not touched: Adobe Pass (TV provider sign-in), Disney sign-in, OneTrust
// consent, playback or DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
