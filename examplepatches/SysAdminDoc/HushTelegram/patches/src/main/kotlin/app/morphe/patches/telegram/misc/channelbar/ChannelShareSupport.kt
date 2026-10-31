/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.channelbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.refusedByVerifier
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CHANNEL_SHARE = "$EXTENSION_PACKAGE/misc/ChannelShare;"
internal const val SHARE_ON = "$CHANNEL_SHARE->on()Z"
internal const val SHARE_SHOWN = "$CHANNEL_SHARE->shown(III)Z"
internal const val SHARE_MESSAGE = "Lorg/telegram/messenger/MessageObject;"
internal const val SHARE_DECISION = "needDrawShareButton"
/** Telegram's own answer, kept whole under this name for the wrapper to ask first. */
internal const val STOCK_SHARE = "hushStockShareButton"
private const val TLRPC = "Lorg/telegram/tgnet/TLRPC\$"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"

/**
 * What the wrapper reads, in the order it reads them. Telegram's own answer reads each of them too,
 * so a build that renames one shows up before anything is changed.
 */
internal val SHARE_FACTS = listOf(
    "$SHARE_MESSAGE->isFromUser()Z",
    "$SHARE_MESSAGE->messageOwner:${TLRPC}Message;",
    "${TLRPC}Message;->fwd_from:${TLRPC}MessageFwdHeader;",
    "${TLRPC}MessageFwdHeader;->from_id:${TLRPC}Peer;",
    "${TLRPC}TL_peerChannel;",
    "$SHARE_MESSAGE->isSaved:Z",
    "$SHARE_MESSAGE->getDialogId()J",
    "$SHARE_MESSAGE->currentAccount:I",
    "$USER_CONFIG->getInstance(I)$USER_CONFIG",
    "$USER_CONFIG->getClientUserId()J",
)

/**
 * Asks Telegram's own answer first and stops at a no. On a yes, with the switch on, hands the
 * extension whether a person sent the message, whether it's forwarded from a channel and whether
 * it's in Saved Messages: flagged as such, or in the chat whose id is the account's own.
 */
private val WRAPPER = """
    invoke-direct {p0}, $SHARE_MESSAGE->$STOCK_SHARE()Z
    move-result v0
    if-eqz v0, :answer
    invoke-static {}, $SHARE_ON
    move-result v1
    if-eqz v1, :answer
    invoke-virtual {p0}, $SHARE_MESSAGE->isFromUser()Z
    move-result v1
    const/4 v2, 0x0
    iget-object v3, p0, $SHARE_MESSAGE->messageOwner:${TLRPC}Message;
    if-eqz v3, :forwardKnown
    iget-object v3, v3, ${TLRPC}Message;->fwd_from:${TLRPC}MessageFwdHeader;
    if-eqz v3, :forwardKnown
    iget-object v3, v3, ${TLRPC}MessageFwdHeader;->from_id:${TLRPC}Peer;
    instance-of v2, v3, ${TLRPC}TL_peerChannel;
    :forwardKnown
    iget-boolean v3, p0, $SHARE_MESSAGE->isSaved:Z
    if-nez v3, :savedKnown
    invoke-virtual {p0}, $SHARE_MESSAGE->getDialogId()J
    move-result-wide v4
    iget v3, p0, $SHARE_MESSAGE->currentAccount:I
    invoke-static {v3}, $USER_CONFIG->getInstance(I)$USER_CONFIG
    move-result-object v3
    invoke-virtual {v3}, $USER_CONFIG->getClientUserId()J
    move-result-wide v6
    cmp-long v4, v4, v6
    const/4 v3, 0x1
    if-eqz v4, :savedKnown
    const/4 v3, 0x0
    :savedKnown
    invoke-static {v1, v2, v3}, $SHARE_SHOWN
    move-result v0
    :answer
    return v0
""".trimIndent()

/**
 * Telegram's answer to whether a message gets the round share button ([decision], on [owner]) and
 * the two methods that take its place: [stock], the same code under a private name, and [wrapper],
 * which asks it first. Or [missing], why this build can't have the switch. Both are built and
 * checked before [apply], so nothing in the app changes until then.
 */
internal class ChannelShareButton(
    private val owner: MutableClass?,
    private val decision: MutableMethod?,
    private val stock: MutableMethod?,
    private val wrapper: MutableMethod?,
    val missing: String?,
) {
    fun apply() {
        if (owner == null || decision == null || stock == null || wrapper == null) return
        owner.methods.remove(decision)
        owner.methods.add(stock)
        owner.methods.add(wrapper)
    }
}

/**
 * A message decides once whether it gets the round share button, and the bubble's layout, its width
 * and its draw all read that answer. A channel's posts get it, and so does a channel post forwarded
 * into a chat, but so do bots' messages, media from people in public groups and Saved Messages'
 * jump back to the original, which this keeps.
 */
internal fun BytecodePatchContext.resolveChannelShare(): ChannelShareButton {
    controlHook(CHANNEL_SHARE, "on", emptyList(), "Z")
    controlHook(CHANNEL_SHARE, "shown", listOf("I", "I", "I"), "Z")
    requireStatusMethod("hideChannelShare")
    fun missing(why: String) = ChannelShareButton(null, null, null, null, why)

    val owner = mutableClassDefByOrNull(SHARE_MESSAGE) ?: return missing("the app has no message class to ask")
    val decision = owner.methods.singleOrNull { it.name == SHARE_DECISION && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        ?: return missing("messages no longer decide their share button in one place")
    if (AccessFlags.STATIC.isSet(decision.accessFlags) || AccessFlags.ABSTRACT.isSet(decision.accessFlags) ||
        decision.implementation == null) {
        return missing("the share button decision is no longer a method of the message itself")
    }
    if (owner.methods.any { it.name == STOCK_SHARE }) return missing("the share button decision is already wrapped")
    val reads = decision.controlBody().mapNotNull { it.controlRef() }.toSet()
    SHARE_FACTS.firstOrNull { it !in reads }?.let { return missing("the share button decision no longer reads $it") }

    val stock = MutableMethod(ImmutableMethod(SHARE_MESSAGE, STOCK_SHARE, emptyList(), "Z",
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, null, decision.implementation))
    val wrapper = ImmutableMethod(SHARE_MESSAGE, decision.name, decision.parameters, decision.returnType, decision.accessFlags,
        decision.annotations, decision.hiddenApiRestrictions, MutableMethodImplementation(9))
        .toMutable().apply { addInstructionsWithLabels(0, WRAPPER) }
    val refusals = refusedByVerifier(wrapper, { classDefByOrNull(it)?.superclass },
        { classDefByOrNull(it)?.let { found -> AccessFlags.INTERFACE.isSet(found.accessFlags) } })
    if (refusals.isNotEmpty()) throw PatchException("$SHARE_MESSAGE->$SHARE_DECISION would fail Android's verifier: ${refusals.joinToString("; ")}")
    return ChannelShareButton(owner, decision, stock, wrapper, null)
}
