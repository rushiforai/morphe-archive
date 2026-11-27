package app.template.patches.redditsync.unlockultra.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches UltraGrabPaintsJob's static m()V (v23.06.30-13:39) — confirmed by hand from
 * real smali (via apktool) to be the schedule trigger for a WorkManager job that
 * calls the Firebase Cloud Function "getPaints" (passing the Ultra purchase token) to
 * fetch and cloud-sync other users' custom highlight-color assignments ("paints").
 * Called from Luc/b;->o() (on purchase/restore) and from the FCM message handler.
 *
 * Matched by exact defining class + method name (no distinguishing strings to anchor
 * on structurally). Safe because this bundle is pinned to this exact app version.
 */
val grabPaintsScheduleFingerprint = fingerprint {
    returns("V")
    parameters()
    custom { method, classDef ->
        classDef.type == "Lcom/laurencedawson/reddit_sync/ultra/jobs/UltraGrabPaintsJob;" &&
            method.name == "m"
    }
}
