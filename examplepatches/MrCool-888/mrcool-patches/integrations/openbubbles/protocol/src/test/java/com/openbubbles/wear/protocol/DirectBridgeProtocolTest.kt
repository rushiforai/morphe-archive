package com.openbubbles.wear.protocol

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class DirectBridgeProtocolTest {
    @Test fun notificationDismissalsValidateAndUseTheirOwnDurablePath() {
        val event = NotificationDismissal(threadId = Protocol.TEST_NOTIFICATION_THREAD_ID, postedAt = 1000)
        assertTrue(event.isValid())
        assertEquals(event, Wire.decode<NotificationDismissal>(Wire.encode(event)))
        assertTrue(Protocol.notificationDismissalDataPath(event.threadId).startsWith(Protocol.DATA_DISMISS_PREFIX))
        assertFalse(event.copy(version = 0).isValid())
        assertFalse(event.copy(postedAt = 0).isValid())
        assertFalse(event.copy(threadId = "unrelated-package").isValid())
        assertTrue(event.copy(threadId = "chat_iMessage;-;person@example.com").isValid())
    }
    @Test fun testNotificationIsAnIsolatedMessageWithoutBackendCapabilities() {
        val thread = Protocol.testNotificationThread(1234)
        assertEquals(Protocol.TEST_NOTIFICATION_THREAD_ID, thread.id)
        assertFalse(Protocol.isChatGuid(thread.id))
        assertTrue(thread.unread)
        assertFalse(thread.canReply || thread.canSend || thread.canMarkRead)
        assertNull(thread.address)
        assertEquals(1234L, thread.messages.single().timestamp)
        assertEquals(thread, Wire.decode<WireThread>(Wire.encode(thread)))
        assertFalse(thread.messages.single().id == Protocol.testNotificationThread(1235).messages.single().id)
    }
    @Test fun artworkSurvivesThreadSummaryAndContactTransportWithOldCacheDefaults() {
        val avatar = "avatar-" + "a".repeat(64)
        val thread = WireThread("chat", "Group", avatarId = avatar)
        assertEquals(avatar, Wire.decode<WireThread>(Wire.encode(thread))!!.avatarId)
        assertEquals(avatar, Wire.decode<ThreadSummary>(Wire.encode(thread.toSummary()))!!.avatarId)
        assertEquals(avatar, Wire.decode<WatchContact>(Wire.encode(WatchContact("contact", "Alex", avatarId = avatar)))!!.avatarId)
        assertNull(Wire.decode<WireThread>("""{"id":"chat","title":"Group"}""")!!.avatarId)
        assertNull(Wire.decode<WatchContact>("""{"id":"contact","name":"Alex"}""")!!.avatarId)
    }
    @Test fun largeDirectoriesFitWearTransportWithoutChangingTheCachedModels() {
        val summaries = List(100) { index -> ThreadSummary("chat-$index", "😀".repeat(160),
            isGroup = index % 2 == 0, lastTimestamp = 100L - index,
            lastPreview = "😀".repeat(800), participants = List(100) { "a".repeat(160) }) }
        val sync = SyncPayload(generatedAt = 1, phoneName = "Phone", bridgeVersion = "2.1.1",
            conversations = summaries)
        assertTrue(Wire.encodeBytes(Wire.syncForTransport(sync)).size <= 90_000)
        val result = GroupsResult(
            version = Protocol.VERSION, requestId = "r",
            groups = summaries.filter { it.isGroup }, chats = summaries.filterNot { it.isGroup })
        val transported = Wire.groupsForTransport(result)
        assertTrue(Wire.encodeBytes(transported).size <= 90_000)
        assertTrue(transported.groups.any { it.id == "chat-0" })
        assertEquals(100, sync.conversations.size)
        assertEquals(1600, summaries.first().lastPreview.length)
    }

    @Test fun directHistoryAndMediaSourceRoundTripWithoutBreakingOlderThreads() {
        val thread = WireThread("chat", "Alex", directHistory = true, messages = listOf(
            WireMessage("real", "chat", "", 1, attachment = true,
                sourceUri = "content://com.openbubbles.messaging.wear.media/guid")))
        val decoded = Wire.decode<WireThread>(Wire.encode(thread))!!
        assertTrue(decoded.directHistory)
        assertEquals(thread.messages.single().sourceUri, decoded.messages.single().sourceUri)
        assertFalse(Wire.decode<WireThread>("""{"id":"chat","title":"Alex"}""")!!.directHistory)
        assertTrue(Protocol.isNotificationMessageId(Protocol.messageId("chat", 1, "Alex", "Hi")))
        assertFalse(Protocol.isNotificationMessageId("backend-guid"))
    }

    @Test fun directoryPreviewSurvivesSerializationAndOlderCachedHistory() {
        val thread = WireThread(id = "chat", title = "Alex", updatedAt = 2000,
            lastPreview = "Latest message", messages = listOf(WireMessage("old", "chat", "Old message", 1000)))
        val decoded = Wire.decode<WireThread>(Wire.encode(thread))!!
        assertEquals(2000L, decoded.toSummary().lastTimestamp)
        assertEquals("Latest message", decoded.toSummary().lastPreview)
        assertEquals("Old message", decoded.copy(updatedAt = 1000).toSummary().lastPreview)
        assertEquals("", Wire.decode<WireThread>("""{"id":"chat","title":"Alex"}""")!!.lastPreview)
    }

    @Test
    fun sendRequestCarriesAddressForANewChat() {
        val request = SendRequest(
            requestId = "request",
            threadId = "new:+15551234567",
            text = "Hello",
            address = "+15551234567"
        )
        val decoded = Wire.decode<SendRequest>(Wire.encode(request))!!
        assertEquals("new:+15551234567", decoded.threadId)
        assertEquals("+15551234567", decoded.address)
    }

    @Test
    fun sendRequestFromAnOlderWatchHasNoAddress() {
        val decoded = Wire.decode<SendRequest>(
            """{"requestId":"r","threadId":"chat_x","text":"Hi"}"""
        )!!
        assertNull(decoded.address)
    }

    @Test
    fun directBridgeIsAnnouncedInSyncAndPong() {
        val sync = SyncPayload(
            generatedAt = 1L,
            phoneName = "Phone",
            bridgeVersion = "2.1.0",
            directBridge = true,
            backendState = "Ready"
        )
        val pong = PongPayload(directBridge = true)
        assertTrue(Wire.decode<SyncPayload>(Wire.encode(sync))!!.directBridge)
        assertTrue(Wire.decode<PongPayload>(Wire.encode(pong))!!.directBridge)
        assertEquals("Ready", Wire.decode<SyncPayload>(Wire.encode(sync))!!.backendState)
        assertFalse(
            SyncPayload(
                generatedAt = 0L,
                phoneName = "Phone",
                bridgeVersion = "2.1.0",
            ).directBridge
        )
    }
}
