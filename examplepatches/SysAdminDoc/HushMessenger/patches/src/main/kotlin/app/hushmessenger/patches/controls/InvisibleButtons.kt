package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * #191: a button picked in settings is drawn at nothing and keeps its place, its size, the area that answers a tap and
 * what it did before, so a chat can lose a button's clutter without losing the button. The extension walks the chat for
 * buttons as it lays itself out and dims the picked ones.
 *
 * The hook is the chat fragment's own view handover, the same one [injectChatJump] and [injectSecureChat] take, so a
 * build that moved it fails all three the same way.
 */
internal const val INVISIBLE_BUTTONS = "invisible_buttons"
internal const val INVISIBLE_BUTTONS_CALL =
    "Lapp/hushmessenger/extension/InvisibleButtons;->chatShown(Ljava/lang/Object;Landroid/view/View;)V"

/** First thing, the extension gets the fragment and its view. Messenger's own setup then runs as it did. */
internal fun MutableMethod.injectInvisibleButtons() {
    validateChatJump()
    addInstructions(0, "invoke-static/range {p0 .. p1}, $INVISIBLE_BUTTONS_CALL")
}
