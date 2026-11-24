package app.jofslash.patches.imdb.ads

import app.jofslash.patches.imdb.shared.Constants.COMPATIBILITY_IMDB
import app.jofslash.patches.imdb.shared.editManifest
import app.jofslash.patches.imdb.shared.methodOf
import app.jofslash.patches.imdb.shared.removeNamed
import app.jofslash.patches.imdb.shared.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

// The single ad-init entry. AmazonAdInitter.init() (called from
// ConsumerSpecificApplicationInitializer.doNowOnThisThread) starts Amazon Publisher Services
// (AdRegistration.getInstance) and, through it, Google Mobile Ads (MobileAds.initialize).
private const val AMAZON_AD_INITTER = "Lcom/imdb/advertising/AmazonAdInitter;"

// The coordinator the init entry drives. Its boolean field thirdPartyAdsEligible gates the whole
// render path; updateThirdPartyAdsEligibility(Boolean) is the only writer, fed by the server's
// GraphQL ThirdPartyAdsEligibilityQuery.
private const val APS_COORDINATOR =
    "Lcom/imdb/advertising/amazonpublisherservice/AmazonPublisherServiceCoordinator;"

// IMDb's own ads (the "Sponsored" Amazon banners on the home screen, title pages, search and the
// vertical video feed) come from the GraphQL DisplayAdsForApp query, not from the ad networks. The
// consumer data service runs it; the IMDbPro one (ProIMDbAdsZukoDataService) answers with an empty
// flow instead, which every page already handles as "no ads".
private const val CONSUMER_ADS_SERVICE = "Lcom/imdb/advertising/network/ConsumerIMDbAdsZukoDataService;"
private const val IMDB_ADS_DATA_SERVICE = "Lcom/imdb/advertising/network/IMDbAdsDataService;"
private const val EMPTY_FLOW = "Lkotlinx/coroutines/flow/FlowKt;->emptyFlow()Lkotlinx/coroutines/flow/Flow;"

// Google Mobile Ads starts itself at every app start through this content provider.
private const val MOBILE_ADS_INIT_PROVIDER = "com.google.android.gms.ads.MobileAdsInitProvider"

private val hideAdsResourcePatch = resourcePatch {
    execute {
        editManifest { it.removeNamed("provider", setOf(MOBILE_ADS_INIT_PROVIDER)) }
    }
}

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides IMDb's own \"Sponsored\" banners (on the home screen, title pages, search and the " +
            "video feed) and the video ads before trailers, and doesn't start the ad networks (Amazon Publisher " +
            "Services and Google Ad Manager). IMDb is free with no paid ad-removal tier, so nothing you pay for " +
            "is unlocked.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_IMDB)

    dependsOn(hideAdsResourcePatch)

    execute {
        // init() runs initializeAmazonPublisherService(): AdRegistration.getInstance (APS) and the
        // coroutine that calls MobileAds.initialize (GMA). Returning at once starts neither SDK, so
        // nothing bids, loads or renders an ad.
        methodOf(AMAZON_AD_INITTER, "init").returnEarly()

        // Render safety-net. Ads are server-gated: updateThirdPartyAdsEligibility(Boolean) is where
        // the GraphQL answer turns the pipeline on. No-opping it pins thirdPartyAdsEligible at its
        // default false, so getGoogleAdFlow() takes the app's own "ads not active" branch and
        // returns null for every slot. MultiSourceAdRequest already skips null flows, so no ad view
        // is ever built - this reuses a code path the stock app runs whenever the server disables
        // ads, which is why it can't NPE on a null ad flow.
        methodOf(APS_COORDINATOR, "updateThirdPartyAdsEligibility").returnEarly()

        // IMDb's own ads: answer the ads query as IMDbPro's service does, with an empty flow. The pages
        // then get the app's own "no ads" data, so every slot stays empty.
        methodOf(CONSUMER_ADS_SERVICE, "displayAdsForApp").addInstructions(
            0,
            """
                invoke-static {}, $EMPTY_FLOW
                move-result-object v0
                return-object v0
            """
        )

        // Video ads before a trailer: ask for the video without its preroll.
        methodOf(IMDB_ADS_DATA_SERVICE, "videoPlayback").addInstructions(0, "const/4 p3, 0x0")
    }
}
