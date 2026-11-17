package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * #187: nothing can screenshot or record a chat that's on screen, and the app switcher shows no chat either. Android
 * refuses a screenshot of a window marked secure itself, so the extension marks the window when the chat opens and
 * unmarks it when the chat goes. It covers this phone, the one doing the patching, and nothing about it reaches the
 * person on the other side.
 *
 * The hook is the chat fragment's own view handover, the same one [injectChatJump] takes, so a build that moved it
 * fails both the same way.
 */
internal const val SECURE_CHAT = "secure_chat"
internal const val SECURE_CHAT_CALL =
    "Lapp/hushmessenger/extension/SecureChat;->chatShown(Ljava/lang/Object;Landroid/view/View;)V"

/** First thing, the extension gets the fragment and its view. Messenger's own setup then runs as it did. */
internal fun MutableMethod.injectSecureChat() {
    validateChatJump()
    addInstructions(0, "invoke-static/range {p0 .. p1}, $SECURE_CHAT_CALL")
}
