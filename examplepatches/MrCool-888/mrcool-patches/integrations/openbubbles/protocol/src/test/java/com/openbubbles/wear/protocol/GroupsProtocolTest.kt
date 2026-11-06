package com.openbubbles.wear.protocol

import org.junit.Assert.*
import org.junit.Test

class GroupsProtocolTest {
    @Test fun nativeConversationIdsCannotBecomeRecipientAddresses() {
        for (id in listOf("550e8400-e29b-41d4-a716-446655440000", "abcdef01".repeat(8), "1".repeat(64),
            "abcdef01".repeat(9), "1".repeat(72))) {
            assertNull(Protocol.normalizeAddress(id))
            assertNull(Protocol.normalizeAddress("chat_$id"))
            assertNull(Protocol.normalizeAddress("tel:$id"))
        }
    }
    @Test fun acceptsNativeUuidAndLegacyConversationIdsWithoutGuessingGroups() {
        val uuid = "550e8400-e29b-41d4-a716-446655440000"
        assertTrue(Protocol.isChatGuid(uuid))
        assertTrue(Protocol.isChatGuid("chat_${uuid.uppercase()}"))
        assertTrue(Protocol.isChatGuid("chat_iMessage;+;chat123"))
        assertTrue(Protocol.isChatGuid("SMS;-;+15551234567"))
        assertFalse(Protocol.isGroupGuid(uuid))
        assertFalse(Protocol.isGroupGuid("chat_$uuid"))
        assertTrue(Protocol.isGroupGuid("chat_iMessage;+;chat123"))
    }

    @Test fun rejectsMalformedNativeAndInjectedLegacyConversationIds() {
        assertFalse(Protocol.isChatGuid("550e8400-e29b-41d4-a716-44665544000"))
        assertFalse(Protocol.isChatGuid("550e8400-e29b-41d4-a716-446655440000+550e8400-e29b-41d4-a716-446655440000"))
        assertFalse(Protocol.isChatGuid("550e8400-e29b-41d4-a716-446655440000 "))
        assertFalse(Protocol.isChatGuid("iMessage;+;chat123;SMS;-;12345"))
        assertFalse(Protocol.isChatGuid("iMessage;+;https://example.com"))
        assertFalse(Protocol.isChatGuid("iMessage;+;bad\nvalue"))
    }

    @Test fun acceptsOnlyExactNativeHexChatIdsWithoutInferringGroups() {
        for (lower in listOf("abcdef01".repeat(8), "1".repeat(64), "abcdef01".repeat(9))) {
            assertTrue(Protocol.isChatGuid(lower))
            assertTrue(Protocol.isChatGuid("chat_${lower.uppercase()}"))
            assertFalse(Protocol.isGroupGuid(lower))
            assertFalse(Protocol.isGroupGuid("chat_$lower"))
            assertFalse(Protocol.isChatGuid(lower.dropLast(1)))
            assertFalse(Protocol.isChatGuid("${lower}0"))
            assertFalse(Protocol.isChatGuid(lower.dropLast(1) + "g"))
            assertFalse(Protocol.isChatGuid("${lower.dropLast(1)}\n"))
            assertFalse(Protocol.isChatGuid("https://example.com/$lower"))
        }
    }

    @Test fun groupGuidValidationDoesNotInferGroupsFromNames() {
        assertTrue(Protocol.isGroupGuid("iMessage;+;chat123"))
        assertTrue(Protocol.isGroupGuid("SMS;+;1234"))
        assertTrue(Protocol.isGroupGuid("RCS;+;1234"))
        assertFalse(Protocol.isGroupGuid("iMessage;-;alex@example.com"))
        assertFalse(Protocol.isGroupGuid("Family group"))
        assertFalse(Protocol.isGroupGuid("iMessage;+;bad\nvalue"))
        assertFalse(Protocol.isChatGuid("iMessage;+;"))
    }
    @Test fun discoveryRequestAndResultRoundTrip() {
        val request = GroupsRequest(requestId = "r", offset = 40)
        assertEquals(request, Wire.decodeBytes<GroupsRequest>(Wire.encodeBytes(request)))
        assertEquals(0, Wire.decode<GroupsRequest>("{\"requestId\":\"legacy\"}")!!.offset)
        val result = GroupsResult(requestId = "r", offset = 40, nextOffset = 80,
            groups = listOf(WireThread(id = "iMessage;+;chat1", title = "Family", isGroup = true).toSummary()), note = "Page")
        assertEquals(result, Wire.decodeBytes<GroupsResult>(Wire.encodeBytes(result)))
        assertNull(Wire.decode<GroupsResult>("{\"requestId\":\"legacy\"}")!!.nextOffset)
    }

    @Test fun wireSizeTrimReturnsTheFirstUnsentOffset() {
        val summaries = List(100) { index ->
            WireThread(id = "chat-$index", title = "Person $index", lastPreview = "p".repeat(160),
                participants = List(12) { "p".repeat(80) }, updatedAt = 10_000L - index).toSummary()
        }
        val page = Wire.groupsForTransport(GroupsResult(requestId = "r", offset = 40, nextOffset = 140, chats = summaries))
        assertTrue(page.chats.isNotEmpty())
        assertTrue(page.chats.size < summaries.size)
        assertEquals(40 + page.chats.size, page.nextOffset)
        assertEquals(summaries.take(page.chats.size).map { it.id }, page.chats.map { it.id })
    }

    @Test fun legacyDirectoryPagingAdvancesAndStopsAtTheEnd() {
        val all = List(95) { index -> WireThread(id = "chat-$index", title = "Chat $index", updatedAt = 95L - index).toSummary() }
        val source = GroupsResult(requestId = "r", chats = all)
        val first = Wire.groupsPage(source, 0, 40)
        val second = Wire.groupsPage(source, first.nextOffset!!, 40)
        val last = Wire.groupsPage(source, second.nextOffset!!, 40)
        assertEquals(40, first.chats.size)
        assertEquals(40, second.chats.size)
        assertEquals(15, last.chats.size)
        assertNull(last.nextOffset)
        assertEquals(all.map { it.id }, (first.chats + second.chats + last.chats).map { it.id })
    }
    @Test fun sendRequestRequiresThreadAndRoundTrips() {
        val request = SendRequest(requestId = "r", threadId = "iMessage;+;chat1", text = "Hi")
        assertEquals(request, Wire.decodeBytes<SendRequest>(Wire.encodeBytes(request)))
        assertNull(Wire.decode<SendRequest>("{\"requestId\":\"old\",\"text\":\"Hi\"}"))
    }
}
