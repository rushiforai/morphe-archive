package app.mix.patches.reddit.sync.discussions

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val OLD_PATH = "submit.json?url="

// The "Other discussions" request URL builder uses the broken
// submit.json?url= endpoint. Rewrite the base URL to oauth.reddit.com
// and the path to search.json?q=url: with the query syntax.
internal object OtherDiscussionsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "L",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    strings = listOf(
        OLD_PATH,
        "&limit=25",
    ),
)
