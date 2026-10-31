package app.aapam.patches.zee5.shared

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object AnalyticsTrackEventFingerprint : Fingerprint(
    definingClass = "Lcom/zee5/android/analytics/data/DefaultAnalytics;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf(
        "Lcom/zee5/android/analytics/data/trackers/mixpanel/data/models/AnalyticEvent;",
    ),
)

internal object CleverTapInitFingerprint : Fingerprint(
    definingClass = "Lcom/zee5/android/analytics/data/trackers/clevertap/DefaultCleverTapAnalytics;",
    name = "initCleverTap",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
)

internal object FirebaseInitFingerprint : Fingerprint(
    definingClass = "Lcom/zee5/android/analytics/data/trackers/firebase/DefaultFirebaseAnalytics;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Lcom/google/firebase/analytics/FirebaseAnalytics;",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lcom/zee5/android/analytics/data/trackers/EventsFlowProvider;",
        "Lcom/zee5/android/analytics/domain/FirebaseRemoteFilterProvider;",
    ),
)

// PlayerUtilsKt.mediaSourceFactory(...) builds the MediaSource.Factory used by
// the ZEE5 player and wires in BOTH local (client-side) and server-side (DAI)
// IMA ad insertion. Because the player calls
// ZMediaPlayerImpl.getServerSideAdLoader().setPlayer(...) unconditionally, the
// old "return null" approach would NPE and crash playback. Instead we hook this
// factory and hand back the DRM-configured factory with ad-insertion components
// never attached.
internal object MediaSourceFactoryFingerprint : Fingerprint(
    definingClass = "Lcom/zee/mediaplayer/exo/utils/PlayerUtilsKt;",
    name = "mediaSourceFactory",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Landroidx/media3/exoplayer/source/MediaSource\$Factory;",
)
