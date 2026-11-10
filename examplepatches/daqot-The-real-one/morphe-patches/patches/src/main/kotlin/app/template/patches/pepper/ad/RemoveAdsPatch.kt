package app.template.patches.pepper.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PEPPER
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes the ads shown between deals and on the deal pages.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PEPPER)

    dependsOn(hideAdLayoutResourcePatch)

    execute {
        // Disable ad loading on deal lists and deal pages.
        AreAdsEnabledFingerprint.let {
            val xorIndex = it.instructionMatches[2].index
            val register = it.method.getInstruction<OneRegisterInstruction>(xorIndex).registerA

            it.method.replaceInstruction(xorIndex, "const/16 v$register, 0x0")
        }

        // Remove server-provided ad positions so the UI does not leave empty slots.
        AdSlotsToDataFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """
        )
    }
}
