package app.badfella.patches.linkedin.feed

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val VIEWER_CHROME = "$EXTENSION_PACKAGE/ViewerChrome;"

/** The store of the SDUI screens' states, where SetState actions write. */
private object StateManagerConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/infra/sdui/state/StateManager;",
    name = "<init>",
)

/** AndroidComposeView.dispatchTouchEvent(MotionEvent): every touch that enters a Compose screen. */
private object ViewerTouchFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/platform/AndroidComposeView;",
    name = "dispatchTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

@Suppress("unused")
val viewerTapToHidePatch = bytecodePatch(
    name = "Tap to hide in viewers",
    description = "Tap a video or document in full screen to hide the caption and buttons, like photos.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)

    // The video viewer is edited in the SDUI component hook.
    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isViewerTapToHideIncluded")

        StateManagerConstructorFingerprint.method.apply {
            val index = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            addInstruction(index, "invoke-static/range { p0 .. p0 }, $VIEWER_CHROME->onStateManager(Ljava/lang/Object;)V")
        }

        // Only watches the touch, the screen gets it as before.
        ViewerTouchFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, $VIEWER_CHROME->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)V"
        )
    }
}
