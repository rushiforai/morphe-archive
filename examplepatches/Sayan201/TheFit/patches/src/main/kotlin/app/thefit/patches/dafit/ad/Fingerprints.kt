package app.thefit.patches.dafit.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches `BandExtendProvider.getExtendList()Ljava/util/List;` which loads `ExtendMenuModel`
 * ad and promotional entries from `BandConfig.getExtendMenu()`.
 * Present in both v2.8.4 and v2.9.25+.
 */
internal object BandExtendListFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/model/band/provider/BandExtendProvider;",
    name = "getExtendList",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/List;",
    parameters = emptyList()
)

/**
 * v2.9.25+: Centralized AdConfig manager (`Lcom/crrepa/band/my/ad/a;`) boolean and lifecycle methods.
 */
internal object AdConfigIsShowAdFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "isShowAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList()
)

internal object AdConfigShowOpenAdFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "showOpenAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList()
)

internal object AdConfigShowColdOpenAdFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "showColdOpenAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList()
)

internal object AdConfigShowDeviceBannerFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "showDeviceBannerAD",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList()
)

internal object AdConfigShowTodayBannerFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "showTodayBannerAD",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList()
)

internal object AdConfigShowWatchFaceBannerFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "showWatchFaceBannerAD",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList()
)

internal object AdConfigUseAdquantaFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "useAdquantaSdk",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList()
)

internal object AdConfigPrepareOpenAdFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "prepareOpenAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList()
)

internal object AdConfigUpdateConfigFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/a;",
    name = "updateConfig",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList()
)

/**
 * v2.9.25+: Google MobileAds & mediation initialization manager (`Lcom/crrepa/band/my/ad/AdInitializationManager;`).
 */
internal object AdInitializationCanLoadFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/AdInitializationManager;",
    name = "canLoadGoogleAds",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;")
)

internal object AdInitializationInitFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/AdInitializationManager;",
    name = "initialize",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object AdInitializationDelayFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/AdInitializationManager;",
    name = "initializeAfterDelay",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "J")
)

internal object AdInitializationStartMobileAdsFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/ad/AdInitializationManager;",
    name = "startMobileAds",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = emptyList()
)

/**
 * v2.9.25+: UI ad rendering methods across Device Settings, Today Health tab, and Watch Face Store.
 */
internal object BandSettingRenderAdViewFingerprint : Fingerprint(
    name = "renderAdView",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/squareup/picasso/RequestCreator;", "Ljava/lang/String;")
)

internal object BandSettingRenderGoogleAdViewFingerprint : Fingerprint(
    name = "renderGoogleAdView",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Z")
)

internal object BandTodayRenderAdViewFingerprint : Fingerprint(
    name = "renderAdView",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Z")
)

internal object StoreWatchFaceRenderAdViewFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/device/watchface/StoreWatchFaceDetailActivity;",
    name = "renderAdView",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList()
)

/**
 * v2.8.4: Matches the `BandSettingFragment` presenter method (`La8/a;->d()V`) that iterates over
 * `BandExtendProvider.getExtendList()`, checks for `ExtendMenuModel.AD` (`type == 4`),
 * downloads the ad banner via Picasso, and invokes the view callback.
 */
internal object BandSettingPresenterAdFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = "Lcom/crrepa/band/my/model/band/provider/BandExtendProvider;",
            name = "getExtendList"
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lcom/crrepa/band/my/model/ExtendMenuModel;",
            name = "getType"
        )
    )
)

/**
 * v2.8.4: Matches `BandSettingFragment->X(Lcom/squareup/picasso/t;Ljava/lang/String;)V` which sets
 * `ivAdPreview.setVisibility(View.VISIBLE)` and attaches the ad URL click listener.
 */
internal object BandSettingShowAdFingerprint : Fingerprint(
    definingClass = "Lcom/crrepa/band/my/home/device/BandSettingFragment;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("L", "Ljava/lang/String;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            smali = "Lcom/crrepa/band/my/home/device/BandSettingFragment;->ivAdPreview:Landroid/widget/ImageView;"
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Landroid/widget/ImageView;",
            name = "setVisibility"
        )
    )
)
