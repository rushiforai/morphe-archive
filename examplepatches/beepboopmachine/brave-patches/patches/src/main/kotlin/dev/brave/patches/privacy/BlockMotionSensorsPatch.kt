package dev.brave.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object PlatformSensorProviderCreateFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/device/sensors/PlatformSensorProvider;",
    name = "create",
    returnType = "Lorg/chromium/device/sensors/PlatformSensorProvider;",
    parameters = listOf()
)

internal object PlatformSensorProviderHasSensorFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/device/sensors/PlatformSensorProvider;",
    name = "hasSensorType",
    returnType = "Z",
    parameters = listOf("I")
)

@Suppress("unused")
val blockMotionSensorsPatch = patch(
    name = "Block Motion Sensors",
    description = "Disables Chromium's Android PlatformSensorProvider so web pages cannot read motion or orientation sensors."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        PlatformSensorProviderHasSensorFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent()
            )
        }

        PlatformSensorProviderCreateFingerprint.method.apply {
            val retIdx = instructions.indices.indexOfLast { instructions[it].opcode == Opcode.RETURN_OBJECT }
            if (retIdx >= 0) {
                val reg = (instructions[retIdx] as OneRegisterInstruction).registerA
                addInstructions(
                    retIdx,
                    "invoke-virtual {v$reg}, Lorg/chromium/device/sensors/PlatformSensorProvider;->setSensorManagerToNullForTesting()V"
                )
            }
        }
    }
}
