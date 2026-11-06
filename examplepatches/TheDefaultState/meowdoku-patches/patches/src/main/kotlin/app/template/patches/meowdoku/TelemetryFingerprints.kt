package app.template.patches.meowdoku

import app.morphe.patcher.Fingerprint

/**
 * The app's own telemetry layer, `com.learnings.analyze`.
 *
 * `AnalyzeManager` fans every event out to the platform SDKs it was built with, so
 * `realSendEvent` is the single dispatch point for everything the app reports. The three
 * platform `init()` methods are what start AppsFlyer, Firebase Analytics and Facebook App
 * Events in the first place — skipping them stops those SDKs from sending their own
 * install/session traffic too.
 *
 * The class names are real (not obfuscated), so they can be declared literally. Firebase's
 * Google Play services collector still logs a launch event on its own before any of this
 * runs; blocking `app-measurement.com` on the network covers that last piece.
 */

// Private static void dispatch of every queued event.
internal object AnalyzeSendEventFingerprint : Fingerprint(
    definingClass = "Lcom/learnings/analyze/AnalyzeManager;",
    name = "realSendEvent",
    isStatic = true,
    returnType = "V",
    parameters = listOf("Lcom/learnings/analyze/event/Event;")
)

// Platform start-ups. Each is a public no-arg void init on a concrete class.
internal object AppsFlyerInitFingerprint : Fingerprint(
    definingClass = "Lcom/learnings/analyze/platform/AppsflyerAnalyze;",
    name = "init",
    isStatic = false,
    returnType = "V",
    parameters = listOf()
)

internal object FirebaseAnalyzeInitFingerprint : Fingerprint(
    definingClass = "Lcom/learnings/analyze/platform/FirebaseAnalyze;",
    name = "init",
    isStatic = false,
    returnType = "V",
    parameters = listOf()
)

internal object FacebookAnalyzeInitFingerprint : Fingerprint(
    definingClass = "Lcom/learnings/analyze/platform/FacebookAnalyze;",
    name = "init",
    isStatic = false,
    returnType = "V",
    parameters = listOf()
)
