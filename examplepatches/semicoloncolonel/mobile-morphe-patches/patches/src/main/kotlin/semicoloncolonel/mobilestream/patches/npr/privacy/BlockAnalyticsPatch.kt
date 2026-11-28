package semicoloncolonel.mobilestream.patches.npr.privacy

import semicoloncolonel.mobilestream.patches.shared.privacy.gatedAnalyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.npr.shared.Constants
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
val blockAnalyticsPatch: BytecodePatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Blocks the tracking you choose in the patch options.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(optOutOfDataSalePatch)

    dependsOn(gatedAnalyticsKillSwitchesPatch { isOptionOn(blockAnalyticsPatch, "analytics") })

    extendWith("extensions/extension.mpe")

    booleanOption(
        key = "analytics",
        default = false,
        title = "Analytics and tracking services",
        description = "Stops the app's analytics, attribution, and audience-measurement services.",
    )
    booleanOption(
        key = "dataSale",
        default = true,
        title = "Opt out of data sale & sharing",
        description = "Rejects all optional cookies on the NPR web pages inside the app and hides the cookie banner.",
    )

    execute {
        if (!isOptionOn(blockAnalyticsPatch, "analytics")) return@execute
        blockTrackers()
    }
}
