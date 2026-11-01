package semicoloncolonel.mobilestream.patches.nba.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nba.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in 1.2.0: Braze (marketing), New Relic (app monitoring),
// Amplitude, Datadog, comScore, Kochava (install attribution) and Bitmovin
// player analytics. NBA keeps OkHttp's names, so both blocking layers apply
// (see BlockTrackers.kt).
//
// Not touched: OneTrust consent, NBA ID sign-in, League Pass purchases,
// playback or DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops third-party analytics and tracking in the NBA app: Braze, New Relic, " +
        "Amplitude, Datadog, comScore, Kochava and Bitmovin player analytics. Blocking " +
        "happens on the device, inside the app. Sign-in and playback are left alone. " +
        "Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
