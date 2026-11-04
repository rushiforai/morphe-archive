package app.wordfeudwordfinder.extension.play;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * An ordered list of platform messages for one channel, with the wait after each message and what happens when one
 * fails to go out. Pure; {@link FlutterBridge} walks it on the main thread with {@link #next(int, boolean)}.
 *
 * <p>Normally the walk stops at the first message that did not go out, so no message follows a missing one (for
 * {@link RouteBounce}, sending the game route without the "/" before it would leave an extra page). With
 * {@link #closeAlways} the last message is still sent after a failure once an earlier one went out: for
 * {@link LifecycleBounce} the final "resumed" must follow a "paused" in any case.
 */
public final class MessageSequence {
    public final List<byte[]> messages;
    /** {@code gapsMs[i]}: wait after message {@code i} before message {@code i + 1}. */
    private final long[] gapsMs;
    /** After a failure (and at least one message sent), still send the last message. */
    public final boolean closeAlways;

    public MessageSequence(List<byte[]> messages, long[] gapsMs, boolean closeAlways) {
        this.messages = Collections.unmodifiableList(new ArrayList<>(messages));
        this.gapsMs = gapsMs == null ? new long[0] : gapsMs.clone();
        this.closeAlways = closeAlways;
    }

    /** Every message {@code gapMs} after the previous one; stops at the first failure. */
    public static MessageSequence uniform(List<byte[]> messages, long gapMs) {
        long[] gaps = new long[Math.max(0, messages.size() - 1)];
        java.util.Arrays.fill(gaps, gapMs);
        return new MessageSequence(messages, gaps, false);
    }

    public int size() {
        return messages.size();
    }

    /** Wait after message {@code i} (0 when not given, never negative). */
    public long gapAfter(int i) {
        return i >= 0 && i < gapsMs.length ? Math.max(0L, gapsMs[i]) : 0L;
    }

    /** Milliseconds from the first message to message {@code i}, when all go out. */
    public long offset(int i) {
        long t = 0;
        for (int k = 0; k < i; k++) t += gapAfter(k);
        return t;
    }

    /**
     * The index to send after message {@code i}, or -1 when the sequence ends. {@code sent}: whether message
     * {@code i} went out. A failed first message ends it (nothing was sent, nothing to close).
     */
    public int next(int i, boolean sent) {
        int last = messages.size() - 1;
        if (i >= last) return -1;
        if (sent) return i + 1;
        return closeAlways && i > 0 ? last : -1;
    }

    /** Wait before sending {@code next(i, sent)}: the planned gap, or none when jumping to the last message. */
    public long delayAfter(int i, boolean sent) {
        return sent ? gapAfter(i) : 0L;
    }
}
