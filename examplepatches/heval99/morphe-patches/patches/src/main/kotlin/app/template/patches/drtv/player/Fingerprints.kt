package app.template.patches.drtv.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// The Massive Axis SDK keeps its class and member names (see COMPATIBILITY_DRTV), so the player
// anchors use those names together with the calls that make each method what it is.

internal const val BINGE_MARKER_UTILITY = "Laxis/android/sdk/common/bingemarkers/BingeMarkerUtility;"

// PlayerFragment.checkForBingMarkerButton(J)V runs on every VOD progress tick. It looks up the
// server time code (intro, recap or end credits) at the current position and shows the Skip
// button when BingeMarkerUtility.checkSkipThresholdInRange says so. That check only passes for the
// intro ("INTRO") and recap ("SUMMARY") codes: end credits get no button title and stay hidden.
internal object SkipButtonCheckFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/app/player/PlayerFragment;",
    returnType = "V",
    parameters = listOf("J"),
    strings = listOf("fragmentPlayerBinding.skipButton"),
    filters = listOf(
        methodCall(definingClass = BINGE_MARKER_UTILITY, name = "getTimeCodeWrapper"),
        methodCall(definingClass = BINGE_MARKER_UTILITY, name = "checkSkipThresholdInRange"),
    ),
)

// PlayerActivity.onResume() requests SCREEN_ORIENTATION_SENSOR_LANDSCAPE (6) on API 27 and later,
// on top of the same value in the manifest.
internal object PlayerActivityResumeFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/app/player/PlayerActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(name = "setRequestedOrientation"),
    ),
)
