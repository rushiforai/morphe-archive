package com.openbubbles.wear.protocol

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class ProtocolTest {
    @Test
    fun threadDataPathRoundTripsAwkwardIds() {
        val ids = listOf(
            "iMessage;-;alice@example.com",
            "iMessage;+;chat1234567890",
            "com.bluebubbles.new_messages.iMessage;-;+15551234567",
            "group/with spaces & symbols?",
            "emoji-💬-thread"
        )
        ids.forEach { id ->
            val path = Protocol.threadDataPath(id)
            assertTrue(path.startsWith(Protocol.DATA_THREAD_PREFIX))
            assertEquals(id, Protocol.threadIdFromDataPath(path))
        }
    }

    @Test
    fun threadDataPathDoesNotContainSlashInEncodedPart() {
        val path = Protocol.threadDataPath("iMessage;-;alice/example")
        val encoded = path.removePrefix(Protocol.DATA_THREAD_PREFIX)
        assertTrue(encoded.isNotEmpty())
        assertTrue(!encoded.contains('/'))
    }

    @Test
    fun threadIdFromDataPathRejectsOtherPaths() {
        assertNull(Protocol.threadIdFromDataPath("/something/else"))
        assertNull(Protocol.threadIdFromDataPath(Protocol.DATA_THREAD_PREFIX))
    }

    @Test
    fun mediaDataPathRoundTripsAndRejectsOtherPaths() {
        val mediaId = Protocol.mediaId("m-1", "image/gif")
        val path = Protocol.mediaDataPath(mediaId)
        assertTrue(path.startsWith(Protocol.DATA_MEDIA_PREFIX))
        assertEquals(mediaId, Protocol.mediaIdFromDataPath(path))
        assertNull(Protocol.mediaIdFromDataPath("/something/else"))
        assertNull(Protocol.mediaIdFromDataPath(Protocol.DATA_MEDIA_PREFIX))
        assertNull(Protocol.mediaIdFromDataPath(Protocol.DATA_MEDIA_PREFIX + "a/b"))
    }

    @Test
    fun mediaIdsAreStableAndNormalizeCommonMimeAliases() {
        val a = Protocol.mediaId("m-1", "image/jpeg")
        val b = Protocol.mediaId("m-1", "image/jpg")
        val c = Protocol.mediaId("m-1", "image/gif")
        val d = Protocol.mediaId("m-2", "image/jpeg")
        assertEquals(a, b)
        assertTrue(a != c)
        assertTrue(a != d)
        assertEquals("image/jpeg", Protocol.normalizeMimeType(" IMAGE/JPG; charset=binary "))
        assertTrue(Protocol.isImageMimeType("image/webp"))
        assertTrue(!Protocol.isImageMimeType("video/mp4"))
    }

    @Test
    fun mediaPayloadsRoundTrip() {
        val request = MediaRequest(requestId = "r1", mediaId = "media-abc", sentAt = 7L)
        assertEquals(request, Wire.decode<MediaRequest>(Wire.encode(request)))

        val payload = MediaPayload(
            requestId = "r1",
            mediaId = "media-abc",
            ok = true,
            mimeType = "image/gif",
            width = 320,
            height = 240,
            size = 12_345L
        )
        assertEquals(payload, Wire.decode<MediaPayload>(Wire.encode(payload)))
    }

    @Test
    fun mediaFieldsSurviveWireRoundTripAndPreview() {
        val message = WireMessage(
            id = "m1",
            threadId = "t",
            text = "",
            timestamp = 1L,
            attachment = true,
            mediaId = "media-abc",
            mediaMime = "image/gif",
            mediaWidth = 320,
            mediaHeight = 200,
            mediaSize = 2_000L
        )
        assertEquals(message, Wire.decode<WireMessage>(Wire.encode(message)))
        assertEquals("GIF", message.displayText)

        val caption = message.copy(text = "Look at this", mediaMime = "image/jpeg")
        assertEquals("Look at this", caption.displayText)
    }

    @Test
    fun mergeMediaFromPreservesKnownAttachmentMetadata() {
        val previous = WireMessage(
            id = "m1",
            threadId = "t",
            text = "Look",
            timestamp = 1L,
            attachment = true,
            mediaId = "media-abc",
            mediaMime = "image/jpeg",
            mediaWidth = 800,
            mediaHeight = 600,
            mediaSize = 50_000L
        )
        val refresh = WireMessage(
            id = "m1",
            threadId = "t",
            text = "Look",
            timestamp = 1L
        )
        val merged = refresh.mergeMediaFrom(previous)
        assertTrue(merged.attachment)
        assertEquals("media-abc", merged.mediaId)
        assertEquals("image/jpeg", merged.mediaMime)
        assertEquals(800, merged.mediaWidth)
        assertEquals(600, merged.mediaHeight)
        assertEquals(50_000L, merged.mediaSize)

        val alreadyKnown = previous.mergeMediaFrom(
            previous.copy(mediaId = null, attachment = false)
        )
        assertEquals(previous, alreadyKnown)
    }

    @Test
    fun syncPayloadRoundTrips() {
        val thread = WireThread(
            id = "thread-1",
            title = "Alice",
            messages = listOf(
                WireMessage(
                    id = "m1",
                    threadId = "thread-1",
                    text = "Hello",
                    timestamp = 1234L,
                    sender = "Alice"
                ),
                WireMessage(
                    id = "m2",
                    threadId = "thread-1",
                    text = "Hi!",
                    timestamp = 1235L,
                    fromMe = true,
                    status = "sent"
                )
            ),
            unread = true,
            canReply = true,
            canMarkRead = true,
            updatedAt = 1235L
        )
        val payload = SyncPayload(
            generatedAt = 999L,
            phoneName = "Pixel",
            bridgeVersion = "0.1.0",
            conversations = listOf(thread.toSummary())
        )

        val decoded = Wire.decode<SyncPayload>(Wire.encode(payload))
        assertNotNull(decoded)
        assertEquals(payload, decoded)
        assertEquals("Hi!", decoded!!.conversations.single().lastPreview)
    }

    @Test
    fun updatePayloadRoundTripsAndIgnoresUnknownFields() {
        val thread = WireThread(
            id = "t",
            title = "Bob",
            messages = listOf(
                WireMessage("m", "t", "Yo", 42L, sender = "Bob")
            ),
            unread = true,
            canReply = true,
            canMarkRead = true,
            updatedAt = 42L
        )
        val payload = UpdatePayload(thread = thread, alertMessageId = "backend-7", hideAlertPreview = true)
        val json = Wire.encode(payload)
            .dropLast(1) + ",\"futureField\":\"ignored\"}"
        val decoded = Wire.decode<UpdatePayload>(json)
        assertEquals(thread, decoded?.thread)
        assertEquals("backend-7", decoded?.alertMessageId)
        assertTrue(decoded?.hideAlertPreview == true)
    }

    @Test
    fun messageIdsAreStableAndSensitiveToContent() {
        val a = Protocol.messageId("t", 100L, "Alice", "Hello")
        val b = Protocol.messageId("t", 100L, "Alice", "Hello")
        val c = Protocol.messageId("t", 100L, "Alice", "Hello!")
        assertEquals(a, b)
        assertTrue(a != c)
    }

    @Test
    fun summaryDerivesLatestMessageAndPreview() {
        val thread = WireThread(
            id = "t",
            title = "Group",
            isGroup = true,
            messages = listOf(
                WireMessage("a", "t", "older", 10L, sender = "A"),
                WireMessage("b", "t", "", 20L, sender = "B", attachment = true)
            ),
            updatedAt = 5L
        )
        val summary = thread.toSummary()
        assertEquals(20L, summary.lastTimestamp)
        assertEquals("Photo", summary.lastPreview)
        assertEquals(2, summary.messageCount)
    }

    @Test
    fun addressNormalizationMatchesNotificationsAndTypedAddresses() {
        assertEquals("+15551234567", Protocol.normalizeAddress("tel:+1 (555) 123-4567"))
        assertEquals("+15551234567", Protocol.normalizeAddress("iMessage;-;+1 (555) 123-4567"))
        assertEquals("alice@example.com", Protocol.normalizeAddress("mailto:Alice@Example.com"))
        assertEquals("alice@example.com", Protocol.normalizeAddress(" ALICE@EXAMPLE.COM "))
        assertNull(Protocol.normalizeAddress(""))
        assertNull(Protocol.normalizeAddress("not-an-address"))
    }

    @Test
    fun sendPayloadRoundTrips() {
        val send = SendRequest(
            requestId = "r1",
            threadId = "iMessage;-;alice@example.com",
            text = "Hello",
            sentAt = 5L
        )
        assertEquals(send, Wire.decode<SendRequest>(Wire.encode(send)))
    }

    @Test
    fun optionalLockAndRetryFieldsRoundTripAndOlderPayloadsStillDecode() {
        val sync = SyncPayload(
            generatedAt = 1L,
            phoneName = "Pixel",
            bridgeVersion = "1.6.0",
            phoneLocked = true,
            phoneAwake = false
        )
        val decoded = Wire.decode<SyncPayload>(Wire.encode(sync))!!
        assertTrue(decoded.phoneLocked)
        assertFalse(decoded.phoneAwake)

        val oldSync = Wire.decode<SyncPayload>(
            """{"generatedAt":1,"phoneName":"Pixel","bridgeVersion":"1.5.0","futureField":true}"""
        )!!
        assertFalse(oldSync.phoneLocked)
        assertTrue(oldSync.phoneAwake)

        val result = ActionResult(
            requestId = "r",
            action = Protocol.ACTION_SEND,
            ok = false,
            error = "locked",
            retryable = true
        )
        assertTrue(Wire.decode<ActionResult>(Wire.encode(result))!!.retryable)
    }

    @Test
    fun transportTrimmingKeepsNewestMessages() {
        val messages = (1..40).map { index ->
            WireMessage(
                id = "m$index",
                threadId = "t",
                text = "x".repeat(400) + index,
                timestamp = index.toLong()
            )
        }
        val thread = WireThread(id = "t", title = "Alice", messages = messages, updatedAt = 40L)
        val trimmed = Wire.threadForTransport(thread, maxBytes = 6_000)
        assertTrue(trimmed.messages.size < messages.size)
        assertTrue(trimmed.messages.isNotEmpty())
        assertEquals(messages.last().id, trimmed.messages.last().id)
        assertTrue(Wire.encode(trimmed).toByteArray().size <= 6_000)
    }

    @Test
    fun summaryCarriesAddressAndReplyCapability() {
        val thread = WireThread(
            id = "t",
            title = "Alice",
            address = "alice@example.com",
            canReply = true,
            canSend = true
        )
        val summary = thread.toSummary()
        assertEquals("alice@example.com", summary.address)
        assertTrue(summary.canReply)
        assertTrue(summary.canSend)
    }

    @Test
    fun backendStateRoundTripsAndDefaultsForOlderPayloads() {
        val sync = SyncPayload(generatedAt = 10L, phoneName = "Phone", bridgeVersion = "test",
            backendState = "Wear patch disabled")
        val pong = PongPayload(backendState = "Waiting for backend")
        assertEquals("Wear patch disabled", Wire.decode<SyncPayload>(Wire.encode(sync))?.backendState)
        assertEquals("Waiting for backend", Wire.decode<PongPayload>(Wire.encode(pong))?.backendState)
        assertEquals("", Wire.decode<SyncPayload>("""{"generatedAt":1,"phoneName":"p","bridgeVersion":"b"}""")?.backendState)
    }

    @Test
    fun defaultQuickRepliesAreNotSerializedAway() {
        val pong = PongPayload()
        val decoded = Wire.decode<PongPayload>(Wire.encode(pong))
        assertEquals(Protocol.DEFAULT_QUICK_REPLIES, decoded?.quickReplies)
    }
}
