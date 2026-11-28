package app.onlynazril.patches.tiktok.speedonly

import app.morphe.patcher.Fingerprint

/**
 * The feed cell's root touch dispatch. The long-press speed-up listener is asked here first, and
 * the branch it answers with `true` is the moment the hold is a 2x speed-up; the release after it
 * is where the like or comment button would otherwise still fire.
 */
object FeedCellTouchFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/VideoViewCellRootView;",
    name = "dispatchTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)
