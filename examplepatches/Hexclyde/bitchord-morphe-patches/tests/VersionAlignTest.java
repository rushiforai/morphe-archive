package app.bitchord.telegram;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Random;

/**
 * Lining up an upgrade: the stream that's playing is heard through its audio sink, in the sink's
 * own time, and the Telegram copy is decoded on the song's timeline; the offset between them is
 * found to within half a millisecond, and two different songs aren't taken for one. Then two sinks
 * playing at once: how far behind the new one is, and that cutting that much puts it in step.
 */
public final class VersionAlignTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    /** Drums and chords. */
    static float[] song(int rate, int seconds, long seed) {
        Random r = new Random(seed);
        float[] out = new float[rate * seconds];
        double beat = 60.0 / 112 / 2;
        for (int n = 0; n * beat < seconds; n++) {
            int start = (int) (n * beat * rate);
            double level = 0.2 + 0.8 * r.nextDouble();
            int length = (int) (0.12 * rate);
            for (int i = 0; i < length && start + i < out.length; i++)
                out[start + i] +=
                        (float) (r.nextGaussian() * level * Math.exp(-i / (0.03 * rate)) * 0.3);
            double f = 110 * Math.pow(2, r.nextInt(24) / 12.0);
            int note = (int) (beat * 2 * rate);
            for (int i = 0; i < note && start + i < out.length; i++)
                out[start + i] +=
                        (float)
                                (0.15
                                        * level
                                        * Math.sin(2 * Math.PI * f * i / rate)
                                        * Math.exp(-i / (0.4 * rate)));
        }
        return out;
    }

    /** The same song at another sample rate, as a stream would be. */
    static float[] resample(float[] song, int from, int to) {
        float[] out = new float[(int) ((long) song.length * to / from)];
        for (int i = 0; i < out.length; i++) {
            double at = i * (double) from / to;
            int a = (int) at;
            double t = at - a;
            out[i] = (float) (song[a] * (1 - t) + (a + 1 < song.length ? song[a + 1] : 0) * t);
        }
        return out;
    }

    /** The same song with {@code leadMs} more silence at the start, slightly different. */
    static float[] copy(float[] song, int rate, double leadMs, long seed) {
        Random r = new Random(seed);
        int lead = (int) Math.round(leadMs * rate / 1000);
        float[] out = new float[song.length];
        float smooth = 0;
        for (int i = 0; i < out.length; i++) {
            int from = i - lead;
            float v = from >= 0 && from < song.length ? song[from] : 0;
            smooth = 0.7f * smooth + 0.3f * v; // a duller master
            out[i] = 0.8f * smooth + 0.2f * v + (float) (r.nextGaussian() * 0.002);
        }
        return out;
    }

    static final long RENDER_OFFSET_US = 1_000_000_000_000L;
    static final int BLOCK = 4096;

    static Object sink(int rate) {
        Object sink = new Object();
        SoundCheck.format(sink, rate, 2, Downmix.PCM_16BIT);
        return sink;
    }

    /**
     * Hands the sink {@code mono} from sample {@code from} up to {@code untilMs} of the song, as
     * stereo 16-bit buffers in renderer time starting at {@code offsetUs}; with {@code cutting}, as
     * the patched sink does, a catch-up cut is made, adding to {@link #cutFrames}. The sample to go
     * on from.
     */
    static int cutFrames;

    static int feed(
            Object sink,
            float[] mono,
            int rate,
            int from,
            long untilMs,
            long offsetUs,
            boolean cutting) {
        int at = from;
        for (; (long) at * 1000 / rate < untilMs; at += BLOCK) {
            ByteBuffer b = ByteBuffer.allocate(BLOCK * 4).order(ByteOrder.LITTLE_ENDIAN);
            for (int i = 0; i < BLOCK; i++) {
                short v =
                        (short) Math.max(-32768, Math.min(32767, Math.round(mono[at + i] * 32767)));
                b.putShort(v).putShort(v);
            }
            b.flip();
            long timeUs = offsetUs + (long) at * 1_000_000L / rate;
            VersionAlign.tap(sink, b, timeUs);
            VersionAlign.tap(sink, b, timeUs); // handed again: counted once
            if (cutting) {
                boolean gone = VersionAlign.drop(sink, b, timeUs);
                VersionAlign.drop(sink, b, timeUs); // handed again: cut once
                cutFrames += b.position() / 4;
                check(gone == !b.hasRemaining(), "a buffer cut whole is taken");
            }
        }
        return at;
    }

    static Object play(float[] mono, int rate, long untilMs) {
        Object sink = sink(rate);
        feed(sink, mono, rate, 0, untilMs, RENDER_OFFSET_US, false);
        return sink;
    }

    static double[] align(
            float[] stream, int streamRate, float[] telegram, int rate, long positionMs) {
        Object sink = play(stream, streamRate, positionMs + 400);
        VersionAlign.position(sink, RENDER_OFFSET_US + positionMs * 1000);
        VersionAlign.Series[] heard = VersionAlign.recent(positionMs, 1f);
        check(heard != null, "heard enough");
        check(
                Math.abs(heard[0].startMs - (positionMs - VersionAlign.HEARD_MS)) <= 5,
                "on the song's timeline: " + heard[0].startMs);
        check(
                Math.abs(heard[1].startMs - heard[0].startMs) <= VersionAlign.FRAME_US / 1000.0,
                "the waveform alongside: " + heard[1].startMs);
        long fromMs = (long) heard[0].startMs - VersionAlign.SEARCH_MS;
        int from = (int) (fromMs * rate / 1000), length = rate * 12;
        float[] part = new float[length];
        System.arraycopy(telegram, from, part, 0, length);
        return VersionAlign.align(
                heard,
                VersionAlign.of(part, length, rate, (long) from * 1_000_000L / rate),
                0,
                VersionAlign.SEARCH_MS);
    }

    public static void main(String[] args) {
        SmoothUpgrade.enabled = true;
        int rate = 44100, streamRate = 48000;
        float[] song = song(rate, 22, 1);
        float[] stream = resample(song, rate, streamRate);
        for (double lead : new double[] {237.3, -412.6, 0, 1800, 3.1}) {
            float[] telegram = copy(song, rate, lead, 2);
            double[] found = align(stream, streamRate, telegram, rate, 15_000);
            check(found != null, "compared");
            check(Math.abs(found[0] - lead) <= 0.5, "offset " + lead + " ms found as " + found[0]);
            check(found[1] >= VersionAlign.MIN_MATCH, "a clear match: " + found[1]);
            check(found[2] >= VersionAlign.MIN_MARGIN, "and clearly the best: " + found[2]);
            check(found[3] >= VersionAlign.MIN_WAVE, "refined by the waveform: " + found[3]);
        }
        // Another song: no clear match, so nothing is shifted.
        double[] other = align(stream, streamRate, song(rate, 22, 9), rate, 15_000);
        check(
                !VersionAlign.clear(other),
                "another song isn't lined up: " + java.util.Arrays.toString(other));
        // A seek starts the heard audio again.
        Object sink = play(stream, streamRate, 3000);
        ByteBuffer jump = ByteBuffer.allocate(BLOCK * 4).order(ByteOrder.LITTLE_ENDIAN);
        jump.limit(jump.capacity());
        VersionAlign.tap(sink, jump, RENDER_OFFSET_US + 60_000_000L);
        VersionAlign.position(sink, RENDER_OFFSET_US + 60_050_000L);
        check(VersionAlign.recent(60_050, 1f) == null, "too little heard since the seek");

        for (double behind : new double[] {37.4, 112.0, 0.8}) inStep(song, stream, behind);

        // Switched off: nothing is heard. (The sinks above stop counting as playing first.)
        try {
            Thread.sleep(250);
        } catch (InterruptedException e) {
            throw new AssertionError(e);
        }
        SmoothUpgrade.enabled = false;
        Object quiet = play(stream, streamRate, 15_400);
        VersionAlign.position(quiet, RENDER_OFFSET_US + 15_000_000L);
        check(VersionAlign.recent(15_000, 1f) == null, "not listening when switched off");
        check(
                VersionAlign.position(new Object(), 1234) == 1234,
                "a sink never heard is told its own position");
        SmoothUpgrade.enabled = true;
        System.out.println("PASS: " + checks + " upgrade alignment checks.");
    }

    /**
     * The stream plays on one sink; the Telegram copy has just started on another, {@code behindMs}
     * behind. The lag is heard, the new copy cuts it, and is then in step, its player told the
     * position with the cut added back.
     */
    static void inStep(float[] song, float[] stream, double behindMs) {
        int rate = 44100, streamRate = 48000;
        float[] telegram = copy(song, rate, 0, 3);
        long freshOffsetUs = 2 * RENDER_OFFSET_US;
        // At "now" the stream plays 10 s into the song; the new copy 800 ms after it started.
        double oldMs = 10_000, freshStartMs = oldMs - 800 - behindMs;
        Object old = sink(streamRate);
        int oldNext = feed(old, stream, streamRate, 0, (long) oldMs + 500, RENDER_OFFSET_US, false);
        Object fresh = sink(rate);
        int start = (int) Math.round(freshStartMs * rate / 1000);
        long startUs = freshOffsetUs + (long) start * 1_000_000L / rate;
        double freshMs = start * 1000.0 / rate + 800;
        int next = feed(fresh, telegram, rate, start, (long) freshMs + 300, freshOffsetUs, false);
        VersionAlign.position(old, RENDER_OFFSET_US + Math.round(oldMs * 1000));
        VersionAlign.position(fresh, startUs + 800_000);
        double expected = oldMs - freshMs;
        double[] lag = VersionAlign.lag(1f, 300, 600);
        check(lag != null, "the two sinks compared, " + behindMs + " ms apart");
        check(Math.abs(lag[0] - expected) <= 0.5, "heard " + expected + " ms behind as " + lag[0]);
        check(VersionAlign.newest() != null, "the newest sink is the new copy");

        // The cut is made from the next buffer handed over, after what's already buffered.
        VersionAlign.Heard heard = VersionAlign.newest();
        heard.catchUp(lag[0] * 1000);
        check(!heard.caughtUp(), "not caught up before the cut is heard");
        long cutAtUs = freshOffsetUs + (long) next * 1_000_000L / rate;
        cutFrames = 0;
        feed(fresh, telegram, rate, next, (long) freshMs + 1800, freshOffsetUs, true);
        double cutMs = cutFrames * 1000.0 / rate;
        check(Math.abs(cutMs - lag[0]) <= 0.05, "cut " + cutMs + " ms for " + lag[0]);
        check(
                VersionAlign.position(fresh, cutAtUs - 1000) == cutAtUs - 1000,
                "before the cut, the position is the sink's own");
        // 1.2 s later, both have played on: the new copy's sink has played its frames, fewer
        // by the cut, so its own position is behind the song by that much.
        double laterMs = 1200;
        long raw = startUs + Math.round((800 + laterMs) * 1000);
        long told = VersionAlign.position(fresh, raw);
        check(
                Math.abs(told - raw - cutMs * 1000) <= 25,
                "the player is told the position with the cut added back: " + (told - raw));
        feed(
                old,
                stream,
                streamRate,
                oldNext,
                (long) (oldMs + laterMs + 500),
                RENDER_OFFSET_US,
                false);
        VersionAlign.position(old, RENDER_OFFSET_US + Math.round((oldMs + laterMs) * 1000));
        VersionAlign.position(fresh, raw); // read together, as the player does
        check(heard.caughtUp(), "caught up once the cut is heard");
        double[] left = VersionAlign.lag(1f, 100, 400);
        check(left != null, "compared again");
        check(Math.abs(left[0]) <= 0.5, behindMs + " ms behind, then in step: " + left[0]);
        // A seek flushes the sink: the cut no longer applies.
        VersionAlign.flushed(fresh);
        check(VersionAlign.position(fresh, raw) == raw, "a flush forgets the cut");
        check(VersionAlign.newest() != heard, "a flushed sink isn't compared until it plays again");
    }
}
