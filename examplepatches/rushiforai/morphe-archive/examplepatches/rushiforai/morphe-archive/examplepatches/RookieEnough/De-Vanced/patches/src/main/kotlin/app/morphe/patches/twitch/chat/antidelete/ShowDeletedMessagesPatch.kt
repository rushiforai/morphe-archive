/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/chat/antidelete/ShowDeletedMessagesPatch.kt
 */
package app.morphe.patches.twitch.chat.antidelete

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val showDeletedMessagesPatch = bytecodePatch(
    name = "Show deleted messages",
    description = "Shows deleted chat messages behind a clickable spoiler.",
) {
    compatibleWith(AppCompatibilities.TWITCH)

    execute {
        // Spoiler mode: Force set hasModAccess member to true in constructor
        val definingClass = DeletedMessageClickableSpanCtorMethodFingerprint.classDef.type
        DeletedMessageClickableSpanCtorMethodFingerprint.method.apply {
            val insertIndex = implementation!!.instructions.lastIndex
            addInstructions(
                insertIndex,
                """
                    const/4 v0, 0x1
                    iput-boolean v0, p0, $definingClass->hasModAccess:Z
                """.trimIndent(),
            )
        }

        // Spoiler mode: Disable setHasModAccess setter
        SetHasModAccessMethodFingerprint.method.returnEarly()
    }
}

