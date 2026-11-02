package dev.hyzor.patches.duolingo.shared

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.hyzor.patches.util.getReference
import dev.hyzor.patches.util.indexOfFirstInstruction
import dev.hyzor.patches.util.toStringMethod

/**
 * Resolves the field printed by `toString()` right after the literal containing [subStr].
 *
 * Duolingo's generated `toString()`s print `", <serializedName>="` and then the field, but the
 * compiler batches several label/field pairs into a helper call, so the instruction immediately
 * after the label can be another `const-string`. The field access is always the second instruction
 * after the label in that shape, and the plain `const-string` / `append` / `iget` shape of older
 * versions happens to line up with it too.
 *
 * The offset is version-dependent, so a missing instruction or a non-field instruction fails the
 * patch with the label and class instead of silently resolving the wrong field.
 */
internal fun ClassDef.fieldFromToString(subStr: String): FieldReference {
    val toString = this.toStringMethod()
        ?: throw PatchException("Could not find a public toString() on $type")

    val strIndex = toString.indexOfFirstInstruction {
        opcode == Opcode.CONST_STRING &&
            getReference<StringReference>()?.string?.contains(subStr) == true
    }
    if (strIndex < 0) {
        throw PatchException("Could not find '$subStr' in $type->toString()")
    }

    val instruction = toString.implementation?.instructions?.elementAtOrNull(strIndex + 2)
        ?: throw PatchException("No instruction after '$subStr' in $type->toString()")

    return (instruction as? ReferenceInstruction)?.reference as? FieldReference
        ?: throw PatchException("Expected a field access after '$subStr' in $type->toString()")
}
