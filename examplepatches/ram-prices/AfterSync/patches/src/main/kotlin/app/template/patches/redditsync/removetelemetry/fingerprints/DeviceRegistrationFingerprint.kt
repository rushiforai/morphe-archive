package app.template.patches.redditsync.removetelemetry.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches BaseActivity's private p0(String)V (v23.06.30-13:39) — confirmed by hand
 * from real smali (via apktool) to be a self-contained device/account registration
 * call: it builds a HashMap of the FCM push token, signed-in Reddit account, SIM
 * country ISO, the Ultra purchase token + SKU, the app's package name/version, and
 * the Play Store install-source (detects sideloading), then fires it off to a
 * Firebase Cloud Function literally named "hmmm" with no result handling. This is
 * the whole body of the method — nothing else in the app depends on it running.
 *
 * Matched by exact defining class + method name (no distinguishing strings to anchor
 * on structurally). Safe because this bundle is pinned to this exact app version.
 */
val deviceRegistrationFingerprint = fingerprint {
    returns("V")
    parameters("Ljava/lang/String;")
    custom { method, classDef ->
        classDef.type == "Lcom/laurencedawson/reddit_sync/ui/activities/BaseActivity;" &&
            method.name == "p0"
    }
}
