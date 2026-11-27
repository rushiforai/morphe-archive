package app.ayham.extension.music.automix;

import app.ayham.extension.music.addons.AddonPrep;
import app.ayham.extension.music.addons.AddonSettings;
import app.ayham.extension.music.features.Features;
import app.ayham.extension.music.features.MusicVideoType;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import java.lang.reflect.Method;
import java.util.Locale;

import app.ayham.extension.music.features.PlayerTap;

/**
 * Automix, the YT Music Extension's (BitChord web's AutoDJ) on the phone: the playing song and the
 * one the queue plays next are analysed, the mix between them is planned afresh every tick until
 * it is near (the loop mix when both have instrumental bars to loop, else the blend or filter mix of
 * the version picked in the settings), and our own decks play it. A song too short, a repeat-one,
 * or a pair the planner can only crossfade is left to Morphe's crossfade.
 */
public final class Automix {
    static final String TAG = "AyhamAutomix";
    private static final String JAM = "app.morphe.extension.music.patches.jam.YouTubeMusicBridge";
    private static final String MORPHE_CROSSFADE = "app.morphe.extension.music.patches.CrossfadePatch";
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final long TICK_MS = 250;
    /** The mix is built this long before its takeover. */
    private static final double TAIL_LEAD = 14;
    /**
     * The earliest a mix may start, from the playhead: the takeover's lead and 2.5 s for the engine to get
     * the incoming player onto YT's clock. Per platform (the PC: 4.5 s); docs/phone-vs-spec.md.
     */
    private static final double EARLIEST_LEAD = Mix.HAND_LEAD + 2.5;

    private static Context app;
    private static boolean started;

    private Automix() {
    }

    public static Context context() {
        return app;
    }

    // ---------------------------------------------------------------------------------------------
    // Settings (Morphe's settings screen, its morphe_prefs file)

    static final String KEY_ENABLED = "ayham_automix_enabled", KEY_VERSION = "ayham_automix_version",
            KEY_BARS = "ayham_automix_bars", KEY_KEY_AWARE = "ayham_automix_key_aware";

    static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("morphe_prefs", Context.MODE_PRIVATE);
    }

    static boolean enabled() {
        return app != null && prefs(app).getBoolean(KEY_ENABLED, true);
    }

    static Planner.Settings settings() {
        SharedPreferences p = prefs(app);
        Planner.Settings s = new Planner.Settings();
        // Original (1) is retired like on the PC: a saved 1 plays Classic (2); version 1's code stays for the audit
        String v = p.getString(KEY_VERSION, "2");
        s.version = "3".equals(v) ? 3 : 2;
        s.keyAware = p.getBoolean(KEY_KEY_AWARE, false);
        String bars = p.getString(KEY_BARS, "auto");
        try {
            s.bars = "auto".equals(bars) ? 0 : Integer.parseInt(bars);
        } catch (NumberFormatException e) {
            s.bars = 8;
        }
        return s;
    }

    // ---------------------------------------------------------------------------------------------
    // Hooks

    /** Injection point (through Features): MusicActivity.onCreate. */
    public static void onActivityCreate(Activity activity) {
        app = activity.getApplicationContext();
        if (started) return;
        started = true;
        main.postDelayed(Automix::tick, 2000);
        AddonDirect.start(app);
        SungLyrics.defaultToPcOrder(app);
        Log.i(TAG, "automix ready (" + (enabled() ? "on" : "off") + ")");
    }

    /** Injection point: the start of YT's ExoPlayer.setVolume(float). */
    public static float gate(Object player, float volume) {
        return Engine.gate(player, volume);
    }
    /** Injection point (through Features): Morphe's crossfade has a new player. True when a mix takes it. */
    public static boolean onIncomingPlayerReady(Object player) {
        Engine e = engine;
        return e != null && e.running() && e.onIncoming(player);
    }

    /** Injection point: Morphe's CrossfadePatch.onPauseVideo (a pause, or the first step of a skip). */
    public static void onPauseVideo() {
        AddonDirect.onPause();
        Engine e = engine;
        if (e == null || !e.running()) return;
        // our own "next" pauses too, 10-50 ms before the stop, and the next song's load can: a pause
        // between our Next and the new song isn't the listener's (spec playback.md, the queue during
        // a mix, rule 3). The listener's stops the mix at once in every phase (rule 5): a tap on the
        // play button to pause, or YT's session reading paused (never over our Next: it buffers) for
        // PAUSED_READS checks in a row. Watched past the grace, plus YT's ~1 s lag after a tap.
        final long since = SystemClock.elapsedRealtime() - askedAt, from = SystemClock.elapsedRealtime();
        main.post(new Runnable() {
            int reads;

            @Override
            public void run() {
                if (engine != e || !e.running()) return;
                reads = Features.ytSessionPaused() ? reads + 1 : 0;
                if (listenersPause(since, Features.ytTapPaused(), reads)) {
                    e.stopNow("paused");
                    return;
                }
                if (SystemClock.elapsedRealtime() - from < NEXT_GRACE_MS - since + 1500) main.postDelayed(this, PAUSE_CHECK_MS);
            }
        });
    }

    /** Our Next's grace (rule 3), how often a pause in it is checked, and how many paused reads hold. */
    static final long NEXT_GRACE_MS = 3000, PAUSE_CHECK_MS = 120;
    static final int PAUSED_READS = 2;

    /**
     * A YT pause [sinceNextMs] after our Next is the listener's: away from our Next, a tap on the play
     * button to pause, or YT's session paused [pausedReads] checks in a row.
     */
    static boolean listenersPause(long sinceNextMs, boolean tapPaused, int pausedReads) {
        return sinceNextMs >= NEXT_GRACE_MS || tapPaused || pausedReads >= PAUSED_READS;
    }

    /** Morphe's crossfade length while a mix plays: short, out of the way (our gate holds both players). */
    public static long crossfadeMs() {
        Engine e = engine;
        if (e != null && e.running()) return 300;
        // No transition for the pair coming up (editor.md §2): no crossfade either, -1 says so
        return noTransition && enabled() ? -1 : 0;
    }

    /** The playing song's pair is set to No transition: A plays to its end, then B from its start. */
    private static volatile boolean noTransition;

    static volatile long askedAt;

    // ---------------------------------------------------------------------------------------------
    // The queue (Morphe's Jam bridge to YT's queue)

    private static volatile String curId, nextId, curTitle, curArtist, nextTitle, nextArtist;
    private static volatile long queueAt;
    private static volatile boolean queueBusy;

    /** The song YT's queue plays next, or null. */
    public static String nextId() {
        return nextId;
    }

    public static String currentId() {
        return curId;
    }

    /**
     * The current song's id, only when the queue's title for it is [title]: the queue is read on
     * Automix's tick, so with Automix off it can still name the song before.
     */
    public static String currentIdFor(String title) {
        String id = curId, t = curTitle;
        if (id == null || t == null || title == null) return null;
        return t.trim().equalsIgnoreCase(title.trim()) ? id : null;
    }

    static String nextIdNow() {
        return nextId;
    }

    /** The queue as last read: {current id, title, artist, next id, title, artist}. */
    static String[] queue() {
        return new String[]{curId, curTitle, curArtist, nextId, nextTitle, nextArtist};
    }

    /** Reads the queue (main thread) when automix's tick hasn't lately: the addons need it with automix off. */
    static void pollQueue() {
        if (SystemClock.elapsedRealtime() - queueAt > 1400) readQueue();
    }

    /** The song version lookup reads the queue too (for the next song), with or without automix. */
    public static void refreshQueue() {
        main.postDelayed(Automix::readQueue, 1500);
    }

    private static void readQueue() {
        if (queueBusy) return;
        try {
            Class<?> bridge = Class.forName(JAM);
            java.lang.reflect.Field f = bridge.getDeclaredField("queue");
            f.setAccessible(true);
            Object access = ((java.lang.ref.WeakReference<?>) f.get(null)).get();
            if (access == null) return;
            Class<?> type = Class.forName(JAM + "$QueueAccess");
            java.util.concurrent.Executor exec = (java.util.concurrent.Executor) type.getMethod("patch_jamExecutor").invoke(access);
            queueBusy = true;
            exec.execute(() -> {
                try {
                    int current = (int) type.getMethod("patch_jamCurrent").invoke(access);
                    Object[] items = (Object[]) type.getMethod("patch_jamItems").invoke(access);
                    Method videoId = type.getMethod("patch_jamVideoId", Object.class);
                    Method title = type.getMethod("patch_jamTitle", Object.class), artist = type.getMethod("patch_jamArtist", Object.class);
                    Object curItem = items != null && current >= 0 && current < items.length ? items[current] : null;
                    Object nextItem = items != null && current + 1 < items.length ? items[current + 1] : null;
                    if (nextItem == null) {
                        Object[] auto = (Object[]) type.getMethod("patch_jamAutoplayItems").invoke(access);
                        if (auto != null && auto.length > 0) nextItem = auto[0];
                    }
                    String cur = curItem == null ? null : (String) videoId.invoke(access, curItem);
                    String next = nextItem == null ? null : (String) videoId.invoke(access, nextItem);
                    curTitle = curItem == null ? null : (String) title.invoke(access, curItem);
                    if (curItem != null) remember((String) videoId.invoke(access, curItem), curTitle, (String) artist.invoke(access, curItem));
                    if (nextItem != null) remember((String) videoId.invoke(access, nextItem), (String) title.invoke(access, nextItem), (String) artist.invoke(access, nextItem));
                    curArtist = curItem == null ? null : (String) artist.invoke(access, curItem);
                    nextTitle = nextItem == null ? null : (String) title.invoke(access, nextItem);
                    nextArtist = nextItem == null ? null : (String) artist.invoke(access, nextItem);
                    curId = cur;
                    MusicVideoType.request(cur);
                    MusicVideoType.request(next);
                    // the next two songs' canvas loops, fetched ahead (Prism's CanvasAhead)
                    java.util.List<String[]> ahead = new java.util.ArrayList<>();
                    Object[] auto = null;
                    for (int k = 1; ahead.size() < 2 && k <= 4; k++) {
                        Object it = items != null && current + k < items.length ? items[current + k] : null;
                        if (it == null) {
                            if (auto == null) auto = (Object[]) type.getMethod("patch_jamAutoplayItems").invoke(access);
                            int ai = k - (items == null ? 0 : Math.max(0, items.length - current - 1)) - 1;
                            it = auto != null && ai >= 0 && ai < auto.length ? auto[ai] : null;
                        }
                        if (it == null) break;
                        ahead.add(new String[]{(String) videoId.invoke(access, it), (String) title.invoke(access, it), (String) artist.invoke(access, it)});
                    }
                    Features.canvasAhead(ahead);
                    nextId = next;
                    queueAt = SystemClock.elapsedRealtime();
                } catch (Throwable t) {
                    Log.w(TAG, "queue read failed", t);
                } finally {
                    queueBusy = false;
                }
            });
        } catch (Throwable t) {
            queueBusy = false;
            Log.w(TAG, "queue read failed", t);
        }
    }

    /** playNext's answer when YT's queue has no playing song to add after. */
    static final String NOTHING_PLAYING = "nothing playing";

    /**
     * Play these mixes (mix-file.md rule 7): a fresh queue of [ids]. The queue before it goes (all
     * but the playing song), [ids] are added behind the playing song with YT's own "Play next" (each
     * one right after it, so last first), and the first plays; when it is the playing song, it plays
     * on, else the old song is removed once the first plays. [done] gets null, or why not
     * (NOTHING_PLAYING when nothing is), on the main thread.
     */
    static void playNext(java.util.List<String> ids, java.util.function.Consumer<String> done) {
        try {
            Class<?> bridge = Class.forName(JAM);
            java.lang.reflect.Field f = bridge.getDeclaredField("queue");
            f.setAccessible(true);
            Object access = ((java.lang.ref.WeakReference<?>) f.get(null)).get();
            if (access == null) {
                main.post(() -> done.accept(NOTHING_PLAYING));
                return;
            }
            Class<?> type = Class.forName(JAM + "$QueueAccess");
            Method encode = Class.forName(JAM.substring(0, JAM.lastIndexOf('.')) + ".QueueCommand").getMethod("encode", String.class, boolean.class);
            Method enqueue = type.getMethod("patch_jamEnqueue", byte[].class);
            java.util.concurrent.Executor exec = (java.util.concurrent.Executor) type.getMethod("patch_jamExecutor").invoke(access);
            exec.execute(() -> {
                try {
                    String cur = queuedAt(access, type, 0);
                    if (cur == null) {
                        main.post(() -> done.accept(NOTHING_PLAYING));
                        return;
                    }
                    // the fresh queue: all but the playing song goes, so nothing queued before is
                    // merged with the file's songs or plays between them
                    Object[] items = (Object[]) type.getMethod("patch_jamItems").invoke(access);
                    int current = (int) type.getMethod("patch_jamCurrent").invoke(access);
                    Object playing = items[current];
                    Method remove = type.getMethod("patch_jamRemoveItem", Object.class);
                    for (int i : MixFile.clearOrder(items.length, current)) remove.invoke(access, items[i]);
                    java.util.List<String> add = MixFile.freshAdds(ids, cur);
                    // one at a time, the last first: YT adds each once its server answers, so songs
                    // sent together land in whatever order the answers come
                    addInOrder(access, type, exec, enqueue, encode, add, add.size() - 1, 0, () -> {
                        if (cur.equals(ids.get(0))) {
                            // plays on (or starts, when YT's restored queue holds it paused)
                            main.post(() -> {
                                ytControls(context(), t -> t.play());
                                done.accept(null);
                            });
                        } else skipWhenNext(access, type, exec, ids.get(0), ids.contains(cur) ? null : playing, 0, done);
                    });
                } catch (Throwable t) {
                    Log.w(TAG, "play next failed", t);
                    main.post(() -> done.accept("YouTube Music's queue refused the songs"));
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "play next failed", t);
            main.post(() -> done.accept(NOTHING_PLAYING));
        }
    }

    /**
     * Adds add[i] right after the playing song, waits (3 s at most) until YT lists it there, then
     * add[i - 1]; [then] once all are in. A song YT lists under another id only costs the wait.
     */
    private static void addInOrder(Object access, Class<?> type, java.util.concurrent.Executor exec, Method enqueue, Method encode,
                                   java.util.List<String> add, int i, int tries, Runnable then) {
        if (i < 0) {
            then.run();
            return;
        }
        exec.execute(() -> {
            try {
                if (tries == 0) enqueue.invoke(access, (Object) encode.invoke(null, add.get(i), true));
                String next = queuedAt(access, type, 1);
                if (add.get(i).equals(next) || tries >= 30) {
                    if (tries >= 30) Log.w(TAG, "play next: " + add.get(i) + " not listed after 3 s");
                    addInOrder(access, type, exec, enqueue, encode, add, i - 1, 0, then);
                } else main.postDelayed(() -> addInOrder(access, type, exec, enqueue, encode, add, i, tries + 1, then), 100);
            } catch (Throwable t) {
                Log.w(TAG, "play next failed", t);
                then.run();
            }
        });
    }

    /** The video id [k] places after the playing song in YT's queue (0: the playing song), or null. */
    private static String queuedAt(Object access, Class<?> type, int k) throws Exception {
        int current = (int) type.getMethod("patch_jamCurrent").invoke(access);
        Object[] items = (Object[]) type.getMethod("patch_jamItems").invoke(access);
        int i = current + k;
        if (items == null || current < 0 || i >= items.length) return null;
        return (String) type.getMethod("patch_jamVideoId", Object.class).invoke(access, items[i]);
    }

    /**
     * Next (the listener's, not automix's) once [first] is next in line; 6 s at most. Then [old] (the
     * song that was playing, null to keep it) leaves the queue once [first] plays.
     */
    private static void skipWhenNext(Object access, Class<?> type, java.util.concurrent.Executor exec, String first, Object old,
                                     int tries, java.util.function.Consumer<String> done) {
        main.postDelayed(() -> exec.execute(() -> {
            String next;
            try {
                next = queuedAt(access, type, 1);
            } catch (Throwable t) {
                next = null;
            }
            if (first.equals(next)) {
                main.post(() -> {
                    ytControls(context(), t -> {
                        t.skipToNext();
                        t.play();
                    });
                    if (old != null) removeWhenPlaying(access, type, exec, first, old, 0);
                    done.accept(null);
                });
            } else if (tries < 30) skipWhenNext(access, type, exec, first, old, tries + 1, done);
            else main.post(() -> done.accept("the songs were added after this one, but YouTube Music didn't list them in time to play the first"));
        }), 200);
    }

    /** Removes [old] from YT's queue once [first] is the playing song; 3 s at most, else it stays. */
    private static void removeWhenPlaying(Object access, Class<?> type, java.util.concurrent.Executor exec, String first, Object old, int tries) {
        main.postDelayed(() -> exec.execute(() -> {
            try {
                if (first.equals(queuedAt(access, type, 0))) {
                    Object[] items = (Object[]) type.getMethod("patch_jamItems").invoke(access);
                    int current = (int) type.getMethod("patch_jamCurrent").invoke(access);
                    for (int i = 0; i < items.length; i++)
                        if (items[i] == old && i != current) type.getMethod("patch_jamRemoveItem", Object.class).invoke(access, old);
                } else if (tries < 15) removeWhenPlaying(access, type, exec, first, old, tries + 1);
            } catch (Throwable t) {
                Log.w(TAG, "play these mixes: the old song stayed", t);
            }
        }), 200);
    }

    /**
     * YT Music's own transport controls (main thread), as the listener's own press: its media session,
     * reached through its MediaBrowserService. Not the system's media keys, which go to whichever app
     * played last (another player's, while YT is paused).
     */
    private static void ytControls(Context c, java.util.function.Consumer<android.media.session.MediaController.TransportControls> act) {
        android.content.ComponentName service = new android.content.ComponentName(c.getPackageName(),
                "com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService");
        android.media.browse.MediaBrowser[] b = new android.media.browse.MediaBrowser[1];
        b[0] = new android.media.browse.MediaBrowser(c, service, new android.media.browse.MediaBrowser.ConnectionCallback() {
            @Override
            public void onConnected() {
                try {
                    act.accept(new android.media.session.MediaController(c, b[0].getSessionToken()).getTransportControls());
                } catch (Throwable t) {
                    Log.w(TAG, "YT's controls failed", t);
                } finally {
                    b[0].disconnect();
                }
            }

            @Override
            public void onConnectionFailed() {
                Log.w(TAG, "YT's media session not reached");
            }
        }, null);
        b[0].connect();
    }

    // ---------------------------------------------------------------------------------------------
    // The tick (crossfade.js's automix tick)

    private static final class Song {
        final String id;
        String state = "idle"; // idle | building | armed | mixing | done | off
        Planner.Plan plan;
        String shown;
        /** Automix v2: why the loop mix or the blend plays (loopOrBlend), or null. */
        String choice;
        double takeover;
        /** The song's length when planned (a skip changes it before the queue is read again). */
        double dur;
        boolean loopPending;
        /** Why this pair has no loop mix, for the label (its own pair's state, not another's), or null. */
        String noLoopWhy;
        /** The loop mix chosen for this song, or null (a blend or crossfade). */
        Planner.LoopPlan loop;
        /** A mix that couldn't be built: not tried again before this (elapsedRealtime ms). */
        long buildRetryAt;

        Song(String id) {
            this.id = id;
        }
    }

    private static Song amx = new Song("");
    private static volatile Engine engine;

    /** A mix is on (from its build to its end). */
    static boolean mixing() {
        Engine e = engine;
        return e != null && e.running();
    }
    private static Object lastPlayer;
    private static double lastDur, lastPos;

    // the loop mix, prepared once per pair in the background
    private static volatile String loopKey = "", loopState = "idle";
    /** A pair whose decoded audio was not there yet (still being decoded again) is tried again from then. */
    private static volatile long loopRetryAt;
    private static volatile Planner.LoopPlan loopPlan;

    private static void tick() {
        try {
            step();
        } catch (Throwable t) {
            Log.e(TAG, "tick failed", t);
        }
        main.postDelayed(Automix::tick, TICK_MS);
    }

    private static void step() {
        if (!enabled()) return;
        Object player;
        try {
            player = PlayerTap.current();
        } catch (Throwable t) {
            player = null;
        }
        if (player == null) return;
        long now = SystemClock.elapsedRealtime();
        double pos0 = position(player) / 1000.0, dur0 = duration(player) / 1000.0;
        // a skip: the length changes or the position jumps back, so the queue is read now
        boolean jumped = dur0 > 0 && (Math.abs(dur0 - lastDur) > 0.5 || pos0 < lastPos - 3);
        if (dur0 > 0) {
            lastDur = dur0;
            lastPos = pos0;
        }
        if (player != lastPlayer || jumped || now - queueAt > 1500) {
            lastPlayer = player;
            readQueue();
        }
        String id = curId, next = nextId;
        if (id == null) return;
        Engine e = engine;
        String hold = hold();
        if (!java.util.Objects.equals(hold, lastHold)) {
            if (hold != null) Log.i(TAG, "no mix: " + hold);
            lastHold = hold;
        }
        // a mix armed but not begun is let go (playback.md: the sleep timer plays the song to its end)
        if (hold != null && e != null && e.running() && amx.state.equals("armed") && id.equals(e.m.outId)) e.abort(hold, false);
        if (e != null && e.running()) return;
        playSpeed(player, id, next);
        double pos = position(player) / 1000.0, dur = duration(player) / 1000.0;
        if (pos < 0 || !(dur > 0)) return;
        if (!id.equals(amx.id)) amx = new Song(id);
        // a song whose mix began and ended (or was cut short by going back) is played again from well
        // before its mix: planned again, or it stayed "done" and the overview said "Planning the mix…"
        // (phone, 2026-11-21: back three times during Vaina Loca > Si No Es Contigo). Its length too,
        // so YT's queue still naming it just after it moved on isn't taken for that.
        if (amx.state.equals("done") && pos < amx.takeover - 5 && Math.abs(amx.dur - dur) < 0.5) {
            Log.i(TAG, String.format(Locale.US, "%s is back at %.1f s, before its mix at %.1f s: planned again", id, pos, amx.takeover));
            amx.state = "idle";
            amx.shown = null;
        }
        if (dur < 30 || repeatOne() || hold != null) return;

        Analyzer.request(app, id, true);
        if (next != null && !next.equals(id)) Analyzer.request(app, next, false);
        if (!amx.state.equals("idle")) {
            if (amx.state.equals("armed") && pos > amx.takeover + 1) amx.state = "idle";
            return;
        }

        Analysis from = Analyzer.get(app, id), to = next != null ? Analyzer.get(app, next) : null;
        // music videos (known from the song-version lookup): no loop mix, as in the extension
        if (from != null) from.musicVideo = Features.isMusicVideo(id);
        if (to != null) to.musicVideo = Features.isMusicVideo(next);
        // where each song is sung, from its synced lyrics (the extension's first source; else the mask)
        SungLyrics.request(app, id, curTitle, curArtist, from != null ? from.durationSec : dur);
        if (to != null && next != null && !next.equals(id)) SungLyrics.request(app, next, nextTitle, nextArtist, to.durationSec);
        Planner.Sung sung = sung(id, next);
        boolean lyricsWait = (sung.out == null && SungLyrics.pending(id)) || (sung.in == null && SungLyrics.pending(next));
        Planner.Settings s = settings();
        // the editor's override for this pair: Loop asks for the loop mix (planned as Auto besides);
        // anything else means no loop mix (crossfade.js: loopPicked, noLoop)
        MixOverride ov = next == null ? null : override(id + ">" + next);
        noTransition = ov != null && ov.noTransition();
        // each song's playlist speed (spotify-mixes.md rule 10); the loop mix has its own tempo: none then
        double sOut = songSpeed(id, next), sIn = next == null ? 1 : MixOverride.songSpeed(ov, null);
        boolean speeds = Math.abs(sOut - 1) >= 1e-4 || Math.abs(sIn - 1) >= 1e-4;
        boolean noLoop = ov != null && !ov.loop() || speeds;
        MixOverride pick = ov != null && !ov.loop() ? ov : null;
        Planner.Plan usual = Planner.plan(s, id, next, from, to, dur, pos, pos + EARLIEST_LEAD, sung, pick, sOut, sIn);
        // a pair is looked at again when its lyrics arrive
        String pair = id + ">" + next + "|" + (sung.out != null ? "L" : "m") + (sung.in != null ? "L" : "m");
        if (!noLoop && next != null && from != null && to != null && !lyricsWait && (!pair.equals(loopKey)
                || (loopState.equals("missing") && SystemClock.elapsedRealtime() >= loopRetryAt))) prepareLoop(s.version, id, next, from, to, pos, loopSung(id, next), pair);
        boolean loopPending = !noLoop && (lyricsWait || pair.equals(loopKey) && (loopState.equals("loading") || loopState.equals("missing")));
        Planner.LoopPlan lp = !noLoop && pair.equals(loopKey) && loopState.equals("ready") ? loopPlan : null;
        amx.loopPending = loopPending;
        amx.noLoopWhy = noLoopWhy(noLoop, pair.equals(loopKey) ? loopState : null);
        // Automix v2: the loop mix plays only when it scores over the blend (automix.js loopOrBlend)
        Planner.Choice choice = lp != null && ov != null && ov.loop() ? Planner.Choice.picked(lp.none == null) : Planner.loopOrBlend(s.version, usual, lp);
        // Automix v2, Auto's blend and not the loop mix (decided on the usual blend's numbers): the curator
        // blend (analysis-cases.md "The curator blend"; the planner falls back to the usual blend where it doesn't fit)
        Planner.Plan curator = s.version == 3 && "blend".equals(usual.style) && usual.shape == null && !loopPending && !(lp != null && choice.loop)
                ? Planner.plan(s, id, next, from, to, dur, pos, pos + EARLIEST_LEAD, sung, pick, sOut, sIn, true) : null;
        Planner.Plan p = curator != null && curator.curator ? curator : usual;
        boolean loop = lp != null && choice.loop && lp.out.loopStart > pos + EARLIEST_LEAD;
        amx.choice = lp != null ? choice.why : null;
        double takeover = loop ? lp.out.loopStart : p.mixOutTrackTime - Mix.HAND_LEAD * Mix.leadRate(p) - (p.style.equals("blend") ? p.rampSongSec : 0);
        String shown = (loop ? lp.toString() : p.toString()) + (amx.choice != null ? " [" + amx.choice + "]" : "");
        if (!shown.equals(amx.shown)) {
            amx.shown = shown;
            String waiting = from == null && Analyzer.busy(id) ? " (analysing this song)" : next != null && to == null && Analyzer.busy(next) ? " (analysing the next song)" : "";
            Log.i(TAG, String.format(Locale.US, "plan at %.1f s of %s (v%d%s, bars %s): %s%s", pos, id, s.version, s.keyAware && s.version == 2 ? ", key-aware" : "",
                    s.bars == 0 ? "auto" : String.valueOf(s.bars), shown, waiting));
        }
        amx.plan = p;
        amx.loop = loop ? lp : null;
        amx.takeover = takeover;
        amx.dur = dur;
        if (noTransition) return;   // no mix and no crossfade (crossfadeMs)
        if (!loop && (p.fallback || next == null)) return;   // Morphe's crossfade, as the extension's plain one
        if (!loop && !(p.durationSec >= 1)) return;
        if (pos < takeover - TAIL_LEAD || (loopPending && pos < takeover - 8)) return;
        // a mix that couldn't be built (decoded audio not there yet): tried again after a pause
        if (SystemClock.elapsedRealtime() < amx.buildRetryAt) return;

        amx.state = "building";
        Song me = amx;
        Object outPlayer = player;
        String inId = next;
        new Thread(() -> {
            Mix mix = loop ? Mix.loop(lp, id, inId, dur) : Mix.blend(s.version == 3 ? kickLocked(p, id, inId) : p, id, inId, dur);
            Engine built = Engine.build(app, mix, listener);
            main.post(() -> {
                if (amx != me || !me.state.equals("building")) {
                    if (built != null) built.abort("stale", false);
                    return;
                }
                long at = position(outPlayer);
                if (built == null) {
                    // not "done": that read as going back before the mix, and it was planned and
                    // built again every tick (phone, 2026-11-26: 25 times in 6 s after a restart,
                    // while YT's decoded audio was being restored)
                    me.state = "idle";
                    boolean offline = Features.offline();
                    me.buildRetryAt = SystemClock.elapsedRealtime() + (offline ? 30_000 : 5000);
                    Log.w(TAG, "no mix for this pair yet; Morphe's crossfade unless it builds in time (trying again in " + (offline ? "30 s" : "5 s") + ")");
                } else if (at >= 0 && at < Math.round((mix.takeoverSong - 0.8) * 1000)) {
                    me.state = "armed";
                    engine = built;
                    built.arm(outPlayer);
                    Log.i(TAG, String.format(Locale.US, "mix armed: %s; takeover at %.2f s, YT moves on at mix %.2f s, its player takes over from mix %.2f s",
                            mix.note, mix.takeoverSong, mix.askAt, mix.elementAt));
                } else {
                    me.state = "idle";
                    built.abort("built too late", false);
                }
            });
        }, "Automix-build").start();
    }

    // ---------------------------------------------------------------------------------------------
    // For the player screen

    /**
     * The playing song's mix region in song ms {start, end, running (1/0)}, or null when no mix is
     * planned for it. Start is the takeover (where the decks take over from YT), end the song's end.
     */
    public static long[] zone() {
        try {
            Engine e = engine;
            String id = curId;
            if (id == null || !enabled()) return null;
            // a running mix keeps its band after YT has moved on to the next song (its midpoint)
            boolean running = e != null && e.running() && e.tookOverOnce();
            Object p = PlayerTap.current();
            long dur = p == null ? -1 : duration(p);
            if (dur <= 0) return null;
            if (running) return new long[]{Math.round(e.m.takeoverSong * 1000), dur, 1};
            Song s = amx;
            if (!id.equals(s.id) || s.shown == null || !(s.takeover > 0)) return null;
            if (s.plan != null && (s.plan.fallback || nextId == null) && !s.shown.startsWith("loop")) return null;
            return new long[]{Math.round(s.takeover * 1000), dur, 0};
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * The seek bar during a mix: {how far the mix is (0-1), brightness on the beat (0.1-1)}, or null
     * when no mix is heard.
     */
    public static float[] mixUi() {
        Engine e = engine;
        if (e == null || !e.running() || !e.tookOverOnce()) return null;
        double t = e.mixNow();
        if (Double.isNaN(t)) return null;
        double end = e.m.pulseEnd();
        float cover = (float) Math.max(0, Math.min(1, end > 0 ? t / end : 1));
        return new float[]{cover, (float) Mix.pulse(e.m.beats, t)};
    }

    /**
     * The incoming song's second heard now, in ms, while YT already shows it but its player is still
     * held silent (YT moved on, before the handover): the song plays on our deck, and YT's position
     * (Morphe's lyric clock) is not where the singing is. -1 otherwise.
     */
    public static long incomingHeardMs() {
        Engine e = engine;
        if (e == null || !e.running() || !e.askedNext() || e.handedOver()) return -1;
        double t = e.mixNow();
        if (Double.isNaN(t)) return -1;
        // a late entry (mix-file.md rule 2): B is silent and not started until its entry
        if (e.m.inStart > 0 && t < e.m.inStart) return -1;
        double s = e.m.in.trackAt(t);
        return s >= 0 ? Math.round(s * 1000) : -1;
    }

    /** The video id of the song a running mix goes into, or null. */
    public static String incomingId() {
        Engine e = engine;
        return e == null || !e.running() ? null : e.m.inId;
    }

    /** True while a loop mix runs (takeover to handover): the lyric line holds, as the extension's. */
    public static boolean holdLyrics() {
        Engine e = engine;
        return e != null && e.running() && e.loopHolding();
    }

    // ---------------------------------------------------------------------------------------------
    // The Automix overview (the extension's automix-overview.js reads crossfade.js the same way)

    /** The editor's overrides (editor.md §1), the same key the overview's picks had: old picks migrate as read. */
    private static final String KEY_PICKS = "ayham_automix_pair_picks";
    /** "a>b" → the user's override for that pair; oldest saved first. */
    private static java.util.LinkedHashMap<String, MixOverride> overrides;
    private static final java.util.Map<String, String[]> names = new java.util.LinkedHashMap<String, String[]>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(java.util.Map.Entry<String, String[]> e) {
            return size() > 20;
        }
    };

    private static void remember(String id, String title, String artist) {
        if (id == null || title == null) return;
        synchronized (names) {
            names.put(id, new String[]{title, artist});
        }
    }

    /** {title, artist} of a song seen in the queue, or null. */
    public static String[] names(String id) {
        if (id == null) return null;
        synchronized (names) {
            return names.get(id);
        }
    }

    private static synchronized java.util.LinkedHashMap<String, MixOverride> overrides() {
        if (overrides != null) return overrides;
        overrides = new java.util.LinkedHashMap<>();
        if (app == null) return overrides;
        try {
            Object o = Json.parse(prefs(app).getString(KEY_PICKS, "{}"));
            if (o instanceof java.util.Map) {
                for (java.util.Map.Entry<?, ?> e : ((java.util.Map<?, ?>) o).entrySet()) {
                    MixOverride ov = MixOverride.fromJson(e.getValue());
                    if (ov != null) overrides.put(String.valueOf(e.getKey()), ov);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "pair overrides unreadable", t);
        }
        return overrides;
    }

    /** Every saved override by pair, copies (the mix files' import and export, MixFilesPreference). */
    public static synchronized java.util.LinkedHashMap<String, MixOverride> savedOverrides() {
        java.util.LinkedHashMap<String, MixOverride> m = new java.util.LinkedHashMap<>();
        for (java.util.Map.Entry<String, MixOverride> e : overrides().entrySet()) m.put(e.getKey(), e.getValue().copy());
        return m;
    }

    /** Whether the overrides can be read and saved (the app's activity has started). */
    public static boolean ready() {
        return app != null;
    }

    /** The user's override for a pair ("a>b"), or null: Auto. */
    public static synchronized MixOverride override(String pairKey) {
        MixOverride o = overrides().get(pairKey);
        return o == null ? null : o.copy();
    }

    /**
     * Saves a pair's override (null, or nothing but Auto: removed), kept for the next time the pair
     * plays; returns why it was refused, or null. The pair playing now is planned again, unless its
     * mix has begun (editor.md §8). Unlocked overrides past MAX_UNLOCKED go oldest first; a lock
     * past MAX_LOCKED is refused.
     */
    public static String setOverride(String pairKey, MixOverride ov) {
        ov = MixOverride.normalize(ov);
        synchronized (Automix.class) {
            java.util.LinkedHashMap<String, MixOverride> m = overrides();
            MixOverride was = m.get(pairKey);
            if (ov != null && ov.lock && (was == null || !was.lock)) {
                int locked = 0;
                for (MixOverride o : m.values()) if (o.lock) locked++;
                if (locked >= MixOverride.MAX_LOCKED) return MixOverride.MAX_LOCKED + " pairs are locked already: unlock one first"; // (editor.md §2, exact)
            }
            m.remove(pairKey);
            if (ov != null) {
                ov.engine = settings().version == 3 ? 3 : 2;
                ov.savedAt = System.currentTimeMillis();
                m.put(pairKey, ov);
            }
            int unlocked = 0;
            for (MixOverride o : m.values()) if (!o.lock) unlocked++;
            for (java.util.Iterator<MixOverride> it = m.values().iterator(); unlocked > MixOverride.MAX_UNLOCKED && it.hasNext(); ) {
                if (!it.next().lock) {
                    it.remove();
                    unlocked--;
                }
            }
            try {
                java.util.Map<String, Object> o = new java.util.LinkedHashMap<>();
                for (java.util.Map.Entry<String, MixOverride> e : m.entrySet()) o.put(e.getKey(), e.getValue().toJson());
                if (app != null) prefs(app).edit().putString(KEY_PICKS, Json.write(o)).apply();
            } catch (Throwable t) {
                Log.w(TAG, "pair overrides not saved", t);
            }
        }
        Log.i(TAG, "override for " + pairKey + ": " + (ov == null ? "auto" : Json.write(ov.toJson())));
        // planned afresh (an armed mix, not started yet, is dropped for the new plan)
        if (pairKey.equals(curId + ">" + nextId)) {
            Engine e = engine;
            if (e != null && e.running() && !e.tookOverOnce()) e.abort("replanned", false);
            if (!amx.state.equals("mixing")) {
                amx.state = "idle";
                amx.shown = null;
            }
        }
        return null;
    }

    /** The playing song jumps to [sec] (the overview's preview: just before the mix). */
    public static boolean seekTo(double sec) {
        try {
            Object p = PlayerTap.current();
            if (!(p instanceof app.ayham.extension.music.features.SeekAccess)) return false;
            ((app.ayham.extension.music.features.SeekAccess) p).ayham_seekTo(Math.round(sec * 1000));
            Log.i(TAG, String.format(Locale.US, "overview preview: jump to %.1f s", sec));
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static double curDur() {
        try {
            Object p = PlayerTap.current();
            return p == null ? -1 : duration(p) / 1000.0;
        } catch (Throwable t) {
            return -1;
        }
    }

    /** A song's grid as the editor snaps to it (automix.js editorGrid): its end grid for the mix-out, its opening for the mix-in. */
    static double[] editorGrid(Analysis a, boolean out) {
        Planner.Grid g = a == null ? null : Planner.gridOf(out ? Planner.asOutgoing(a) : a);
        return g == null ? null : new double[]{g.downbeatSec, g.beatSec, g.bpm};
    }

    /** The coming mix, or the one playing, for the overview (crossfade.js overviewSnapshot). */
    public static Overview overview() {
        Overview o = new Overview();
        if (!enabled()) {
            o.why = "Automix is off";
            return o;
        }
        Engine e = engine;
        boolean live = e != null && e.running() && e.tookOverOnce();
        String id = curId, next = nextId;
        if (!live && id == null) {
            o.why = "Nothing is playing";
            return o;
        }
        Planner.Plan plan = null;
        Planner.LoopPlan loop = null;
        if (live) {
            plan = e.m.plan;
            loop = e.m.loopPlan;
            o.fromId = e.m.outId;
            o.toId = e.m.inId;
        } else {
            Song s = amx;
            if (next == null || next.equals(id)) {
                o.why = "Nothing queued after this song";
                return o;
            }
            if (id.equals(s.id) && s.shown != null && !"done".equals(s.state) && (!(s.dur > 0) || Math.abs(s.dur - curDur()) < 0.5)) {
                loop = s.loop;
                plan = loop == null ? s.plan : null;
                o.choice = s.choice;
            }
            o.fromId = id;
            o.toId = next;
        }
        o.pairKey = o.fromId + ">" + o.toId;
        o.override = override(o.pairKey);
        if (!live && o.override != null && o.override.noTransition()) {
            o.why = "No transition: this song plays to its end, then the next from its start";
            return o;
        }
        if (app != null) {
            Analysis fa = Analyzer.get(app, o.fromId), ta = Analyzer.get(app, o.toId);
            o.outGrid = editorGrid(fa, true);
            o.inGrid = editorGrid(ta, false);
            // the editor shows and saves the override on this app's grid (mix-file.md rule 4)
            if (o.override != null && o.outGrid != null) o.override = MixOverride.fold(o.override, o.outGrid[2]).ov;
            o.outDur = fa != null ? fa.durationSec : Double.NaN;
            o.inDur = ta != null ? ta.durationSec : Double.NaN;
        }
        if (!live) {
            // editor.md §11: one row, this song before the next, then this song's addon copy (rule 6); hidden during a live mix
            String[] ids = {o.fromId, o.toId}, names = {"this song", "the next song"};
            for (int k = 0; k < 2 && o.waiting == null; k++) {
                Object[] pr = Analyzer.progress(ids[k]);
                String[] out = pr == null ? Analyzer.outcome(ids[k]) : null;
                if (pr != null) {
                    o.waiting = "Analysing " + names[k] + ": " + pr[0];
                    o.waitDone = (Float) pr[1];
                } else if (out != null && "tooLong".equals(out[0])) {
                    o.waiting = (k == 0 ? "This song" : "The next song") + " is over 8 minutes: not analysed, a plain crossfade";
                    o.waitNoBar = true;
                } else if (out != null) {
                    o.waiting = "Analysis of " + names[k] + " failed: " + out[1];
                    o.waitNoBar = true;
                } else continue;
                o.waitingFor = ids[k];
            }
            // rule 6: this song's addon copy, after the analysis lines; never the next song's
            if (o.waiting == null && o.fromId.equals(id) && AddonSettings.on()) {
                String[] prep = AddonPrep.stageOf(id);
                boolean switching = AddonDirect.switching(id);
                o.waiting = addonStage(prep, switching, AddonPrep.losslessCopy(id));
                // paused: the copy is ready and waits, no moving bar (the PC's "Switching…" spun forever)
                if (o.waiting != null && prep == null && switching && AddonDirect.switchWaitsForPlay(id)) {
                    o.waiting = readyWhenPlays(AddonPrep.losslessCopy(id));
                    o.waitNoBar = true;
                } else if (o.waiting != null) o.waitDone = -1;
            }
            if (o.waiting == null && o.fromId.equals(id) && amx.loopPending) {
                o.waiting = "Looking for a loop mix";
                o.waitDone = -1;
            }
        }
        if (plan == null && loop == null) {
            o.why = live ? "A plain crossfade is playing" : "Planning the mix…";
            return o;
        }
        o.live = live;
        o.plan = plan;
        o.loop = loop;
        if (loop != null) {
            o.x = Planner.loopSchedule(loop, 0);
            o.D = o.x.elementAt;
            o.curves = loop.curves;
        } else {
            o.D = plan.durationSec;
            o.curves = plan.curves;
        }
        String[] a = names(o.fromId), b = names(o.toId);
        if (a != null) {
            o.fromTitle = a[0];
            o.fromArtist = a[1];
        }
        if (b != null) {
            o.toTitle = b[0];
            o.toArtist = b[1];
        }
        double start = loop != null ? loop.out.loopStart : plan.mixOutTrackTime;
        double takeover = loop != null ? loop.out.loopStart : plan.mixOutTrackTime - Mix.HAND_LEAD * Mix.leadRate(plan) - ("blend".equals(plan.style) ? plan.rampSongSec : 0);
        if (live) {
            double t = e.mixNow();
            o.at = Double.isNaN(t) ? Double.NaN : t - e.m.t0;
        } else {
            try {
                Object player = PlayerTap.current();
                double pos = player == null ? -1 : position(player) / 1000.0;
                if (pos >= 0) {
                    o.at = pos - start;
                    o.left = takeover - pos;
                    o.earliest = pos + EARLIEST_LEAD;
                }
            } catch (Throwable ignored) {
            }
        }
        o.editable = !live && o.fromId.equals(id);
        // a fade planned because the analysis isn't there yet, with time left for it: only for now
        o.provisional = !live && loop == null && plan.fallback && o.waiting != null && !o.waitNoBar && o.waitingFor != null
                && (Double.isNaN(o.left) || o.left > TAIL_LEAD);
        o.previewAt = loop != null ? start - Mix.HAND_LEAD - 8 : start - Mix.HAND_LEAD - (TAIL_LEAD + 3 + plan.rampSongSec);
        if (loopKey.startsWith(o.pairKey + "|")) {
            Planner.LoopPlan lp = loopPlan;
            if ("ready".equals(loopState) && lp != null && lp.none != null) o.loopNone = lp.none;
        }
        return o;
    }

    /** Why [status] last returned null (the final phone pass looks for the line vanishing, item 6). */
    public static volatile String noStatusWhy;

    /**
     * Automix's stats-for-nerds line, as BitChord's (CrossfadeController describeAutomix): the mix
     * running now, else the one planned for this song, else both songs' analysis.
     */
    public static String status() {
        if (!enabled()) {
            noStatusWhy = "automix switched off";
            return null;
        }
        String id = curId, next = nextId;
        if (id == null) {
            noStatusWhy = "no current song known";
            return null;
        }
        noStatusWhy = null;
        Engine e = engine;
        if (e != null && e.running() && e.tookOverOnce()) {
            Mix m = e.m;
            if (m.loopPlan != null) return "Automix · " + (e.handedOver() ? "letting go" : "looping") + " · " + describeLoop(m.loopPlan);
            if (m.plan != null) return "Automix · " + describePlan(m.plan, 0, null);
            return "Automix · mixing now";
        }
        Song s = amx;
        Object player;
        try {
            player = PlayerTap.current();
        } catch (Throwable t) {
            player = null;
        }
        double pos = player == null ? -1 : position(player) / 1000.0, dur = player == null ? -1 : duration(player) / 1000.0;
        if (id.equals(s.id) && next != null && pos >= 0 && Math.abs(dur - s.dur) < 0.5 && !"done".equals(s.state)) {
            double in = Math.max(0, s.takeover - pos);
            if (s.loop != null) return "Automix · loop mix in " + (int) Math.ceil(in) + " s · " + describeLoop(s.loop);
            Planner.Plan p = s.plan;
            if (p != null && !p.fallback && p.durationSec >= 1) {
                return "Automix · " + describePlan(p, in, s.noLoopWhy);
            }
        }
        return "Automix · this song: " + label(id) + " · next: " + (next == null || next.equals(id) ? "none" : label(next));
    }

    /**
     * Why a pair has no loop mix, for the label: a saved edit other than Loop turns it off; else only
     * this pair's own loop check ([state], null when the check running is another pair's) may say
     * its audio isn't decoded yet.
     */
    static String noLoopWhy(boolean savedEdit, String state) {
        if (savedEdit) return "your saved edit (pick Loop for a loop mix)";
        return "missing".equals(state) ? "audio not decoded yet" : null;
    }

    /** BitChord's describeLoop: "out 8-bar, clear by lyrics · in 4-bar, clear by mask · 94 → 100 BPM over 3 bars". */
    static String describeLoop(Planner.LoopPlan p) {
        long from = Math.round(p.out.bpm), to = Math.round(p.in.bpm / (p.fold > 0 ? p.fold : 1));
        String tempo = from == to ? from + " BPM" : from + " → " + to + " BPM over " + p.rampBars + " bars";
        String fold = p.fold > 1 ? " (next in double time)" : p.fold < 1 ? " (next in half time)" : "";
        return "out " + side(p.out) + " · in " + side(p.in) + " · " + tempo + fold;
    }

    private static String side(Planner.LoopSide s) {
        return s.bars + "-bar, clear by " + ("lyrics".equals(s.checkedBy) ? "lyrics" : "mask");
    }

    /**
     * BitChord's line for a planned mix: "crossfading in 12 s · 12 s", "filter mix in 8 s · 4 bars",
     * "mixing now · 8 bars · next at 1.034×", with its reason and why there is no loop mix.
     */
    static String describePlan(Planner.Plan p, double inSec, String noLoop) {
        String when = inSec > 0 ? "in " + (int) Math.ceil(inSec) + " s" : "now";
        String length = p.bars > 0 ? p.bars + " bars" : String.format(Locale.ROOT, "%.1f s", p.durationSec);
        String why = p.reason != null ? " · " + p.reason : "";
        String no = noLoop != null ? " · no loop: " + noLoop : "";
        if (p.handoff) return "hand-over " + when + " · " + String.format(Locale.ROOT, "%.1f s", p.durationSec) + why + no;
        if (p.bridge) return "beatless bridge " + when + " · " + String.format(Locale.ROOT, "%.1f s", p.durationSec) + why + no;
        if ("crossfade".equals(p.style)) return "crossfading " + when + " · " + String.format(Locale.ROOT, "%.0f s", p.durationSec) + why + no;
        if ("filter".equals(p.style)) return "filter mix " + when + " · " + length + why + no;
        String stretch = Math.abs(p.rate - 1) < 0.0005 ? "same tempo" : String.format(Locale.ROOT, "next at %.3f×", p.rate);
        return "mixing " + when + " · " + length + " · " + stretch + no;
    }

    /** BitChord's per-song label: analysing… / failed / analysed (94 BPM F# major, dsp grid 0.82). */
    private static String label(String id) {
        Analysis a = app == null ? null : Analyzer.get(app, id);
        if (a == null) return Analyzer.busy(id) ? "analysing…" : "waiting";
        if (!(a.bpm > 0)) return "failed";
        String key = a.keyName != null && !a.keyName.isEmpty() ? " " + a.keyName : "";
        return String.format(Locale.ROOT, "analysed (%d BPM%s, dsp grid %.2f)", Math.round(a.bpm), key, a.gridConfidence);
    }

    private static final Engine.Listener listener = new Engine.Listener() {
        @Override
        public void onMixStarted(Engine e) {
            if (amx.id.equals(e.m.outId)) amx.state = "mixing";
            // the song this mix brings in keeps the speed it gives it (spotify-mixes.md rule 10)
            cameId = e.m.inId;
            cameFrom = e.m.outId;
        }

        @Override
        public void onFinished(Engine e, boolean ok, String why) {
            if (engine == e) engine = null;
            if (why != null && !why.equals("stale") && !why.equals("built too late")) Log.i(TAG, "mix ended" + (ok ? "" : ": " + why));
            // the moves heard, for "no effect three times running": only a mix that played to its end counts
            Planner.ended(e.m.loopPlan != null ? "loop" : Planner.moveOf(e.m.plan), ok, e.handedOver());
            if (amx.id.equals(e.m.outId)) {
                // not started (a seek past its takeover): planned again from here; else this song is done
                amx.state = e.tookOverOnce() ? "done" : "idle";
            }
        }
    };

    /** Each song's sung spans from synced lyrics, or null (the vocal mask) when it has none. */
    private static Planner.Sung sung(String id, String next) {
        Planner.Sung s = new Planner.Sung();
        double[][] a = SungLyrics.cached(app, id), b = next != null ? SungLyrics.cached(app, next) : null;
        s.out = a != null && a.length > 0 ? a : null;
        s.in = b != null && b.length > 0 ? b : null;
        return s;
    }

    /** The loop mix's sung spans: the same lyrics read as the baseline reads them (loopSpansFromLines). */
    private static Planner.Sung loopSung(String id, String next) {
        Planner.Sung s = new Planner.Sung();
        double[][] a = SungLyrics.cachedLoop(app, id), b = next != null ? SungLyrics.cachedLoop(app, next) : null;
        s.out = a != null && a.length > 0 ? a : null;
        s.in = b != null && b.length > 0 ? b : null;
        return s;
    }

    /**
     * Automix v2's kick lock (crossfade.js kickLockFor): the next song's cue moved a few ms so both
     * songs' kicks land together, read from the decoded end and opening. The plan as it was when
     * there is nothing to move or the audio is missing.
     */
    private static Planner.Plan kickLocked(Planner.Plan p, String id, String next) {
        if (p.windowIn && "blend".equals(p.style)) {
            Log.i(TAG, "kick lock: none (the mix-in was placed in the editor)");
            return p;
        }
        if (!Planner.kickLockAllowed(p) || !(p.beatSec > 0)) return p;
        try {
            long t = SystemClock.elapsedRealtime();
            double b = p.beatSec, span = p.durationSec * 1.2 + 10 * b + 1;
            Analyzer.Pcm tail = Analyzer.tail(app, id), head = Analyzer.head(app, next);
            if (tail == null || head == null) {
                Log.i(TAG, "kick lock: no decoded audio");
                return p;
            }
            double oFrom = Math.max(0, p.mixOutTrackTime - 10 * b - 1), iFrom = Math.max(0, p.mixInTrackTime - 10 * b - 1);
            float[][] o = tail.read(oFrom, p.mixOutTrackTime + span), i = head.read(iFrom, p.mixInTrackTime + span);
            if (o[0].length == 0 || i[0].length == 0) {
                Log.i(TAG, "kick lock: no decoded audio there");
                return p;
            }
            KickLock.Side os = KickLock.kickSource(o, tail.rate, tail.fromSec((long) Math.floor(oFrom * tail.rate)), 0, Double.POSITIVE_INFINITY);
            KickLock.Side is = KickLock.kickSource(i, head.rate, head.fromSec((long) Math.floor(iFrom * head.rate)), 0, Double.POSITIVE_INFINITY);
            KickLock.Result k = KickLock.kickLock(p, os, is);
            Log.i(TAG, (k == null ? "kick lock: not a blend" : k.toString()) + " (" + (SystemClock.elapsedRealtime() - t) + " ms)");
            if (k == null || k.none != null) return p;
            Planner.Plan q = p.copy();
            q.mixInTrackTime += k.shift;
            q.kick = k;
            return q;
        } catch (Throwable e) {
            Log.w(TAG, "kick lock failed", e);
            return p;
        }
    }

    private static void prepareLoop(int version, String id, String next, Analysis from, Analysis to, double pos, Planner.Sung sung, String key) {
        loopKey = key;
        loopState = "loading";
        loopPlan = null;
        new Thread(() -> {
            String state = "none";
            Planner.LoopPlan plan = null;
            long retryAt = 0;
            try {
                Analysis cur = Planner.asOutgoing(from);
                if (!Planner.gridOk(cur) || !Planner.gridOk(to)) {
                    Log.i(TAG, "no loop mix for this pair: beat grid too weak");
                } else {
                    Planner.Audio outAudio = audio(Analyzer.tail(app, id), cur.durationSec - Planner.OUT_REGION_SEC, cur.durationSec, cur.durationSec);
                    Planner.Audio inAudio = audio(Analyzer.head(app, next), 0, Planner.IN_REGION_SEC, to.durationSec);
                    if (outAudio == null || inAudio == null) {
                        // offline the audio can't be fetched: ask again every 30 s instead (crossfade meanwhile)
                        boolean offline = Features.offline();
                        Log.i(TAG, "no loop mix for this pair yet: decoded audio missing, trying again in " + (offline ? "30 s (offline)" : "5 s"));
                        state = "missing";
                        retryAt = SystemClock.elapsedRealtime() + (offline ? 30_000 : 5000);
                    } else {
                        Log.i(TAG, "sung parts from " + (sung.out != null ? "synced lyrics" : "the vocal mask") + " (playing song) and "
                                + (sung.in != null ? "synced lyrics" : "the vocal mask") + " (next song)");
                        plan = Planner.planLoopMix(version, cur, outAudio, to, inAudio, pos + Planner.LOOP_SETUP_SEC, sung);
                        if (plan == null || plan.none != null) {
                            Log.i(TAG, "no loop mix for this pair: " + (plan == null ? "no beat grid to loop on" : plan.none));
                            if (plan != null && plan.none.contains("opening of the next song")) Log.i(TAG, Planner.openingWhy(to, inAudio, sung.in));
                            plan = null;
                        } else {
                            state = "ready";
                            Log.i(TAG, "loop mix ready: " + plan);
                        }
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "loop mix preparation failed", t);
            }
            if (key.equals(loopKey)) {
                // Set only for the pair still wanted: a late thread of an earlier pair would move
                // the current pair's retry time.
                loopRetryAt = retryAt;
                loopPlan = plan;
                loopState = state;
            }
        }, "Automix-loop").start();
    }

    /** A song's decoded stretch for the loop search: its left channel's loudness (automix.js rms). */
    private static Planner.Audio audio(Analyzer.Pcm pcm, double from, double to, double duration) throws Exception {
        if (pcm == null) return null;
        float[] left = pcm.read(from, to)[0];
        double sr = pcm.rate;
        long first = Math.max(pcm.firstFrame, (long) Math.floor(from * sr));
        return new Planner.Audio() {
            @Override
            public double duration() {
                return duration;
            }

            @Override
            public double rms(double a, double b) {
                long i0 = Math.max(0, (long) Math.floor(a * sr)), i1 = (long) Math.floor(b * sr);
                double ss = 0;
                int n = 0;
                for (long i = i0; i < i1; i += 16) {
                    long k = i - first;
                    if (k < 0 || k >= left.length) continue;
                    double x = left[(int) k];
                    ss += x * x;
                    n++;
                }
                return n > 0 ? Math.sqrt(ss / n) : 0;
            }
        };
    }

    // ---------------------------------------------------------------------------------------------
    // YT's player and the screen

    private static volatile Method posMethod, durMethod;

    /** The length of the song YT's player has now, or -1 (no player yet). */
    public static long durationMs() {
        try {
            Object p = PlayerTap.current();
            return p == null ? -1 : duration(p);
        } catch (Throwable t) {
            return -1;
        }
    }

    /** YT's player position now, or -1 (no player yet). */
    public static long positionMs() {
        try {
            Object p = PlayerTap.current();
            return p == null ? -1 : position(p);
        } catch (Throwable t) {
            return -1;
        }
    }

    static long position(Object player) {
        try {
            // read once: another thread may swap the cache for another player's class meanwhile
            Method m = posMethod;
            if (m == null || m.getDeclaringClass() != player.getClass()) posMethod = m = player.getClass().getMethod("patch_getCurrentPosition");
            return (long) m.invoke(player);
        } catch (Throwable t) {
            return -1;
        }
    }

    static long duration(Object player) {
        try {
            Method m = durMethod;
            if (m == null || m.getDeclaringClass() != player.getClass()) durMethod = m = player.getClass().getMethod("patch_getDuration");
            return (long) m.invoke(player);
        } catch (Throwable t) {
            return -1;
        }
    }

    private static String lastHold;

    /**
     * Why no mix is made now, or null (playback.md): the sleep timer set to "end of song" (Morphe's
     * crossfade hears it, CrossfadePatch.onSleepTimerStateChanged), or a playback speed other than x1
     * (Morphe's "Playback speed"; the phone's plans aren't converted by the speed, so it mixes nothing).
     */
    private static String hold() {
        try {
            java.lang.reflect.Field f = Class.forName(MORPHE_CROSSFADE).getDeclaredField("sleepTimerEndOfTrack");
            f.setAccessible(true);
            if (f.getBoolean(null)) return "the sleep timer stops at the end of this song";
        } catch (Throwable t) {
            missing("CrossfadePatch.sleepTimerEndOfTrack", t);
        }
        int pct = morpheSpeedPct();
        if (pct != 100) return String.format(Locale.US, "playback speed x%.2f (mixes are planned at x1)", pct / 100f);
        return null;
    }

    /** Morphe targets read by reflection that this Morphe lacks: each logged once. */
    private static final java.util.Set<String> missingLogged = java.util.Collections.synchronizedSet(new java.util.HashSet<>());

    /** A Morphe class or field automix reads is missing (renamed in a new Morphe): logged once, its fallback used. */
    private static void missing(String what, Throwable t) {
        if (missingLogged.add(what)) Log.w(TAG, "Morphe's " + what + " can't be read (" + t + "): automix goes on without it");
    }

    // ---------------------------------------------------------------------------------------------
    // each song's playlist speed (spotify-mixes.md rule 10)

    /**
     * The progress row's addon line (editor.md §11 rule 6), without its ellipsis (the row adds it to
     * an indeterminate bar), or null. [prep]: AddonPrep.stageOf; [switching]: our player started and
     * not heard yet; [lossless]: the copy it switches to.
     */
    static String addonStage(String[] prep, boolean switching, boolean lossless) {
        if (prep != null) {
            String copy = "lossless".equals(prep[1]) ? "the lossless copy" : "the addon's copy";
            switch (prep[0]) {
                case AddonPrep.FETCHING:
                    return "Getting " + copy;
                case AddonPrep.FITTING:
                    return "Lining up " + copy + " with YouTube's";
                default:
                    return "Asking your addons";
            }
        }
        return switching ? "Switching to " + (lossless ? "the lossless copy" : "the addon's copy") : null;
    }

    /** The take-over's line while paused (editor.md §11 rule 6 [all]): a still row, no bar. */
    static String readyWhenPlays(boolean lossless) {
        return (lossless ? "The lossless copy" : "The addon's copy") + " is ready: it takes over when the song plays";
    }

    /** The song the last mix brought in, and the one it came from. */
    private static volatile String cameId = "", cameFrom = "";
    /** The speed this code put on YT's player for a song's playlist speed (0: none). */
    private static float speedSet;

    /** A song's speed while it plays: the one the mix that brought it in gives it, else the one the mix taking it out gives it, else 1. */
    static double songSpeed(String id, String next) {
        MixOverride in = id.equals(cameId) ? override(cameFrom + ">" + id) : null;
        return MixOverride.songSpeed(in, next != null ? override(id + ">" + next) : null);
    }

    /**
     * Between mixes, YT's player plays the song at its playlist speed, pitch kept; never over a speed
     * the user set in Morphe's Playback speed (that song isn't mixed either, hold()).
     */
    private static void playSpeed(Object player, String id, String next) {
        if (morpheSpeedPct() != 100) return;
        double want = songSpeed(id, next);
        float now = Engine.speedOf(player);
        boolean off = Math.abs(want - 1) >= 1e-4;
        if (off && Math.abs(now - want) > 1e-6) {
            Engine.speed(player, (float) want);
            speedSet = (float) want;
            Log.i(TAG, String.format(Locale.US, "%s plays at its playlist speed x%.5f", id, want));
        } else if (!off && speedSet != 0 && Math.abs(now - 1) > 1e-6 && Math.abs(now - speedSet) < 1e-6) {
            Engine.speed(player, 1f);
            speedSet = 0;
        }
    }

    /** Morphe's Playback speed in percent (100: x1, also when it can't be read). */
    private static int morpheSpeedPct() {
        try {
            Object setting = Class.forName("app.morphe.extension.music.settings.Settings").getField("PLAYBACK_SPEED").get(null);
            return ((Number) setting.getClass().getMethod("get").invoke(setting)).intValue();
        } catch (Throwable t) {
            missing("Settings.PLAYBACK_SPEED", t);
            return 100;
        }
    }

    private static boolean repeatOne() {
        try {
            java.lang.reflect.Field f = Class.forName(MORPHE_CROSSFADE).getDeclaredField("repeatSingleActive");
            f.setAccessible(true);
            return f.getBoolean(null);
        } catch (Throwable t) {
            missing("CrossfadePatch.repeatSingleActive", t);
            return false;
        }
    }

    static void toast(String text) {
        main.post(() -> {
            try {
                Toast.makeText(app, text, Toast.LENGTH_LONG).show();
            } catch (Throwable ignored) {
            }
        });
    }

    /** YT's player from silent to full over [sec] (through the gate, which lets it pass). */
    static void rampVolume(Object player, double sec) {
        long t0 = SystemClock.elapsedRealtime();
        // about 6 steps for a short rise (30 ms: 5 ms apart), never under 5 ms or over 30 ms apart
        long tick = Math.max(5L, Math.min(30L, Math.round(sec * 1000 / 6)));
        main.post(new Runnable() {
            @Override
            public void run() {
                double f = Math.min(1, (SystemClock.elapsedRealtime() - t0) / (sec * 1000));
                Engine.setVolume(player, (float) Math.sin(f * Math.PI / 2) * Engine.ytVolume(player));
                if (f < 1) main.postDelayed(this, tick);
            }
        });
    }
}
