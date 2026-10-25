package app.template.patches.truecaller.shared

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val STRING_BUILDER = "Ljava/lang/StringBuilder;"

private val INSTANCE_FIELD_READS = setOf(
    Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN,
    Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT,
)

/**
 * The instance fields of [ownerType] that a Kotlin data class toString() prints, each with the name
 * of its label: ("phonebookId", field) for the field appended right after ", phonebookId=".
 *
 * R8 hoists the label constants and outlines parts of these toStrings into static StringBuilder
 * helpers (for example t(label1, value1, label2, value2, label3), or v(label1, label2, builder,
 * value1, value2)), so the labels and the field reads are not in append order in the code. The
 * append order is replayed instead: inline StringBuilder.<init>(String) / append(x) calls, and for
 * each static helper the order in which its own code appends its parameters. Each appended value is
 * traced back to the instruction that last wrote its register (toString is straight-line code).
 * A label is a const-string ending in "name=" right after "(" or " "; its value is an iget of any
 * width on [ownerType].
 */
internal fun toStringFields(
    toString: Method,
    ownerType: String,
    classDef: (String) -> ClassDef?,
): List<Pair<String, FieldReference>> {
    val instructions = toString.implementation?.instructions?.toList() ?: return emptyList()
    fun writer(index: Int, register: Int) = instructions.subList(0, index).lastOrNull { it.writes(register) }

    val appended = mutableListOf<Instruction?>()
    instructions.forEachIndexed { index, instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
        val arguments = instruction.argumentRegisters() ?: return@forEachIndexed
        if (call.isStringBuilderAppend()) {
            appended += writer(index, arguments[1])
            return@forEachIndexed
        }
        if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@forEachIndexed
        val parameters = call.parameterTypes.map(CharSequence::toString)
        val helper = classDef(call.definingClass)?.methods?.firstOrNull {
            it.name == call.name && it.returnType == call.returnType &&
                it.parameterTypes.map(CharSequence::toString) == parameters && AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: return@forEachIndexed
        // Argument slots: a long or double parameter takes two.
        val slots = parameters.firstRegisters(0)
        appended += appendOrder(helper).map { writer(index, arguments[slots[it]]) }
    }

    return appended.zipWithNext().mapNotNull { (label, value) ->
        val text = ((label as? ReferenceInstruction)?.reference as? StringReference)?.string
        val field = (value as? ReferenceInstruction)?.reference as? FieldReference
        if ((label?.opcode != Opcode.CONST_STRING && label?.opcode != Opcode.CONST_STRING_JUMBO) || text == null ||
            !text.endsWith("=") || value?.opcode !in INSTANCE_FIELD_READS || field?.definingClass != ownerType
        ) return@mapNotNull null
        val head = text.removeSuffix("=")
        val name = head.substring(maxOf(head.lastIndexOf('('), head.lastIndexOf(' ')) + 1)
        if (name.isEmpty() || name.length == head.length) null else name to field
    }
}

/** [toStringFields] with classes looked up in the patch context. */
internal fun BytecodePatchContext.toStringFields(toString: Method, ownerType: String) =
    toStringFields(toString, ownerType) { classDefByOrNull(it) }

private fun MethodReference.isStringBuilderAppend() =
    definingClass == STRING_BUILDER && (name == "append" || name == "<init>") && parameterTypes.size == 1

private fun Instruction.argumentRegisters(): List<Int>? = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> null
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/** The first register of each parameter, counting from [first]; long and double take two. */
private fun List<String>.firstRegisters(first: Int): List<Int> =
    runningFold(first) { register, type -> register + if (type == "J" || type == "D") 2 else 1 }.dropLast(1)

/** Indices of the parameters a static StringBuilder helper passes to StringBuilder(String) / append, in order. */
private fun appendOrder(helper: Method): List<Int> {
    val implementation = helper.implementation ?: return emptyList()
    val parameters = helper.parameterTypes.map(CharSequence::toString)
    val width = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val parameterOf = parameters.firstRegisters(implementation.registerCount - width)
        .withIndex().associate { (index, register) -> register to index }
    return implementation.instructions.mapNotNull { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (call?.isStringBuilderAppend() != true) return@mapNotNull null
        instruction.argumentRegisters()?.getOrNull(1)?.let(parameterOf::get)
    }
}
