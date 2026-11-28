package app.morphe.extension.sabp.read

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertNull
import org.junit.Test

/** SkipWatcher: only normal playback running into a skipped passage is a crossing. */
class SkipWatcherTest {
    private val passage = intArrayOf(200, 260)

    // One passage, starting at 100 s.
    private val passages = SkipWatcher.Passages { from, to -> if (from < 100.0 && 100.0 <= to) passage else null }

    private fun SkipWatcher.feed(vararg pos: Double, playing: Boolean = true) =
        pos.map { update(it, playing, 3.0, passages) }.filterNotNull()

    @Test
    fun ticksAcrossFireOnce() {
        val w = SkipWatcher()
        val hits = w.feed(98.0, 99.0, 100.0, 101.0, 102.0)
        assertArrayEquals(passage, hits.single())
    }

    @Test
    fun aSeekAcrossIsNotACrossing() {
        assertNull(SkipWatcher().feed(90.0, 91.0, 130.0, 131.0).firstOrNull())
    }

    @Test
    fun goingBackwardsIsNotACrossing() {
        assertNull(SkipWatcher().feed(101.0, 99.5, 99.0).firstOrNull())
    }

    @Test
    fun startingPastThePassageIsNotACrossing() {
        assertNull(SkipWatcher().feed(100.5, 101.5, 102.5).firstOrNull())
    }

    @Test
    fun pausedIsNotACrossingButResumingIs() {
        val w = SkipWatcher()
        assertNull(w.feed(99.0, 99.0, 100.5, playing = false).firstOrNull()) // a small seek while paused
        val w2 = SkipWatcher()
        w2.feed(99.5, playing = false)
        assertArrayEquals(passage, w2.feed(100.2).single())                 // paused just before, then played on
    }
}
