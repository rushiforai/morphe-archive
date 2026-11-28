package semicoloncolonel.mobilestream.patches.nbcnews.privacy

import semicoloncolonel.mobilestream.patches.shared.privacy.gatedAnalyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nbcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// NBC News 15.0.1 sends its analytics through URL.openConnection, which the
// shared layer covers: Adobe, mParticle, Nielsen, comScore, Conviva, Moat,
// Iterate, Airship analytics, and Firebase Analytics. Its OkHttp build lacks
// the API the shared OkHttp layer needs, so that layer skips itself.
//
// Not touched: content, images, sign-in (including TV-provider sign-in),
// DRM, the StreamSentry player's own hosts, feature flags, and push.

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
        description = "Stops the app's analytics, ad measurement, and marketing services.",
    )
    booleanOption(
        key = "dataSale",
        default = true,
        title = "Opt out of data sale & sharing",
        description = "Starts the app opted out of the sale and sharing of your data.",
    )

    execute {
        if (!isOptionOn(blockAnalyticsPatch, "analytics")) return@execute
        blockTrackers()
    }
}
