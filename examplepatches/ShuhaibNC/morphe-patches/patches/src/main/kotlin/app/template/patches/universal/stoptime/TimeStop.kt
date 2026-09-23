package app.template.patches.universal.stoptime

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val fakeSystemTimePatch = bytecodePatch(
    name = "Fake System Time",
    description = "Replaces System.currentTimeMillis() and System.nanoTime() with a fixed timestamp.",
) {
    execute {
        val fixedTime = 1512253520816L

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach { method ->
                val methodInstructions = method.instructionsOrNull ?: return@forEach

                var i = 0
                while (i < methodInstructions.size - 1) {
                    val first = methodInstructions[i]
                    val second = methodInstructions[i + 1]

                    if (
                        first.opcode == Opcode.INVOKE_STATIC &&
                        second.opcode == Opcode.MOVE_RESULT_WIDE &&
                        first is ReferenceInstruction &&
                        second is OneRegisterInstruction
                    ) {
                        val reference = first.reference
                        if (reference is MethodReference) {
                            val isSystemTime =
                                reference.definingClass == "Ljava/lang/System;" &&
                                        reference.parameterTypes.isEmpty() &&
                                        reference.returnType == "J" &&
                                        (reference.name == "currentTimeMillis" || reference.name == "nanoTime")

                            if (isSystemTime) {
                                val register = second.registerA

                                // Replace invoke-static with const-wide
                                method.replaceInstruction(i, "const-wide v$register, $fixedTime")
                                // Remove move-result-wide
                                method.removeInstruction(i + 1)
                                continue
                            }
                        }
                    }
                    i++
                }
            }
        }
    }
}
