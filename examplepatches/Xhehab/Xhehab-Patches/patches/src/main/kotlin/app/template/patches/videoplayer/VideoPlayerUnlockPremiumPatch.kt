package app.template.patches.videoplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.VIDEO_PLAYER_COMPATIBILITY

@Suppress("unused")
val videoPlayerUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Video Player Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(VIDEO_PLAYER_COMPATIBILITY)

    execute {
        fun Fingerprint.forceTrue() {
            match(classDefBy(definingClass!!))
                .method
                .addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """.trimIndent()
                )
        }

        VideoPlayerPurchaseListContainsUnlockFingerprint.forceTrue()

        VideoPlayerSetAdFreeModeFingerprint
            .match(classDefBy(VideoPlayerSetAdFreeModeFingerprint.definingClass!!))
            .method
            .addInstructions(
                0,
                """
                    const/4 p0, 0x1
                """.trimIndent()
            )

        VideoPlayerBillingStateGetters.forEach { fingerprint ->
            fingerprint.forceTrue()
        }
    }
}
