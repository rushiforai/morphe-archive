package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * #198: only + stays beside the message box, and the camera, gallery and mic buttons become rows in the menu + opens. The
 * extension finds the bar and the menu from the chat's own views, so the switch rides the handover the jump menu already
 * takes instead of fingerprinting the composer.
 */
internal const val CHAT_BAR_PLUS = "chat_bar_plus"
internal const val CHAT_BAR_PLUS_CALL =
    "Lapp/hushmessenger/extension/ChatBarPlus;->chatShown(Ljava/lang/Object;Landroid/view/View;)V"

/** Hands the chat fragment and its new view to the extension, first thing in the handover. */
internal fun MutableMethod.injectChatBarPlus() {
    validateChatJump()
    addInstructions(0, "invoke-static/range {p0 .. p1}, $CHAT_BAR_PLUS_CALL")
}
