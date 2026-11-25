package app.aliexpress.patches.analytics

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val ANALYTICS_MGR = "Lcom/alibaba/analytics/AnalyticsMgr;"

/** `AnalyticsMgr.setGlobalProperty(key, value)` — attaches a property to every UT event. */
internal object SetGlobalPropertyFingerprint : Fingerprint(
    definingClass = ANALYTICS_MGR,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("setGlobalProperty"),
)

/** `AnalyticsMgr.updateUserAccount(nick, userId, openId, site)` — tags UT events with the account. */
internal object UpdateUserAccountFingerprint : Fingerprint(
    definingClass = ANALYTICS_MGR,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("userNick", "userId", "openId"),
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops the Alibaba UT analytics SDK from attaching global properties and your " +
        "account identity (nick, user id, open id) to tracked events.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        // The SDK itself is left initialised: mtop and the security SDK read its device id, and
        // tearing it out is what broke the old "Remove ads" patch (see ads/RemoveAdsPatch.kt).
        SetGlobalPropertyFingerprint.method.addInstructions(0, "return-void")
        UpdateUserAccountFingerprint.method.addInstructions(0, "return-void")
    }
}
