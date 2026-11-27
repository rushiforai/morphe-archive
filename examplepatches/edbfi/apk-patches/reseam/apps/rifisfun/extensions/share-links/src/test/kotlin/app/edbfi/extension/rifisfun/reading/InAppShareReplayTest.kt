// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.rifisfun.reading

import java.net.URI
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class InAppShareReplayTest {
    private val share = URI("https://www.reddit.com/r/example/s/Bridge")
    private val other = URI("https://www.reddit.com/r/example/s/Independent")

    @Test
    fun marksOnlyTheMatchingBrowserIntentOnceAfterRouterReplay() {
        val replay = InAppShareReplay()
        replay.withStockRouter(share) {
            assertFalse(replay.markStockIntentOnce(share))
            assertFalse(replay.skipResolverOnce(other))
            assertTrue(replay.skipResolverOnce(share))
            assertFalse(replay.skipResolverOnce(share))
            assertFalse(replay.markStockIntentOnce(other))
            assertTrue(replay.markStockIntentOnce(share))
            assertFalse(replay.markStockIntentOnce(share))
        }
        assertFalse(replay.skipResolverOnce(share))
        assertFalse(replay.markStockIntentOnce(share))
    }

    @Test
    fun independentThreadCanStillResolveTheSameLinkWhileReplayIsActive() {
        val replay = InAppShareReplay()
        val executor = Executors.newSingleThreadExecutor()
        try {
            replay.withStockRouter(share) {
                assertTrue(replay.skipResolverOnce(share))
                val independent = executor.submit<Boolean> {
                    !replay.skipResolverOnce(share) && !replay.markStockIntentOnce(share)
                }
                assertTrue(independent.get(5, TimeUnit.SECONDS))
                assertTrue(replay.markStockIntentOnce(share))
            }
        } finally {
            executor.shutdownNow()
        }
    }

    @Test
    fun differentReplayAndExceptionsDoNotLeaveOrConsumeAnotherBypass() {
        val replay = InAppShareReplay()
        replay.withStockRouter(share) {
            assertTrue(replay.skipResolverOnce(share))
            try {
                replay.withStockRouter(other) {
                    assertTrue(replay.skipResolverOnce(other))
                    error("fixture")
                }
            } catch (expected: IllegalStateException) {
                assertTrue(expected.message == "fixture")
            }
            assertFalse(replay.markStockIntentOnce(other))
            assertTrue(replay.markStockIntentOnce(share))
        }
        assertFalse(replay.markStockIntentOnce(share))
        assertFalse(replay.skipResolverOnce(other))
    }
}
