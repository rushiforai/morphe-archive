package dev.novaoffline.patches.nova.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * `ux.b.b(Context, Z, Lux/a;)V` — Amplitude initialiser.
 * Anchor: the Amplitude API key literal, unique in the APK.
 * Patched with an early return before `monitor-enter`, so no Amplitude
 * instance (and no Session Replay plugin) is ever created.
 */
object AmplitudeInitFingerprint : Fingerprint(
    strings = listOf("695bd40ef9ffbd57cae4c31d645e4a3d"),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Z", "Lux/a;"),
)

/**
 * `j10.b.a(JJ[BLContinuation;)Ljava/lang/Object;` — Novalytics raw-data upload.
 * Anchor: the `rawDataLog` URL format string, unique in the APK.
 * Patched to return `Boolean.FALSE` (upload failed), so the worker deletes
 * the local file instead of sending it.
 */
object RawDataUploadFingerprint : Fingerprint(
    strings = listOf("https://api.novalauncher.com/stats/rawDataLog/%016x/%d"),
    returnType = "Ljava/lang/Object;",
)

/**
 * `ox.d.a()Lox/n;` — ad-mediation config fetch (`AdUnitMappingFetcher`).
 * Anchor: the `mediationconfig.json` URL, unique in the APK.
 * Patched to return null (fetch failed), so no ad-unit mapping is loaded.
 */
object MediationConfigFingerprint : Fingerprint(
    strings = listOf("https://api.novalauncher.com/mediationconfig.json"),
    returnType = "Lox/n;",
    parameters = emptyList(),
)

/**
 * `NovaApplication.onCreate` — the Firebase Analytics/Crashlytics consent gate.
 * Anchors: the `Firebase initialized` log line plus the
 * `FirebaseAnalytics.getInstance` call in the same method.
 * The patch overwrites the `consent_sdk/f0.n()` result with false, so the
 * runtime re-enable of Analytics/Crashlytics (which would go through Google
 * Play Services and bypass the removed INTERNET permission) never runs.
 */
object FirebaseConsentFingerprint : Fingerprint(
    strings = listOf("Firebase initialized"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
            name = "getInstance",
        ),
    ),
)
