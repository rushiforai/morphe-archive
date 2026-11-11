package semicoloncolonel.mobilestream.patches.cnbc.shared

import app.morphe.patcher.Fingerprint

// The WebViewClient of the article screen, whose pages are cnbc.com articles.
internal object ArticlePageFinishedFingerprint : Fingerprint(
    definingClass = "Lcom/cnbc/client/fragments/news/NewsDetailFragment\$1;",
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
)

internal const val ARTICLE_CLEANUP = "Lsemicoloncolonel/mobilestream/extension/cnbc/ArticleCleanup;"
