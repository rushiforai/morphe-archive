package app.morphe.patches.vix.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val LURA_PLAYER_DESCRIPTOR = "Lcom/akta/luraplayer/api/LuraPlayer;"
internal const val LURA_AD_DESCRIPTOR = "Lcom/akta/luraplayer/api/data/ad/LuraAd;"
internal const val LURA_ADS_CONFIG_DESCRIPTOR = "Lcom/akta/luraplayer/api/configs/ads/LuraAdsConfiguration;"
internal const val LURA_GENERIC_CONFIG_DESCRIPTOR = "Lcom/akta/luraplayer/api/configs/ads/LuraGenericConfiguration;"
internal const val LURA_SERVER_SIDE_CONFIG_DESCRIPTOR = "Lcom/akta/luraplayer/api/configs/ads/LuraServerSideConfiguration;"
internal const val VIDEO_ITEM_DESCRIPTOR = "Lcom/univision/descarga/presentation/models/video/h0;"

internal object LuraGenericBreaksFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = LURA_GENERIC_CONFIG_DESCRIPTOR,
    parameters = listOf(VIDEO_ITEM_DESCRIPTOR),
    filters = listOf(
        string("Preroll url %s"),
        string("preroll"),
    ),
)

internal object LuraServerSideConfigFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = LURA_SERVER_SIDE_CONFIG_DESCRIPTOR,
    parameters = emptyList(),
    filters = listOf(
        string("gam"),
        string("lura"),
        string("pod-serve"),
    ),
)

internal object LuraPauseAdGateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("com.google.android.tv"),
        methodCall(definingClass = "Landroid/content/pm/PackageManager;", name = "hasSystemFeature"),
    ),
    custom = { _, classDef ->
        classDef.methods.any { it.returnType == LURA_SERVER_SIDE_CONFIG_DESCRIPTOR }
    },
)

internal object LuraPauseAndPrerollParserFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(VIDEO_ITEM_DESCRIPTOR),
    filters = listOf(
        string("dfp_cust_params"),
        string("APS stream change -> re-baseline item=%s programId=%s (no refresh)"),
    ),
)

internal object LuraConfigUtilsAdsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = LURA_ADS_CONFIG_DESCRIPTOR,
    filters = listOf(
        string("https://pubads.g.doubleclick.net/gampad/ads?", comparison = StringComparisonType.STARTS_WITH),
        string("pod-serve"),
    ),
)

internal object ImaAdTagUriBuilderFingerprint : Fingerprint(
    definingClass = "Lcom/univision/descarga/videoplayer/AdsWrapper;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("country"),
    ),
)

internal object AktaOnAdStartedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(LURA_AD_DESCRIPTOR),
    filters = listOf(
        methodCall(definingClass = "Lcom/akta/luraplayer/api/data/ad/LuraAdBreak;", name = "getTotalAds"),
        methodCall(definingClass = LURA_AD_DESCRIPTOR, name = "getSkipOffset"),
    ),
)

internal object BrazeDisplayInAppMessageFingerprint : Fingerprint(
    definingClass = "Lcom/braze/ui/inappmessage/BrazeInAppMessageManager;",
    name = "displayInAppMessage",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lcom/braze/models/inappmessage/IInAppMessage;", "Z", "L"),
)
