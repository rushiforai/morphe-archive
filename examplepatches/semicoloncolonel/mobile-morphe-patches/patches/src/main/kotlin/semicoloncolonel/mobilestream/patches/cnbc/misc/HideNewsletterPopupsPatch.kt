package semicoloncolonel.mobilestream.patches.cnbc.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnbc.shared.ARTICLE_CLEANUP
import semicoloncolonel.mobilestream.patches.cnbc.shared.ArticlePageFinishedFingerprint
import semicoloncolonel.mobilestream.patches.cnbc.shared.Constants

// CNBC 8.8.2. Articles are cnbc.com pages in a WebView, and the page slides
// in a bar asking for an email address, such as the "CNBC Spotlight
// Newsletter". When a page finishes loading, ArticleCleanup adds a script
// that hides every box pinned to the screen that holds an email field, now
// and whenever the page adds one later.

@Suppress("unused")
val hideNewsletterPopupsPatch = bytecodePatch(
    name = "Hide newsletter pop-ups",
    description = "Hides the newsletter sign-up bars that ask for your email address in articles.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        ArticlePageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $ARTICLE_CLEANUP->hideNewsletters(Landroid/webkit/WebView;)V",
        )
    }
}
