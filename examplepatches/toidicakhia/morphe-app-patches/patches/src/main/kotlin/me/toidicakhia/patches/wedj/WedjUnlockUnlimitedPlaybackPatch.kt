package me.toidicakhia.patches.wedj

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import me.toidicakhia.patches.shared.Constants.WEDJ_COMPATIBILITY
import me.toidicakhia.patches.shared.Constants.WEDJ_LEGACY_COMPATIBILITY

@Suppress("unused")
val wedjUnlockUnlimitedPlaybackPatch = bytecodePatch(
    name = "Unlock Unlimited Playback",
    description = "Makes WeDJ treat the \"Unlock Unlimited Playback\" in-app purchase as owned. " +
        "The free-version limit that stops playback after loading a few tracks is removed and " +
        "the purchase entry disappears from the track browser. Use WeDJ 1.1.1.3 on Android 9-12 " +
        "and 1.1.4.5 on Android 13+. Client-side only: the Play Store transaction itself is not " +
        "simulated.",
    default = true
) {
    compatibleWith(WEDJ_COMPATIBILITY, WEDJ_LEGACY_COMPATIBILITY)

    execute {
        val fingerprint = if (classDefByOrNull("Lcom/pioneerdj/WeDJ/M;") != null) {
            UnlimitedPlaybackPurchasedFingerprint
        } else {
            LegacyUnlimitedPlaybackPurchasedFingerprint
        }

        fingerprint.matchSingle().method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
