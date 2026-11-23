package app.plyrs1.patches.com_google_android_projection_gearhead

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_ANDROID_AUTO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val allowSideloadedAppsPatch = bytecodePatch(
    name = "Allow sideloaded apps",
    description = "Bypasses Play Store installation checks, allowing sideloaded third-party apps " +
        "to appear and run on the Android Auto car head unit.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANDROID_AUTO)

    execute {
        // 1. Patch J() -> always return true
        IsUnknownSourcesEnabledFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // 2. Patch z() -> replace the unknown sources / app type filter gate and denial return with return true
        val method = IsPackageAllowed3pFingerprint.method
        val deniedIndex = IsPackageAllowed3pFingerprint.instructionMatches.last().index

        val jMethodRef = IsUnknownSourcesEnabledFingerprint.originalMethod
        val instructions = method.instructions
        var jCallIndex = -1
        for (i in (deniedIndex - 1) downTo maxOf(0, deniedIndex - 30)) {
            val inst = instructions[i]
            if (inst.opcode == Opcode.INVOKE_DIRECT || inst.opcode == Opcode.INVOKE_VIRTUAL) {
                val ref = (inst as ReferenceInstruction).reference as MethodReference
                if (ref.name == jMethodRef.name
                    && ref.definingClass == jMethodRef.definingClass
                    && ref.returnType == "Z"
                    && ref.parameterTypes.isEmpty()) {
                    jCallIndex = i
                    break
                }
            }
        }
        check(jCallIndex != -1) { "Could not find J() call before denial block" }

        var returnFalseIndex = -1
        for (i in deniedIndex until minOf(deniedIndex + 15, instructions.size)) {
            if (instructions[i].opcode == Opcode.RETURN) {
                returnFalseIndex = i
                break
            }
        }
        check(returnFalseIndex != -1) { "Could not find return-false after denial" }

        method.removeInstructions(jCallIndex, returnFalseIndex - jCallIndex + 1)
        method.addInstructions(jCallIndex, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
