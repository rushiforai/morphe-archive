package semicoloncolonel.mobilestream.patches.npr.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.npr.shared.Constants
import semicoloncolonel.mobilestream.patches.npr.shared.NPR_WEB_CLEANUP
import semicoloncolonel.mobilestream.patches.npr.shared.WebViewPageFingerprint

// NPR 7.10.0 opens stories and some modules as npr.org pages inside the app.
// Those pages show OneTrust's cookie banner. The banner is hidden, and once
// OneTrust loads, the page chooses Reject All, which turns off the
// performance, functional, targeting, social media, and data-sharing
// categories under the rule for your state. OneTrust saves the choice, so
// later pages do not ask again. Its cookie settings on npr.org still work.

@Suppress("unused")
val optOutOfDataSalePatch = bytecodePatch(
    name = "Opt out of data sale & sharing",
    description = "Rejects all optional cookies on the NPR web pages inside the app and hides the cookie banner.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        WebViewPageFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $NPR_WEB_CLEANUP->rejectCookies(Landroid/webkit/WebView;)V",
        )
    }
}
