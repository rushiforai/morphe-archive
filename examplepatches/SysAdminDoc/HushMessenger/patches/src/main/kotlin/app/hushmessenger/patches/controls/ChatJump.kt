package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Jump to a chat's first message or to a date (#130). The chat's own fragment hands the extension its view the moment
 * it has one, and the extension does the rest from the screen: a long press on the chat's name, then scrolling the
 * message list back while Messenger loads older messages. Both of Messenger's chat routes show this fragment.
 */
internal const val CHAT_JUMP = "chat_jump"
internal const val CHAT_JUMP_CALL = "Lapp/hushmessenger/extension/ChatJump;->chatShown(Ljava/lang/Object;Landroid/view/View;)V"
internal const val CHAT_FRAGMENT_NAME = "MsysThreadViewFragment"

private fun chatJumpChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the chat screen changed ($detail)")

/** The chat fragment's own onViewCreated, the moment the chat has a view. Discovery checks the class's original name. */
internal fun Method.isChatJumpView(): Boolean = !AccessFlags.STATIC.isSet(accessFlags) && name == "onViewCreated" &&
    returnType == "V" && parameterTypes.map { it.toString() } == listOf("Landroid/view/View;", "Landroid/os/Bundle;") &&
    implementation != null

internal fun MutableMethod.validateChatJump() {
    if (!isChatJumpView()) chatJumpChanged("no view for the chat in ${hookId()}")
}

/** First thing, the extension gets the fragment and its view. Messenger's own setup then runs as it did. */
internal fun MutableMethod.injectChatJump() {
    validateChatJump()
    addInstructions(0, "invoke-static/range {p0 .. p1}, $CHAT_JUMP_CALL")
}
