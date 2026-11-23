package app.bin0culars.patches.reddit.layout.hidepost

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import com.android.tools.smali.dexlib2.AccessFlags

object LoggedInPostMenuFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        newInstance("Lcom/reddit/feeds/impl/ui/RedditOverflowMenuProvider\$buildLoggedInMenu\$1;"),
        methodCall(
            parameters = listOf("Lcom/reddit/feeds/data/FeedType;"),
            returnType = "Z",
        ),
    ),
)
