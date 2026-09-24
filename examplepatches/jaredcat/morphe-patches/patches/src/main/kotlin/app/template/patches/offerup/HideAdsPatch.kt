package app.template.patches.offerup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_OFFERUP

/**
 * Blocks OfferUp's first-party ads stack for 2026.38.0.
 *
 * Native SDK path (this patch): fail banner/interstitial loads, skip
 * `OUGoogleAdManager` / Nimbus / Prebid init.
 *
 * GraphQL feed / Inbox (depends on [hideAdsFeedTilesPatch]): drop `AD_*` /
 * banner tiles from packed arrays and null listing / Inbox / promo renderers.
 * Does not unlock Premium IAP.
 *
 * Side effect of any OfferUp patch (resigning): listing map embed breaks —
 * warned on the OfferUp compatibility / target descriptions.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide Ads",
    description = "Hides Google, Nimbus, Moloco, Liftoff, in-feed promo tiles, Inbox banners, " +
        "and the Go Premium bar. Note: patching OfferUp breaks the listing map embed " +
        "(Maps API key is tied to the Play Store signature).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OFFERUP)
    dependsOn(hideAdsFeedTilesPatch)

    execute {
        // Native + banner tiles: collapse the view and tell RN the load failed.
        // Use v0-v3 only; these methods have many registers so `p0` can sit above v15.
        BannerSetRequestFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                invoke-virtual {v0}, Lcom/offerup/ads/banner/OUGoogleAdBannerView;->teardown()V
                new-instance v1, Ljava/lang/Exception;
                const-string v2, "blocked"
                invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V
                invoke-direct {v0, v1}, Lcom/offerup/ads/banner/OUGoogleAdBannerView;->dispatchLoadFailure(Ljava/lang/Throwable;)V
                return-void
            """,
        )

        // Interstitials: never show a cached or freshly loaded full-screen ad.
        InterstitialSetRequestFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                const-string v1, "onAdFailedToLoad"
                const-string v2, "description"
                const-string v3, "blocked"
                invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;
                move-result-object v2
                invoke-static {v2}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;
                move-result-object v2
                invoke-direct {v0, v1, v2}, Lcom/offerup/ads/interstitial/OUGoogleInterstitialAdView;->dispatch(Ljava/lang/String;Ljava/util/Map;)V
                return-void
            """,
        )

        // Skip Google/Nimbus/Moloco/Meta/Liftoff SDK initialization.
        GoogleAdManagerConfigureFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p2
                invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;
                move-result-object v1
                const-string v2, "timeout"
                const/4 v3, 0x0
                invoke-interface {v1, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V
                invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """,
        )

        GoogleAdManagerLoadAdFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p2
                const-string v1, "OUGoogleAdManager"
                const-string v2, "blocked"
                invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """,
        )

        GoogleAdManagerIsAdCachedFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p2
                const/4 v1, 0x0
                invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v1
                invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """,
        )

        PrebidBootstrapInitializeFingerprint.method.addInstructions(0, "return-void")
        NimbusInitializeFingerprint.method.addInstructions(0, "return-void")
        NimbusInitializeWithComponentsFingerprint.method.addInstructions(0, "return-void")
    }
}
