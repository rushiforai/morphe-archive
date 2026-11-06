package id.ikuradachi.patches.bstation.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object CommentTabInstallFingerprint : Fingerprint(
    definingClass = "Lcom/biliintl/playdetail/page/tabs/TabHostPageService;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lcom/biliintl/playdetail/page/tabs/TabSlot;", "L", "L"),
    filters = listOf(methodCall(
        definingClass = "Lcom/biliintl/playdetail/fundation/utils/InstallPoint;",
        name = "install",
    )),
)

internal object CommentPanelOpenFingerprint : Fingerprint(
    definingClass = "Lcom/biliintl/playdetail/page/tabs/comment/CommentTabService;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/biliintl/bstarcomm/comment/CommentContext;", "J"),
)

internal object DanmakuVisibleRpcFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        newInstance("Ltv/danmaku/biliplayer/service/interact/biz/chronos/chronosrpc/methods/send/DanmakuVisibleChange\$Request;"),
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "valueOf", parameters = listOf("Z")),
        methodCall(
            definingClass = "Ltv/danmaku/biliplayer/service/interact/biz/chronos/chronosrpc/methods/send/DanmakuVisibleChange\$Request;",
            name = "setEnabled",
        ),
    ),
)

internal object DanmakuVisibilityInterfaceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
    returnType = "V",
    parameters = listOf("L", "Z", "Z", "I", "Ljava/lang/Object;"),
    filters = listOf(string("Super calls with default arguments not supported in this target, function: setDanmakuVisible")),
)

internal object DanmakuSendFingerprint : Fingerprint(
    definingClass = "Ltv/danmaku/biliplayer/utils/DanmakuSendHelper;",
    name = "sendDanmaku",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L", "Landroid/content/Context;", "Ljava/lang/String;", "I", "I", "I"),
    filters = listOf(string("\r"), string("\n")),
)

internal object DanmakuSendWidgetFingerprint : Fingerprint(
    definingClass = "Lcom/biliintl/playdetail/page/player/panel/widget/control/PlayerDanmakuSendWidget;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Landroid/widget/TextView;", name = "setHint"),
        methodCall(definingClass = "Landroid/widget/TextView;", name = "setOnClickListener"),
        methodCall(definingClass = "Landroid/widget/TextView;", name = "setVisibility"),
    ),
)
