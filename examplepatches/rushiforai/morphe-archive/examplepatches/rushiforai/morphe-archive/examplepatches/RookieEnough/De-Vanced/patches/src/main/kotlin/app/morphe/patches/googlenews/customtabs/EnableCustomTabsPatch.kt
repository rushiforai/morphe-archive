/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlenews/customtabs/EnableCustomTabsPatch.kt
 */
package app.morphe.patches.googlenews.customtabs

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val enableCustomTabsPatch = bytecodePatch(
    name = "Enable CustomTabs",
    description = "Enables CustomTabs to open articles in your default browser.",
) {
    compatibleWith(AppCompatibilities.GOOGLE_NEWS)

    execute {
        LaunchCustomTabFingerprint.method.apply {
            val checkIndex = LaunchCustomTabFingerprint.instructionMatches.last().index + 1
            val register = getInstruction<OneRegisterInstruction>(checkIndex).registerA

            replaceInstruction(checkIndex, "const/4 v$register, 0x1")
        }
    }
}

