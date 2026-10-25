package app.template.patches.digisport.layout

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionsWithLabelsChecked

// A sponsored article carries a non-blank ApiArticle.sponsored text (a nullable String, read
// null-safely here; listing titles show it as a label). Only the listing and widget cards are
// removed; the article header code that also reads it is untouched.
@Suppress("unused")
val hideSponsoredArticlesPatch = bytecodePatch(
    name = "Hide sponsored articles",
    description = "Hides sponsored articles.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        // 1. Listings: a sponsored article is skipped before its separator lines and card are
        // added. (.locals 4, so v0 is free and p1 fits a 4-bit register.)
        ParseListingArticlesFingerprint.method.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-virtual {p1}, $API_ARTICLE->getSponsored()Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :not_sponsored
                invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z
                move-result v0
                if-nez v0, :not_sponsored
                return-void
                :not_sponsored
                nop
            """,
        )

        // 2. Article widgets: a sponsored card becomes a plain spacing section (the caller adds
        // the result unconditionally). addArticleWidget has .locals 29, so p2 needs a range
        // invoke. "Hide promotions" adds its own self-contained check at the same index; either
        // order works, because each check only returns or falls through.
        AddArticleWidgetFingerprint.method.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-virtual/range {p2 .. p2}, $API_ARTICLE->getSponsored()Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :not_sponsored
                invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z
                move-result v0
                if-nez v0, :not_sponsored
                invoke-static {}, $PARSING_EXTENSIONS->getSpacing()$ARTICLE_SECTION
                move-result-object v0
                return-object v0
                :not_sponsored
                nop
            """,
        )
    }
}
