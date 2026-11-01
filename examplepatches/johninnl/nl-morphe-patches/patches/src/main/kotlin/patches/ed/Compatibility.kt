package patches.ed

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

internal const val MODEL = "Lcom/kubus/module/network/model/"
internal const val FILTER = "${MODEL}SectionResponse;"
internal val ed = Compatibility(name = "ED", packageName = "com.mecom.ed.nl", apkFileType = ApkFileType.APKS,
    signatures = setOf("80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92"),
    targets = listOf(AppTarget(version = "9.22.0", versionCode = 9220000, minSdk = 32)))
internal val originalInput = patches.shared.originalInput(ed)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(cls: String, sig: String) = Fingerprint(definingClass = cls, name = sig.substringBefore('('),
    returnType = sig.substringAfter(')'), parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(sig.substringAfter('(').substringBefore(')')).map { it.value }.toList()).uniqueMatch()

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun change(cls: String, sig: String, code: String) = exact(cls, sig).method.addInstructions(0, code.trimIndent())

internal fun helper(name: String, result: String, params: List<String>, locals: Int, code: String) =
    MutableMethod(ImmutableMethod(FILTER, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + params.sumOf { if (it == "J" || it == "D") 2 else 1 }, emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, code.trimIndent()) }

internal const val STOP = "return-void"
internal const val FALSE = "const/4 v0, 0x0\nreturn v0"
internal const val TRUE = "const/4 v0, 0x1\nreturn v0"
internal const val UNIT = "sget-object v0, Lzdi;->a:Lzdi;\nreturn-object v0"
