package app.template.patches.redditsync.unlockultra

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.unlockultra.fingerprints.grabPaintsScheduleFingerprint
import app.template.patches.redditsync.unlockultra.fingerprints.grabTagsScheduleFingerprint
import app.template.patches.redditsync.unlockultra.fingerprints.ultraUnlockedGateFingerprint
import app.template.patches.redditsync.unlockultra.fingerprints.validateLifetimeCallFingerprint

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39. For
 * a user who has already purchased Sync Ultra, this permanently unlocks it locally so
 * it no longer depends on the abandoned app's validation servers staying up (or on a
 * revoke push arriving over FCM), and stops the now-pointless periodic
 * re-verification network call.
 *
 * Confirmed by hand from real smali (via apktool):
 *
 * - Luc/b;->j()Z is the single "is Ultra unlocked" gate used by 30+ call sites
 *   app-wide. Forcing it to always return true unlocks every Ultra-gated feature.
 *
 * - ValidateUltraLifetimeJob's private i(Lj8/a;)V is what actually calls Firebase's
 *   "checkLifetimeCallable" function; its result has no other effect (both its
 *   success and failure paths just call onFinished()), so it's replaced with an
 *   immediate onFinished() call, preserving the WorkManager job's completion
 *   contract while skipping the network call entirely.
 *
 * - UltraGrabPaintsJob/UltraGrabTagsJob fetch real, visible Ultra features (other
 *   users' custom highlight colors and text tags, cloud-synced via Firebase
 *   Functions "getPaints"/"getTags") rather than license data. Per explicit user
 *   choice, this patch also disables their schedule triggers (static m()V in each),
 *   stopping all further paint/tag sync — existing local data is unaffected, but it
 *   will no longer update from the server.
 *
 * All changes are made by prepending an early return before the original method
 * body (matching this project's template pattern), leaving the now-unreachable
 * original instructions in place rather than removing them.
 */
val unlockUltraPatch = bytecodePatch(
    name = "Unlock Sync Ultra",
    description = "Permanently unlocks Sync Ultra locally, without depending on the abandoned " +
        "app's validation servers. Also stops the paint/tag cloud-sync jobs, since they'd " +
        "otherwise keep making network calls to a backend that may no longer respond.",
    default = true,
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        ultraUnlockedGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        validateLifetimeCallFingerprint.method.addInstructions(
            0,
            """
                invoke-interface {p1}, Lj8/a;->onFinished()V
                return-void
            """,
        )

        grabPaintsScheduleFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        grabTagsScheduleFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
