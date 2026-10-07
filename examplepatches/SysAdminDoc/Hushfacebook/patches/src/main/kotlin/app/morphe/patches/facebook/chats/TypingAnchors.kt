/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.requireLocals
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Where Facebook tells others that you're typing, read from 577, 580 and 581.
 *
 * A chat that opens inside Facebook goes through Mailbox, Messenger's on-device store, whose
 * feature class takes a thread id and a typing flag under the API name below (581
 * `LX/5LX;->A0K`, on a `MailboxFeature`). The older ConversationTypingContext and the comment box's
 * CommentTypingContext each post a runnable that sends the "typing" state (581 `LX/FuH`, `LX/qS2`);
 * their cancel runnables send "not typing" and stay. Redex keeps the runnables' original names in a
 * static field, and those names and the API name are what the patch finds them by.
 */
internal const val TYPING_PATCH = "Hide typing indicator"

private const val TYPING_INDICATOR = "$EXTENSION_PACKAGE/chats/TypingIndicator;"
internal const val CHAT_TYPING = "$TYPING_INDICATOR->chatTyping(Z)Z"
internal const val HOLDS_CHAT_TYPING = "$TYPING_INDICATOR->holdsChatTyping()Z"
internal const val HOLDS_COMMENT_TYPING = "$TYPING_INDICATOR->holdsCommentTyping()Z"

/** The Mailbox API name the typing setter logs its call under. */
internal const val MAILBOX_TYPING = "setTypingIndicatorForThreadWithThreadIdentifier"
internal const val MAILBOX_FEATURE = "Lcom/facebook/msys/mca/MailboxFeature;"

/** The runnables that send the "typing" state, by the names Redex keeps for them. */
internal const val CHAT_SEND_TYPING = "ConversationTypingContext\$sendActiveStateRunnable\$1"
internal const val COMMENT_SEND_TYPING = "CommentTypingContext\$sendActiveStateRunnable\$1"

/**
 * Mailbox's typing setter: an instance method taking (thread id, typing) that loads the API's name
 * and reads one of MailboxFeature's own fields, which is what the feature classes do.
 */
internal fun isMailboxTypingSetter(method: Method): Boolean {
    if (AccessFlags.STATIC.isSet(method.accessFlags)) return false
    if (method.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/String;", "Z")) return false
    val code = method.implementation?.instructions ?: return false
    return code.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == MAILBOX_TYPING } &&
        code.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == MAILBOX_FEATURE }
}

/** A send runnable's run(): void, no parameters, with a body. */
internal fun isRunMethod(method: Method) =
    method.name == "run" && method.returnType == "V" && method.parameterTypes.isEmpty() && method.implementation != null

/**
 * Hands the setter's typing flag to the extension first, so Mailbox hears "not typing" while the
 * switch is on. The flag is the second parameter, the last register.
 */
internal fun MutableMethod.sendNotTyping() {
    val flag = implementation!!.registerCount - 1
    addInstructions(
        0,
        """
            invoke-static/range { v$flag .. v$flag }, $CHAT_TYPING
            move-result v$flag
        """,
    )
}

/** Makes a send runnable's run() return at once while [holds] answers true. */
internal fun MutableMethod.holdBackTyping(holds: String) {
    requireLocals(TYPING_PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $holds
            move-result v0
            if-eqz v0, :send
            return-void
        """,
        ExternalLabel("send", getInstruction(0)),
    )
}

/** Throws unless [found] holds exactly one of [what]. */
internal fun <T> List<T>.singleTypingTarget(what: String): T =
    singleOrNull() ?: throw PatchException("$TYPING_PATCH: expected one $what, found $size")
