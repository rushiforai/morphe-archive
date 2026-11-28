package semicoloncolonel.mobilestream.patches.cbsnews.privacy

import semicoloncolonel.mobilestream.patches.shared.privacy.gatedAnalyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cbsnews.misc.disableSignatureCheckPatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// CBS News 5.20. TrackingManager.initialize registers the app's screen and
// event trackers (Adobe, comScore, and Airship events); every send checks
// for its tracker first, so registering none sends nothing. The shared layer
// blocks the rest at the network: Adobe Analytics and media heartbeats,
// comScore, Nielsen, Mux, New Relic, Flurry, Kochava, Moat, Brightline,
// Qualtrics targeting, and Firebase Analytics.
//
// Not touched: the article and video feeds, live streams (Google DAI needs
// its own hosts), weather and radar, and push notifications.

internal object TrackingManagerInitFingerprint : Fingerprint(
    definingClass = "Lcom/treemolabs/apps/cbsnews/data/tracking/TrackingManager;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
)

@Suppress("unused")
val blockAnalyticsPatch: BytecodePatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Blocks the tracking you choose in the patch options.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(optOutOfDataSalePatch)

    dependsOn(disableSignatureCheckPatch, gatedAnalyticsKillSwitchesPatch { isOptionOn(blockAnalyticsPatch, "analytics") })

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
        TrackingManagerInitFingerprint.method.returnEarly("return-void")
        blockTrackers()
    }
}
