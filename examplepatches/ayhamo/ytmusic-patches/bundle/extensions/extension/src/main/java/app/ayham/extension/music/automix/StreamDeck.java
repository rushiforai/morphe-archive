package app.ayham.extension.music.automix;

import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioTimestamp;
import android.media.AudioTrack;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Locale;

/**
 * The full-stream deck (the extension's src/plus/stream-deck.js, setting "Smooth hand-over"): after
 * a mix the new song plays on from our own copy of its audio (the analysis' download, kept), while
 * YT's player keeps playing it muted as the clock. YT stays in charge of everything the listener
 * sees and does (play, pause, seek, next); the deck only follows its position.
 *
 * <p>clock: every SERVO_MS the deck compares the song second it is heard at (its AudioTrack's
 * timestamp mapped back through what was written) with YT's position, and follows: play/pause with
 * it, small errors trimmed by dropping or repeating one frame in TRIM_EVERY, big ones with one seek.
 * level: the volume YT asks of its player (the listener's, times YT's loudness factor), as the mix
 * decks. Takeover and release are set in song seconds, so the writer applies them sample-exact
 * however far ahead it writes. handback: on any failure the deck fades out and YT's player gets its
 * volume back; YT is at the same spot, so nothing is sought and nothing is missed.
 */
final class StreamDeck {
    private static final String TAG = Automix.TAG;
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final long SERVO_MS = 50;
    private static final double SEEK_ERROR = 0.12, LOCK = 0.012, DEADBAND = 0.03, FADE = 0.025;
    private static final int TRIM_EVERY = 333;                 // one frame in 333: 0.3%
    private static final long START_TIMEOUT_MS = 8000;
    private static final int MAX_SEEKS_PER_10S = 4, KEEP_FILES = 4;
    /** How late a seek of the deck lands (learnt, kept for the next song's deck). */
    private static double startLag;

    // set on the main thread, read by the download threads in keep()
    private static volatile StreamDeck current;

    final String id;
    final Object player;
    private final File file;
    private volatile String state = "loading"; // loading | following | released | handed-back
    private volatile boolean ready;
    /** Song seconds the deck is heard from / until (NaN: not set). */
    private volatile double takeAt = Double.NaN, releaseAt = Double.NaN;
    /** A seek the servo asks of the writer: cleared by the writer only if no newer one came meanwhile. */
    private final java.util.concurrent.atomic.AtomicReference<Double> seekTo = new java.util.concurrent.atomic.AtomicReference<>(Double.NaN);
    private volatile boolean paused;
    private volatile int trim;  // -1 drop, +1 repeat, 0 none
    private volatile float level = 1;
    /** YT's playback speed for this song (the mix glides it back to x1.0); the deck plays at x1.0. */
    private volatile float ytSpeed = 1;
    /** Lost its place while heard: takes the song back the moment it is in step again. */
    private boolean retake;
    /**
     * YT's reported position steps by its audio latency when the takeover mutes it or resets its
     * speed (2026-11-17: -120 to -184 ms, 0.1-0.45 s after each takeover) while what is heard runs
     * on: that one step, in the first 1.5 s heard, is kept as an offset instead of a seek.
     */
    private double clockShift;
    private long heardSince;
    private Thread thread;
    // built, driven and (while run() lives) released by the deck's thread alone; read on main for the clock
    private volatile AudioTrack track;
    /** run() has ended (guarded by trackLock): close() frees the track then, else run() does. */
    private boolean runEnded;
    private final Object trackLock = new Object();
    private int rate;
    // what was written: track frame -> song second, per block
    private final long[] markFrame = new long[512];
    private final double[] markSec = new double[512];
    private int marks;
    private long written;
    private final Object markLock = new Object();
    private final double[] recent = new double[3];
    private int recentN, alignSeeks;
    private boolean trimming, inStep;
    private long askedAt;
    private final long[] seekTimes = new long[8];
    private int seekN;
    private double maxErr, lastErr;
    private long lastSilentSeek;

    private StreamDeck(String id, Object player, File file) {
        this.id = id;
        this.player = player;
        this.file = file;
    }

    // ---------------------------------------------------------------------------------------------
    // The setting and the kept downloads

    /** spike.properties streamDeck=1 ("Smooth hand-over"), off by default as in the extension. */
    /** The deckClocks test flag: both clocks logged around each takeover. */
    private static boolean clockLog() {
        try {
            return "1".equals(app.ayham.extension.music.features.Features.prop("deckClocks"));
        } catch (Throwable t) {
            return false;
        }
    }

    static boolean on() {
        try {
            return "1".equals(app.ayham.extension.music.features.Features.prop("streamDeck"));
        } catch (Throwable t) {
            return false;
        }
    }

    static File dir(Context c) {
        return new File(c.getCacheDir(), "automix/deck");
    }

    /** YouTube's copies are kept for the stream deck or for the addons' fit. */
    static boolean keeps() {
        return on() || app.ayham.extension.music.addons.AddonSettings.on();
    }

    private static final java.util.Map<String, Object> fetching = new java.util.HashMap<>();

    /**
     * YouTube's copy of a song, downloaded once for the analysis, the stream deck and the addons'
     * fit: a second caller for the same song waits for the first one's download. Kept (the last
     * few songs) when keeps(), else the caller deletes it after use.
     */
    public static File youtubeCopy(Context c, String id) throws Exception {
        Object lock;
        synchronized (fetching) {
            lock = fetching.get(id);
            if (lock == null) fetching.put(id, lock = new Object());
        }
        try {
            synchronized (lock) {
                File f = fileOf(c, id);
                if (f != null) {
                    //noinspection ResultOfMethodCallIgnored
                    f.setLastModified(System.currentTimeMillis());
                    return f;
                }
                File dl = app.ayham.extension.music.features.AudioStream.download(new File(c.getCacheDir(), "automix/dl"), id);
                if (!keeps()) {
                    String n = dl.getName();
                    File own = new File(dl.getParentFile(), n.replace(".", "." + System.nanoTime() + "."));
                    return dl.renameTo(own) ? own : dl;
                }
                keep(c, id, dl);
                f = fileOf(c, id);
                if (f == null) throw new java.io.IOException("YouTube's copy could not be kept");
                return f;
            }
        } finally {
            synchronized (fetching) {
                if (fetching.get(id) == lock) fetching.remove(id);
            }
        }
    }

    /** A download kept for the deck and the fit (the last few songs), else deleted. */
    static void keep(Context c, String id, File download) {
        if (!keeps()) {
            //noinspection ResultOfMethodCallIgnored
            download.delete();
            return;
        }
        File d = dir(c);
        //noinspection ResultOfMethodCallIgnored
        d.mkdirs();
        String n = download.getName();
        File to = new File(d, id + n.substring(n.lastIndexOf('.')));
        if (!download.equals(to) && !download.renameTo(to)) {
            //noinspection ResultOfMethodCallIgnored
            download.delete();
            return;
        }
        File[] all = d.listFiles();
        if (all == null) return;
        Arrays.sort(all, (x, y) -> Long.compare(y.lastModified(), x.lastModified()));
        StreamDeck cur = current;
        for (int i = KEEP_FILES; i < all.length; i++)
            if (cur == null || !all[i].equals(cur.file)) //noinspection ResultOfMethodCallIgnored
                all[i].delete();
    }

    static File fileOf(Context c, String id) {
        for (String ext : new String[]{".webm", ".m4a"}) {
            File f = new File(dir(c), id + ext);
            if (f.length() > 0) return f;
        }
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // From the engine (main thread)

    /** The deck for the incoming song, lining up silently on [player]; null without its audio. */
    static StreamDeck follow(Context c, String id, Object player) {
        if (!on() || c == null) return null;
        File f = fileOf(c, id);
        if (f == null) {
            Log.i(TAG, "stream deck: no copy of " + id + "'s audio, YT plays it on after the mix");
            return null;
        }
        if (current != null) current.handBack("another song's deck");
        StreamDeck d = new StreamDeck(id, player, f);
        current = d;
        //noinspection ResultOfMethodCallIgnored
        f.setLastModified(System.currentTimeMillis());
        d.start();
        return d;
    }

    /** The deck now playing the song in YT's place (YT's player muted), or null. */
    static StreamDeck audible() {
        StreamDeck d = current;
        return d != null && "following".equals(d.state) && !Double.isNaN(d.takeAt) ? d : null;
    }

    /** The gate: YT's player stays silent while a deck plays its song. */
    static boolean mutes(Object player) {
        StreamDeck d = current;
        return d != null && d.player == player && "following".equals(d.state) && !Double.isNaN(d.takeAt);
    }

    /** The mix set YT's speed for [player]'s song: the deck lines up only once it is near x1.0 again (nudges under 2% are ridden out). */
    static void ytSpeed(Object player, float s) {
        StreamDeck d = current;
        if (d != null && d.player == player) d.ytSpeed = s;
    }

    /** In step with YT now (a takeover can be set). */
    boolean inStep() {
        return "following".equals(state) && inStep;
    }

    /** The deck is heard from song second [at] on (YT's player stays muted). */
    void takeAt(double at) {
        clockShift = 0;
        heardSince = SystemClock.elapsedRealtime();
        takeAt = at;
        Log.i(TAG, String.format(Locale.US, "stream deck: takes over at %.3f s (last error %+.0f ms)", at, lastErr * 1000));
    }

    /** The next mix takes over from song second [at]: the deck fades out there. */
    void release(double at) {
        if (!"following".equals(state)) return;
        releaseAt = at;
        state = "released";
        Log.i(TAG, String.format(Locale.US, "stream deck: released at %.3f s for the next mix (max error %.0f ms)", at, maxErr * 1000));
        main.postDelayed(this::close, 3000);
        if (current == this) current = null;
    }

    /** The mix it was released for ended before its takeover: fade out from what is heard now. */
    void cancelRelease() {
        if (!"released".equals(state)) return;
        double now = heardSec();
        releaseAt = Double.isNaN(now) ? 0 : now;
        Log.i(TAG, "stream deck: the mix it was released for ended: fades out now");
    }

    /** Fades out at once and gives YT's player its volume back. */
    void handBack(String why) {
        if (!"following".equals(state) && !"loading".equals(state)) return;
        boolean was = !Double.isNaN(takeAt);
        state = "handed-back";
        if (current == this) current = null;
        // the writer fades out from what is heard now
        double now = heardSec();
        releaseAt = Double.isNaN(now) ? 0 : now;
        if (was) Engine.restoreVolume(player);
        Log.i(TAG, "stream deck: handed back to YT: " + why + (was ? "" : " (it was not heard yet)"));
        main.postDelayed(this::close, 300);
    }

    // ---------------------------------------------------------------------------------------------
    // The servo (main thread)

    private void start() {
        askedAt = SystemClock.elapsedRealtime();
        long p = Automix.position(player);
        seekTo.set(Math.max(0, p / 1000.0 + startLag));
        thread = new Thread(this::run, "Automix-deck");
        thread.setPriority(Thread.MAX_PRIORITY);
        thread.start();
        main.postDelayed(this::tick, SERVO_MS);
    }

    private long lastYt = -1, lastYtAt;

    private void tick() {
        if (!"following".equals(state) && !"loading".equals(state)) return;
        main.postDelayed(this::tick, SERVO_MS);
        long now = SystemClock.elapsedRealtime();
        // switched off: Automix stops reading the queue, so the song check below would go stale
        if (!Automix.enabled()) {
            handBack("automix switched off");
            return;
        }
        if (!id.equals(Automix.currentId()) && Automix.currentId() != null && !id.equals(Automix.nextIdNow())) {
            handBack("the song is gone");
            return;
        }
        long p = Automix.position(player);
        if (p < 0) {
            handBack("YT's player is gone");
            return;
        }
        // YT's time standing still: paused, buffering or seeking; the deck waits with it
        boolean ytPlaying = p != lastYt || now - lastYtAt < 120;
        if (p != lastYt) {
            lastYt = p;
            lastYtAt = now;
        }
        paused = !ytPlaying;
        level = Engine.ytVolume(player);
        if (!ready || paused) {
            if (!ready && now - askedAt > START_TIMEOUT_MS) handBack("the deck never started");
            return;
        }
        // YT sped up or slowed for the mix: the deck (at x1.0) drifts off, so it waits for the glide
        // to end; its start timeout counts from x1.0 (pair 5, 2026-11-17: x1.191 handed it back mid-glide)
        if (Math.abs(ytSpeed - 1) > 0.02 && Double.isNaN(takeAt)) {
            askedAt = now;
            inStep = false;
            recentN = 0;
            return;
        }
        double heard = heardSec();
        if (Double.isNaN(heard) || !Double.isNaN(seekTo.get())) return;
        if (logClocks && !Double.isNaN(takeAt) && Math.abs(heard - takeAt) < 2.5) logClocks(heard, p, now);
        double err = heard - p / 1000.0 - clockShift, abs = Math.abs(err);
        if (abs > SEEK_ERROR && abs < 0.3 && !Double.isNaN(takeAt) && clockShift == 0 && now - heardSince < 1500) {
            clockShift = err;
            recentN = 0;
            Log.i(TAG, String.format(Locale.US, "stream deck: YT's clock stepped %+.0f ms as it went quiet: kept as an offset", err * 1000));
            return;
        }
        lastErr = err;
        if (abs > SEEK_ERROR) {
            seek(p / 1000.0, now);
            return;
        }
        recent[recentN++ % 3] = err;
        if (recentN < 3) return;
        double[] r = recent.clone();
        Arrays.sort(r);
        double m = r[1], absM = Math.abs(m);
        if (Double.isNaN(takeAt)) {
            // silent: line up (seeks that learn the start lag), then report in step
            if (absM < LOCK) {
                if (!inStep) Log.i(TAG, String.format(Locale.US, "stream deck: in step with YT (%+.0f ms)", m * 1000));
                inStep = true;
                trim = 0;
                if (retake) {
                    retake = false;
                    takeAt(p / 1000.0 + 0.3);
                    main.postDelayed(() -> {
                        if (mutes(player)) Engine.setVolume(player, 0f);
                    }, 300);
                }
            } else if (absM > DEADBAND) {
                // silent, so a seek costs nothing: the mix's speed nudges move YT far faster than a
                // trim of 1 frame in 333 could follow (2026-11-17: x0.920 nudges, never in step).
                // The first few also learn the start lag.
                if (alignSeeks < 4) startLag = Math.max(0, Math.min(0.3, startLag - m));
                alignSeeks++;
                inStep = false;
                recentN = 0;
                seekTo.set(p / 1000.0 + startLag);
            } else {
                inStep = true;
                trim = m > 0 ? -1 : 1;
            }
            // no timeout here: the mix decides at its handover (it waits up to 3 s for the deck to be in step)
            return;
        }
        maxErr = Math.max(maxErr, abs);
        if (absM > DEADBAND) trimming = true;
        else if (absM < LOCK) trimming = false;
        trim = trimming ? (m > 0 ? -1 : 1) : 0;
    }

    private void seek(double pos, long now) {
        // silent (the mix seeks and nudges YT's player as it lines it up): as often as needed, twice a second at most
        if (Double.isNaN(takeAt)) {
            if (now - lastSilentSeek < 500) return;
            lastSilentSeek = now;
            recentN = 0;
            trim = 0;
            seekTo.set(pos + startLag);
            return;
        }
        int n = 0;
        for (int i = 0; i < Math.min(seekN, seekTimes.length); i++) if (now - seekTimes[i] < 10_000) n++;
        seekTimes[seekN++ % seekTimes.length] = now;
        if (n >= MAX_SEEKS_PER_10S) {
            handBack("it kept losing its place");
            return;
        }
        recentN = 0;
        trimming = false;
        trim = 0;
        if (!Double.isNaN(takeAt)) {
            // YT plays while the deck lines up again silently (a seek by the listener)
            takeAt = Double.NaN;
            clockShift = 0;
            inStep = false;
            askedAt = now;
            Engine.restoreVolume(player);
            Log.i(TAG, String.format(Locale.US, "stream deck: off by %.0f ms (a seek?): YT plays while it lines up again", lastErr * 1000));
            retake = true;
        }
        seekTo.set(pos + startLag);
    }

    private final boolean logClocks = clockLog();
    private long lastYtLogged = -1, lastYtLoggedAt, lastFrame = -1, lastFrameNs;

    /**
     * The two clocks apart, each tick within 2.5 s of the takeover: the deck's AudioTrack timestamp
     * (framePosition at nanoTime; its rate against real time) and YT's position at elapsedRealtime
     * (its rate too). The one that jumps by the 120-180 ms step is the one that moved.
     */
    private void logClocks(double heard, long p, long now) {
        try {
            logClocksNow(heard, p, now);
        } catch (IllegalStateException ignored) {
            // the deck's thread freed the track meanwhile
        }
    }

    private void logClocksNow(double heard, long p, long now) {
        AudioTrack t = track;
        AudioTimestamp ts = new AudioTimestamp();
        boolean got = t != null && t.getTimestamp(ts);
        String deck = "no timestamp";
        if (got) {
            double dRate = lastFrame < 0 || ts.nanoTime == lastFrameNs ? Double.NaN
                    : (ts.framePosition - lastFrame) / (double) rate / ((ts.nanoTime - lastFrameNs) / 1e9);
            deck = String.format(Locale.US, "frame %d @ %.3f s (x%.3f, underruns %d, head %d)", ts.framePosition, ts.nanoTime / 1e9, dRate,
                    android.os.Build.VERSION.SDK_INT >= 24 ? t.getUnderrunCount() : -1, t.getPlaybackHeadPosition());
            lastFrame = ts.framePosition;
            lastFrameNs = ts.nanoTime;
        }
        double yRate = lastYtLogged < 0 || now == lastYtLoggedAt ? Double.NaN : (p - lastYtLogged) / (double) (now - lastYtLoggedAt);
        lastYtLogged = p;
        lastYtLoggedAt = now;
        Log.i(TAG, String.format(Locale.US, "deck clocks: %+.3f s from takeover | deck %s heard %.3f | YT %d ms @ %d (x%.3f) | err %+.0f ms",
                heard - takeAt, deck, heard, p, now, yRate, (heard - p / 1000.0) * 1000));
    }

    /** The song second heard now, or NaN. */
    private double heardSec() {
        AudioTrack t = track;
        if (t == null || rate == 0) return Double.NaN;
        AudioTimestamp ts = new AudioTimestamp();
        double frame;
        try {
            // the deck's thread may free the track meanwhile (StreamDeck.run)
            if (t.getTimestamp(ts)) frame = ts.framePosition + (System.nanoTime() - ts.nanoTime) * rate / 1e9;
            else frame = t.getPlaybackHeadPosition();
        } catch (IllegalStateException e) {
            return Double.NaN;
        }
        synchronized (markLock) {
            if (marks == 0) return Double.NaN;
            int n = Math.min(marks, markFrame.length);
            for (int k = 0; k < n; k++) {
                int i = (marks - 1 - k) % markFrame.length;
                if (markFrame[i] <= frame) return markSec[i] + (frame - markFrame[i]) / rate;
            }
            return Double.NaN;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Decoding and writing (its own thread)

    private void run() {
        MediaExtractor ex = new MediaExtractor();
        MediaCodec codec = null;
        try {
            ex.setDataSource(file.getAbsolutePath());
            int ti = -1;
            for (int i = 0; i < ex.getTrackCount() && ti < 0; i++) {
                String mime = ex.getTrackFormat(i).getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) ti = i;
            }
            if (ti < 0) throw new Exception("no audio track");
            ex.selectTrack(ti);
            MediaFormat fmt = ex.getTrackFormat(ti);
            rate = fmt.getInteger(MediaFormat.KEY_SAMPLE_RATE);
            int ch = fmt.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
            if (ch <= 0) throw new Exception(ch + " channels");
            boolean floatPcm = false;
            codec = MediaCodec.createDecoderByType(fmt.getString(MediaFormat.KEY_MIME));
            codec.configure(fmt, null, null, 0);
            codec.start();
            int min = AudioTrack.getMinBufferSize(rate, AudioFormat.CHANNEL_OUT_STEREO, AudioFormat.ENCODING_PCM_FLOAT);
            track = new AudioTrack.Builder()
                    .setAudioAttributes(new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_MEDIA)
                            .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC).build())
                    .setAudioFormat(new AudioFormat.Builder().setEncoding(AudioFormat.ENCODING_PCM_FLOAT).setSampleRate(rate)
                            .setChannelMask(AudioFormat.CHANNEL_OUT_STEREO).build())
                    .setBufferSizeInBytes(Math.max(min, 4096 * 8))
                    .setTransferMode(AudioTrack.MODE_STREAM)
                    .build();
            try {
                app.ayham.extension.music.features.EqPresets.attachDeck(track, track.getAudioSessionId());
            } catch (Throwable ignored) {
            }
            track.play();
            ready = true;
            if ("loading".equals(state)) state = "following";
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            float[] out = new float[8192 * 2];
            double gain = 0, skipUntil = -1;
            boolean inputDone = false, trackPaused = false;
            int sinceTrim = 0;
            while (!"closed".equals(state)) {
                Double asked = seekTo.get();
                double want = asked;
                if (!Double.isNaN(want)) {
                    ex.seekTo((long) (want * 1e6), MediaExtractor.SEEK_TO_PREVIOUS_SYNC);
                    codec.flush();
                    inputDone = false;
                    track.pause();
                    track.flush();
                    synchronized (markLock) {
                        marks = 0;
                        written = 0;
                    }
                    skipUntil = want;
                    // a newer seek asked during this one stays for the next turn
                    seekTo.compareAndSet(asked, Double.NaN);
                    if (!paused) track.play();
                }
                if (paused) {
                    if (!trackPaused) {
                        track.pause();
                        trackPaused = true;
                    }
                    SystemClock.sleep(10);
                    continue;
                }
                if (trackPaused) {
                    track.play();
                    trackPaused = false;
                }
                if (!inputDone) {
                    int in = codec.dequeueInputBuffer(5000);
                    if (in >= 0) {
                        ByteBuffer b = codec.getInputBuffer(in);
                        int n = b == null ? -1 : ex.readSampleData(b, 0);
                        if (n < 0) {
                            codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inputDone = true;
                        } else {
                            codec.queueInputBuffer(in, 0, n, ex.getSampleTime(), 0);
                            ex.advance();
                        }
                    }
                }
                int o = codec.dequeueOutputBuffer(info, 5000);
                if (o == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    MediaFormat f = codec.getOutputFormat();
                    if (f.containsKey(MediaFormat.KEY_SAMPLE_RATE) && f.getInteger(MediaFormat.KEY_SAMPLE_RATE) != rate) {
                        // HE-AAC: the decoder's rate is not the container's; the deck's track and clock were built on it
                        int r = f.getInteger(MediaFormat.KEY_SAMPLE_RATE), was = rate;
                        main.post(() -> handBack("the deck's audio decodes at " + r + " Hz, not " + was + " Hz"));
                        break;
                    }
                    if (f.containsKey(MediaFormat.KEY_CHANNEL_COUNT) && f.getInteger(MediaFormat.KEY_CHANNEL_COUNT) > 0)
                        ch = f.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                    floatPcm = f.containsKey(MediaFormat.KEY_PCM_ENCODING) && f.getInteger(MediaFormat.KEY_PCM_ENCODING) == AudioFormat.ENCODING_PCM_FLOAT;
                    continue;
                }
                if (o < 0) continue;
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                    codec.releaseOutputBuffer(o, false);
                    main.post(() -> handBack("the deck's audio ended"));
                    break;
                }
                ByteBuffer ob = codec.getOutputBuffer(o);
                if (ob == null || info.size == 0) {
                    codec.releaseOutputBuffer(o, false);
                    continue;
                }
                ob.position(info.offset).limit(info.offset + info.size);
                ob.order(ByteOrder.nativeOrder());
                java.nio.ShortBuffer sb = floatPcm ? null : ob.asShortBuffer();
                java.nio.FloatBuffer fb = floatPcm ? ob.asFloatBuffer() : null;
                int frames = (floatPcm ? fb.remaining() : sb.remaining()) / ch;
                double t0 = info.presentationTimeUs / 1e6;
                int k = 0;
                if (out.length < (frames + frames / TRIM_EVERY + 2) * 2) out = new float[(frames + frames / TRIM_EVERY + 2) * 2];
                double firstSec = Double.NaN;
                double tk = takeAt, rl = releaseAt;
                float lv = level;
                for (int i = 0; i < frames; i++) {
                    double t = t0 + i / (double) rate;
                    if (t < skipUntil) continue;
                    if (Double.isNaN(firstSec)) firstSec = t;
                    float l = floatPcm ? fb.get(i * ch) : sb.get(i * ch) / 32768f;
                    float r = ch < 2 ? l : floatPcm ? fb.get(i * ch + 1) : sb.get(i * ch + 1) / 32768f;
                    // held to ±1 before its level, as YT holds a song (a lossy file's overs)
                    l = Float.isFinite(l) ? Math.max(-1f, Math.min(1f, l)) : 0f;
                    r = Float.isFinite(r) ? Math.max(-1f, Math.min(1f, r)) : 0f;
                    // heard from takeAt, faded out from releaseAt, both in song seconds
                    double g = Double.isNaN(tk) || t < tk ? 0 : Math.min(1, (t - tk) / FADE);
                    if (!Double.isNaN(rl)) g *= Math.max(0, 1 - (t - rl) / FADE);
                    gain += (g * lv - gain) * 0.02;
                    int tr = trim;
                    if (tr != 0 && ++sinceTrim >= TRIM_EVERY) {
                        sinceTrim = 0;
                        if (tr < 0) continue; // dropped: the deck catches up
                        out[k++] = (float) (l * gain);
                        out[k++] = (float) (r * gain); // repeated: the deck waits
                    }
                    out[k++] = (float) (l * gain);
                    out[k++] = (float) (r * gain);
                }
                codec.releaseOutputBuffer(o, false);
                if (k == 0) continue;
                synchronized (markLock) {
                    int i = marks % markFrame.length;
                    markFrame[i] = written;
                    markSec[i] = firstSec;
                    marks++;
                    written += k / 2;
                }
                track.write(out, 0, k, AudioTrack.WRITE_BLOCKING);
                if (!Double.isNaN(rl) && firstSec > rl + FADE + 0.2) break; // released: faded out
            }
        } catch (Throwable t) {
            Log.w(TAG, "stream deck failed", t);
            main.post(() -> handBack("the deck could not play the audio (" + t.getMessage() + ")"));
        } finally {
            ex.release();
            if (codec != null) {
                try {
                    codec.stop();
                } catch (Throwable ignored) {
                }
                codec.release();
            }
            // the track is always freed here, on the deck's own thread, never under a write: once
            // close() has come (what it holds has played out by then), or after CLOSE_WAIT_MS
            AudioTrack t;
            synchronized (trackLock) {
                runEnded = true;
                long until = SystemClock.elapsedRealtime() + CLOSE_WAIT_MS;
                long left;
                while (!"closed".equals(state) && (left = until - SystemClock.elapsedRealtime()) > 0) {
                    try {
                        trackLock.wait(left);
                    } catch (InterruptedException e) {
                        break;
                    }
                }
                t = track;
                track = null;
            }
            releaseTrack(t);
        }
    }

    /** How long a deck whose decoding has ended waits for close() before it frees its track itself. */
    private static final long CLOSE_WAIT_MS = 5000;

    /** Stops and frees a deck's track, and the preset's equalizer on its session. */
    private static void releaseTrack(AudioTrack t) {
        if (t == null) return;
        app.ayham.extension.music.features.EqPresets.releaseDeck(t);
        try {
            t.pause();
            t.flush();
            t.release();
        } catch (Throwable ignored) {
        }
    }

    private void close() {
        String was = state;
        synchronized (trackLock) {
            state = "closed";
            // the writer leaves its loop on "closed" and frees the track itself, on its thread
            trackLock.notifyAll();
        }
        if (!"released".equals(was) && !"handed-back".equals(was) && current == this) current = null;
    }
}
