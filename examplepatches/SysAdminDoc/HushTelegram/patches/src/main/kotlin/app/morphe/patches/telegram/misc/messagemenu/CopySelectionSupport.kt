/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.returnEarlyWhen
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.savedownloads.NO_FORWARDS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

internal const val SELECTION_COPY = "$MESSAGE_MENU->selectionCopy()Z"
private const val SPECIAL_CHAT = 0x77628L
private const val GET_MESSAGE_OBJECT = "->getMessageObject()Lorg/telegram/messenger/MessageObject;"

/** What the chat's text selection asks before it offers Copy, or why this build has no such method. */
internal class SelectionCopy(val missing: String?, private val method: MutableMethod?) {
    fun apply() {
        method?.returnEarlyWhen("Add Repeat to the message menu", SELECTION_COPY, "const/4 v0, 0x1\nreturn v0")
    }
}

/**
 * The chat's text selection helper answers canCopy with a small no-argument boolean method that
 * says no for a chat the controller calls peer-no-forwards, or for a message whose own noforwards
 * flag is set. Asking the extension first and answering yes when Copy text is on opens just that
 * check, nothing else about those chats. Exactly one such method may exist.
 */
internal fun BytecodePatchContext.resolveSelectionCopy(): SelectionCopy {
    val found = classDefsMentioning(Mention.reference(NO_FORWARDS)).flatMap { cls ->
        cls.methods.filter { it.isSelectionCanCopy() }
    }
    val match = found.singleOrNull() ?: return SelectionCopy(
        "the chat's text selection no longer has one copy check (found ${found.size})", null)
    val method = mutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    return SelectionCopy(null, method)
}

internal fun Method.isSelectionCanCopy(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || AccessFlags.ABSTRACT.isSet(accessFlags) ||
        returnType != "Z" || parameterTypes.isNotEmpty()) return false
    val body = controlBody()
    return body.size in 10..70 && body.any { (it as? WideLiteralInstruction)?.wideLiteral == SPECIAL_CHAT } &&
        body.any { it.controlRef() == NO_FORWARDS } &&
        body.any { it.controlRef()?.endsWith(GET_MESSAGE_OBJECT) == true }
}
