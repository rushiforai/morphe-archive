package app.tikkamasalla.stremio.introskip;

import android.content.Context;
import android.util.Log;

import app.tikkamasalla.stremio.diag.PlaybackDiary;
import app.tikkamasalla.stremio.tuning.FrameRateSwitch;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Prepares the next episode while the current one plays: asks the stream addons that answered for
 * this show (one request each, Stremio addon protocol), ranks the answers with the auto-pick rules,
 * and keeps the winner as a ready player link. A Next (pill, end of file, binge) then starts that
 * link from the next episode's streams page at once instead of waiting for the list. Never touches
 * Stremio's UI or view-model state; every failure leaves today's behaviour.
 */
public final class NextPrep {
    private static final String TAG = "NextPrep";
    static final long EXPECT_MS = 30000L;
    private static final int MAX_BODY = 2 * 1024 * 1024;
    private static final int WARM_BYTES = 64 * 1024;
    static final String CINEMETA = "https://v3-cinemeta.strem.io/manifest.json";

    /** Stream addons (title, transport URL) that answered a show's streams page, plus its meta addon. */
    static final class Addons {
        final List<String[]> stream = new ArrayList<String[]>();
        String metaTransport = "";
    }

    /** A prepared next episode. */
    static final class Prepared {
        final String videoId, link, desc, reason;
        final long at;

        Prepared(String videoId, String link, String desc, String reason, long at) {
            this.videoId = videoId;
            this.link = link;
            this.desc = desc;
            this.reason = reason;
            this.at = at;
        }
    }

    private static final Map<String, Addons> ADDONS = new ConcurrentHashMap<String, Addons>();
    private static volatile Prepared prepared;
    private static volatile String inflight = "";
    private static volatile String expectedId = "";
    private static volatile long expectedAt;
    // Watchdog of a launched prepared link: video id, launch time, first frame seen.
    private static volatile String launchedId = "";
    private static volatile long launchedAt;
    private static volatile boolean launchedReady;
    // Viewer-paused time of the launched start (not counted against the limit) and the last watch poll.
    private static volatile long pausedMs, pollAt;

    private NextPrep() {
    }

    static boolean enabled(Context ctx) {
        return IntroSkipPrefs.isPrepareNextEnabled(ctx) && IntroSkipPrefs.isAutoPickEnabled(ctx)
                && !IntroSkipPrefs.isShowListEnabled(ctx);
    }

    // ---- addon memory -----------------------------------------------------------------------

    /** A show's streams page listed these addons (title, transport URL); the app already applied the manifests' rules. */
    static void rememberAddons(String metaId, List<String[]> stream, String metaTransport) {
        try {
            if (metaId == null || metaId.length() == 0) return;
            Addons a = new Addons();
            Addons old = ADDONS.get(metaId);
            Map<String, String> seen = new LinkedHashMap<String, String>();
            if (stream != null) {
                for (String[] s : stream) {
                    if (s == null || s.length < 2 || NextPrepCore.addonBase(s[1]).length() == 0) continue;
                    if (!seen.containsKey(s[1])) seen.put(s[1], s[0] == null ? "" : s[0]);
                }
            }
            // A fast pick can snapshot only the first addon to answer: keep slower ones
            // already known for this show (a removed addon just fails soft when asked).
            if (old != null) {
                for (String[] s : old.stream) {
                    if (!seen.containsKey(s[1])) seen.put(s[1], s[0]);
                }
            }
            if (seen.isEmpty() && old != null) return; // a still-loading page never forgets a known set
            for (Map.Entry<String, String> e : seen.entrySet()) a.stream.add(new String[]{e.getValue(), e.getKey()});
            a.metaTransport = metaTransport != null && metaTransport.length() > 0 ? metaTransport
                    : old != null ? old.metaTransport : "";
            ADDONS.put(metaId, a);
        } catch (Throwable ignored) {
            // Memory only.
        }
    }

    /** The meta addon a player used for this show (the player link needs it). */
    static void rememberMetaTransport(String metaId, String metaTransport) {
        try {
            if (metaId == null || metaId.length() == 0 || metaTransport == null || metaTransport.length() == 0) return;
            Addons a = ADDONS.get(metaId);
            if (a == null) {
                a = new Addons();
                ADDONS.put(metaId, a);
            }
            a.metaTransport = metaTransport;
        } catch (Throwable ignored) {
            // Memory only.
        }
    }

    // ---- prepare ------------------------------------------------------------------------------

    /**
     * Starts the background preparation of nextVideoId once. streamTransport: the addon that served the current
     * episode (asked too when the show's page was never seen); metaTransport: the meta addon of the current player.
     */
    static void prepare(final Context ctx, final String type, final String nextVideoId, final String metaName,
                        final String streamTransport, final String metaTransport) {
        try {
            if (ctx == null || nextVideoId == null || nextVideoId.length() == 0 || !enabled(ctx)) return;
            Prepared p = prepared;
            if (p != null && p.videoId.equals(nextVideoId)
                    && System.currentTimeMillis() - p.at <= NextPrepCore.MAX_AGE_MS) return;
            if (nextVideoId.equals(inflight)) return;
            inflight = nextVideoId;
            final String metaId = NextPrepCore.metaIdOf(nextVideoId);
            rememberMetaTransport(metaId, metaTransport);
            Addons known = ADDONS.get(metaId);
            final List<String[]> addons = new ArrayList<String[]>();
            String m = known != null && known.metaTransport.length() > 0 ? known.metaTransport : safe(metaTransport);
            // IMDb ids are described by Cinemeta in every stock profile.
            if (m.length() == 0 && metaId.startsWith("tt")) m = CINEMETA;
            final String meta = m;
            if (known != null) addons.addAll(known.stream);
            boolean have = false;
            for (String[] a : addons) have |= a[1].equals(streamTransport);
            if (!have && NextPrepCore.addonBase(streamTransport).length() > 0) addons.add(new String[]{"", streamTransport});
            if (addons.isEmpty() || meta.length() == 0) {
                inflight = "";
                Log.i(TAG, "skip " + nextVideoId + ": " + (addons.isEmpty() ? "no stream addon known" : "no meta addon known"));
                PlaybackDiary.ev(ctx, "next.prep", "vid", nextVideoId, "ok", false, "why", addons.isEmpty() ? "no addons" : "no meta addon");
                return;
            }
            final String t = type == null || type.length() == 0 ? "series" : type;
            Thread worker = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        run0(ctx, t, nextVideoId, metaId, metaName, addons, meta);
                    } catch (Throwable error) {
                        Log.w(TAG, "prepare failed", error);
                    } finally {
                        inflight = "";
                    }
                }
            }, "NextPrep");
            worker.setPriority(Thread.MIN_PRIORITY);
            worker.start();
        } catch (Throwable ignored) {
            inflight = "";
        }
    }

    /** The preparation itself (worker thread; called directly by the PC rig test). */
    static void run0(Context ctx, String type, String videoId, String metaId, String metaName,
                             List<String[]> addons, String metaTransport) {
        long started = System.currentTimeMillis();
        List<StreamRanker.Stream> candidates = new ArrayList<StreamRanker.Stream>();
        Map<StreamRanker.Stream, String[]> origin = new java.util.IdentityHashMap<StreamRanker.Stream, String[]>();
        int asked = 0, answered = 0;
        for (String[] addon : addons) {
            String url = NextPrepCore.streamRequestUrl(addon[1], type, videoId);
            if (url.length() == 0) continue;
            asked++; // one request per addon per preparation, no retry
            String body = get(url);
            if (body == null) continue;
            answered++;
            for (NextPrepCore.Cand c : NextPrepCore.parseStreams(body)) {
                if (c.name.contains("⚠") || c.title.contains("⚠") || c.title.contains("⛔")) continue;
                if (metaName != null && metaName.length() > 0
                        && !StreamAutoPick.matchesMeta(c.name + " " + c.title, metaName)) continue;
                StreamRanker.Stream s = new StreamRanker.Stream(c.name, c.title, c.url, addon[0], c.fileName);
                candidates.add(s);
                origin.put(s, new String[]{c.json, addon[1]});
            }
        }
        int[] req = StreamRanker.requestOf(videoId);
        List<StreamRanker.Ranked> ranked = candidates.isEmpty() ? new ArrayList<StreamRanker.Ranked>()
                : StreamRanker.rank(candidates, false, req[0], req[1], 0);
        long ms = System.currentTimeMillis() - started;
        if (ranked.isEmpty()) {
            Log.i(TAG, "nothing for " + videoId + " (" + answered + "/" + asked + " addons answered)");
            PlaybackDiary.ev(ctx, "next.prep", "vid", videoId, "ok", false, "why", "no stream", "asked", asked, "answered", answered, "ms", ms);
            return;
        }
        StreamRanker.Ranked best = ranked.get(0);
        String[] src = origin.get(best.stream);
        if (src == null) return;
        if (best.stream.url == null || best.stream.url.length() == 0) {
            // P2P needs the streaming server and often starts slower than the 25 s watchdog: today's path.
            Log.i(TAG, "winner for " + videoId + " is a torrent: not prepared");
            PlaybackDiary.ev(ctx, "next.prep", "vid", videoId, "ok", false, "why", "torrent", "ms", ms);
            return;
        }
        String link = "";
        String how = "unchecked";
        for (int i = 0; i < 2 && link.length() == 0; i++) {
            String data = NextPrepCore.encodeStreamData(src[0], i == 1);
            Boolean ok = coreDecodes(data);
            if (ok == null || ok) {
                link = NextPrepCore.playerLink(data, src[1], metaTransport, type, metaId, videoId);
                how = ok == null ? "unchecked" : i == 0 ? "core ok" : "core ok (url-safe)";
            }
            if (ok == null) break;
        }
        if (link.length() == 0) {
            Log.i(TAG, "core rejected the prepared stream for " + videoId);
            PlaybackDiary.ev(ctx, "next.prep", "vid", videoId, "ok", false, "why", "core decode", "ms", ms);
            return;
        }
        boolean warmed = best.meta.cached && warm(best.stream.url);
        prepared = new Prepared(videoId, link, best.stream.toString(), best.reason, System.currentTimeMillis());
        Log.i(TAG, "ready " + videoId + " -> " + best.stream + " (" + best.reason + ", " + how + ", "
                + answered + "/" + asked + " addons, " + ms + " ms" + (warmed ? ", warmed" : "") + ")");
        PlaybackDiary.ev(ctx, "next.prep", "vid", videoId, "ok", true, "n", ranked.size(), "asked", asked,
                "answered", answered, "ms", ms, "cached", best.meta.cached, "warm", warmed, "check", how, "why", best.reason);
    }

    /** True/false when the app's core can decode the stream data of a player link; null when it cannot be asked. */
    private static Boolean coreDecodes(String data) {
        if (data == null || data.length() == 0) return Boolean.FALSE;
        try {
            Class<?> core = Class.forName("com.stremio.core.Core", false, NextPrep.class.getClassLoader());
            Object instance = core.getField("INSTANCE").get(null);
            java.lang.reflect.Method m = core.getDeclaredMethod("decodeStreamDataNative", String.class);
            m.setAccessible(true);
            return m.invoke(instance, data) != null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String get(String url) {
        java.net.HttpURLConnection conn = null;
        try {
            conn = (java.net.HttpURLConnection) new java.net.URL(url).openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(10000);
            conn.setRequestProperty("Accept", "application/json");
            if (conn.getResponseCode() != 200) return null;
            java.io.InputStream in = conn.getInputStream();
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) {
                out.write(buf, 0, n);
                if (out.size() > MAX_BODY) return null;
            }
            in.close();
            return out.toString("UTF-8");
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.disconnect();
                } catch (Throwable ignored) {
                    // Closed.
                }
            }
        }
    }

    /** One small range request (first 64 KB) so the debrid service resolves the link before Next. */
    private static boolean warm(String url) {
        if (url == null || !(url.startsWith("http://") || url.startsWith("https://"))) return false;
        java.net.HttpURLConnection conn = null;
        try {
            conn = (java.net.HttpURLConnection) new java.net.URL(url).openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(8000);
            conn.setRequestProperty("Range", "bytes=0-" + (WARM_BYTES - 1));
            int code = conn.getResponseCode();
            if (code != 200 && code != 206) return false;
            java.io.InputStream in = conn.getInputStream();
            byte[] buf = new byte[8192];
            int total = 0, n;
            while (total < WARM_BYTES && (n = in.read(buf, 0, Math.min(buf.length, WARM_BYTES - total))) > 0) total += n;
            in.close();
            return true;
        } catch (Throwable ignored) {
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.disconnect();
                } catch (Throwable ignored) {
                    // Closed.
                }
            }
        }
    }

    // ---- player context ---------------------------------------------------------------------

    /** {next video id, meta type, meta name, stream transport, meta transport} of the playing item, or null. */
    static String[] playerContext(Object classicPlayerFragment) {
        try {
            if (classicPlayerFragment == null) {
                if (!PortHooks.isLoaded()) return null;
                return new String[]{PortHooks.nextVideoId(), PortHooks.metaType(), PortHooks.metaTitle(),
                        PortHooks.streamTransport(), PortHooks.metaTransport()};
            }
            Object st = call(call(viewModelOf(classicPlayerFragment), "getState"), "getValue");
            Object video = call(st, "getBingeVideo");
            if (video == null) video = call(st, "getNextVideo");
            android.os.Bundle args = argumentsOf(classicPlayerFragment);
            String type = args == null ? "" : safe(args.getString("type"));
            return new String[]{str(call(video, "getId")), type, str(call(call(st, "getMetaItem"), "getName")),
                    args == null ? "" : safe(args.getString("streamAddonUrl")),
                    args == null ? "" : safe(args.getString("metaAddonUrl"))};
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Prepares from a player context (see playerContext); remembers which video it follows. */
    static void prepareFrom(Context ctx, String currentVideoId, String[] c) {
        if (c == null || c[0] == null || c[0].length() == 0) return;
        if (currentVideoId != null && currentVideoId.length() > 0) followsId.put(currentVideoId, c[0]);
        prepare(ctx, c[1], c[0], c[2], c[3], c[4]);
    }

    private static final Map<String, String> followsId = new ConcurrentHashMap<String, String>();

    /** The current episode is ending on its own (EOF, external binge): its prepared next may start. */
    public static void expectNextAfter(String finishedVideoId) {
        try {
            String next = finishedVideoId == null ? null : followsId.get(finishedVideoId);
            if (next != null && next.length() > 0) expectNext(next);
        } catch (Throwable ignored) {
            // Today's path.
        }
    }

    /**
     * An external player started this video: it reports no progress, so the preparation runs once a short
     * while into it (still one request per addon) while the stock player screen behind it holds the context.
     */
    public static void onExternalLaunch(final Context ctx, final String videoId, final Object classicPlayerFragment) {
        try {
            if (ctx == null || videoId == null || videoId.length() == 0 || !enabled(ctx)) return;
            // Compose: the launch unloads the core player, so read its context now, while it
            // still names this video; the delayed run below prefers a fresh read and falls
            // back to this capture (an empty next id fails soft in prepareFrom, as today).
            final String[] early = classicPlayerFragment == null && videoId.equals(PortHooks.streamId())
                    ? playerContext(null) : null;
            final java.lang.ref.WeakReference<Object> frag = new java.lang.ref.WeakReference<Object>(classicPlayerFragment);
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        Object f = frag.get();
                        String[] c = null;
                        if (f != null || videoId.equals(PortHooks.streamId())) c = playerContext(f);
                        if ((c == null || c[0] == null || c[0].length() == 0) && early != null) {
                            // A different video is loaded now: that launch is over.
                            if (PortHooks.isLoaded() && PortHooks.streamId().length() > 0
                                    && !videoId.equals(PortHooks.streamId())) return;
                            c = early;
                        }
                        if (c == null) return;
                        Log.i(TAG, "external player: preparing after " + videoId);
                        prepareFrom(ctx, videoId, c);
                    } catch (Throwable ignored) {
                        // Today's path.
                    }
                }
            }, EXTERNAL_DELAY_MS);
        } catch (Throwable ignored) {
            // Today's path.
        }
    }

    static final long EXTERNAL_DELAY_MS = 90000L;

    private static Object viewModelOf(Object frag) {
        for (Class<?> c = frag.getClass(); c != null; c = c.getSuperclass()) {
            try {
                java.lang.reflect.Method getter = c.getDeclaredMethod("getViewModel");
                getter.setAccessible(true);
                Object vm = getter.invoke(frag);
                if (vm != null) return vm;
            } catch (Throwable ignored) {
                // Delegate or superclass.
            }
            try {
                java.lang.reflect.Field delegate = c.getDeclaredField("viewModel$delegate");
                delegate.setAccessible(true);
                Object vm = call(delegate.get(frag), "getValue");
                if (vm != null) return vm;
            } catch (Throwable ignored) {
                // Superclass.
            }
        }
        return null;
    }

    private static android.os.Bundle argumentsOf(Object frag) {
        for (java.lang.reflect.Method m : frag.getClass().getMethods()) {
            try {
                if (m.getParameterTypes().length == 0 && m.getReturnType() == android.os.Bundle.class) {
                    Object b = m.invoke(frag);
                    if (b instanceof android.os.Bundle && ((android.os.Bundle) b).containsKey("streamData")) {
                        return (android.os.Bundle) b;
                    }
                }
            } catch (Throwable ignored) {
                // Next getter.
            }
        }
        return null;
    }

    private static Object call(Object target, String name) {
        try {
            if (target == null) return null;
            java.lang.reflect.Method m = target.getClass().getMethod(name);
            m.setAccessible(true);
            return m.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String str(Object o) {
        return o == null ? "" : String.valueOf(o);
    }

    // ---- use ----------------------------------------------------------------------------------

    /** A Next (pill, end of file, binge) is opening this episode's streams page. */
    public static void expectNext(String videoId) {
        expectedId = videoId == null ? "" : videoId;
        expectedAt = System.currentTimeMillis();
    }

    /**
     * This video is playing. When it is the expected next, the stock binge reached it without
     * the streams page (straight into the player): the expectation is spent, so a later Back
     * to its streams page can never start the prepared link.
     */
    static void notePlaying(String videoId) {
        if (videoId != null && videoId.equals(expectedId)) clearExpectation();
    }

    /** A genuine navigation (episode list): no prepared start until the next Next. */
    public static void clearExpectation() {
        expectedId = "";
        expectedAt = 0L;
    }

    /** The prepared stream of the expected next episode, or "" (then today's page and auto-pick run). Consumed. */
    static String takeLink(Context ctx, String requestedId) {
        try {
            Prepared p = prepared;
            long now = System.currentTimeMillis();
            boolean expected = requestedId != null && requestedId.equals(expectedId) && now - expectedAt <= EXPECT_MS;
            // One shot: the page the Next opened gets this single chance; any later visit (Back) gets none.
            if (expected) clearExpectation();
            int decision = NextPrepCore.useDecision(IntroSkipPrefs.isPrepareNextEnabled(ctx),
                    IntroSkipPrefs.isAutoPickEnabled(ctx), IntroSkipPrefs.isShowListEnabled(ctx),
                    p != null && p.link.length() > 0, p == null ? "" : p.videoId, requestedId,
                    p == null ? -1L : now - p.at, expected);
            if (decision != 0) return "";
            if (prepared == p) prepared = null; // keep a newer preparation written meanwhile
            clearExpectation();
            launchedId = requestedId;
            launchedAt = now;
            launchedReady = false;
            pausedMs = pollAt = 0L;
            Log.i(TAG, "use " + requestedId + " -> " + p.desc + " (" + ((now - p.at) / 1000L) + " s old)");
            PlaybackDiary.ev(ctx, "next.use", "vid", requestedId, "age_s", (now - p.at) / 1000L, "why", p.reason);
            return p.link;
        } catch (Throwable ignored) {
            return "";
        }
    }

    static final int WATCH_NONE = 0, WATCH_READY = 1, WATCH_ABANDON = 2, WATCH_CANCELLED = 3;
    /** One poll of the session playing curVideoId ("" while unknown): ready, timed out, or cancelled
     *  because a different video is playing (watchdog ends). An unknown id changes nothing. */
    static int watchPoll(String curVideoId, boolean readyPlaying, boolean playerError, boolean userActed) {
        return watchPoll(curVideoId, readyPlaying, playerError, userActed, false);
    }
    static int watchPoll(String curVideoId, boolean readyPlaying, boolean playerError, boolean userActed,
                         boolean paused) {
        String watch = pendingLaunch();
        if (watch.length() == 0) return WATCH_NONE;
        if (!watch.equals(curVideoId)) {
            if (curVideoId == null || curVideoId.length() == 0) return WATCH_NONE;
            launchedId = "";
            launchedReady = false;
            return WATCH_CANCELLED;
        }
        if (readyPlaying) {
            noteReady(watch);
            return WATCH_READY;
        }
        return shouldAbandon(watch, playerError, userActed, paused) ? WATCH_ABANDON : WATCH_NONE;
    }
    /** The player reached its first ready state for this video. */
    static void noteReady(String videoId) {
        if (videoId != null && videoId.equals(launchedId)) launchedReady = true;
    }

    /**
     * True once when a prepared start for this video has not produced a frame in time (or the player
     * reported an error); the caller then leaves the player and the watchdog ends. A start the viewer
     * has paused (paused = playWhenReady false) is never closed, and its paused time does not count.
     */
    static boolean shouldAbandon(String videoId, boolean playerError, boolean userActed) {
        return shouldAbandon(videoId, playerError, userActed, false);
    }
    static boolean shouldAbandon(String videoId, boolean playerError, boolean userActed, boolean paused) {
        try {
            if (videoId == null || videoId.length() == 0 || !videoId.equals(launchedId)) return false;
            long nowMs = System.currentTimeMillis();
            pausedMs = NextPrepCore.pausedHold(pausedMs, pollAt, nowMs, paused);
            pollAt = nowMs;
            if (paused) return false;
            long since = nowMs - launchedAt;
            if (launchedReady || userActed || since > 60000L) {
                if (launchedReady || userActed) launchedId = "";
                return false;
            }
            // A frame-rate hold on the loading screen is not a slow start: it does not count here.
            if (!NextPrepCore.shouldAbandon(since, FrameRateSwitch.holdMs() + pausedMs, false, playerError, false)) return false;
            launchedId = "";
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Video id of a prepared start still waiting for its first frame, "" when none; launchedAt() is its start. */
    static String pendingLaunch() {
        return launchedReady ? "" : launchedId;
    }

    static long launchedAt() {
        return launchedAt;
    }

    /** True while a prepared start for this video waits for its first frame. */
    static boolean watching(String videoId) {
        return videoId != null && videoId.length() > 0 && videoId.equals(launchedId) && !launchedReady;
    }

    static Addons addonsOf(String metaId) {
        return metaId == null ? null : ADDONS.get(metaId);
    }

    /** Forgets everything (tests). */
    static void reset() {
        ADDONS.clear();
        prepared = null;
        inflight = expectedId = launchedId = "";
        expectedAt = launchedAt = 0L;
        launchedReady = false;
        pausedMs = pollAt = 0L;
    }

    /** Test hook: a prepared link without the network. */
    static void setPreparedForTest(String videoId, String link) {
        prepared = new Prepared(videoId, link, "test", "test", System.currentTimeMillis());
    }

    private static String safe(String s) {
        return s == null ? "" : s;
    }
}
