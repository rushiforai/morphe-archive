package semicoloncolonel.mobilestream.patches.wsj.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.disableAirshipInAppMessages
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants

// WSJ phone 15.12.0 shows marketing pop-ups from two SDKs:
//
//   Braze — DJApplication registers its own in-app message listener (an
//     anonymous IInAppMessageManagerListener, DJApplication$onCreate$7).
//     Braze asks it, through beforeInAppMessageDisplayed, whether to show
//     each message. Returning Braze's own DISCARD drops every message.
//   Airship — in-app messages and automations; see AirshipInAppMessages.kt.
//
// The paywall (com.dowjones.paywall: subscribe and log-in screens, video
// gate) is a separate Compose flow and is not touched.
internal object BrazeBeforeDisplayFingerprint : Fingerprint(
    name = "beforeInAppMessageDisplayed",
    returnType = "Lcom/braze/ui/inappmessage/InAppMessageOperation;",
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/dowjones/") &&
            classDef.interfaces.contains("Lcom/braze/ui/inappmessage/listeners/IInAppMessageManagerListener;")
    },
)

@Suppress("unused")
val hideMarketingPopupsPatch = bytecodePatch(
    name = "Hide marketing pop-ups",
    description = "Stops the Wall Street Journal phone app from showing in-app marketing " +
        "pop-ups, such as subscription offers. The paywall itself is not changed, and push " +
        "notifications still work. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        BrazeBeforeDisplayFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lcom/braze/ui/inappmessage/InAppMessageOperation;->DISCARD:Lcom/braze/ui/inappmessage/InAppMessageOperation;
                return-object p0
            """.trimIndent(),
        )

        disableAirshipInAppMessages()
    }
}
