/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Fingerprints for ZEE5 Android TV privacy patches.
 */

package app.morphe.patches.zee5.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * `DefaultAnalytics.trackEvent(AnalyticEvent)` — the single funnel through which
 * every `track*` method (CleverTap, Firebase, Mixpanel, videoanalytics) dispatches.
 * Neutralizing this method disables all analytics at once.
 */
internal object AnalyticsTrackEventFingerprint : Fingerprint(
    definingClass = "Lcom/zee5/android/analytics/data/DefaultAnalytics;",
    name = "trackEvent"
    // Minimal fingerprint: there is exactly ONE `trackEvent` method in
    // DefaultAnalytics (private final trackEvent(AnalyticEvent)V). Matching on
    // class + name alone is unambiguous and avoids any mismatch on
    // access-flag/parameter/return comparisons. The patch inserts
    // `return-void` at index 0, neutralising the whole analytics funnel.
)

/**
 * `DefaultCleverTapAnalytics.initCleverTap()` — initializes the CleverTap SDK
 * (which collects the advertising id / GAID via DeviceInfo). Disabling prevents
 * the SDK from ever starting.
 */
internal object CleverTapInitFingerprint : Fingerprint(
    definingClass = "Lcom/zee5/android/analytics/data/trackers/clevertap/DefaultCleverTapAnalytics;",
    name = "initCleverTap",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf()
)

/**
 * `DefaultFirebaseAnalytics.<init>` — wires up FirebaseAnalytics and the
 * coroutine event/property flows. Disabling prevents Firebase from receiving
 * any events.
 */
internal object FirebaseInitFingerprint : Fingerprint(
    definingClass = "Lcom/zee5/android/analytics/data/trackers/firebase/DefaultFirebaseAnalytics;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Lcom/google/firebase/analytics/FirebaseAnalytics;",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lcom/zee5/android/analytics/data/trackers/EventsFlowProvider;"
    )
)

/**
 * `ZMediaPlayerImpl.getServerSideAdLoader()` — builds the IMA server-side ad
 * insertion loader that injects ads into playback. Returning null stops ads
 * from loading without breaking normal content playback.
 */
internal object MediaPlayerAdLoaderFingerprint : Fingerprint(
    definingClass = "Lcom/zee/mediaplayer/exo/ZMediaPlayerImpl;",
    name = "getServerSideAdLoader",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Landroidx/media3/exoplayer/ima/ImaServerSideAdInsertionMediaSource\$AdsLoader;",
    parameters = listOf()
)
