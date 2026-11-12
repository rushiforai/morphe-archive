/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
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

private const val PATCH = "Bypass channel restrictions"
private const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"

private const val CHANNEL_RESTRICTIONS = "$EXTENSION_PACKAGE/misc/ChannelRestrictions;"
private const val IS_CHAT_NO_FORWARDS_HOOK = "$CHANNEL_RESTRICTIONS->isChatNoForwards(I)I"
private const val NO_FORWARDS_HOOK = "$CHANNEL_RESTRICTIONS->noForwards(I)I"
private const val IGNORE_REASON_HOOK = "$CHANNEL_RESTRICTIONS->ignoreRestrictionReason(Ljava/util/ArrayList;)Z"
internal const val STORY_HOOK = "$CHANNEL_RESTRICTIONS->storyAllowed(I)I"

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
        "copyright or local law, as long as Telegram still sends them. Both start off. Turn them on in " +
        "HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("bypassChannelRestrictions")
        requireStatusMethod("openRestrictedChats")

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

internal fun Method.returns(): List<Int> =
    implementation?.instructions?.withIndex()?.filter { it.value.opcode == Opcode.RETURN }?.map { it.index }.orEmpty()

private fun Method.hasFreeLocal(): Boolean {
    val code = implementation ?: return false
    val ins = parameters.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return code.registerCount > ins
}
