package semicoloncolonel.mobilestream.patches.aljazeera.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import semicoloncolonel.mobilestream.patches.aljazeera.shared.Constants

// Al Jazeera 12.2.0 shows OneTrust's cookie banner through OneTrust's React
// Native module. When the SDK has downloaded its settings, and the banner is
// due, OneTrustConsent now saves "Reject all" and switches the Functional
// category back on, so the banner is no longer due. Functional stays on
// because the app needs it for embedded posts, such as those from X.
//
// This runs on the download itself because the app asks for the banner from
// its ad code: with Skip ads on, it would never ask, and the consent would
// stay unanswered. shouldShowBanner and showBannerUI also answer first, for a
// banner the app asks for before the download. Privacy Preferences under
// Profile > Settings are unchanged.

private const val ONETRUST = "Lcom/onetrust/OneTrust;"
private const val SDK = "Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;"
private const val PROMISE = "Lcom/facebook/react/bridge/Promise;"
private const val SHOULD_SHOW =
    "Lsemicoloncolonel/mobilestream/extension/aljazeera/OneTrustConsent;->shouldShowBanner(Ljava/lang/Object;Ljava/lang/Object;)V"
private const val ANSWER =
    "Lsemicoloncolonel/mobilestream/extension/aljazeera/OneTrustConsent;->answerBanner(Ljava/lang/Object;)Z"

// The callback startSDK passes to the SDK, the only OTCallback in the module.
internal object SdkDownloadedFingerprint : Fingerprint(
    name = "onSuccess",
    parameters = listOf("Lcom/onetrust/otpublishers/headless/Public/Response/OTResponse;"),
    returnType = "V",
    custom = { method, _ -> method.definingClass.startsWith("Lcom/onetrust/OneTrust$") },
)

internal object ShouldShowBannerFingerprint : Fingerprint(
    definingClass = ONETRUST,
    name = "shouldShowBanner",
    parameters = listOf(PROMISE),
    returnType = "V",
)

internal object ShowBannerUiFingerprint : Fingerprint(
    definingClass = ONETRUST,
    name = "showBannerUI",
    returnType = "V",
)

@Suppress("unused")
val skipCookieSettingsPatch = bytecodePatch(
    name = "Skip cookie settings",
    description = "Rejects the optional cookies without showing the cookie banner, and keeps functional " +
        "cookies on so embedded posts still load.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        SdkDownloadedFingerprint.method.apply {
            addInstructions(
                0,
                """
                    iget-object v0, p0, $definingClass->this${'$'}0:$ONETRUST
                    iget-object v0, v0, $ONETRUST->ot:$SDK
                    invoke-static { v0 }, $ANSWER
                """,
            )
        }
        // shouldShowBanner has no registers of its own, so the extension
        // does all of it and resolves the promise.
        ShouldShowBannerFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $SHOULD_SHOW\nreturn-void",
        )
        ShowBannerUiFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, $ONETRUST->ot:$SDK
                    invoke-static { v0 }, $ANSWER
                    move-result v0
                    if-eqz v0, :msp_orig
                    return-void
                """,
                ExternalLabel("msp_orig", getInstruction(0)),
            )
        }
    }
}
