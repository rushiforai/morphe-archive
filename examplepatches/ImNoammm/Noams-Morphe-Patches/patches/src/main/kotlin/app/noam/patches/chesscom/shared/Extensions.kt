package app.noam.patches.chesscom.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private val FIELD_STORES = setOf(
    Opcode.IPUT, Opcode.IPUT_WIDE, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN, Opcode.IPUT_BYTE, Opcode.IPUT_CHAR, Opcode.IPUT_SHORT,
)

internal val Instruction.methodReference get() = (this as? ReferenceInstruction)?.reference as? MethodReference
internal val Instruction.fieldReference get() = (this as? ReferenceInstruction)?.reference as? FieldReference

internal fun Method.instructionList(): List<Instruction> =
    implementation?.instructions?.toList()
        ?: throw PatchException("$name has no implementation")

internal fun Method.indexOfFirst(startIndex: Int = 0, predicate: (Instruction) -> Boolean): Int {
    val instructions = instructionList()
    for (index in startIndex until instructions.size) {
        if (predicate(instructions[index])) return index
    }
    return -1
}

internal fun Method.indexOfFirstOrThrow(
    startIndex: Int = 0,
    description: String,
    predicate: (Instruction) -> Boolean,
): Int = indexOfFirst(startIndex, predicate).also {
    if (it < 0) throw PatchException("Could not find $description in $name")
}

internal fun Method.indexOfLast(endIndex: Int, predicate: (Instruction) -> Boolean): Int {
    val instructions = instructionList()
    for (index in (endIndex - 1) downTo 0) {
        if (predicate(instructions[index])) return index
    }
    return -1
}

internal fun MutableMethod.returnString(value: String) {
    replaceInstruction(0, "const-string v0, \"$value\"")
}

/** The registers an invoke passes, in order. */
internal fun Instruction.arguments(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

/** StringBuilder.append(x) or new StringBuilder(x): x is the argument after the builder. */
private fun Instruction.appends() = methodReference?.let {
    it.definingClass == "Ljava/lang/StringBuilder;" && (it.name == "append" || (it.name == "<init>" && it.parameterTypes.size == 1))
} == true

/**
 * The [fieldType] field a data class's toString() prints after [label] (", mode=" and the like).
 * The label goes either into StringBuilder.append, with the value in the next append (or first in
 * a helper R8 outlined the next appends to, given the builder), or into such a helper itself,
 * whose own appends tell which of its arguments follows the label; the value was read from the
 * field. Many data classes have no getters left (R8 inlines them), so hooks go where the field is
 * stored.
 */
context(context: BytecodePatchContext)
internal fun ClassDef.fieldForLabel(label: String, fieldType: String): FieldReference {
    val code = methods.single { it.name == "toString" }.instructionList()
    val constant = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == label }
    if (constant < 0) throw PatchException("$type has no $label")
    val labelRegister = (code[constant] as OneRegisterInstruction).registerA
    val use = (constant + 1 until code.size).firstOrNull { labelRegister in code[it].arguments() }
        ?: throw PatchException("$type never prints $label")
    // A helper's parameters sit at the top of its frame, in the order of the call's arguments.
    fun helper(call: Int): Pair<Int, List<Instruction>> {
        val reference = code[call].methodReference ?: throw PatchException("$type passes $label to ${code[call].opcode}")
        val method = context.classDefBy(reference.definingClass).methods.single {
            it.name == reference.name && it.parameterTypes == reference.parameterTypes && it.returnType == reference.returnType
        }
        return method.implementation!!.registerCount - code[call].arguments().size to method.instructionList()
    }
    val (valueCall, valueRegister) = if (code[use].appends()) {
        val builder = code[use].arguments()[0]
        val next = (use + 1 until code.size).firstOrNull { builder in code[it].arguments() }
            ?: throw PatchException("$type prints nothing after $label")
        if (code[next].appends()) {
            next to code[next].arguments()[1]
        } else {
            val arguments = code[next].arguments()
            val (first, body) = helper(next)
            val printed = body.firstOrNull { it.appends() && it.arguments()[0] == first + arguments.indexOf(builder) }
                ?: throw PatchException("${code[next].methodReference} prints nothing after $label")
            next to arguments.getOrNull(printed.arguments()[1] - first)
        }
    } else {
        val arguments = code[use].arguments()
        val (first, body) = helper(use)
        val printed = body.indexOfFirst { it.appends() && it.arguments()[1] == first + arguments.indexOf(labelRegister) }
        val next = (printed + 1 until body.size).firstOrNull { body[it].appends() }.takeIf { printed >= 0 }
            ?: throw PatchException("${code[use].methodReference} prints nothing after $label")
        use to arguments.getOrNull(body[next].arguments()[1] - first)
    }
    return (valueCall - 1 downTo 0).firstOrNull { (code[it] as? OneRegisterInstruction)?.registerA == valueRegister }
        ?.let { code[it].fieldReference }?.takeIf { it.definingClass == type && it.type == fieldType }
        ?: throw PatchException("$type's $label is not a $fieldType field")
}

/**
 * The class a method-reference lambda is bound to. R8 renamed some classes but kept their lambdas'
 * names ("AnimatedPiece$animateDragCancel$1"), whose invoke() casts the bound receiver to the class.
 */
internal fun ClassDef.boundReceiverType(): String {
    val code = methods.single { it.name == "invoke" }.instructionList()
    val receiver = code.indexOfFirst {
        it.fieldReference?.let { field -> field.definingClass == "Lkotlin/jvm/internal/CallableReference;" && field.name == "receiver" } == true
    }
    if (receiver < 0) throw PatchException("$type reads no bound receiver")
    val register = (code[receiver] as TwoRegisterInstruction).registerA
    val cast = code.drop(receiver + 1).firstOrNull { it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == register }
        ?: throw PatchException("$type never casts its receiver")
    return ((cast as ReferenceInstruction).reference as TypeReference).type
}

/**
 * Passes the value every constructor of the class stores in [field] through [hook] (a static
 * extension method taking and returning the field's type) right before the store, after any
 * defaults the constructor fills in.
 */
internal fun MutableClass.filterStores(field: FieldReference, hook: String) {
    var hooked = 0
    methods.filter { it.name == "<init>" }.forEach { constructor ->
        val stores = constructor.instructionList().withIndex().filter { (_, instruction) ->
            instruction.opcode in FIELD_STORES && instruction.fieldReference == field
        }.map { it.index }
        stores.reversed().forEach { index ->
            val register = (constructor.instructionList()[index] as TwoRegisterInstruction).registerA
            val wide = field.type == "J" || field.type == "D"
            val move = when {
                field.type.startsWith("L") || field.type.startsWith("[") -> "move-result-object v$register\ncheck-cast v$register, ${field.type}"
                wide -> "move-result-wide v$register"
                else -> "move-result v$register"
            }
            val last = if (wide) register + 1 else register
            constructor.addInstructions(index, "invoke-static/range { v$register .. v$last }, $hook\n$move")
            hooked++
        }
    }
    if (hooked == 0) throw PatchException("$type never stores ${field.name}")
}

/**
 * A data class's getter for the [fieldType] field its toString() prints after [label] (", mode="
 * and the like), so obfuscated getter names need not be known; for classes R8 left their getters.
 */
context(context: BytecodePatchContext)
internal fun MutableClass.getterForLabel(label: String, fieldType: String): MutableMethod {
    val field = fieldForLabel(label, fieldType)
    return methods.firstOrNull { method ->
        method.parameterTypes.isEmpty() && method.returnType == field.type && !method.name.startsWith("component") &&
            method.implementation?.instructions?.toList()?.let { body -> body.size == 2 && body[0].fieldReference == field } == true
    } ?: throw PatchException("$type has no getter for $label")
}
