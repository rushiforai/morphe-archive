package com.openbubbles.wear.bridge

import android.app.Application
import android.content.Context
import android.os.Looper
import com.openbubbles.wear.protocol.GroupsResult
import com.openbubbles.wear.protocol.ThreadPayload
import org.json.JSONArray
import org.json.JSONObject
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import java.time.Duration
import java.util.Collections
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [32], application = Application::class)
class PatchBridgeIntegrationTest {
    private lateinit var context: Context
    private lateinit var backend: FakeBackend
    private val requests = Collections.synchronizedList(mutableListOf<JSONObject>())
    private val id = "chat_iMessage;-;+15551234567"

    @Before fun reset() {
        context = RuntimeEnvironment.getApplication()
        context.getSharedPreferences("openbubbles_wear_store", Context.MODE_PRIVATE).edit().clear().commit()
        context.getSharedPreferences("openbubbles_wear_bridge", Context.MODE_PRIVATE).edit().clear().commit()
        context.getSharedPreferences("openbubbles_wear_actions", Context.MODE_PRIVATE).edit().clear().commit()
        requests.clear()
        backend = FakeBackend()
        EmbeddedRuntime.initialize(context, backend)
        BridgeCoordinator.clearCache(context)
        // Let the runtime's startup status probe and empty-directory refresh finish.
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(500))
        await { requests.any { it.optString("op") == "status" } && requests.any { it.optString("op") == "chats" } }
        repeat(3) {
            await { backend.activeRequests == 0 }
            shadowOf(Looper.getMainLooper()).idle()
        }
        requests.clear()
    }

    private fun await(timeoutMs: Long = 5_000, condition: () -> Boolean) {
        val deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(timeoutMs)
        while (!condition() && System.nanoTime() < deadline) {
            shadowOf(Looper.getMainLooper()).idle()
            Thread.sleep(5)
        }
        shadowOf(Looper.getMainLooper()).idle()
        assertTrue("Timed out waiting for the embedded backend", condition())
    }

    private fun awaitResult(timeoutMs: Long = 5_000, ready: () -> Boolean) = await(timeoutMs, ready)

    @Test fun phoneUseIsRecheckedWhenAnAsyncHistoryUpdateIsReady() {
        val keyguard = shadowOf(context.getSystemService(android.app.KeyguardManager::class.java))
        val power = shadowOf(context.getSystemService(android.os.PowerManager::class.java))
        val incoming = com.openbubbles.wear.protocol.WireMessage(
            id = "incoming", threadId = id, text = "Hello", timestamp = 1234, fromMe = false)
        val thread = com.openbubbles.wear.protocol.WireThread(
            id = id, title = "Conversation", unread = true, messages = listOf(incoming))
        power.setIsInteractive(true)
        keyguard.setKeyguardLocked(true)
        assertEquals("incoming", BridgeCoordinator.liveUpdate(thread, "incoming", true).alertMessageId)
        // The phone unlocks after its native notification but before history is ready.
        keyguard.setKeyguardLocked(false)
        val update = BridgeCoordinator.liveUpdate(thread, "incoming", true)
        assertNull(update.alertMessageId)
        assertEquals(listOf(incoming), update.thread.messages)
        assertTrue(update.thread.unread)
        assertTrue(update.hideAlertPreview)
        power.setIsInteractive(false)
        assertEquals("incoming", BridgeCoordinator.liveUpdate(thread, "incoming", false).alertMessageId)
        assertNull(BridgeCoordinator.liveUpdate(thread, null, false).alertMessageId)
    }

    @Test fun malformedAndWrongVersionBackendRepliesFailClosed() {
        for (response in listOf("not json", """{"apiVersion":2,"ok":true}""", """{"ok":true}""")) {
            backend.respond = { response }
            var reply: PatchBridgeClient.Reply? = null
            PatchBridgeClient.request(context, "status") { reply = it }
            awaitResult { reply != null }
            assertFalse(reply!!.ok)
            assertNull(reply!!.json)
            assertNotNull(reply!!.error)
        }
    }

    @Test fun requestFieldsCannotOverrideTheOperationOrApiVersion() {
        PatchBridgeClient.request(context, "status", JSONObject().put("op", "send").put("apiVersion", 99)) {}
        await { requests.size == 1 }
        assertEquals("status", requests.single().getString("op"))
        assertEquals(1, requests.single().getInt("apiVersion"))
    }

    @Test fun directDiscoveryReturnsBackendChatsAndKeepsTheDirectoryBounded() {
        val chats = JSONArray()
        repeat(100) { index ->
            chats.put(JSONObject().put("id", "iMessage;-;person$index@example.com")
                .put("title", "Person $index").put("address", "person$index@example.com")
                .put("lastTimestamp", 10_000L - index).put("lastPreview", "Preview $index")
                .put("participants", JSONArray().put("person$index@example.com")).put("unread", true))
        }
        backend.respond = { request -> if (request.optString("op") == "chats")
            JSONObject().put("apiVersion", 1).put("ok", true).put("chats", chats).toString()
        else backend.defaultResponse(request) }
        var result: GroupsResult? = null
        BridgeCoordinator.discoverChatsDirect("directory") { result = it }
        awaitResult { result != null }
        assertNull(result!!.error)
        assertEquals(100, result!!.chats.size)
        assertEquals("Person 0", result!!.chats.first().title)
        assertEquals("Person 99", result!!.chats.last().title)
        val store = BridgeStore(context)
        assertTrue(store.snapshot().count { it.messages.isEmpty() } <= BridgeStore.MAX_PLACEHOLDERS)
        val summary = BridgeCoordinator.threadFor(result!!.chats.first().id)!!.toSummary()
        assertTrue(summary.unread)
        assertTrue(summary.canReply)
        assertEquals(10_000L, summary.lastTimestamp)
        assertEquals("Preview 0", summary.lastPreview)
        assertEquals(listOf("person0@example.com"), summary.participants)
    }

    @Test fun directDiscoveryRequestsAndReturnsAdvancingPages() {
        val ids = (0 until 95).map { "iMessage;-;page$it@example.com" }
        backend.respond = { request ->
            if (request.optString("op") == "chats") {
                val offset = request.optInt("offset")
                val chats = JSONArray()
                ids.drop(offset).take(40).forEachIndexed { index, chatId ->
                    chats.put(JSONObject().put("id", chatId).put("title", "Page ${offset + index}")
                        .put("address", chatId.substringAfter(";-;")).put("lastTimestamp", 10_000L - offset - index))
                }
                val next = (offset + chats.length()).takeIf { it < ids.size }
                JSONObject().put("apiVersion", 1).put("ok", true).put("offset", offset).put("chats", chats)
                    .also { if (next != null) it.put("nextOffset", next) }.toString()
            } else backend.defaultResponse(request)
        }

        val pages = mutableListOf<GroupsResult>()
        var offset = 0
        repeat(3) {
            var page: GroupsResult? = null
            BridgeCoordinator.discoverChatsDirect("paged", offset) { page = it }
            awaitResult { page != null }
            pages += page!!
            offset = page!!.nextOffset ?: return@repeat
        }
        assertEquals(listOf(40, 40, 15), pages.map { it.chats.size })
        assertEquals(listOf(0, 40, 80), requests.map { it.getInt("offset") })
        assertEquals(95, pages.flatMap { it.chats }.map { it.id }.distinct().size)
    }

    @Test fun backendHistoryDoesNotMigrateAnOldNotificationAlias() {
        val alias = "chat_contact:42"
        backend.respond = { request -> when (request.optString("op")) {
            "chats" -> JSONObject().put("apiVersion", 1).put("ok", true).put("chats", JSONArray().put(
                JSONObject().put("id", alias).put("title", "Alex").put("address", "+15551234567")
                    .put("messages", JSONArray().put(JSONObject().put("id", "old").put("text", "Older").put("timestamp", 1)))
            )).toString()
            "thread" -> """{"apiVersion":1,"ok":true,"thread":{"id":"iMessage;-;+15551234567",
                "address":"+15551234567","messages":[{"id":"new","text":"Recent","timestamp":2}]}}"""
            else -> backend.defaultResponse(request)
        } }
        var chats: GroupsResult? = null
        BridgeCoordinator.discoverChatsDirect("seed") { chats = it }
        awaitResult { chats != null }
        var payload: ThreadPayload? = null
        BridgeCoordinator.threadPayload(alias) { payload = it }
        awaitResult { payload != null }
        assertEquals(id, payload!!.thread!!.id)
        assertEquals(listOf("new"), payload!!.thread!!.messages.map { it.id })
        assertNotNull(BridgeCoordinator.threadFor(alias))
    }

    @Test fun directSendPreservesRequestAddressAndBackendMessage() {
        backend.respond = { """{"apiVersion":1,"ok":true,"threadId":"iMessage;-;+15551234567",
            "thread":{"id":"iMessage;-;+15551234567","address":"+15551234567",
            "messages":[{"id":"real","text":"Hello","timestamp":5,"fromMe":true}]},
            "message":{"id":"real","text":"Hello","timestamp":5,"fromMe":true}}""" }
        var result: BridgeCoordinator.SendResult? = null
        BridgeCoordinator.send("request-id", "new:+15551234567", "Hello", "+15551234567") { result = it }
        awaitResult { result != null }
        assertNull(result!!.error)
        assertEquals(id, result!!.threadId)
        assertEquals("real", result!!.message!!.id)
        val request = requests.single()
        assertEquals("send", request.getString("op"))
        assertEquals("request-id", request.getString("requestId"))
        assertEquals("+15551234567", request.getString("address"))
        assertEquals("Hello", request.getString("text"))
    }

    @Test fun failedGroupHistoryKeepsTheExactBackendBodyAndStatus() {
        val groupId = "chat_" + "abcdef01".repeat(9)
        val rawId = groupId.removePrefix("chat_")
        backend.respond = { """{"apiVersion":1,"ok":true,"thread":{"id":"$rawId","title":"Group",
            "isGroup":true,"messages":[{"id":"failed-group","text":"Group message",
            "timestamp":2,"fromMe":true,"status":"failed"}]}}""" }
        var payload: ThreadPayload? = null
        BridgeCoordinator.threadPayload(groupId) { payload = it }
        awaitResult { payload != null }
        assertNull(payload!!.error)
        val failed = payload!!.thread!!.messages.single()
        assertEquals("Group message", failed.text)
        assertEquals("failed", failed.status)
        assertEquals(groupId, failed.threadId)
        assertTrue(payload!!.thread!!.directHistory)
        assertEquals(listOf("thread"), requests.map { it.getString("op") })
    }

    @Test fun quotedSendCarriesItsExactTargetAndPartThroughTheBridge() {
        backend.respond = { """{"apiVersion":1,"ok":true,"threadId":"iMessage;-;+15551234567",
            "message":{"id":"reply","text":"Answer","timestamp":5,"fromMe":true,
            "replyTo":{"messageId":"original","partIndex":2,"text":"Question"}}}""" }
        var result: BridgeCoordinator.SendResult? = null
        BridgeCoordinator.send("quoted", id, "Answer", replyToMessageId = "original", replyToPartIndex = 2) { result = it }
        awaitResult { result != null }
        assertNull(result!!.error)
        val request = requests.single { it.optString("op") == "send" }
        assertEquals("original", request.getString("replyToMessageId"))
        assertEquals(2, request.getInt("replyToPartIndex"))
        assertEquals("original", result!!.message!!.replyTo!!.messageId)
    }

    @Test fun reactionActionPreservesDesiredStateAndReturnsAuthoritativeReactions() {
        backend.respond = { """{"apiVersion":1,"ok":true,
            "thread":{"id":"iMessage;-;+15551234567","messages":[{"id":"original","text":"Hello",
            "timestamp":1,"canReact":true,"reactions":[{"type":"love","count":2,"fromMe":true,"partIndex":1}]}]}}""" }
        var result: com.openbubbles.wear.protocol.ActionResult? = null
        val reaction = com.openbubbles.wear.protocol.ReactionRequest(requestId = "react", threadId = id,
            messageId = "original", reaction = "love", remove = false, partIndex = 1)
        BridgeCoordinator.react(reaction) { result = it }
        awaitResult { result != null }
        assertTrue(result!!.ok)
        val request = requests.single { it.optString("op") == "reaction" }
        assertEquals("original", request.getString("messageId"))
        assertEquals("love", request.getString("reaction"))
        assertFalse(request.getBoolean("remove"))
        assertEquals(1, request.getInt("partIndex"))
        assertEquals(2, result!!.message!!.reactions.single().count)
        assertTrue(BridgeCoordinator.threadFor(id)!!.messages.single().reactions.single().fromMe)
    }

    @Test fun malformedSuccessfulHistoryReportsTheBackendShapeError() {
        backend.respond = { """{"apiVersion":1,"ok":true,"thread":{"id":"$id","messages":"invalid"}}""" }
        var payload: ThreadPayload? = null
        BridgeCoordinator.threadPayload(id) { payload = it }
        awaitResult { payload != null }
        assertNotNull(payload!!.error)
        assertTrue(payload!!.error!!.contains("no message history"))
        assertEquals(listOf("thread"), requests.map { it.getString("op") })
    }

    @Test fun oversizedSendsAreRejectedWithoutTruncatingOrCallingTheBackend() {
        var result: BridgeCoordinator.SendResult? = null
        val oversized = "x".repeat(801)
        BridgeCoordinator.send("long-request", id, oversized) { result = it }
        assertNotNull(result!!.error)
        assertTrue(result!!.error!!.contains("1–800"))
        assertTrue(requests.isEmpty())
        var valid: BridgeCoordinator.SendResult? = null
        BridgeCoordinator.send("max-request", id, "x".repeat(800)) { valid = it }
        await { requests.any { it.optString("op") == "send" } }
        assertEquals(800, requests.single { it.optString("op") == "send" }.getString("text").length)
        awaitResult { valid != null }
    }

    @Test fun timeoutIsUncertainAndDoesNotAutomaticallyReplayASend() {
        val gate = CountDownLatch(1)
        val entered = CountDownLatch(1)
        backend.beforeRespond = { request -> if (request.optString("op") == "send") {
            entered.countDown()
            gate.await(5, TimeUnit.SECONDS)
        } }
        var result: BridgeCoordinator.SendResult? = null
        BridgeCoordinator.send("timeout-request", id, "Hello") { result = it }
        assertTrue(entered.await(5, TimeUnit.SECONDS))
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(25))
        awaitResult { result != null }
        assertNotNull(result!!.error)
        assertFalse(result!!.retryable)
        gate.countDown()
        Thread.sleep(20)
        shadowOf(Looper.getMainLooper()).idle()
        assertEquals(1, requests.count { it.optString("op") == "send" })
    }

    @Test fun disabledBackendBlocksActionsWithoutARequest() {
        backend.enabled = false
        var result: BridgeCoordinator.SendResult? = null
        BridgeCoordinator.send("disabled-request", id, "Hello") { result = it }
        assertNotNull(result!!.error)
        assertTrue(result!!.error!!.contains("disabled"))
        assertTrue(requests.isEmpty())
    }

    @Test fun missingEmbeddedBackendFailsClosed() {
        val backendField = EmbeddedRuntime::class.java.getDeclaredField("backend").apply { isAccessible = true }
        val installed = backendField.get(null)
        try {
            backendField.set(null, null)
            var reply: PatchBridgeClient.Reply? = null
            PatchBridgeClient.request(context, "send") { reply = it }
            assertFalse(reply!!.ok)
            assertTrue(reply!!.error!!.contains("patch is unavailable"))
            assertFalse(PatchBridgeClient.patchInstalled)
        } finally {
            backendField.set(null, installed)
        }
    }

    @Test fun disabledStatusReportsActionableBackendStateAndNoDirectBridge() {
        backend.enabled = false
        var pong: com.openbubbles.wear.protocol.PongPayload? = null
        PatchBridgeClient.probe(context, force = true) { pong = BridgeCoordinator.pong() }
        awaitResult { pong != null }
        assertFalse(pong!!.directBridge)
        assertEquals("Disabled in OpenBubbles", PatchBridgeClient.backendState)
        assertTrue(PatchBridgeClient.patchInstalled)
    }

    @Test fun pausedRelayDoesNotQueryPrivateHistory() {
        backend.enabled = false
        var payload: ThreadPayload? = null
        BridgeCoordinator.threadPayload(id) { payload = it }
        assertEquals("Relay is paused on the phone.", payload!!.error)
        assertTrue(requests.isEmpty())
    }

    private inner class FakeBackend : EmbeddedRuntime.Backend {
        @Volatile var enabled = true
        @Volatile var respond: (JSONObject) -> String = { request -> defaultResponse(request) }
        @Volatile var beforeRespond: ((JSONObject) -> Unit)? = null
        @Volatile var activeRequests = 0

        override fun execute(json: String): String {
            val request = JSONObject(json)
            requests.add(request)
            activeRequests++
            return try {
                beforeRespond?.invoke(request)
                respond(request)
            } finally {
                activeRequests--
            }
        }

        override fun isEnabled(): Boolean = enabled

        fun defaultResponse(request: JSONObject): String = when (request.optString("op")) {
            "status" -> JSONObject().put("apiVersion", 1).put("ok", true).put("ready", true)
                .put("backendState", "Ready").toString()
            "chats" -> JSONObject().put("apiVersion", 1).put("ok", true).put("chats", JSONArray()).toString()
            else -> JSONObject().put("apiVersion", 1).put("ok", true).toString()
        }
    }
}
