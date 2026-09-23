package app.template.patches.universal.spoofserial

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

private const val SERIAL_FIELD_CLASS = "Landroid/os/Build;"
private const val SERIAL_FIELD_NAME = "SERIAL"
private const val SPOOFED_SERIAL = "Serial"

@Suppress("unused")
val spoofBuildSerialPatch = bytecodePatch(
    name = "Spoof Build.SERIAL",
    description = "Replaces every read of Build.SERIAL with the constant string \"$SPOOFED_SERIAL\", across every class in the app.",
) {
    execute {
        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach { method ->
                // Access instructions via InstructionExtensions
                val methodInstructions = method.instructions

                // Iterate over a snapshot to safely modify the method implementation
                methodInstructions.toList().forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.SGET_OBJECT) return@forEachIndexed

                    val instruction21c = instruction as? Instruction21c ?: return@forEachIndexed
                    val reference = instruction21c.reference as? FieldReference ?: return@forEachIndexed

                    if (reference.definingClass == SERIAL_FIELD_CLASS &&
                        reference.name == SERIAL_FIELD_NAME
                    ) {
                        // Preserves the original destination register.
                        method.replaceInstruction(
                            index,
                            BuilderInstruction21c(
                                Opcode.CONST_STRING,
                                instruction21c.registerA,
                                ImmutableStringReference(SPOOFED_SERIAL)
                            )
                        )
                    }
                }
            }
        }
    }
}
