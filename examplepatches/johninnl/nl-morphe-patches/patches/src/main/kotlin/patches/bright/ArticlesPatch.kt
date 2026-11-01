package patches.bright

import app.morphe.patcher.patch.bytecodePatch

/**
 * Independent article delivery. The private reader client requests the
 * audited signed premium body for one eligible publisher article navigation
 * and renders a script-free reader document in place of the teaser page.
 * Genuine account, subscription, login, comments and media state remain with
 * the publisher; any rejection, unknown content or race defers to the
 * original page. Fails preflight clearly when the signing key input is
 * missing, without affecting the privacy controls.
 */
@Suppress("unused")
val readFullArticles = bytecodePatch(
    name = "Read full articles",
    description = "Requests complete article bodies through the audited signed API route and renders a script-free reader for eligible publisher article pages. Preserves actual account and subscription state; unavailable articles keep the original experience.",
) {
    dependsOn(originalInput, runtime)
    compatibleWith(bright)
    execute {
        check(ArticleKeyStatus.available) {
            "Read full articles needs the article signing key: set BRIGHT_ARTICLE_SIGNING_KEY or create .bright-article-signing-key"
        }
        selectControl("articles")
    }
}
