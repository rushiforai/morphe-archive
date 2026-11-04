package app.wordfeudwordfinder.extension.play;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * V4 testbuild 5: makes Flutter believe the app went to the background and came back, as when the user switches
 * apps, on Flutter's own lifecycle channel {@code flutter/lifecycle} (what the Android embedding's LifecycleChannel
 * sends). Wordfeud refreshes its games when it comes back to the foreground.
 *
 * <p>Messages use StringCodec: the plain UTF-8 bytes of the state name, no type byte. Flutter 3.13+ states, in the
 * order the embedding sends them: inactive, hidden, paused, then ({@link #PAUSE_MS} later) hidden, inactive,
 * resumed; the framework fills in any transition it misses. One {@link MessageSequence} with
 * {@link MessageSequence#closeAlways}: once "inactive" went out, "resumed" is always sent last, also when a step in
 * between failed, so Wordfeud is never left thinking it is paused. Not verified on a device (V4).
 */
public final class LifecycleBounce implements Refresher.Strategy {
    public static final String NAME = "LifecycleBounce";
    static final String CHANNEL = "flutter/lifecycle";
    static final String PREFIX = "AppLifecycleState.";
    static final List<String> STATES = Arrays.asList(
            "inactive", "hidden", "paused", "hidden", "inactive", "resumed");
    /** Time spent "paused" (after message 3). */
    static final long PAUSE_MS = 300;
    /** Between the other steps: just enough to be handled as separate transitions. */
    static final long STEP_MS = 30;

    private final Refresher.Messenger messenger;

    public LifecycleBounce(Refresher.Messenger messenger) {
        this.messenger = messenger;
    }

    /** StringCodec: the UTF-8 bytes of {@code AppLifecycleState.<state>}. */
    static byte[] encode(String state) {
        return (PREFIX + state).getBytes(StandardCharsets.UTF_8);
    }

    static MessageSequence sequence() {
        List<byte[]> messages = new ArrayList<>();
        for (String s : STATES) messages.add(encode(s));
        long[] gaps = new long[STATES.size() - 1];
        for (int i = 0; i < gaps.length; i++) gaps[i] = i == 2 ? PAUSE_MS : STEP_MS;
        return new MessageSequence(messages, gaps, true);
    }

    @Override
    public boolean refresh(long gameId) {
        return messenger.send(CHANNEL, sequence());
    }

    @Override
    public String name() {
        return NAME;
    }
}
