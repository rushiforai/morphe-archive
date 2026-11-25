package patches.humo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Reuse the app's own completion job before any setup graph can be composed. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun skipOnboardingPrompts() {
    val main = "${APP}ui/main/MainViewModel;"
    val coroutine = "${APP}ui/main/MainViewModel\$validateState\$1;"
    val onboarding = "${APP}ui/main/MainViewState\$Onboarding;"
    val home = "${APP}ui/main/MainViewState\$Home;"
    val completion = exact(main, "onOnboardingComplete", "Lkotlinx/coroutines/Job;").method
    check(completion.accessFlags and AccessFlags.PUBLIC.value != 0 &&
        completion.accessFlags and AccessFlags.STATIC.value == 0) {
        "humo native onboarding completion must remain a public instance method"
    }
    val target = exact(coroutine, "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;").method
    val sites = target.instructions.withIndex().filter { (_, instruction) ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SGET_OBJECT && field?.definingClass == onboarding &&
            field.name == "INSTANCE" && field.type == onboarding
    }
    check(sites.size == 1) { "Expected one humo automatic onboarding state assignment, found ${sites.size}" }
    val (index, instruction) = sites.single()
    val destination = (instruction as OneRegisterInstruction).registerA
    check(destination == 4) { "humo onboarding destination register changed" }
    // The original sget kills v4. Reuse only that destination; all coroutine
    // state, flow receiver and suspension registers retain their original values.
    target.replaceInstruction(index, "iget-object v$destination, p0, $coroutine->this\$0:$main")
    target.addInstructions(index + 1, """
        invoke-virtual {v$destination}, $main->onOnboardingComplete()Lkotlinx/coroutines/Job;
        sget-object v$destination, $home->INSTANCE:$home
    """.trimIndent())
}
