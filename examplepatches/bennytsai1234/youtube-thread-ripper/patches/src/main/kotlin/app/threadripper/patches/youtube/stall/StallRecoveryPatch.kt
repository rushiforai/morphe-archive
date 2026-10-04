package app.threadripper.patches.youtube.stall

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.threadripper.patches.youtube.Constants.COMPATIBILITY_YOUTUBE
import app.threadripper.patches.youtube.settings.settingsResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "Lapp/threadripper/extension/youtube/StallRecovery;"

@Suppress("unused")
val stallRecoveryPatch = bytecodePatch(
    name = "Stall recovery",
    description = "Adds an option (off by default) to resume playback after a stall once a shorter " +
        "amount of video is buffered than the app's 5 seconds.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/youtube.mpe")
    dependsOn(settingsResourcePatch)

    execute {
        val method = ShouldStartPlaybackFingerprint.method
        val parametersType = method.parameterTypes.single().toString()
        val instructions = method.implementation!!.instructions.toList()

        // media3 LoadControl.Parameters: bufferedDurationUs is the first long field the method
        // reads from the parameter (as in shouldContinueLoading), isRebuffering the class's only
        // boolean field.
        val bufferedField = instructions.firstNotNullOfOrNull { insn ->
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf {
                insn.opcode == Opcode.IGET_WIDE && it.definingClass == parametersType
            }
        } ?: throw PatchException("bufferedDurationUs not found in ${method.definingClass}->${method.name}")
        val rebufferingField = mutableClassDefBy(parametersType).fields.singleOrNull { it.type == "Z" }
            ?: throw PatchException("isRebuffering not found in $parametersType")

        val locals = method.implementation!!.registerCount - method.parameterTypes.size - 1
        if (locals < 4) throw PatchException("${method.name} has $locals locals, needs 4")

        fun ref(f: FieldReference) = "${f.definingClass}->${f.name}:${f.type}"
        fun ref(f: com.android.tools.smali.dexlib2.iface.Field) = "${f.definingClass}->${f.name}:${f.type}"

        // Every `return vX`: pass the decision through the extension. All other registers are
        // dead at a return, so v0 is free. The parameter register is not: the method reuses it as
        // a local, so the parameter fields are read once at the start (below). The return is
        // replaced in place so branches to it land on the first new instruction.
        val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN }
        if (returns.isEmpty()) throw PatchException("No return in ${method.name}")
        returns.asReversed().forEach { index ->
            val result = (instructions[index] as OneRegisterInstruction).registerA
            method.replaceInstruction(index, "move/from16 v0, v$result")
            method.addInstructions(
                index + 1,
                """
                    invoke-static { v0 }, $EXTENSION_CLASS->shouldStartPlayback(Z)Z
                    move-result v$result
                    return v$result
                """,
            )
        }

        // At the start every local is free and p1 still holds LoadControl.Parameters.
        method.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                iget-wide v1, v0, ${ref(bufferedField)}
                iget-boolean v3, v0, ${ref(rebufferingField)}
                invoke-static/range { v1 .. v3 }, $EXTENSION_CLASS->enter(JZ)V
            """,
        )
    }
}
