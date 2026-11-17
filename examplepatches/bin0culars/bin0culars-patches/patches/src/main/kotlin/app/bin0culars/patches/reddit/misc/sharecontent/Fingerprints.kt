package app.bin0culars.patches.reddit.misc.sharecontent

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

object ShareSubjectFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lcom/reddit/sharing/custom/ShareableData;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/reddit/domain/model/Link;",
            name = "getSubredditNamePrefixed",
        ),
        string("] "),
    ),
)

object ShareAppTargetFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "L",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/reddit/sharing/analytics/OsChooserShareContext;",
            name = "<init>",
        ),
        methodCall(
            parameters = listOf(
                "L",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Landroid/net/Uri;",
                "Lcom/reddit/sharing/analytics/OsChooserShareContext;",
            ),
            returnType = "Landroid/content/Intent;",
        ),
        methodCall(
            parameters = listOf(
                "Landroid/content/Context;",
                "Landroid/content/Intent;",
                "Ljava/lang/String;",
            ),
            returnType = "V",
        ),
    ),
)
