package app.jancerny2001.patches.gtsisic

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

@Suppress("unused")
val enableCardScreenshotPatch = bytecodePatch(
    name = "Enable card screenshot",
    description = "Allows screenshots of cards by clearing the FLAG_SECURE flag.",
) {
    compatibleWith(
        Compatibility(
            name = "Alive App",
            packageName = "com.bootiq2.gtsisic",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0x40b8b8,
            targets = listOf(
                AppTarget(version = "3.5.0")
            )
        )
    )

    execute {
        val method = SecureFlagMethodFingerprint.method
        val addFlagsMatch = SecureFlagMethodFingerprint.instructionMatches[1]
        val addFlagsInstruction = addFlagsMatch.getInstruction<ReferenceInstruction>()

        val replacement = when (addFlagsInstruction) {
            is FiveRegisterInstruction -> {
                val registers = listOf(
                    addFlagsInstruction.registerC,
                    addFlagsInstruction.registerD,
                    addFlagsInstruction.registerE,
                    addFlagsInstruction.registerF,
                    addFlagsInstruction.registerG
                ).take(addFlagsInstruction.registerCount)

                "invoke-virtual {${registers.joinToString(", ") { "v$it" }}}, Landroid/view/Window;->clearFlags(I)V"
            }

            is RegisterRangeInstruction -> {
                val start = addFlagsInstruction.startRegister
                val end = start + addFlagsInstruction.registerCount - 1
                "invoke-virtual/range {v$start .. v$end}, Landroid/view/Window;->clearFlags(I)V"
            }

            else -> throw PatchException("Unsupported addFlags invoke format: ${addFlagsInstruction.opcode}")
        }

        method.replaceInstruction(addFlagsMatch.index, replacement)
    }
}