package patches.vi

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

internal val adsTargets = listOf(
    OwnedMethod("Lnl/vi/ads/data/config/AdsDisplayConfig;", "mustShowAds()Z", 17, 1, 14, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x0", "return p0")),
    )),
    OwnedMethod("Lnl/vi/ads/data/manager/AdManagerImplementation;", "preloadInterstitialAd(Lnl/vi/ads/domain/model/NextGenAdAdUnit;)V", 1, 8, 30, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/core/ads/googleNextGenAds/banner/manager/BannerAdsManager;", "initBannerAdsManager(Landroid/app/Activity;)V", 1, 9, 19, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/core/ads/googleNextGenAds/banner/fetcher/BannerAdsFetcherImplementation;", "fetchBannerAds(Lnl/vi/core/ads/googleNextGenAds/banner/adUnits/BannerAdUnit;Lkotlin/jvm/functions/Function1;)V", 1, 4, 17, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;", "return-void")),
    )),
    OwnedMethod("Lnl/vi/extensions/NewsDetailResponseExtensionsKt;", "asNewsDetailItemList(Lnl/vi/feature/articleDetail/data/NewsDetailResponse;ZLjava/util/Map;)Ljava/util/List;", 25, 80, 553, listOf(
        OwnedEdit(131, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"), listOf("nop")),
    )),
    OwnedMethod("Lnl/vi/common/ui/videoFeed/delegates/JwPlayerActionHandlerDelegate;", "onBeforePlay(Lcom/jwplayer/pub/api/events/BeforePlayEvent;)V", 1, 6, 110, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/common/ui/videoFeed/delegates/JwSinglePlayerActionHandlerDelegate;", "onBeforePlay(Lcom/jwplayer/pub/api/events/BeforePlayEvent;)V", 1, 6, 45, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/common/ui/videoFeed/config/VideoFeedPlayerConfigDelegate;", "getValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;)Lcom/jwplayer/pub/api/configuration/PlayerConfig;", 1, 5, 52, listOf(
        OwnedEdit(43, listOf(Opcode.INVOKE_DIRECT, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT), listOf("Lnl/vi/common/ui/videoFeed/config/VideoFeedPlayerConfigDelegate;->getAdsConfig()Lcom/jwplayer/pub/api/configuration/ads/AdvertisingConfig;", null, "Lcom/jwplayer/pub/api/configuration/PlayerConfig\$Builder;->advertisingConfig(Lcom/jwplayer/pub/api/configuration/ads/AdvertisingConfig;)Lcom/jwplayer/pub/api/configuration/PlayerConfig\$Builder;", null), listOf("move-object p0, p1", "nop", "nop", "nop")),
    )),
) + marketingTargets

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Hides native ad placements and publisher marketing cards, and blocks display/video ad activation while preserving articles, content playback and navigation.",
) {
    dependsOn(originalInput, adPlayerResources)
    compatibleWith(vi)
    execute {
        marketingRequestFilter()
        applyOwnedEdits(adsTargets)
    }
}
