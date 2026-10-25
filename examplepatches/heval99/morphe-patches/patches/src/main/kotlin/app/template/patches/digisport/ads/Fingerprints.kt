package app.template.patches.digisport.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Digi Sport's own code (ro.rcsrds.digisport.*) and its player library (ro.rcsrds.lib.player.*)
// are not obfuscated, so these fingerprints pin the readable class and method names plus the full
// signature. Every one also requires a method body (AGENTS.md rule 2).

internal const val ADMOB_MANAGER = "Lro/rcsrds/digisport/tools/helpers/ads/AdMobManager;"
internal const val UI_AD = "Lro/rcsrds/digisport/data/model/ui/others/UIAd;"
internal const val VH_SECTION_AD = "Lro/rcsrds/digisport/ui/article/adapter/viewholder/VHSectionAd;"
internal const val UI_LIVE_PREROLL = "Lro/rcsrds/digisport/data/model/ui/live/UiLivePreroll;"
internal const val UI_LIVE_DAI = "Lro/rcsrds/digisport/data/model/ui/live/UiLiveDai;"
internal const val ARTICLE_API_PAYLOADS =
    "Lro/rcsrds/digisport/tools/helpers/parsing/articleTextAndLive/ArticleApiPayloads;"
internal const val EXTENSION_SERVICE = "Lro/rcsrds/lib/player/core/extensions/ExtensionServiceKt;"
internal const val PLAYER_SERVICE = "Lro/rcsrds/lib/player/PlayerService;"

private val AD_SLOT_PARAMETERS = listOf("Landroid/view/ViewGroup;", UI_AD)

// AdMobManager.loadAd(container, ad): the one public entry point for the in-app AdMob banners
// (called from VHSectionAd). It posts a lambda that either re-attaches a cached AdView (putAd) or
// builds a new one and loads it (requestAd). Its Intrinsics parameter names pin the overload.
// They are matched with CONTAINS, as patcher 1.8.0 matched raw `strings`; patcher 2.0 would
// require the whole string. Kotlin emits the null checks in parameter order (container, ad).
internal object AdMobManagerLoadAdFingerprint : Fingerprint(
    definingClass = ADMOB_MANAGER,
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = AD_SLOT_PARAMETERS,
    filters = listOf(
        string("nContainer", StringComparisonType.CONTAINS),
        string("nAd", StringComparisonType.CONTAINS),
    ),
    custom = { method, _ -> method.implementation != null },
)

// requestAd(container, ad): builds the AdView, sets its AdListener and calls
// AdView.loadAd(AdRequest.Builder().build()). The listener's onAdClicked re-enters it through
// access$requestAd.
internal object AdMobManagerRequestAdFingerprint : Fingerprint(
    definingClass = ADMOB_MANAGER,
    name = "requestAd",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = AD_SLOT_PARAMETERS,
    custom = { method, _ -> method.implementation != null },
)

// putAd(container, ad): adds the loaded (or cached) AdView to the container. The listener's
// onAdLoaded reaches it through access$putAd.
internal object AdMobManagerPutAdFingerprint : Fingerprint(
    definingClass = ADMOB_MANAGER,
    name = "putAd",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = AD_SLOT_PARAMETERS,
    custom = { method, _ -> method.implementation != null },
)

// VHSectionAd.bind(ad): the RecyclerView row for an ad slot in articles and the live EPG list.
internal object VHSectionAdBindFingerprint : Fingerprint(
    definingClass = VH_SECTION_AD,
    name = "bind",
    returnType = "V",
    parameters = listOf(UI_AD),
    custom = { method, _ -> method.implementation != null },
)

// UiLivePreroll.getEnable(): GetLiveStreamUtils.createPlayerInput adds the "Reclama" pre-roll item
// before a live channel only when it is true.
internal object UiLivePrerollGetEnableFingerprint : Fingerprint(
    definingClass = UI_LIVE_PREROLL,
    name = "getEnable",
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

// ArticleApiPayloads.getMVideoPreroll(): the IMA ad tag for article and VOD videos (a non-null
// Kotlin String). GetArticleVod skips the pre-roll item when it is blank; GetArticleDetailsUtils
// only null-checks it.
internal object ArticleApiPayloadsGetMVideoPrerollFingerprint : Fingerprint(
    definingClass = ARTICLE_API_PAYLOADS,
    name = "getMVideoPreroll",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

// ExtensionServiceKt.initImaAds(service, adsConfiguration): builds (once) and returns the IMA
// client-side AdsLoader. It is the player's AdsLoader.Provider and is also called, result unused,
// from PlayerService.onCreate.
internal object InitImaAdsFingerprint : Fingerprint(
    definingClass = EXTENSION_SERVICE,
    name = "initImaAds",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Landroidx/media3/exoplayer/source/ads/AdsLoader;",
    parameters = listOf(PLAYER_SERVICE, "Landroidx/media3/common/MediaItem\$AdsConfiguration;"),
    custom = { method, _ -> method.implementation != null },
)

// The four getters of the server's "ads" list (List<ApiAdsBanners>): articles, the EPG, listings
// and soccer results. Gson fills the fields by reflection, so only app code reads the getters, and
// every reader handles an empty list (isEmpty checks or a plain loop).
internal const val API_AD_LIST_ARTICLE = "Lro/rcsrds/digisport/data/model/api/article/ApiArticleData;"
internal const val API_AD_LIST_EPG = "Lro/rcsrds/digisport/data/model/api/epg/ApiEpgData;"
internal const val API_AD_LIST_LISTING = "Lro/rcsrds/digisport/data/model/api/listingArticles/Data;"
internal const val API_AD_LIST_SOCCER = "Lro/rcsrds/digisport/data/model/api/soccer/APIResultsResponseData;"

internal object ApiArticleDataGetAdsFingerprint : Fingerprint(
    definingClass = API_AD_LIST_ARTICLE,
    name = "getAds",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

internal object ApiEpgDataGetAdsFingerprint : Fingerprint(
    definingClass = API_AD_LIST_EPG,
    name = "getAds",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

internal object ListingDataGetAdsListFingerprint : Fingerprint(
    definingClass = API_AD_LIST_LISTING,
    name = "getAdsList",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

internal object ApiResultsResponseDataGetAdsFingerprint : Fingerprint(
    definingClass = API_AD_LIST_SOCCER,
    name = "getAds",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

// GetArticleDetailsLiveTab1.adConstraints(element): whether an <ad-api> element in the article body
// becomes an ad section (parseAd) with its spacer. Its "data-slot" string is shared with parseAd,
// so the private (Element)Z shape pins it.
internal object ArticleAdConstraintsFingerprint : Fingerprint(
    definingClass = "Lro/rcsrds/digisport/tools/helpers/parsing/articleTextAndLive/GetArticleDetailsLiveTab1;",
    name = "adConstraints",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lorg/jsoup/nodes/Element;"),
    custom = { method, _ -> method.implementation != null },
)

// GetArticleDetailsWidgets.addAdWidget(article, position): the ad section between article widgets.
// Its only caller (a GetArticleDetails.parseWidgets lambda) adds the result only when non-null.
internal object AddAdWidgetFingerprint : Fingerprint(
    definingClass = "Lro/rcsrds/digisport/tools/helpers/parsing/articleTextAndLive/GetArticleDetailsWidgets;",
    name = "addAdWidget",
    returnType = "Lro/rcsrds/digisport/data/model/ui/articles/ArticleSection;",
    parameters = listOf(ARTICLE_API_PAYLOADS, "I"),
    custom = { method, _ -> method.implementation != null },
)

// SyncEpgRepositoryBase.addBanner(ads, day, channel): inserts the ad rows into the cached EPG days.
internal object SyncEpgAddBannerFingerprint : Fingerprint(
    definingClass = "Lro/rcsrds/digisport/data/sync/epg/repository/SyncEpgRepositoryBase;",
    name = "addBanner",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;",
        "Lro/rcsrds/digisport/data/model/ui/epg/UIEpgCacheDay;",
        "Ljava/lang/String;",
    ),
    custom = { method, _ -> method.implementation != null },
)

// UiLiveDai.getEnable(): true when the channel config carries an enabled IMA DAI balancer. It
// gates the DAI balancer request in GetLiveStream and the ssai:// DAI media item in
// GetLiveStreamUtils.createPlayerInput.
internal object UiLiveDaiGetEnableFingerprint : Fingerprint(
    definingClass = UI_LIVE_DAI,
    name = "getEnable",
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> method.implementation != null },
)

// ExtensionServiceKt.updateAdViewForDai(service): re-creates the IMA DAI AdsLoader and media source
// for the current item when it is a DAI item.
internal object UpdateAdViewForDaiFingerprint : Fingerprint(
    definingClass = EXTENSION_SERVICE,
    name = "updateAdViewForDai",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(PLAYER_SERVICE),
    custom = { method, _ -> method.implementation != null },
)
