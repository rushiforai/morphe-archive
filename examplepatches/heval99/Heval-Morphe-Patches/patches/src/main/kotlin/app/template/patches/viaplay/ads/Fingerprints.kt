package app.template.patches.viaplay.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

internal const val AD_PLAYBACK_STATE = "Landroidx/media3/common/AdPlaybackState;"
internal const val AD_PLAYBACK_STATE_UPDATER =
    "Landroidx/media3/exoplayer/source/ads/ServerSideAdInsertionMediaSource\$AdPlaybackStateUpdater;"

// Viaplay's VOD ads are server-side inserted DASH periods. The player's only implementation of
// Media3's ServerSideAdInsertionMediaSource.AdPlaybackStateUpdater builds, for every ad period
// (the "ad-id-signaling" check), an AdPlaybackState with one server-side ad group holding one ad
// of the period's duration, and at the end marks that ad skipped (withSkippedAd) only when the
// period is in the set of ad breaks before the resume position. The Media3 interface and the
// AdPlaybackState builder calls are kept library names; the filters follow their order in the
// method.
internal object AdPlaybackStateUpdaterFingerprint : Fingerprint(
    name = "onAdPlaybackStateUpdateRequested",
    returnType = "Z",
    parameters = listOf("Landroidx/media3/common/Timeline;"),
    filters = listOf(
        methodCall(definingClass = AD_PLAYBACK_STATE, name = "withIsServerSideInserted"),
        methodCall(definingClass = AD_PLAYBACK_STATE, name = "withAdDurationsUs"),
        methodCall(definingClass = "Ljava/util/Set;", name = "contains"),
        methodCall(definingClass = AD_PLAYBACK_STATE, name = "withSkippedAd"),
    ),
    custom = { method, classDef ->
        method.implementation != null && AD_PLAYBACK_STATE_UPDATER in classDef.interfaces
    },
)
