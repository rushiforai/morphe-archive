package id.ikuradachi.patches.bstation.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object HomeContentAcceptanceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L", "Lcom/bilibili/pegasus/api/model/BasicIndexItem;"),
    filters = listOf(methodCall(definingClass = "Lcom/bilibili/pegasus/api/model/BasicIndexItem;", name = "hasError", returnType = "Z")),
)

internal object SearchContentResponseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lcom/bilibili/search/api/model/SearchResultAll;",
    parameters = listOf("Lcom/bapis/bilibili/intl/app/interfaces/v1/SearchResp;", "Ljava/lang/String;", "J"),
    filters = listOf(
        methodCall(definingClass = "Lcom/bapis/bilibili/intl/app/interfaces/v1/SearchResp;", name = "getModulesList"),
        string("rect_banner_ad"), string("uploader"), string("audio_room"),
    ),
)

internal object PlayerContentResponseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/Map;", "L"),
    filters = listOf(checkCast("Lcom/biliintl/play/model/recommend/RecommendResponse;"), string("100"), string("[Debug]相关推荐接口报错")),
)

internal object HistoryPresentationFingerprint : Fingerprint(
    definingClass = "Lcom/bilibili/app/history/model/HistoryRawReplyX\$HistoryGroupRaw;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Z"),
    filters = listOf(
        fieldAccess(name = "cards"), methodCall(definingClass = "Ljava/util/List;", name = "isEmpty"),
        fieldAccess(definingClass = "Lcom/bilibili/app/history/model/HistoryRawReplyX\$HistoryRawItem;", name = "groupName"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "addAll"),
    ),
)
