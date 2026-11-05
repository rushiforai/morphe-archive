package semicoloncolonel.mobilestream.patches.moviebase.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.moviebase.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Moviebase 7.7.0 sends Firebase Analytics events, with the advertising ID,
// and RevenueCat diagnostics. The manifest kill switches turn off Firebase
// Analytics and its ad-ID and app-set-ID collection, and the shared host
// blocklist stops RevenueCat's diagnostics endpoint.
//
// Not touched: sign-in, Firestore sync of your lists, Trakt, TMDB, SIMKL,
// RevenueCat purchases, and Crashlytics crash reporting.

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
