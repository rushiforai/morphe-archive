package semicoloncolonel.mobilestream.patches.reuters.ads

import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.reuters.shared.ArticleRenderer
import semicoloncolonel.mobilestream.patches.reuters.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// Reuters 7.51.0 is React Native. useAdsSuppressed is the app's own switch
// for leaving ads out, read by the ad slots (AdSlotCard renders nothing), the
// article, Today, topic, and video screens, and the video playlist parser.
// It now always answers true. DianomiWebView, the sponsored content block in
// articles, does not read that switch, so it renders nothing. In articles,
// the ad and Dianomi elements are dropped from the renderer, so their empty
// containers leave no gap (ArticleRenderer).

@Suppress("unused")
val skipAdsPatch = rawResourcePatch(
    name = "Skip ads",
    description = "Removes the ads and sponsored content in the news feeds, in articles, and in videos.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("useAdsSuppressed", HermesBundle.Value.TRUE)
        bundle.returnAtStart("DianomiWebView", HermesBundle.Value.NULL)
        ArticleRenderer.drop(bundle, "ad")
        ArticleRenderer.drop(bundle, "dianomi")
        file.writeBytes(bundle.toByteArray())
    }
}
