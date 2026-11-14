package app.morphe.patches.all.spoof.androidid

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import kotlin.random.Random

private fun argRegisters(ins: Instruction): List<Int>? = when (ins) {
    is FiveRegisterInstruction -> listOf(ins.registerC, ins.registerD, ins.registerE, ins.registerF, ins.registerG).take(ins.registerCount)
    is RegisterRangeInstruction -> (ins.startRegister until ins.startRegister + ins.registerCount).toList()
    else -> null
}

/** True if [reg] is loaded with the literal "android_id" (const-string or the ANDROID_ID constant). */
private fun isAndroidIdArg(method: MutableMethod, invokeIndex: Int, reg: Int): Boolean {
    for (j in invokeIndex - 1 downTo 0) {
        val ins = method.getInstruction(j); val op = ins.opcode
        if (ins is OneRegisterInstruction && ins.registerA == reg) {
            if (op == Opcode.CONST_STRING || op == Opcode.CONST_STRING_JUMBO) {
                return ins.getReference<StringReference>()?.string == "android_id"
            }
            if (op == Opcode.SGET_OBJECT) {
                val f = ins.getReference<FieldReference>()
                return f?.definingClass == "Landroid/provider/Settings\$Secure;" && f.name == "ANDROID_ID"
            }
            return false
        }
        if (op == Opcode.GOTO || op == Opcode.GOTO_16 || op == Opcode.GOTO_32 ||
            op == Opcode.PACKED_SWITCH || op == Opcode.SPARSE_SWITCH ||
            op.name.startsWith("if-") || op.name.startsWith("return")
        ) return false
    }
    return false
}

private fun randomId() = List(16) { "0123456789abcdef"[Random.nextInt(16)] }.joinToString("")

@Suppress("unused")
val androidIdSpoofPatch = bytecodePatch(
    name = "Spoof Android ID",
    description = "Returns a fake value for Settings.Secure 'android_id' reads.",
    default = false,
) {
    val idOption = stringOption(
        key = "androidId", default = "Random",
        values = mapOf("Random" to "Random"),
        title = "Android ID",
        description = "16 hex chars, or 'Random' to generate one per build.",
        required = true,
    ) { it == "Random" || (it != null && it.matches(Regex("^[0-9a-f]{16}$"))) }

    execute {
        val fake = if (idOption.value == "Random") randomId() else idOption.value!!
        listOf(
            "Landroid/provider/Settings\$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;",
            "Landroid/provider/Settings\$Secure;->getStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;",
        ).forEach { smali ->
            methodCall(smali).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val regs = argRegisters(getInstruction(index)) ?: return@matchAllMethodIndicesForEach
                if (regs.size < 2) return@matchAllMethodIndicesForEach
                if (!isAndroidIdArg(this, index, regs[1])) return@matchAllMethodIndicesForEach
                val ri = index + 1
                if (ri >= instructions.size) return@matchAllMethodIndicesForEach
                val res = getInstruction(ri)
                if (res.opcode != Opcode.MOVE_RESULT_OBJECT) return@matchAllMethodIndicesForEach
                val reg = (res as OneRegisterInstruction).registerA
                replaceInstruction(ri, "const-string v$reg, \"$fake\"")
            }
        }
    }
}