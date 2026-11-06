package app.template.patches.pepper.ad

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PEPPER
import app.template.patches.shared.Constants.COMPATIBILITY_PEPPER_LEGACY
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes the ads shown between deals and on the deal pages.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PEPPER)
    compatibleWith(COMPATIBILITY_PEPPER_LEGACY)

    execute {
        // Replace !isAdFree with false, so the deal lists and the deal pages
        // never get any ad slots, instead of leaving empty ones behind.
        AreAdsEnabledFingerprint.let {
            val xorIndex = it.instructionMatches[2].index
            val register = it.method.getInstruction<OneRegisterInstruction>(xorIndex).registerA

            it.method.replaceInstruction(xorIndex, "const/16 v$register, 0x0")
        }
    }
}
