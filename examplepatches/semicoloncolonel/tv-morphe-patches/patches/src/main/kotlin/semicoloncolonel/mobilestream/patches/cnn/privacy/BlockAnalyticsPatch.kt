package semicoloncolonel.mobilestream.patches.cnn.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterWebRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// CNN 26.10.1 for Android TV is a shell around androidtv.settop.cnn.com. The
// native code has no analytics SDK; the web app runs CNN's trackers, and its
// requests are checked against the shared host blocklist through
// CNNWebViewClient's shouldInterceptRequest, which the app does not define, so
// the patch adds it. A blocked request gets an empty 204 response. The
// blocklist already covers CNN's own collectors (zion.api.cnn.io and
// collector.cdp.cnn.com). The shared URL.openConnection layer also runs, for
// Google's libraries in the native code.
//
// Not touched: the web app itself, sign-in, CNN All Access purchases, video,
// and DRM.

private const val WEB_VIEW_CLIENT = "Lcom/cnn/ctv/CNNWebViewClient;"
private const val BLOCK_WEB_REQUEST =
    "$TRACKER_BLOCKER->blockWebRequest(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;"

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the analytics and audience-measurement services in the app's web pages.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        filterWebRequests(WEB_VIEW_CLIENT, BLOCK_WEB_REQUEST)
    }
}
