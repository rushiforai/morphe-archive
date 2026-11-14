package app.morphe.patches.all.font

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TYPEFACE = "Landroid/graphics/Typeface;"
private val STATIC_FIELDS = setOf("DEFAULT", "DEFAULT_BOLD", "SANS_SERIF", "SERIF", "MONOSPACE")

private fun Instruction.typefaceStaticRead(): Boolean {
    if (opcode != Opcode.SGET_OBJECT) return false
    val f = getReference<FieldReference>() ?: return false
    return f.definingClass == TYPEFACE && f.name in STATIC_FIELDS
}

private fun Instruction.isCreateFamily(): Boolean {
    val m = getReference<MethodReference>() ?: return false
    return m.definingClass == TYPEFACE &&
        m.name == "create" &&
        m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "I") &&
        m.returnType == TYPEFACE
}

private fun argRegisters(ins: Instruction): List<Int>? = when (ins) {
    is FiveRegisterInstruction -> listOf(
        ins.registerC,
        ins.registerD,
        ins.registerE,
        ins.registerF,
        ins.registerG,
    ).take(ins.registerCount)
    is RegisterRangeInstruction ->
        (ins.startRegister until ins.startRegister + ins.registerCount).toList()
    else -> null
}

private fun forceFamily(method: MutableMethod, invokeIndex: Int, reg: Int, family: String) {
    for (j in invokeIndex - 1 downTo 0) {
        val ins = method.getInstruction(j)
        val op = ins.opcode
        if ((op == Opcode.CONST_STRING || op == Opcode.CONST_STRING_JUMBO) &&
            ins is OneRegisterInstruction &&
            ins.registerA == reg
        ) {
            method.replaceInstruction(j, "const-string v$reg, \"$family\"")
            return
        }
        if (op == Opcode.GOTO ||
            op == Opcode.GOTO_16 ||
            op == Opcode.GOTO_32 ||
            op == Opcode.PACKED_SWITCH ||
            op == Opcode.SPARSE_SWITCH ||
            op.name.startsWith("if-") ||
            op.name.startsWith("return")
        ) {
            return
        }
        if (ins is OneRegisterInstruction && ins.registerA == reg) return
    }
}

@Suppress("unused")
val customFontPatch = bytecodePatch(
    name = "Custom font",
    description = "Overrides the app's typeface with a built-in font family. Affects explicit " +
        "Typeface usage; views that never set a typeface keep the system default.",
    default = false,
) {
    val familyOption = stringOption(
        key = "fontFamily",
        default = "monospace",
        values = mapOf("Monospace" to "monospace", "Serif" to "serif", "Sans-serif" to "sans-serif"),
        title = "Font family",
        description = "The built-in font family to apply.",
        required = true,
    )

    execute {
        val family = familyOption.value!!
        val field = when (family) {
            "monospace" -> "MONOSPACE"
            "serif" -> "SERIF"
            else -> "SANS_SERIF"
        }

        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                if (impl.instructions.none { it.typefaceStaticRead() || it.isCreateFamily() }) return@forEach
                val mm = mutableClass.findMutableMethodOf(method)
                val idxs = mm.instructions.withIndex()
                    .filter { it.value.typefaceStaticRead() || it.value.isCreateFamily() }
                    .map { it.index }
                for (i in idxs) {
                    val ins = mm.getInstruction(i)
                    if (ins.typefaceStaticRead()) {
                        val reg = (ins as OneRegisterInstruction).registerA
                        mm.replaceInstruction(i, "sget-object v$reg, $TYPEFACE->$field:$TYPEFACE")
                    } else {
                        val regs = argRegisters(ins) ?: continue
                        if (regs.isNotEmpty()) forceFamily(mm, i, regs[0], family)
                    }
                }
            }
        }
    }
}
