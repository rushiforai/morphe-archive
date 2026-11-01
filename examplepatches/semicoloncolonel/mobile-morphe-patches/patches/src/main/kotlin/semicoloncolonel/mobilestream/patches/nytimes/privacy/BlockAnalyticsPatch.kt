package semicoloncolonel.mobilestream.patches.nytimes.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 11.98.0 phone build: AppsFlyer, Chartbeat, comScore,
// Datadog, Iterate (in-app surveys) and Firebase Analytics. NYT keeps OkHttp's
// public names, so both shared layers apply: URLConnection and OkHttp (see
// BlockTrackers.kt).
//
// Not touched: Statsig (the app's feature flags), DataDome (bot protection on
// NYT's own servers), Crashlytics, sign-in and article loading.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the New York Times phone app: AppsFlyer, " +
        "Chartbeat, comScore, Datadog, Iterate surveys and Firebase. Blocking happens on the " +
        "device, inside the app. Sign-in and articles are left alone. Opt-in / experimental; " +
        "test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
