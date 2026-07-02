/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photomath/misc/unlock/bookpoint/EnableBookpointPatch.kt
 */
package app.morphe.patches.photomath.misc.unlock.bookpoint

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val enableBookpointPatch = bytecodePatch(
    description = "Enables textbook access",
) {

    execute {
        IsBookpointEnabledFingerprint.method.replaceInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}

