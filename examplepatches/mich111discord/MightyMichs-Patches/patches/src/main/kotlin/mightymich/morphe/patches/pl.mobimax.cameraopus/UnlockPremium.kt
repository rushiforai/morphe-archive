package mightymich.morphe.patches.pl.mobimax.cameraopus

import app.morphe.framework.patcher.annotation.Patch
import app.morphe.framework.patcher.BytecodePatch
import app.morphe.framework.patcher.MethodInstructionMatcher
import app.morphe.framework.patcher.BytecodeContext
import org.jf.dexlib2.Opcode
import org.jf.dexlib2.builder.instruction.BuilderInstruction11n
import org.jf.dexlib2.builder.instruction.BuilderInstruction11x

@Patch(
    name = "Unlock Premium",
    description = "Bypasses Google Play Billing verification by forcing BillingResult.getResponseCode() to return 0 (OK)."
)
object UnlockPremium : BytecodePatch(
    setOf(BillingResultPatch)
)

object BillingResultPatch : BytecodeContext() {
    init {
        patch(
            MethodInstructionMatcher(
                className = "Lcom/android/billingclient/api/BillingResult;",
                methodName = "getResponseCode",
                methodDescriptor = "()I"
            )
        ) {
            val instructions = mutableMethod.implementation?.instructions ?: return@patch
            instructions.clear()
            // const/4 v0, 0x0
            instructions.add(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
            // return v0
            instructions.add(BuilderInstruction11x(Opcode.RETURN, 0))
        }
    }
}
