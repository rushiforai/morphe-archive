package app.template.patches.drtv.player

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DRTV
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * DRTV marks intros and recaps with server time codes and shows a Skip button while one plays.
 * The button's own click handler (registered in BasePlayerFragment) hides it, records the skip
 * and seeks to one second past the end of the time code.
 *
 * The patch clicks that button for the user: right after the player makes it visible, it calls
 * `skipButton.callOnClick()`, so the app's own handler performs the skip. End credits never get
 * the button (they have no button title), so the app's autoplay to the next episode is unchanged,
 * and when the server turns the Skip button off (hide threshold 0) nothing is skipped either.
 * Seeking back into an intro skips it again.
 *
 * Verified 2026-10-29 against 4.39.0 (versionCode 439000): see COMPATIBILITY_DRTV.
 */
@Suppress("unused")
val autoSkipIntroPatch = bytecodePatch(
    name = "Auto skip intro",
    description = "Skips intros and recaps automatically.",
) {
    compatibleWith(COMPATIBILITY_DRTV)

    execute {
        val method = SkipButtonCheckFingerprint.method
        val insns = method.implementation?.instructions?.toList()
            ?: throw PatchException("${method.definingClass}->${method.name} has no implementation")

        // The one UiUtils.setViewVisibility(skipButton, VISIBLE) call: the other four pass GONE (8).
        val showCalls = insns.indices.filter { index ->
            val ref = (insns[index] as? ReferenceInstruction)?.reference as? MethodReference
            if (insns[index].opcode != Opcode.INVOKE_STATIC || ref?.name != "setViewVisibility" ||
                ref.parameterTypes.map(CharSequence::toString) != listOf("Landroid/view/View;", "I")
            ) {
                return@filter false
            }
            val visibility = (insns[index] as FiveRegisterInstruction).registerD
            val load = insns.getOrNull(index - 1)
            load?.opcode == Opcode.CONST_4 && (load as OneRegisterInstruction).registerA == visibility &&
                (load as NarrowLiteralInstruction).narrowLiteral == 0
        }
        val show = showCalls.singleOrNull() ?: throw PatchException(
            "${method.definingClass}->${method.name}: expected one setViewVisibility(skipButton, 0), found ${showCalls.size}",
        )
        val button = (insns[show] as FiveRegisterInstruction).registerC

        method.requireNoBranchTargetAt(show + 1, "Auto skip intro")
        method.addInstructionChecked(show + 1, "invoke-virtual { v$button }, Landroid/view/View;->callOnClick()Z")
    }
}
