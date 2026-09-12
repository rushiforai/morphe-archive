package app.kanup4m.patches.seven.misc.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.kanup4m.patches.seven.shared.Constants.COMPATIBILITY_SEVEN

// Neutralizes PairIP's license kill-switch: NOT_LICENSED normally launches
// LicenseActivity (Play Store redirect) and schedules app shutdown.
// Both methods are void, so early return-void fully disables them.
@Suppress("unused")
val sevenPairipBypassPatch = bytecodePatch(
    name = "Seven PairIP Bypass",
    description = "Disables PairIP license paywall and error shutdown so the app runs sideloaded. No root required."
) {
    compatibleWith(COMPATIBILITY_SEVEN)

    execute {
        StartPaywallActivityFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )
        StartErrorDialogActivityFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )
    }
}
