package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.ComposeTouchFingerprint
import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode

private const val VIEWER_CHROME = "$EXTENSION_PACKAGE/ViewerChrome;"

/** The store of the SDUI screens' states, where SetState actions write. */
private object StateManagerConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/infra/sdui/state/StateManager;",
    name = "<init>",
)

@Suppress("unused")
val viewerTapToHidePatch = patch(
    name = "Tap to hide controls in viewers",
    description = "Tap a video or document in full screen to hide its caption and buttons, like photos. " +
        "Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")

    // The video viewer is edited in the SDUI component hook.
    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isViewerTapToHideIncluded")

        StateManagerConstructorFingerprint.method.apply {
            val index = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (index < 0) throw PatchException("StateManager constructor has no return-void")
            addInstruction(index, "invoke-static/range { p0 .. p0 }, $VIEWER_CHROME->onStateManager(Ljava/lang/Object;)V")
        }

        // Only watches the touch, the screen gets it as before.
        ComposeTouchFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, $VIEWER_CHROME->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)V"
        )
    }
}
