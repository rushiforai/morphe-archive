package app.tikkamasalla.stremio.tuning;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.hardware.display.DisplayManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.regex.Pattern;

import app.tikkamasalla.stremio.diag.PlaybackDiary;
import app.tikkamasalla.stremio.introskip.IntroSkipPrefs;

/**
 * Glue of the silent frame-rate switch (the logic is in FrameRateCore) for 1.6.12, 1.10.4 and 1.12.0. On 1.6.12 Stremio's own matcher then sees
 * "disabled" (see PlayerTuning.matchStrategy), so its notice never shows. Stremio's classes are reached by name.
 * Every hook fails soft: on any problem no mode is switched and Stremio starts the playback as usual.
 */
public final class FrameRateSwitch {
    private static final String TAG = "FrameRate";
    private static final FrameRateCore CORE = new FrameRateCore();

    /** One file's frame rate survives a player retry: the same URL is not read twice. */
    private static String lastUrl;
    private static float lastFps = -1f;

    private FrameRateSwitch() {
    }

    /** Created on first use: the strategy getter path (matcherMode) never needs it. */
    private static final class Main {
        static final Handler HANDLER = new Handler(Looper.getMainLooper());
    }

    /** The mode Stremio's own matcher should see: Off while our switch does the work (no notice, no double switch). */
    static String matcherMode(String mode) {
        // 1.6.12 hides the switch here. 1.10.4 / 1.12.0 skip their media probe when the strategy reads
        // disabled, so there "always" stays visible and the matcher hook does the silencing instead.
        return isSilent(mode) && FrameRateModes.legacyBuild() ? IntroSkipPrefs.MATCH_OFF : mode;
    }

    /** Same live-stream test as Stremio's media probe: these URLs never yield a probe frame rate. */
    private static final Pattern LIVE_URL = Pattern.compile("\\.(m3u8?|mpd)\\b", Pattern.CASE_INSENSITIVE);

    static boolean isLiveUrl(String url) {
        return url != null && LIVE_URL.matcher(url).find();
    }

    private static boolean isSilent(String mode) {
        return IntroSkipPrefs.MATCH_ALWAYS.equals(mode) && FrameRateModes.supported() && !showNotice();
    }

    private static boolean showNotice() {
        try {
            Context context = PlayerTuning.app();
            return context != null && context.getSharedPreferences(IntroSkipPrefs.FILE, Context.MODE_PRIVATE)
                    .getBoolean(FrameRateModes.KEY_NOTICE, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    // ---- hooks (main thread) ----------------------------------------------------------------------------------

    /** Hook in PlayerFragment.mediaPlayer: a stream is about to play in the internal player. */
    public static void onStreamStart(Object fragment, final String url) {
        try {
            if (Build.VERSION.SDK_INT < 23 || !isSilent(PlayerTuning.matchMode())) return;
            final FrameRateCore.Session session = CORE.start(new FragmentHost(fragment), fragment);
            if (url != null && url.equals(lastUrl)) {
                CORE.onHeader(session, lastFps, 0L);
                return;
            }
            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    final long began = System.currentTimeMillis();
                    final float fps = FrameRateProbe.read(url, FrameRateProbe.BUDGET_MS);
                    final long ms = System.currentTimeMillis() - began;
                    Main.HANDLER.post(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                lastUrl = url;
                                lastFps = fps;
                                CORE.onHeader(session, fps, ms);
                            } catch (Throwable t) {
                                fail("header", t);
                            }
                        }
                    });
                }
            }, "fr-probe");
            thread.setDaemon(true);
            thread.start();
        } catch (Throwable t) {
            fail("start", t);
        }
    }

    /** Hook at the top of PlayerFragment.adjustDisplayMode. True: this class starts the playback later, Stremio must not. */
    public static boolean adjust(Object fragment, Object mediaInfo) {
        try {
            if (Build.VERSION.SDK_INT < 23 || !isSilent(PlayerTuning.matchMode())) return false;
            return CORE.onProbe(new FragmentHost(fragment), fragment, frameRateOf(mediaInfo));
        } catch (Throwable t) {
            fail("probe", t);
            return false;
        }
    }

    /** Hook at the top of PlayerFragment.restoreDisplayMode (runs when the player closes). True: skip Stremio's reset. */
    public static boolean onRestore(Object fragment) {
        try {
            return Build.VERSION.SDK_INT >= 23 && CORE.onClose(new FragmentHost(fragment), fragment);
        } catch (Throwable t) {
            fail("close", t);
            return false;
        }
    }

    private static float frameRateOf(Object mediaInfo) {
        try {
            Object value = mediaInfo.getClass().getMethod("getFrameRate").invoke(mediaInfo);
            return value instanceof Float ? (Float) value : -1f;
        } catch (Throwable ignored) {
            return -1f;
        }
    }

    private static void fail(String where, Throwable t) {
        Log.w(TAG, where + ": " + t);
        PlaybackDiary.err("fr." + where, t);
    }

    // ---- 1.10.4 / 1.12.0: hold the start by deferring the engine load -------------------------------------------
    // These builds hand the stream to the engine before the media probe runs (Exo prepares paused, mpv starts
    // at once, VLC starts then pauses), and Stremio's loading artwork already hides at the first duration
    // event. So the hold cannot sit behind the probe alone: the engine's load (mpv/VLC) or prepare (Exo) is
    // stashed here and replayed when the core releases the start. Nothing buffers and no frame is rendered
    // meanwhile, so the loading screen covers the whole display switch like on 1.6.12.

    /** A deferred engine start nobody released (probe error, a hook that never came) must not hang: replay it. */
    static final long DEFER_MAX_MS = 12000L;

    private static final class Pending {
        final MatcherHost host;
        final WeakReference<Object> player;
        final Object arg;
        final long startMs;
        final boolean prepare;
        Runnable watchdog;

        Pending(MatcherHost host, Object player, Object arg, long startMs, boolean prepare) {
            this.host = host;
            this.player = new WeakReference<Object>(player);
            this.arg = arg;
            this.startMs = startMs;
            this.prepare = prepare;
        }
    }

    private static Pending pending;
    /** The page (playback manager) whose probe answered last, and that answer. */
    private static WeakReference<Object> probedManager = new WeakReference<Object>(null);
    private static float probedFps = -1f;

    private static String loadName() {
        return FrameRateModes.build() == FrameRateModes.BUILD_112 ? "a0" : "load";
    }

    private static String prepareName() {
        return FrameRateModes.build() == FrameRateModes.BUILD_112 ? "B" : "prepare";
    }

    private static String playName() {
        return FrameRateModes.build() == FrameRateModes.BUILD_112 ? "f" : "play";
    }

    /** Top of the mpv/VLC load: true defers it until the core releases the start. */
    public static boolean deferLoad(Object player, Object uri, long startMs) {
        try {
            return defer(player, uri, startMs, false);
        } catch (Throwable t) {
            fail("defer", t);
            return false;
        }
    }

    /** Top of the Exo prepare: true defers it (the item is set already; nothing buffers before this). */
    public static boolean deferPrepare(Object player, Object listener) {
        try {
            return defer(player, listener, 0L, true);
        } catch (Throwable t) {
            fail("defer", t);
            return false;
        }
    }

    private static boolean defer(Object player, Object arg, long startMs, boolean prepare) {
        if (player == null || Build.VERSION.SDK_INT < 23 || !isSilent(PlayerTuning.matchMode())) return false;
        FrameRateCore.Session session = CORE.session();
        if (session == null || session.released || !(session.host instanceof MatcherHost)) return false;
        final MatcherHost host = (MatcherHost) session.host;
        Object bound = host.player();
        if (bound != null && bound != player) return false;
        // This player's start was issued (a replay runs through this gate too): never hold it a second time.
        if (host.loadIssued) return false;
        // A start that could not be replayed must not be taken away from Stremio.
        Object[] args = prepare ? new Object[]{arg} : new Object[]{arg, Long.valueOf(startMs)};
        if (playerMethod(player, prepare ? prepareName() : loadName(), args) == null) return false;
        // The header settled it already and the mode fits: nothing to wait for. Play right after this start, or
        // the first frame would sit frozen until Stremio's probe ends.
        if (settledNoSwitch(session)) {
            host.loadIssued = true;
            host.post(new Runnable() {
                @Override
                public void run() {
                    host.playNow();
                }
            }, 0L);
            return false;
        }
        dropPending("replace");
        final FrameRateCore.Session owner = session;
        final Pending next = new Pending(host, player, arg, startMs, prepare);
        // Runs when the probe never answers. A released session has been through host.release(), a waiting one
        // ends on its own timer.
        next.watchdog = new Runnable() {
            @Override
            public void run() {
                try {
                    if (CORE.session() != owner || owner.released || owner.waiting || host.played) return;
                    host.event("fr.defer_timeout");
                    releasePending("timeout");
                    host.playNow();
                } catch (Throwable t) {
                    fail("watchdog", t);
                }
            }
        };
        pending = next;
        host.post(next.watchdog, DEFER_MAX_MS);
        host.event("fr.defer", "kind", prepare ? "prepare" : "load", "build", FrameRateModes.build());
        host.bind(player);
        if (host.noProbe) {
            // The engine was changed on an open page: Stremio does not probe a second time, so its last answer stands.
            host.post(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (CORE.session() == owner && !owner.released
                                && !CORE.onProbe(host, owner.key, probedFps)) {
                            host.release();
                        }
                    } catch (Throwable t) {
                        fail("noprobe", t);
                    }
                }
            }, 0L);
        }
        return true;
    }

    private static boolean settledNoSwitch(FrameRateCore.Session session) {
        return session.decided && session.target == FrameRateModes.NONE && !session.released;
    }

    /** Replays a stashed engine start exactly once (the replayed call itself passes the gate: no pending left). */
    private static void releasePending(String why) {
        Pending next = pending;
        if (next == null) return;
        pending = null;
        next.host.loadIssued = true;
        next.host.event("fr.replay", "why", why);
        Object player = next.player.get();
        if (player != null && !next.host.isCurrent(player)) {
            next.host.event("fr.replay_skip", "why", "superseded");
            return;
        }
        if (player == null) return;
        if (next.prepare) {
            invokePlayer(player, prepareName(), next.arg);
        } else {
            invokePlayer(player, loadName(), next.arg, Long.valueOf(next.startMs));
        }
    }

    /** The player is going away (close, next stream): a stashed start for it must never be replayed. */
    private static void dropPending(String why) {
        Pending next = pending;
        if (next == null) return;
        pending = null;
        next.host.cancel(next.watchdog);
        next.host.event("fr.defer_drop", "why", why);
    }

    /** The engine method of this name that takes these arguments (R8 reuses short names across overloads). */
    private static Method playerMethod(Object player, String name, Object[] args) {
        for (Class<?> type = player.getClass(); type != null; type = type.getSuperclass()) {
            Method[] methods = type.getDeclaredMethods();
            for (int i = 0; i < methods.length; i++) {
                if (!methods[i].getName().equals(name) || methods[i].getReturnType() != void.class) continue;
                Class<?>[] p = methods[i].getParameterTypes();
                if (p.length != args.length) continue;
                boolean fits = true;
                for (int j = 0; j < p.length && fits; j++) {
                    fits = p[j] == long.class ? args[j] instanceof Long : p[j].isInstance(args[j]);
                }
                if (fits) return methods[i];
            }
        }
        return null;
    }

    private static boolean invokePlayer(Object player, String name, Object... args) {
        try {
            Method method = playerMethod(player, name, args);
            if (method == null) return false;
            method.setAccessible(true);
            method.invoke(player, args);
            return true;
        } catch (Throwable t) {
            fail("invoke:" + name, t);
            return false;
        }
    }

    // ---- shared reflection helpers and the header read (1.10.4 / 1.12.0) -----------------------------------------

    private static Object fieldOf(Object target, String name) {
        if (target == null) return null;
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (Throwable ignored) {
                // Superclass next.
            }
        }
        return null;
    }

    private static Activity activityFromContext(Object context) {
        Object current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) return (Activity) current;
            current = ((ContextWrapper) current).getBaseContext();
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    /** The matcher's Activity: named field on 1.10.4, the Activity-typed field on 1.12.0. */
    private static Activity matcherActivity(Object matcher) {
        Object named = fieldOf(matcher, "activity");
        if (named instanceof Activity) return (Activity) named;
        if (matcher == null) return null;
        try {
            Field[] fields = matcher.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if (fields[i].getType() == Activity.class) {
                    fields[i].setAccessible(true);
                    Object value = fields[i].get(matcher);
                    if (value instanceof Activity) return (Activity) value;
                }
            }
        } catch (Throwable ignored) {
            // No window then: callers fail soft.
        }
        return null;
    }

    /** Stremio's "start playing now" callback on the matcher (1.10.4: onFinished; 1.12.0: the invoke() field). */
    private static Object matcherFinished(Object matcher) {
        Object named = fieldOf(matcher, "onFinished");
        if (named != null) return named;
        if (matcher == null) return null;
        try {
            Field[] fields = matcher.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                Class<?> type = fields[i].getType();
                if (type == Activity.class || type == Handler.class
                        || "com.stremio.core.types.profile.Profile$Settings".equals(type.getName())) {
                    continue;
                }
                fields[i].setAccessible(true);
                Object value = fields[i].get(matcher);
                if (value != null && hasInvoke(value)) return value;
            }
        } catch (Throwable ignored) {
            // playNow falls back to the player's play method.
        }
        return null;
    }

    private static boolean hasInvoke(Object value) {
        try {
            value.getClass().getMethod("invoke");
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Header read for the matcher builds: same cache and budget as the 1.6.12 start hook. */
    private static void probeHeader(final FrameRateCore.Session session, final String url) {
        if (url != null && url.equals(lastUrl)) {
            deliverHeader(session, lastFps, 0L);
            return;
        }
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                final long began = System.currentTimeMillis();
                final float fps = FrameRateProbe.read(url, FrameRateProbe.BUDGET_MS);
                final long ms = System.currentTimeMillis() - began;
                Main.HANDLER.post(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            lastUrl = url;
                            lastFps = fps;
                            deliverHeader(session, fps, ms);
                        } catch (Throwable t) {
                            fail("header", t);
                        }
                    }
                });
            }
        }, "fr-probe");
        thread.setDaemon(true);
        thread.start();
    }

    private static void deliverHeader(FrameRateCore.Session session, float fps, long ms) {
        MatcherHost host = session.host instanceof MatcherHost ? (MatcherHost) session.host : null;
        if (host == null) {
            CORE.onHeader(session, fps, ms);
            return;
        }
        if (host.player() == null) {
            // 1.12.0 creates the player after its start hook: a switch must wait until the load can be held.
            host.pendingHeaderFps = fps;
            host.hasPendingHeader = true;
            return;
        }
        CORE.onHeader(session, fps, ms);
        // No switch will follow: start now, no need to wait for the end of Stremio's probe.
        if (session == CORE.session() && settledNoSwitch(session) && pending != null && pending.host == host) {
            releasePending("stay");
            host.playNow();
        }
    }

    /** How long the current (or last released) switch has been holding the start, for NextPrep's watchdog. */
    public static long holdMs() {
        try {
            FrameRateCore.Session session = CORE.session();
            if (session == null || session.target == FrameRateModes.NONE || session.requestedAt < 0L) return 0L;
            long end = session.releasedAt >= 0L ? session.releasedAt : session.host.now();
            long hold = end - session.requestedAt;
            if (hold < 0L) return 0L;
            return Math.min(hold, FrameRateCore.MAX_HOLD_MS);
        } catch (Throwable ignored) {
            return 0L;
        }
    }

    // ---- 1.10.4 hooks ----------------------------------------------------------------------------------------------

    /** Before the engine load in PlaybackManager.createPlayer$mediaPlayer: a stream is about to play. */
    public static void onStreamStart110(Object manager, Object player, String url) {
        try {
            if (Build.VERSION.SDK_INT < 23 || !isSilent(PlayerTuning.matchMode()) || isLiveUrl(url)) return;
            Activity activity = activityFromContext(fieldOf(manager, "context"));
            if (activity == null) {
                PlaybackDiary.ev("fr.skip", "why", "noactivity", "build", FrameRateModes.BUILD_110);
                return;
            }
            MatcherHost host = new MatcherHost(activity, manager);
            host.bind(player);
            startSession(host, player != null ? player : host, url);
        } catch (Throwable t) {
            fail("start110", t);
        }
    }

    private static void startSession(MatcherHost host, Object key, String url) {
        dropPending("restart");
        host.noProbe = host.manager() != null && host.manager() == probedManager.get();
        FrameRateCore.Session session = CORE.start(host, key);
        if (!host.noProbe) probeHeader(session, url);
    }

    /** Stremio's probe answered (fps) or failed (-1): one path for the Compose builds. False: stock's turn. */
    private static boolean probeResult(Object matcher, Object player, float fps) {
        try {
            Activity activity = matcherActivity(matcher);
            if (activity == null) return false;
            FrameRateCore.Session session = CORE.session();
            MatcherHost host = session != null && session.host instanceof MatcherHost
                    ? (MatcherHost) session.host : new MatcherHost(activity, null);
            host.setMatcher(matcher);
            host.bind(player);
            probedManager = new WeakReference<Object>(host.manager());
            probedFps = fps;
            if (!CORE.onProbe(host, session != null ? session.key : matcher, fps)) host.release();
            return true;
        } catch (Throwable t) {
            fail("probe", t);
            try {
                releasePending("error");
            } catch (Throwable ignored) {
                // Stock then has the final word.
            }
            return false;
        }
    }

    /** The probe result of Stremio's media info state is its Error object (a data object on both builds). */
    private static boolean isProbeError(Object result) {
        return result != null && "Error".equals(result.toString());
    }

    /** Reflection helper for no-argument getters; the receiver's class need not be public. */
    private static Object call(Object target, String name) throws Exception {
        Method method = target.getClass().getMethod(name);
        method.setAccessible(true);
        return method.invoke(target);
    }

    /** Top of FrameRateMatcher.adjustDisplayMode. In silent mode true: Stremio's switch (and its notice) never
     * runs; this class replays the held start instead. */
    public static boolean adjust110(Object matcher, Object mediaInfo) {
        try {
            if (Build.VERSION.SDK_INT < 23 || !isSilent(PlayerTuning.matchMode())) return false;
            return probeResult(matcher, null, frameRateOf(mediaInfo));
        } catch (Throwable t) {
            fail("probe110", t);
            return false;
        }
    }

    /**
     * Top of the media-info effect (PlayerPage$9$1). On a probe error stock only calls play(), which cannot start a
     * load held here: the hold has to end on the error too, or every file the probe cannot read waits for the guard.
     */
    public static void probeEffect110(Object effect) {
        try {
            if (pending == null || fieldOf(effect, "$player") == null) return;
            Object state = call(fieldOf(effect, "$playerState$delegate"), "getValue");
            if (isProbeError(call(state, "getMediaInfo"))) {
                probeResult(fieldOf(effect, "$frameRateMatcher"), null, -1f);
            }
        } catch (Throwable t) {
            fail("effect110", t);
        }
    }

    /** Top of FrameRateMatcher.restoreDisplayMode (player screen disposed). True: keep our mode for now. */
    public static boolean onRestore110(Object matcher) {
        try {
            if (Build.VERSION.SDK_INT < 23) return false;
            final FrameRateCore.Session session = CORE.session();
            if (session != null && session.host instanceof MatcherHost) {
                final MatcherHost host = (MatcherHost) session.host;
                Object known = host.matcher();
                if (known != null && known != matcher) return CORE.owned();
                if (known == null && host.playerAlive()) {
                    // This start has not met its matcher yet, so the closing page may be the one before it. A page
                    // releases its own player later in this same disposal pass: look right after that.
                    Main.HANDLER.post(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                if (CORE.session() == session && !host.playerAlive()) close(host, session.key);
                            } catch (Throwable t) {
                                fail("close", t);
                            }
                        }
                    });
                    return CORE.owned();
                }
                return close(host, session.key);
            }
            Activity activity = matcherActivity(matcher);
            if (activity == null) return false;
            MatcherHost host = new MatcherHost(activity, null);
            host.setMatcher(matcher);
            return CORE.onClose(host, matcher);
        } catch (Throwable t) {
            fail("close110", t);
            return false;
        }
    }

    private static boolean close(MatcherHost host, Object key) {
        if (pending != null && pending.host == host) dropPending("close");
        return CORE.onClose(host, key);
    }

    // ---- 1.12.0 hooks ----------------------------------------------------------------------------------------------
    // R8 merged the player screen's effects into one lambda class (l8): its invokeSuspend runs the player
    // creation (case 3: engines + load + media jobs, all inlined) and the frame-rate adjust (case 4, the
    // matcher inlined). One hook at the top of invokeSuspend serves both, reading the case from the int field and
    // the captures by their types (the matcher bn2, the player, the states).

    private static Object unit112;

    private static Object unit112() {
        if (unit112 == null) {
            try {
                unit112 = Class.forName("ap7", false, FrameRateSwitch.class.getClassLoader())
                        .getField("a").get(null);
            } catch (Throwable ignored) {
                // Without the Unit value the stock effect has to run.
            }
        }
        return unit112;
    }

    /** Top of the merged effects lambda's invokeSuspend. Null: run stock. The Unit value: handled here, skip stock. */
    public static Object hook112(Object effects) {
        try {
            int kind = -1;
            Field[] fields = effects.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if (fields[i].getType() == int.class) {
                    fields[i].setAccessible(true);
                    kind = fields[i].getInt(effects);
                    break;
                }
            }
            if (kind == 3) {
                start112(effects);
                return null;
            }
            if (kind == 4) return adjust112(effects);
            return null;
        } catch (Throwable t) {
            fail("hook112", t);
            return null;
        }
    }

    /** Top of the dispose action that resets the display mode (p6 case 9). True: keep our mode for now. */
    public static boolean onRestore112(Object disposer) {
        try {
            Object target = null;
            Field[] fields = disposer.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if (fields[i].getType() == Object.class) {
                    fields[i].setAccessible(true);
                    target = fields[i].get(disposer);
                    break;
                }
            }
            if (!isMatcherLike(target)) return false;
            return onRestore110(target);
        } catch (Throwable t) {
            fail("close112", t);
            return false;
        }
    }

    private static Object[] capturesOf(Object effects) {
        java.util.ArrayList<Object> out = new java.util.ArrayList<Object>();
        try {
            Field[] fields = effects.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if (fields[i].getType() == Object.class) {
                    fields[i].setAccessible(true);
                    out.add(fields[i].get(effects));
                }
            }
        } catch (Throwable ignored) {
            // Empty then: no start, no adjust, stock runs.
        }
        return out.toArray();
    }

    private static boolean isMatcherLike(Object value) {
        if (value == null || matcherActivity(value) == null) return false;
        try {
            Field[] fields = value.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if ("com.stremio.core.types.profile.Profile$Settings".equals(fields[i].getType().getName())) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
            // Not the matcher then.
        }
        return false;
    }

    private static boolean isPlayerLike(Object value) {
        if (value == null) return false;
        for (Class<?> type = value.getClass(); type != null; type = type.getSuperclass()) {
            Method[] methods = type.getDeclaredMethods();
            for (int i = 0; i < methods.length; i++) {
                Class<?>[] p = methods[i].getParameterTypes();
                if (p.length == 2 && "android.net.Uri".equals(p[0].getName()) && p[1] == long.class
                        && methods[i].getReturnType() == void.class) {
                    return true;
                }
            }
        }
        return false;
    }

    /** The player state object behind a Compose State capture (it carries the named core Stream field). */
    private static Object playerStateOf(Object capture) {
        if (capture == null) return null;
        try {
            Object value = call(capture, "getValue");
            if (value == null) return null;
            Field[] fields = value.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if ("com.stremio.core.types.resource.Stream".equals(fields[i].getType().getName())) return value;
            }
        } catch (Throwable ignored) {
            // Not a state capture.
        }
        return null;
    }

    private static Object fieldByTypeName(Object target, String typeName) {
        if (target == null) return null;
        try {
            Field[] fields = target.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if (typeName.equals(fields[i].getType().getName())) {
                    fields[i].setAccessible(true);
                    return fields[i].get(target);
                }
            }
        } catch (Throwable ignored) {
            // Missing then.
        }
        return null;
    }

    /** The streaming URL of a named core Stream (JNI-bound getters keep their names in 1.12.0). */
    private static String streamUrlOf112(Object stream) {
        try {
            Object links = stream.getClass().getMethod("getDeepLinks").invoke(stream);
            Object external = links.getClass().getMethod("getExternalPlayer").invoke(links);
            Object url = external.getClass().getMethod("getStreaming").invoke(external);
            return url instanceof String ? (String) url : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static final float PROBE_NONE = -2f;
    private static final float PROBE_ERROR = -3f;

    private static Object read(Field field, Object target) {
        try {
            field.setAccessible(true);
            return field.get(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Probe frame rate out of the player state, PROBE_NONE while it has no result, PROBE_ERROR on a failed probe. */
    private static float probeFpsOf112(Object state) {
        Field[] fields = state.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Object result = read(fields[i], state);
            // The result types are the app's own: default package after R8.
            if (result == null || result.getClass().getName().indexOf('.') >= 0) continue;
            if (isProbeError(result)) return PROBE_ERROR;
            Field[] inner = result.getClass().getDeclaredFields();
            for (int j = 0; j < inner.length; j++) {
                Object info = read(inner[j], result);
                if (info == null || info.getClass().getName().indexOf('.') >= 0) continue;
                Field[] infoFields = info.getClass().getDeclaredFields();
                int longs = 0;
                Object fps = null;
                for (int k = 0; k < infoFields.length; k++) {
                    if (infoFields[k].getType() == long.class) longs++;
                    if (infoFields[k].getType() == float.class) fps = read(infoFields[k], info);
                }
                if (infoFields.length == 4 && longs == 3 && fps instanceof Float) return (Float) fps;
            }
        }
        return PROBE_NONE;
    }

    private static void start112(Object effects) {
        if (Build.VERSION.SDK_INT < 23 || !isSilent(PlayerTuning.matchMode())) return;
        String url = null;
        Activity activity = null;
        Object manager = null;
        Object[] captures = capturesOf(effects);
        for (int i = 0; i < captures.length; i++) {
            Object state = playerStateOf(captures[i]);
            if (state != null && url == null) {
                Object stream = fieldByTypeName(state, "com.stremio.core.types.resource.Stream");
                if (stream != null) url = streamUrlOf112(stream);
            }
            if (activity == null) {
                Object context = fieldByTypeName(captures[i], "android.content.Context");
                Activity found = activityFromContext(context);
                if (found != null) {
                    activity = found;
                    manager = captures[i];
                }
            }
        }
        if (url == null || isLiveUrl(url) || activity == null) return;
        FrameRateCore.Session current = CORE.session();
        // The effect also runs before the player type is known: same URL with no player yet is the same start.
        if (current != null && !current.released && current.host instanceof MatcherHost
                && url.equals(((MatcherHost) current.host).url) && ((MatcherHost) current.host).player() == null) {
            return;
        }
        MatcherHost host = new MatcherHost(activity, manager);
        host.url = url;
        startSession(host, host, url);
    }

    private static Object adjust112(Object effects) {
        if (Build.VERSION.SDK_INT < 23 || !isSilent(PlayerTuning.matchMode())) return null;
        Object matcher = null;
        Object player = null;
        Object state = null;
        Object[] captures = capturesOf(effects);
        for (int i = 0; i < captures.length; i++) {
            if (matcher == null && isMatcherLike(captures[i])) matcher = captures[i];
            if (player == null && isPlayerLike(captures[i])) player = captures[i];
            if (state == null) state = playerStateOf(captures[i]);
        }
        // Stock does nothing without a player either; without Unit this hook could not skip stock.
        Object unit = unit112();
        if (matcher == null || player == null || state == null || unit == null) return null;
        float fps = probeFpsOf112(state);
        if (fps == PROBE_NONE) return null;
        if (fps == PROBE_ERROR) {
            // Stock only calls play(): the held load has to end here, then stock runs.
            if (pending != null) probeResult(matcher, player, -1f);
            return null;
        }
        return probeResult(matcher, player, fps) ? unit : null;
    }

    // ---- the host -----------------------------------------------------------------------------------------------

    /** Host of the Compose builds (1.10.4 / 1.12.0): window of the activity, start held by the deferred load. */
    private static final class MatcherHost implements FrameRateCore.Host {
        private final WeakReference<Activity> activity;
        private final WeakReference<Object> manager;
        private WeakReference<Object> matcher = new WeakReference<Object>(null);
        private WeakReference<Object> playerRef = new WeakReference<Object>(null);
        private DisplayManager.DisplayListener listener;
        boolean loadIssued;
        /** Started on a page whose probe answered already: no second answer will come. */
        boolean noProbe;
        /** This start's play was issued; a later probe answer must not undo a pause by the user. */
        boolean played;
        float pendingHeaderFps = -1f;
        boolean hasPendingHeader;
        String url = "";

        MatcherHost(Activity activity, Object manager) {
            this.activity = new WeakReference<Activity>(activity);
            this.manager = new WeakReference<Object>(manager);
        }

        Object player() {
            return playerRef.get();
        }

        Object matcher() {
            return matcher.get();
        }

        void setMatcher(Object value) {
            matcher = new WeakReference<Object>(value);
        }

        void bind(Object player) {
            if (player == null) return;
            if (playerRef.get() == null) playerRef = new WeakReference<Object>(player);
            if (hasPendingHeader) {
                hasPendingHeader = false;
                FrameRateCore.Session session = CORE.session();
                if (session != null && session.host == this) deliverHeader(session, pendingHeaderFps, 0L);
            }
        }

        Object manager() {
            return manager.get();
        }

        /** The manager's current player; null when it has none or cannot be asked. */
        private Object managerPlayer() {
            Object owner = manager.get();
            if (owner == null) return null;
            try {
                return call(owner, FrameRateModes.build() == FrameRateModes.BUILD_112 ? "a" : "getPlayer");
            } catch (Throwable ignored) {
                return null;
            }
        }

        /** False only when the playback manager now runs another player (this one was released already). */
        boolean isCurrent(Object player) {
            Object current = managerPlayer();
            return current == null || current == player;
        }

        /** This start's player is still the one its page runs. */
        boolean playerAlive() {
            Object current = managerPlayer();
            return current != null && current == playerRef.get();
        }

        @Override
        public long now() {
            return android.os.SystemClock.elapsedRealtime();
        }

        private Display display() {
            Activity a = activity.get();
            if (a == null) return null;
            Display display = a.getWindow().getDecorView().getDisplay();
            return display != null ? display : a.getWindowManager().getDefaultDisplay();
        }

        @Override
        public FrameRateModes.Mode currentMode() {
            Display display = display();
            return display != null ? FragmentHost.convert(display.getMode()) : null;
        }

        @Override
        public FrameRateModes.Mode[] modes() {
            Display display = display();
            if (display == null) return null;
            Display.Mode[] all = display.getSupportedModes();
            FrameRateModes.Mode[] out = new FrameRateModes.Mode[all.length];
            for (int i = 0; i < all.length; i++) out[i] = FragmentHost.convert(all[i]);
            return out;
        }

        @Override
        public int preferred() {
            Activity a = activity.get();
            return a != null ? a.getWindow().getAttributes().preferredDisplayModeId : 0;
        }

        @Override
        public void setPreferred(int id) {
            Activity a = activity.get();
            if (a == null || a.isDestroyed()) return;
            Window window = a.getWindow();
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.preferredDisplayModeId = id;
            window.setAttributes(attributes);
        }

        @Override
        public void listen(boolean on) {
            Activity a = activity.get();
            if (a == null) return;
            DisplayManager manager = (DisplayManager) a.getSystemService(Context.DISPLAY_SERVICE);
            if (manager == null) return;
            if (on) {
                if (listener != null) return;
                listener = new DisplayManager.DisplayListener() {
                    @Override
                    public void onDisplayAdded(int displayId) {
                    }

                    @Override
                    public void onDisplayRemoved(int displayId) {
                    }

                    @Override
                    public void onDisplayChanged(int displayId) {
                        try {
                            FrameRateCore.Session session = CORE.session();
                            if (session != null && session.host == MatcherHost.this) CORE.onDisplayChanged(session);
                        } catch (Throwable t) {
                            fail("display", t);
                        }
                    }
                };
                manager.registerDisplayListener(listener, Main.HANDLER);
            } else if (listener != null) {
                manager.unregisterDisplayListener(listener);
                listener = null;
            }
        }

        @Override
        public void post(Runnable task, long delayMs) {
            Main.HANDLER.postDelayed(task, delayMs);
        }

        @Override
        public void cancel(Runnable task) {
            Main.HANDLER.removeCallbacks(task);
        }

        @Override
        public boolean started() {
            Object player = player();
            if (player == null) return true;
            Pending next = pending;
            if (next != null && next.player.get() == player) return false;
            return loadIssued;
        }

        @Override
        public boolean canRelease() {
            if (player() != null) return true;
            Pending next = pending;
            if (next != null && next.host == this) return true;
            return matcherFinished(matcher()) != null;
        }

        @Override
        public void release() {
            try {
                releasePending("hold");
                playNow();
            } catch (Throwable t) {
                fail("release", t);
            }
        }

        /** Replay first, then Stremio's own "play now" (VLC's load ends paused, so the order matters). */
        void playNow() {
            if (played) return;
            played = true;
            Object finished = matcherFinished(matcher());
            if (finished != null) {
                try {
                    call(finished, "invoke");
                    return;
                } catch (Throwable t) {
                    fail("finished", t);
                }
            }
            Object player = player();
            if (player != null) invokePlayer(player, playName());
        }

        @Override
        public void event(String name, Object... keyValues) {
            PlaybackDiary.ev(name, keyValues);
        }
    }

    private static final class FragmentHost implements FrameRateCore.Host {
        private final WeakReference<Object> fragment;
        private final WeakReference<Activity> activity;
        private Method playbackStart;
        private DisplayManager.DisplayListener listener;

        FragmentHost(Object fragment) {
            this.fragment = new WeakReference<Object>(fragment);
            Activity found = null;
            try {
                Object value = fragment.getClass().getMethod("getActivity").invoke(fragment);
                if (value instanceof Activity) found = (Activity) value;
            } catch (Throwable ignored) {
                // No window: every mode call below becomes a no-op.
            }
            this.activity = new WeakReference<Activity>(found);
        }

        @Override
        public long now() {
            return android.os.SystemClock.elapsedRealtime();
        }

        private Display display() {
            Activity a = activity.get();
            if (a == null) return null;
            Display display = a.getWindow().getDecorView().getDisplay();
            return display != null ? display : a.getWindowManager().getDefaultDisplay();
        }

        private static FrameRateModes.Mode convert(Display.Mode mode) {
            return new FrameRateModes.Mode(mode.getModeId(), mode.getPhysicalWidth(), mode.getPhysicalHeight(), mode.getRefreshRate());
        }

        @Override
        public FrameRateModes.Mode currentMode() {
            Display display = display();
            return display != null ? convert(display.getMode()) : null;
        }

        @Override
        public FrameRateModes.Mode[] modes() {
            Display display = display();
            if (display == null) return null;
            Display.Mode[] all = display.getSupportedModes();
            FrameRateModes.Mode[] out = new FrameRateModes.Mode[all.length];
            for (int i = 0; i < all.length; i++) out[i] = convert(all[i]);
            return out;
        }

        @Override
        public int preferred() {
            Activity a = activity.get();
            return a != null ? a.getWindow().getAttributes().preferredDisplayModeId : 0;
        }

        @Override
        public void setPreferred(int id) {
            Activity a = activity.get();
            if (a == null || a.isDestroyed()) return;
            Window window = a.getWindow();
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.preferredDisplayModeId = id;
            window.setAttributes(attributes);
        }

        @Override
        public void listen(boolean on) {
            Activity a = activity.get();
            if (a == null) return;
            DisplayManager manager = (DisplayManager) a.getSystemService(Context.DISPLAY_SERVICE);
            if (manager == null) return;
            if (on) {
                if (listener != null) return;
                listener = new DisplayManager.DisplayListener() {
                    @Override
                    public void onDisplayAdded(int displayId) {
                    }

                    @Override
                    public void onDisplayRemoved(int displayId) {
                    }

                    @Override
                    public void onDisplayChanged(int displayId) {
                        try {
                            FrameRateCore.Session session = CORE.session();
                            if (session != null && session.host == FragmentHost.this) CORE.onDisplayChanged(session);
                        } catch (Throwable t) {
                            fail("display", t);
                        }
                    }
                };
                manager.registerDisplayListener(listener, Main.HANDLER);
            } else if (listener != null) {
                manager.unregisterDisplayListener(listener);
                listener = null;
            }
        }

        @Override
        public void post(Runnable task, long delayMs) {
            Main.HANDLER.postDelayed(task, delayMs);
        }

        @Override
        public void cancel(Runnable task) {
            Main.HANDLER.removeCallbacks(task);
        }

        @Override
        public boolean started() {
            try {
                Object owner = fragment.get();
                if (owner == null) return true;
                Field field = owner.getClass().getDeclaredField("player");
                field.setAccessible(true);
                Object player = field.get(owner);
                if (player == null) return false;
                Object state = player.getClass().getMethod("getPlaybackState").invoke(player);
                return !(state instanceof Integer) || (Integer) state != 1; // Player.STATE_IDLE
            } catch (Throwable ignored) {
                return true; // Unknown: never risk a switch under a running picture.
            }
        }

        private Method playbackStart() throws Exception {
            if (playbackStart == null) {
                Method method = fragment.get().getClass().getDeclaredMethod("playbackFromState");
                method.setAccessible(true);
                playbackStart = method;
            }
            return playbackStart;
        }

        @Override
        public boolean canRelease() {
            try {
                return fragment.get() != null && playbackStart() != null;
            } catch (Throwable ignored) {
                return false;
            }
        }

        @Override
        public void release() {
            try {
                Object owner = fragment.get();
                if (owner == null) return;
                // Stopped: the app went away during the hold; Stremio's onStart starts the playback on return.
                if (stopped(owner)) return;
                playbackStart().invoke(owner);
            } catch (Throwable t) {
                fail("release", t);
            }
        }

        /** Only a real stop: a paused fragment (an overlay on top) gets no onStart later and must still be started. */
        private static boolean stopped(Object owner) {
            try {
                Object lifecycle = owner.getClass().getMethod("getLifecycle").invoke(owner);
                String state = String.valueOf(lifecycle.getClass().getMethod("getCurrentState").invoke(lifecycle));
                return "CREATED".equals(state) || "DESTROYED".equals(state) || "INITIALIZED".equals(state);
            } catch (Throwable ignored) {
                return false;
            }
        }

        @Override
        public void event(String name, Object... keyValues) {
            PlaybackDiary.ev(name, keyValues);
        }
    }
}
