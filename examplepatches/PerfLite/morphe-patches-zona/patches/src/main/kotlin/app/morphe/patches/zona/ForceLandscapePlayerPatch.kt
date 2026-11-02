package app.morphe.patches.zona

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private object SetSensorLandscapeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    strings = listOf("set SENSOR_LANDSCAPE orientation"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "setRequestedOrientation",
            parameters = listOf("I"),
            returnType = "V",
        )
    ),
)

@Suppress("unused")
val forceLandscapePlayerPatch = bytecodePatch(
    name = "Force landscape player",
    description = "Switches to landscape orientation when movie or series playback starts.",
    default = true,
) {
    compatibleWith(ZONA_COMPATIBILITY)

    execute {
        SetSensorLandscapeFingerprint.matchOrNull()?.method?.apply {
            val setterIndex = SetSensorLandscapeFingerprint.instructionMatches.single().index
            val setterInstruction = getInstruction<FiveRegisterInstruction>(setterIndex)
            val literalIndex = (setterIndex - 1 downTo 0).firstOrNull { index ->
                val instruction = implementation!!.instructions[index]
                instruction is NarrowLiteralInstruction &&
                    instruction is OneRegisterInstruction &&
                    instruction.registerA == setterInstruction.registerD
            }

            if (literalIndex != null) {
                val instruction = getInstruction<NarrowLiteralInstruction>(literalIndex)
                if (instruction.narrowLiteral != 6) {
                    val orientationRegister = (instruction as OneRegisterInstruction).registerA
                    replaceInstruction(literalIndex, "const/4 v$orientationRegister, 0x6")
                }
            }
        }
    }
}
