/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/messenger/inputfield/DisableTypingIndicatorPatch.kt
 */
package app.morphe.patches.messenger.inputfield

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTypingIndicatorPatch = bytecodePatch(
    name = "Disable typing indicator",
    description = "Disables the indicator while typing a message.",
) {
    compatibleWith(AppCompatibilities.MESSENGER)

    execute {
        SendTypingIndicatorFingerprint.method.replaceInstruction(0, "return-void")
    }
}
