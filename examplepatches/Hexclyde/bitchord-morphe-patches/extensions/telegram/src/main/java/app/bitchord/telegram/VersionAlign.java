package app.bitchord.telegram;

import androidx.media3.common.MediaItem;
import androidx.media3.common.Player;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Lines up a Telegram copy with the YouTube stream it replaces mid-song.
 *
 * <p>BitChord's two-player swap starts the new copy at the old one's position plus an offset it
 * measures between two versions of a song. A quality upgrade is the same song, so BitChord takes
 * the offset as zero, but two uploads rarely start at the same instant: a few hundred milliseconds
 * more silence at the start of one, and the switch repeats or skips that much.
 *
 * <p>So what each player hands its audio sink is kept for the last 15 seconds, two ways: its
 * loudness every 5 milliseconds, and its waveform below 3 kHz at 8,000 samples a second, where a
 * lossy and a lossless copy still agree closely. The sink's playing position is kept too, which
 * says when each sample is heard.
 *
 * <p>When an upgrade to a Telegram file comes, the same stretch of that file is decoded. The
 * loudness curves find the offset to a few milliseconds, then the waveforms within that to a
 * fraction of one, and BitChord's swap is given it.
 *
 * <p>Starting the new copy takes a moment, so it starts a little behind even so. While it's still
 * silent, what the two players are playing at that moment is compared the same way (see {@link
 * #lag}), and the new copy leaves out exactly that much audio to catch up (see {@link
 * Heard#catchUp}). Its player is told its position with the cut added back, so its clock stays on
 * the song.
 */
public final class VersionAlign {
    private VersionAlign() {}

    /** Loudness every 5 ms; the waveform at 8 kHz. */
    static final long FRAME_US = 5000;

    static final int WAVE_RATE = 8000;
    static final double WAVE_STEP_US = 1e6 / WAVE_RATE;

    /** Kept: 15 seconds. */
    static final int FRAMES = 3000, WAVE = 15 * WAVE_RATE;

    /** What's compared at an upgrade: the last 7 seconds heard, ending 0.2 seconds ago. */
    static final long HEARD_MS = 7000, HEARD_END_MS = 200;

    /** How far apart the two copies may be, and the window the waveforms refine within. */
    static final long SEARCH_MS = 2500;

    static final double FINE_MS = 8;

    /** How clearly the best loudness shift must win, and how well the waveforms must agree. */
    static final double MIN_MATCH = 0.5, MIN_MARGIN = 0.1, MIN_WAVE = 0.5, MIN_WAVE_MARGIN = 0.05;

    /** Measuring gives up after this long, and the swap goes ahead unaligned. */
    static final long BUDGET_MS = 8000;

    // ── Listening ───────────────────────────────────────────────────────────

    /** Two cascaded biquads: a fourth-order Butterworth low-pass at 3 kHz. */
    static final class Lowpass {
        private final double[][] c = new double[2][5];
        private final double[][] z = new double[2][2];

        Lowpass(int rate) {
            double[] q = {0.5411961, 1.3065630};
            double w = 2 * Math.PI * 3000 / rate, cos = Math.cos(w), sin = Math.sin(w);
            for (int s = 0; s < 2; s++) {
                double alpha = sin / (2 * q[s]), a0 = 1 + alpha;
                c[s][0] = (1 - cos) / 2 / a0;
                c[s][1] = (1 - cos) / a0;
                c[s][2] = (1 - cos) / 2 / a0;
                c[s][3] = -2 * cos / a0;
                c[s][4] = (1 - alpha) / a0;
            }
        }

        double next(double x) {
            for (int s = 0; s < 2; s++) {
                double[] k = c[s], st = z[s];
                double y = k[0] * x + st[0];
                st[0] = k[1] * x - k[3] * y + st[1];
                st[1] = k[2] * x - k[4] * y;
                x = y;
            }
            return x;
        }
    }

    /** Takes samples at any rate to loudness frames and the 8 kHz waveform, from the first one. */
    static final class Reducer {
        interface Out {
            void frame(float rms);

            void wave(float sample);
        }

        final int rate;
        final double perFrame, perWave;
        final Lowpass lowpass;
        long samples, frames, waves;
        double energy, wave;
        int inFrame, inWave;

        Reducer(int rate) {
            this.rate = rate;
            perFrame = rate * (FRAME_US / 1e6);
            perWave = rate / (double) WAVE_RATE;
            lowpass = new Lowpass(rate);
        }

        void add(float mono, Out out) {
            energy += mono * mono;
            inFrame++;
            wave += lowpass.next(mono);
            inWave++;
            samples++;
            if (samples >= (long) Math.floor((frames + 1) * perFrame)) {
                out.frame((float) Math.sqrt(energy / inFrame));
                energy = 0;
                inFrame = 0;
                frames++;
            }
            if (samples >= (long) Math.floor((waves + 1) * perWave)) {
                out.wave((float) (wave / inWave));
                wave = 0;
                inWave = 0;
                waves++;
            }
        }
    }

    /** What one audio sink was handed, in the sink's own (renderer) time. */
    static final class Heard implements Reducer.Out {
        final float[] frames = new float[FRAMES], wave = new float[WAVE];
        int frameStart, frameCount, waveStart, waveCount;
        long firstUs; // renderer time of the first sample since the last discontinuity
        long emittedFrames, emittedWave;
        long restartedAtNanos;
        Reducer reducer;
        long expectedUs = Long.MIN_VALUE;
        Object lastBuffer;
        long lastTimeUs = Long.MIN_VALUE;
        // The sink's playing position and when it was read, and when the sink was last flushed.
        long positionUs = Long.MIN_VALUE, positionAtNanos, rawPositionUs, flushedAtNanos;
        // Audio left out so this copy catches up: still to leave out, in renderer time, and each
        // cut made, {raw position it's heard at, length}, until the sink is flushed.
        volatile double dropUs;
        Object dropBuffer;
        long dropTimeUs = Long.MIN_VALUE, droppedUs;
        final List<long[]> dropped = new ArrayList<>();

        synchronized void add(
                ByteBuffer buffer, long timeUs, int rate, int channels, int encoding) {
            if (buffer == lastBuffer && timeUs == lastTimeUs) return; // handed again
            lastBuffer = buffer;
            lastTimeUs = timeUs;
            int width = Downmix.bytesPerSample(encoding);
            if (width == 0 || channels <= 0 || rate <= 0) return;
            // A seek, a new song or a new format: start again.
            if (reducer == null
                    || reducer.rate != rate
                    || expectedUs == Long.MIN_VALUE
                    || Math.abs(timeUs - expectedUs) > 20_000) {
                reducer = new Reducer(rate);
                frameStart = frameCount = waveStart = waveCount = 0;
                emittedFrames = emittedWave = 0;
                firstUs = timeUs;
                restartedAtNanos = System.nanoTime();
            }
            ByteBuffer b = buffer.duplicate().order(ByteOrder.LITTLE_ENDIAN);
            int count = b.remaining() / (width * channels);
            for (int i = 0; i < count; i++) {
                float sum = 0;
                for (int c = 0; c < channels; c++) sum += Downmix.read(b, encoding);
                reducer.add(sum / channels, this);
            }
            expectedUs = timeUs + count * 1_000_000L / rate;
        }

        @Override
        public void frame(float rms) {
            emittedFrames++;
            if (frameCount < FRAMES) frames[(frameStart + frameCount++) % FRAMES] = rms;
            else {
                frames[frameStart] = rms;
                frameStart = (frameStart + 1) % FRAMES;
            }
        }

        @Override
        public void wave(float sample) {
            emittedWave++;
            if (waveCount < WAVE) wave[(waveStart + waveCount++) % WAVE] = sample;
            else {
                wave[waveStart] = sample;
                waveStart = (waveStart + 1) % WAVE;
            }
        }

        /** Takes the sink's own position and returns it with the cuts made since added back. */
        synchronized long position(long raw, long nanos) {
            long us = raw;
            for (long[] cut : dropped) if (raw >= cut[0]) us += cut[1];
            rawPositionUs = raw;
            positionUs = us;
            positionAtNanos = nanos;
            return us;
        }

        synchronized void flushed(long nanos) {
            dropped.clear();
            droppedUs = 0;
            dropUs = 0;
            dropBuffer = null;
            flushedAtNanos = nanos;
        }

        /** Whether what this sink plays now is from after its last flush. */
        synchronized boolean current() {
            return positionUs != Long.MIN_VALUE
                    && restartedAtNanos >= flushedAtNanos
                    && positionAtNanos >= restartedAtNanos;
        }

        /** Leaves {@code us} of renderer time out of what this sink is handed next. */
        synchronized void catchUp(double us) {
            dropUs = Math.max(0, us);
        }

        /** Whether everything asked to be left out has been, and the cut has been heard. */
        synchronized boolean caughtUp() {
            if (dropUs > 0) return false;
            return dropped.isEmpty() || rawPositionUs >= dropped.get(dropped.size() - 1)[0] + 5000;
        }

        /** Cuts the start of a buffer while a catch-up is pending: true when none of it is left. */
        synchronized boolean drop(ByteBuffer buffer, long timeUs, int rate, int frameBytes) {
            if (dropUs <= 0 || (buffer == dropBuffer && timeUs == dropTimeUs)) return false;
            dropBuffer = buffer;
            dropTimeUs = timeUs;
            int frames = buffer.remaining() / frameBytes;
            int n = (int) Math.min(frames, Math.round(dropUs * rate / 1e6));
            if (n <= 0) {
                dropUs = 0;
                return false;
            }
            long us = Math.round(n * 1e6 / rate);
            dropped.add(new long[] {timeUs - droppedUs, us});
            droppedUs += us;
            dropUs = n < frames ? 0 : dropUs - n * 1e6 / rate;
            if (dropUs < 1e6 / rate) dropUs = 0;
            buffer.position(buffer.position() + n * frameBytes);
            return !buffer.hasRemaining();
        }

        /** Loudness and waveform from [fromUs, toUs) of renderer time, in milliseconds. */
        synchronized Series[] range(double fromUs, double toUs) {
            double frameKept = firstUs + (emittedFrames - frameCount) * (double) FRAME_US;
            double waveKept = firstUs + (emittedWave - waveCount) * WAVE_STEP_US;
            return new Series[] {
                slice(frames, frameStart, frameCount, frameKept, FRAME_US, fromUs, toUs),
                slice(wave, waveStart, waveCount, waveKept, WAVE_STEP_US, fromUs, toUs)
            };
        }

        private static Series slice(
                float[] ring,
                int start,
                int count,
                double keptUs,
                double stepUs,
                double fromUs,
                double toUs) {
            int from = (int) Math.max(0, Math.ceil((fromUs - keptUs) / stepUs));
            int to = (int) Math.min(count, Math.ceil((toUs - keptUs) / stepUs));
            if (to <= from) return new Series(new float[0], keptUs / 1000.0, stepUs / 1000.0);
            float[] out = new float[to - from];
            for (int i = from; i < to; i++) out[i - from] = ring[(start + i) % ring.length];
            return new Series(out, (keptUs + from * stepUs) / 1000.0, stepUs / 1000.0);
        }

        /** Renderer time now, from the last position read. */
        synchronized double renderNowUs(long nanos, float speed) {
            return positionUs + (nanos - positionAtNanos) / 1000.0 * speed;
        }
    }

    private static final Map<Object, Heard> sinks = new WeakHashMap<>();

    private static Heard heard(Object sink) {
        synchronized (sinks) {
            Heard h = sinks.get(sink);
            if (h == null) sinks.put(sink, h = new Heard());
            return h;
        }
    }

    /** Every buffer a player hands its audio sink. */
    static void tap(Object sink, ByteBuffer buffer, long timeUs) {
        if (!SmoothUpgrade.enabled) return;
        try {
            int[] format = SoundCheck.formatOf(sink);
            if (format == null) return;
            heard(sink).add(buffer, timeUs, format[0], format[1], format[2]);
        } catch (Throwable ignored) {
            // Listening must never get in the way of playback.
        }
    }

    /**
     * The sink's playing position, each time the player asks for it, and what the player is told:
     * the same, plus any audio left out to catch up, so the player's clock stays on the song.
     */
    public static long position(Object sink, long positionUs) {
        if (positionUs == Long.MIN_VALUE) return positionUs;
        try {
            Heard h;
            synchronized (sinks) {
                h = sinks.get(sink);
            }
            if (h == null && !SmoothUpgrade.enabled) return positionUs;
            return (h != null ? h : heard(sink)).position(positionUs, System.nanoTime());
        } catch (Throwable ignored) {
            return positionUs; // As above.
        }
    }

    /** The sink was flushed (a seek, a stop): its cuts no longer apply. */
    static void flushed(Object sink) {
        Heard h;
        synchronized (sinks) {
            h = sinks.get(sink);
        }
        if (h != null) h.flushed(System.nanoTime());
    }

    /**
     * Before a buffer is handed on: cuts its start if the sink is catching up, and says whether
     * none of it is left to hand on.
     */
    static boolean drop(Object sink, ByteBuffer buffer, long timeUs) {
        try {
            Heard h;
            synchronized (sinks) {
                h = sinks.get(sink);
            }
            if (h == null || h.dropUs <= 0) return false;
            int[] format = SoundCheck.formatOf(sink);
            int width = format == null ? 0 : Downmix.bytesPerSample(format[2]);
            if (width == 0 || format[0] <= 0 || format[1] <= 0) {
                h.catchUp(0);
                return false;
            }
            return h.drop(buffer, timeUs, format[0], width * format[1]);
        } catch (Throwable ignored) {
            return false; // As above.
        }
    }

    /** The sinks playing now, the most recently (re)started last. */
    static List<Heard> playing(long nanos) {
        List<Heard> out = new ArrayList<>();
        synchronized (sinks) {
            for (Heard h : sinks.values())
                if (h.current() && nanos - h.positionAtNanos < 200_000_000L) out.add(h);
        }
        out.sort((a, b) -> Long.compare(a.restartedAtNanos, b.restartedAtNanos));
        return out;
    }

    /**
     * What the sink that's playing now heard, put on the player's own timeline: loudness and
     * waveform from {@code HEARD_MS} before {@code positionMs} up to shortly before it. Null when
     * there isn't enough.
     */
    static Series[] recent(long positionMs, float speed) {
        long now = System.nanoTime();
        List<Heard> live = playing(now);
        if (live.isEmpty()) return null;
        Heard sink = live.get(live.size() - 1);
        // Renderer time minus the player's own position: the same moment on both clocks.
        double shiftUs = sink.renderNowUs(now, speed) - positionMs * 1000.0;
        Series[] heard =
                sink.range(
                        shiftUs + (positionMs - HEARD_MS) * 1000.0,
                        shiftUs + (positionMs - HEARD_END_MS) * 1000.0);
        if (heard[0].values.length < (HEARD_MS - HEARD_END_MS) * 1000 / FRAME_US * 3 / 4)
            return null;
        return new Series[] {heard[0].shift(-shiftUs / 1000), heard[1].shift(-shiftUs / 1000)};
    }

    // ── Comparing ───────────────────────────────────────────────────────────

    /** Values a fixed step apart, from {@code startMs}. */
    static final class Series {
        final float[] values;
        final double startMs, stepMs;

        Series(float[] values, double startMs, double stepMs) {
            this.values = values;
            this.startMs = startMs;
            this.stepMs = stepMs;
        }

        Series shift(double ms) {
            return new Series(values, startMs + ms, stepMs);
        }

        double endMs() {
            return startMs + values.length * stepMs;
        }
    }

    /** Loudness frames and waveform of decoded mono samples that start at {@code startUs}. */
    static Series[] of(float[] samples, int length, int rate, long startUs) {
        float[][] out = {
            new float[(int) (length / (rate * (FRAME_US / 1e6))) + 2],
            new float[(int) (length / (rate / (double) WAVE_RATE)) + 2]
        };
        int[] n = new int[2];
        Reducer reducer = new Reducer(rate);
        Reducer.Out sink =
                new Reducer.Out() {
                    public void frame(float rms) {
                        if (n[0] < out[0].length) out[0][n[0]++] = rms;
                    }

                    public void wave(float sample) {
                        if (n[1] < out[1].length) out[1][n[1]++] = sample;
                    }
                };
        for (int i = 0; i < length; i++) reducer.add(samples[i], sink);
        return new Series[] {
            new Series(java.util.Arrays.copyOf(out[0], n[0]), startUs / 1000.0, FRAME_US / 1000.0),
            new Series(
                    java.util.Arrays.copyOf(out[1], n[1]), startUs / 1000.0, WAVE_STEP_US / 1000.0)
        };
    }

    /** Log loudness with its slow changes taken out: what's left is where the music moves. */
    static Series shape(Series frames) {
        float[] v = frames.values;
        int n = v.length, half = 20;
        double[] log = new double[n], sum = new double[n + 1];
        for (int i = 0; i < n; i++) log[i] = Math.log10(1e-7 + v[i]);
        for (int i = 0; i < n; i++) sum[i + 1] = sum[i] + log[i];
        float[] out = new float[n];
        for (int i = 0; i < n; i++) {
            int a = Math.max(0, i - half), b = Math.min(n, i + half + 1);
            out[i] = (float) (log[i] - (sum[b] - sum[a]) / (b - a));
        }
        return new Series(out, frames.startMs, frames.stepMs);
    }

    /**
     * Where {@code later} has what {@code heard} has, searched {@code searchMs} either side of
     * {@code centerMs}: {offsetMs, match, margin}, offset meaning a moment at t in {@code heard} is
     * at t + offset in {@code later}. Both have the same step. Null when they don't overlap enough.
     * The margin is over the best score more than {@code apartMs} away, or with {@code peaks} over
     * the best other peak there: a waveform repeats every cycle, so its scores rise and fall.
     */
    static double[] offset(Series heard, Series later, double centerMs, double searchMs) {
        return offset(heard, later, centerMs, searchMs, 100, false);
    }

    static double[] offset(
            Series heard,
            Series later,
            double centerMs,
            double searchMs,
            double apartMs,
            boolean peaks) {
        float[] a = heard.values, b = later.values;
        double step = heard.stepMs;
        // later[j] is heard[i] when (later.start + j*step) - (heard.start + i*step) = offset.
        double base = later.startMs - heard.startMs;
        int range = (int) Math.ceil(searchMs / step);
        int center = (int) Math.round((centerMs - base) / step);
        int minOverlap = Math.max(8, Math.min(a.length, b.length) / 2);
        double[] scores = new double[2 * range + 1];
        double best = -2;
        int bestS = -1;
        for (int s = 0; s <= 2 * range; s++) {
            int k = center - range + s; // j = i + k
            int from = Math.max(0, -k), to = Math.min(a.length, b.length - k);
            scores[s] = Double.NaN;
            if (to - from < minOverlap) continue;
            double ma = 0, mb = 0;
            for (int i = from; i < to; i++) {
                ma += a[i];
                mb += b[i + k];
            }
            ma /= to - from;
            mb /= to - from;
            double ab = 0, aa = 0, bb = 0;
            for (int i = from; i < to; i++) {
                double x = a[i] - ma, y = b[i + k] - mb;
                ab += x * y;
                aa += x * x;
                bb += y * y;
            }
            double score = aa > 0 && bb > 0 ? ab / Math.sqrt(aa * bb) : 0;
            scores[s] = score;
            if (score > best) {
                best = score;
                bestS = s;
            }
        }
        if (bestS < 0) return null;
        // The best score away from the peak: how clearly the peak wins.
        double runnerUp = -1;
        int apart = Math.max(2, (int) Math.round(apartMs / step));
        for (int s = 0; s < scores.length; s++)
            if (Math.abs(s - bestS) > apart
                    && !Double.isNaN(scores[s])
                    && (!peaks || peak(scores, s))) runnerUp = Math.max(runnerUp, scores[s]);
        // Between steps: the top of the parabola through the peak and its neighbours.
        double fraction = 0;
        if (bestS > 0 && bestS < scores.length - 1) {
            double l = scores[bestS - 1], c = scores[bestS], r = scores[bestS + 1];
            if (!Double.isNaN(l) && !Double.isNaN(r) && l - 2 * c + r < 0)
                fraction = 0.5 * (l - r) / (l - 2 * c + r);
        }
        boolean edge = bestS == 0 || bestS == scores.length - 1;
        double k = center - range + bestS + fraction;
        return new double[] {base + k * step, best, edge ? 0 : best - runnerUp};
    }

    private static boolean peak(double[] scores, int s) {
        return (s == 0 || !(scores[s - 1] > scores[s]))
                && (s == scores.length - 1 || !(scores[s + 1] > scores[s]));
    }

    /**
     * The offset between two copies: the loudness curves first, then the waveforms within a few
     * milliseconds of that. {offsetMs, loudness match, margin, waveform match (0 when not
     * refined)}, or null.
     */
    static double[] align(Series[] heard, Series[] later, double centerMs, double searchMs) {
        double[] coarse = offset(shape(heard[0]), shape(later[0]), centerMs, searchMs);
        if (coarse == null) return null;
        if (coarse[1] < MIN_MATCH || coarse[2] < MIN_MARGIN)
            return new double[] {coarse[0], coarse[1], coarse[2], 0};
        double[] fine = offset(heard[1], later[1], coarse[0], FINE_MS, 0.5, true);
        if (fine != null
                && fine[1] >= MIN_WAVE
                && fine[2] >= MIN_WAVE_MARGIN
                && Math.abs(fine[0] - coarse[0]) < FINE_MS - 0.5)
            return new double[] {fine[0], coarse[1], coarse[2], fine[1]};
        return new double[] {coarse[0], coarse[1], coarse[2], 0};
    }

    /** Whether an {@link #align} result is clear enough to use. */
    static boolean clear(double[] found) {
        return found != null && found[1] >= MIN_MATCH && found[2] >= MIN_MARGIN;
    }

    // ── While the new copy is still silent ──────────────────────────────────

    /**
     * How much later the newest playing sink plays the same music than the one that was playing
     * before it, in wall-clock milliseconds, from the last {@code tailMs} the newest has heard
     * since it last started: {lagMs, waveform match, margin}, or null when it can't be told yet.
     * Each sink's samples are put on the wall clock from its own playing position, so this is
     * what's heard, whatever each player's timeline says.
     *
     * <p>Under a second of music is too little for the loudness curves, which a steady beat makes
     * look alike a beat apart, so the waveforms are compared over the whole search instead. That
     * takes a while: call this off the player's thread.
     */
    static double[] lag(float speed, double searchMs, double tailMs) {
        long now = System.nanoTime();
        List<Heard> live = playing(now);
        if (live.size() < 2) return null;
        Heard old = live.get(live.size() - 2), fresh = live.get(live.size() - 1);
        double oldShift = shiftMs(old, now, speed), freshShift = shiftMs(fresh, now, speed);
        double nowUs = fresh.renderNowUs(now, speed);
        Series[] f = fresh.range(nowUs - tailMs * speed * 1000, nowUs);
        Series[] freshWall = {wall(f[0], freshShift, speed), wall(f[1], freshShift, speed)};
        if (freshWall[0].values.length < 60) return null; // 300 ms
        double fromMs = freshWall[0].startMs - searchMs - 50;
        double toMs = freshWall[0].endMs() + searchMs + 50;
        Series[] o =
                old.range((fromMs + oldShift) * speed * 1000, (toMs + oldShift) * speed * 1000);
        Series[] oldWall = {wall(o[0], oldShift, speed), wall(o[1], oldShift, speed)};
        // A moment at t in the old sink is at t + lag in the new one.
        double[] found = offset(oldWall[1], freshWall[1], 0, searchMs, 0.5, true);
        return found != null && found[1] >= MIN_WAVE && found[2] >= MIN_WAVE_MARGIN ? found : null;
    }

    /** Renderer milliseconds over speed, minus this, is when a sample is heard (wall clock). */
    private static double shiftMs(Heard sink, long nanos, float speed) {
        return sink.renderNowUs(nanos, speed) / speed / 1000.0 - nanos / 1e6;
    }

    private static Series wall(Series renderer, double shiftMs, float speed) {
        return new Series(
                renderer.values, renderer.startMs / speed - shiftMs, renderer.stepMs / speed);
    }

    /** The newest playing sink, the one {@link #lag} measures against the one before it. */
    static Heard newest() {
        List<Heard> live = playing(System.nanoTime());
        return live.size() < 2 ? null : live.get(live.size() - 1);
    }

    // ── At an upgrade ───────────────────────────────────────────────────────

    private static final ExecutorService work =
            Executors.newSingleThreadExecutor(
                    r -> {
                        Thread thread = new Thread(r, "Telegram version align");
                        thread.setDaemon(true);
                        return thread;
                    });

    /** Runs {@link #lag} off the player's thread. */
    static java.util.concurrent.Future<double[]> lagLater(
            float speed, double searchMs, double tailMs) {
        return work.submit(() -> lag(speed, searchMs, tailMs));
    }

    /** Decodes part of a Telegram file. */
    interface Decoder {
        SoundCheck.Pcm decode(String telegramId, long fromMs, int seconds) throws Exception;
    }

    static volatile Decoder decoder;

    /**
     * Measures how far the Telegram copy {@code item} is from what {@code player} is playing, then
     * calls {@code then} on the player's thread with the offset in milliseconds, or null. False
     * when it can't be measured at all (not a Telegram copy, too little heard yet), and nothing is
     * called.
     */
    static boolean measure(
            Player player, MediaItem item, java.util.function.Consumer<Double> then) {
        Decoder decode = decoder;
        TelegramBridge bridge = TelegramBridge.instance;
        if (decode == null || bridge == null || item == null || item.localConfiguration == null)
            return false;
        android.os.Looper looper = player.getApplicationLooper();
        if (looper == null) return false;
        String id;
        try {
            id = InternalAddon.audioId(bridge, item.localConfiguration.uri.toString());
        } catch (Exception e) {
            return false;
        }
        long positionMs = player.getCurrentPosition();
        float speed = player.getPlaybackParameters().speed;
        Series[] heard = recent(positionMs, speed);
        if (heard == null) return false;
        android.os.Handler handler = new android.os.Handler(looper);
        long started = System.currentTimeMillis();
        work.execute(
                () -> {
                    Double offset = null;
                    try {
                        long fromMs = Math.max(0, (long) heard[0].startMs - SEARCH_MS);
                        long toMs = (long) heard[0].endMs() + SEARCH_MS;
                        SoundCheck.Pcm pcm =
                                decode.decode(
                                        id, fromMs, (int) Math.ceil((toMs - fromMs) / 1000.0));
                        if (System.currentTimeMillis() - started < BUDGET_MS) {
                            double[] found =
                                    align(
                                            heard,
                                            of(pcm.samples, pcm.length, pcm.rate, pcm.startUs),
                                            0,
                                            SEARCH_MS);
                            if (clear(found)) offset = found[0];
                            HostLog.d(
                                    found == null
                                            ? "Unofficial Telegram couldn't line up the upgrade:"
                                                    + " too little to compare"
                                            : String.format(
                                                    java.util.Locale.US,
                                                    "Unofficial Telegram lined up the upgrade: the"
                                                            + " Telegram copy is %+.2f ms from the"
                                                            + " stream (loudness match %.2f, margin"
                                                            + " %.2f, waveform match %.2f)%s",
                                                    found[0],
                                                    found[1],
                                                    found[2],
                                                    found[3],
                                                    offset == null ? "; not used" : ""));
                        }
                    } catch (Exception e) {
                        HostLog.d(
                                "Unofficial Telegram couldn't line up the upgrade: "
                                        + e.getMessage());
                    }
                    Double result = offset;
                    handler.post(() -> then.accept(result));
                });
        return true;
    }
}
