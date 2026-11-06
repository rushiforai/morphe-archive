package com.openbubbles.wear.protocol

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class MessageInteractionsTest {
    @Test fun interactionsRoundTripAndLegacyMessageUsesSafeDefaults() {
        val message = WireMessage("m", "t", "Hi", 1, reactions = listOf(
            MessageReaction("love", 2, fromMe = true, partIndex = 3),
            MessageReaction("like", 1)
        ), canReact = true, canReply = true,
            replyTo = MessageReference("root", "Original", "Alex", partIndex = 2), replyCount = 4)
        assertEquals(message, Wire.decode<WireMessage>(Wire.encode(message)))

        val old = Wire.decode<WireMessage>("""{"id":"m","threadId":"t","text":"Hi","timestamp":1}""")!!
        assertTrue(old.reactions.isEmpty())
        assertFalse(old.canReact)
        assertFalse(old.canReply)
        assertEquals(null, old.replyTo)
        assertEquals(0, old.replyCount)
    }

    @Test fun reactionRequestsRoundTripIncludingRemovalAndPartIndex() {
        val request = ReactionRequest(requestId = "r", threadId = "t", messageId = "m",
            reaction = Tapback.QUESTION.type, remove = true, partIndex = 5)
        assertEquals(request, Wire.decode<ReactionRequest>(Wire.encode(request)))
    }

    @Test fun quotedSendRoundTripsRootMessageAndPart() {
        val request = SendRequest(requestId = "r", threadId = "t", text = "Reply",
            replyToMessageId = "root", replyToPartIndex = 3)
        assertEquals(request, Wire.decode<SendRequest>(Wire.encode(request)))
    }
}
