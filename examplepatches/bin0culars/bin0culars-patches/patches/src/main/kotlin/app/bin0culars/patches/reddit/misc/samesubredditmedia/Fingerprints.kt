package app.bin0culars.patches.reddit.misc.samesubredditmedia

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

object RecommendedMediaRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(definingClass = "Lcom/reddit/domain/model/media/MediaContext;", name = "getSeedSubredditIds"),
        methodCall(definingClass = "Lcom/reddit/domain/model/media/MediaContext;", name = "getListingType"),
    ),
    custom = { method, _ ->
        val params = method.parameterTypes.map { it.toString() }
        params.size >= 4 &&
            params[1] == "Lcom/reddit/domain/model/media/MediaContext;" &&
            params.last() == "Lkotlin/coroutines/jvm/internal/ContinuationImpl;" &&
            params[3] == "Lcom/reddit/domain/model/media/FbpMediaType;"
    },
)

object RecommendedVideosRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(definingClass = "Lcom/reddit/domain/model/media/MediaContext;", name = "getSeedSubredditIds"),
        methodCall(definingClass = "Lcom/reddit/domain/model/media/MediaContext;", name = "getListingType"),
    ),
    custom = { method, _ ->
        val params = method.parameterTypes.map { it.toString() }
        params.size >= 2 &&
            params[1] == "Lcom/reddit/domain/model/media/MediaContext;" &&
            params.last() == "Lkotlin/coroutines/jvm/internal/ContinuationImpl;" &&
            params.none { it == "Lcom/reddit/domain/model/media/FbpMediaType;" }
    },
)
