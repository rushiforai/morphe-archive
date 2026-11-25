package patches.volkskrant

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
import org.w3c.dom.Element

internal const val APP = "Lnl/persgroep/edition/"
internal const val ANDROID = "http://schemas.android.com/apk/res/android"
internal val volkskrant = Compatibility(
    name = "Volkskrant", packageName = "be.persgroep.android.news.mobilevk", apkFileType = ApkFileType.APKS,
    signatures = setOf("80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92", "34a28a4862a6204d7c70ebacc7105fae14ac880486c5d2d56a2b9c17907b27c4"),
    targets = listOf(AppTarget(version = "7.53.1", versionCode = 23136515, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(volkskrant)

internal fun exact(cls: String, name: String, result: String = "V", vararg params: String) =
    Fingerprint(definingClass = cls, name = name, returnType = result, parameters = params.toList())
internal fun org.w3c.dom.Document.one(name: String): Element {
    val nodes = getElementsByTagName("*")
    return (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttribute("android:name") == name }.also {
            check(it.size == 1) { "Expected one Volkskrant manifest entry $name, found ${it.size}" }
        }.single()
}

/** Helpers live in existing public app classes; no extension or reflection is needed. */
internal fun helper(cls: String, name: String, result: String, params: List<String>, locals: Int, code: String, static: Boolean = true, catchParserErrors: Boolean = false) =
    MutableMethod(ImmutableMethod(cls, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else 0,
        emptySet(), emptySet(), ImmutableMethodImplementation(locals + params.sumOf { if (it == "J" || it == "D") 2 else 1 } + if (static) 0 else 1,
            emptyList(), emptyList(), emptyList()))).apply {
        val source = code.trimIndent()
        addInstructions(0, source)
        if (catchParserErrors) {
            // InlineSmaliCompiler returns only instructions. Retain the parser guard explicitly.
            fun index(label: String): Int = source.lineSequence().takeWhile { it.trim() != label }
                .count { it.isNotBlank() && !it.trim().startsWith(":") && !it.trim().startsWith(".") }
            val body = implementation!!
            body.addCatch("Ljava/lang/Exception;", body.newLabelForIndex(index(":try_start")),
                body.newLabelForIndex(index(":try_end")), body.newLabelForIndex(index(":parse_error")))
        }
    }

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun change(cls: String, signature: String, code: String) {
    val name = signature.substringBefore('(')
    val params = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList()
    exact(cls, name, signature.substringAfter(')'), *params.toTypedArray()).method.addInstructions(0, code.trimIndent())
}
internal const val STOP = "return-void"
internal const val FALSE = "const/4 v0, 0x0\nreturn v0"
internal const val NULL = "const/4 v0, 0x0\nreturn-object v0"
internal const val UNIT = "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0"
internal const val EMPTY_MAP = "invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;\nmove-result-object v0\nreturn-object v0"
internal const val SUCCESS_UNIT = "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\ninvoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object v0\nreturn-object v0"
