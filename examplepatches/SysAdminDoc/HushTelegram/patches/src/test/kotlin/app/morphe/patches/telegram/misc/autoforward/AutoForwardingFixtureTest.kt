/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.autoforward

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.messagemenu.FORWARD_SEND
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

private const val NOTIFICATIONS_CONTROLLER = "Lorg/telegram/messenger/NotificationsController;"

class AutoForwardingFixtureTest {
    private val hosts = setOf(
        NOTIFICATIONS_CONTROLLER, "Lorg/telegram/messenger/MessageObject;", "Lorg/telegram/tgnet/TLRPC\$Message;",
        "Lorg/telegram/tgnet/TLRPC\$MessageAction;", "Lorg/telegram/tgnet/TLRPC\$TL_messageActionEmpty;",
        "Lorg/telegram/messenger/UserConfig;", "Lorg/telegram/messenger/MessagesController;", "Lorg/telegram/tgnet/TLRPC\$Dialog;",
        "Lorg/telegram/messenger/DialogObject;", "Lorg/telegram/messenger/SendMessagesHelper;",
        "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;", "Lorg/telegram/tgnet/TLRPC\$Peer;", "Lorg/telegram/tgnet/TLRPC\$Chat;",
        "Lorg/telegram/messenger/ChatObject;", "Lorg/telegram/messenger/UserObject;", "Lorg/telegram/tgnet/TLRPC\$User;",
        "Lorg/telegram/tgnet/TLRPC\$MessageMedia;", "Lorg/telegram/tgnet/TLRPC\$Photo;", "Lorg/telegram/tgnet/TLRPC\$Document;",
        "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPoll;", "Lorg/telegram/tgnet/TLRPC\$Poll;", "Lorg/telegram/tgnet/TLRPC\$GeoPoint;",
        "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaDice;", "Lorg/telegram/tgnet/TLRPC\$TL_game;",
        "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaGiveaway;", "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaGiveawayResults;",
        "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaToDo;", "Lorg/telegram/tgnet/TLRPC\$TodoList;",
        "Lorg/telegram/tgnet/TLRPC\$TL_textWithEntities;",
    )

    @Test
    fun `processNewMessages hands its messages and push flag to the rules in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, hosts).values)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { autoForwardingPatch.execute(context) })

            val method = context.tgMutableClassDefBy(NOTIFICATIONS_CONTROLLER).methods.single { m ->
                m.origName == "processNewMessages" && m.origDescriptor == "(Ljava/util/ArrayList;ZZLjava/util/concurrent/CountDownLatch;)V" &&
                    !AccessFlags.STATIC.isSet(m.accessFlags)
            }
            val p0 = method.implementation!!.registerCount - 5
            val body = method.controlBody()
            assertEquals("$name: the messages, p1", listOf(Opcode.MOVE_OBJECT_FROM16, 0, p0 + 1),
                listOf(body[0].opcode, (body[0] as TwoRegisterInstruction).registerA, (body[0] as TwoRegisterInstruction).registerB))
            assertEquals("$name: isFcm, p3", listOf(Opcode.MOVE_FROM16, 1, p0 + 3),
                listOf(body[1].opcode, (body[1] as TwoRegisterInstruction).registerA, (body[1] as TwoRegisterInstruction).registerB))
            assertEquals(Opcode.INVOKE_STATIC, body[2].opcode)
            assertEquals("$name: the rules' hook", ON_NEW_MESSAGES, body[2].controlRef())
            assertEquals(listOf(0, 1), body[2].namedRegisters())

            fun stub(n: String) = context.tgMutableClassDefBy(AUTO_FORWARDING).methods.single { it.origName == n }.controlBody()
            val refs = { n: String -> stub(n).mapNotNull { it.controlRef() } }
            assertTrue("$name: account", "Lorg/telegram/messenger/MessageObject;->currentAccount:I" in refs("account"))
            assertTrue("$name: dialog", "Lorg/telegram/messenger/MessageObject;->getDialogId()J" in refs("dialog"))
            assertTrue("$name: out", "Lorg/telegram/messenger/MessageObject;->isOut()Z" in refs("out"))
            assertTrue("$name: forwarded", "Lorg/telegram/messenger/MessageObject;->isForwarded()Z" in refs("forwarded"))
            assertTrue("$name: service", "Lorg/telegram/tgnet/TLRPC\$TL_messageActionEmpty;" in refs("service"))
            assertTrue("$name: media", "Lorg/telegram/messenger/MessageObject;->isMediaEmpty()Z" in refs("media"))
            assertTrue("$name: chats", "Lorg/telegram/messenger/MessagesController;->getDialogs(I)Ljava/util/ArrayList;" in refs("dialogs"))
            assertTrue("$name: secret", "Lorg/telegram/messenger/DialogObject;->isEncryptedDialog(J)Z" in refs("secret"))
            assertTrue("$name: sender", "Lorg/telegram/messenger/MessageObject;->getFromChatId()J" in refs("sender"))
            assertTrue("$name: origin", refs("origin").containsAll(listOf(
                "Lorg/telegram/tgnet/TLRPC\$Message;->fwd_from:Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;",
                "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;->from_id:Lorg/telegram/tgnet/TLRPC\$Peer;",
                "Lorg/telegram/messenger/MessageObject;->getPeerId(Lorg/telegram/tgnet/TLRPC\$Peer;)J")))
            assertTrue("$name: folder", "Lorg/telegram/messenger/DialogObject;->isFolderDialogId(J)Z" in refs("folder"))
            assertTrue("$name: date", "Lorg/telegram/tgnet/TLRPC\$Message;->date:I" in refs("date"))
            assertTrue("$name: originDate", refs("originDate").containsAll(listOf(
                "Lorg/telegram/tgnet/TLRPC\$Message;->fwd_from:Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;",
                "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;->date:I")))
            assertTrue("$name: originName", refs("originName").containsAll(listOf(
                "Lorg/telegram/tgnet/TLRPC\$Message;->fwd_from:Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;",
                "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;->from_name:Ljava/lang/String;")))
            assertTrue("$name: text", "Lorg/telegram/tgnet/TLRPC\$Message;->message:Ljava/lang/String;" in refs("text"))
            assertTrue("$name: mediaId", refs("mediaId").containsAll(listOf(
                "Lorg/telegram/tgnet/TLRPC\$Message;->media:Lorg/telegram/tgnet/TLRPC\$MessageMedia;",
                "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->photo:Lorg/telegram/tgnet/TLRPC\$Photo;",
                "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->document:Lorg/telegram/tgnet/TLRPC\$Document;",
                "Lorg/telegram/tgnet/TLRPC\$Photo;->id:J",
                "Lorg/telegram/tgnet/TLRPC\$Document;->id:J")))
            assertTrue("$name: pollId", refs("pollId").containsAll(listOf(
                "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPoll;->poll:Lorg/telegram/tgnet/TLRPC\$Poll;",
                "Lorg/telegram/tgnet/TLRPC\$Poll;->id:J")))
            for ((stub, field) in listOf("latitude" to "lat", "longitude" to "_long")) {
                assertTrue("$name: $stub", refs(stub).containsAll(listOf(
                    "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->geo:Lorg/telegram/tgnet/TLRPC\$GeoPoint;",
                    "Lorg/telegram/tgnet/TLRPC\$GeoPoint;->$field:D")))
            }
            assertTrue("$name: phone", "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->phone_number:Ljava/lang/String;" in refs("phone"))
            assertTrue("$name: emoticon",
                "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaDice;->emoticon:Ljava/lang/String;" in refs("emoticon"))
            assertTrue("$name: diceValue", "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaDice;->value:I" in refs("diceValue"))
            assertTrue("$name: storyId", "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->id:I" in refs("storyId"))
            assertTrue("$name: storyPeer", refs("storyPeer").containsAll(listOf(
                "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->peer:Lorg/telegram/tgnet/TLRPC\$Peer;",
                "Lorg/telegram/messenger/MessageObject;->getPeerId(Lorg/telegram/tgnet/TLRPC\$Peer;)J",
                "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->user_id:J")))
            assertTrue("$name: gameId", refs("gameId").containsAll(listOf(
                "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->game:Lorg/telegram/tgnet/TLRPC\$TL_game;",
                "Lorg/telegram/tgnet/TLRPC\$TL_game;->id:J")))
            for ((stub, fields) in listOf("giveawayEnd" to ("until_date:I" to "until_date:I"),
                    "giveawayCount" to ("quantity:I" to "winners_count:I"), "giveawayMonths" to ("months:I" to "months:I"),
                    "giveawayStars" to ("stars:J" to "stars:J"))) {
                assertTrue("$name: $stub", refs(stub).containsAll(listOf(
                    "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaGiveaway;->${fields.first}",
                    "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaGiveawayResults;->${fields.second}")))
            }
            assertTrue("$name: checklist", refs("checklist").containsAll(listOf(
                "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaToDo;->todo:Lorg/telegram/tgnet/TLRPC\$TodoList;",
                "Lorg/telegram/tgnet/TLRPC\$TodoList;->title:Lorg/telegram/tgnet/TLRPC\$TL_textWithEntities;",
                "Lorg/telegram/tgnet/TLRPC\$TL_textWithEntities;->text:Ljava/lang/String;")))
            assertTrue("$name: title", "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->title:Ljava/lang/String;" in refs("title"))
            assertTrue("$name: amount", "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->total_amount:J" in refs("amount"))
            assertTrue("$name: currency", "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->currency:Ljava/lang/String;" in refs("currency"))
            assertTrue("$name: canPost", refs("canPost").containsAll(listOf(
                "Lorg/telegram/messenger/MessagesController;->getChat(Ljava/lang/Long;)Lorg/telegram/tgnet/TLRPC\$Chat;",
                "Lorg/telegram/messenger/ChatObject;->isNotInChat(Lorg/telegram/tgnet/TLRPC\$Chat;)Z",
                "Lorg/telegram/messenger/ChatObject;->isMonoForum(Lorg/telegram/tgnet/TLRPC\$Chat;)Z",
                "Lorg/telegram/messenger/ChatObject;->canSendMessages(Lorg/telegram/tgnet/TLRPC\$Chat;)Z",
                "Lorg/telegram/messenger/UserObject;->isReplyUser(J)Z",
                "Lorg/telegram/messenger/UserObject;->isService(J)Z",
                "Lorg/telegram/messenger/MessagesController;->getUser(Ljava/lang/Long;)Lorg/telegram/tgnet/TLRPC\$User;",
                "Lorg/telegram/messenger/UserObject;->isDeleted(Lorg/telegram/tgnet/TLRPC\$User;)Z")))

            // Telegram's own forward, with the sender shown, captions kept and notifying.
            val forward = stub("forward")
            val send = forward.single { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
            assertEquals("$name: the send Forward makes", FORWARD_SEND, send.controlRef())
            assertEquals((0..15).toList(), send.namedRegisters())
            assertEquals("$name: sender shown, caption kept, notify on, no schedule, repeat, topic, video start, stars or monoforum",
                listOf(0L, 0L, 1L, 0L, 0L, 0L, -1L, 0L, 0L, 0L),
                forward.filter { it.opcode == Opcode.CONST_4 || it.opcode == Opcode.CONST_WIDE_16 }.map { (it as WideLiteralInstruction).wideLiteral })
            assertEquals("$name: answers what Telegram said", Opcode.RETURN, forward.last().opcode)
            assertEquals(0, (forward.last() as OneRegisterInstruction).registerA)

            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.origName == "autoForwarding" }
                .implementation!!.instructions.toList()
            assertEquals("$name: status flag set", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }
}
