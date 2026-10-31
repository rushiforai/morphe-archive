package app.nelsonator.patches.reddit.layout.banner

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Composable that renders the suspended/locked account banner
 * ("Check your inbox for a message with more information") using the
 * design-system Danger banner appearance. Called from the Home pager and Inbox screens.
 */
object SuspendedAccountBannerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "I",
        "I",
        "L",
        "L",
        "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function1;",
        "Z"
    ),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/reddit/ui/compose/ds/BannerAppearance;",
            name = "Danger"
        )
    )
)
