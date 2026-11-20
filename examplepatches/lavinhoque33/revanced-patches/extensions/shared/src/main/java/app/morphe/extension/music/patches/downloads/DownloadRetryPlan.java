/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-19.
 */
package app.morphe.extension.music.patches.downloads;

import java.io.EOFException;
import java.io.InterruptedIOException;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.concurrent.CancellationException;

import javax.net.ssl.SSLException;

/** Process-local automatic resume and in-run connection recovery decisions. */
final class DownloadRetryPlan {
    static final long AUTO_INTERVAL = 10 * 60_000L;
    static final long OUTAGE_BUDGET = 5 * 60_000L;
    static final int IDLE_LIMIT = 3;
    private static final long RETRY_SETTLE = 2_000;

    record Attempt(long startedAt, int idleAttempts) {
        boolean held() {
            return idleAttempts >= IDLE_LIMIT;
        }
    }

    private DownloadRetryPlan() {}

    static Attempt finish(Attempt previous, long startedAt, boolean madeProgress, boolean interrupted) {
        int idle = previous == null ? 0 : previous.idleAttempts();
        if (!interrupted) idle = madeProgress ? 0 : idle + 1;
        return new Attempt(startedAt, idle);
    }

    static boolean canResume(boolean streamMode, boolean pending) {
        return streamMode && pending;
    }

    static long delayUntilAutomaticResume(boolean running, Attempt previous, long now) {
        if (running || (previous != null && previous.held())) return Long.MAX_VALUE;

        return previous == null ? 0 : Math.max(0, AUTO_INTERVAL - (now - previous.startedAt()));
    }

    static boolean reportFailure(boolean automatic, boolean interrupted) {
        return !automatic || !interrupted;
    }

    static boolean retryAfterFailure(boolean connectionLost, boolean retried) {
        return connectionLost && !retried;
    }

    /** A negative value means the transfer stopped before the next attempt could start. */
    static long settleBeforeAttempt(boolean retry, boolean stopped) {
        if (stopped) return -1;
        return retry ? RETRY_SETTLE : 0;
    }

    static boolean isTransportFailure(Throwable failure, boolean threadInterrupted) {
        if (threadInterrupted) return false;

        boolean transport = false;
        for (int depth = 0; failure != null && depth < 16; depth++, failure = failure.getCause()) {
            if (failure instanceof InterruptedException || failure instanceof CancellationException) return false;

            transport |= failure instanceof SocketException || failure instanceof UnknownHostException
                    || failure instanceof SSLException || failure instanceof InterruptedIOException
                    || failure instanceof EOFException;
        }
        return transport;
    }

    static final class OutageBudget {
        private long remaining = OUTAGE_BUDGET;

        long remaining() {
            return remaining;
        }

        void waited(long elapsed) {
            remaining = Math.max(0, remaining - elapsed);
        }
    }
}
