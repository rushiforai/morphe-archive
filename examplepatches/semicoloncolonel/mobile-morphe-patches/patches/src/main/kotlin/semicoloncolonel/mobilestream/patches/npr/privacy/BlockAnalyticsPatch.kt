package semicoloncolonel.mobilestream.patches.npr.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.npr.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// NPR 7.10.0. The SDKs send through URL.openConnection and OkHttp, which the
// shared layers check against the blocklist, plus the SDKs' manifest kill
// switches.
//
// Covered: AppsFlyer, Adjust, Branch, mParticle, Segment, comScore,
// Iterable, Permutive, Quantcast, Amazon ad analytics, and Firebase
// Analytics.
//
// Not touched: stories, audio and video playback, sign-in, station search,
// push alerts, crash reporting, and consent.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, attribution, and audience-measurement services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
