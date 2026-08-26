package morningentree.morphe.patches.all.misc.battery

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val POWER_MANAGER = "Landroid/os/PowerManager;"

@Suppress("unused")
val bypassBatteryOptimizationNagPatch = bytecodePatch(
    name = "Bypass battery optimization nag",
    description = "Makes apps believe they are already exempt from battery optimization so they " +
        "stop prompting you to disable it. Only affects what the app sees, not the real system " +
        "setting.",
    default = false,
) {
    execute {
        classDefForEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.definingClass != POWER_MANAGER ||
                        reference.name != "isIgnoringBatteryOptimizations" ||
                        reference.returnType != "Z"
                    ) return@forEachIndexed

                    val moveResult = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                        ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT) return@forEachIndexed

                    method.replaceInstruction(index + 1, "const/4 v${moveResult.registerA}, 0x1")
                }
            }
        }
    }
}
