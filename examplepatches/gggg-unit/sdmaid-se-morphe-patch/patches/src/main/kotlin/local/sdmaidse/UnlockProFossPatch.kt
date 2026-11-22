package local.sdmaidse

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val FOSS_INFO = "Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss\$Info;"

// Locate the entitlement field write without depending on a version or
// constructor parameter list. Fail closed if the structure changes.
private val fossInfoConstructor = Fingerprint(
    definingClass = FOSS_INFO,
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = FOSS_INFO,
            name = "isPro",
            type = "Z",
        ),
    ),
)

@Suppress("unused")
val unlockProFossPatch = bytecodePatch(
    name = "Unlock Pro (FOSS)",
    description = "Unlocks SD Maid SE Pro features in the official GitHub FOSS APK.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "SD Maid SE",
            packageName = "eu.darken.sdmse",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x4CAF50,
            targets = listOf(AppTarget(version = null)),
        ),
    )

    execute {
        val method = fossInfoConstructor.methodOrNull
            ?: throw PatchException(
                "SD Maid SE FOSS entitlement constructor was not found. " +
                    "Use the original GitHub FOSS APK; Google Play APKs are unsupported. " +
                    "If this is a FOSS APK, report the full patch log, APK version/source, and Morphe version.",
            )
        val match = fossInfoConstructor.instructionMatches.singleOrNull()
            ?: throw PatchException("Expected one Info.isPro write in the FOSS constructor.")
        val write = method.instructionsOrNull?.getOrNull(match.index) as? TwoRegisterInstruction
            ?: throw PatchException("Info.isPro write has an unexpected instruction format.")
        val sourceRegister = write.registerA
        if (sourceRegister !in 0..15) {
            throw PatchException("Info.isPro source register does not fit const/4.")
        }

        method.addInstructions(match.index, "const/4 v$sourceRegister, 0x1")
    }
}
