package app.morphe.patches.tiktok.interaction.gesture

import app.morphe.patches.tiktok.shared.discovery.TikTokFingerprint as Fingerprint

/**
 * TikTok 46.7.3 portrait feed gesture listener.
 *
 * The 46.4.3 owner LX/0QeR moved to LX/0BBw. The method contracts remain the
 * standard GestureDetector callbacks, while the listener still owns the
 * double-click and playback-action delegates used by GestureRemapperPatch.
 */
private const val PORTRAIT_GESTURE_LISTENER = "LX/0BBw;"

internal object PortraitSingleTapFingerprint : Fingerprint(
    definingClass = PORTRAIT_GESTURE_LISTENER,
    name = "onSingleTapConfirmed",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

internal object PortraitDoubleTapFingerprint : Fingerprint(
    definingClass = PORTRAIT_GESTURE_LISTENER,
    name = "onDoubleTap",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

internal object PortraitLongPressFingerprint : Fingerprint(
    definingClass = PORTRAIT_GESTURE_LISTENER,
    name = "onLongPress",
    returnType = "V",
    parameters = listOf("Landroid/view/MotionEvent;"),
)
