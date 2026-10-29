package patches.nrc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import patches.shared.uniqueMatch

internal val nrc = Compatibility(
    name = "NRC", packageName = "com.twipemobile.nrc", apkFileType = ApkFileType.APK,
    signatures = setOf("3bcd6c6a3c997e65d458dcf8860c90ce04d14c3fb35f3e11e3e945f1d89a5807"),
    targets = listOf(AppTarget(version = "5.12.24", versionCode = 626, minSdk = 23)),
)
internal val originalInput = patches.shared.originalInput(nrc)
internal const val WEB = "Lpinch/nrcnext/extensions/WebViewExtensionsKt;"
internal const val BASE = "Lpinch/nrcnext/ui/webview/ErrorTrackingWebViewClient;"
internal const val ARTICLE = "Lpinch/nrcnext/ui/article/NRCArticleFragment\$initializeWebView\$2;"
internal const val READER = "Lnl/pinch/nrc/data/model/readerdata/NRCReaderData;"
internal const val CONSENT = "Lpinch/nrcnext/consent/DidomiConsentManager;"
internal const val TRACK = "Lnl/pinch/nrc/analytics/"
internal const val SERVICE = "Lcom/mediahuis/oneapps/sharedsdk/service/"
internal const val REQUEST = "Landroid/webkit/WebResourceRequest;"
internal const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
internal const val STOP = "return-void"
internal const val FALSE = "const/4 v0, 0x0\nreturn v0"
internal const val UNIT = "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(cls: String, name: String, result: String = "V", vararg params: String) =
    Fingerprint(definingClass = cls, name = name, returnType = result, parameters = params.toList()).uniqueMatch()

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun change(cls: String, signature: String, code: String) {
    val params = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList()
    exact(cls, signature.substringBefore('('), signature.substringAfter(')'), *params.toTypedArray()).method.addInstructions(0, code.trimIndent())
}

internal fun helper(cls: String, name: String, result: String, params: List<String>, locals: Int, code: String) =
    MutableMethod(ImmutableMethod(cls, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + params.sumOf { if (it == "J" || it == "D") 2 else 1 }, emptyList(), emptyList(), emptyList()))).apply {
        addInstructions(0, code.trimIndent())
    }

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun enable(name: String) {
    val cls = exact(WEB, "applyNRCSettings", "V", "Landroid/webkit/WebView;").classDef
    val matches = cls.methods.filter { it.name == "morphe${name}Enabled" && it.parameters.isEmpty() && it.returnType == "Z" }
    check(matches.size == 1) { "Expected one NRC $name flag, found ${matches.size}" }
    check(cls.methods.remove(matches.single()))
    cls.methods.add(helper(WEB, "morphe${name}Enabled", "Z", emptyList(), 1, "const/4 v0, 0x1\nreturn v0"))
}
