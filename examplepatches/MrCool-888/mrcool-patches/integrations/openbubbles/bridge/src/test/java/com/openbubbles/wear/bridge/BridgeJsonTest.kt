package com.openbubbles.wear.bridge

import org.json.JSONObject
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [32])
class BridgeJsonTest {
    @Test fun ownAndIncomingMessagesPreserveReactionsAndReplyContext() {
        for (fromMe in listOf(false, true)) {
            val json = JSONObject("""{"id":"reply","text":"Answer","timestamp":1,"fromMe":$fromMe,
                "canReply":true,"canReact":true,"replyCount":3,
                "replyTo":{"messageId":"original","text":"Question","sender":"Alex","partIndex":1},
                "reactions":[{"type":"love","count":2,"fromMe":true,"partIndex":1},
                {"type":"like","count":0}]}""")
            val message = BridgeJson.message(json, "chat")!!
            assertTrue(message.canReply && message.canReact)
            assertEquals(3, message.replyCount)
            assertEquals("original", message.replyTo!!.messageId)
            assertEquals(1, message.replyTo!!.partIndex)
            assertEquals(2, message.reactions.single().count)
            assertTrue(message.reactions.single().fromMe)
            assertEquals(fromMe, message.fromMe)
        }
    }

    @Test fun artworkUsesOnlyValidatedContentAddressedIds() {
        val id = "avatar-" + "a".repeat(64)
        val json = JSONObject().put("id", "group").put("avatarId", id)
        assertEquals(id, BridgeJson.thread(json)!!.avatarId)
        assertEquals(id, BridgeJson.summary(json)!!.avatarId)
        assertEquals(id, BridgeJson.thread(json)!!.toSummary().avatarId)
        for (invalid in listOf("../private", "avatar-short", "avatar-" + "g".repeat(64))) {
            json.put("avatarId", invalid)
            assertNull(BridgeJson.thread(json)!!.avatarId)
        }
    }
    @Test fun canonicalBackendChatCanBeOpenedInOpenBubbles() {
        val launcher = android.content.Intent().setClassName("com.openbubbles.messaging", "com.localob.messaging.app.MainActivity")
        val intent = ConversationLaunch.existingGuid(launcher, "chat_iMessage;+;chat123")
        assertEquals("iMessage;+;chat123", intent.getStringExtra("chatGuid"))
    }

    @Test fun directMediaOnlyAcceptsTheAuthenticatedReadOnlyProvider() {
        val valid = "content://com.openbubbles.messaging.wear.media/attachment/attachment-guid"
        val message = BridgeJson.message(JSONObject().put("id", "message-guid").put("attachment", true)
            .put("mediaUri", valid).put("mediaMime", "image/gif"), "chat")!!
        assertEquals(valid, message.sourceUri)
        assertTrue(message.mediaId!!.startsWith("media-"))
        for (uri in listOf("file:///data/data/private", "content://contacts/one", "$valid/extra", "$valid?path=secret")) {
            assertNull(BridgeJson.mediaUri(uri))
        }
    }

    @Test
    fun threadUsesNotificationShortcutIdAndRealHistory() {
        val json = JSONObject(
            """
            {
              "id": "iMessage;-;+15551234567",
              "title": "Alex",
              "isGroup": false,
              "address": "+1 (555) 123-4567",
              "participants": ["+15551234567"],
              "unread": true,
              "messages": [
                {"id": "m1", "text": "Hi", "timestamp": 1000, "fromMe": false, "sender": "Alex"},
                {"id": "m2", "text": "Hello", "timestamp": 2000, "fromMe": true}
              ]
            }
            """.trimIndent()
        )
        val thread = BridgeJson.thread(json)!!
        assertEquals("chat_iMessage;-;+15551234567", thread.id)
        assertEquals("+15551234567", thread.address)
        assertEquals(listOf("m1", "m2"), thread.messages.map { it.id })
        assertEquals("chat_iMessage;-;+15551234567", thread.messages[0].threadId)
        assertTrue(thread.unread)
        assertTrue(thread.canSend)
        assertEquals(2000L, thread.updatedAt)
    }

    @Test
    fun outgoingHistoryPreservesBackendDeliveryStatus() {
        for (status in listOf("sending", "sent", "delivered", "read", "failed")) {
            val json = JSONObject().put("id", "iMessage;+;group")
                .put("messages", org.json.JSONArray().put(JSONObject()
                    .put("id", "failed-group-message").put("text", "Group message")
                    .put("timestamp", 1000L).put("fromMe", true).put("status", status)))
            val message = BridgeJson.thread(json)!!.messages.single()
            assertEquals("Group message", message.text)
            assertEquals(status, message.status)
        }
    }

    @Test
    fun incomingAndUnknownDeliveryStatusesAreIgnored() {
        val json = JSONObject().put("text", "Message").put("status", "failed")
        assertNull(BridgeJson.message(json, "chat")!!.status)
        json.put("fromMe", true).put("status", "unexpected")
        assertNull(BridgeJson.message(json, "chat")!!.status)
        json.remove("status")
        assertNull(BridgeJson.message(json, "chat")!!.status)
    }

    @Test
    fun summaryKeepsPreviewAndCanonicalId() {
        val summary = BridgeJson.summary(
            JSONObject(
                """
                {"id": "chat_SMS;-;a@example.com", "title": "Ann", "isGroup": false,
                 "address": "a@example.com", "lastTimestamp": 9000, "lastPreview": "See you"}
                """.trimIndent()
            )
        )!!
        assertEquals("chat_SMS;-;a@example.com", summary.id)
        assertEquals(9000L, summary.lastTimestamp)
        assertEquals("See you", summary.lastPreview)
        assertTrue(summary.canReply)
    }

    @Test
    fun blankAttachmentlessMessageIsDropped() {
        assertNull(BridgeJson.message(JSONObject("""{"text": ""}"""), "chat_x"))
    }

    @Test
    fun idMustBePresent() {
        assertNull(BridgeJson.thread(JSONObject("""{"title": "No id"}""")))
        assertNull(BridgeJson.thread(JSONObject("""{"id": ""}""")))
    }
}
