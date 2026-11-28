package semicoloncolonel.mobilestream.patches.nikkeiasia.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nikkeiasia.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Nikkei Asia (build 8a14774d) sends usage to Firebase Analytics, AppsFlyer,
// Nikkei's own Atlas (astat.nikkei.com), and the Facebook SDK. The web app's
// requests go through Capacitor's native HTTP, which the shared blocklist
// covers; scripts the page loads itself, such as the Facebook SDK, are
// checked in Capacitor's WebViewClient.
//
// Not touched: Piano, which handles sign-in and subscriptions.
// ─────────────────────────────────────────────────────────────────────────────

internal object BridgeInterceptRequestFingerprint : Fingerprint(
    definingClass = "Lcom/getcapacitor/BridgeWebViewClient;",
    name = "shouldInterceptRequest",
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        blockTrackers()
        blockTrackersAtDns()

        // The method has no locals. It never reads its WebView parameter, so p1
        // holds the blocker's answer.
        BridgeInterceptRequestFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p2 }, $TRACKER_BLOCKER->blockWebRequest(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                    move-result-object p1
                    if-eqz p1, :msp_orig
                    return-object p1
                """.trimIndent(),
                ExternalLabel("msp_orig", getInstruction(0)),
            )
        }
    }
}
