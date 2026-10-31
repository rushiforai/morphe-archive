package gcam.edgetpu

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val magicCapturePatch = bytecodePatch(
    name = "Fix Magic Capture crash",
    description = "Bypasses EdgeTPU JNI native initialization in Magic Capture and falls back to CPU scoring to prevent SIGABRT crashes on non-stock signatures.",
    default = true
) {
    compatibleWith(
        "com.google.android.GoogleCameraEng",
        "com.google.android.GoogleCamera"
    )

    val patchAddMe by booleanOption(
        key = "patchAddMeEdgeTpu",
        default = true,
        title = "Also fix Add Me (All-In) EdgeTPU crash",
        description = "Makes Add Me use its CPU models instead of the EdgeTPU ones, which crash (SIGABRT) on re-signed builds."
    )

    execute {
        // 1. Bypass PreFilteringPipelineImpl.h nativeCreate call
        val method = PreFilteringPipelineInitFingerprint.method
        val matches = PreFilteringPipelineInitFingerprint.instructionMatches

        val invokeNativeIndex = matches[0].index
        val moveResultWideIndex = matches[1].index

        val moveResultInst = method.getInstruction<OneRegisterInstruction>(moveResultWideIndex)
        val wideReg = moveResultInst.registerA

        // Replace `invoke-direct nativeCreate` and `move-result-wide` with `const-wide/16 vX, 0x0`
        // Setting native handle to 0L triggers Google Camera's internal graceful fallback path.
        method.replaceInstruction(
            invokeNativeIndex,
            "const-wide/16 v$wideReg, 0x0"
        )
        method.replaceInstruction(
            moveResultWideIndex,
            "nop"
        )

        // 2. Patch Add Me (Limc.<init>) if enabled
        if (patchAddMe == true) {
            val enumClinit = AllInDeviceEnumFingerprint.method
            val sputIndex = AllInDeviceEnumFingerprint.instructionMatches[2].index
            val deviceUnspecifiedField =
                enumClinit.getInstruction<ReferenceInstruction>(sputIndex).reference as FieldReference

            val configConstructor = AllInConfigConstructorFingerprint.method
            val configMatches = AllInConfigConstructorFingerprint.instructionMatches
            val moveResultIndex = configMatches[1].index
            val checkCastIndex = configMatches[2].index

            val targetReg = configConstructor.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

            configConstructor.replaceInstruction(
                moveResultIndex,
                "sget-object v$targetReg,$deviceUnspecifiedField"
            )
            configConstructor.replaceInstruction(
                checkCastIndex,
                "nop"
            )

            // The device enum alone isn't enough: a separate "use EdgeTPU models" flag
            // (`imc.e`, from flag kom.R in 11.1.040) makes Add Me load the *-custom_op_tpu_26
            // models and tell the native engine to use the TPU. Force it to false so the
            // CPU model set (shipped in the same split) is used.
            //   invoke-virtual {p3, p1}, Lksf;->x(Lkps;)Z
            //   move-result p1
            //   iput-boolean p1, p0, Limc;->e:Z
            val configInsns = configConstructor.instructions
            val useTpuIndex = configInsns.indices.firstOrNull { i ->
                val insn = configInsns[i]
                val field = (insn as? ReferenceInstruction)?.reference as? FieldReference
                i > 0 && insn.opcode == Opcode.IPUT_BOOLEAN &&
                        field?.definingClass == configConstructor.definingClass &&
                        configInsns[i - 1].opcode == Opcode.MOVE_RESULT
            } ?: throw PatchException("Could not find the Add Me EdgeTPU flag in ${configConstructor.definingClass}")

            val flagRegister = (configInsns[useTpuIndex - 1] as OneRegisterInstruction).registerA
            configConstructor.addInstruction(useTpuIndex, "const/4 v$flagRegister, 0x0")
        }
    }
}