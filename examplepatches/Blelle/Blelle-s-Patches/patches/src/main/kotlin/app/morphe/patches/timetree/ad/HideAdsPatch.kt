/*
 * Copyright 2026 Morphe.
 * Patches for TimeTree (works.jubilee.timetree)
 */

package app.morphe.patches.timetree.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patches.timetree.shared.Constants.COMPATIBILITY_TIMETREE

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Completely removes all ads (calendar headlines, activities banner, event creation ads, daily ads, and splash interstitials) and unlocks premium ad-free mode."
) {
    compatibleWith(COMPATIBILITY_TIMETREE)

    execute {
        // 1. Force PremiumManager.e() to always return true (1)
        PremiumManagerIsEnabledFingerprint.method.apply {
            replaceInstruction(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // 2. Prevent background SyncUserSubscriptionWorker from resetting premium to false
        PremiumManagerSetEnabledFingerprint.method.apply {
            replaceInstruction(
                0,
                """
                    return-void
                """
            )
        }

        // 3. Cleanly dismiss SplashAdsActivity on cold-start
        SplashAdsActivityFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-virtual { p0 }, Lworks/jubilee/timetree/app/ui/SplashAdsActivity;->finish()V
                    return-void
                """
            )
        }
    }
}
