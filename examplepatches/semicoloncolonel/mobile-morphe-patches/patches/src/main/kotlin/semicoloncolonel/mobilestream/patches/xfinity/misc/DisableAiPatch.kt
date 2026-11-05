package semicoloncolonel.mobilestream.patches.xfinity.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.xfinity.shared.Constants

// Xfinity 6.14.0-2 shows the Xfinity Assistant chat only when the user's
// feature set enables it. The feature check now reports it as off.

internal object XfinityAssistantEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/xfinity/digitalhome/manager/UserFeatureManager;",
    name = "getXfinityAssistantEnabled",
    parameters = listOf(),
    returnType = "Z",
)

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off the Xfinity Assistant chat.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        XfinityAssistantEnabledFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}
