package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object ColdSplashAdUnitFingerprint : Fingerprint(
    definingClass = "Ltv/danmaku/bili/ui/splash/helper/MainSplashHelper;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/biliintl/bstarcomm/ads/bean/ThirdAdUnitId;",
    parameters = listOf(),
    filters = listOf(
        string("tp_pref_key_show_ad"),
        string("tp_pref_key_splash_cold_ad_id"),
    ),
)

object SplashLoadTimeoutFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "J",
    parameters = listOf(),
    filters = listOf(
        string("total_pref_key_splash_load_millisecond"),
    ),
)

object InnerPushFingerprint : Fingerprint(
    definingClass = "Lcom/bilibili/bangumi/inner_push/AppInnerPushManagerV2;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("[InnerPush]AppInnerPushManagerV2"),
        string("tryShowInnerPush, prevJobShowing"),
    ),
)

object HomeFloatViewInfoIsValidFingerprint : Fingerprint(
    definingClass = "Lcom/bilibili/pegasus/api/modelv2/HomeFloatViewInfo;",
    name = "isValid",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(smali = "Lcom/bilibili/pegasus/api/modelv2/HomeFloatViewInfo;->cover:Ljava/lang/String;"),
        fieldAccess(smali = "Lcom/bilibili/pegasus/api/modelv2/HomeFloatViewInfo;->id:Ljava/lang/String;"),
    ),
)
