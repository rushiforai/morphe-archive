package com.openbubbles.wear.bridge

import android.app.Application
import android.content.Context
import com.openbubbles.wear.protocol.ActionResult
import com.openbubbles.wear.protocol.Protocol
import java.util.concurrent.Callable
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [32], application = Application::class)
class ActionDedupeTest {
    private lateinit var context: Context

    @Before fun reset() {
        context = RuntimeEnvironment.getApplication()
        context.getSharedPreferences("openbubbles_wear_actions", Context.MODE_PRIVATE).edit().clear().commit()
        ActionDedupe::class.java.getDeclaredField("initialized").apply { isAccessible = true }.setBoolean(null, false)
        @Suppress("UNCHECKED_CAST")
        val inFlight = ActionDedupe::class.java.getDeclaredField("inFlight").apply { isAccessible = true }
            .get(null) as MutableSet<String>
        inFlight.clear()
    }

    private fun claim(id: String) = ActionDedupe.claim(context, id, Protocol.ACTION_SEND, "chat")

    @Test fun duplicateWhileSendingDoesNotStartAnotherSend() {
        assertTrue(claim("one").started)
        assertEquals(ActionDedupe.Claim(false), claim("one"))
    }

    @Test fun completedRequestReturnsOriginalResult() {
        assertTrue(claim("one").started)
        val result = ActionResult(requestId = "one", action = Protocol.ACTION_SEND, ok = true, threadId = "chat")
        assertTrue(ActionDedupe.put(context, result))
        ActionDedupe.end("one")
        assertEquals(ActionDedupe.Claim(false, result), claim("one"))
    }

    @Test fun retryableLockedResultCanRunAgainAfterUnlock() {
        assertTrue(claim("one").started)
        val locked = ActionResult(
            requestId = "one",
            action = Protocol.ACTION_SEND,
            ok = false,
            threadId = "chat",
            error = "Phone locked",
            retryable = true
        )
        assertTrue(ActionDedupe.put(context, locked))
        ActionDedupe.end("one")
        val retry = claim("one")
        assertTrue(retry.started)
        assertNull(retry.result)
    }

    @Test fun interruptedRequestIsNotSentAgainAfterRestart() {
        assertTrue(claim("one").started)
        // Simulate losing the in-memory in-flight set but keeping the journal.
        ActionDedupe.end("one")
        val replay = claim("one")
        assertFalse(replay.started)
        assertFalse(replay.result!!.ok)
        assertTrue(replay.result.error!!.contains("Check OpenBubbles"))
    }

    @Test fun concurrentCopiesHaveOnlyOneOwner() {
        val executor = Executors.newFixedThreadPool(8)
        try {
            val claims = executor.invokeAll(List(24) { Callable { claim("same") } })
            assertEquals(1, claims.count { it.get(10, TimeUnit.SECONDS).started })
        } finally {
            executor.shutdownNow()
        }
    }

    @Test fun journalIsBoundedAndKeepsNewestRequests() {
        repeat(201) { index ->
            assertTrue(claim("request-$index").started)
            ActionDedupe.end("request-$index")
        }
        assertFalse(claim("request-200").started)
        assertTrue(claim("request-0").started)
        val prefs = context.getSharedPreferences("openbubbles_wear_actions", Context.MODE_PRIVATE)
        assertEquals(200, prefs.all.keys.count { it.startsWith("result:") })
    }
}
