package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.template.patches.truecaller.shared.toStringFields
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Hides a row of the main Settings screen (General, Calls, Premium, ..., Truecaller for Wear OS).
 * The rows are fixed views of CategoriesFragment's layout, each with its own click listener, and
 * the fragment sets a row and its divider VISIBLE or GONE from one boolean of the screen's state
 * (CategoriesSettingsState). Every constructor of that state stores false for [flag] (for example
 * "isWatchItemVisible"), so the row and its divider stay GONE and no gap is left. Each call adds
 * its own store, so row patches work together in any order.
 */
internal fun BytecodePatchContext.hideSettingsCategory(flag: String) {
    val stateClass = CategoriesSettingsStateToStringFingerprint.classDef
    val field = settingsStateField(CategoriesSettingsStateToStringFingerprint.method, stateClass.type, flag)

    var stores = 0
    for (constructor in stateClass.methods.filter { it.name == "<init>" && it.implementation != null }) {
        val instructions = constructor.instructions.toList()
        val indices = instructions.indices.filter { index ->
            val stored = instructions[index].field()
            instructions[index].opcode == Opcode.IPUT_BOOLEAN && stored?.definingClass == field.definingClass &&
                stored.name == field.name && stored.type == field.type
        }
        // From the last store backwards, so the earlier indices stay valid.
        for (index in indices.reversed()) {
            val register = (instructions[index] as TwoRegisterInstruction).registerA
            constructor.addInstructionsAtControlFlowLabel(index, "const/16 v$register, 0x0")
            stores++
        }
    }
    if (stores == 0) throw PatchException("${stateClass.type} never stores $flag")
}

private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * The state field toString() prints right after "<flag>=". R8 outlines the data class toString into
 * static StringBuilder helpers, so the fields are mapped through the replayed append order
 * ([toStringFields]).
 */
private fun BytecodePatchContext.settingsStateField(toString: Method, stateType: String, flag: String): FieldReference {
    val fields = toStringFields(toString, stateType).filter { (name, field) -> name == flag && field.type == "Z" }
        .map { it.second }.toSet()
    return fields.singleOrNull() ?: throw PatchException("CategoriesSettingsState.toString prints $flag from fields $fields")
}
