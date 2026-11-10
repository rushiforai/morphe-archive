/*
 * Adapted from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0):
 * reels/prompts/HideReelPromptsPatch.kt (findOverlayEnum), feed/refresh/BlockReturnRefreshPatch.kt
 * (enumConstant), misc/extension/ExtensionSupport.kt (filterBooleanReturns, filterObjectReturns) and
 * util/BytecodeUtils.kt (addInstructionsAtControlFlowLabel, from Morphe/ReVanced).
 * Modified for facebook-morphe-patches, 2026.
 */
package app.fbpatches.patches.facebook.ads.affiliate

import app.fbpatches.patches.facebook.shared.EXTENSION_CLASSES
import app.fbpatches.patches.facebook.shared.holdsString
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val INTEREST_PROMPT = "INTERESTED_OR_NOT_INTERESTED_BUMPER"
private const val TUNE_YOUR_ALGORITHM = "TUNE_YOUR_ALGORITHM"

private fun isOverlayEnum(classDef: ClassDef): Boolean = classDef.superclass == "Ljava/lang/Enum;" && classDef.methods.any {
    it.name == "<clinit>" && holdsString(it, INTEREST_PROMPT) && holdsString(it, TUNE_YOUR_ALGORITHM)
}

/** The reel overlay enum, which names the interest prompt and the product card among its items. */
internal fun BytecodePatchContext.findOverlayEnum(): ClassDef {
    val enums = classDefByStrings(INTEREST_PROMPT, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .filter(::isOverlayEnum)
    return enums.singleOrNull()
        ?: throw PatchException("$PATCH: expected one enum naming $INTEREST_PROMPT and $TUNE_YOUR_ALGORITHM, found ${enums.size}")
}

/** The static field of [enum] its static initialiser stores [name]'s constant in, as a reference. */
internal fun enumConstant(enum: ClassDef, name: String): String? {
    val clinit = enum.methods.firstOrNull { it.name == "<clinit>" } ?: return null
    var last: String? = null
    for (instruction in clinit.implementation?.instructions?.toList().orEmpty()) {
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is StringReference -> last = reference.string
            is FieldReference -> if (instruction.opcode == Opcode.SPUT_OBJECT && reference.type == enum.type &&
                reference.definingClass == enum.type && last == name
            ) {
                return reference.toString()
            }
        }
    }
    return null
}

/**
 * Inserts instructions at [insertIndex] so they take over the control flow label already there:
 * every branch to the original instruction runs the new code first.
 */
internal fun MutableMethod.addInstructionsAtControlFlowLabel(
    insertIndex: Int,
    instructions: String,
    vararg externalLabels: ExternalLabel,
) {
    addInstruction(insertIndex + 1, getInstruction(insertIndex))
    addInstructionsWithLabels(insertIndex + 1, instructions, *externalLabels)
    removeInstruction(insertIndex)
}

/**
 * Hands each answer of a boolean method to [hook], a static (I)Z, and returns what it says. The hook
 * takes an int because ART lets a boolean method return a register it types as int or byte.
 */
internal fun MutableMethod.filterBooleanReturns(what: String, hook: String) {
    if (returnType != "Z") throw PatchException("$what: $definingClass->$name answers $returnType, not a boolean")
    if (!hook.endsWith("(I)Z")) throw PatchException("$what: $hook must take the answer as an int, (I)Z")
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }.map { it.index }
    if (returns.isEmpty()) throw PatchException("$what: $definingClass->$name never returns")
    for (index in returns.asReversed()) {
        val answer = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$answer .. v$answer }, $hook
                move-result v$answer
            """,
        )
    }
}

/** [filterBooleanReturns] for a method that answers an object, cast back when the hook answers a wider type. */
internal fun MutableMethod.filterObjectReturns(what: String, hook: String) {
    if (!returnType.startsWith("L") && !returnType.startsWith("[")) {
        throw PatchException("$what: $definingClass->$name answers $returnType, not an object")
    }
    val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
    if (returns.isEmpty()) throw PatchException("$what: $definingClass->$name never returns")
    val castBack = !hook.endsWith(")$returnType")
    for (index in returns.asReversed()) {
        val answer = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$answer .. v$answer }, $hook
                move-result-object v$answer
            """ + if (castBack) "check-cast v$answer, $returnType\n" else "",
        )
    }
}
