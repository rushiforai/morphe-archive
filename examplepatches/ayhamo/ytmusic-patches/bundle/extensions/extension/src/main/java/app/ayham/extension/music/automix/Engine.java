package app.ayham.extension.music.automix;

import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioTimestamp;
import android.media.AudioTrack;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;

import com.music.bitchord.playback.loopmix.LoopMixRenderer;
import com.music.bitchord.playback.smart.MelSpectrogram;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import app.ayham.extension.music.features.SeekAccess;
import app.ayham.extension.music.features.PlayerTap;

/**
 * Plays a {@link Mix}: BitChord's loop-mix renderer (Signalsmith Stretch, beat knots) for each deck,
 * one renderer per deck so each gets its own filters (the extension's: gain, 250 Hz shelf, 4 kHz
 * shelf, high-pass, low-pass, in Java), summed into our own AudioTrack.
 *
 * <p>The deck runs on YT's clock (YT's position against our track's timestamps). At mix 0 YT's
 * player is silenced through a gate on ExoPlayer.setVolume and our deck carries the outgoing song;
 * YT is asked for the next song at [askAt]; its player, held silent, is seeked and nudged onto the
 * incoming deck's timeline and takes over (the deck fading in 25 ms at the same song position) once
 * it is in time, from [elementAt] on.
 */
final class Engine {
    private static final String TAG = Automix.TAG;
    static final int SR = 48000;
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final int BLOCK = 512, CONTROL = 64;

    // ---- the volume gate (patched into ExoPlayer.setVolume) ----
    static volatile boolean holding;
    static volatile Object released;
    /** The song the listener skipped to during a mix: silent, whoever sets its volume, until the deck's fade is heard (bringInSkipped). */
    static volatile Object skipMuted;

    /** The volume YT (or Morphe) last asked each player for, not counting ours: its loudness level. */
    private static final java.util.Map<Object, Float> ytAsked = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    /**
     * Set while our own setVolume runs on this thread: the gate runs inside it (at the start of
     * ExoPlayer.setVolume, on the same thread), so YT's own calls from another thread meanwhile still count.
     */
    private static final ThreadLocal<boolean[]> selfCall = new ThreadLocal<boolean[]>() {
        @Override
        protected boolean[] initialValue() {
            return new boolean[1];
        }
    };

    static float ytVolume(Object player) {
        Float v = player == null ? null : ytAsked.get(player);
        // as heard: ExoPlayer clamps to 0..1
        return v == null ? 1f : Math.max(0f, Math.min(1f, v));
    }

    /** Each player's last setVolume and what the gate gave it before the addon's share. */
    private static final java.util.Map<Object, Float> gateIn = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>()),
            gateOut = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>()),
            speeds = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    /** Each held player's running speed nudge: when it ends (elapsedRealtime). */
    private static final java.util.Map<Object, Long> nudgeEnds = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());

    /** A speed nudge of automix's runs on this player now (the addon's held player reads no lock meanwhile). */
    static boolean nudging(Object player) {
        Long end = nudgeEnds.get(player);
        return end != null && SystemClock.elapsedRealtime() < end;
    }

    static float gate(Object player, float volume) {
        if (player != null && app.ayham.extension.music.features.PlayerTap.isOurs(player)) return volume; // our addon player
        if (player != null && !selfCall.get()[0]) ytAsked.put(player, volume);
        float v;
        // the stream deck plays this song: YT's player stays silent under it
        if (player != null && StreamDeck.mutes(player)) v = 0f;
        else if (player != null && player == skipMuted) v = 0f;
        else if (!holding) v = volume;
        else v = player == released ? volume : 0f;
        // ExoPlayer clamps a volume to 0..1 (YT asks for more, e.g. 4.4): clamped here, so the addon's
        // share turns YT down from the start of a fade and ours follows what is really heard
        v = Math.max(0f, Math.min(1f, v));
        if (player == null) return v;
        gateIn.put(player, volume);
        gateOut.put(player, v);
        // the addon plays this song (Direct): YT's player is turned down by its share, ours follows v
        AddonDirect.onGate(player, v);
        return v * (1 - AddonDirect.share(player));
    }

    /** What the gate gives the player before the addon's share (YT's volume when never set). */
    static float gateOut(Object player) {
        Float v = gateOut.get(player);
        return v == null ? ytVolume(player) : v;
    }

    /** The player's last volume set again, through the gate (the addon's share changed). */
    static void reapply(Object player) {
        Float v = gateIn.get(player);
        setVolume(player, v == null ? ytVolume(player) : v);
    }

    /** The speed automix last gave YT's player (1 when none). */
    static float speedOf(Object player) {
        Float s = speeds.get(player);
        return s == null ? 1f : s;
    }

    interface Listener {
        void onMixStarted(Engine e);

        void onFinished(Engine e, boolean ok, String why);
    }

    final Mix m;
    private final Listener listener;
    private long hOut, hIn;
    private long firstFrame;
    private double inRegionEnd; // song seconds the incoming deck has audio for
    private double deadline;    // the last mix second the incoming deck has audio for (less a margin)
    private volatile boolean renderDone;
    private final Biquad[] fOut = chain(), fIn = chain();

    Object outPlayer, inPlayer;
    private AudioTrack track;
    private volatile long offsetFrames = Long.MIN_VALUE;
    private volatile boolean stop;
    /** The track stood still (rule 4 watchdog): no silence tail, its writes can't return. */
    private volatile boolean stalled;
    private volatile long written;
    private volatile double fadeFrom = Double.NaN, fadeLen; // master fade (abort / another song)
    /**
     * A forced hand-over with YT (or the addon's player) not lined up with the deck: an equal-power
     * crossfade this long instead of the 25 ms splice, which played the misalignment as a jump
     * (phone, 2026-11-18: 116 ms skipped after YT's next player stalled 10 s).
     */
    static final double SOFT_SEC = 0.25;
    private volatile double softFrom = Double.NaN;
    /**
     * The crossfade is to YT's player lined up with the deck (the same stream within a few ms): equal
     * gain, which sums those to a flat level, where equal power would bump it +3 dB mid-way. Onto
     * the addon's player (another copy) it is equal power.
     */
    private volatile boolean softLinear;

    /** The deck's share [t] of the way through the crossfade (0..1): a cosine, or linear when lined up. */
    static float softOut(double t, boolean linear) {
        t = Math.max(0, Math.min(1, t));
        return (float) (linear ? 1 - t : Math.cos(Math.PI / 2 * t));
    }

    /** The player's share: a sine, or linear when lined up (the two always sum to 1 then). */
    static float softIn(double t, boolean linear) {
        t = Math.max(0, Math.min(1, t));
        return (float) (linear ? t : Math.sin(Math.PI / 2 * t));
    }
    private boolean softRamp;
    private final List<Double> offsets = new ArrayList<>();
    private boolean started, toasted;
    // read by Automix outside the control loop too
    private volatile boolean tookOver, asked, handedOver, finished;
    /** The track's output latency read over the silent pre-roll (outputLatency), and what the takeover uses. */
    private final List<Double> latencyReads = new ArrayList<>();
    private double takeoverLatency = Double.NaN;
    /** The incoming deck's fade-out (song seconds) asked for by control(), set by the render thread. */
    private volatile double inFadeOutAt = Double.NaN;
    /** When the master fade was asked for (uptimeMillis). */
    private long fadeSetAt;
    private double handoverAt = Double.NaN;
    private long lead = 260;
    private int seeks, nudges;
    private boolean steady;
    private long lastErr = Long.MIN_VALUE;
    private boolean aligned;
    private final StringBuilder alignLog = new StringBuilder();
    private long settleUntil, nudgeUntil, lastP = -1, lastAt;
    /** When align last changed YT's speed (elapsedRealtime). */
    private long speedSetAt;
    private float nudge = 1, setSpeed = 1;
    private final List<Long> errs = new ArrayList<>();
    private long lastSeekCheck;
    private String inIdSeen;
    /** The incoming song's stream deck (lining up silently during the mix), and whether it took the handover. */
    private StreamDeck deck;
    private boolean deckTook, deckReleased;
    /** The outgoing song's deck, let go for this mix's takeover. */
    private StreamDeck releasedDeck;
    /** The next song plays from an addon: its player takes the handover. */
    private boolean addonIn;

    /** A deck's chain: bass shelf, high shelf, high-pass, low-pass, and the 1 kHz band (editor.md §12, run only when a curve moves it). */
    private static Biquad[] chain() {
        return new Biquad[]{new Biquad(Biquad.LOWSHELF, SR, 250), new Biquad(Biquad.HIGHSHELF, SR, 4000),
                new Biquad(Biquad.HIGHPASS, SR, 0), new Biquad(Biquad.LOWPASS, SR, 0), new Biquad(Biquad.PEAKING, SR, 1000, 0.7)};
    }

    private Engine(Mix m, Listener listener) {
        this.m = m;
        this.listener = listener;
        Planner.Plan p = m.plan;
        echo = p != null && "echo".equals(p.shape) && p.echo != null && p.echo.delaySec > 0 && p.echo.delaySec <= 2 ? new EchoLine(p.echo, m.t0) : null;
        fx = m.fx || m.noise ? new FxBus(m, BLOCK, CONTROL) : null;
    }

    /** The Effects returns and the noise (editor.md §12), or null when the mix has none. */
    private final FxBus fx;
    private final float[] fxOut = new float[BLOCK * 2];

    // ---------------------------------------------------------------------------------------------
    // Building (background thread)

    private static final class Region {
        float[] left, right;
        double start;

        double end() {
            return start + left.length / (double) SR;
        }
    }

    private static Region region(Analyzer.Pcm pcm, double from, double to) throws Exception {
        long a = Math.max(pcm.firstFrame, (long) Math.floor(from * pcm.rate));
        float[][] lr = pcm.read(from, to);
        Region r = new Region();
        r.start = a / (double) pcm.rate;
        if (pcm.rate != SR) {
            r.left = MelSpectrogram.nativeResample(lr[0], pcm.rate, SR);
            r.right = MelSpectrogram.nativeResample(lr[1], pcm.rate, SR);
        } else {
            r.left = lr[0];
            r.right = lr[1];
        }
        return r;
    }

    /** The decks loaded and the renderers ready; null (logged) when the decoded audio doesn't cover the mix. */
    static Engine build(Context ctx, Mix m, Listener listener) {
        long hOut = 0, hIn = 0;
        try {
            Models.loadNative();
            Analyzer.Pcm outPcm = Analyzer.tail(ctx, m.outId), inPcm = Analyzer.head(ctx, m.inId);
            // a song heard from an addon (or about to be) is mixed from the addon's audio, so the
            // takeover and the handover don't change the sound
            Analyzer.Pcm ao = AddonDirect.audibleFor(m.outId) ? AddonPcm.tail(ctx, m.outId) : null;
            Analyzer.Pcm ai = app.ayham.extension.music.addons.AddonSettings.on() && app.ayham.extension.music.addons.AddonPrep.get(m.inId) != null
                    ? AddonPcm.head(ctx, m.inId) : null;
            if (ao != null) outPcm = ao;
            if (ai != null) inPcm = ai;
            if (ao != null || ai != null)
                Log.i(TAG, "mix decks: " + (ao != null ? "addon" : "YouTube") + " audio out, " + (ai != null ? "addon" : "YouTube") + " audio in");
            if (outPcm == null || inPcm == null) {
                Log.w(TAG, "mix not built: decoded audio missing");
                return null;
            }
            if (m.out.needFrom < outPcm.start() - 0.01) {
                Log.w(TAG, String.format(Locale.US, "mix not built: the playing song is decoded from %.1f s, the mix needs it from %.1f s", outPcm.start(), m.out.needFrom));
                return null;
            }
            Region ro = region(outPcm, m.out.needFrom, m.out.needTo);
            Region ri = region(inPcm, Math.max(0, m.in.needFrom), m.in.needTo);
            Engine e = new Engine(m, listener);
            e.inRegionEnd = ri.end();
            if (m.in.trackAt(m.elementAt) + 2 > e.inRegionEnd) {
                Log.w(TAG, String.format(Locale.US, "mix not built: the next song is decoded to %.1f s, its player takes over at %.1f s", e.inRegionEnd, m.in.trackAt(m.elementAt)));
                return null;
            }
            double t = m.elementAt;
            while (m.in.trackAt(t) < e.inRegionEnd - 2 && t < m.elementAt + 120) t += 0.25;
            e.deadline = t;
            hOut = deck(LoopMixRenderer.OUT, m.out, ro);
            hIn = deck(LoopMixRenderer.IN, m.in, ri);
            e.firstFrame = Math.min(LoopMixRenderer.nativeFirstFrame(hOut), LoopMixRenderer.nativeFirstFrame(hIn));
            e.hOut = hOut;
            e.hIn = hIn;
            return e;
        } catch (Throwable t) {
            Log.e(TAG, "mix not built", t);
            // a renderer made before the failure holds native audio and stretch state: freed here
            if (hOut != 0) LoopMixRenderer.nativeDestroy(hOut);
            if (hIn != 0) LoopMixRenderer.nativeDestroy(hIn);
            return null;
        }
    }

    private static long deck(int index, Mix.Deck d, Region r) {
        long h = LoopMixRenderer.nativeCreate(SR);
        try {
            setDeck(h, index, d, r);
        } catch (Throwable t) {
            LoopMixRenderer.nativeDestroy(h);
            throw t;
        }
        return h;
    }

    private static void setDeck(long h, int index, Mix.Deck d, Region r) {
        int n = d.knotT.length;
        double[] kf = new double[n], kp = new double[n];
        for (int k = 0; k < n; k++) {
            kf[k] = d.knotT[k] * SR;
            kp[k] = (d.knotP[k] - r.start) * SR;
        }
        boolean loop = d.loopB > d.loopA;
        LoopMixRenderer.nativeSetDeck(h, index, r.left, r.right, r.start,
                loop ? Math.round((d.loopA - r.start) * SR) : 0, loop ? Math.round((d.loopB - r.start) * SR) : 0,
                loop && d.release < 1e17 ? (d.release - r.start) * SR : (loop ? 1e18 : 0), kf, kp, d.runOn, d.stopAt, 0.4, 1f);
        LoopMixRenderer.nativePrepare(h);
    }

    // ---------------------------------------------------------------------------------------------
    // Playback (main thread)

    /** Waits for the takeover: starts the engine ~3 s before it, while YT's player plays the song. */
    void arm(Object player) {
        outPlayer = player;
        long at = Math.round(m.takeoverSong * 1000);
        main.post(new Runnable() {
            @Override
            public void run() {
                if (stop) return;
                if (!Automix.enabled()) {
                    finish(false, "automix was switched off before the mix");
                    return;
                }
                // another song plays (opened, skipped to, picked from the queue): this mix is let go, or it
                // waited for a takeover point that never comes and Automix planned nothing (phone, 2026-11-24)
                String playing = Automix.currentId();
                if (playing != null && !m.outId.equals(playing)) {
                    finish(false, "the playing song changed before the mix");
                    return;
                }
                long now = Automix.position(outPlayer);
                if (now >= at - 3000 && now < at - 600) {
                    start();
                    return;
                }
                if (now >= at - 600) {
                    finish(false, "the takeover point passed before the engine was up (" + now + " ms)");
                    return;
                }
                main.postDelayed(this, 50);
            }
        });
    }

    private long startedAt;

    private void start() {
        started = true;
        startedAt = android.os.SystemClock.uptimeMillis();
        try {
            startDecks();
        } catch (Throwable t) {
            // no audio track (the track limit, a dead audio server): no mix, YT plays on
            Log.e(TAG, "mix engine could not start", t);
            if (track != null) {
                try {
                    app.ayham.extension.music.features.EqPresets.releaseDeck(track);
                    track.release();
                } catch (Throwable ignored) {
                }
                track = null;
            }
            started = false;
            finish(false, "the audio track could not start: " + t);
        }
    }

    private void startDecks() {
        int min = AudioTrack.getMinBufferSize(SR, AudioFormat.CHANNEL_OUT_STEREO, AudioFormat.ENCODING_PCM_FLOAT);
        track = new AudioTrack.Builder()
                .setAudioAttributes(new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_MEDIA)
                        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC).build())
                .setAudioFormat(new AudioFormat.Builder().setEncoding(AudioFormat.ENCODING_PCM_FLOAT).setSampleRate(SR)
                        .setChannelMask(AudioFormat.CHANNEL_OUT_STEREO).build())
                .setBufferSizeInBytes(Math.max(min, 8192 * 8))
                .setTransferMode(AudioTrack.MODE_STREAM)
                .build();
        // the user's equalizer preset on the decks too, so the takeover doesn't change the sound
        try {
            app.ayham.extension.music.features.EqPresets.attachDeck(track, track.getAudioSessionId());
        } catch (Throwable t) {
            Log.w(TAG, "equalizer not on the decks", t);
        }
        track.play();
        Thread render = new Thread(this::renderLoop, "Automix-render");
        render.setPriority(Thread.MAX_PRIORITY);
        render.start();
        main.post(new Runnable() {
            @Override
            public void run() {
                if (stop) return;
                try {
                    control();
                } catch (Throwable t) {
                    Log.e(TAG, "mix control failed", t);
                    finish(false, "control failed: " + t);
                }
                if (!stop) main.postDelayed(this, 5);
            }
        });
    }

    /**
     * Each deck plays at the volume YT asks of its player (YT's loudness normalisation goes through
     * ExoPlayer.setVolume, so the gate sees it), the extension's level match: the takeover and the
     * handover splice at YT's own level. The incoming deck plays at 1 until YT's next player
     * shows its volume, then glides there (~0.3 s).
     */
    private volatile float levelOutTarget = 1, levelInTarget = 1;
    private final YtFadeIn inFade = new YtFadeIn();
    private float levelOut = Float.NaN, levelIn = Float.NaN;
    private static final float LEVEL_GLIDE = (float) (1 - Math.exp(-1 / (0.3 * SR)));

    /** The echo out's delay line on the outgoing deck (Planner.echoOut; editor.md §5), or null. */
    private final EchoLine echo;

    /**
     * crossfade.js's echo: the beat before the catch (mix time t0) is fed to a delay of one beat
     * with feedback, after the deck's fader (which cuts the dry sound on the catch), so the echo
     * rings on under the next song; it fades out over the mix's last 50 ms.
     */
    static final class EchoLine {
        final float[] ring;
        final double open, close, end, feedback;
        int at;

        EchoLine(Planner.Echo e, double t0) {
            ring = new float[2 * Math.max(1, (int) Math.round(e.delaySec * SR))];
            open = t0 - e.delaySec;
            close = t0;
            end = t0 + e.beats * e.delaySec;
            feedback = e.feedback;
        }

        /** One block of the deck [buf] (mix frame [frame] on): the send taken from it, the echo added to it. */
        void run(float[] buf, long frame) {
            for (int i = 0; i < BLOCK; i++) {
                double t = (frame + i) / (double) SR;
                if (t < open - 0.005 || t > end) continue;
                // the send: 5 ms ramps in at the beat's start, out on the catch
                float send = (float) (t < open ? (t - (open - 0.005)) / 0.005 : t < close - 0.005 ? 1 : Math.max(0, (close - t) / 0.005));
                float wet = (float) (t < end - 0.05 ? 1 : Math.max(0, (end - t) / 0.05));
                for (int ch = 0; ch < 2; ch++) {
                    float d = ring[at + ch];
                    ring[at + ch] = send * buf[2 * i + ch] + (float) feedback * d;
                    buf[2 * i + ch] += wet * d;
                }
                at = (at + 2) % ring.length;
            }
        }
    }

    private void renderLoop() {
        float[] buf = new float[BLOCK * 2], next = new float[BLOCK * 2], bo = new float[BLOCK * 2], bi = new float[BLOCK * 2];
        long w = 0, bufFrame = Long.MIN_VALUE;
        try {
            while (!stop) {
                // the incoming deck's fade-out, asked for by control(): set here, as this thread alone
                // renders the decks and frees them
                double fo = inFadeOutAt;
                if (!Double.isNaN(fo)) {
                    inFadeOutAt = Double.NaN;
                    LoopMixRenderer.nativeSetFadeOut(hIn, LoopMixRenderer.IN, fo);
                }
                long off = offsetFrames;
                if (off == Long.MIN_VALUE || w + off < firstFrame) {
                    int n = BLOCK;
                    if (off != Long.MIN_VALUE) n = (int) Math.min(BLOCK, firstFrame - (w + off));
                    Arrays.fill(buf, 0f);
                    track.write(buf, 0, n * 2, AudioTrack.WRITE_BLOCKING);
                    w += n;
                    written = w;
                    bufFrame = Long.MIN_VALUE;
                    continue;
                }
                long f = w + off;
                // rendered one block ahead: the limiter's lookahead, with no delay against YT's clock
                if (bufFrame != f) render(f, buf, bo, bi);
                render(f + BLOCK, next, bo, bi);
                // on the loop mix too, as a clip guard only (versions.md "The mix's ceiling" rule 1)
                limiter.process(buf, next, sums(f) || sums(f + BLOCK));
                track.write(buf, 0, BLOCK * 2, AudioTrack.WRITE_BLOCKING);
                w += BLOCK;
                written = w;
                float[] t = buf;
                buf = next;
                next = t;
                bufFrame = f + BLOCK;
                double fs = fadeFrom;
                if (!Double.isNaN(fs) && f / (double) SR > fs + fadeLen + 0.05) break;
            }
        } catch (Throwable t) {
            Log.e(TAG, "render failed", t);
        } finally {
            // each step on its own: a dead audio server failing one still releases the rest
            try {
                // 3 s of silence before the deck stops: stopping it right after the mix cut the whole
                // phone's sound for ~10 ms (S21 FE, recorded 2026-11-17: Samsung's output reconfigures
                // as a track stops); stopped later, while it plays silence, nothing is heard. Not on a
                // stalled track: those blocking writes would never return, nor the track be released
                float[] z = new float[BLOCK * 2];
                for (int k = 0; k < 3 * SR / BLOCK && !stalled; k++) track.write(z, 0, z.length, AudioTrack.WRITE_BLOCKING);
            } catch (Throwable ignored) {
            }
            try {
                track.stop();
            } catch (Throwable ignored) {
            }
            app.ayham.extension.music.features.EqPresets.releaseDeck(track);
            try {
                track.release();
            } catch (Throwable ignored) {
            }
            LoopMixRenderer.nativeDestroy(hOut);
            LoopMixRenderer.nativeDestroy(hIn);
            // logged here: the limiter's figures are written on this thread
            if (limiter.lowered > 0) Log.i(TAG, String.format(Locale.US, "limiter: down to %.1f dB at most, %.0f ms lowered in all",
                    20 * Math.log10(limiter.deepest), limiter.lowered * 1000.0 / SR));
            renderDone = true;
        }
    }

    /** A deck's gain and filters over one block (mix frame [frame] on). */
    /** The mix's soft limiter (Limiter): on while a deck sounds (limits). */
    private final Limiter limiter = new Limiter(BLOCK);

    /** The limiter is on for this block (limits). */
    private boolean sums(long f) {
        double t = (f + BLOCK / 2.0) / SR;
        return limits(m, t, echo != null && t <= echo.end, fx != null && t >= m.t0 && t <= fx.until);
    }

    /**
     * The limiter's rule at mix second t (versions.md "The mix's ceiling" rule 1): on as long as a deck
     * sounds, from its fade-in at the takeover to the hand-over, a song alone on it included: a hot
     * master held to ±1, or stretched to a playlist speed, clips there (2026-11-25: pair 1's B run-on,
     * ~160 flat-top runs; pair 2's Stay at x0.97 over the hand lead, 332).
     */
    static boolean limits(Mix m, double t, boolean echoSounds, boolean fxSounds) {
        // (versions.md 8ba27b64: on as long as a deck sounds, a song alone on it included; pair 2,
        // 2026-11-25: Stay alone on the deck at x0.97 over the hand lead clipped)
        return t >= -Mix.H || echoSounds || fxSounds;
    }

    /*
     * YT's clock, with the outgoing song at its playlist speed r (spotify-mixes.md rule 10): its song
     * second runs r per heard second, so a reading is kept as position / r less the heard second;
     * the decks' mix 0 is then where YT reaches takeoverSong, and YT's song second at mix t is
     * takeoverSong + r t. At x1 these are the plain position less the heard second.
     */
    static double clockOf(long posMs, double heardSec, double rate) {
        return posMs / 1000.0 / rate - heardSec;
    }

    /** The decks' offset from the clock readings' median (mix = heard + offset). */
    static double offsetSec(double clock, double takeoverSong, double rate) {
        return clock - takeoverSong / rate;
    }

    /** YT's song second at mix second t, as it plays the outgoing song on. */
    static double ytSongAt(double takeoverSong, double mix, double rate) {
        return takeoverSong + rate * mix;
    }

    /** The speed YT plays the outgoing song at up to the takeover (its playlist speed, else x1). */
    private double ytRate() {
        return m.plan != null ? Mix.leadRate(m.plan) : 1;
    }

    /**
     * The mix second YT's player is muted at for the takeover: 12 ms before the deck is whole (inside
     * its 25 ms fade-in), moved the output latency ahead, as a volume is heard that much after it is set,
     * and TAKEOVER_EXTRA_LEAD more: YT's own track is heard a little later than ours (Vaina Loca,
     * 2026-11-25: a hit right at the takeover clipped for 15 ms with both playing).
     */
    static double takeoverMuteAt(double latencySec) {
        return -0.012 - latencySec - TAKEOVER_EXTRA_LEAD;
    }

    static final double TAKEOVER_EXTRA_LEAD = 0.010;

    /**
     * The output latency from the pre-roll's readings: their median, held to 0.5 s. None, or a track
     * that reports its head as already heard (under 5 ms): the S21 FE's measured 40 ms (mixerLead).
     */
    static double outputLatency(List<Double> reads) {
        if (reads.isEmpty()) return 0.040;
        List<Double> s = new ArrayList<>(reads);
        Collections.sort(s);
        double med = s.get(s.size() / 2);
        return med < 0.005 ? 0.040 : Math.min(0.5, med);
    }

    /**
     * How far ahead of the deck's heard clock YT's volume goes out at the hand-over (versions.md "The
     * player's level at a take-over" rule 1): the output latency measured over the pre-roll, else 40 ms.
     */
    static double handoverLead(double measured) {
        return Double.isNaN(measured) ? 0.040 : measured;
    }

    /** The track's playback head less the frame being heard now, in seconds; NaN unread. */
    private double trackLatency(double heard) {
        if (track == null || heard < 0) return Double.NaN;
        long head = track.getPlaybackHeadPosition() & 0xffffffffL;
        return (head - heard) / SR;
    }

    /**
     * A deck held to ±1 before its level, as YT's own decoder holds a song: a lossy file's overs then
     * peak where YT's player would (its volume), not at full scale.
     */
    static void clamp(float[] b) {
        for (int i = 0; i < b.length; i++) {
            float v = b[i];
            if (v > 1f) b[i] = 1f;
            else if (v < -1f) b[i] = -1f;
            else if (v != v) b[i] = 0f; // a NaN: silence, not poison for the limiter and the track
        }
    }

    /** A NaN or Inf sample made silence. */
    static void finite(float[] b) {
        for (int i = 0; i < b.length; i++)
            if (!Float.isFinite(b[i])) b[i] = 0f;
    }

    /** One block of the mix at frame [f] into [buf]. */
    private void render(long f, float[] buf, float[] bo, float[] bi) {
        LoopMixRenderer.nativeRender(hOut, f, bo, 0, BLOCK);
        LoopMixRenderer.nativeRender(hIn, f, bi, 0, BLOCK);
        // before the filters and the echo: one NaN or Inf in their state would stay there for the mix
        finite(bo);
        finite(bi);
        // B's late entry (mix-file.md rule 2): nothing of the next song before its start, filters and
        // sends included; then up to the curve within LATE_RISE_SEC
        if (m.inStart > 0 && f < (m.inStart + LATE_RISE_SEC) * SR) {
            for (int i = 0; i < BLOCK; i++) {
                float g = (float) lateGain((f + i) / (double) SR, m.inStart);
                bi[2 * i] *= g;
                bi[2 * i + 1] *= g;
            }
        }
        shape(m.out, fOut, bo, f, m.mid);
        if (echo != null) echo.run(bo, f);
        shape(m.in, fIn, bi, f, m.mid);
        // after the filters: even at rest the 20 Hz high-pass and 20 kHz low-pass push a peak over 1
        clamp(bo);
        clamp(bi);
        double fs = fadeFrom;
        float lo = levelOutTarget, li = levelInTarget;
        if (Float.isNaN(levelOut)) {
            levelOut = lo;
            levelIn = li;
        }
        double sf = softFrom;
        // the Effects returns and the noise (editor.md §12): fed by the decks at their levels
        if (fx != null) {
            Arrays.fill(fxOut, 0f);
            fx.run(bo, bi, f, levelOut, levelIn, fxOut);
        }
        for (int i = 0; i < BLOCK; i++) {
            float g = 1;
            if (!Double.isNaN(fs)) g = (float) Math.max(0, Math.min(1, 1 - ((f + i) / (double) SR - fs) / fadeLen));
            // the soft hand-over: the deck goes out on a cosine while YT comes in on a sine
            if (!Double.isNaN(sf)) g *= softOut(((f + i) / (double) SR - sf) / SOFT_SEC, softLinear);
            levelOut += (lo - levelOut) * LEVEL_GLIDE;
            levelIn += (li - levelIn) * LEVEL_GLIDE;
            buf[2 * i] = (bo[2 * i] * levelOut + bi[2 * i] * levelIn + fxOut[2 * i]) * g;
            buf[2 * i + 1] = (bo[2 * i + 1] * levelOut + bi[2 * i + 1] * levelIn + fxOut[2 * i + 1]) * g;
        }
    }

    private static void shape(Mix.Deck d, Biquad[] f, float[] buf, long frame, boolean mid) {
        for (int at = 0; at < BLOCK; at += CONTROL) {
            double t0 = (frame + at) / (double) SR, t1 = (frame + at + CONTROL) / (double) SR, tm = (t0 + t1) / 2;
            f[0].setValue(d.lowDb.at(tm));
            f[1].setValue(d.highDb.at(tm));
            f[2].setValue(d.hpHz.at(tm));
            f[3].setValue(d.lpHz.at(tm));
            // bass, mid, high, high-pass, low-pass: the PC's chain (fx-plus.js)
            f[0].process(buf, at, at + CONTROL);
            if (mid) {
                f[4].setValue(d.midDb.at(tm));
                f[4].process(buf, at, at + CONTROL);
            }
            for (int k = 1; k < 4; k++) f[k].process(buf, at, at + CONTROL);
            double g0 = d.gain.at(t0), g1 = d.gain.at(t1);
            for (int i = 0; i < CONTROL; i++) {
                float g = (float) (g0 + (g1 - g0) * i / CONTROL);
                buf[2 * (at + i)] *= g;
                buf[2 * (at + i) + 1] *= g;
            }
        }
    }

    private long lastClockP = Long.MIN_VALUE;
    private int clockReads;
    /** The last fresh reading of each player, as (its position - the decks' clock) in seconds. */
    private double freshOutAt = Double.NaN, freshInAt = Double.NaN;

    /**
     * One reading of YT's position against the decks' clock. Some streams' players move their
     * position only every ~250 ms and hold it in between, so only a reading where it has just
     * moved is fresh; the held ones would pull the median up to ~120 ms late. True once there are
     * enough readings (40 tries, of which 5 or more fresh) to lock on.
     */
    private boolean clockRead(long p, double heard) {
        boolean fresh = lastClockP != Long.MIN_VALUE && p != lastClockP;
        lastClockP = p;
        if (fresh) {
            offsets.add(clockOf(p, heard / SR, ytRate()));
            freshOutAt = clockOf(p, heard / SR, ytRate());
        }
        clockReads++;
        return clockReads >= 40 && offsets.size() >= 5;
    }

    private final AudioTimestamp ts = new AudioTimestamp();
    private boolean leadLogged;

    /**
     * How long after the mixer a sample is heard, as measured on the S21 FE: with YT unmuted 12.5 ms
     * ahead the hole was 21 ms of silence between the deck's 25 ms fade and an 8 ms ramp back, so
     * the ramp lands mid-fade at ~37 ms more; 40 ms was used. Now the output latency read over the
     * pre-roll (handoverLead; 53 ms on LDPlayer, 2026-11-25), 40 ms without a reading. AudioTrack's
     * own figure (getLatency() less its buffer: 84 ms there) counts more than the volume's path and
     * would double the sound for ~45 ms instead, so it is only logged.
     */
    private double mixerLead() {
        if (!leadLogged) {
            leadLogged = true;
            String read;
            try {
                int total = (int) AudioTrack.class.getMethod("getLatency").invoke(track);
                read = (total - Math.round(track.getBufferSizeInFrames() * 1000.0 / SR)) + " ms";
            } catch (Throwable t) {
                read = "unread (" + t.getClass().getSimpleName() + ")";
            }
            Log.i(TAG, String.format(Locale.US, "hand-over: YT's volume comes back %.0f ms before the deck fades (%s; getLatency says %s after the mixer)",
                    handoverLead(takeoverLatency) * 1000, Double.isNaN(takeoverLatency) ? "no latency reading" : "the output latency read at the takeover", read));
        }
        return handoverLead(takeoverLatency);
    }

    private double heardFrames() {
        if (track == null || !track.getTimestamp(ts)) return -1;
        return ts.framePosition + (System.nanoTime() - ts.nanoTime) * SR / 1e9;
    }

    /** Main thread, every 5 ms. */
    private void control() {
        if (renderDone) {
            finish(false, null);
            return;
        }
        // a fade that never plays out (the track's clock stopped, a write stuck): the mix still ends,
        // so automix isn't left running with YT's players let go
        if (!Double.isNaN(fadeFrom) && SystemClock.uptimeMillis() - fadeSetAt > Math.round(fadeLen * 1000) + 3000) {
            finish(false, null);
            unstick();
            return;
        }
        // rule 4: our track's playback head stood still for 3 s (a stuck output, a dead audio server):
        // the mix is called off without marking the song, YT's player heard again
        if (track != null && !stopping && Double.isNaN(fadeFrom)
                && clockWatch.stalled(track.getPlaybackHeadPosition() & 0xffffffffL, SystemClock.uptimeMillis())) {
            Log.w(TAG, "mix aborted: the audio clock stopped (" + ClockWatch.STALL_MS + " ms still)");
            holding = false;
            released = null;
            Object p = inPlayer != null ? inPlayer : outPlayer;
            if (p != null) restoreVolume(p);
            if (inPlayer != null) {
                speedBack();
                restoreVolume(inPlayer);
            }
            finish(false, "the audio clock stopped");
            unstick();
            return;
        }
        // the outgoing deck follows YT's level only while YT still plays that song: once YT moves on, its
        // old player is faded to 0 within ~0.3 s, and following it cut the rest of the mix's outgoing
        // side (an echo out's tail, a blend's second half), recorded on the phone 2026-11-24
        if (outPlayer != null && !asked && inPlayer == null) levelOutTarget = ytVolume(outPlayer);
        if (inPlayer != null) {
            // not YT's start-up ramp on it: the deck is playing that song already
            float v = inFade.follow(SystemClock.uptimeMillis(), ytVolume(inPlayer));
            if (Float.isNaN(v)) v = levelInTarget;
            else if (Math.abs(v - levelInTarget) > 0.001f)
                Log.i(TAG, String.format(Locale.US, "next song at YT's volume %.3f (%.1f dB): the incoming deck follows", v, 20 * Math.log10(Math.max(v, 1e-6))));
            levelInTarget = v;
        }
        double heard = heardFrames();
        // the decks never got on YT's clock: no takeover happened, YT plays on (and nothing stays held)
        if (offsetFrames == Long.MIN_VALUE && !tookOver && android.os.SystemClock.uptimeMillis() - startedAt > 8000) {
            abort("no clock from the audio track or YT's player within 8 s", true);
            return;
        }
        if (heard < 0 || heard < SR * 0.1) return;
        if (offsetFrames == Long.MIN_VALUE) {
            long p = Automix.position(outPlayer);
            if (p < 0 || !clockRead(p, heard)) return;
            List<Double> s = new ArrayList<>(offsets);
            Collections.sort(s);
            double c = s.get(s.size() / 2);
            long off = Math.round(offsetSec(c, m.takeoverSong, ytRate()) * SR);
            double iqr = (s.get(s.size() * 3 / 4) - s.get(s.size() / 4)) * 1000;
            // YT's readings are loose just after a seek or a stall: wait for steady ones while time allows
            if (iqr > 40) {
                StringBuilder b = new StringBuilder();
                for (Double v : offsets) b.append(String.format(Locale.US, " %.0f", (v - c) * 1000));
                Log.i(TAG, "loose clock readings (ms from the median, in order):" + b);
            }
            if (iqr > 40 && -(heard + off) > SR * 1.5 && written + off + SR / 2 < firstFrame) {
                offsets.clear();
                clockReads = 0;
                return;
            }
            if (written + off >= firstFrame) {
                finish(false, "too late to start the decks before their pre-roll");
                return;
            }
            offsetFrames = off;
            offsets.clear();
            Log.i(TAG, String.format(Locale.US, "decks on YT's clock (%d fresh readings of %d, offset spread %.1f ms, IQR %.1f ms), takeover in %.2f s",
                    s.size(), clockReads, (s.get(s.size() - 1) - s.get(0)) * 1000, iqr, (-(heard + off)) / SR));
            clockReads = 0;
            return;
        }
        double mix = (heard + offsetFrames) / SR;
        if (!Double.isNaN(fadeFrom)) {
            if (mix > fadeFrom + fadeLen) finish(false, null);
            return;
        }

        // YT's clock can jump after the lock (a stall, a dropped second): keep checking it during the
        // silent pre-roll and move the decks onto it again, so the takeover splices where YT is
        if (!tookOver && mix < -0.4) {
            long p = Automix.position(outPlayer);
            if (p >= 0 && clockRead(p, heard)) {
                List<Double> s = new ArrayList<>(offsets);
                offsets.clear();
                clockReads = 0;
                Collections.sort(s);
                long off = Math.round(offsetSec(s.get(s.size() / 2), m.takeoverSong, ytRate()) * SR);
                double spread = (s.get(s.size() * 3 / 4) - s.get(s.size() / 4)) * 1000;
                if (Math.abs(off - offsetFrames) > SR * 0.03 && spread < 40) {
                    Log.i(TAG, String.format(Locale.US, "YT's clock moved %+.0f ms: decks moved onto it", (off - offsetFrames) * 1000.0 / SR));
                    offsetFrames = off;
                    return;
                }
            }
        }
        // the stream deck playing the outgoing song lets go where the decks take over (set ahead of
        // its write-ahead; it fades out over 25 ms at that song second)
        if (!tookOver && !deckReleased && mix >= -0.3) {
            deckReleased = true;
            StreamDeck a = StreamDeck.audible();
            if (a != null && a.player == outPlayer) {
                a.release(m.takeoverSong);
                releasedDeck = a;
            }
        }
        // the takeover's mute goes out one output latency ahead: YT's volume acts on the mixer, the
        // deck's samples sit on the heard timeline (pair 1 on LDPlayer, 2026-11-25: muted 12 ms ahead,
        // both played A whole for ~200 ms, 108 flat-top runs)
        if (!tookOver && Double.isNaN(takeoverLatency)) {
            if (mix < -0.6) {
                double lat = trackLatency(heard);
                if (!Double.isNaN(lat)) latencyReads.add(lat);
            } else {
                takeoverLatency = outputLatency(latencyReads);
                Log.i(TAG, String.format(Locale.US, "takeover: YT muted %.0f ms ahead (the track's output latency, %d readings)",
                        (takeoverLatency + 0.012) * 1000, latencyReads.size()));
            }
        }
        if (!tookOver && !Double.isNaN(takeoverLatency) && mix >= takeoverMuteAt(takeoverLatency)) {
            tookOver = true;
            holding = true;
            released = null;
            setVolume(outPlayer, 0f);
            // YT's position from its last fresh reading, run on by the decks' clock (a single reading
            // now can be up to ~250 ms stale on some streams)
            double yt = ytRate() * (freshOutAt + heard / SR) * 1000, deckAt = ytSongAt(m.takeoverSong, mix, ytRate());
            Log.i(TAG, String.format(Locale.US, "TAKEOVER at %.0f ms (deck at %.3f s, splice error %+.0f ms, YT's volume %.3f): %s", yt,
                    deckAt, yt - deckAt * 1000, ytVolume(outPlayer), m.note));
            listener.onMixStarted(this);
        }
        if (tookOver && !toasted && mix >= m.t0 - 0.05) {
            toasted = true;
            Automix.toast(m.title + " · " + m.sub);
        }
        // a seek on the old song before YT moves on: the mix is off its clock
        if (tookOver && !asked) {
            long now = SystemClock.elapsedRealtime();
            if (now - lastSeekCheck > 100) {
                lastSeekCheck = now;
                long p = Automix.position(outPlayer);
                if (p >= 0 && Math.abs(p - ytSongAt(m.takeoverSong, mix, ytRate()) * 1000) > 1500) {
                    abort("the playing song was seeked", true);
                    return;
                }
            }
        }
        if (tookOver && !asked && mix >= m.askAt) {
            asked = true;
            if (inPlayer == null) {
                Log.i(TAG, String.format(Locale.US, "mix %.2f s: YT moves to the next song", mix));
                mediaNext();
            }
        }
        if (asked && inPlayer == null) pollIncoming();
        if (inPlayer != null && !handedOver) {
            checkSong();
            if (!Double.isNaN(fadeFrom)) return;
            if (Double.isNaN(handoverAt)) align(mix);
        }
        // hand over once the player is in time (or as late as the decoded audio allows)
        // ...but never mid-nudge: putting YT's speed back at the handover re-plans its audio as it is
        // unmuted, heard as a short cut (phone, 2026-11-17: x0.994 -> x1.000 2 ms before the unmute).
        // A nudge ends (silent) within 1 s, then the speed settles 300 ms.
        boolean speedSettled = nudgeUntil == 0 && SystemClock.elapsedRealtime() - speedSetAt >= 300;
        boolean ready = aligned && speedSettled && mix >= m.elementAt - 0.3
                // the stream deck lines up (silently) after the last nudge: up to 3 s for it
                && (deck == null || deck.inStep() || mix >= m.elementAt + 3)
                // ...and so does the addon's player for the next song
                && (!addonIn || AddonDirect.inStep(inPlayer) || mix >= m.elementAt + 3);
        if (!handedOver && Double.isNaN(handoverAt) && inPlayer != null && (ready || mix >= Math.min(m.elementAt + 8, deadline))) {
            // Only the stream deck taking the song splices (its samples follow ours exactly). A player
            // is crossfaded: its volume reaches the speaker 40 ms after the mixer only on average, and
            // a late one left a hole between the deck's 25 ms fade and the player's sound (phone,
            // 2026-11-19, screen-recorded: a 15 ms fade, ~8 ms of silence, the ramp back). Lined up,
            // the crossfade is equal gain; not lined up, equal power.
            boolean deckTakes = deck != null && deck.inStep();
            boolean lined = aligned && (!addonIn || AddonDirect.inStep(inPlayer));
            // the render writes ~0.26 s ahead of what is heard (the track's buffer and the output's
            // latency): the crossfade starts past that, or its first part is skipped as a step
            handoverAt = mix + (deckTakes ? 0.3 : 0.5);
            // a forced hand-over can land mid-nudge: the speed goes back now, while the player is still
            // silent, so its audio re-plans in the 0.5 s before it is heard, not as it is unmuted
            // (phone, 2026-11-24: forced at x0.920, a ~100 ms hole after the crossfade, -7.5 dB)
            float home = (float) m.home;
            if (nudgeUntil > 0 || Math.abs(setSpeed - home) > 0.0005f) {
                nudge = 1;
                nudgeUntil = 0;
                nudgeEnds.remove(inPlayer);
                setSpeed = home;
                speed(inPlayer, home);
                speedSetAt = SystemClock.elapsedRealtime();
            }
            if (!deckTakes) {
                softFrom = handoverAt - SOFT_SEC / 2;
                // equal gain only onto YT's player, which plays the deck's own stream (the two sum
                // flat). The addon's player is another copy (FLAC against YT's Opus): a few ms apart
                // they sum like two songs, so equal gain dipped mid-way (phone, 2026-11-24, screen-
                // recorded at the hand-over to the addon: -2.5 dB over the 250 ms, heard as a cut)
                softLinear = lined && !addonIn;
                String to = addonIn ? "the addon's player" : "YT's player";
                if (lined)
                    Log.i(TAG, String.format(Locale.US, "hand-over to %s at mix %.2f s: a %.0f ms %s crossfade (in step, last error %s ms)",
                            to, mix, SOFT_SEC * 1000, softLinear ? "equal-gain" : "equal-power", lastErr == Long.MIN_VALUE ? "-" : String.valueOf(lastErr)));
                else
                    Log.w(TAG, String.format(Locale.US, "hand-over forced at mix %.2f s with %s not in step (last error %s ms): a %.0f ms equal-power crossfade",
                            mix, to, lastErr == Long.MIN_VALUE ? "-" : String.valueOf(lastErr), SOFT_SEC * 1000));
            } else {
                inFadeOutAt = m.in.trackAt(handoverAt);
            }
            // the stream deck takes the song from here when it is in step (YT stays silent), else YT does
            if (deck != null && deck.inStep()) {
                deck.takeAt(m.in.trackAt(handoverAt));
                deckTook = true;
            } else if (deck != null) {
                deck.handBack("not in step by the handover");
                deck = null;
            }
        }
        // mix is what is heard; a volume set now reaches the speaker only after the output's latency
        // past the mixer. Set at the heard moment, YT's (or the addon's) sound came back that much after
        // the deck had faded: a ~20 ms hole heard at every hand-over (S21 FE, recorded 2026-11-18: a
        // 12 ms fade, 21 ms of silence, an 8 ms ramp back). So it is set that much ahead (mixerLead).
        double soft = softFrom;
        if (!handedOver && !Double.isNaN(handoverAt) && mix >= (Double.isNaN(soft) ? handoverAt - 0.0125 : soft) - mixerLead()) {
            handedOver = true;
            rescueOffHandover();
            speedBack();
            released = inPlayer;
            if (Double.isNaN(soft)) restoreVolume(inPlayer);
            else softRamp = true;
            double yt = (freshInAt + mix) * 1000;
            Log.i(TAG, String.format(Locale.US, "HANDOVER%s at mix %.3f s: YT at %.0f ms, deck at %.3f s (splice error %+.0f ms, last median %s ms, YT's volume %.3f); alignment:%s",
                    Double.isNaN(soft) ? "" : " (crossfaded)", mix, yt, m.in.trackAt(mix), yt - m.in.trackAt(mix) * 1000, lastErr == Long.MIN_VALUE ? "-" : String.valueOf(lastErr), ytVolume(inPlayer), alignLog));
        }
        if (!handedOver && inPlayer == null && mix >= deadline) {
            abort("YT's player for the next song never came", false);
            return;
        }
        if (softRamp) {
            // YT's volume on the sine, on the heard timeline (set mixerLead ahead, like the splice)
            double t = (mix + mixerLead() - soft) / SOFT_SEC;
            if (t >= 1) {
                softRamp = false;
                restoreVolume(inPlayer);
            } else {
                setVolume(inPlayer, ytVolume(inPlayer) * softIn(t, softLinear));
            }
        }
        if (handedOver && mix >= handoverAt + 0.6) finish(true, null);
    }

    /**
     * A handover forced at the deadline with YT far from the deck (its player was replaced, or seeks
     * didn't land): YT's playing player is seeked to where the deck is, so the song carries on from
     * the right place instead of jumping (a short gap instead of a jump into the middle).
     */
    private void rescueOffHandover() {
        if (lastErr == Long.MIN_VALUE || Math.abs(lastErr) <= 1000) return;
        try {
            Object p = PlayerTap.current();
            if (p == null) p = inPlayer;
            long target = Math.round(m.in.trackAt(handoverAt) * 1000);
            if (p instanceof SeekAccess) ((SeekAccess) p).ayham_seekTo(target);
            if (p != inPlayer) inPlayer = p;
            Log.w(TAG, "handover " + lastErr + " ms off: YT's player seeked to the deck, " + target + " ms");
        } catch (Throwable t) {
            Log.w(TAG, "handover rescue failed", t);
        }
    }

    /** No incoming player from Morphe's crossfade: YT moved on in the same player, or another one is playing. */
    private void pollIncoming() {
        try {
            Object p = PlayerTap.current();
            if (p == null) return;
            long pos = Automix.position(p);
            if (p != outPlayer && pos >= 0) onIncoming(p);
            else if (p == outPlayer && pos >= 0 && pos < 10_000 && m.takeoverSong > 20) onIncoming(p);
        } catch (Throwable ignored) {
        }
    }

    /** YT's next player: held silent for the takeover. True when this mix takes it. */
    boolean onIncoming(Object player) {
        if (!tookOver || inPlayer != null || stop) return false;
        if (!asked) {
            // the listener's Next: the song skipped to stays silent until the deck's fade has been
            // heard, else both play at full at once and the sum clips (the phone, 2026-11-26). Held by
            // skipMuted, not holding: the abort lets holding go, and Morphe's crossfade ramp would
            // bring it up early. The outgoing player gets its volume back then too, not on top of the deck.
            skipMuted = player;
            setVolume(player, 0f);
            main.post(() -> {
                abort("the song was skipped during the mix", false);
                bringInSkipped(player);
            });
            return false;
        }
        inPlayer = player;
        setVolume(player, 0f);
        // a song the addon plays (Direct) gets no stream deck: the addon's player is its deck
        addonIn = app.ayham.extension.music.addons.AddonSettings.on() && app.ayham.extension.music.addons.AddonPrep.get(m.inId) != null;
        deck = addonIn ? null : StreamDeck.follow(Automix.context(), m.inId, player);
        // the addon's player for the next song locks on this one silently, to take the handover
        if (addonIn) AddonDirect.follow(player, m.inId);
        settleUntil = 0;
        nudgeUntil = 0;
        nudgeEnds.remove(player);
        errs.clear();
        alignReads = 0;
        Log.i(TAG, "incoming player held silent at " + Automix.position(player) + " ms");
        return true;
    }

    /** The queue played another song than the mix is for: the deck fades out, the player fades in. */
    private void checkSong() {
        String id = Automix.currentId();
        if (id == null || id.equals(inIdSeen)) return;
        // the queue is read every ~1.5 s: right after YT moves on it still names the outgoing song,
        // which is not "another song" (that read once broke a loop mix into a plain crossfade)...
        if (id.equals(m.outId)) {
            // ...but once it has named the incoming one, the outgoing one again is the listener going
            // back: the mix ends there (phone, 2026-11-21: it carried on, and its forced hand-over
            // seeked Vaina Loca 23 s off to the deck's place in Si No Es Contigo)
            if (m.inId.equals(inIdSeen)) {
                inIdSeen = id;
                abort("the listener went back to the playing song during the mix", true);
            }
            return;
        }
        inIdSeen = id;
        if (id.equals(m.inId)) return;
        Log.i(TAG, "the queue played " + id + " instead of " + m.inId + ": crossfading into it as it is");
        speedBack();
        released = inPlayer;
        Automix.rampVolume(inPlayer, 1.5);
        fadeOut(1.5);
        handedOver = true;
    }

    private void fadeOut(double sec) {
        double heard = heardFrames();
        double mix = heard < 0 || offsetFrames == Long.MIN_VALUE ? 0 : (heard + offsetFrames) / SR;
        fadeLen = sec;
        fadeSetAt = SystemClock.uptimeMillis();
        fadeFrom = mix + 0.2;
    }

    /** YT's speed back to the song's own once (x1, or its playlist speed; each change re-plans its audio), with no nudge left running on it. */
    private void speedBack() {
        if (inPlayer == null) return;
        nudge = 1;
        nudgeUntil = 0;
        nudgeEnds.remove(inPlayer);
        float home = (float) m.home;
        if (setSpeed != home) {
            setSpeed = home;
            speed(inPlayer, home);
        }
    }

    /** Ends the mix early: the deck fades out quickly and YT's players are let go. */
    void abort(String why, boolean restoreOut) {
        if (stop || finished) return;
        Log.w(TAG, "mix aborted: " + why);
        holding = false;
        released = null;
        Object p = inPlayer != null ? inPlayer : outPlayer;
        if (p != null && restoreOut) restoreVolume(p);
        if (inPlayer != null) {
            speedBack();
            restoreVolume(inPlayer);
        }
        // a late entry (mix-file.md rule 2) called off before B came in: YT plays B from its mix-in,
        // not from where its silent player ran up to it
        double at = mixNow();
        if (m.inStart > 0 && !Double.isNaN(at) && at < m.inStart && inPlayer instanceof SeekAccess && !handedOver && (inIdSeen == null || m.inId.equals(inIdSeen)))
            ((SeekAccess) inPlayer).ayham_seekTo(incomingSpotMs(m, at));
        if (track == null || offsetFrames == Long.MIN_VALUE) {
            finish(false, why);
            return;
        }
        // from the first block not rendered yet, not 0.2 s on: YT's player is already back
        double[] f = fadeSoonest(fadeFrom, fadeLen, pauseFadeFrom(written, offsetFrames), ABORT_FADE_SEC);
        fadeLen = f[1];
        fadeSetAt = SystemClock.uptimeMillis();
        fadeFrom = f[0];
        finishReason = why;
    }

    static final double ABORT_FADE_SEC = 0.05;

    /** The song the listener skipped to, silent so far: its volume back once the deck's fade has reached the speaker. */
    private void bringInSkipped(Object player) {
        double heard = mixNow();
        if (finished || Double.isNaN(heard) || Double.isNaN(fadeFrom)) {
            letSkippedIn(player, 0);
            return;
        }
        long ms = skipVolumeDelayMs(fadeFrom + fadeLen, heard, takeoverLatency);
        Log.i(TAG, "the song skipped to comes in after " + ms + " ms, once the deck's fade is heard");
        main.postDelayed(() -> letSkippedIn(player, SKIP_RISE_SEC), ms);
    }

    /** The song skipped to rises over [sec] (0: at once); the outgoing player's volume back. */
    private void letSkippedIn(Object player, double sec) {
        if (skipMuted == player) skipMuted = null;
        Object out = outPlayer;
        if (out != null && out != player) restoreVolume(out);
        if (sec > 0) Automix.rampVolume(player, sec);
        else restoreVolume(player);
    }

    static final double SKIP_RISE_SEC = 0.03;

    /**
     * How long the song skipped to waits, in ms: until the deck's fade ([fadeEnd], mix seconds) has
     * left the track ([heard]: the mix second the track has played) and the output latency after it
     * ([latency]; NaN: 0.1 s), never over a second.
     */
    static long skipVolumeDelayMs(double fadeEnd, double heard, double latency) {
        double lat = Double.isNaN(latency) ? 0.1 : latency;
        return Math.max(0, Math.min(1000, Math.round((fadeEnd - heard + lat) * 1000)));
    }

    private String finishReason;

    /**
     * The listener's pause (playback.md "The queue during a mix" rule 5): the mix is called off at
     * once, not marked; YT's paused players get their volumes back (paused, never started here), the
     * stream deck is handed back and the decks fade out over PAUSE_FADE_SEC from the next sample.
     */
    void stopNow(String why) {
        if (stop || finished || stopping) return;
        stopping = true;
        Log.i(TAG, "mix stopped: " + why);
        holding = false;
        released = null;
        if (outPlayer != null) restoreVolume(outPlayer);
        if (inPlayer != null) {
            speedBack();
            restoreVolume(inPlayer);
        }
        if (deck != null) deck.handBack(why);
        // after our Next: YT's paused player at the incoming song's spot the mix had reached, not
        // where its held, silent player was (a seek doesn't start it)
        double at = mixNow();
        // (not a song the queue moved on to: that one is left where it is)
        if (inPlayer instanceof SeekAccess && !Double.isNaN(at) && !handedOver && (inIdSeen == null || m.inId.equals(inIdSeen))) {
            long to = incomingSpotMs(m, at);
            ((SeekAccess) inPlayer).ayham_seekTo(to);
            Log.i(TAG, "the incoming song left paused at " + to + " ms, where the mix was (YT's player at " + Automix.position(inPlayer) + " ms)");
        }
        if (track == null || offsetFrames == Long.MIN_VALUE) {
            finish(false, why);
            return;
        }
        // a fade already running (an abort's, another song's): the one that ends sooner, from the level it is at
        double[] f = pauseFade(fadeFrom, fadeLen, pauseFadeFrom(written, offsetFrames));
        fadeLen = f[1];
        fadeSetAt = SystemClock.uptimeMillis();
        fadeFrom = f[0];
        finishReason = why;
    }

    private volatile boolean stopping;
    static final double PAUSE_FADE_SEC = 0.1;

    private final ClockWatch clockWatch = new ClockWatch();

    /** mix-file.md rule 2: a late B rises from 0 to its curve within 10 ms once the delay ends. */
    static final double LATE_RISE_SEC = 0.010;

    /** B's gain under a late entry at mix second [t]: 0 before [inStart], a linear rise over LATE_RISE_SEC, then 1. */
    static double lateGain(double t, double inStart) {
        if (!(inStart > 0)) return 1;
        return Math.max(0, Math.min(1, (t - inStart) / LATE_RISE_SEC));
    }

    /**
     * A stalled track (rule 4): the render thread waits in a blocking write the head never takes.
     * Paused and flushed from here, the write returns, the loop sees stop, and the track and the
     * decks are released without the silence tail.
     */
    private void unstick() {
        stalled = true;
        AudioTrack t = track;
        if (t == null) return;
        try {
            t.pause();
            t.flush();
        } catch (Throwable e) {
            Log.w(TAG, "stalled track not flushed", e);
        }
    }

    /** playback.md "The queue during a mix" rule 4: the audio clock standing still for STALL_MS. */
    static final class ClockWatch {
        static final long STALL_MS = 3000;
        private long frame = Long.MIN_VALUE, since;

        /** [head]: the track's playback head now, at wall-clock [nowMs]. */
        boolean stalled(long head, long nowMs) {
            if (head != frame) {
                frame = head;
                since = nowMs;
                return false;
            }
            return nowMs - since >= STALL_MS;
        }
    }

    /**
     * The incoming song's second heard at mix second [t], in ms; its start (its mix-in) before the mix
     * brings it in, a late entry's too (mix-file.md rule 2).
     */
    static long incomingSpotMs(Mix m, double t) {
        return Math.max(0, Math.round(m.in.trackAt(Math.max(t, m.inStart > 0 ? m.inStart : m.t0)) * 1000));
    }

    /**
     * The mix second of the first block not rendered yet: the render thread renders one block ahead
     * and waits in the write of the block before it, so 2 blocks past what is written. A pause's fade
     * starts there, whole, not part-way into a block (an 11% step).
     */
    static double pauseFadeFrom(long written, long offset) {
        return (written + 2L * BLOCK + offset) / (double) SR;
    }

    /**
     * A pause's fade {from, length} from mix second [at] over PAUSE_FADE_SEC, against a fade already
     * running ([fs], [len]; fs NaN: none): the one that ends sooner, never back up to full. A later
     * pause end keeps the running fade; a sooner one goes on from the level the running one is at then.
     */
    static double[] pauseFade(double fs, double len, double at) {
        return fadeSoonest(fs, len, at, PAUSE_FADE_SEC);
    }

    /** pauseFade's rule for a fade of [sec] from [at] (an abort's too). */
    static double[] fadeSoonest(double fs, double len, double at, double sec) {
        if (Double.isNaN(fs) || !(len > 0)) return new double[]{at, sec};
        double end = at + sec;
        if (fs + len <= end) return new double[]{fs, len};
        double level = Math.max(0, Math.min(1, 1 - (at - fs) / len));
        if (level <= 0) return new double[]{fs, len};
        double l = sec / level;
        return new double[]{end - l, l};
    }

    private void finish(boolean ok, String why) {
        if (finished) return;
        finished = true;
        stop = true;
        if (why == null) why = finishReason;
        holding = false;
        released = null;
        speedBack();
        // stopped mid-crossfade (a soft hand-over): YT's volume is given back whole, not left part way
        if (softRamp && inPlayer != null) {
            softRamp = false;
            restoreVolume(inPlayer);
        }
        // a mix that failed after the takeover: YT's playing player gets its volume back (the
        // incoming one when it came, else the outgoing one), never left silent
        if (!ok && tookOver && !handedOver) {
            Object p = inPlayer != null ? inPlayer : outPlayer;
            if (p != null) restoreVolume(p);
        }
        if (deck != null && !(ok && deckTook)) deck.handBack("the mix ended without it");
        // the outgoing deck was let go for a takeover that never came: it stops now and YT's
        // player (no longer muted by it) gets its volume back
        if (releasedDeck != null && !tookOver) {
            releasedDeck.cancelRelease();
            if (outPlayer != null) restoreVolume(outPlayer);
        }
        if (!started) {
            LoopMixRenderer.nativeDestroy(hOut);
            LoopMixRenderer.nativeDestroy(hIn);
        }
        if (ok) Log.i(TAG, "MIX DONE (" + m.style + ")");
        listener.onFinished(this, ok, why);
    }

    boolean running() {
        return !finished;
    }

    /** The mix second being heard now, or NaN before the decks are on YT's clock. */
    double mixNow() {
        double heard = heardFrames();
        long off = offsetFrames;
        return heard < 0 || off == Long.MIN_VALUE ? Double.NaN : (heard + off) / SR;
    }

    boolean tookOverOnce() {
        return tookOver;
    }

    /** YT was asked for the next song: its screen shows the incoming song from here on. */
    boolean askedNext() {
        return asked;
    }

    /** YT's player has the next song's sound back (the decks are letting go). */
    boolean handedOver() {
        return handedOver;
    }

    /** A loop mix between its takeover and handover: what is heard is no longer YT's position. */
    boolean loopHolding() {
        return tookOver && !handedOver && "loop".equals(m.style);
    }

    // ---------------------------------------------------------------------------------------------
    // The incoming player onto the deck's timeline

    /**
     * Seeks the silent incoming player to where the deck is, then nudges its speed (around the deck's
     * own rate) until it is within a few ms. YT's position readings jump now and then, so each check
     * is the median of 40 readings (200 ms) taken once it plays steadily.
     */
    private boolean measuredSinceSeek;
    private long lastAlignP = -1;
    private int alignReads;

    private void align(double mix) {
        long now = SystemClock.elapsedRealtime();
        double want = m.in.trackAt(mix);
        float base = (float) m.in.rateAt(mix);
        // until the takeover the player (silent) runs at its own speed to where the deck will be
        // then: not round the deck's loop, and not step by step through its glide back to x1.0
        // (each speed change re-plans YT's audio; the extension's trackAt(tk - 1.5))
        if (mix < m.elementAt) {
            base = (float) m.in.rateAt(m.elementAt);
            want = m.in.trackAt(m.elementAt) - (m.elementAt - mix) * base;
        }
        if (Math.abs(base * nudge - setSpeed) > 0.0005 && nudgeUntil == 0) {
            setSpeed = base * nudge;
            speed(inPlayer, setSpeed);
            speedSetAt = now;
        }
        if (seeks == 0) {
            // the song not begun on the deck yet: a seek now would land at 0 and YT run ahead of it by
            // as much (w7: 1.9 s, w4: 5.4 s). It waits until the deck is half a second in.
            if (Math.round(want * 1000) + Math.round(lead * base) < 500) return;
            seek(want, base, now);
            return;
        }
        if (nudgeUntil > 0) {
            if (now < nudgeUntil) return;
            nudge = 1;
            setSpeed = base;
            speed(inPlayer, base);
            speedSetAt = now;
            nudgeUntil = 0;
            nudgeEnds.remove(inPlayer);
            settleUntil = now + 300;
            errs.clear();
            alignReads = 0;
            return;
        }
        if (now < settleUntil) return;
        long p = Automix.position(inPlayer);
        if (p < 0) return;
        if (!steady) {
            if (lastP >= 0 && now - lastAt >= 250) {
                double rate = (p - lastP) / (double) (now - lastAt) / base;
                if (rate > 0.8 && rate < 1.2) steady = true;
                lastP = p;
                lastAt = now;
            } else if (lastP < 0) {
                lastP = p;
                lastAt = now;
            }
            if (!steady) return;
        }
        // only a reading where YT's position has just moved is fresh (some streams move it every ~250 ms)
        boolean fresh = lastAlignP >= 0 && p != lastAlignP;
        lastAlignP = p;
        alignReads++;
        if (fresh) {
            errs.add(Math.round(p - want * 1000));
            freshInAt = p / 1000.0 - mix;
        }
        if (alignReads < 40 || errs.size() < 5) return;
        alignReads = 0;
        List<Long> sorted = new ArrayList<>(errs);
        Collections.sort(sorted);
        long err = sorted.get(sorted.size() / 2);
        errs.clear();
        alignReads = 0;
        lastErr = err;
        boolean firstAfterSeek = !measuredSinceSeek;
        measuredSinceSeek = true;
        aligned = Math.abs(err) <= 15;
        if (Math.abs(err) <= 8) {
            alignLog.append(" err ").append(err).append(" ms (ok);");
            settleUntil = now + 400;
            return;
        }
        if (Math.abs(err) > 600 && seeks < 3) {
            alignLog.append(" err ").append(err).append(" ms;");
            // right after a seek the error is the seek's latency; later on it is a jump of YT's own
            if (firstAfterSeek) lead -= err;
            seek(want, base, now);
            return;
        }
        // a speed nudge (no re-buffer): ~70% of the error over up to 1 s, at most 8% off the deck's
        // rate; the player is silent until the handover, so its speed can move this much unheard
        double T = 1;
        double take = 0.7 * err;
        float sp = (float) Math.max(0.92, Math.min(1.08, 1 - take / (T * 1000)));
        long dur = Math.round(take / (1 - sp));
        dur = Math.max(100, Math.min(Math.round(T * 1000), Math.abs(dur)));
        nudge = sp;
        setSpeed = base * sp;
        speed(inPlayer, setSpeed);
        speedSetAt = now;
        nudgeUntil = now + dur;
        nudgeEnds.put(inPlayer, nudgeUntil);
        nudges++;
        alignLog.append(String.format(Locale.US, " err %d ms -> x%.3f for %d ms;", err, sp, dur));
    }

    private void seek(double want, float base, long now) {
        long target = Math.max(0, Math.round(want * 1000) + Math.round(lead * base));
        if (inPlayer instanceof SeekAccess) ((SeekAccess) inPlayer).ayham_seekTo(target);
        seeks++;
        measuredSinceSeek = false;
        steady = false;
        aligned = false;
        lastP = -1;
        alignLog.append(" seek ").append(target).append(" (lead ").append(lead).append(')');
        errs.clear();
        alignReads = 0;
        settleUntil = now + 300;
    }

    // ---- YT's player ----

    static void setVolume(Object player, float v) {
        boolean[] self = selfCall.get();
        boolean was = self[0];
        self[0] = true;
        try {
            player.getClass().getMethod("patch_setVolume", float.class).invoke(player, v);
        } catch (Throwable t) {
            Log.w(TAG, "setVolume failed", t);
        } finally {
            self[0] = was;
        }
    }

    /** Gives a player back the volume YT asked for. */
    static void restoreVolume(Object player) {
        setVolume(player, ytVolume(player));
    }

    static void speed(Object player, float s) {
        StreamDeck.ytSpeed(player, s);
        speeds.put(player, s);
        AddonDirect.onSpeed(player, s);
        try {
            player.getClass().getMethod("patch_setPlaybackParameters", float.class, float.class).invoke(player, s, 1f);
        } catch (Throwable t) {
            Log.w(TAG, "speed failed", t);
        }
    }

    private static void mediaNext() {
        Automix.askedAt = SystemClock.elapsedRealtime();
        AudioManager am = (AudioManager) Automix.context().getSystemService(Context.AUDIO_SERVICE);
        long now = SystemClock.uptimeMillis();
        am.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_NEXT, 0));
        am.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_NEXT, 0));
    }
}
