package semicoloncolonel.mobilestream.patches.yahoonews.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoonews.shared.videoOptOutPatch

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo News 100.1.1 — Hide reading streaks.
//
// Yahoo News counts the days in a row you read and gives you a reading level
// (Beginner to Oracle). These components show it, and each now renders
// nothing:
//
//   GamificationBar              the level and "1-day streak" bar on Home.
//   ProfileGamificationStrip     the level and streak strip on Profile.
//   GamificationStrip
//   GamificationCelebrationHost  the pop-ups that celebrate a new level or a
//                                longer streak.
//
// Yahoo still counts your reads on its server; only the display is removed.
// ─────────────────────────────────────────────────────────────────────────────

private val hideReadingStreaksInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        listOf(
            "GamificationBar",
            "ProfileGamificationStrip",
            "GamificationStrip",
            "GamificationCelebrationHost",
        ).forEach { bundle.returnAtStart(it, HermesBundle.Value.NULL) }
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hideReadingStreaksPatch = resourcePatch(
    name = "Hide reading streaks",
    description = "Removes the reading streak and level from Home and Profile, and the pop-ups that celebrate them.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hideReadingStreaksInBundlePatch, disableExpoUpdatesPatch, videoOptOutPatch)
}
