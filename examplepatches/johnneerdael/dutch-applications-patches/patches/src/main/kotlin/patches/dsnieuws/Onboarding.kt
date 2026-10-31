package patches.dsnieuws

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Complete persisted state before the original branch, after its normal main graph. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun completeOnboarding() {
    val method = exact("Lbe/mediahuis/one/ui/BottomNavigationActivity;", "setUpNavController()V").method
    val settings = "Lbe/mediahuis/core/data/datasources/settings/SettingsDataSource;"
    val calls = method.instructions.withIndex().filter { (_, instruction) ->
        val ref = ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
        ref?.definingClass == settings && ref.name == "getOnboardingCompleted" &&
            ref.parameterTypes.isEmpty() && ref.returnType == "Z"
    }
    check(calls.size == 1) { "Expected one dsnieuws onboarding preference check" }
    val (index, instruction) = calls.single()
    check(instruction.opcode == Opcode.INVOKE_VIRTUAL)
    val call = instruction as FiveRegisterInstruction
    check(call.registerCount == 1 && call.registerC == 0) { "dsnieuws onboarding preference receiver changed" }
    val following = method.instructions.elementAt(index + 1)
    check(following.opcode == Opcode.MOVE_RESULT && (following as OneRegisterInstruction).registerA == call.registerC)
    // v1's old graph-operation value is dead at this audited boundary. Its next
    // use on the skipped-onboarding branch is an iget destination, not a read.
    val receiver = call.registerC
    method.addInstructions(index, "const/4 v1, 0x1\ninvoke-virtual {v$receiver, v1}, $settings->setOnboardingCompleted(Z)V")
}
