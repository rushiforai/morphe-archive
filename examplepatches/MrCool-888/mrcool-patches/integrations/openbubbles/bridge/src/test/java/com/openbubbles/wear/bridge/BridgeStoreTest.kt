package com.openbubbles.wear.bridge

import android.app.Application
import android.content.ComponentName
import android.content.Context
import android.content.Intent
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
class BridgeStoreTest {
    private lateinit var context: Context

    @Before fun reset() {
        context = RuntimeEnvironment.getApplication()
        context.getSharedPreferences("openbubbles_wear_store", Context.MODE_PRIVATE).edit().clear().commit()
    }

    @Test fun backendRefreshKeepsHumanTitleUntilBackendReportsARename() {
        val store = BridgeStore(context)
        val id = "chat_iMessage;+;family"
        store.update(WireThread(id = id, title = "Family", isGroup = true))

        val generic = store.upsertIncoming(WireThread(id = id, title = "Group", isGroup = true))
        assertEquals("Family", generic.title)

        val renamed = store.upsertIncoming(WireThread(id = id, title = "Weekend plans", isGroup = true))
        assertEquals("Weekend plans", renamed.title)
    }

    @Test fun boundedBackendDirectoryKeepsChatsWithMessagesWhenPlaceholdersOverflow() {
        val store = BridgeStore(context)
        repeat(45) { index ->
            val id = "iMessage;-;+1555000$index"
            store.upsertIncoming(WireThread(id = id, title = "Chat $index", address = "+1555000$index",
                messages = listOf(WireMessage("m$index", id, "Message $index", index.toLong()))))
        }
        repeat(80) { index ->
            val id = "chat_iMessage;+;group$index"
            store.upsertIncoming(WireThread(id = id, title = "Group $index", isGroup = true))
        }

        val snapshot = store.snapshot()
        assertEquals(BridgeStore.MAX_THREADS, snapshot.count { it.messages.isNotEmpty() })
        assertTrue(snapshot.count { it.messages.isEmpty() } <= BridgeStore.MAX_PLACEHOLDERS)
        assertTrue(snapshot.any { it.messages.isNotEmpty() })
    }

    @Test fun groupOpenIntentUsesItsExactGuidAndNoRecipientComposeFields() {
        val packageName = "com.openbubbles.messaging"
        val groupGuid = "iMessage;+;family-id"
        val launcher = Intent(Intent.ACTION_MAIN)
            .setComponent(ComponentName(packageName, "$packageName.MainActivity"))

        val intent = ConversationLaunch.existingGuid(launcher, groupGuid)

        assertEquals(groupGuid, intent.getStringExtra("chatGuid"))
        assertEquals(groupGuid, intent.getStringExtra("android.intent.extra.shortcut.ID"))
        assertEquals(Intent.ACTION_VIEW, intent.action)
        assertEquals(launcher.component, intent.component)
        assertFalse(intent.hasExtra("address"))
        assertFalse(launcher.hasExtra("chatGuid"))
        assertThrows(IllegalArgumentException::class.java) {
            ConversationLaunch.existingGuid(launcher, "Family")
        }
    }
}
