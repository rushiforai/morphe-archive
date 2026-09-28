package app.morphe.extension.tiktok.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.ConnectException;
import java.net.SocketTimeoutException;
import javax.net.ssl.SSLHandshakeException;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

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

    /**
     * Android 17's {@code ENABLE_DEFAULT_ENCRYPTED_CLIENT_HELLO}, and the Certificate
     * Transparency change beside it, both arrive as a handshake the platform refused. Retrying
     * one would hammer a host that is going to refuse every time, so the transport retries a
     * timeout and a refused connection and nothing else, and names what it got. This is the
     * device-independent half of that verdict; {@code AndroidTargetChangesGuardTest} carries the
     * rest of the target 37 audit.
     */
    @Test public void aRefusedHandshakeIsNotRetried() {
        assertFalse(MediaBudget.isRetryableTransport(
                new SSLHandshakeException("Certificate Transparency or ECH refused")));
        assertFalse(MediaBudget.isRetryableTransport(
                new IOException("wrapped", new SSLHandshakeException("refused"))));
        assertTrue(MediaBudget.isRetryableTransport(
                new IOException("wrapped", new SocketTimeoutException("slow"))));
        assertTrue(MediaBudget.isRetryableTransport(
                new IOException("wrapped", new ConnectException("refused connection"))));
    }

    @Test public void nestedMediaOperationsReuseTheRunningJobDeadline() {
        MediaBudget.runWithJobDeadline(() -> {
            MediaBudget.Deadline first = MediaBudget.deadline();
            MediaBudget.runWithJobDeadline(() -> assertSame(first, MediaBudget.deadline()));
        });
    }

    @Test public void knownLengthReservationStillIncludesPublishAndFreeSpace() throws Exception {
        long transfer = 5L * 1024 * 1024;
        long required = transfer + MediaBudget.PUBLISH_OVERHEAD_BYTES
                + MediaBudget.MIN_FREE_BYTES;
        AtomicLong free = new AtomicLong(required);
        File volume = new File("known-length-volume") {
            @Override public boolean exists() {
                return true;
            }

            @Override public long getUsableSpace() {
                return free.get();
            }
        };

        MediaBudget.checkDiskSpace(volume, transfer);
        free.decrementAndGet();
        assertThrows(IOException.class, () -> MediaBudget.checkDiskSpace(volume, transfer));
    }

    @Test public void transferHeadersKeepTheExact512MbCap() throws Exception {
        MediaBudget.checkTransferLength(MediaBudget.MAX_TRANSFER_BYTES);
        IOException failure = assertThrows(IOException.class, () ->
                MediaBudget.checkTransferLength(MediaBudget.MAX_TRANSFER_BYTES + 1));
        assertEquals("Media file is larger than the 512 MB limit", failure.getMessage());
    }

    @Test public void streamedCopyChecksTheDeadlineBeforeReading() throws Exception {
        var constructor = MediaBudget.Deadline.class.getDeclaredConstructor(long.class);
        constructor.setAccessible(true);
        MediaBudget.Deadline expired = constructor.newInstance(System.nanoTime() - 1);
        AtomicInteger reads = new AtomicInteger();
        InputStream input = new InputStream() {
            @Override public int read() {
                reads.incrementAndGet();
                return 1;
            }
        };

        IOException failure = assertThrows(IOException.class, () -> MediaFileWriter.copy(
                input, new ByteArrayOutputStream(), MediaBudget.MAX_TRANSFER_BYTES,
                expired, null));
        assertEquals("Media job deadline exceeded", failure.getMessage());
        assertEquals("the expired copy read from its source", 0, reads.get());
    }
}
