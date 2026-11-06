package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object RatingOwnerFingerprint : Fingerprint(
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("biz_player.threshold_to_show_rate_dialog"),
        string("rate_dialog_enable"),
    ),
)

internal object RatingPresenterFingerprint : Fingerprint(
    classFingerprint = RatingOwnerFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(methodCall(smali = "Landroid/app/Dialog;->show()V")),
)

internal object DirectUnderPlayerAdFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lcom/biliintl/playdetail/page/paytip/mutex/",
    parameters = emptyList(),
    filters = listOf(
        methodCall(returnType = "Lcom/biliintl/play/model/view/ViewUnderPlayerAdCardMeta;"),
        string("create"),
        string("UnderPlayerStrategy"),
        methodCall(
            name = "<init>",
            parameters = listOf("Lcom/biliintl/play/model/view/ViewUnderPlayerAdCardMeta\$DirectAd;"),
            returnType = "V",
        ),
    ),
)

internal object SdkUnderPlayerAdFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lcom/biliintl/playdetail/page/paytip/mutex/",
    parameters = emptyList(),
    filters = listOf(
        methodCall(returnType = "Lcom/biliintl/play/model/view/ViewUnderPlayerAdCardMeta;"),
        string("create"),
        string("UnderPlayerStrategy"),
        string("使用SDK广告"),
    ),
)
