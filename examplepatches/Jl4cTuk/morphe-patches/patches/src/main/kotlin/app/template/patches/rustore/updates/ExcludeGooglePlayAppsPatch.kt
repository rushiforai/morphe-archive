package app.template.patches.rustore.updates

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val GOOGLE_PLAY_PACKAGE = "com.android.vending"

@Suppress("unused")
val excludeGooglePlayAppsPatch = bytecodePatch(
    name = "Exclude Google Play apps from updates",
    description =
        "Excludes Google Play installs from RuStore update checks while keeping " +
            "RuStore and sideloaded apps.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        val method = GetAppVersionInfoListFingerprint.method
        val instructions = method.implementation!!.instructions
        val installerComparisonCalls = instructions.withIndex().filter { (_, instruction) ->
            val reference =
                (instruction as? ReferenceInstruction)?.reference as? MethodReference

            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                reference?.definingClass == "Ljava/lang/Object;" &&
                reference.name == "equals" &&
                reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/Object;") &&
                reference.returnType == "Z"
        }
        require(installerComparisonCalls.size == 1) {
            "Expected one installer-source comparison, found " +
                installerComparisonCalls.size
        }

        val comparisonIndex = installerComparisonCalls.single().index
        val exclusionBranchOffset = instructions
            .subList(comparisonIndex + 1, minOf(comparisonIndex + 4, instructions.size))
            .indexOfFirst { instruction -> instruction.opcode == Opcode.IF_EQZ }
        require(exclusionBranchOffset >= 0) {
            "Could not find the installer-source exclusion branch"
        }
        val exclusionBranchIndex = comparisonIndex + 1 + exclusionBranchOffset
        val exclusionBranch =
            instructions[exclusionBranchIndex] as? BuilderInstruction21t
        require(exclusionBranch != null && exclusionBranch.opcode == Opcode.IF_EQZ) {
            "Installer-source exclusion branch has an unexpected format"
        }

        method.replaceInstruction(
            exclusionBranchIndex,
            BuilderInstruction21t(
                Opcode.IF_NEZ,
                exclusionBranch.registerA,
                exclusionBranch.target,
            ),
        )
        method.addInstructions(
            0,
            """
                const-string p1, "$GOOGLE_PLAY_PACKAGE"
            """,
        )
    }
}
