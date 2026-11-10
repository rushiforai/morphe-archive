package app.template.patches.adidas

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for adidas Running 14.12.1 (versionCode 2026110512), package
 * `com.runtastic.android`.
 *
 * The app is R8-shrunk, but a few entry points keep their real names:
 *  - the Application class (`com.runtastic.android.RuntasticApplication`) — PairIP
 *    wraps it as `com.pairip.application.Application`, whose `.super` is the real one;
 *  - the third-party SDKs (Adjust, Firebase).
 */

/** `RuntasticApplication.onCreate()V` — app start; used to force night mode. */
val AdidasApplicationOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/runtastic/android/RuntasticApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/** Adjust `trackEvent(AdjustEvent)V` — event tracking; no-op'ed. */
val AdidasAdjustTrackEventFingerprint = Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustEvent;"),
)

/** Adjust `onResume()V` — session/lifecycle tracking; no-op'ed. */
val AdidasAdjustOnResumeFingerprint = Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)
