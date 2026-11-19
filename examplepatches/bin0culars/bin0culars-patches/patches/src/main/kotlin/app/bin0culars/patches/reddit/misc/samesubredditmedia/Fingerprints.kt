package app.bin0culars.patches.reddit.misc.samesubredditmedia

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

object RecommendedMediaRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/reddit/domain/model/media/MediaContext;",
        "Ljava/lang/String;",
        "Lcom/reddit/domain/model/media/FbpMediaType;",
        "L",
        "Z",
        "Ljava/lang/String;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
    filters = listOf(
        methodCall(definingClass = "Lcom/reddit/domain/model/media/MediaContext;", name = "getSeedSubredditIds"),
        methodCall(definingClass = "Lcom/reddit/domain/model/media/MediaContext;", name = "getListingType"),
    ),
)

object RecommendedVideosRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/reddit/domain/model/media/MediaContext;",
        "L",
        "L",
        "Z",
        "Ljava/lang/String;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
    filters = listOf(
        methodCall(definingClass = "Lcom/reddit/domain/model/media/MediaContext;", name = "getSeedSubredditIds"),
        methodCall(definingClass = "Lcom/reddit/domain/model/media/MediaContext;", name = "getListingType"),
    ),
)
