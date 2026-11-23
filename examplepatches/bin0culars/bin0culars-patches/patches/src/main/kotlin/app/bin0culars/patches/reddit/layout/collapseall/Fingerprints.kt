package app.bin0culars.patches.reddit.layout.collapseall

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/CollapseAllPatch;"

object PostActionBarFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "L",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function0;",
        "L",
        "L",
        "I",
    ),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "action_repost_on_reddit"),
    ),
)

object ActionBarButtonsFingerprint : Fingerprint(
    name = "<clinit>",
    filters = listOf(
        string("actionBar_comment_button"),
    ),
)

object CollapseCommentOpFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("CollapseComment(kindWithId="),
    ),
)

object ExpandCommentOpFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("ExpandComment(kindWithId="),
    ),
)

object CommentClickHandlerFingerprint : Fingerprint(
    filters = listOf(
        newInstance("Lcom/reddit/comments/events/handler/OnClickCommentEventHandler\$handle\$1;"),
        methodCall(definingClass = "Lcom/reddit/domain/model/Comment;", name = "getCollapsed"),
    ),
)

object LaunchFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(
        "L",
        "Lkotlin/coroutines/CoroutineContext;",
        "Lkotlinx/coroutines/CoroutineStart;",
        "Lkotlin/jvm/functions/Function2;",
        "I",
    ),
    returnType = "L",
)
