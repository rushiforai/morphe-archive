package app.morphe.extension.tiktok.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.net.SocketTimeoutException;

import org.junit.Test;

/** Resource limits that must hold when media work is retried or nested. */
public class MediaBudgetTest {
    @Test public void retryAfterIsCappedBeforeMillisecondsAreCalculated() {
        assertEquals(MediaBudget.MAX_RETRY_DELAY_MS,
                MediaBudget.retryAfterMillis("9223372036854775807", 0));
        assertEquals(1_000L, MediaBudget.retryAfterMillis("1", 0));
    }

    @Test public void socketTimeoutsRetry() {
        SocketTimeoutException timeout = new SocketTimeoutException("read timed out");
        assertTrue(MediaBudget.isRetryableTransport(timeout));
    }

    @Test public void nestedMediaOperationsReuseTheRunningJobDeadline() {
        MediaBudget.runWithJobDeadline(() -> {
            MediaBudget.Deadline first = MediaBudget.deadline();
            MediaBudget.runWithJobDeadline(() -> assertSame(first, MediaBudget.deadline()));
        });
    }
}
