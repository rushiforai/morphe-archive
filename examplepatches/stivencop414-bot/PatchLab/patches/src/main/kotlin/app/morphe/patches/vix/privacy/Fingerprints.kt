package app.morphe.patches.vix.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val NEW_RELIC_DESCRIPTOR = "Lcom/newrelic/agent/android/NewRelic;"
internal const val PERMUTIVE_DESCRIPTOR = "Lcom/permutive/android/Permutive;"
internal const val APPSFLYER_LIB_DESCRIPTOR = "Lcom/appsflyer/AppsFlyerLib;"
internal const val PAL_CONFIG_DESCRIPTOR = "Lcom/akta/luraplayer/api/configs/plugins/PalConfiguration;"
internal const val CONVIVA_CONFIG_DESCRIPTOR = "Lcom/akta/luraplayer/api/configs/plugins/ConvivaConfiguration;"
internal const val SERVER_SIDE_CONFIG_DESCRIPTOR = "Lcom/akta/luraplayer/api/configs/ads/LuraServerSideConfiguration;"

internal object NewRelicStartFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = NEW_RELIC_DESCRIPTOR, name = "withApplicationToken"),
        methodCall(definingClass = NEW_RELIC_DESCRIPTOR, name = "start"),
    ),
)

internal object PermutiveInitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = PERMUTIVE_DESCRIPTOR, name = "<init>"),
    ),
)

internal object AppsFlyerStartFingerprint : Fingerprint(
    name = "invokeSuspend",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(definingClass = APPSFLYER_LIB_DESCRIPTOR, name = "getInstance"),
        string("af_push_link"),
        methodCall(definingClass = APPSFLYER_LIB_DESCRIPTOR, name = "start"),
    ),
)

internal object PalPluginSelectorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = PAL_CONFIG_DESCRIPTOR,
    parameters = emptyList(),
    custom = { _, classDef ->
        classDef.methods.any { it.returnType == SERVER_SIDE_CONFIG_DESCRIPTOR }
    },
)

internal object ConvivaConfigInitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = CONVIVA_CONFIG_DESCRIPTOR,
    filters = listOf(
        methodCall(definingClass = CONVIVA_CONFIG_DESCRIPTOR, name = "<init>"),
        methodCall(definingClass = CONVIVA_CONFIG_DESCRIPTOR, name = "getContentInfo"),
    ),
)

internal object ConvivaAssetConfigFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("Conviva.assetName"),
        methodCall(definingClass = CONVIVA_CONFIG_DESCRIPTOR, name = "<init>"),
    ),
)

internal object FireOsAdvertisingIdCollectorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("Not collecting advertising ID because limit_ad_tracking (Amazon Fire OS) is true."),
        string(" Error getting the advertising ID"),
    ),
)

internal object OneTrustInitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/univision/descarga/domain/delegates/b;",
        "Lkotlin/jvm/functions/Function0;",
    ),
    filters = listOf(
        string("OneTrust init started"),
        methodCall(
            definingClass = "Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;",
            name = "startSDK",
        ),
    ),
)
