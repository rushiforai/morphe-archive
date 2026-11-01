package semicoloncolonel.mobilestream.patches.wsj.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 15.12.0 phone build: Adobe Analytics, AppsFlyer,
// Braze, comScore, LiveRamp ATS, Parse.ly, Permutive, Snowplow and Firebase
// Analytics. WSJ keeps OkHttp's public names, so both shared layers apply:
// URLConnection and OkHttp (see BlockTrackers.kt).
//
// Not touched: Statsig (feature flags), Sourcepoint (privacy consent), Sentry
// (crash reporting), Megaphone (podcast audio), sign-in and article loading.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the Wall Street Journal phone app: Adobe, " +
        "AppsFlyer, Braze, comScore, LiveRamp, Parse.ly, Permutive, Snowplow and Firebase. " +
        "Blocking happens on the device, inside the app. Sign-in, articles and podcasts are " +
        "left alone. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
