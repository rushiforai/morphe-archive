package semicoloncolonel.mobilestream.patches.wsj.misc

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.disableAirshipInAppMessages

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

// The CandyBar is the app's own campaign sheet ("Welcome to the WSJ App", sale
// offers) over the bottom of the feed. CandyBarManager.showCandyBar publishes it
// to the UI state; returning first leaves the state empty, so nothing shows.
internal object ShowCandyBarFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/candybar/CandyBarManager;",
    name = "access${'$'}showCandyBar",
    returnType = "V",
)

// Part of hidePromptsAndPopupsPatch: runs only when its "marketingPopUps" option is on.
internal val hideMarketingPopupsPatch = bytecodePatch {
    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "marketingPopUps")) return@execute
        BrazeBeforeDisplayFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lcom/braze/ui/inappmessage/InAppMessageOperation;->DISCARD:Lcom/braze/ui/inappmessage/InAppMessageOperation;
                return-object p0
            """.trimIndent(),
        )

        disableAirshipInAppMessages()

        ShowCandyBarFingerprint.method.addInstructions(0, "return-void")
    }
}
