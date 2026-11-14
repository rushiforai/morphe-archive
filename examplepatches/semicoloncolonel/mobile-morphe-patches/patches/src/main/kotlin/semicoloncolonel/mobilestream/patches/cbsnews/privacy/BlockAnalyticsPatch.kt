package semicoloncolonel.mobilestream.patches.cbsnews.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cbsnews.misc.disableSignatureCheckPatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
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
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableSignatureCheckPatch, analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        TrackingManagerInitFingerprint.method.returnEarly("return-void")
        blockTrackers()
    }
}
