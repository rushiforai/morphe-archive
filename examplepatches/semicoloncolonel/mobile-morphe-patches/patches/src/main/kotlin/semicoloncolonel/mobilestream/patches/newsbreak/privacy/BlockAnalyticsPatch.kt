package semicoloncolonel.mobilestream.patches.newsbreak.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// NewsBreak 26.44.1. The SDKs send through URL.openConnection and OkHttp,
// which the shared layers check against the blocklist, plus the SDKs'
// manifest kill switches.
//
// Covered: AppsFlyer, Adjust, Branch, Amplitude, mParticle, Segment,
// Singular, Iterable, LiveRamp, Amazon ad analytics, and Firebase Analytics.
//
// NewsBreak's own event log goes through the same hosts as its stories, so
// it is not blocked here. "Block installed-app scan" stops the app-list
// report.
//
// Not touched: stories, local alerts, sign-in, push alerts, crash reporting,
// and consent.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, attribution, and audience-measurement services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
