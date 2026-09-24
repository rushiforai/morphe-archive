package app.lchanc3.patches.jptt.connection

import app.lchanc3.patches.jptt.shared.Constants.MAIN_ACTIVITY_CLASS
import app.morphe.patcher.Fingerprint

/**
 * `MainActivity.onResume()`, which runs after `onStart()` has set
 * `activityIsActive`, so the reconnect the hook triggers is allowed to proceed.
 */
internal object MainActivityOnResumeFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS,
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)
