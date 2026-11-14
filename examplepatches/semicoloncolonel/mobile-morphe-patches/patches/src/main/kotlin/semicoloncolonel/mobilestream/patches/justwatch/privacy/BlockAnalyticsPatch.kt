package semicoloncolonel.mobilestream.patches.justwatch.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// JustWatch 26.43.10 keeps OkHttp's public API, so the shared OkHttp layer
// covers the native SDKs and the app's JavaScript, whose requests also go
// through OkHttp. Blocked: JustWatch's own Snowplow collector, AppsFlyer,
// Adjust, Singular, Meta app events, and Firebase Analytics.
//
// Not touched: sign-in, the watchlist, RevenueCat purchases, and Sentry
// crash reporting.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
