package semicoloncolonel.mobilestream.patches.flipp.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.flipp.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// ─────────────────────────────────────────────────────────────────────────────
// Block ads.
//
// Flipp 115.0.0 shows ads in three places, apart from the flyers themselves.
//
// The home feed: the server sends the feed as a list of slots, and some slots
// hold a Google native ad, an AdAdapted ad, or a "unified" web ad. MaestroMapper
// turns the slots into the feed. There the list goes through ShoppingAdsFilter,
// which leaves out the ad slots, so the ads are neither requested nor drawn.
//
// Search: the search result carries the native ad to show among the results
// (SearchResult.getNativeAds), which now reads as empty.
//
// Inside a flyer: the app's ad settings (AppAds) list the Google native ads
// for the top, middle, and bottom of a flyer and the AdAdapted zones. Both now
// read as absent.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"

// MaestroMapper's slot loop: (result, views, slots, ..., MaestroResponse, ...).
internal object FeedSlotsFingerprint : Fingerprint(
    definingClass = "Lcom/wishabi/flipp/data/maestro/repositories/MaestroMapper;",
    returnType = "V",
    custom = { method, _ ->
        val types = method.parameterTypes.map { it.toString() }
        types.size == 10 && types[2] == "Ljava/util/List;" && types[5] == "Lmaestro/response/MaestroResponse;"
    },
)

internal object SearchNativeAdsFingerprint : Fingerprint(
    definingClass = "Lcom/wishabi/flipp/search/model/SearchResult;",
    name = "getNativeAds",
    parameters = listOf(),
    returnType = "Ljava/util/ArrayList;",
)

internal object FlyerNativeAdsFingerprint : Fingerprint(
    definingClass = "Lcom/wishabi/flipp/repositories/appads/AppAds;",
    name = "getNativeAds",
    parameters = listOf(),
    returnType = "Ljava/util/List;",
)

internal object FlyerAdAdaptedFingerprint : Fingerprint(
    definingClass = "Lcom/wishabi/flipp/repositories/appads/AppAds;",
    name = "getAdAdapted",
    parameters = listOf(),
    returnType = "Lcom/wishabi/flipp/repositories/appads/AdAdapted;",
)

private const val RETURN_NULL = """
    const/4 p0, 0x0
    return-object p0
"""

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Removes the ads from Flipp's home feed, search results, and flyers.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        FeedSlotsFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $ADS_FILTER->flippFeedSlots(Ljava/util/List;)Ljava/util/List;
                move-result-object p2
            """.trimIndent(),
        )

        SearchNativeAdsFingerprint.method.returnEarly(
            """
                new-instance p0, Ljava/util/ArrayList;
                invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
                return-object p0
            """.trimIndent(),
        )

        FlyerNativeAdsFingerprint.method.returnEarly(RETURN_NULL.trimIndent())
        FlyerAdAdaptedFingerprint.method.returnEarly(RETURN_NULL.trimIndent())
    }
}
