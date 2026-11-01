package patches.nunl

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

internal const val APP = "Lnl/nu/android/"
internal const val OBJECTS = "Lnl/nu/performance/api/client/objects/"
internal const val TRANSFORMER = "${APP}bff/domain/data_integrity/ScreenTransformerImpl;"
internal const val ANDROID = "http://schemas.android.com/apk/res/android"
internal val nunl = Compatibility(
    name = "NU.nl", packageName = "nl.sanomamedia.android.nu", apkFileType = ApkFileType.APKS,
    signatures = setOf("80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92", "a78f41c09876d3cccbd87b5ef0d537ce7e2577f45e2749aff8fc5f8d21f8e986"),
    targets = listOf(AppTarget(version = "26.9.0", versionCode = 210156, minSdk = 29)),
)
// Public publisher variants share the inspected DEX and version code.
internal val originalInput = patches.shared.originalInput(
    nunl, additionalMinSdksByVersion = mapOf("26.9.0" to setOf(32)),
)

internal fun exact(cls: String, name: String, result: String = "V", vararg params: String) =
    Fingerprint(definingClass = cls, name = name, returnType = result, parameters = params.toList())
internal fun org.w3c.dom.Document.one(name: String): Element {
    val nodes = getElementsByTagName("*")
    return (0 until nodes.length).map { nodes.item(it) as Element }
        .filter { it.getAttribute("android:name") == name }.also {
            check(it.size == 1) { "Expected one NU.nl manifest entry $name, found ${it.size}" }
        }.single()
}

/** Helpers live in existing public app classes; no extension or reflection is needed. */
internal fun helper(cls: String, name: String, result: String, params: List<String>, locals: Int, code: String, static: Boolean = true, catchParserErrors: Boolean = false) =
    MutableMethod(ImmutableMethod(cls, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else 0,
        emptySet(), emptySet(), ImmutableMethodImplementation(locals + params.size + if (static) 0 else 1,
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
