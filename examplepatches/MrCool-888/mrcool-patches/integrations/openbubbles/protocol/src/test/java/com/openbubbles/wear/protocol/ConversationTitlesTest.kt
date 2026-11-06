package com.openbubbles.wear.protocol

import org.junit.Assert.*
import org.junit.Test

class ConversationTitlesTest {
    @Test fun metadataFallbackCannotReplaceKnownNames() {
        val id = "chat_12345678-1234-5678-9abc-123456789abc"
        for (title in listOf("", "Group", "Conversation", "Unknown", id, id.removePrefix("chat_"),
            "a".repeat(72), "+1 (555) 123-4567", "a@example.com", "a@example.com, +15551234567", "chat125428204935")) {
            assertFalse(title, Protocol.isMeaningfulConversationTitle(title, id, "+15551234567"))
            assertEquals("Alex", Protocol.preferredConversationTitle(title, "Alex", id, "+15551234567"))
        }
    }

    @Test fun humanNamesAndRenamesOverrideOlderTitles() {
        for (title in listOf("Class 2026", "Alex", "Alex, Sam", "Family 😀", "Chatter", "Chat 2026")) {
            assertTrue(title, Protocol.isMeaningfulConversationTitle(title, "chat_id", null))
            assertEquals(title, Protocol.preferredConversationTitle(title, "Old name", "chat_id", null))
        }
    }
}
