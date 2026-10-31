package app.spotify.capture.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** [android.media.AudioAttributes.ALLOW_CAPTURE_BY_ALL] */
internal const val ALLOW_CAPTURE_BY_ALL = 0x1

private val CAPTURE_POLICY_METHODS = setOf(
    "setAllowedCapturePolicy",
)

internal data class CapturePolicyPatchResult(
    val edited: Int,
    val alreadyAllowAll: Int,
    val unresolved: Int,
)

/**
 * Rewrites const loads that feed [setAllowedCapturePolicy] to ALLOW_CAPTURE_BY_ALL.
 * Ported from ReVanced spotify/disable-capture-restriction (timschneeb, PR #2095).
 */
internal fun patchAllowedCapturePolicyCalls(method: MutableMethod): CapturePolicyPatchResult {
    val implementation = method.implementation ?: return CapturePolicyPatchResult(0, 0, 0)
    val edits = mutableMapOf<Int, String>()
    var alreadyAllowAll = 0
    var unresolved = 0

    implementation.instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_INTERFACE) {
            return@forEachIndexed
        }
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
        if (ref.name !in CAPTURE_POLICY_METHODS) return@forEachIndexed

        val paramRegister = (instruction as? FiveRegisterInstruction)?.registerD ?: run {
            unresolved++
            return@forEachIndexed
        }

        var matched = false
        for (back in index downTo 0) {
            val prior = implementation.instructions[back]
            when (prior.opcode) {
                Opcode.CONST_4, Opcode.CONST_16 -> {
                    val reg = (prior as OneRegisterInstruction).registerA
                    if (reg != paramRegister) continue
                    matched = true
                    val value = (prior as? NarrowLiteralInstruction)?.narrowLiteral
                    when (value) {
                        ALLOW_CAPTURE_BY_ALL -> alreadyAllowAll++
                        else -> edits[back] = "const/4 v$reg, $ALLOW_CAPTURE_BY_ALL"
                    }
                    break
                }
                Opcode.CONST -> {
                    val reg = (prior as OneRegisterInstruction).registerA
                    if (reg != paramRegister) continue
                    matched = true
                    val value = (prior as? WideLiteralInstruction)?.wideLiteral?.toInt()
                    when (value) {
                        ALLOW_CAPTURE_BY_ALL -> alreadyAllowAll++
                        else -> edits[back] = "const/4 v$reg, $ALLOW_CAPTURE_BY_ALL"
                    }
                    break
                }
                else -> continue
            }
        }
        if (!matched) unresolved++
    }

    edits.keys.sortedDescending().forEach { index ->
        method.replaceInstruction(index, edits[index]!!)
    }
    return CapturePolicyPatchResult(edited = edits.size, alreadyAllowAll = alreadyAllowAll, unresolved = unresolved)
}
