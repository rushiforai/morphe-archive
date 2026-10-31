package app.personal.patches.olauncher

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fingerprint
import app.morphe.patcher.methodCall
import app.personal.patches.shared.Constants.COMPATIBILITY_PRO_LAUNCHER
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// Target: x9.v0.h():boolean, the trial-window check.
//   public final boolean h() {
//       return k() && !PAYMENT_FAILURE_TRIAL_ENDED && System.currentTimeMillis() < i();
//   }
//
// Callers of h():
//   - x9.v0.t() = IS_PRO || h()   -> true, and u() (preference migration) still runs
//   - gc.a.onReceived gate        -> true, so SubscriberInfo.isPro is true
//   - ComposeMainActivity.onCreate -> skips the PAYMENT_FAILURE_TRIAL_ENDED write
//   - x9.v0.j()                    -> false
//   - ComposeMainActivity.onResume -> h() || j() would show the trial sheet; handled below
val proUnlockFingerprint = fingerprint {
    returns("Z")
    custom { method, classDef ->
        classDef.type == "Lx9/v0;" && method.name == "h" && method.parameterTypes.isEmpty()
    }
}

// Target: ComposeMainActivity.onResume, the trial sheet check
//   if (u().h() || u().j()) { ...show trial sheet once a day... }
// The h() call is replaced by a constant false, so only j() can show the sheet.
val composeMainOnResumeFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == "Lapp/prolauncher/compose/ui/ComposeMainActivity;" && method.name == "onResume"
    }
}

val proUnlockPatch = bytecodePatch(
    name = "Pro unlock",
    description = "Makes x9.v0.h() always return true and hides the trial sheet that this causes.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PRO_LAUNCHER)

    execute {
        // Force h() to return true. Smali prepended to the method, using a free register.
        val (method, register) = proUnlockFingerprint.method.addFreeRegisters(1)
        method.addInstructions(0, "const/16 v$register, 0x1\n    return v$register")

        // In onResume, replace the h() call and its move-result with a constant false.
        val onResume = composeMainOnResumeFingerprint.method
        val hCall = onResume.findInstructionIndicesReversedOrThrow(
            methodCall(definingClass = "Lx9/v0;", name = "h", returnType = "Z"),
        ).last()
        val resultRegister = onResume.getInstruction<OneRegisterInstruction>(hCall + 1).registerA
        onResume.replaceInstruction(hCall, "nop")
        onResume.replaceInstruction(hCall + 1, "const/16 v$resultRegister, 0x0")
    }
}
