package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * #162: the chat's top bar and message box go translucent, with the messages running under them and showing through
 * blurred, the way an iPhone's bars do it. The extension finds the bars by where they sit in the chat as it lays itself
 * out, gives the message list their room and hands each bar a backdrop that blurs what's behind it.
 *
 * The hook is the chat fragment's own view handover, the same one [injectChatJump], [injectSecureChat] and
 * [injectInvisibleButtons] take, so a build that moved it fails all four the same way.
 */
internal const val IOS_BARS = "ios_bars"
internal const val IOS_BARS_CALL =
    "Lapp/hushmessenger/extension/IosBars;->chatShown(Ljava/lang/Object;Landroid/view/View;)V"

/** First thing, the extension gets the fragment and its view. Messenger's own setup then runs as it did. */
internal fun MutableMethod.injectIosBars() {
    validateChatJump()
    addInstructions(0, "invoke-static/range {p0 .. p1}, $IOS_BARS_CALL")
}
