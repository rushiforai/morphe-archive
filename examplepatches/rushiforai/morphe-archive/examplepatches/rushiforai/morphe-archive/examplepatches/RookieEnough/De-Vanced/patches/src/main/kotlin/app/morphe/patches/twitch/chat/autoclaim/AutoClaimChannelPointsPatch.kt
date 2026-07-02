/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/chat/autoclaim/AutoClaimChannelPointsPatch.kt
 */
package app.morphe.patches.twitch.chat.autoclaim

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val autoClaimChannelPointsPatch = bytecodePatch(
    name = "Auto claim channel points",
    description = "Automatically claim Channel Points.",
) {
    compatibleWith(AppCompatibilities.TWITCH)

    execute {
        // Always trigger the onClick handler when Twitch decides claim is available.
        CommunityPointsButtonViewDelegateMethodFingerprint.method.apply {
            val insertIndex = implementation!!.instructions.lastIndex
            addInstructions(
                insertIndex,
                """
                    iget-object v0, p0, Ltv/twitch/android/shared/community/points/viewdelegate/CommunityPointsButtonViewDelegate;->buttonLayout:Landroid/view/ViewGroup;
                    invoke-virtual {v0}, Landroid/view/View;->callOnClick()Z
                """.trimIndent(),
            )
        }
    }
}

