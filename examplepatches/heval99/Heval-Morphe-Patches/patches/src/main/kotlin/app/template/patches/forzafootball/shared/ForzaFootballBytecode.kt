package app.template.patches.forzafootball.shared

import app.morphe.patcher.Match
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The app (Kotlin Multiplatform) is heavily R8-renamed, but R8 kept the data class toString()
// strings and the class name kotlin.Unit (its INSTANCE field is renamed: Lkotlin/Unit;->a in
// 6.15.10). Fields are found through their toString labels and Unit is copied from the patched
// method's own code, never hard-coded. Obfuscated names in comments are the 6.15.10 ones.

private fun Instruction.stringRef() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Method.insns(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun FieldReference.smali() = "$definingClass->$name:$type"

/**
 * `return Unit` at entry. Unit is the `sget-object vX, Lkotlin/Unit;->f` read right before a
 * `return-object vX` in the method itself. v0 always exists: every hooked method takes a parameter.
 */
internal fun MutableMethod.returnUnit() {
    val insns = insns()
    val units = insns.indices.mapNotNull { i ->
        val field = insns[i].fieldRef()?.takeIf {
            insns[i].opcode == Opcode.SGET_OBJECT && it.definingClass == "Lkotlin/Unit;" && it.type == "Lkotlin/Unit;"
        } ?: return@mapNotNull null
        val next = insns.getOrNull(i + 1)
        if (next?.opcode == Opcode.RETURN_OBJECT &&
            (next as OneRegisterInstruction).registerA == (insns[i] as OneRegisterInstruction).registerA
        ) field.smali() else null
    }.distinct()
    val unit = units.singleOrNull()
        ?: throw PatchException("$definingClass->$name: expected one returned kotlin.Unit, found $units")
    addInstructionsChecked(
        0,
        """
            sget-object v0, $unit
            return-object v0
        """,
    )
}

/**
 * The boolean field a data class toString() appends right after [label] (", optedOut="): the first
 * iget-boolean on the class after the label's const-string, with no other label in between.
 */
internal fun Match.booleanFieldAfterLabel(label: String): FieldReference {
    val insns = method.insns()
    val at = insns.indexOfFirst { it.stringRef() == label }
    if (at < 0) throw PatchException("${classDef.type} toString has no \"$label\"")
    val read = (at + 1 until insns.size).firstOrNull { index ->
        insns[index].opcode == Opcode.IGET_BOOLEAN && insns[index].fieldRef()?.definingClass == classDef.type
    } ?: throw PatchException("${classDef.type} toString reads no boolean after \"$label\"")
    val labelsBetween = (at + 1 until read).mapNotNull { insns[it].stringRef() }.filter { it.endsWith("=") }
    if (labelsBetween.isNotEmpty()) {
        throw PatchException("${classDef.type} toString prints $labelsBetween between \"$label\" and its value")
    }
    return insns[read].fieldRef()!!
}

/**
 * Stores [value] into the boolean [field] right before every return-void of every constructor of its
 * class that stores the field, so the value holds whatever the caller, copy() or the deserializer
 * passed. Constructors that only delegate to another one are left alone. `this` is copied to v0
 * first because p0 can be above v15 (the 4-bit iput-boolean); v0 and v1 are free at a return.
 */
internal fun BytecodePatchContext.forceBooleanInConstructors(field: FieldReference, value: Boolean, what: String) {
    val constructors = mutableClassDefBy(field.definingClass).methods.filter { constructor ->
        constructor.name == "<init>" && constructor.insns().any {
            it.opcode == Opcode.IPUT_BOOLEAN && it.fieldRef()?.smali() == field.smali()
        }
    }
    if (constructors.isEmpty()) throw PatchException("$what: no constructor of ${field.definingClass} stores ${field.name}")
    for (constructor in constructors) {
        if (constructor.implementation!!.registerCount < 2) {
            throw PatchException("$what: ${field.definingClass}-><init> has fewer than 2 registers")
        }
        val returns = constructor.insns().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        for (index in returns.sortedDescending()) {
            // Labels move onto the inserted code, so a jump to the return stores the value too.
            constructor.addInstructionsAtControlFlowLabelChecked(
                index,
                """
                    move-object/from16 v0, p0
                    const/4 v1, ${if (value) "0x1" else "0x0"}
                    iput-boolean v1, v0, ${field.smali()}
                """,
            )
        }
    }
}
