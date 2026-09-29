/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.facebook.media.taptoplay.FRAGMENT_ACTIVITY
import app.morphe.patches.facebook.media.taptoplay.MOTION_EVENT
import app.morphe.patches.facebook.media.taptoplay.touchDispatches
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.Method

private const val OPEN = "$EXTENSION_PACKAGE/chats/MessengerIcon;->open(Landroid/content/Context;Z)Z"
private const val TOUCH = "$EXTENSION_PACKAGE/chats/MessengerIcon;->touch($MOTION_EVENT)V"

/**
 * Has a tap on the Messenger icon in Facebook's top bar open the Messenger app, while the switch
 * is on and Messenger is installed, instead of Facebook's own Chats. See MessengerIconAnchors.kt
 * for the tap and the button handler it shares, which the hook goes first in; a tap that takes
 * the handler's route asks again there, and gets the same answer.
 *
 * Only a plain tap goes to Messenger. A long press keeps what Facebook does with it, a preview
 * sheet of chats or Chats itself, so Facebook's own chats stay one gesture away with the switch
 * on. Where Facebook builds the icon without its long-click listener, a held press comes to the tap
 * as a plain tap, so the patch hands every touch to the extension as well, which is how it tells.
 * In the default selection, with the switch off, so nothing changes until it's turned on.
 */
@Suppress("unused")
val openMessengerFromTopBarPatch = bytecodePatch(
    // The README table check reads this literal; ICON_PATCH carries the same text for the messages.
    name = "Open Messenger from the top bar",
    description = "Lets the Messenger icon at the top of Facebook open the Messenger app instead of Facebook's own " +
        "Chats. Without Messenger installed, Chats opens as before, and a long press on the icon still does what " +
        "Facebook does with it. Its switch starts off, so turn it on under Chats in Hushfacebook's settings.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val taps = classDefByStrings(REELS_TAB_ENTRY, StringComparisonType.EQUALS).flatMap { it.methods.filter(::isIconTap) }
        val tap = taps.singleOrNull() ?: throw PatchException(
            "$ICON_PATCH: expected one static tap method loading \"$NAVBAR_ENTRY\" and \"$REELS_TAB_ENTRY\", " +
                "found ${taps.size}",
        )
        val calls = buttonHandlerCalls(tap).distinctBy { it.toString() }
        val call = calls.singleOrNull() ?: throw PatchException(
            "$ICON_PATCH: expected the tap to call one static Messenger button handler " +
                "(Context, FbUserSession, String, Z, Z)V, found ${calls.size}",
        )
        val handler = classDefByOrNull(call.definingClass)?.let { resolveStatic(it, call) }?.takeIf(::isButtonHandler)
            ?: throw PatchException("$ICON_PATCH: the tap's call to $call isn't a Messenger button handler loading \"$LONG_PRESS\"")
        val activity = classDefByOrNull(FRAGMENT_ACTIVITY) ?: throw PatchException("$ICON_PATCH: this build has no $FRAGMENT_ACTIVITY")
        val dispatches = touchDispatches(activity)
        val dispatch = dispatches.singleOrNull() ?: throw PatchException(
            "$ICON_PATCH: expected $FRAGMENT_ACTIVITY to declare one dispatchTouchEvent($MOTION_EVENT)Z, found ${dispatches.size}",
        )
        mutableClassDefBy(tap.definingClass).methods.single { it.isSameAs(tap) }.openMessengerFirst(TAP_LONG_PRESS)
        mutableClassDefBy(handler.definingClass).methods.single { it.isSameAs(handler) }.openMessengerFirst(BUTTON_LONG_PRESS)
        mutableClassDefBy(FRAGMENT_ACTIVITY).methods.single { it.isSameAs(dispatch) }.handTouchesToIcon()
        enableStatus("messengerIcon")
    }
}

/**
 * First thing in FbFragmentActivity.dispatchTouchEvent, every touch on a Facebook screen goes to
 * MessengerIcon.touch before Facebook sees it. Where Facebook builds the icon without its
 * long-click listener, a press held on the icon reaches the tap as a plain tap when the finger
 * lifts, and the touch is what tells the extension it was held. Tap to play reads the same
 * dispatch for its own clock. Each hook only reads the event, and the range form passes it
 * without borrowing a register.
 */
internal fun MutableMethod.handTouchesToIcon() {
    val event = parameterRegister(0)
    addInstruction(0, "invoke-static/range { $event .. $event }, $TOUCH")
}

private fun Method.isSameAs(other: Method): Boolean =
    name == other.name && returnType == other.returnType &&
        parameterTypes.map(Any::toString) == other.parameterTypes.map(Any::toString)

/**
 * First thing in the tap or the handler: hand the extension the context and the long-press flag,
 * parameter [longPress], and return when it opened Messenger. Otherwise the method runs from its
 * own first instruction. v0 and v1 are free at index 0, and both parameters are copied down into
 * them because `invoke-static` names its registers in four bits.
 */
internal fun MutableMethod.openMessengerFirst(longPress: Int) {
    val parameters = parameterTypes.map(Any::toString)
    if (returnType != "V" || parameters.firstOrNull() != "Landroid/content/Context;" || parameters.getOrNull(longPress) != "Z") {
        throw PatchException(
            "$ICON_PATCH: $definingClass->$name isn't a void method taking the context first and the long press as " +
                "parameter $longPress",
        )
    }
    requireLocals(ICON_PATCH, 2)
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, ${parameterRegister(0)}
            move/from16 v1, ${parameterRegister(longPress)}
            invoke-static { v0, v1 }, $OPEN
            move-result v0
            if-eqz v0, :facebook
            return-void
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
