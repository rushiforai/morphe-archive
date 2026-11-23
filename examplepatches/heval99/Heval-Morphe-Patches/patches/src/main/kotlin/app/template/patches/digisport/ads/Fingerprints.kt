package app.template.patches.digisport.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Since 1.1.16 Digi Sport is R8-obfuscated: its own classes and methods are renamed, merged into
// shared classes and partly inlined into multi-case lambdas, and so are AdMob, media3, Kotlin and
// jsoup. What keeps its name: the data model classes and their field names (serialised), the
// manifest components (PlayerService), Android framework calls, the app's string literals and
// the IMA SDK API. Every fingerprint below anchors on those, never on an obfuscated name, and
// requires a method body (AGENTS.md rule 2).

internal const val UI_AD = "Lro/rcsrds/digisport/data/model/ui/others/UIAd;"
internal const val UI_LIVE_PREROLL = "Lro/rcsrds/digisport/data/model/ui/live/UiLivePreroll;"
internal const val UI_LIVE_DAI = "Lro/rcsrds/digisport/data/model/ui/live/UiLiveDai;"
internal const val PLAYER_SERVICE = "Lro/rcsrds/lib/player/PlayerService;"
internal const val UI_EPG_CACHE_DAY = "Lro/rcsrds/digisport/data/model/ui/epg/UIEpgCacheDay;"

private val AD_SLOT_PARAMETERS = listOf("Landroid/view/ViewGroup;", UI_AD)

private fun isStatic(accessFlags: Int) = AccessFlags.STATIC.isSet(accessFlags)

/**
 * The getter of the data-class field [type].[field]: no parameters, returns [returnType] and
 * reads the field. The getter is renamed, the field (serialised) is not.
 */
internal fun dataGetterFingerprint(type: String, field: String, returnType: String) = Fingerprint(
    definingClass = type,
    returnType = returnType,
    parameters = listOf(),
    filters = listOf(fieldAccess(definingClass = type, name = field)),
    custom = { method, _ -> method.implementation != null && method.name != "toString" },
)

// AdMobManager's requestAd(container, ad) (merged into a shared class): builds the AdView for the
// ad's size (300x250, 320x100, 468x60), sets its listener and loads it. The app has exactly two
// (ViewGroup, UIAd)V methods: this instance one and the static putAd.
internal val adMobRequestAdFingerprint = Fingerprint(
    returnType = "V",
    parameters = AD_SLOT_PARAMETERS,
    filters = listOf(
        methodCall(definingClass = "Landroid/view/View;", name = "getContext"),
        literal(300),
        literal(250),
        literal(320),
        literal(100),
        literal(468),
        literal(60),
    ),
    custom = { method, _ -> method.implementation != null && !isStatic(method.accessFlags) },
)

// AdMobManager's putAd(container, ad) (static since 1.1.16): moves the loaded AdView into the
// container.
internal val adMobPutAdFingerprint = Fingerprint(
    returnType = "V",
    parameters = AD_SLOT_PARAMETERS,
    filters = listOf(
        methodCall(definingClass = "Landroid/view/ViewGroup;", name = "removeAllViews"),
        methodCall(definingClass = "Landroid/view/ViewGroup;", name = "addView"),
        methodCall(definingClass = "Landroid/view/View;", name = "requestLayout"),
        methodCall(definingClass = "Landroid/view/View;", name = "bringToFront"),
    ),
    custom = { method, _ -> method.implementation != null && isStatic(method.accessFlags) },
)

// VHSectionAd.bind(ad): the RecyclerView row of an ad slot in articles and the live EPG list.
// Since 1.1.16 AdMobManager.loadAd is inlined here: bind posts the request/put runnable on the
// row's container. The other (UIAd)V methods in the app are plain setters without a post.
internal val sectionAdBindFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(UI_AD),
    filters = listOf(methodCall(definingClass = "Landroid/view/View;", name = "post")),
    custom = { method, _ -> method.implementation != null },
)

// UiLivePreroll's enable getter: createPlayerInput adds the "Reclama" pre-roll item before a live
// channel only when it is true.
internal val uiLivePrerollEnableFingerprint = dataGetterFingerprint(UI_LIVE_PREROLL, "enable", "Z")

// ArticleApiPayloads.toString(): the class and its mVideoPreroll field are renamed and the getter
// is inlined, so the field is found as the one appended after ", mVideoPreroll=".
internal const val VIDEO_PREROLL_LABEL = ", mVideoPreroll="
internal val articleApiPayloadsToStringFingerprint = Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("ArticleApiPayloads(mId="),
        string(VIDEO_PREROLL_LABEL),
    ),
    custom = { method, _ -> method.implementation != null },
)

// ExtensionServiceKt.initImaAds(service) (the AdsConfiguration parameter is gone since 1.1.16):
// builds (once) and returns the IMA client-side ads loader, with ImaAdsLoader's default 10 s ad
// preload timeout. DefaultMediaSourceFactory's AdsLoader provider calls it and plays without ads
// when it answers null ("Playing media without ads, as no AdsLoader was provided."); PlayerService
// .onCreate ignores the result.
internal val initImaAdsFingerprint = Fingerprint(
    parameters = listOf(PLAYER_SERVICE),
    filters = listOf(
        methodCall(name = "getApplicationContext"),
        literal(10000),
    ),
    custom = { method, _ ->
        method.implementation != null && isStatic(method.accessFlags) && method.returnType.startsWith("L")
    },
)

// The four getters of the server's "ads" list (List<ApiAdsBanners>): articles, the EPG, listings
// and soccer results. Every reader handles an empty list.
internal const val API_AD_LIST_ARTICLE = "Lro/rcsrds/digisport/data/model/api/article/ApiArticleData;"
internal const val API_AD_LIST_EPG = "Lro/rcsrds/digisport/data/model/api/epg/ApiEpgData;"
internal const val API_AD_LIST_LISTING = "Lro/rcsrds/digisport/data/model/api/listingArticles/Data;"
internal const val API_AD_LIST_SOCCER = "Lro/rcsrds/digisport/data/model/api/soccer/APIResultsResponseData;"

internal val apiArticleDataAdsFingerprint = dataGetterFingerprint(API_AD_LIST_ARTICLE, "ads", "Ljava/util/List;")
internal val apiEpgDataAdsFingerprint = dataGetterFingerprint(API_AD_LIST_EPG, "ads", "Ljava/util/List;")
internal val listingDataAdsListFingerprint = dataGetterFingerprint(API_AD_LIST_LISTING, "adsList", "Ljava/util/List;")
internal val apiResultsResponseDataAdsFingerprint =
    dataGetterFingerprint(API_AD_LIST_SOCCER, "ads", "Ljava/util/ArrayList;")

// GetArticleDetailsLiveTab1.adConstraints(element) is inlined since 1.1.16 into the article body
// parser lambda: `hasAttr("data-slot") && !isBlank(attr("data-slot"))` decides whether an
// <ad-api> element becomes an ad section. This matches the hasAttr call and its move-result; the
// other "data-slot" user (parseAd) reads the attribute as a String.
internal val articleAdSlotCheckFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(
        string("data-slot"),
        methodCall(parameters = listOf("Ljava/lang/String;"), returnType = "Z", location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
    ),
    custom = { method, _ -> method.implementation != null },
)

// SyncEpgRepositoryBase.addBanner(ads, day, channel) (static since 1.1.16): inserts "ad" rows
// into the cached EPG days.
internal val syncEpgAddBannerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/util/List;", UI_EPG_CACHE_DAY, "Ljava/lang/String;"),
    filters = listOf(string("ad")),
    custom = { method, _ -> method.implementation != null && isStatic(method.accessFlags) },
)

// UiLiveDai's enable getter: true when the channel config carries an enabled IMA DAI balancer. It
// gates the DAI balancer request and the ssai:// DAI media item.
internal val uiLiveDaiEnableFingerprint = dataGetterFingerprint(UI_LIVE_DAI, "enable", "Z")

// ExtensionServiceKt.updateAdViewForDai(service): when the current item's "media_item_type" is
// "dai", re-creates the IMA DAI ads loader and media source for it.
internal val updateAdViewForDaiFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(PLAYER_SERVICE),
    filters = listOf(string("media_item_type"), string("dai")),
    custom = { method, _ -> method.implementation != null && isStatic(method.accessFlags) },
)
