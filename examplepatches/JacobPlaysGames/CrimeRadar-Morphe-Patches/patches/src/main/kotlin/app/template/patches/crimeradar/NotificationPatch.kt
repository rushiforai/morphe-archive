package app.template.patches.crimeradar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRIMERADAR

/**
 * Raises notification frequency limits for more push notifications.
 *
 * 1. NotificationFrequencyManager.isUnderFreqLimit() — per-category daily cap (25-50).
 *    Returns true when over limit (blocking push). Patched to always return false.
 *
 * 2. HeadsUpPushMgr.shouldShowHeadsUpPush() — heads-up push daily limit (default 1).
 *    Returns true when under limit. Patched to always return true.
 */
@Suppress("unused")
val notificationPatch = bytecodePatch(
    name = "Notification Limits Raised",
    description = "Raises per-category daily push caps and heads-up push limits.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CRIMERADAR)

    execute {
        // Never block pushes due to frequency — always "under limit"
        NotificationFrequencyFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // Always allow heads-up pushes (remove daily cap)
        HeadsUpPushFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
