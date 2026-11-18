package local.roborock

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.addFreeRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

val savedServerUrlPatch = patch {
    execute {
        originalAppFingerprint()
        val owner = mutableClassDefBy("Lcom/roborock/smart/refactor/data/repo/user/o0OoOo0;")
        val original = owner.methods.single { it.name == "OooO0oO" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" }
        check(original.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "server"
        }) { "Saved server URL getter no longer reads the server storage key" }
        val patternRegister = original.implementation!!.registerCount
        val replacementRegister = patternRegister + 1
        check(replacementRegister < 16) { "Unexpected register layout for saved server URL" }
        val (method, _) = original.addFreeRegisters(2)
        val returns = method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
        check(returns.size == 1) { "Unexpected saved server URL getter" }
        val index = returns.single()
        val valueRegister = method.getInstruction<OneRegisterInstruction>(index).registerA
        check(valueRegister < 16) { "Unexpected server URL return register" }

        // The getter's null check protects replaceAll.
        // An injected branch label would corrupt its existing forward branch during DEX emission.
        val nullCheckIndex = method.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.IF_EQZ
        }
        check(method.implementation!!.instructions.any { it.opcode == Opcode.THROW }) {
            "Saved server URL getter lost its null-check throw path"
        }
        check(nullCheckIndex >= 0 && nullCheckIndex + 1 == index) {
            "Saved server URL getter no longer null-checks its return value in place"
        }
        check(method.getInstruction<OneRegisterInstruction>(nullCheckIndex).registerA == valueRegister) {
            "Saved server URL null check reads a different register than the return"
        }
        method.addInstructions(index, """
            const-string v$patternRegister, "/+$"
            const-string v$replacementRegister, ""
            invoke-virtual {v$valueRegister, v$patternRegister, v$replacementRegister}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$valueRegister
        """)
    }
}
