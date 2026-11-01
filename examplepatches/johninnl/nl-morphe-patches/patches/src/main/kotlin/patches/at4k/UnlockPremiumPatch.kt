package patches.at4k

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.shared.uniqueMatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Enables locally enforced premium features and saves the premium preference on launcher startup.",
) {
    dependsOn(patches.shared.originalInput(at4k))
    compatibleWith(at4k)

    execute {
        val setter = Fingerprint(
            definingClass = "LQ3/T4;",
            name = "r",
            returnType = "V",
            parameters = listOf("Landroid/content/SharedPreferences;", "Ljava/lang/String;", "Z"),
        ).uniqueMatch().method
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
        // In the inspected 1.2 startup, v2 is true on every path to this read.
        // Persist it through the app's own preference writer before the original
        // read initializes the shared Compose state. Keep the rest of startup intact.
        startup.addInstructions(read.index, "invoke-static {p1, v5, v2}, $setter")
    }
}
