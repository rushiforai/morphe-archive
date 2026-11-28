package semicoloncolonel.mobilestream.patches.roku.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.roku.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterWebRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// The Roku Channel 2.0.90 for Android TV is a Cordova shell around Roku's
// remote web app (see Constants.kt). The native code has no analytics SDK of
// its own; Google's datatransport (Firebase) sends through URL.openConnection,
// which the shared layer checks against the host blocklist.
//
// The web app's requests are sent by the WebView, so they are checked against
// the same blocklist in Cordova's SystemWebViewClient.shouldInterceptRequest.
// A blocked request gets an empty 204 response. Cordova defines that method to
// serve the app's local files, so the filter runs first and then hands every
// other request to Cordova's code.
//
// Not touched: the web app itself, sign-in, ads (see Skip ads), video, and DRM.

private const val WEB_VIEW_CLIENT = "Lorg/apache/cordova/engine/SystemWebViewClient;"
private const val BLOCK_WEB_REQUEST =
    "$TRACKER_BLOCKER->blockWebRequest(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;"

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the analytics and audience-measurement services in the app's web pages. " +
        "Experimental, not yet tested on a device.",
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
