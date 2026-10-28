package patches.simosa

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * "Restore streak by watching an ad" (issue #58). The daily check-in screen runs the ad for a
 * pending CheckInAdShowRequest(adType, apiAction) and hands the resulting AdStatus to a callback
 * lambda (obfuscated `i4.q$d.p(request, viewModel, adUnit, context, adStatus)`):
 *
 *     if (adStatus.adShow == false && request.apiAction == Restore) { reload ad; re-show restore dialog }
 *     else viewModel.onCheckInAdFinished(request)   // Restore -> restoreCheckIn(now, "ad")
 *
 * Both ad-removal patches stop the rewarded ad from loading, so adShow is always false: the
 * milestone claim (apiAction == CheckIn) still falls through, but a streak restore loops back to
 * the dialog and never reaches the API. The backend can't tell the difference (the "ad" restore
 * sends method="ad" and a client timestamp as external_reference, no ad-SDK verification), so we
 * force the `adShow == false` test to fail and let the restore go through, like the milestone.
 *
 * Hidden; pulled in by "Remove ads & tracking" and "Remove daily check-in ads".
 */
internal val checkInAdFinishedCallbackFingerprint = Fingerprint(
    returnType = "Lkotlin/Unit;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(string("Daily Checkin Screen")),
    // the 3-arg interstitial callback carries the same string; the 5-arg rewarded one has the guard
    custom = { m, _ ->
        m.parameterTypes.size == 5 &&
            m.parameterTypes[2] == "Ljava/lang/String;" &&
            m.parameterTypes[3] == "Landroid/content/Context;"
    },
)

internal val restoreStreakWithoutAdPatch = bytecodePatch(
    description = "Lets the daily check-in streak restore go through when the restore ad can't show.",
) {
    compatibleWith(COMPATIBILITY_SIMOSA)

    execute {
        val method = checkInAdFinishedCallbackFingerprint.method
        val insns = method.instructions.toList()
        val adStatusType = method.parameterTypes[4].toString()

        // adStatus.adShow (a no-arg Boolean getter on the AdStatus param) ...
        val getterIdx = insns.indexOfFirst { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            insn.opcode == Opcode.INVOKE_VIRTUAL && ref != null && ref.definingClass == adStatusType &&
                ref.returnType == "Ljava/lang/Boolean;" && ref.parameterTypes.isEmpty()
        }
        check(getterIdx >= 0) { "AdStatus Boolean getter not found in ${method.name}" }
        // ... == Boolean.FALSE
        val eqIdx = (getterIdx until insns.size).firstOrNull { i ->
            val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lkotlin/jvm/internal/Intrinsics;" && ref.name == "areEqual"
        } ?: error("adShow == FALSE comparison not found in ${method.name}")
        val moveResult = insns[eqIdx + 1]
        val branch = insns[eqIdx + 2]
        check(
            moveResult.opcode == Opcode.MOVE_RESULT && branch.opcode == Opcode.IF_EQZ &&
                (moveResult as OneRegisterInstruction).registerA == (branch as OneRegisterInstruction).registerA,
        ) { "unexpected guard shape in ${method.name}" }

        // result := false, so the if-eqz always jumps to onCheckInAdFinished(request)
        val reg = moveResult.registerA
        method.addInstructions(eqIdx + 2, if (reg < 16) "const/4 v$reg, 0x0" else "const/16 v$reg, 0x0")
    }
}
