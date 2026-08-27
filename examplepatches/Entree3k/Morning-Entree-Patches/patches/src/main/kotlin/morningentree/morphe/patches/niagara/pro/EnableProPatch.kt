package morningentree.morphe.patches.niagara.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.all.detection.signature.pms.spoofSignatureVerificationPatch
import morningentree.morphe.patches.all.misc.installer.spoofInstallSourcePatch
import morningentree.morphe.patches.niagara.shared.Constants

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Niagara Pro",
    description = "Unlocks Pro",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(spoofSignatureVerificationPatch, spoofInstallSourcePatch)

    execute {
        val proStateClass = ProStateToStringFingerprint.originalClassDef

        val constructor = mutableClassDefBy(proStateClass).methods.firstOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.map { it.toString() } == listOf("Z", "Z", "Z")
        } ?: throw PatchException("Could not find the Pro-state constructor <init>(Z, Z, Z)V")

        constructor.addInstructions(
            0,
            """
                const/4 p1, 0x1
                const/4 p2, 0x1
            """.trimIndent(),
        )
    }
}
