package semicoloncolonel.mobilestream.patches.dealseek.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// DealSeek 1.64.0 — Hide editor articles.
//
// A deal page shows a "From our editors" card above the store button, which
// links to DealSeek's own articles about the product. In the Hermes bundle,
// ProductEditorialsButton draws that card and the sheet it opens, and
// ProductEditorials draws the same articles as a list. Both now render
// nothing.
// ─────────────────────────────────────────────────────────────────────────────

private val hideEditorArticlesInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("ProductEditorialsButton", HermesBundle.Value.NULL)
        bundle.returnAtStart("ProductEditorials", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hideEditorArticlesPatch = resourcePatch(
    name = "Hide editor articles",
    description = "Removes the \"From our editors\" card from deal pages.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hideEditorArticlesInBundlePatch, disableExpoUpdatesPatch)
}
