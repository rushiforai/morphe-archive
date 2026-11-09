package app.badfella.patches.linkedin.feed

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

/** AndroidComposeView.dispatchTouchEvent(MotionEvent): every touch that enters a Compose screen. */
private object SwipeTouchFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/platform/AndroidComposeView;",
    name = "dispatchTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

@Suppress("unused")
val swipeFeedsPatch = bytecodePatch(
    name = "Swipe between feeds",
    description = "Swipe left and right on the home feed to switch between For you and Network, like on X.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isSwipeFeedsIncluded")

        // Only watches the touch, the feed gets it as before.
        SwipeTouchFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, $EXTENSION_PACKAGE/FeedSwipe;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)V"
        )
    }
}
