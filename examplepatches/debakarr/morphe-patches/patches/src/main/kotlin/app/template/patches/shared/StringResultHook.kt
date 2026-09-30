package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val HELPER = "Lapp/template/extension/extension/SortByRatingsHelper;"

private val INVOKES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE,
)

/**
 * After every call matching [call] whose result of type [type] is kept
 * (`move-result-object vX`), pipes vX through `helper(type): type`.
 *
 * Uses the /range form so any register number works.
 */
internal fun MutableMethod.filterResults(
    helperMethod: String,
    type: String,
    call: (MethodReference) -> Boolean,
): Int {
    val instructions = implementation!!.instructions.toList()
    val targets = instructions.indices.filter { i ->
        val insn = instructions[i]
        if (insn.opcode !in INVOKES) return@filter false
        val ref = (insn as ReferenceInstruction).reference as? MethodReference ?: return@filter false
        ref.returnType == type && call(ref) &&
            instructions.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    if (targets.isEmpty()) throw PatchException("No $type call site found in $definingClass->$name")

    // Back to front so earlier indices stay valid.
    targets.asReversed().forEach { i ->
        val register = (instructions[i + 1] as OneRegisterInstruction).registerA
        addInstructions(
            i + 2,
            """
                invoke-static/range {v$register .. v$register}, $HELPER->$helperMethod($type)$type
                move-result-object v$register
            """.trimIndent(),
        )
    }
    return targets.size
}

/** String results, e.g. `ResponseBody.string()`. */
internal fun MutableMethod.filterStringResults(
    helperMethod: String,
    call: (MethodReference) -> Boolean,
) = filterResults(helperMethod, "Ljava/lang/String;", call)

/** Byte array results, e.g. `ResponseBody.bytes()`. */
internal fun MutableMethod.filterByteArrayResults(
    helperMethod: String,
    call: (MethodReference) -> Boolean,
) = filterResults(helperMethod, "[B", call)
