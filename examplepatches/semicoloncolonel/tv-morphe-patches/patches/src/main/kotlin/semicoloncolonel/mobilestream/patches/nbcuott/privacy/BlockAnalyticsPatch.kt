package semicoloncolonel.mobilestream.patches.nbcuott.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nbcuott.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterWebRequests
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// CNBC 7.10.0, NBC News 7.9.1, and MS NOW 7.10.2 for Android TV. The native
// shell runs Firebase Analytics, and NBC News also runs Branch. Both send
// through URL.openConnection, which the shared layer checks against the host
// blocklist, and Firebase Analytics is also turned off with its manifest kill
// switch. CNBC and MS NOW turn analytics on at runtime after startup, which
// the kill switch overrides. The bundled OkHttp has a package-private
// constructor, so the shared OkHttp layer skips itself; the app's trackers do
// not use it.
//
// Everything else, including the web app's own analytics, runs in the remote
// web app inside the WebView. Its requests are checked against the same
// blocklist through the WebViewClient's shouldInterceptRequest, and a blocked
// one gets an empty 204 response.
//
// Not touched: the web app itself, sign-in (including TV-provider sign-in),
// the MS NOW membership, video, DRM, and Crashlytics.

private const val BLOCK_WEB_REQUEST =
    "$TRACKER_BLOCKER->blockWebRequest(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;"

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the analytics, audience-measurement, and attribution services in the app and its web pages.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.CNBC, Constants.NBC_NEWS, Constants.MS_NOW)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()

        val client = Constants.WEB_VIEW_CLIENTS.firstOrNull { classDefByOrNull(it) != null }
            ?: throw PatchException("Block analytics & tracking: the web app's WebViewClient was not found")
        filterWebRequests(client, BLOCK_WEB_REQUEST)
    }
}
