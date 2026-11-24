package app.aidan.patches.geocaching.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Finds all Ldic;->e()Z (user session premium check) call sites in [method] and forces their
 * move-result register to [value] (0x1 for true, 0x0 for false).
 */
fun patchAllPremiumChecksToValue(
    method: MutableMethod,
    contextName: String,
    value: Boolean
) {
    val impl = method.implementation ?: throw PatchException("Missing implementation in $contextName")
    val instructions = impl.instructions.toList()

    // Collect indices of all MOVE_RESULT instructions that immediately follow an invoke-virtual Ldic;->e()Z
    val patches = mutableListOf<Pair<Int, Int>>() // pair of (insertionIndex, registerNumber)
    var foundCall = false

    for (i in 0 until instructions.size - 1) {
        val current = instructions[i]
        val next = instructions[i + 1]

        val isPremiumInvoke = current.opcode == Opcode.INVOKE_VIRTUAL &&
            (current as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? MethodReference)?.let { m ->
                    m.name == "e" && m.definingClass == "Ldic;" && m.returnType == "Z"
                } == true
            } == true

        if (isPremiumInvoke && next.opcode == Opcode.MOVE_RESULT) {
            foundCall = true
            val reg = (next as OneRegisterInstruction).registerA
            val after = instructions.getOrNull(i + 2)
            val expectedVal = if (value) 1 else 0
            val alreadyPatched = after?.opcode == Opcode.CONST_4 &&
                (after as? OneRegisterInstruction)?.registerA == reg &&
                (after as? com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction)?.narrowLiteral == expectedVal
            if (!alreadyPatched) {
                patches.add(Pair(i + 2, reg))
            }
        }
    }

    if (!foundCall) {
        throw PatchException("No Ll3c;->d()Z calls found in $contextName")
    }

    // Apply insertions from highest index to lowest so instruction indices remain valid
    val constVal = if (value) "0x1" else "0x0"
    for ((insertIdx, reg) in patches.asReversed()) {
        method.addInstructions(insertIdx, "const/4 v$reg, $constVal")
    }
}

/**
 * In FilterPreferences.h (dk3.h), replaces the hardcoded `sget-object v15, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;`
 * argument for `includeOwnedDisabledCaches` with `const/4 v15, 0x0` (null).
 *
 * This prevents the Geocaching server from rejecting map searches with HTTP 403 Forbidden,
 * while allowing all user-configured filters (cache types, sizes, difficulty, terrain, attributes, etc.)
 * to be sent and applied cleanly.
 */
fun patchIncludeOwnedDisabledCachesToNull(method: MutableMethod) {
    val impl = method.implementation ?: return
    val instructions = impl.instructions.toList()
    for ((index, instruction) in instructions.withIndex()) {
        if (instruction.opcode == Opcode.SGET_OBJECT) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (ref?.definingClass == "Ljava/lang/Boolean;" && ref.name == "TRUE" && ref.type == "Ljava/lang/Boolean;") {
                val reg = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "const/4 v$reg, 0x0")
                return
            }
        }
    }
}
