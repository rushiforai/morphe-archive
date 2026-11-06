package semicoloncolonel.mobilestream.patches.apnews.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.apnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// AP News 6.31.2. The SDKs send through URL.openConnection, which the shared
// layer checks against the blocklist, plus the SDKs' manifest kill switches.
// OkHttp is renamed in this build, so the shared OkHttp layer does not apply.
//
// Covered: Adjust, Branch, Amplitude, Segment, comScore, Parse.ly, LiveRamp,
// Iterable, Permutive, Quantcast, AP's BlueConic customer-data host, and
// Firebase Analytics.
//
// Not touched: stories, video, sign-in, push alerts, crash reporting, and
// consent.

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
