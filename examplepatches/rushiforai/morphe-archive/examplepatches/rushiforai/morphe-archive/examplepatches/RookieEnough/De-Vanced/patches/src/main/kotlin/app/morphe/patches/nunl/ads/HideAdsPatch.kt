/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/nunl/ads/HideAdsPatch.kt
 */
package app.morphe.patches.nunl.ads

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/nunl/ads/HideAdsPatch;"

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hide ads and sponsored articles in list pages and remove pre-roll ads on videos.",
) {
    compatibleWith(AppCompatibilities.NU_NL)

    dependsOn(sharedExtensionPatch("nunl", false, nuApplicationOnCreateHook))

    execute {
        // Disable video pre-roll ads: don't set advertising config (remove the IPUT_OBJECT).
        val jwMethod = JwPlayerConfigMethodFingerprint.method
        val iputInstructionIndex = jwMethod.indexOfFirstInstructionOrThrow(Opcode.IPUT_OBJECT)
        jwMethod.removeInstructions(iputInstructionIndex, 1)

        // Filter injected content from API calls out of lists.
        arrayOf(ScreenMapperMethodFingerprint, NextPageRepositoryImplMethodFingerprint).forEach { match ->
            val moveIndex = match.instructionMatches.first().index
            val listRegister = match.method.getInstruction<OneRegisterInstruction>(moveIndex).registerA

            match.method.addInstructions(
                moveIndex + 1,
                "invoke-static { v$listRegister }, $EXTENSION_CLASS_DESCRIPTOR->filterAds(Ljava/util/List;)V",
            )
        }
    }
}

