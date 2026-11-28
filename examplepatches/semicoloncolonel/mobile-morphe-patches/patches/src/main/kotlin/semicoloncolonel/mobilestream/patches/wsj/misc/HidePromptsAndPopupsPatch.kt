package semicoloncolonel.mobilestream.patches.wsj.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheet
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants

// The app's prompts and pop-ups, one option each. Each part is a dependency
// that runs only when its option is on.

// The welcome pop-up ("Welcome to the WSJ App", Learn More or Skip) starts the
// app's tooltip tour. WsjTooltipStrategy decides whether the tour runs
// (isTooltipFlowEnabled, needsToShow) and whether each step was seen. Saying
// the tour is off and every step was seen skips the pop-up and the tips.
private const val TOOLTIP_STRATEGY = "Lcom/dowjones/android/tooltip/WsjTooltipStrategy;"

internal object TooltipSeenFingerprint : Fingerprint(
    definingClass = TOOLTIP_STRATEGY,
    returnType = "Z",
    custom = { method, _ ->
        method.name in setOf("isTooltipFlowSeen", "isTooltipSeen", "isWelcomeDialogSeen")
    },
)

internal object TooltipTourOnFingerprint : Fingerprint(
    definingClass = TOOLTIP_STRATEGY,
    returnType = "Z",
    custom = { method, _ -> method.name in setOf("isTooltipFlowEnabled", "needsToShow") },
)

// Subscription offers. Purchases fail in a re-signed app, so these lead nowhere:
//   The sale strip under the section tabs ("Cyber Sale Live Now", Subscribe
//     Now), a Piano banner drawn by SectionBannerUi.
//   The Subscribe Now button on the profile (ProfileHeaderButton). Sign In
//     stays on the profile, so subscribers can still sign in.
// The store page that a paywalled article shows is left alone: the app has no
// article text in that state, so hiding it would leave an empty page.
internal object SectionBannerUiFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/paywall/piano/ui/SectionBannerUiKt;",
    name = "SectionBannerUi",
    returnType = "V",
)

// Compose records each function's name as a trace string, which survives
// obfuscation. 15.13.0 draws the button in ProfileHeaderButton. 15.12.0 draws
// it inline, so the signed-out header (InstallerHeaderUi), which holds only the
// button, is cut instead; there a free account keeps its button.
private const val PROFILE_HEADER = "com.dowjones.profile.ui.component."

private fun traceName(prefix: String) = { method: com.android.tools.smali.dexlib2.iface.Method, _: Any? ->
    method.implementation?.instructions?.any {
        (((it as? ReferenceInstruction)?.reference as? StringReference)?.string ?: "").startsWith(prefix)
    } == true
}

internal object ProfileSubscribeButtonFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/profile/ui/component/ProfileHeaderKt;",
    returnType = "V",
    custom = { method, classDef -> traceName("${PROFILE_HEADER}ProfileHeaderButton (")(method, classDef) },
)

internal object SignedOutProfileHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/profile/ui/component/ProfileHeaderKt;",
    returnType = "V",
    custom = { method, classDef -> traceName("${PROFILE_HEADER}InstallerHeaderUi (")(method, classDef) },
)

// The cookie dialog is a Sourcepoint message in a WebView. The app's Sourcepoint
// client shows it in onUIReady; CookieConsent then clicks its reject button
// while the dialog is invisible.
internal object ConsentUiReadyFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/consent/util/SourcePointUtil${'$'}LocalClient;",
    name = "onUIReady",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

// The app's web pages (the store page a paywalled article shows) carry the
// wsj.com cookie banner. WebViewFactory.create builds them; CookieConsent adds
// a script there that rejects inside the banner's frame.
internal object WebViewFactoryCreateFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/web2/ui/WebViewFactory;",
    name = "create",
    returnType = "Landroid/webkit/WebView;",
)

private const val COOKIE_CONSENT = "Lsemicoloncolonel/mobilestream/extension/wsj/CookieConsent;"

@Suppress("unused")
val hidePromptsAndPopupsPatch: BytecodePatch = bytecodePatch(
    name = "Hide prompts and pop-ups",
    description = "Hides the prompts and pop-ups you choose in the patch options.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(hideMarketingPopupsPatch)
    extendWith("extensions/extension.mpe")

    booleanOption(
        key = "rating",
        default = true,
        title = "Rating prompt",
        description = "Stops Google Play's rate-this-app sheet.",
    )
    booleanOption(
        key = "marketingPopUps",
        default = true,
        title = "Marketing pop-ups",
        description = "Stops in-app marketing pop-ups, but not the paywall.",
    )

    booleanOption(
        key = "welcomeAndTips",
        default = true,
        title = "Welcome pop-up and tips",
        description = "Skips the welcome pop-up and the feature tips that follow it.",
    )

    booleanOption(
        key = "subscriptionOffers",
        default = true,
        title = "Subscription offers",
        description = "Hides the sale banner at the top of the sections and the Subscribe Now button on the profile.",
    )

    booleanOption(
        key = "cookieConsent",
        default = true,
        title = "Cookie consent",
        description = "Answers the cookie pop-up with I Do Not Agree.",
    )

    execute {
        if (isOptionOn(hidePromptsAndPopupsPatch, "rating")) blockPlayReviewSheet()
        if (isOptionOn(hidePromptsAndPopupsPatch, "welcomeAndTips")) {
            fun answer(fingerprint: Fingerprint, expected: Int, value: Int) {
                val methods = fingerprint.matchAll()
                if (methods.size != expected) {
                    throw PatchException("Expected $expected tooltip checks, found ${methods.size}")
                }
                methods.forEach {
                    it.method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x$value
                            return v0
                        """.trimIndent(),
                    )
                }
            }
            answer(TooltipSeenFingerprint, 3, 1)
            answer(TooltipTourOnFingerprint, 2, 0)
        }
        if (isOptionOn(hidePromptsAndPopupsPatch, "cookieConsent")) {
            val method = ConsentUiReadyFingerprint.method
            val show = method.implementation!!.instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "showView"
            }
            if (show < 0) throw PatchException("Cookie dialog showView call not found")
            method.addInstruction(show + 1, "invoke-static { p1 }, $COOKIE_CONSENT->onShown(Landroid/view/View;)V")

            // Right after the app hands the new WebView to preloadWebViewConsent,
            // the WebView is that call's argument register.
            val create = WebViewFactoryCreateFingerprint.method
            val preload = create.implementation!!.instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "preloadWebViewConsent"
            }
            if (preload < 0) throw PatchException("WebView consent preload call not found")
            val webView = (create.implementation!!.instructions.elementAt(preload) as FiveRegisterInstruction).registerD
            create.addInstruction(preload + 1, "invoke-static { v$webView }, $COOKIE_CONSENT->onWebView(Landroid/webkit/WebView;)V")
        }
        if (isOptionOn(hidePromptsAndPopupsPatch, "subscriptionOffers")) {
            SectionBannerUiFingerprint.method.addInstructions(0, "return-void")
            val button = ProfileSubscribeButtonFingerprint.methodOrNull ?: SignedOutProfileHeaderFingerprint.method
            button.addInstructions(0, "return-void")
        }
    }
}
