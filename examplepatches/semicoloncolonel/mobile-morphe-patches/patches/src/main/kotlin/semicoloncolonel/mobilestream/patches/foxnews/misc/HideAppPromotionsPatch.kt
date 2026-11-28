package semicoloncolonel.mobilestream.patches.foxnews.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants
import semicoloncolonel.mobilestream.patches.foxnews.shared.filterArticleComponents

// ─────────────────────────────────────────────────────────────────────────────
// Fox News 5.51.0 — Hide app promotions.
//
// Many articles carry a paragraph such as "CLICK HERE TO DOWNLOAD THE FOX
// NEWS APP", a TextComponent that links to the app's own store page. A
// paragraph of at most 120 characters that asks the reader to download or get
// the Fox News app is left out of the article. Longer paragraphs that mention
// the app are article text and stay.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val hideAppPromotionsPatch = bytecodePatch(
    name = "Hide app promotions",
    description = "Removes the \"Download the Fox News app\" links from articles.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        filterArticleComponents("withoutAppPromotions")
    }
}
