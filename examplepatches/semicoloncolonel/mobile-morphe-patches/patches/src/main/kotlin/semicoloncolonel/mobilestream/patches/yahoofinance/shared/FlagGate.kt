package semicoloncolonel.mobilestream.patches.yahoofinance.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.hasSignature
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo Finance 26.22.2 reads all 293 feature flags through one class,
// config/c: a() is the value with any override applied, and c() the value
// itself. The flag's key is the string in field a. offFlags puts a check at
// the top of both: when FinanceFlags.<check>(key) says the flag is on the
// patch's list, the flag reads as off.
// ─────────────────────────────────────────────────────────────────────────────

internal const val FINANCE_FLAGS = "Lsemicoloncolonel/mobilestream/extension/yahoofinance/FinanceFlags;"
private const val FLAG = "Lcom/yahoo/mobile/client/android/finance/config/c;"

internal object FlagValueFingerprint : Fingerprint(
    definingClass = FLAG,
    name = "a",
    parameters = listOf(),
    returnType = "Z",
)

internal object FlagServerValueFingerprint : Fingerprint(
    definingClass = FLAG,
    name = "c",
    parameters = listOf(),
    returnType = "Z",
)

internal fun BytecodePatchContext.offFlags(check: String) {
    listOf(FlagValueFingerprint, FlagServerValueFingerprint).forEach {
        it.method.prependGate(
            """
                iget-object v0, p0, $FLAG->a:Ljava/lang/String;
                invoke-static { v0 }, $FINANCE_FLAGS->$check(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :msp_orig
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}

internal const val ARTICLE_CLEANUP = "Lsemicoloncolonel/mobilestream/extension/yahoofinance/ArticleCleanup;"

/**
 * Article pages are finance.yahoo.com pages in a WebView, hosted in Compose.
 * Every WebView client (a class that extends WebViewClient, directly or not,
 * and has its own onPageFinished) now calls ArticleCleanup.<method>(view, url) first, which adds
 * a script to Yahoo pages. Returns how many clients were changed.
 */
internal fun BytecodePatchContext.onArticlePageFinished(method: String): Int {
    // Every class that extends WebViewClient, directly or through another
    // client class, from the app or a library. ArticleCleanup only acts on
    // yahoo.com pages.
    val clients = mutableSetOf("Landroid/webkit/WebViewClient;", "Landroidx/webkit/WebViewClientCompat;")
    val parents = mutableMapOf<String, String?>()
    classDefForEach { parents[it.type] = it.superclass }
    var grew = true
    while (grew) {
        grew = false
        parents.forEach { (type, parent) ->
            if (parent != null && parent in clients && clients.add(type)) grew = true
        }
    }
    val count = forEachMatchingMethod(
        classFilter = { it.type in clients && !it.type.startsWith("Lsemicoloncolonel/") },
        methodFilter = { it.name == "onPageFinished" && it.hasSignature("V", "Landroid/webkit/WebView;", "Ljava/lang/String;") },
    ) {
        it.addInstructions(0, "invoke-static { p1, p2 }, $ARTICLE_CLEANUP->$method(Landroid/webkit/WebView;Ljava/lang/String;)V")
    }
    if (count == 0) throw app.morphe.patcher.patch.PatchException("No WebView client with onPageFinished")
    return count
}
