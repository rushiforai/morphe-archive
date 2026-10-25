package app.template.patches.digisport.layout

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionsWithLabelsChecked

// ArticleConstants.KEY_WIDGET_CROSS: the widget type of the cross-promotion block that lists
// articles from sister RCS&RDS apps and sites under an article.
private const val WIDGET_CROSS = "widgetCross"

@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "Hide promotions",
    description = "Hides cross-promotion articles and the live bar on Home.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        // 1. A cross-promotion card (isCross = p1) becomes a plain spacing section. if-eqz takes
        // an 8-bit register, so p1 (v30 with .locals 29) is fine. "Hide sponsored articles"
        // adds its own self-contained check at the same index; either order works.
        AddArticleWidgetFingerprint.method.addInstructionsWithLabelsChecked(
            0,
            """
                if-eqz p1, :not_cross
                invoke-static {}, $PARSING_EXTENSIONS->getSpacing()$ARTICLE_SECTION
                move-result-object v0
                return-object v0
                :not_cross
                nop
            """,
        )

        // 2. The cross-promotion widget adds no heading (it would stay above the spacers).
        // widgetTitle has .locals 28, so p2 needs a range invoke.
        WidgetTitleFingerprint.method.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-virtual/range {p2 .. p2}, Lro/rcsrds/digisport/data/model/api/article/ApiArticleLayout;->getType()Ljava/lang/String;
                move-result-object v0
                const-string v1, "$WIDGET_CROSS"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :not_cross
                return-void
                :not_cross
                nop
            """,
        )

        // 3. Home: the exclusive-video promotion bar keeps its initial false, so it stays GONE.
        GetExclusiveVideoFingerprint.method.returnEarly()
    }
}
