package semicoloncolonel.mobilestream.patches.scmp.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.scmp.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// SCMP 7.2.9 sends usage to Firebase Analytics, AppsFlyer, Meta app events,
// and Google Analytics. They go through OkHttp or URL.openConnection, which
// the shared blocklist covers, plus the SDKs' manifest kill switches.
//
// Not touched: stories, sign-in, subscriptions (Piano), push alerts (Batch),
// and the "Recommended for you" lists.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics and attribution services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        blockTrackersAtDns()
    }
}
