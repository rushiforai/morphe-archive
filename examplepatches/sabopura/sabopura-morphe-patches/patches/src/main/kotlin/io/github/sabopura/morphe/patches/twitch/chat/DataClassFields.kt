package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The fields behind the labels of a data class's toString, with R8's shared helpers resolved. */
internal fun BytecodePatchContext.describedFields(type: ClassDef): Map<String, FieldReference> =
    dataClassFields(type.methods.single { it.name == "toString" && it.parameterTypes.isEmpty() }) { reference ->
        classDefBy(reference.definingClass).methods.single {
            it.name == reference.name && it.parameterTypes == reference.parameterTypes && it.returnType == reference.returnType
        }
    }

/** Follow actual StringBuilder appends, including R8's shared append helpers. */
internal fun dataClassFields(method: Method, resolve: (MethodReference) -> Method): Map<String, FieldReference> {
    val appended = mutableListOf<Any?>()
    val builder = Any()
    fun visit(current: Method, args: List<Any?>, depth: Int): Any? {
        require(depth <= 4) { "StringBuilder helper recursion exceeded" }
        val impl = requireNotNull(current.implementation)
        val registers = mutableMapOf<Int, Any?>()
        val parameterWords = current.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } +
            if (AccessFlags.STATIC.isSet(current.accessFlags)) 0 else 1
        var register = impl.registerCount - parameterWords
        args.forEach { registers[register++] = it }
        var returned: Any? = null
        for (instruction in impl.instructions) {
            val ref = (instruction as? ReferenceInstruction)?.reference
            val a = (instruction as? OneRegisterInstruction)?.registerA
            when (instruction.opcode) {
                Opcode.NEW_INSTANCE -> if (a != null) registers[a] =
                    if (ref.toString() == "Ljava/lang/StringBuilder;") builder else null
                Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> registers[a!!] = (ref as StringReference).string
                Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN, Opcode.IGET, Opcode.IGET_WIDE -> registers[a!!] = ref
                Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
                    registers[a!!] = registers[(instruction as TwoRegisterInstruction).registerB]
                Opcode.MOVE_RESULT_OBJECT -> registers[a!!] = returned
                Opcode.RETURN_OBJECT -> return registers[a!!]
                else -> {
                    if (ref !is MethodReference) continue
                    val words = when (instruction) {
                        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD,
                            instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
                        else -> continue
                    }
                    val values = words.map { registers[it] }
                    returned = null
                    if (ref.definingClass == "Ljava/lang/StringBuilder;" && values.firstOrNull() === builder) {
                        if (ref.name in setOf("<init>", "append") && values.size == 2) appended += values[1]
                        if (ref.name == "append" || ref.name == "toString") returned = builder
                    } else if ((ref.parameterTypes.any { it == "Ljava/lang/StringBuilder;" } && values.any { it === builder }) ||
                        ref.returnType == "Ljava/lang/StringBuilder;") {
                        returned = visit(resolve(ref), values, depth + 1)
                    }
                }
            }
        }
        return null
    }
    visit(method, listOf(null), 0)
    return appended.zipWithNext().mapNotNull { (label, field) ->
        if (label is String && field is FieldReference) label to field else null
    }.toMap()
}
