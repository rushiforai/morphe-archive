package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;
import org.junit.Test;

public class RefreshStrategiesTest {
    static final class Sent {
        final String channel;
        final byte[] message;
        final long delay;

        Sent(String channel, byte[] message, long delay) {
            this.channel = channel;
            this.message = message;
            this.delay = delay;
        }
    }

    static final class FakeMessenger implements Refresher.Messenger {
        final List<Sent> sent = new ArrayList<>();
        boolean available = true;

        final List<Integer> calls = new ArrayList<>();
        final List<MessageSequence> sequences = new ArrayList<>();

        /** Records message i of a sequence with its offset from the first (when the bridge would send it). */
        @Override
        public boolean send(String channel, MessageSequence sequence) {
            if (!available) return false;
            calls.add(sequence.size());
            sequences.add(sequence);
            for (int i = 0; i < sequence.size(); i++) {
                sent.add(new Sent(channel, sequence.messages.get(i), sequence.offset(i)));
            }
            return true;
        }
    }

    @Test
    public void lifecycleEncoderIsPlainUtf8() {
        assertArrayEquals("AppLifecycleState.paused".getBytes(StandardCharsets.US_ASCII),
                LifecycleBounce.encode("paused")); // StringCodec: no type byte, no length
    }

    @Test
    public void lifecycleBounceGoesToPausedAndBackToResumed() throws Exception {
        FakeMessenger m = new FakeMessenger();
        assertTrue(new LifecycleBounce(m).refresh(42L));
        assertEquals(java.util.Collections.singletonList(6), m.calls); // one sequence
        String[] expected = {"inactive", "hidden", "paused", "hidden", "inactive", "resumed"};
        assertEquals(expected.length, m.sent.size());
        for (int i = 0; i < expected.length; i++) {
            assertEquals("flutter/lifecycle", m.sent.get(i).channel);
            assertEquals("AppLifecycleState." + expected[i],
                    new String(m.sent.get(i).message, StandardCharsets.UTF_8));
        }
        long pause = m.sent.get(3).delay - m.sent.get(2).delay;
        assertTrue("paused for " + pause, pause >= 250 && pause <= 400);
        for (int i = 1; i < expected.length; i++) {
            long gap = m.sent.get(i).delay - m.sent.get(i - 1).delay;
            assertTrue(gap > 0);
            if (i != 3) assertTrue("gap " + gap, gap < 100);
        }
        assertTrue(m.sequences.get(0).closeAlways); // "resumed" also follows a failed step
    }

    @Test
    public void lifecycleBounceAlwaysEndsResumedOnceStarted() {
        MessageSequence s = LifecycleBounce.sequence();
        int last = s.size() - 1;
        assertEquals("AppLifecycleState.resumed", new String(s.messages.get(last), StandardCharsets.UTF_8));
        assertEquals(-1, s.next(0, false)); // "inactive" did not go out: nothing to undo
        for (int i = 1; i < last; i++) {
            assertEquals(last, s.next(i, false)); // a failure jumps straight to "resumed"
            assertEquals(0L, s.delayAfter(i, false));
            assertEquals(i + 1, s.next(i, true));
        }
        assertEquals(-1, s.next(last, true));
        assertEquals(-1, s.next(last, false));
    }

    @Test
    public void uniformSequenceStopsAtTheFirstFailure() {
        java.util.List<byte[]> msgs = java.util.Arrays.asList(new byte[1], new byte[2], new byte[3]);
        MessageSequence s = MessageSequence.uniform(msgs, 80);
        assertFalse(s.closeAlways);
        assertEquals(1, s.next(0, true));
        assertEquals(-1, s.next(1, false)); // nothing follows a missing message (RouteBounce)
        assertEquals(80L, s.gapAfter(0));
        assertEquals(160L, s.offset(2));
        assertEquals(0L, s.gapAfter(5));
    }

    @Test
    public void foregroundSignalSendsBackgroundThenForeground() throws Exception {
        FakeMessenger m = new FakeMessenger();
        assertTrue(new ForegroundSignal(m).refresh(42L));
        assertEquals(java.util.Collections.singletonList(2), m.calls); // one sequence: [true] always follows [false]
        assertEquals(2, m.sent.size());
        String ch = "dev.flutter.pigeon.wordfeud.FlutterProcessLifecycleApi.onForegroundStateChanged";
        assertEquals(ch, m.sent.get(0).channel);
        assertEquals(ch, m.sent.get(1).channel);
        assertArrayEquals(new byte[] {0x0C, 0x01, 0x02}, m.sent.get(0).message); // [false]
        assertArrayEquals(new byte[] {0x0C, 0x01, 0x01}, m.sent.get(1).message); // [true]
        assertEquals(0L, m.sent.get(0).delay);
        assertEquals(ForegroundSignal.FOREGROUND_DELAY_MS, m.sent.get(1).delay);
    }

    @Test
    public void routeBounceGoesHomeThenBackToTheGame() throws Exception {
        FakeMessenger m = new FakeMessenger();
        assertTrue(new RouteBounce(m).refresh(4391L));
        assertEquals(java.util.Collections.singletonList(2), m.calls); // "/" is always followed by the game
        assertEquals(2, m.sent.size());
        assertEquals("flutter/navigation", m.sent.get(0).channel);
        assertEquals("flutter/navigation", m.sent.get(1).channel);
        JSONObject home = new JSONObject(new String(m.sent.get(0).message, StandardCharsets.UTF_8));
        JSONObject game = new JSONObject(new String(m.sent.get(1).message, StandardCharsets.UTF_8));
        assertEquals("pushRouteInformation", home.getString("method"));
        assertEquals("/", home.getJSONObject("args").getString("location"));
        assertEquals("/", home.getJSONObject("args").getString("uri"));
        assertTrue(home.getJSONObject("args").isNull("state"));
        assertEquals("pushRouteInformation", game.getString("method"));
        assertEquals("/game/4391", game.getJSONObject("args").getString("location"));
        assertEquals("/game/4391", game.getJSONObject("args").getString("uri"));
        assertEquals(0L, m.sent.get(0).delay);
        assertEquals(RouteBounce.BOUNCE_DELAY_MS, m.sent.get(1).delay);
        assertTrue(RouteBounce.BOUNCE_DELAY_MS >= 50 && RouteBounce.BOUNCE_DELAY_MS <= 100);
    }

    @Test
    public void fcmNudgeIsAMessagingOnMessageCall() throws Exception {
        FakeMessenger m = new FakeMessenger();
        assertTrue(new FcmNudge(m, () -> 1000L).refresh(77L));
        assertEquals(1, m.sent.size());
        assertEquals("plugins.flutter.io/firebase_messaging", m.sent.get(0).channel);
        byte[] msg = m.sent.get(0).message;
        byte[] method = MessageCodecs.standard("Messaging#onMessage");
        byte[] head = java.util.Arrays.copyOf(msg, method.length);
        assertArrayEquals(method, head);
        assertEquals(0x0D, msg[method.length]); // arguments: a map (RemoteMessage)
        String text = new String(msg, StandardCharsets.ISO_8859_1);
        assertTrue(text.contains("data"));
        assertTrue(text.contains("game_id"));
        assertTrue(text.contains("77"));
        assertTrue(text.contains("sentTime"));
    }

    @Test
    public void strategiesHaveTheirNames() {
        FakeMessenger m = new FakeMessenger();
        assertEquals("LifecycleBounce", new LifecycleBounce(m).name());
        assertEquals("ForegroundSignal", new ForegroundSignal(m).name());
        assertEquals("RouteBounce", new RouteBounce(m).name());
        assertEquals("FcmNudge", new FcmNudge(m).name());
    }

    @Test
    public void strategiesReportFalseWithoutAnEngine() throws Exception {
        FakeMessenger m = new FakeMessenger();
        m.available = false;
        assertFalse(new LifecycleBounce(m).refresh(1L));
        assertFalse(new ForegroundSignal(m).refresh(1L));
        assertFalse(new RouteBounce(m).refresh(1L));
        assertFalse(new FcmNudge(m, () -> 0L).refresh(1L));
    }
}
