package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** Read the native palette instead of the extension Activity's fixed Android theme. */
internal fun BytecodePatchContext.patchNativeUiTheme(version: String) {
    val (type, getterName) = when (version) {
        "0.8.10.191 dev" -> "Lo/r8lambda0m18vyepBPbBImKp0mAya80YXc8;" to "d"
        "0.8.10.226 dev" -> "Lo/addConnectException;" to "b"
        "0.8.10.241" -> "Lo/getPageMargin;" to "a"
        "0.8.10.242 dev" -> "Lo/onTextChanged;" to "a"
        else -> return
    }
    val theme = mutableClassDefBy(type)
    val getter = theme.methods.single {
        it.name == getterName && it.accessFlags and 9 == 9 &&
            it.parameterTypes == listOf("Landroid/content/Context;") && it.returnType == type
    }
    val keys = listOf("windowBackgroundColor", "textPrimaryColor", "primaryColor",
        "dialogBackgroundColor", "progressBarPrimaryColor", "progressBarBackgroundColor",
        "listBackgroundColor")
    val fields = keys.map { key ->
        val matches = theme.methods.flatMap { method ->
            val instructions = method.implementation?.instructions?.toList().orEmpty()
            instructions.indices.mapNotNull { index ->
                val string = ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)?.string
                if (string != key) return@mapNotNull null
                val next = instructions.getOrNull(index + 1)
                val field = (next as? ReferenceInstruction)?.reference as? FieldReference
                field?.takeIf { next?.opcode == Opcode.IGET && it.definingClass == type && it.type == "I" }
            }
        }.distinctBy { it.name }
        val field = matches.singleOrNull() ?: error("$version native theme key changed: $key")
        check(theme.fields.any { it.name == field.name && it.type == "I" && it.accessFlags and 1 != 0 }) {
            "$version native theme field is not public: $key"
        }
        field
    }
    val bridge = mutableClassDefBy("Lapp/morphe/extension/chmate/NativeThemeColors;")
    val original = bridge.methods.single { it.name == "colors" && it.returnType == "[I" &&
        it.parameterTypes == listOf("Landroid/content/Context;") }
    // Only the extension stub is replaced; no native method, register, or branch is changed.
    val replacement = MutableMethod(ImmutableMethod(bridge.type, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    replacement.addInstructions(0, buildString {
        appendLine("invoke-static/range {p0 .. p0}, $getter")
        appendLine("move-result-object v0")
        appendLine("if-eqz v0, :unavailable")
        appendLine("const/4 v1, ${fields.size}")
        appendLine("new-array v1, v1, [I")
        fields.forEachIndexed { index, field ->
            appendLine("iget v2, v0, $field")
            appendLine("const/4 v3, $index")
            appendLine("aput v2, v1, v3")
        }
        appendLine("return-object v1")
        appendLine(":unavailable")
        appendLine("const/4 v1, 0x0")
        appendLine("return-object v1")
    })
    bridge.methods.remove(original)
    bridge.methods.add(replacement)
    println("$version Haiagaru UI: validated native theme palette (${fields.size} colors)")
}
