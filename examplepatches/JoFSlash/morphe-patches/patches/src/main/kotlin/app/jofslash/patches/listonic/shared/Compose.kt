package app.jofslash.patches.listonic.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The methods whose code has every one of [strings]. Listonic's Compose code keeps the names of its
 * composables in Compose's trace calls ("com.l.shared.ui....Carousel (ProfileScreenContent.kt:566)"),
 * which is how the R8-renamed composables are found.
 */
internal fun BytecodePatchContext.methodsWithStrings(vararg strings: String): List<MutableMethod> {
    val types = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method -> method.hasStrings(strings) }) types += classDef.type
    }
    return types.flatMap { type -> mutableClassDefBy(type).methods.filter { it.hasStrings(strings) } }
}

private fun com.android.tools.smali.dexlib2.iface.Method.hasStrings(strings: Array<out String>): Boolean {
    val found = implementation?.instructions?.mapNotNull { insn ->
        if (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) {
            ((insn as ReferenceInstruction).reference as StringReference).string
        } else null
    }?.toSet() ?: return false
    return strings.all { it in found }
}

/** The one method whose code has every one of [strings]; see [methodsWithStrings]. */
internal fun BytecodePatchContext.methodWithStrings(vararg strings: String): MutableMethod {
    val methods = methodsWithStrings(*strings)
    if (methods.size != 1) throw PatchException("Expected one method with ${strings.toList()}, found ${methods.size}")
    return methods.single()
}

/** Makes the composable whose trace name is [trace] draw nothing. */
internal fun BytecodePatchContext.hideComposable(trace: String) {
    val method = methodWithStrings(trace)
    if (method.returnType != "V") throw PatchException("${method.definingClass}->${method.name} isn't a composable")
    // Returning before the composable opens its group keeps the composition balanced: the caller
    // doesn't open a group for it.
    method.addInstructions(0, "return-void")
}

/** Turns the list.add(...) call that comes right after index [from] into nothing. */
internal fun MutableMethod.dropNextAdd(from: Int) {
    val instructions = implementation!!.instructions.toList()
    val add = (from + 1 until instructions.size).firstOrNull { index ->
        val insn = instructions[index]
        insn.opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL) &&
                ((insn as ReferenceInstruction).reference as MethodReference).let {
                    it.name == "add" && it.parameterTypes.size == 1
                }
    } ?: throw PatchException("No add() after index $from in $definingClass->$name")
    replaceInstruction(add, "nop")
    val next = instructions.getOrNull(add + 1)
    if (next != null && next.opcode == Opcode.MOVE_RESULT) replaceInstruction(add + 1, "nop")
}

/**
 * Leaves the enum constant [constant] out wherever this method adds it to a list (as the profile's
 * cards are built: list.add(Card.RateApp)). Reads of the constant that aren't followed right away by
 * an add (for example when the card is drawn) are left alone. Throws when it isn't added at all.
 */
internal fun MutableMethod.dropAddsOfConstant(constant: String) {
    val instructions = implementation!!.instructions.toList()
    fun isAdd(index: Int) = instructions.getOrNull(index)?.let { insn ->
        insn.opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL) &&
                ((insn as ReferenceInstruction).reference as MethodReference).let {
                    it.name == "add" && it.parameterTypes.size == 1
                }
    } == true
    val adds = instructions.withIndex().filter { (index, insn) ->
        insn.opcode == Opcode.SGET_OBJECT &&
                ((insn as ReferenceInstruction).reference as FieldReference).name == constant &&
                (index + 1..index + 3).any(::isAdd)
    }.map { it.index }
    if (adds.isEmpty()) throw PatchException("$definingClass->$name doesn't add $constant to a list")
    adds.reversed().forEach { dropNextAdd(it) }
}
