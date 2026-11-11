/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val PATCH = "Bypass channel restrictions"
private const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"

private const val CHANNEL_RESTRICTIONS = "$EXTENSION_PACKAGE/misc/ChannelRestrictions;"
private const val IS_CHAT_NO_FORWARDS_HOOK = "$CHANNEL_RESTRICTIONS->isChatNoForwards(I)I"
private const val NO_FORWARDS_HOOK = "$CHANNEL_RESTRICTIONS->noForwards(I)I"
private const val IGNORE_REASON_HOOK = "$CHANNEL_RESTRICTIONS->ignoreRestrictionReason(Ljava/util/ArrayList;)Z"

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

        if (hooked > 0) {
            enableStatus("bypassChannelRestrictions")
        } else {
            patchLog.warning("$PATCH: no hook sites found. The patch is left out of this build.")
        }
    }
}

private fun Method.hasFreeLocal(): Boolean {
    val code = implementation ?: return false
    val ins = parameters.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return code.registerCount > ins
}
