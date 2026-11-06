package com.openbubbles.wear.bridge

import android.app.Application
import android.content.Context
import com.openbubbles.wear.protocol.Protocol
import com.openbubbles.wear.protocol.WireMessage
import com.openbubbles.wear.protocol.WireThread
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [32], application = Application::class)
class DirectHistoryTest {
    private lateinit var store: BridgeStore
    private val id = "chat_iMessage;-;+15551234567"
    private fun message(guid: String, text: String = "Hello", time: Long = 1000) =
        WireMessage(guid, id, text, time)

    @Before fun reset() {
        val context = RuntimeEnvironment.getApplication()
        context.getSharedPreferences("openbubbles_wear_store", Context.MODE_PRIVATE).edit().clear().commit()
        store = BridgeStore(context)
    }

    @Test fun backendSnapshotReplacesNotificationHashesWithoutCollapsingRepeatedMessages() {
        val derived = Protocol.messageId(id, 1000, "Alex", "Hello")
        store.upsertIncoming(WireThread(id, "Alex", messages = listOf(message(derived))))
        val actual = listOf(message("guid-1"), message("guid-2"))
        val result = store.upsertIncoming(WireThread(id, "Alex", messages = actual, directHistory = true))
        assertEquals(actual, result.messages)
        assertTrue(result.directHistory)
    }

    @Test fun snapshotRemovesDeletedAndEditedMessagesInItsWindowButKeepsOlderBackendHistory() {
        store.upsertIncoming(WireThread(id, "Alex", directHistory = true, messages = listOf(
            message("older", time = 1), message("edit", "Old text"), message("deleted", time = 1001))))
        val result = store.upsertIncoming(WireThread(id, "Alex", directHistory = true,
            messages = listOf(message("edit", "Corrected text"))))
        assertEquals(listOf("older", "edit"), result.messages.map { it.id })
        assertEquals("Corrected text", result.messages.last().text)
    }

    @Test fun uniqueDirectMessageKeepsPreviouslyCachedNotificationPhoto() {
        val photo = message(Protocol.messageId(id, 1000, "Alex", "Hello"))
            .copy(attachment = true, mediaId = "cached", mediaMime = "image/jpeg")
        store.upsertIncoming(WireThread(id, "Alex", messages = listOf(photo)))
        val result = store.upsertIncoming(WireThread(id, "Alex", messages = listOf(message("real")), directHistory = true))
        assertEquals("cached", result.messages.single().mediaId)
    }

    @Test fun ambiguousOrGroupPhotosAreNeverAssignedToAnotherSender() {
        for (group in listOf(false, true)) {
            store.clear()
            val photo = message(Protocol.messageId(id, 1000, "Alex", "Hello"))
                .copy(attachment = true, mediaId = "cached")
            store.upsertIncoming(WireThread(id, "Chat", isGroup = group, messages = listOf(photo)))
            val messages = if (group) listOf(message("real")) else listOf(message("real-1"), message("real-2"))
            val result = store.upsertIncoming(WireThread(id, "Chat", isGroup = group, messages = messages, directHistory = true))
            assertTrue(result.messages.all { it.mediaId == null })
        }
    }

    @Test fun directoryMetadataDoesNotTurnLoadedBackendHistoryIntoNotificationHistory() {
        store.upsertIncoming(WireThread(id, "Alex", messages = listOf(message("real")), directHistory = true))
        val result = store.upsertIncoming(WireThread(id, "Alex", lastPreview = "Latest", updatedAt = 2000))
        assertTrue(result.directHistory)
        assertEquals("real", result.messages.single().id)
    }
}
