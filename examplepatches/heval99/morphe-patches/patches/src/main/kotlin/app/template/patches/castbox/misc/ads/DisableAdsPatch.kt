package app.template.patches.castbox.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CASTBOX
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import app.template.patches.shared.misc.ads.hideMaxAdView
import app.template.patches.shared.misc.ads.neuterAdHooks
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics

// Castbox mediates ads through AppLovin MAX (its banner/MREC helper builds a MaxAdView and
// calls loadAd + startAutoRefresh; interstitials are MaxInterstitialAd) plus a heavy waterfall
// (Google Mobile Ads, Meta Audience Network, InMobi, Amazon APS, TradPlus, BidMachine, ...),
// whose class and method names are stable library API. Podcast Republic is built by the same
// developer on the same ad stack and calls disableCastboxStackAds() too.
private val SDK_INIT_HOOKS = mapOf(
    // The app calls AppLovinSdk.initialize itself (main-activity ads setup). Its init listener
    // only mutes ads (Podcast Republic's also sets the user id), and nothing else waits on it,
    // so MAX and the networks it mediates never start.
    "Lcom/applovin/sdk/AppLovinSdk;" to setOf("initialize"),
    "Lcom/facebook/ads/AudienceNetworkAds;" to setOf("initialize"),
    "Lcom/inmobi/sdk/InMobiSdk;" to setOf("init"),
)

/** Disable ads for the Castbox ad stack; every hook is mandatory and fails loudly. */
internal fun BytecodePatchContext.disableCastboxStackAds() {
    // 1. Never initialize Google Mobile Ads, and neuter the MobileAds statics that throw
    // without it (AGENTS.md rule 9). The bundled TradPlus/BidMachine adapters call initialize.
    neutraliseMobileAdsStatics("initialize")

    // 2. Ad SDK inits.
    neuterAdHooks(SDK_INIT_HOOKS)

    // 3. Every GMA and MAX load/show entry point: banners (BaseAdView, AdManagerAdView,
    // MaxAdView loadAd + startAutoRefresh), natives, interstitials, rewarded and app-open.
    // No app code waits on a MAX rewarded/app-open/native callback, so silent no-ops are safe.
    neuterAdHooks(GMA_LOAD_HOOKS + MAX_LOAD_SHOW_HOOKS)

    // 4. Unfilled MAX banner/MREC views stay GONE.
    hideMaxAdView()
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_CASTBOX)

    execute {
        disableCastboxStackAds()
    }
}
