package semicoloncolonel.mobilestream.patches.aljazeera.ads

import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.aljazeera.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// Al Jazeera 12.2.0 is React Native (Hermes bytecode version 99). Its ads are
// Google Ad Manager banners and native ads, drawn by the components below.
// Each now renders nothing, so the feed, article, and live blog slots are
// left out with no empty box in their place. Video ads are IMA pre-rolls,
// which the app already skips for short videos and below a play count:
// both checks now always answer "skip".

private val AD_COMPONENTS = listOf(
    "AdComponent",
    "AdPlaceholder",
    "ArticleAdComponent",
    "PostListAdComponent",
    "SportsLiveBlogAdSlot",
    "BannerAd",
    "GAMBannerAd",
)

@Suppress("unused")
val skipAdsPatch = rawResourcePatch(
    name = "Skip ads",
    description = "Removes the ads in the news feeds, articles, and live blogs, and the ads before videos.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        AD_COMPONENTS.forEach { bundle.returnAtStart(it, HermesBundle.Value.NULL) }
        bundle.returnAtStart("shouldSkipAdForShortVideo", HermesBundle.Value.TRUE)
        bundle.returnAtStart("shouldSkipAdForThreshold", HermesBundle.Value.TRUE)
        file.writeBytes(bundle.toByteArray())
    }
}
