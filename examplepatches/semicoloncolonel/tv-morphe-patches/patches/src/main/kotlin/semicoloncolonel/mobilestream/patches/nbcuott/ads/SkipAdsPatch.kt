package semicoloncolonel.mobilestream.patches.nbcuott.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nbcuott.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.filterWebRequests

// CNBC 7.10.0, NBC News 7.9.1, and MS NOW 7.10.2 for Android TV. MS NOW and
// CNBC play each clip through an AWS MediaTailor session, which stitches
// FreeWheel ads into the clip's HLS playlists; the clip's own playlist on its
// origin has no ads. NBC News plays clips from the origin after a FreeWheel
// preroll. The WebViewClient's shouldInterceptRequest answers MediaTailor's
// master playlist request with the origin's playlist and its tracking request
// with no ad breaks, and FreeWheel's preroll request with an empty schedule.
// See ClipAdFilter for the details.
//
// Live streams are left alone; their ads are part of the broadcast.

private const val CLIP_AD_FILTER =
    "Lsemicoloncolonel/mobilestream/extension/nbcuott/ClipAdFilter;->filter(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;"

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads in on-demand clips. Ads in the live stream still play.",
) {
    category("Ads")
    compatibleWith(Constants.CNBC, Constants.NBC_NEWS, Constants.MS_NOW)

    extendWith("extensions/extension.mpe")

    execute {
        val client = Constants.WEB_VIEW_CLIENTS.firstOrNull { classDefByOrNull(it) != null }
            ?: throw PatchException("Skip ads: the web app's WebViewClient was not found")
        filterWebRequests(client, CLIP_AD_FILTER)
    }
}
