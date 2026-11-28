package semicoloncolonel.mobilestream.patches.cbsnews.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// CBS News for Android TV 8.6.0 sends its analytics to Adobe (with Tealium
// and Target), comScore, Nielsen, Mux, Brightline, Mixpanel, and Firebase
// Analytics. The app renames all of OkHttp, so the blocklist cannot attach to
// its clients. Hosts are blocked at URL.openConnection() and at DNS, where
// OkHttp's default resolver calls InetAddress.getAllByName.
//
// Not touched: Google DAI and IMA, which the player checks before every live
// stream and fails without, Vizbee casting, the Ketch consent screen,
// Crashlytics, and the video feeds.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        blockTrackersAtDns()
    }
}
