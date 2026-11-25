package patches.nrc

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Hides evidenced appview subscription top banners and sticky promotion roots while preserving account forms and billing.") {
    compatibleWith(nrc)
    dependsOn(originalInput, webContent)
    execute { enable("Premium") }
}

@Suppress("unused")
val readFullArticles = bytecodePatch(name = "Read full articles", description = "Rejects the article-only web wall decision before destructive clipping and hides wall UI while retaining complete received article bodies; cannot supply text absent from the response.") {
    compatibleWith(nrc)
    dependsOn(originalInput, webContent)
    execute { enable("Full") }
}
