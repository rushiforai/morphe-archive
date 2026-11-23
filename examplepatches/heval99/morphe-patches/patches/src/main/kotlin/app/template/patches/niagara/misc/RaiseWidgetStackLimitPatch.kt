package app.template.patches.niagara.misc

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.niagara.premium.enablePremiumPatch
import app.template.patches.shared.Constants.COMPATIBILITY_NIAGARA
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Niagara's Pro maximum of widgets in one stack. */
private const val STOCK_WIDGET_STACK_LIMIT = 4

/** The new maximum (a chosen value, not something the app defines). */
private const val WIDGET_STACK_LIMIT = 20

/**
 * Niagara caps a widget stack at 4 widgets for Pro accounts (a smaller cap for free ones). Two
 * places in the same R8-renamed class enforce it, both found by shape (no obfuscated names):
 *
 * - the suspend add method (the only one with the "Widget stack at " message) reads the Pro flag
 *   and, right after the `if-eqz`, loads the Pro maximum 4 into a register that is saved into the
 *   coroutine state and later compared and printed in "Widget stack at N/max". That constant
 *   becomes [WIDGET_STACK_LIMIT];
 * - the stack-full pre-check (matched only inside that same class) compares `List.size` with a 4
 *   held in a register that is also passed on as a selector, so the constant stays and the size is
 *   lowered instead: `N - 4` is subtracted from the size register (dead after the compare) right before
 *   the `if-lt`.
 *
 * Needs Enable Premium, because the raised cap sits on the Pro branch. Verified 2026-11-22 against
 * 1.16.37 by the bytecode test only; runtime not run.
 */
@Suppress("unused")
val raiseWidgetStackLimitPatch = bytecodePatch(
    name = "Raise widget stack limit",
    description = "Allows up to 20 widgets in the widget stack.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_NIAGARA)
    dependsOn(enablePremiumPatch)

    execute {
        // ── 1. The add method's Pro maximum ──────────────────────────────────────────────────
        val addMethod = WidgetStackAddFingerprint.method
        val addLabel = "${addMethod.definingClass}->${addMethod.name}"
        val limitIndex = WidgetStackAddFingerprint.instructionMatches[2].index
        val limitInsn = addMethod.getInstruction(limitIndex)
        if (limitInsn.opcode != Opcode.CONST_4 ||
            (limitInsn as NarrowLiteralInstruction).narrowLiteral != STOCK_WIDGET_STACK_LIMIT
        ) {
            throw PatchException("$addLabel: instruction $limitIndex is not const/4 $STOCK_WIDGET_STACK_LIMIT")
        }
        val limitRegister = (limitInsn as OneRegisterInstruction).registerA
        // const/16 takes any register up to v255, the const/4 it replaces only v0..v15.
        addMethod.replaceInstruction(limitIndex, "const/16 v$limitRegister, 0x${WIDGET_STACK_LIMIT.toString(16)}")

        // ── 2. The stack-full pre-check, only inside the add method's class ─────────────────────
        val fullFingerprint = widgetStackFullCheckFingerprint(addMethod.definingClass)
        val fullMethod = fullFingerprint.method
        val fullLabel = "${fullMethod.definingClass}->${fullMethod.name}"
        val matches = fullFingerprint.instructionMatches
        val sizeRegister = (fullMethod.getInstruction(matches[1].index) as OneRegisterInstruction).registerA
        val constRegister = (fullMethod.getInstruction(matches[2].index) as OneRegisterInstruction).registerA
        val ifIndex = matches[3].index
        val compare = fullMethod.getInstruction<TwoRegisterInstruction>(ifIndex)
        if (compare.registerA != sizeRegister || compare.registerB != constRegister) {
            throw PatchException(
                "$fullLabel: the if-lt compares v${compare.registerA} with v${compare.registerB}, " +
                    "not the list size v$sizeRegister with the limit v$constRegister",
            )
        }
        fullMethod.requireNoBranchTargetAt(ifIndex, "stack-full size adjustment")
        fullMethod.addInstructionChecked(
            ifIndex,
            "add-int/lit8 v$sizeRegister, v$sizeRegister, -${WIDGET_STACK_LIMIT - STOCK_WIDGET_STACK_LIMIT}",
        )
    }
}
