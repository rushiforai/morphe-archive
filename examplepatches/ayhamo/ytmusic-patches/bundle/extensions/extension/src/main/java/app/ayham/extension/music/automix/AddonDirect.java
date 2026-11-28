package app.ayham.extension.music.automix;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.io.RandomAccessFile;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.ayham.extension.music.addons.AddonPlayback;
import app.ayham.extension.music.addons.AddonPrep;
import app.ayham.extension.music.addons.AddonSettings;
import app.ayham.extension.music.features.Features;
import app.ayham.extension.music.features.PlayerTap;
import app.ayham.extension.music.features.SeekAccess;

/**
 * Direct mode (protocol.md §8, the phone): a song prepared from an addon plays on our own player
 * (YT's media3 classes, the local file), kept on YT's player's clock (addonTime = youtubeTime +
 * offsetSec) while YT's player runs on muted underneath as the clock, for seek, next and history,
 * and as the fallback. YT's own volume (its normalisation, Morphe's and automix's fades, the gate)
 * times the source gain sets ours.
 *
 * <ul>
 * <li>A prepared song that starts (after a song ends, a skip, a hand-over) plays from its start on
 * the addon, YT's audio never heard: the next song's player is armed ahead, paused at its start.
 * <li>A song started cold (prepared while it plays, or its player not ready yet) is upgraded
 * mid-song: locked silently (a seek only when far off; else a short silent speed nudge, measured on
 * both players' clocks), then a 200 ms crossfade.
 * <li>In an automix mix the incoming song's player locks silently while the decks play, and the
 * engine hands over to it (it waits for it as it does for the stream deck).
 * <li>Drift: no speed nudges while heard (a speed change re-plans ExoPlayer's audio, heard as a cut);
 * a drift over 20 ms is set right at the quietest point of the next seconds: a 30 ms crossfade to
 * YT (in step underneath, so nothing goes silent), the silent lock, the crossfade back.
 * <li>Any failure (player error, file gone, a stall) hands the song back to YT's player, which is in
 * step underneath, at once; the song is not played from the addon again for 10 min.
 * </ul>
 */
public final class AddonDirect {
    private static final String TAG = "AyhamDirect";
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final long TICK_MS = 10;
    /** A length within this of YouTube's: the player holds this song. */
    private static final double SAME_SONG_SEC = 2;
    /** YT's position under this: the song is starting, so it plays from its start on the addon. */
    private static final long START_MS = 3000;
    private static final long FADE_IN_MS = 200, START_FADE_MS = 20, RESYNC_FADE_MS = 30;
    /**
     * Locking: a seek when this far off; nearer, a silent speed nudge of NUDGE_MS at the rate that
     * makes it up (at most MAX_NUDGE). A shorter speed change is lost: ExoPlayer applies speeds
     * where its buffered audio drains, so one undone within ~0.2 s may never be heard at all.
     */
    private static final long SEEK_OVER_MS = 400, NUDGE_MS = 800, GROSS_MS = 1500, PAUSED_JUMP_MS = 600;
    private static final float MAX_NUDGE = 0.5f;
    /** A start this far off where YT is: set right by a seek before it is heard. */
    private static final long START_OFF_MS = 150;
    /** In step: within this (LOOSE after 4 corrections). Drift: past this, a resync. */
    private static final long LOCK_MS = 10, LOCK_LOOSE_MS = 20, DRIFT_MS = 30;
    /**
     * In step and heard: the median error of TRIM_N readings past TRIM_MS is taken back by a rate
     * change of TRIM_RATE with the pitch following it (a plain resample, 7 cents for a few seconds:
     * not heard), so a lock taken at up to LOCK_LOOSE_MS doesn't stay that far off YT and the decks.
     */
    private static final long TRIM_MS = 7;
    private static final int TRIM_N = 20;
    private static final float TRIM_RATE = 0.004f;
    private static final Map<Object, Shadow> shadows = new IdentityHashMap<>();
    /** The next song's player, opened and paused at its start, before YT gets to it. */
    private static volatile Shadow armed;
    /** The seek latency learned on this device (ms our audio lands behind a seek's target). */
    private static long learnedLead;
    private static Context ctx;
    private static boolean started;
    private static long lastQueue;
    /** The Dolby Atmos switch at the last step. */
    private static boolean atmosWas;
    /** When YT paused: its last reading or two still arrive just after, they aren't a resume. */
    private static volatile long pausedAt;
    /** Debug (spike prop directTrace=1): every clock reading and error logged. */
    private static boolean TRACE;
    /** Debug (spike prop directDuo=1): YT stays heard under ours, so a recording shows their lag. */
    private static boolean DUO;

    private AddonDirect() {
    }

    /** The adb test hooks (app.ayham.ADDON_TEST) on in every build when true; false for a phone release. */
    static final boolean TEST_HOOKS = false;

    /** From Automix.onActivityCreate. */
    static void start(Context c) {
        ctx = c.getApplicationContext();
        AddonSettings.init(ctx);
        if (started) return;
        started = true;
        AddonPrep.clearCache(ctx);
        TRACE = "1".equals(Features.prop("directTrace"));
        DUO = "1".equals(Features.prop("directDuo"));
        if (TEST_HOOKS || "1".equals(Features.prop("directTest"))) registerTest();
        main.postDelayed(AddonDirect::tick, 2000);
    }

    private static Shadow get(Object host) {
        synchronized (shadows) {
            return shadows.get(host);
        }
    }

    private static void put(Object host, Shadow s) {
        synchronized (shadows) {
            shadows.put(host, s);
        }
    }

    private static List<Shadow> list() {
        synchronized (shadows) {
            return new ArrayList<>(shadows.values());
        }
    }

    /** How much of the host's sound the addon carries (0..1): YT's player is turned down by it. */
    static float share(Object host) {
        Shadow s = get(host);
        return s == null || DUO ? 0 : s.share;
    }

    /** The gate set YT's player's volume: ours follows (the same moment on the main thread). */
    static void onGate(Object host, float base) {
        final Shadow s = get(host);
        if (s == null) return;
        if (Looper.myLooper() == Looper.getMainLooper()) s.volume(base);
        else main.post(() -> s.volume(Engine.gateOut(host)));
    }

    /** Automix changed YT's player's speed: ours changes in the same moment. */
    static void onSpeed(Object host, float speed) {
        final Shadow s = get(host);
        if (s == null) return;
        if (Looper.myLooper() == Looper.getMainLooper()) s.followSpeed(speed, SystemClock.elapsedRealtime());
        else main.post(() -> s.followSpeed(speed, SystemClock.elapsedRealtime()));
    }

    /** The song's addon audio is heard now (the mix decks use it for this song's end). */
    static boolean audibleFor(String id) {
        synchronized (shadows) {
            for (Shadow s : shadows.values()) if (s.p.id.equals(id) && s.share >= 0.5f && s.heard()) return true;
        }
        return false;
    }

    /**
     * The take-over (editor.md §11 rule 6): our player has started on this song (not a mix's held
     * one) and isn't what's heard yet. Main thread.
     */
    public static boolean switching(String id) {
        boolean started = false;
        synchronized (shadows) {
            for (Shadow s : shadows.values()) {
                if (s.done || !s.p.id.equals(id) || s.forMix) continue;
                if (s.share >= 0.5f && s.heard()) return false;
                if (s.mode == Mode.LOCKING) started = true;
            }
        }
        return started;
    }

    /** The take-over's player is ready but YT is paused: it takes over when the song plays. Main thread. */
    public static boolean switchWaitsForPlay(String id) {
        synchronized (shadows) {
            for (Shadow s : shadows.values())
                // paused and ready: not a player still buffering, nor one about to start while YT plays
                if (!s.done && s.p.id.equals(id) && !s.forMix && s.mode == Mode.LOCKING && !s.playing && !s.moving && s.ready()) return true;
        }
        return false;
    }

    /** A player of ours (playing or armed) is on this song: its files must stay. */
    /** The playing song's id, as YT's queue names it (null when unknown). */
    public static String playingId() {
        // the player on YT's playing player knows its song at once; the queue is read every 1.5 s
        try {
            Shadow s = get(PlayerTap.current());
            if (s != null && !s.done) return s.p.id;
        } catch (Throwable ignored) {
        }
        return Automix.queue()[0];
    }

    public static boolean inUse(String id) {
        Shadow a = armed;
        if (a != null && !a.done && a.p.id.equals(id)) return true;
        synchronized (shadows) {
            for (Shadow s : shadows.values()) if (!s.done && s.p.id.equals(id)) return true;
        }
        return false;
    }

    /** The player for this YT player is in step: a mix can hand over to it. */
    static boolean inStep(Object host) {
        Shadow s = get(host);
        return s != null && !s.done && s.mode == Mode.ON && s.ready() && s.settle.inStep(SystemClock.elapsedRealtime(), Engine.nudging(host));
    }


    /** Automix holds YT's next player silent for a mix: the addon's player locks on it now. */
    static void follow(Object host, String id) {
        AddonPrep.Prepared p = AddonPrep.get(id);
        if (host == null || p == null || !AddonSettings.on() || AddonPrep.failed(id)) return;
        Shadow s = get(host);
        if (s != null && s.p == p && !s.done) return;
        Shadow n = begin(host, p, Automix.position(host), false, true);
        if (s != null && n != null) s.end("the mix's next song", false);
    }

    /** Morphe's onPauseVideo: our players stop with YT's at once (the clock check is the backup). */
    static void onPause() {
        pausedAt = SystemClock.elapsedRealtime();
        // each player clears its own mark when its YT player moves again: during a mix one of them
        // moving isn't the other one's resume
        for (Shadow s : list()) s.pausedByYt = true;
        Shadow a = armed;
        if (a != null) a.pausedByYt = true;
        main.post(() -> {
            for (Shadow s : list()) s.play(false);
        });
    }

    private static void tick() {
        long next = TICK_MS;
        try {
            if (!AddonSettings.on()) {
                for (Shadow s : list()) s.end("addons off", false);
                disarm();
                AddonPrep.held = false;
                next = 500;
            } else {
                step();
            }
        } catch (Throwable t) {
            Log.e(TAG, "tick failed", t);
        }
        main.postDelayed(AddonDirect::tick, next);
    }

    private static void disarm() {
        Shadow a = armed;
        armed = null;
        if (a != null) a.end("not needed", false);
    }

    /** protocol.md 8.1.3: the next song is opened this long before the transition. */
    static final long READ_AHEAD_MS = 25_000;

    /**
     * Ms until the playing song hands over: the planned mix's takeover when Automix has one (0 while
     * it runs), else the song's end; -1 when YT's player doesn't say.
     */
    private static long untilTransitionMs() {
        long dur = Automix.durationMs(), pos = Automix.positionMs();
        if (dur <= 0 || pos < 0) return -1;
        long[] z = Automix.zone();
        long at = z != null && z[0] > 0 ? z[0] : dur;
        return Math.max(0, at - pos);
    }

    private static void step() throws Exception {
        long now = SystemClock.elapsedRealtime();
        if (now - lastQueue > 1500) {
            lastQueue = now;
            Automix.pollQueue();
        }
        String[] q = Automix.queue();
        String cur = q[0], next = q[3];
        if (cur != null && q[1] != null && q[2] != null) AddonPrep.request(ctx, cur, q[1], q[2], Features.isMusicVideo(cur), true);
        if (next != null && !next.equals(cur) && q[4] != null && q[5] != null) {
            // the read-ahead (protocol.md 8.1.3): the next song is searched for at once, opened
            // (its /stream call), fetched and fitted from 25 s before the transition
            long left = untilTransitionMs();
            if (left >= 0 && left <= READ_AHEAD_MS) AddonPrep.request(ctx, next, q[4], q[5], Features.isMusicVideo(next), false);
            else AddonPrep.findAhead(ctx, next, q[4], q[5], Features.isMusicVideo(next));
        }

        // the Dolby Atmos switch went off: Atmos audio hands back to YT's (in step underneath) at once,
        // and the songs are asked again in stereo
        boolean atmosNow = AddonSettings.atmos();
        if (atmosWas && !atmosNow) {
            for (Shadow s : list()) if (!s.done && s.p.atmos && !s.p.saved) s.end("Dolby Atmos switched off", false);
            if (armed != null && armed.p.atmos && !armed.p.saved) disarm();
            AddonPrep.dropAtmos();
        }
        atmosWas = atmosNow;

        Object host = PlayerTap.current();
        AddonPrep.Prepared onHost = null;
        if (host != null) {
            // the song on the host: the prepared one (current first, then next: right after YT moves on
            // the queue can still name the song before) whose length is the host's
            double dur = Automix.duration(host) / 1000.0;
            long pos = Automix.position(host);
            for (String id : new String[]{cur, next}) {
                AddonPrep.Prepared c = AddonPrep.get(id);
                if (c != null && dur > 0 && Math.abs(dur - c.ytDurationSec) <= SAME_SONG_SEC && !AddonPrep.failed(id)) {
                    onHost = c;
                    break;
                }
            }
            Shadow s = get(host);
            // the player's menu: YouTube's quality for this song, its audio back at once (on every
            // host: in a mix the song can be on the other player)
            for (Shadow x : list()) if (!x.done && AddonPrep.youtubeChosen(x.p.id)) x.end("YouTube's quality chosen", false);
            // in a mix the incoming song is the engine's: follow() locks it on the held player, silent
            // until the hand-over; it never starts here as a song starting on its own
            boolean mix = Automix.mixing();
            // the length tells songs apart only when they differ by over 2 s: one the queue no longer names
            // (refreshed every 1.5 s) is gone too
            boolean named = cur == null || s == null || s.p.id.equals(cur) || s.p.id.equals(next);
            if (s != null && !s.done && onHost != null && s.p != onHost && s.p.id.equals(onHost.id) && !mix) {
                // a better copy of the same song (the lossless pass, "Upgrade quality"): ours stops,
                // YT carries it while the new one locks on
                AddonPrep.Prepared old = s.p;
                s.end("a better copy is ready", false);
                begin(host, onHost, pos, false, false);
                AddonPrep.retire(old);
            } else if (s != null && !s.done && s.p != onHost && dur > 0 && (Math.abs(dur - s.p.ytDurationSec) > SAME_SONG_SEC || !named)) {
                // YT's player moved to another song: a prepared one carries on on the addon from its
                // start with YT kept silent; else YT's audio comes back
                Shadow n = onHost == null || mix ? null : begin(host, onHost, pos, s.share >= 0.5f, false);
                s.end(n != null ? "the next song is on the addon" : "another song on YT's player", false);
            } else if ((s == null || s.done) && onHost != null && !mix) {
                begin(host, onHost, pos, false, false);
            }
        }
        // the next song's player, armed ahead: a prepared song YT moves to starts on it at once
        AddonPrep.Prepared pn = next == null ? null : AddonPrep.get(next);
        if (armed != null && (pn == null || armed.p != pn || AddonPrep.failed(next))) disarm();
        if (pn != null && pn != onHost && !AddonPrep.failed(next) && armed == null) {
            armed = new Shadow(pn);
            armed.open(0, false);
            if (armed.done) armed = null;
        }
        boolean locking = false;
        for (Shadow s : list()) {
            if (!s.done) {
                try {
                    s.tick(now);
                } catch (Throwable t) {
                    Log.e(TAG, s.p.id + ": tick failed", t);
                    s.end("an error (" + t + ")", true);
                }
            }
            if (s.done) {
                synchronized (shadows) {
                    if (shadows.get(s.host) == s) shadows.remove(s.host);
                }
            } else if (s.host == host && s.mode != Mode.ON) {
                locking = true;
            }
        }
        // a lossy copy that plays: one pass for lossless (protocol.md 8.2.1)
        if (host != null) {
            Shadow on = get(host);
            if (on != null && !on.done && on.mode == Mode.ON) AddonPrep.playing(on.p);
        }
        AddonPlayback.upgrading(AddonPrep.waiting(cur) || locking);
        AddonPrep.held = Automix.mixing();
    }

    /**
     * Our player takes the song on [host]. A song starting (or YT already silent under the addon)
     * plays from where YT is, heard at once; one under way locks silently first. Null when it is
     * too late in the song for an upgrade.
     */
    private static Shadow begin(Object host, AddonPrep.Prepared p, long ytPos, boolean ytSilent, boolean forMix) {
        boolean fromStart = !forMix && (ytPos < START_MS || ytSilent);
        if (!fromStart && ytPos > (p.ytDurationSec - 20) * 1000) return null;
        Shadow n = null;
        if (armed != null && armed.p == p && !armed.done) {
            n = armed;
            armed = null;
        }
        if (n == null) {
            n = new Shadow(p);
            n.open(Math.max(0, ytPos), false);
            if (n.done) return null;
        }
        n.host = host;
        n.forMix = forMix;
        put(host, n);
        // a player not ready yet would start late, and one off YT's start can't be set right
        // unheard: YT carries the start (it is heard anyway) and ours locks on it. Only under a
        // silent YT (the song before was on the addon) ours seeks there, a moment silent.
        if (fromStart && (!n.ready() || (!ytSilent && n.offBy(ytPos) > START_OFF_MS))) fromStart = false;
        if (fromStart) n.startHeard(ytPos, ytSilent);
        else n.startLocking(ytPos);
        return n;
    }

    /** How long a stalled addon player may buffer (YT heard meanwhile) before the song is left to YT. */
    static final long STALL_MS = 15_000;

    enum Mode {ARMED, LOCKING, ON, TAIL}

    /** Our player for one of YT's players (host null while armed). */
    private static final class Shadow {
        Object host;
        final AddonPrep.Prepared p;
        final float gain;
        Object pl;
        Method state, pos, play, vol, speed;
        Mode mode = Mode.ARMED;
        volatile boolean done;
        boolean playing;
        /** Locks on a mix's held incoming player (never started heard). */
        boolean forMix;
        volatile float share;
        float fadeFrom, fadeTo;
        long fadeAt, fadeMs;
        long lastYt = Long.MIN_VALUE, lastYtAt;
        boolean moving;
        final StepClock ytClock = new StepClock(), ourClock = new StepClock();
        int seeks, resyncs;
        long lead = learnedLead, settleUntil, stallFrom, openedAt, tailUntil;
        /** A resync waits for this YT time (ms), the quietest point ahead; MIN_VALUE when none. */
        long resyncAt = Long.MIN_VALUE;
        /** A silent speed nudge runs until then (0: none); a start's seek may buffer until then. */
        long nudgeUntil, startGraceUntil;
        boolean lastWasSeek, pausedJump;
        /** YT paused this player's host (Morphe's onPauseVideo) and it hasn't moved since; one begun just after the pause starts so. */
        volatile boolean pausedByYt = SystemClock.elapsedRealtime() - pausedAt < 400;
        /** The host's patch_getPlaybackState, looked up once per host class (read every tick). */
        private Method hostState;
        private Class<?> hostStateOf;
        /** Our player's audio session (the equalizers), 0 when none yet, -1 when it can't be read. */
        int session;
        private Method sessionOf;
        private long sessionReadAt;
        int grossSeeks;
        long lastM;
        float speedSet = 1f;
        /** The lag after a followed speed change (automix's nudges): not a drift, not a lock. */
        final HeldSettle settle = new HeldSettle();
        /** The running nudge's rate as a factor of YT's speed (1: none). */
        float nudgeFactor = 1f;
        /** The running nudge is a heard trim: the pitch follows its rate (a resample, no stretch). */
        boolean trimming;
        final List<Long> trimErr = new ArrayList<>();
        float lastVol = -1;
        boolean cappedLogged;
        final StringBuilder log = new StringBuilder();

        Shadow(AddonPrep.Prepared p) {
            this.p = p;
            this.gain = p.gainLinear();
        }

        double target(double yt) {
            return yt + p.offsetSec * 1000;
        }

        boolean ready() {
            try {
                return pl != null && (int) state.invoke(pl) == 3;
            } catch (Throwable t) {
                return false;
            }
        }

        /** How far our player is from where a seek to YouTube time ytMs puts it (lead, clamped at 0). */
        long offAt(long ytMs) {
            try {
                return Math.abs((long) pos.invoke(pl) - Math.max(0, Math.round(target(ytMs)) + lead));
            } catch (Throwable t) {
                return Long.MAX_VALUE;
            }
        }

        /** How far our player is from YouTube time ytMs. */
        long offBy(long ytMs) {
            try {
                return Math.abs((long) pos.invoke(pl) - Math.round(target(ytMs)));
            } catch (Throwable t) {
                return Long.MAX_VALUE;
            }
        }

        /** Opens the file at YouTube time ytMs, paused (play: playing). */
        void open(long ytMs, boolean playNow) {
            try {
                openedAt = SystemClock.elapsedRealtime();
                ClassLoader cl = ctx.getClassLoader();
                Class<?> crg = cl.loadClass("crg"), ctb = cl.loadClass("ctb"), dvp = cl.loadClass("dvp"), dme = cl.loadClass("dme"),
                        cmj = cl.loadClass("cmj"), dvy = cl.loadClass("dvy"), cdv = cl.loadClass("cdv"), ceg = cl.loadClass("ceg"),
                        cmq = cl.loadClass("cmq");
                // streamed (AddonPrep.streamAndFit): read in ranges through the addon cache
                Object data = p.stream != null ? CachedDataSource.factory(cl, p.stream) : cmq.getConstructor(Context.class).newInstance(ctx);
                Object ext = dvp.getConstructor().newInstance();
                dvp.getMethod("d").invoke(ext); // constant-bitrate seeking for a header-less MP3
                Object factory = dme.getConstructor(cmj, dvy).newInstance(data, ext);
                Object pl = crg.getMethod("a").invoke(crg.getConstructor(Context.class).newInstance(ctx));
                PlayerTap.markOurs(pl);
                this.pl = pl;
                state = ctb.getMethod("n");
                pos = ctb.getMethod("r");
                play = ctb.getMethod("A", boolean.class);
                vol = ctb.getMethod("E", float.class);
                speed = ctb.getMethod("patch_setPlaybackParameters", float.class, float.class);
                Object mib = cdv.getConstructor().newInstance();
                cdv.getField("b").set(mib, p.stream != null ? Uri.parse("https://addon.stream/" + p.stream.key) : Uri.fromFile(p.file));
                Object src = dme.getMethod("a", ceg).invoke(factory, cdv.getMethod("a").invoke(mib));
                long at = Math.max(0, Math.round(target(ytMs)));
                ctb.getMethod("ae", List.class, long.class).invoke(pl, Collections.singletonList(src), at);
                ctb.getMethod("z").invoke(pl);
                vol.invoke(pl, 0f);
                lastVol = 0;
                audioSession();
                if (playNow) play(true);
                Log.i(TAG, "addon player for " + p + " opened at " + at + " ms");
            } catch (Throwable t) {
                Log.e(TAG, "addon player failed to open", t);
                end("could not open the file", true);
            }
        }

        /** A song starting: heard at once, YT silent; the start error is set right at a quiet point. */
        void startHeard(long ytPos, boolean ytSilent) {
            mode = Mode.ON;
            // a skip pauses YT for a moment (onPauseVideo): not a pause of this song
            if (SystemClock.elapsedRealtime() - pausedAt < 400) pausedByYt = false;
            // a nudge running from the lock: off, at YT's speed
            if (nudgeUntil != 0) {
                nudgeUntil = 0;
                nudgeFactor = 1f;
                trimming = false;
                try {
                    applySpeed();
                } catch (Throwable ignored) {
                }
            }
            trimErr.clear();
            AddonPlayback.playing(pl, p.addon, true, p.ownDecode());
            if (offBy(ytPos) > START_OFF_MS && pl instanceof SeekAccess) {
                // under a silent YT: a seek there, its buffering waited out silently (a moment at a song's start)
                ((SeekAccess) pl).ayham_seekTo(Math.max(0, Math.round(target(ytPos)) + lead));
                startGraceUntil = SystemClock.elapsedRealtime() + 1000;
            }
            // YT already silent under the addon before: it stays silent (the share at once)
            if (ytSilent) setShare(1f);
            else fade(1f, START_FADE_MS);
            Log.i(TAG, p.id + ": starts on the addon (YT at " + ytPos + " ms), YouTube's audio not heard");
        }

        /** A song under way: locked silently, then a crossfade. */
        void startLocking(long ytPos) {
            mode = Mode.LOCKING;
            // a mix's held player is not the song heard yet: the badge stays on the playing one
            if (!forMix) AddonPlayback.playing(pl, p.addon, false, p.ownDecode());
            // opened (or armed) where it is; the first reading of both clocks says how far off
            Log.i(TAG, p.id + ": locking on YT at " + ytPos + " ms");
        }

        /**
         * The player's audio session (0 until its audio track is made, and ExoPlayer may make a new one
         * later: read again each second): YT's equalizer preset on it, and announced to the system's.
         */
        void audioSession() {
            sessionReadAt = SystemClock.elapsedRealtime();
            // "a": the player's audio session (probed: matches audioflinger's)
            int s;
            try {
                if (sessionOf == null) {
                    Method m = pl.getClass().getMethod("a");
                    if (m.getReturnType() != int.class) {
                        session = -1;
                        return;
                    }
                    sessionOf = m;
                }
            } catch (Throwable t) {
                session = -1;   // no such method on this player: not asked again
                Log.w(TAG, "no audio session for the equalizer", t);
                return;
            }
            try {
                s = (int) sessionOf.invoke(pl);
            } catch (Throwable t) {
                return;   // asked again in a second
            }
            if (s <= 0 || s == session) return;
            if (session > 0) Log.i(TAG, p.id + ": the player's audio session changed, " + session + " -> " + s);
            session = s;
            // the old session (if any) is closed and released with it
            app.ayham.extension.music.features.EqPresets.attachDeck(this, s);
            boost(s);
        }

        /** The fit's boost toward YouTube's loudness (the player's volume stops at 1): Android's LoudnessEnhancer. */
        private android.media.audiofx.LoudnessEnhancer enhancer;

        private void boost(int s) {
            releaseBoost();
            double db = p.boostDb();
            if (db < 0.005) return;
            try {
                enhancer = new android.media.audiofx.LoudnessEnhancer(s);
                enhancer.setTargetGain((int) Math.round(db * 100));
                enhancer.setEnabled(true);
                Log.i(TAG, String.format(Locale.US, "%s: boosted %+.2f dB toward YouTube's loudness (LoudnessEnhancer on session %d)", p.id, db, s));
            } catch (Throwable t) {
                releaseBoost();
                Log.w(TAG, p.id + ": no LoudnessEnhancer: it plays " + String.format(Locale.US, "%.2f", db) + " dB under YouTube", t);
            }
        }

        private void releaseBoost() {
            if (enhancer == null) return;
            try {
                enhancer.release();
            } catch (Throwable ignored) {
            }
            enhancer = null;
        }

        void play(boolean on) {
            if (pl == null || playing == on) return;
            playing = on;
            // readings from before a pause don't line up with those after it
            ytClock.reset();
            ourClock.reset();
            // both players' first readings after a start jump about: not read for a moment
            if (on) settleUntil = SystemClock.elapsedRealtime() + 600;
            if (mode != Mode.ARMED) Log.i(TAG, p.id + (on ? ": plays on with YT" : pausedByYt ? ": paused with YT (its pause)" : ": paused with YT (its clock stopped)"));
            try {
                play.invoke(pl, on);
            } catch (Throwable ignored) {
            }
        }

        /** YT's player's base volume (the gate's, before our share) times share and gain. */
        void volume(float base) {
            if (pl == null || done || mode == Mode.ARMED) return;
            AddonPlayback.audible(pl, share >= 0.5f && base > 0);
            float want = base * share * gain;
            if (want > 1f && !cappedLogged) {
                cappedLogged = true;
                Log.w(TAG, String.format(Locale.US, "%s: the gain wants %.3f, the player stops at 1 (%.2f dB short)", p.id, want, 20 * Math.log10(want)));
            }
            float v = Math.min(1f, want);
            if (Math.abs(v - lastVol) < 1e-4f) return;
            lastVol = v;
            try {
                vol.invoke(pl, v);
            } catch (Throwable ignored) {
            }
        }

        void fade(float to, long ms) {
            fadeFrom = share;
            fadeTo = to;
            fadeAt = SystemClock.elapsedRealtime();
            fadeMs = Math.max(1, ms);
        }

        private void setShare(float s) {
            if (s == share) return;
            share = s;
            // YT's player turned down by our share (through the gate), ours set from it
            Engine.reapply(host);
            volume(Engine.gateOut(host));
        }

        /** Heard now: YT lets it through and our share is up. */
        private boolean heard() {
            return share > 0 && Engine.gateOut(host) > 0;
        }

        /** Our player's speed: YT's times the nudge; a trim's pitch follows its factor. */
        private void applySpeed() throws Exception {
            speed.invoke(pl, speedSet * nudgeFactor, trimming ? nudgeFactor : 1f);
        }

        void followSpeed(float s, long now) {
            if (pl == null || Math.abs(s - speedSet) < 0.0005f) return;
            speedSet = s;
            settle.speedChanged(now);
            // a nudge running carries on at the new speed: automix's steps (a second apart) would
            // cut every one short and the lock never get there (m5: 11 corrections, 5 s late)
            if (nudgeUntil == 0) {
                nudgeFactor = 1f;
                trimming = false;
            }
            trimErr.clear();
            // both clocks' lines change speed now, not at their next reading (up to 1 s later)
            ytClock.speed(now, s);
            ourClock.speed(now, s);
            try {
                applySpeed();
            } catch (Throwable ignored) {
            }
            // both clocks follow the speed (StepClock's time line) and both players change it alike, so
            // neither starts again: automix's nudges of a held player (a second apart) would keep the
            // lock from ever reading enough. Their first readings after it are skipped.
            settleUntil = now + 300;
            log.append(String.format(Locale.US, " speed x%.3f;", s));
        }

        void tick(long now) throws Exception {
            if (session >= 0 && pl != null && now - sessionReadAt >= 1000) audioSession();
            if (mode == Mode.ARMED || host == null) return;
            // the crossfade
            if (fadeMs > 0) {
                float k = Math.min(1f, (now - fadeAt) / (float) fadeMs);
                float x = k * k * (3 - 2 * k);
                setShare(fadeFrom + (fadeTo - fadeFrom) * x);
                if (k >= 1) fadeMs = 0;
            }
            Class<?> hc = host.getClass();
            if (hostState == null || hostStateOf != hc) {
                hostState = hc.getMethod("patch_getPlaybackState");
                hostStateOf = hc;
            }
            int hs = (int) hostState.invoke(host);
            if (hs == 1) {
                end("YT's player stopped", false);
                return;
            }
            double hd = Automix.duration(host) / 1000.0;
            if (hd > 0 && Math.abs(hd - p.ytDurationSec) > SAME_SONG_SEC) {
                // the current host's change of song is handled by step(); this is an older player
                if (host != PlayerTap.current()) end("another song on YT's player", false);
                return;
            }
            long yt = Automix.position(host);
            boolean fresh = yt != lastYt;
            long prevYt = lastYt;
            if (fresh && pausedByYt && now - pausedAt < 400) {
                lastYt = yt;   // the pause's last reading
                moving = false;
            } else if (fresh && !moving && prevYt != Long.MIN_VALUE && Math.abs(yt - prevYt) > PAUSED_JUMP_MS) {
                // YT seeked while paused (a scrub): not playing; ours goes there silently below
                lastYt = yt;
                lastYtAt = now;
                pausedJump = true;
            } else if (fresh) {
                lastYt = yt;
                lastYtAt = now;
                moving = true;
                pausedByYt = false;
            } else if (now - lastYtAt > 300 || pausedByYt) {
                moving = false;
            }
            if (hs == 4) moving = false;
            int st = (int) state.invoke(pl);
            if (st == 1) {
                end("the addon player failed", true);
                return;
            }
            if (mode == Mode.TAIL) {
                // the file ended a little before YouTube's song: YT stays silent to its end, unless its
                // player moved on (a next song of the same length, repeat one)
                if (now > tailUntil || (fresh && prevYt != Long.MIN_VALUE && yt < prevYt - 2000)) end("the song ended", false);
                return;
            }
            if (st == 4) {
                long left = Math.round(p.ytDurationSec * 1000) - yt;
                if (left < 3000) {
                    mode = Mode.TAIL;
                    tailUntil = now + left + 1500;
                    Log.i(TAG, p.id + ": the file ended " + left + " ms before YT's song; YT stays silent to its end");
                } else {
                    end("the file ended " + left + " ms early", true);
                }
                return;
            }
            play(moving && target(yt) >= 0);
            if (!moving) {
                stallFrom = 0;
                if (pausedJump) {
                    // ours plays YT's new spot from the resume on: YT's audio until it is in step
                    pausedJump = false;
                    log.append(" YT seeked to ").append(yt).append(" while paused;");
                    if (mode == Mode.ON && heard()) resync("YT seeked while paused", 1);
                    else if (mode == Mode.ON) relock();
                    ytClock.reset();
                    seek(yt, now);
                    lastWasSeek = true;
                    return;
                }
                // a mix's held player: ours waits where it is (the engine seeks it there before it moves)
                if (mode == Mode.LOCKING && forMix && !heard() && st == 3 && offAt(yt) > START_OFF_MS) seek(yt, now);
                // YT paused at the song's start, ours ready there now: it starts heard from it
                if (mode == Mode.LOCKING && !forMix && share == 0 && fadeMs == 0 && yt < START_MS && st == 3
                        && offBy(yt) <= START_OFF_MS) startHeard(yt, false);
                return;
            }
            if (st != 3) {
                // a start's seek under a silent YT: waited out silently
                if (now < startGraceUntil) return;
                // buffering: YT (in step underneath) is heard at once while it lasts
                if (stallFrom == 0) stallFrom = now;
                if (mode == Mode.ON) {
                    boolean was = heard();
                    fadeMs = 0;
                    setShare(0f);
                    mode = Mode.LOCKING;
                    seeks = 0;
                    if (was) Log.w(TAG, p.id + ": the addon player is buffering: YT's audio while it does");
                }
                // locking here always (an ON stall was just made LOCKING): YT is heard while it lasts,
                // so ours gets STALL_MS to recover before the song is YT's for good
                if (now - stallFrom > STALL_MS) end("the addon player stalled", true);
                return;
            }
            stallFrom = 0;
            float ys = Engine.speedOf(host);
            if (Math.abs(ys - speedSet) > 0.0005f) followSpeed(ys, now);
            startGraceUntil = 0;
            long ours = (long) pos.invoke(pl);
            // silent and far off (a mix's held player seeked before its clock has readings): there at once
            if (mode == Mode.LOCKING && !heard() && fadeMs == 0 && fresh && Math.abs(ours - target(yt)) > GROSS_MS) {
                if (++grossSeeks > 5) {
                    end("its seeks don't land", true);
                    return;
                }
                nudgeUntil = 0;
                nudgeFactor = 1f;
                trimming = false;
                applySpeed();
                ytClock.reset();
                seek(yt, now);
                lastWasSeek = true;
                return;
            }
            // a heard trim keeps watching for YT's seeks (a silent nudge's lock sees them after)
            boolean trimJump = trimming && fresh && Math.abs(ours - target(yt)) > SEEK_OVER_MS;
            if (nudgeUntil != 0) {
                if (now < nudgeUntil && !trimJump) return;
                // the nudge is over: back to YT's speed, both clocks read afresh
                nudgeUntil = 0;
                nudgeFactor = 1f;
                trimming = false;
                try {
                    applySpeed();
                } catch (Throwable ignored) {
                }
                ourClock.reset(); // YT's clock reads on
                settleUntil = now + 300;
                if (trimJump) {
                    log.append(" YT jumped to ").append(yt).append(" in a trim;");
                    ytClock.reset();
                    if (mode == Mode.ON && heard()) resync("YT jumped", 1);
                    else if (mode == Mode.ON) relock();
                    seek(yt, now);
                    lastWasSeek = true;
                }
                return;
            }
            if (now < settleUntil) return;
            boolean ytNew = ytClock.see(yt, now, ys), ourNew = ourClock.see(ours, now, speedSet);
            // YT jumped (a seek, automix lining it up): both clocks start again, ours goes there
            if (ytNew && ytClock.n() >= 3 && Math.abs(yt - ytClock.at(now, ys)) > 400) {
                log.append(" YT jumped to ").append(yt).append(';');
                ytClock.reset();
                if (mode == Mode.ON && heard()) resync("YT jumped", 1);
                else if (mode == Mode.ON) relock();
                seek(yt, now);
                lastWasSeek = true;
                return;
            }
            if (TRACE && (ytNew || ourNew)) Log.i(TAG, "trace " + now + " yt " + yt + " ours " + ours + (ytNew ? " Y" : "") + (ourNew ? " O" : "") + " " + mode);
            if (!ytNew || ytClock.n() < 4 || ourClock.n() < 4) return;
            double ytAt = ytClock.at(now, ys);
            long m = Math.round(ourClock.at(now, speedSet) - target(ytAt));
            lastM = m;
            if (TRACE) Log.i(TAG, "clock " + now + " yt " + Math.round(ytAt) + " err " + m + " " + mode);
            boolean nudging = Engine.nudging(host);
            if (mode == Mode.LOCKING) {
                // still crossing to YT (a resync): nothing decided until ours is silent
                if (fadeMs > 0) return;
                // a held player: a speed change's lag is neither the seek's landing nor a lock
                if (forMix && !heard() && !settle.settled(now, nudging)) return;
                if (lastWasSeek) lead -= m; // the seek landed m off: the next one leads by it
                lastWasSeek = false;
                if (Math.abs(m) <= LOCK_MS || (seeks >= 4 && Math.abs(m) <= LOCK_LOOSE_MS)) {
                    mode = Mode.ON;
                    settle.locked();
                    AddonPlayback.hold(pl, false);
                    grossSeeks = 0;
                    learnedLead = lead;
                    if (forMix) AddonPlayback.playing(pl, p.addon, false, p.ownDecode());
                    // a held player (a mix's next song) takes its share at once; it is silent anyway
                    fade(1f, Engine.gateOut(host) > 0 ? FADE_IN_MS : 1);
                    Log.i(TAG, String.format(Locale.US, "%s: in step (%d ms, %d corrections, lead %d ms, %d ms after opening): the addon's audio now;%s",
                            p.id, m, seeks, lead, now - openedAt, log));
                    log.setLength(0);
                } else {
                    log.append(" err ").append(m).append(';');
                    correct(m, ytAt, now);
                }
                return;
            }
            // heard: drifted? set right at the quietest point of the next seconds
            // a silent one (a mix's held player) is held to the lock's own tolerance for the hand-over
            long tolerance = heard() ? DRIFT_MS : LOCK_LOOSE_MS;
            // a settled reading within it confirms the lock after a speed change (the hand-over waits for one)
            boolean settledReading = settle.reading(now, nudging, m, tolerance);
            if (Math.abs(m) > tolerance) {
                if (!heard()) {
                    // a followed speed change's lag, not a drift: read again once both players run at it
                    if (!settledReading) return;
                    // silent (a mix's held player): locked again before a hand-over can take it
                    relock();
                    log.append(" err ").append(m).append(';');
                    correct(m, ytAt, now);
                    return;
                }
                if (resyncAt == Long.MIN_VALUE) {
                    double ahead = Math.abs(m) > 80 ? 2 : 10;
                    double q = p.quietest(ytAt / 1000 + 0.3, Math.min(ytAt / 1000 + ahead, p.ytDurationSec - 1));
                    resyncAt = Double.isNaN(q) ? Math.round(ytAt) : Math.round(q * 1000);
                    Log.i(TAG, String.format(Locale.US, "%s: %d ms off YT's clock: resync at %.2f s (%.1f dBFS there)", p.id, m, resyncAt / 1000.0, p.levelAt(resyncAt / 1000.0)));
                }
            } else {
                resyncAt = Long.MIN_VALUE;
                if (heard()) trim(m, now);
            }
            if (resyncAt != Long.MIN_VALUE && ytAt >= resyncAt) {
                Log.i(TAG, String.format(Locale.US, "%s: resync at %.2f s (%.1f dBFS there)", p.id, ytAt / 1000.0, p.levelAt(ytAt / 1000.0)));
                resync(String.format(Locale.US, "%d ms off", m), RESYNC_FADE_MS);
            }
        }

        /**
         * A resync: the sound crosses to YT (in step underneath, so nothing goes silent), ours locks
         * silently and crosses back. fadeMs 1: at once (YT jumped, ours plays the wrong spot).
         */
        private void resync(String why, long fadeMs) {
            resyncs++;
            resyncAt = Long.MIN_VALUE;
            mode = Mode.LOCKING;
            AddonPlayback.hold(pl, true);
            seeks = 0;
            trimErr.clear();
            fade(0f, fadeMs);
            log.append(" resync (").append(why).append(");");
        }

        /** Not heard and off: locking again, so inStep() says no until it is in step. */
        private void relock() {
            // silent while it locks (a gate opening now lets YT through, not our corrections)
            fadeMs = 0;
            setShare(0f);
            mode = Mode.LOCKING;
            AddonPlayback.hold(pl, true);
            seeks = 0;
            trimErr.clear();
            resyncAt = Long.MIN_VALUE;
        }

        /** Heard, in step: a steady error past TRIM_MS taken back by an unheard resample. */
        private void trim(long m, long now) {
            trimErr.add(m);
            if (trimErr.size() < TRIM_N) return;
            List<Long> s = new ArrayList<>(trimErr);
            trimErr.clear();
            Collections.sort(s);
            long med = s.get(s.size() / 2);
            if (Math.abs(med) <= TRIM_MS) return;
            float f = 1 + (med > 0 ? -TRIM_RATE : TRIM_RATE);
            nudgeFactor = f;
            trimming = true;
            try {
                applySpeed();
            } catch (Throwable t) {
                nudgeFactor = 1f;
                trimming = false;
                return;
            }
            nudgeUntil = now + Math.max(1, Math.round(Math.abs(med) / (speedSet * TRIM_RATE)));
            Log.i(TAG, String.format(Locale.US, "%s: %d ms off YT in step: trimmed at x%.3f for %d ms", p.id, med, f, nudgeUntil - now));
        }

        /** Silent: a seek when far off, else a speed nudge for as long as m takes. */
        private void correct(long m, double ytAt, long now) {
            if (Math.abs(m) > SEEK_OVER_MS) {
                seek(Math.round(ytAt), now);
                lastWasSeek = true;
                return;
            }
            float k = Math.min(MAX_NUDGE, Math.abs(m) / (float) (NUDGE_MS * speedSet));
            nudgeFactor = 1 + (m > 0 ? -k : k);
            float r = speedSet * nudgeFactor;
            try {
                speed.invoke(pl, r, 1f);
            } catch (Throwable t) {
                seek(Math.round(ytAt), now);
                lastWasSeek = true;
                return;
            }
            seeks++;
            nudgeUntil = now + Math.max(1, Math.round(Math.abs(m) / (speedSet * k)));
            log.append(String.format(Locale.US, " nudge x%.3f %d ms;", r, nudgeUntil - now));
        }

        private void seek(long ytAt, long now) {
            long at = Math.max(0, Math.round(target(ytAt)) + lead);
            if (pl instanceof SeekAccess) ((SeekAccess) pl).ayham_seekTo(at);
            seeks++;
            ourClock.reset(); // YT's clock reads on (a jump of YT's resets it where it is seen)
            settleUntil = now + 200;
            log.append(" seek ").append(at).append(" (lead ").append(lead).append(");");
        }

        void end(String why, boolean failed) {
            if (done) return;
            done = true;
            share = 0;
            fadeMs = 0;
            if (host != null) {
                try {
                    // YT's volume set again: another player of ours may carry on on this host (its share)
                    Engine.reapply(host);
                } catch (Throwable ignored) {
                }
            }
            Object x = pl;
            pl = null;
            app.ayham.extension.music.features.EqPresets.releaseDeck(this);
            releaseBoost();
            session = 0;
            if (x != null) {
                try {
                    x.getClass().getMethod("A", boolean.class).invoke(x, false);
                    x.getClass().getMethod("L").invoke(x);
                } catch (Throwable t) {
                    Log.w(TAG, "release failed", t);
                }
                PlayerTap.forget(x);
                AddonPlayback.stopped(x);
            }
            if (mode != Mode.ARMED || failed)
                Log.i(TAG, p.id + ": " + (failed ? "YT's audio again" : "done") + " (" + why + (resyncs > 0 ? ", " + resyncs + " resyncs" : "") + ")");
            if (failed) AddonPrep.dropped(p.id, why);
        }
    }

    // ---- debug (spike prop directTest=1) ----

    /**
     * adb shell am broadcast -p PKG -a app.ayham.ADDON_TEST [--ef speed 1.05] [--el seekMs 60000 | --el leftMs 45000]
     * [--es fail release|truncate] [--es upgrade VIDEO_ID] [--es playNext ID,ID,...]: YT's speed or position, or a failure
     * of our player (released as by a crash; its file cut short and read again); the menu's Upgrade quality; Mix files'
     * "Play these mixes".
     */
    private static void registerTest() {
        BroadcastReceiver r = new BroadcastReceiver() {
            @Override
            public void onReceive(Context c, Intent i) {
                try {
                    if (i.hasExtra("upgrade")) {
                        // the menu's "Upgrade quality" for this song
                        Log.i(TAG, "test: upgrade " + i.getStringExtra("upgrade"));
                        app.ayham.extension.music.addons.AddonPrep.upgrade(i.getStringExtra("upgrade"));
                        return;
                    }
                    if (i.hasExtra("playNext")) {
                        // Mix files' "Play these mixes" while a song plays: a fresh queue of these, in order
                        java.util.List<String> ids = java.util.Arrays.asList(i.getStringExtra("playNext").split(","));
                        Log.i(TAG, "test: play next " + ids);
                        Automix.playNext(ids, why -> Log.i(TAG, "test: play next: " + (why == null ? "queued" : why)));
                        return;
                    }
                    Object host = PlayerTap.current();
                    if (host == null) return;
                    if (i.hasExtra("speed")) {
                        float s = i.getFloatExtra("speed", 1f);
                        Engine.speed(host, s);
                        Log.i(TAG, "test: YT's speed x" + s);
                    }
                    if ((i.hasExtra("seekMs") || i.hasExtra("leftMs")) && host instanceof SeekAccess) {
                        // leftMs: that far before the song's end
                        long to = i.hasExtra("leftMs") ? Automix.duration(host) - i.getLongExtra("leftMs", 0) : i.getLongExtra("seekMs", 0);
                        ((SeekAccess) host).ayham_seekTo(Math.max(0, to));
                        Log.i(TAG, "test: YT seeked to " + to);
                    }
                    String fail = i.getStringExtra("fail");
                    Shadow s = get(host);
                    if (fail != null && s != null && s.pl != null) {
                        Log.i(TAG, "test: fail " + fail + " at YT " + Automix.position(host) + " ms");
                        if ("release".equals(fail)) {
                            s.pl.getClass().getMethod("L").invoke(s.pl);
                        } else if ("truncate".equals(fail) && s.p.file == null) {
                            Log.i(TAG, "test: truncate: a streamed song has no file of its own");
                        } else if ("truncate".equals(fail)) {
                            try (RandomAccessFile f = new RandomAccessFile(s.p.file, "rw")) {
                                f.setLength(4096);
                            }
                            // behind the played part, which the player no longer holds: it reads the file again
                            long at = (long) s.pos.invoke(s.pl);
                            ((SeekAccess) s.pl).ayham_seekTo(Math.max(0, at - 2000));
                        }
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "test failed", t);
                }
            }
        };
        IntentFilter f = new IntentFilter("app.ayham.ADDON_TEST");
        if (Build.VERSION.SDK_INT >= 33) ctx.registerReceiver(r, f, Context.RECEIVER_EXPORTED);
        else ctx.registerReceiver(r, f);
        Log.i(TAG, "test hooks armed: app.ayham.ADDON_TEST");
    }
}
