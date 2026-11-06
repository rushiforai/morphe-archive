package com.openbubbles.wear.bridge

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class ReactionEventTrackerTest {
    private fun event(id: String, timestamp: Long = 1_000_000) = ReactionEvent(id, "chat", timestamp, "Alex", "👍")

    @Test fun startupAndRepeatedDatabaseRefreshesDoNotAlertOldEvents() {
        val tracker = ReactionEventTracker()
        val old = event("old")
        val fresh = event("fresh")
        assertTrue(tracker.newEvents(listOf(old), 1_000_000).isEmpty())
        assertEquals(listOf(fresh), tracker.newEvents(listOf(fresh, old), 1_000_000))
        assertTrue(tracker.newEvents(listOf(fresh, old), 1_000_000).isEmpty())
        assertTrue(ReactionEventTracker().newEvents(listOf(fresh, old), 1_000_000).isEmpty())
    }

    @Test fun lateHistoricalRowsAreRememberedWithoutAlerting() {
        val tracker = ReactionEventTracker()
        tracker.newEvents(emptyList(), 1_000_000)
        val old = event("late", 1)
        assertTrue(tracker.newEvents(listOf(old), 1_000_000).isEmpty())
        assertTrue(tracker.newEvents(listOf(old), 1_000_001).isEmpty())
    }

    @Test fun restoredEventsDoNotReplayButNewEventsAfterRestartCanAlert() {
        val tracker = ReactionEventTracker()
        tracker.newEvents(listOf(event("old")), 1_000_000)
        val restored = ReactionEventTracker(tracker.snapshot())
        assertEquals(listOf(event("new")), restored.newEvents(listOf(event("new"), event("old")), 1_000_000))
    }

    @Test fun aMutedReactionDoesNotBecomeNewWhenTheChatIsUnmuted() {
        val tracker = ReactionEventTracker()
        tracker.newEvents(emptyList(), 1_000_000)
        val muted = event("muted").copy(muted = true)
        assertEquals(listOf(muted), tracker.newEvents(listOf(muted), 1_000_000))
        assertTrue(tracker.newEvents(listOf(muted.copy(muted = false)), 1_000_001).isEmpty())
    }
}
