package app.riky.patches.capcut

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object VegaSubscribeIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

internal object PayVipIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/editor/proxy/PayVipImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

internal object UserInfoServiceVipStateFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/clipmonetize/biz/userinfoapi/UserInfoServiceServiceImpl;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/lemon/lv/clipmonetize/data/VipState;",
    parameters = listOf(),
)

internal object SubscribeFacadeIsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/account/api/subscribe/SubscribeFacade;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
)

internal object WatermarkTrailerConfigInitFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/config/WatermarkTrailerConfig;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Z", "Z"),
)

internal object JniToastShowApkErrorFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/baseui/JniToast;",
    name = "showApkError",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object JniToastShowApkErrorRunnableFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/baseui/JniToast${'$'}1;",
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
)
