package app.morphe.patches.merriamwebster

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

private const val FRAGMENT =
    "Lcom/merriamwebster/dictionary/activity/dictionary/definition/WordDefinitionFragment;"
private const val DEFINITION = "Lcom/merriamwebster/dictionary/model/Definition;"

/** Static helper that loads a Definition's HTML into the definition WebView. */
object ShowDefinitionFingerprint : Fingerprint(
    definingClass = FRAGMENT,
    returnType = "V",
    parameters = listOf(FRAGMENT, DEFINITION),
    filters = listOf(
        methodCall(definingClass = DEFINITION, name = "getContent"),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(name = "loadDataWithBaseURL"),
    )
)

// The fragment's WebViewClient is an obfuscated inner class (WordDefinitionFragment$d in 5.6.3).
private const val FRAGMENT_INNER_CLASS =
    "Lcom/merriamwebster/dictionary/activity/dictionary/definition/WordDefinitionFragment$"

object ShouldOverrideUrlRequestFingerprint : Fingerprint(
    definingClass = FRAGMENT_INNER_CLASS,
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
)

object ShouldOverrideUrlStringFingerprint : Fingerprint(
    definingClass = FRAGMENT_INNER_CLASS,
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
)
