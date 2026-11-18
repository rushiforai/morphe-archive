package patches.at4k

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import patches.shared.uniqueMatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Enables locally enforced premium features and saves the premium preference on launcher startup.",
) {
    dependsOn(patches.shared.originalInput(at4k))
    compatibleWith(at4k)

    execute {
        val startup = Fingerprint(
            definingClass = "Lcom/overdevs/at4k/MainActivity;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
            strings = listOf("launcher_prefs", "is_premium", "apple_tv_launcher_prefs"),
        ).uniqueMatch().method
        val reads = startup.instructions.withIndex().filter { (_, instruction) ->
            instruction.getReference<MethodReference>()?.toString() ==
                "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z"
        }
        val read = reads.single()
        val registers = read.value as FiveRegisterInstruction
        check(startup.implementation!!.registerCount == 10 &&
            registers.registerC == 9 && registers.registerD == 5 && registers.registerE == 3 &&
            read.value.opcode == Opcode.INVOKE_INTERFACE) { "AT4K premium startup layout changed" }
        // In the inspected 1.3 startup, v2 is true on every path to this read and
        // v6/v7 are dead scratch registers. Persist the premium flag through the
        // app's own edit/putBoolean/apply editor idiom (as its purchase flow does)
        // before the original read initializes the shared Compose state.
        val editor = ImmutableMethodReference(
            "Landroid/content/SharedPreferences\$Editor;", "putBoolean",
            listOf("Ljava/lang/String;", "Z"), "Landroid/content/SharedPreferences\$Editor;")
        startup.addInstructions(read.index, listOf(
            BuilderInstruction35c(Opcode.INVOKE_INTERFACE, 1, 9, 0, 0, 0, 0, ImmutableMethodReference(
                "Landroid/content/SharedPreferences;", "edit", listOf(),
                "Landroid/content/SharedPreferences\$Editor;")),
            BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6),
            BuilderInstruction21c(Opcode.CONST_STRING, 7, ImmutableStringReference("is_premium")),
            BuilderInstruction35c(Opcode.INVOKE_INTERFACE, 3, 6, 7, 2, 0, 0, editor),
            BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6),
            BuilderInstruction35c(Opcode.INVOKE_INTERFACE, 1, 6, 0, 0, 0, 0, ImmutableMethodReference(
                "Landroid/content/SharedPreferences\$Editor;", "apply", listOf(), "V")),
        ))
    }
}
