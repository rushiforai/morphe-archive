package app.morphe.patches.reddit.banner

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object HomePermanentBanBannerFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lip1/c;",
            name = "j",
            parameters = listOf("L"),
            returnType = "Ljava/lang/String;",
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC_RANGE,
            definingClass = "Lm22/e;",
            name = "i",
            parameters = listOf("I", "I", "L", "L", "Ljava/lang/String;", "L", "Z"),
            returnType = "V",
        )
    )
)

internal object InboxPermanentBanBannerFingerprint : Fingerprint(
    returnType = "Landroid/view/View;",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lip1/c;",
            name = "j",
            parameters = listOf("L"),
            returnType = "Ljava/lang/String;",
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lcom/reddit/screen/RedditComposeView;",
            name = "setContent",
            parameters = listOf("L"),
            returnType = "V",
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lcom/reddit/notification/impl/ui/pager/InboxTabPagerScreen;",
            name = "B5",
            returnType = "Lcom/reddit/screen/widget/ScreenPager;",
        )
    )
)
