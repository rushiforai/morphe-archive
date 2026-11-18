package dev.jibon.notes.patches.shared

// Adapted from bearinmindcat/morphe-patches (GPLv3), org.ungoogled.patches.samsung.SamsungTelemetry.

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Samsung's diagnostics agent: DiagMon's crash, ANR and performance reports go through it. */
private const val DIAGNOSTICS_AGENT = "com.sec.android.diagmonagent"

/** The broadcast Samsung's SDKs send their feature-usage surveys with, to One UI's context service. */
private const val FEATURE_SURVEY = "com.samsung.android.providers.context.log.action.USE_APP_FEATURE_SURVEY"

private val CONST_STRING = setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)

private fun Instruction.constString() =
    if (opcode in CONST_STRING) ((this as ReferenceInstruction).reference as StringReference).string else null

private fun Instruction.methodCall() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.passes(register: Int) = when (this) {
    is FiveRegisterInstruction -> register in listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> register in startRegister until startRegister + registerCount
    else -> false
}

/** Indices of the const-string [value] instructions whose register the next call passes to a method [callee] accepts. */
private fun List<Instruction>.arguments(value: String, callee: (MethodReference) -> Boolean) =
    withIndex().filter { (index, insn) ->
        if (insn.constString() != value) return@filter false
        val call = drop(index + 1).firstOrNull { it.methodCall() != null } ?: return@filter false
        callee(call.methodCall()!!) && call.passes((insn as OneRegisterInstruction).registerA)
    }.map { it.index }

private fun BytecodePatchContext.methodsWhere(predicate: (Method) -> Boolean): List<Method> {
    val found = mutableListOf<Method>()
    classDefForEach { c ->
        if (c.type.startsWith("Lsamsungcompat/")) return@classDefForEach
        c.methods.filterTo(found) { it.implementation != null && predicate(it) }
    }
    return found
}

fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
    }

/**
 * Every package lookup of Samsung's diagnostics agent asks for a package nothing has, so the DiagMon SDK takes its own
 * "agent not installed" path: no crash or ANR handler and no report. Returns how many lookups were changed.
 */
fun BytecodePatchContext.hideDiagnosticsAgent(): Int {
    val lookup: (MethodReference) -> Boolean =
        { it.definingClass == "Landroid/content/pm/PackageManager;" && it.name == "getPackageInfo" }
    var count = 0
    methodsWhere { it.implementation!!.instructions.toList().arguments(DIAGNOSTICS_AGENT, lookup).isNotEmpty() }
        .forEach { method ->
            val target = mutable(method)
            for (index in target.implementation!!.instructions.toList().arguments(DIAGNOSTICS_AGENT, lookup)) {
                val register = (target.implementation!!.instructions[index] as OneRegisterInstruction).registerA
                target.replaceInstruction(index, "const-string v$register, \"\"")
                count++
            }
        }
    if (count == 0) throw PatchException("No lookup of Samsung's diagnostics agent found")
    return count
}

/**
 * Samsung's SDKs (handwriting, S Pen, multi-window) report which of their features are used, each from a small sender
 * of its own. Every sender returns at once. Returns how many there were.
 */
fun BytecodePatchContext.muteFeatureSurveys(): Int {
    val senders = methodsWhere { m ->
        m.returnType == "V" && !m.name.startsWith("<") && m.implementation!!.instructions.any { it.constString() == FEATURE_SURVEY }
    }
    if (senders.isEmpty()) throw PatchException("No feature survey sender found")
    senders.forEach { mutable(it).addInstructions(0, "return-void") }
    return senders.size
}
