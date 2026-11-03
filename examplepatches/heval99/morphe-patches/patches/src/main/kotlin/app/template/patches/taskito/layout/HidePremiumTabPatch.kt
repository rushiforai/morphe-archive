package app.template.patches.taskito.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TASKITO
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Taskito adds a "Premium" tab to the end of its bottom bar while the account has no entitlement
 * and no Play order and the remote "premium_tab" experiment is on. Enable Premium does not touch
 * that check (it forces the premium getter, not the "no entitlement and orders" one), so the tab
 * stays. The bar builder tests both conditions and only then appends the tab, so the patch makes
 * the last test (the experiment) answer false right before its branch. That is the same bar every
 * user outside the experiment gets: the bar selects tabs by route key and ignores unknown keys,
 * and the premium page stays reachable from Settings.
 *
 * Verified 2026-11-02 against 1.3.3 (versionCode 1331): smoke test, CLI without -f, a decompiled
 * check of the bar builder and an emulator run with the experiment forced on (stock shows the
 * Premium tab, the patched build does not). See COMPATIBILITY_TASKITO.
 */
@Suppress("unused")
val hidePremiumTabPatch = bytecodePatch(
    name = "Hide Premium tab",
    description = "Hides the Premium tab in the bottom bar.",
) {
    compatibleWith(COMPATIBILITY_TASKITO)

    execute {
        BottomNavigationBuilderFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val premiumTabs = instructions.indices.filter { index ->
                instructions[index].opcode == Opcode.CONST_STRING &&
                    ((instructions[index] as ReferenceInstruction).reference as StringReference).string == "premium"
            }
            val premiumTab = premiumTabs.singleOrNull()
                ?: throw PatchException("Expected one \"premium\" tab in $definingClass.$name, found ${premiumTabs.size}")

            // The branch right before the tab is the experiment check: a Boolean call, its
            // move-result, and an if-eqz that jumps past the tab when the result is false.
            val branch = (premiumTab - 1 downTo 0).firstOrNull { instructions[it].opcode == Opcode.IF_EQZ }
                ?: throw PatchException("No if-eqz guards the \"premium\" tab in $definingClass.$name")
            val register = (instructions[branch] as OneRegisterInstruction).registerA
            val moveResult = instructions.getOrNull(branch - 1)
            if (moveResult?.opcode != Opcode.MOVE_RESULT || (moveResult as OneRegisterInstruction).registerA != register) {
                throw PatchException("The \"premium\" tab guard in $definingClass.$name does not test a call result")
            }
            val target = (instructions[branch] as BuilderOffsetInstruction).target.location.index
            if (target <= premiumTab) {
                throw PatchException("The \"premium\" tab guard in $definingClass.$name does not jump past the tab")
            }

            requireNoBranchTargetAt(branch, "Hide Premium tab")
            val const = if (register < 16) "const/4" else "const/16"
            addInstructionsChecked(branch, "$const v$register, 0x0")
        }
    }
}
