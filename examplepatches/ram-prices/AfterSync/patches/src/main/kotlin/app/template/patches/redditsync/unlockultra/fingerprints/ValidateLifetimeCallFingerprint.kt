package app.template.patches.redditsync.unlockultra.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches ValidateUltraLifetimeJob's private i(Lj8/a;)V (v23.06.30-13:39) — confirmed
 * by hand from real smali (via apktool) to be the method that actually kicks off a
 * network call to the Firebase Cloud Function "checkLifetimeCallable", passing the
 * Ultra purchase token, to re-verify a lifetime purchase against possible
 * refund/fraud. Both its success and failure callbacks (the class's static j()/k()
 * methods) do nothing but call the Lj8/a; callback's onFinished() — this job's
 * network result has no other client-visible effect. Once Ultra is hardcoded
 * unlocked (see ultraUnlockedGateFingerprint), this re-check call serves no purpose,
 * so it's replaced with an immediate onFinished() call (matching what both outcomes
 * already do today) to skip the network call while still letting the WorkManager
 * job complete normally.
 *
 * Matched by exact defining class + method name (no distinguishing strings to anchor
 * on structurally). Safe because this bundle is pinned to this exact app version.
 */
val validateLifetimeCallFingerprint = fingerprint {
    returns("V")
    parameters("Lj8/a;")
    custom { method, classDef ->
        classDef.type == "Lcom/laurencedawson/reddit_sync/ultra/jobs/ValidateUltraLifetimeJob;" &&
            method.name == "i"
    }
}
