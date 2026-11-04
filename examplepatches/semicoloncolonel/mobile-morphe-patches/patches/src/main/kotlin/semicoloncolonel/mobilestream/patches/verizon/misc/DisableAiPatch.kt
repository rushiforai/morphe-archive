package semicoloncolonel.mobilestream.patches.verizon.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.verizon.shared.Constants

// My Verizon 22.2.5 has an AI assistant ("VzGpt") with a voice mode, behind
// a floating button. Each page's server response carries an
// UpdateVoiceBotAction whose isEnabled() decides whether that button shows;
// it now always reads false, so the button and its panel stay hidden. Pages
// can also open the assistant directly, through
// BaseActivity.dispatchGptSendMessageAction() or the controller method that
// checks "isVzGptEnabled" before opening the assistant's welcome screen.
// Both now return at once.
//
// The panel's chat shortcut goes with it. Support chat is still reachable
// from the app's Support pages.

private const val BASE_ACTIVITY = "Lcom/vzw/mobilefirst/commons/views/activities/BaseActivity;"

internal object VoiceBotEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/vzw/mobilefirst/core/models/UpdateVoiceBotAction;",
    name = "isEnabled",
    parameters = listOf(),
    returnType = "Ljava/lang/Boolean;",
)

internal object DispatchGptMessageFingerprint : Fingerprint(
    definingClass = BASE_ACTIVITY,
    name = "dispatchGptSendMessageAction",
    returnType = "V",
)

internal object ShowVzGptFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("isVzGptEnabled", "universalAssistantMetaData"),
)

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Hides Verizon's AI assistant, its voice mode, and the floating button that opens them. " +
        "Experimental.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        VoiceBotEnabledFingerprint.method.returnEarly(
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """,
        )
        DispatchGptMessageFingerprint.method.returnEarly("return-void")
        ShowVzGptFingerprint.method.returnEarly("return-void")
    }
}
