package lab.analiti.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import lab.analiti.patches.shared.COMPATIBILITY_ANALITI

/**
 * Hides the orange "Sign in" bar that sits under the toolbar on the Speed Test screen.
 *
 * The bar (`@id/globalMessages`) is populated by a single method which also prints an
 * "EXPERT" status line and an upgrade notice, so the view itself cannot simply be
 * removed without losing those. Instead this patch redirects only the guard that
 * selects the account/sign-in block:
 *
 *     if-eqz vX, :signInBlock   ->   if-eqz vX, :afterSignInBlock
 *
 * The guard is located by scanning forward from the `action_user_account` literal and
 * matching its register against the preceding boolean `move-result`. The branch is then
 * retargeted to the join point after the sign-in block, so the block is skipped while
 * the signed-in path and all other global-message paths stay intact.
 *
 * Both supported versions are handled by one implementation:
 *  - 2026.10.98554: `F(Lu31;)V`
 *  - 2026.10.98884: `j()V`
 * The fingerprint therefore declares no parameter constraint.
 *
 * This only removes the prompt: the account screen stays reachable from the navigation
 * drawer, and the bar still appears for a genuinely signed-in account.
 */
@Suppress("unused")
val hideSignInBannerPatch = bytecodePatch(
    name = "Hide sign-in banner",
    description = "Removes the orange \"Sign in\" prompt below the toolbar. The account " +
            "screen stays reachable from the drawer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANALITI)

    execute {
        val method = GlobalMessageBarFingerprint.method

        // The sign-in block is guarded by an `if-eqz` that follows the first use of
        // the account action string (in both supported versions).
        val anchor = method.indexOfFirstString("action_user_account")
        if (anchor < 0) {
            throw PatchException("Could not locate the account string in the message bar method.")
        }

        // The guard consumes the boolean produced by the preceding invoke-static + move-result.
        val resultRegister = method.findResultRegisterBefore(anchor)
        val branchIndex = method.findSignInGuardAfter(anchor, resultRegister)
        if (branchIndex < 0) {
            throw PatchException("Could not locate the sign-in guard in the message bar method.")
        }

        // Resolve the branch target (start of the sign-in block) and the join point after
        // the block. OffsetInstruction reports a *code offset* while the instruction APIs
        // work in *indices*, so translate by accumulating code units.
        val branch = method.getInstruction<OffsetInstruction>(branchIndex)
        val blockStart = method.indexOfCodeOffset(method.codeOffsetOf(branchIndex) + branch.codeOffset)
        if (blockStart < 0) {
            throw PatchException("Could not resolve the sign-in guard's branch target.")
        }

        val blockEndGotoIndex = method.findFirstGotoAtOrAfter(blockStart)
        if (blockEndGotoIndex < 0) {
            throw PatchException("Could not find the end of the sign-in block.")
        }
        val blockEndGoto = method.getInstruction<OffsetInstruction>(blockEndGotoIndex)
        val tailIndex = method.indexOfCodeOffset(method.codeOffsetOf(blockEndGotoIndex) + blockEndGoto.codeOffset)
        if (tailIndex < 0) {
            throw PatchException("Could not resolve the sign-in block's tail.")
        }

        // Retarget the conditional itself so the not-signed-in path skips the whole
        // sign-in block and lands on the common tail that hides the bar when empty.
        // (Inserting an instruction at the branch target would not work: the original
        // branch offset would still point past the inserted instruction.)
        val branchRegister = method.getInstruction<OneRegisterInstruction>(branchIndex).registerA
        method.addInstructionsWithLabels(
            branchIndex,
            "if-eqz v$branchRegister, :skipSignIn",
            ExternalLabel("skipSignIn", method.getInstruction(tailIndex)),
        )
        method.removeInstruction(branchIndex + 1)

        // 2026.10.98884 keeps a warning glyph in the bar even after the sign-in text
        // is skipped, which still renders an empty orange strip. For that method shape
        // (zero parameters) force the bar's visibility call to GONE.
        if (method.parameterTypes.isEmpty()) {
            method.forceMessageBarHiddenFrom(tailIndex)
        }
    }
}

/** Index of the first instruction loading [value] as a string constant, or -1. */
private fun MutableMethod.indexOfFirstString(value: String): Int {
    val instructions = implementation?.instructions ?: return -1
    instructions.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        if (reference is StringReference && reference.string == value) return index
    }
    return -1
}

/** Register written by the nearest MOVE_RESULT before [index], or -1. */
private fun MutableMethod.findResultRegisterBefore(index: Int): Int {
    for (i in index - 1 downTo 0) {
        val instruction = getInstruction<Instruction>(i)
        if (instruction.opcode == Opcode.MOVE_RESULT) {
            return getInstruction<OneRegisterInstruction>(i).registerA
        }
        if (instruction.opcode == Opcode.RETURN || instruction.opcode == Opcode.RETURN_VOID) break
    }
    return -1
}

/**
 * First IF_EQZ after the string anchor. When [expectedRegister] is non-negative the
 * branch register must match it. Works for both the (L)V and ()V method shapes.
 */
private fun MutableMethod.findSignInGuardAfter(anchor: Int, expectedRegister: Int): Int {
    val instructions = implementation?.instructions?.toList() ?: return -1
    var index = anchor + 1
    var scanned = 0
    while (index < instructions.size && scanned < 24) {
        val instruction = instructions[index]
        if (instruction.opcode == Opcode.IF_EQZ) {
            val register = (instruction as? OneRegisterInstruction)?.registerA ?: -1
            if (expectedRegister < 0 || register == expectedRegister) return index
        }
        if (instruction.opcode == Opcode.RETURN || instruction.opcode == Opcode.RETURN_VOID) break
        index++
        scanned++
    }
    return -1
}

/** First GOTO instruction at or after [start], or -1. */
private fun MutableMethod.findFirstGotoAtOrAfter(start: Int): Int {
    val instructions = implementation?.instructions?.toList() ?: return -1
    for (index in start until instructions.size) {
        when (instructions[index].opcode) {
            Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> return index
            else -> Unit
        }
    }
    return -1
}

/**
 * Finds the first `View.setVisibility(I)` call at or after [fromIndex] and rewrites its
 * integer argument to 0x8 (GONE). Used only for the 98884 method shape where the bar
 * keeps a warning glyph even with no sign-in text.
 */
private fun MutableMethod.forceMessageBarHiddenFrom(fromIndex: Int) {
    val instructions = implementation?.instructions?.toList() ?: return
    for (index in fromIndex until instructions.size) {
        val instruction = instructions[index]
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL) continue
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if (reference.definingClass != "Landroid/view/View;" || reference.name != "setVisibility") continue
        if (reference.parameterTypes.singleOrNull() != "I") continue
        val register = (instruction as? Instruction35c)?.registerD ?: continue
        addInstructions(index, "const/16 v$register, 0x8")
        return
    }
}

/** Bytecode offset, in code units, of the instruction at [index]. */
private fun MutableMethod.codeOffsetOf(index: Int): Int {
    val instructions = implementation?.instructions
        ?: throw PatchException("Message bar method has no implementation.")
    var offset = 0
    instructions.forEachIndexed { i, instruction ->
        if (i == index) return offset
        offset += instruction.codeUnits
    }
    throw PatchException("Instruction index $index is out of range.")
}

/** Instruction index for the given bytecode [offset], or -1 when there is none. */
private fun MutableMethod.indexOfCodeOffset(offset: Int): Int {
    val instructions = implementation?.instructions ?: return -1
    var current = 0
    instructions.forEachIndexed { i, instruction ->
        if (current == offset) return i
        current += instruction.codeUnits
    }
    return -1
}
