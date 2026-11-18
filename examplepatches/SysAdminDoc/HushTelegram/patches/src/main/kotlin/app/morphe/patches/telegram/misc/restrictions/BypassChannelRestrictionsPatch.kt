/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val PATCH = "Bypass channel restrictions"
private const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"

private const val CHANNEL_RESTRICTIONS = "$EXTENSION_PACKAGE/misc/ChannelRestrictions;"
private const val IS_CHAT_NO_FORWARDS_HOOK = "$CHANNEL_RESTRICTIONS->isChatNoForwards(I)I"
private const val NO_FORWARDS_HOOK = "$CHANNEL_RESTRICTIONS->noForwards(I)I"
private const val IGNORE_REASON_HOOK = "$CHANNEL_RESTRICTIONS->ignoreRestrictionReason(Ljava/util/ArrayList;)Z"
internal const val STORY_HOOK = "$CHANNEL_RESTRICTIONS->storyAllowed(I)I"

/** A message's own no-forwarding flag, set on every post of a protected channel and on a bot's protected sends. */
internal const val MESSAGE_NO_FORWARDS = "Lorg/telegram/tgnet/TLRPC\$Message;->noforwards:Z"
/** A chat's own no-forwarding flag, which the share button and a few other screens read straight off the chat. */
internal const val CHAT_NO_FORWARDS = "Lorg/telegram/tgnet/TLRPC\$Chat;->noforwards:Z"
internal val NO_FORWARDS_FLAGS = setOf(MESSAGE_NO_FORWARDS, CHAT_NO_FORWARDS)
private const val USER_FULL = "Lorg/telegram/tgnet/TLRPC\$UserFull;"
private const val PRIVATE_CHAT_NO_FORWARDS = "$USER_FULL->noforwards_peer_enabled:Z"

/** What the story viewer's check reads: the story's own flag, whether it's pinned, and its channel's flag. */
internal val STORY_CHECK_READS = listOf(
    "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;->noforwards:Z",
    "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;->pinned:Z",
    "Lorg/telegram/tgnet/TLRPC\$Chat;->noforwards:Z",
)

@Suppress("unused")
val bypassChannelRestrictionsPatch = bytecodePatch(
    name = PATCH,
    description = "Lets you forward, copy and save from channels and chats that turn those off. A second " +
        "switch, Open restricted channels, opens channels, groups and messages Telegram marks unavailable for " +
        "copyright or local law, as long as Telegram still sends them, and offers a channel that banned you on " +
        "the web. Both start off. Turn them on in " +
        "HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("bypassChannelRestrictions")
        requireStatusMethod("openRestrictedChats")
        requireStatusMethod("bannedChannelWeb")

        val owner = tgMutableClassDefByOrNull(MESSAGES_CONTROLLER)
        if (owner == null) {
            patchLog.warning("$PATCH: MessagesController is missing. The patch is left out.")
            return@execute
        }

        var hooked = 0

        val isChatNoForwards = owner.methods.singleOrNull { m ->
            m.origName == "isChatNoForwards" && m.origReturnType == "Z"
        }
        if (isChatNoForwards?.implementation != null) {
            isChatNoForwards.addInstructionsWithLabels(0, """
                const/4 v0, 0x1
                invoke-static {v0}, $IS_CHAT_NO_FORWARDS_HOOK
                move-result v0
                if-nez v0, :stock
                return v0
            """, ExternalLabel("stock", isChatNoForwards.getInstruction(0)))
            hooked++
        } else {
            patchLog.warning("$PATCH: isChatNoForwards is missing. That part is left out.")
        }

        val isPeerNoForwards = owner.methods.singleOrNull { m ->
            m.origName == "isPeerNoForwards" && m.origReturnType == "Z" &&
                !AccessFlags.STATIC.isSet(m.accessFlags)
        }
        if (isPeerNoForwards?.implementation != null) {
            isPeerNoForwards.addInstructionsWithLabels(0, """
                const/4 v0, 0x1
                invoke-static {v0}, $NO_FORWARDS_HOOK
                move-result v0
                if-nez v0, :stock
                return v0
            """, ExternalLabel("stock", isPeerNoForwards.getInstruction(0)))
            hooked++
        } else {
            patchLog.warning("$PATCH: isPeerNoForwards is missing. That part is left out.")
        }

        // A private chat that turned forwarding off answers through a static check of the other
        // person's full profile, which the chat's Forward and the profile ask directly (#73).
        val privateChat = owner.methods.singleOrNull { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "Z" &&
                m.origParameterTypes == listOf(USER_FULL) && m.hasFreeLocal() &&
                m.implementation!!.instructions.any { it.origRef() == PRIVATE_CHAT_NO_FORWARDS }
        }
        if (privateChat != null) {
            privateChat.addInstructionsWithLabels(0, """
                const/4 v0, 0x1
                invoke-static {v0}, $IS_CHAT_NO_FORWARDS_HOOK
                move-result v0
                if-nez v0, :stock
                return v0
            """, ExternalLabel("stock", privateChat.getInstruction(0)))
            hooked++
        } else {
            patchLog.warning("$PATCH: the private chat check is missing. Private chats that turn forwarding off keep it off.")
        }

        // Forward, Copy, Save, the share button and their message menu entries each hang on a read
        // of the message's or the chat's own flag that Telegram branches on right away: the
        // selection's counts (a protected message in it turns Forward off), the message's own
        // forward check, the menu, shared media and the photo viewer (#73). Each of those reads
        // goes through the extension before the branch. Reads that only copy the flag, like the
        // channel's own Restrict saving content switch, stay Telegram's.
        val gates = noForwardsGates()
        for ((method, reads) in gates) {
            for (at in reads.sortedDescending()) {
                val read = method.getInstruction(at)
                val flag = (read as TwoRegisterInstruction).registerA
                val hook = if (read.origRef() == CHAT_NO_FORWARDS) IS_CHAT_NO_FORWARDS_HOOK else NO_FORWARDS_HOOK
                method.addInstructionsAtControlFlowLabel(at + 1, """
                    invoke-static/range {v$flag .. v$flag}, $hook
                    move-result v$flag
                """)
            }
        }
        if (gates.isNotEmpty()) {
            hooked++
        } else {
            patchLog.warning("$PATCH: no check of a message's or chat's own flag found. Forward, Copy and Save stay off where it's set.")
        }
        if (gates.none { (method, _) -> method.isCanForwardMessage() }) {
            patchLog.warning("$PATCH: the message's own forward check is missing. Forward stays off for a selection holding a protected message.")
        }

        // Every check of a chat, user or message Telegram restricts for copyright or local law asks
        // here (#58). An instance method since 13.2. v0 has to be a local, not a parameter.
        val restrictionReason = owner.methods.singleOrNull { m ->
            m.origName == "getRestrictionReason" && m.origReturnType == "Ljava/lang/String;" &&
                m.origParameterTypes == listOf("Ljava/util/ArrayList;") && m.hasFreeLocal()
        }
        if (restrictionReason != null) {
            restrictionReason.addInstructionsWithLabels(0, """
                invoke-static {p1}, $IGNORE_REASON_HOOK
                move-result v0
                if-eqz v0, :stock
                const/4 v0, 0x0
                return-object v0
            """, ExternalLabel("stock", restrictionReason.getInstruction(0)))
            enableCapability("openRestrictedChats")
            hooked++
        } else {
            patchLog.warning("$PATCH: getRestrictionReason is missing. Open restricted channels is left out.")
        }

        // A channel that banned you never sends its posts, whatever the app says, but its public
        // page at t.me/s/name shows them to anyone. Telegram's alert for it gets a button that
        // opens that page in a browser (#71).
        try {
            applyBannedChannelAlert(resolveBannedChannelAlert())
            enableCapability("bannedChannelWeb")
            hooked++
        } catch (unfit: PatchException) {
            patchLog.warning("$PATCH: ${unfit.message}. A banned channel's alert keeps only Telegram's OK.")
        }

        // The story viewer asks one method whether a story may be shared, saved or screenshot, and
        // it answers no for a protected story or, once pinned, a protected channel's (#52). Every
        // answer goes through the extension, which only ever turns a no into a yes.
        val storyCheck = storyCheck()
        if (storyCheck != null) {
            storyCheck.returns().sortedDescending().forEach { at ->
                val answer = (storyCheck.getInstruction(at) as OneRegisterInstruction).registerA
                storyCheck.addInstructionsAtControlFlowLabel(at, """
                    invoke-static {v$answer}, $STORY_HOOK
                    move-result v$answer
                """)
            }
            hooked++
        } else {
            patchLog.warning("$PATCH: the story viewer's check is missing or not alone. Stories are left out.")
        }

        // Telegram's servers refuse to forward from these chats whatever the app says, so the
        // forward itself sends those messages again as new ones (#73). Only worth it once the
        // app offers Forward there.
        if (isChatNoForwards?.implementation != null || isPeerNoForwards?.implementation != null) {
            try {
                applyProtectedForward(resolveProtectedForward())
            } catch (unfit: PatchException) {
                patchLog.warning("$PATCH: ${unfit.message}. Forwards from protected chats stay Telegram's, which its servers refuse.")
            }
        }

        if (hooked > 0) {
            enableStatus("bypassChannelRestrictions")
        } else {
            patchLog.warning("$PATCH: no hook sites found. The patch is left out of this build.")
        }
    }
}

/**
 * The story viewer's one check of a story, the only instance method with no arguments that answers
 * a boolean after reading all of [STORY_CHECK_READS]. Null when there isn't exactly one, or when an
 * answer sits in a register `invoke-static {vN}` can't name.
 */
private fun BytecodePatchContext.storyCheck(): MutableMethod? {
    val found = mutableListOf<Method>()
    forEachClassMentioning(Mention.allReferences(STORY_CHECK_READS)) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filterTo(found) { it.isStoryCheck() }
    }
    val check = found.singleOrNull() ?: return null
    val method = tgMutableClassDefBy(check.definingClass).methods.single { it.name == check.name && it.isStoryCheck() }
    val answers = method.returns().map { (method.getInstruction(it) as OneRegisterInstruction).registerA }
    return method.takeIf { answers.isNotEmpty() && answers.all { it < 16 } }
}

internal fun Method.isStoryCheck(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty() || returnType != "Z") return false
    val reads = implementation?.instructions?.mapNotNullTo(mutableSetOf()) { it.origRef() } ?: return false
    return reads.containsAll(STORY_CHECK_READS)
}

/**
 * Every method outside the network layer and the extension that branches on [NO_FORWARDS_FLAGS]
 * right after reading one, with the index of each such read. The story check has its own hook.
 */
private fun BytecodePatchContext.noForwardsGates(): List<Pair<MutableMethod, List<Int>>> {
    val found = mutableListOf<Method>()
    forEachClassMentioning(Mention.anyReference(NO_FORWARDS_FLAGS)) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.type.startsWith("Lorg/telegram/tgnet/")) return@forEachClassMentioning
        cls.methods.filterTo(found) { it.noForwardsGates().isNotEmpty() }
    }
    return found.map { gate ->
        val types = gate.parameterTypes.map { it.toString() }
        val method = tgMutableClassDefBy(gate.definingClass).methods.single {
            it.name == gate.name && it.returnType == gate.returnType && it.parameterTypes.map { p -> p.toString() } == types
        }
        method to method.noForwardsGates()
    }
}

/**
 * The indexes of this method's reads of a message's or a chat's own no-forwarding flag that an
 * `if-eqz` or `if-nez` tests right away, on the register it was read into. Empty for the story
 * check and for reads that only pass the flag on.
 */
internal fun Method.noForwardsGates(): List<Int> {
    val code = implementation?.instructions?.toList() ?: return emptyList()
    val gates = code.indices.filter { at ->
        val read = code[at]
        val next = code.getOrNull(at + 1)
        read.opcode == Opcode.IGET_BOOLEAN && (next?.opcode == Opcode.IF_EQZ || next?.opcode == Opcode.IF_NEZ) &&
            (next as OneRegisterInstruction).registerA == (read as TwoRegisterInstruction).registerA &&
            read.origRef() in NO_FORWARDS_FLAGS
    }
    return if (gates.isEmpty() || isStoryCheck()) emptyList() else gates
}

/** Telegram's `MessageObject.canForwardMessage()`, which the selection asks of every message it takes. */
internal fun Method.isCanForwardMessage() = origDefiningClass == MESSAGE_OBJECT && origName == "canForwardMessage" &&
    origReturnType == "Z" && origParameterTypes.isEmpty()

internal fun Method.returns(): List<Int> =
    implementation?.instructions?.withIndex()?.filter { it.value.opcode == Opcode.RETURN }?.map { it.index }.orEmpty()

private fun Method.hasFreeLocal(): Boolean {
    val code = implementation ?: return false
    val ins = parameters.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return code.registerCount > ins
}
