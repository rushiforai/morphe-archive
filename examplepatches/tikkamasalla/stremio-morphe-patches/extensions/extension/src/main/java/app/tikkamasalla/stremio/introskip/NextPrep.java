package app.tikkamasalla.stremio.introskip;

import android.content.Context;
import android.util.Log;

import app.tikkamasalla.stremio.diag.PlaybackDiary;
import app.tikkamasalla.stremio.oneahead.OneAheadTrigger;
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
        final String streamUrl, fileName, addonTransport;
        final boolean cached;
        final long sizeBytes;

        Prepared(String videoId, String link, String desc, String reason, long at) {
            this(videoId, link, desc, reason, at, "", "", "", false, 0L);
        }

        Prepared(String videoId, String link, String desc, String reason, long at,
                 String streamUrl, String fileName, String addonTransport, boolean cached, long sizeBytes) {
            this.videoId = videoId;
            this.link = link;
            this.desc = desc;
            this.reason = reason;
            this.at = at;
            this.streamUrl = streamUrl;
            this.fileName = fileName;
            this.addonTransport = addonTransport;
            this.cached = cached;
            this.sizeBytes = sizeBytes;
        }
    }

    /** The ranked list a preparation chose from, kept for the background chapter swap. */
    private static final class AltSet {
        final String videoId, type, metaId, metaTransport;
        final List<StreamRanker.Ranked> ranked;
        final Map<StreamRanker.Stream, String[]> origin;

        AltSet(String videoId, String type, String metaId, String metaTransport,
               List<StreamRanker.Ranked> ranked, Map<StreamRanker.Stream, String[]> origin) {
            this.videoId = videoId;
            this.type = type;
            this.metaId = metaId;
            this.metaTransport = metaTransport;
            this.ranked = ranked;
            this.origin = origin;
        }
    }

    private static final Map<String, Addons> ADDONS = new ConcurrentHashMap<String, Addons>();
    private static volatile Prepared prepared;
    private static volatile AltSet altSet;
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
        prepare(ctx, type, nextVideoId, metaName, streamTransport, metaTransport, false);
    }

    static void prepare(final Context ctx, final String type, final String nextVideoId, final String metaName,
                        final String streamTransport, final String metaTransport, final boolean external) {
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
                        run0(ctx, t, nextVideoId, metaId, metaName, addons, meta, external);
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
        run0(ctx, type, videoId, metaId, metaName, addons, metaTransport, false);
    }

    static void run0(Context ctx, String type, String videoId, String metaId, String metaName,
                             List<String[]> addons, String metaTransport, boolean external) {
        long started = System.currentTimeMillis();
        List<StreamRanker.Stream> candidates = new ArrayList<StreamRanker.Stream>();
        Map<StreamRanker.Stream, String[]> origin = new java.util.IdentityHashMap<StreamRanker.Stream, String[]>();
        int asked = 0, answered = 0, rows = 0, kept = 0;
        StringBuilder perAddon = new StringBuilder();
        for (String[] addon : addons) {
            String url = NextPrepCore.streamRequestUrl(addon[1], type, videoId);
            if (url.length() == 0) continue;
            asked++; // one request per addon per preparation, no retry
            String body = get(url, 10000);
            int got = 0, use = 0;
            if (body != null) {
                answered++;
                for (NextPrepCore.Cand c : NextPrepCore.parseStreams(body)) {
                    if (c.name.contains("⚠") || c.title.contains("⚠") || c.title.contains("⛔")) continue;
                    if (metaName != null && metaName.length() > 0
                            && !StreamAutoPick.matchesMeta(c.name + " " + c.title, metaName)) continue;
                    got++;
                    StreamRanker.Stream s = new StreamRanker.Stream(c.name, c.title, c.url, addon[0], c.fileName);
                    candidates.add(s);
                    origin.put(s, new String[]{c.json, addon[1]});
                    use++;
                }
            }
            rows += got; kept += use;
            if (perAddon.length() > 0) perAddon.append(";");
            perAddon.append(shortAddon(addon[1])).append(body == null ? "=no-answer" : "=" + got + "/" + use);
        }
        int[] req = StreamRanker.requestOf(videoId);
        List<StreamRanker.Ranked> ranked = candidates.isEmpty() ? new ArrayList<StreamRanker.Ranked>()
                : StreamRanker.rank(candidates, false, req[0], req[1], 0);
        long ms = System.currentTimeMillis() - started;
        if (ranked.isEmpty()) {
            Log.i(TAG, "nothing for " + videoId + " (" + answered + "/" + asked + " addons answered"
                    + " rows=" + rows + " kept=" + kept + " [" + perAddon + "])");
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
        prepared = new Prepared(videoId, link, best.stream.toString(), best.reason, System.currentTimeMillis(),
                best.stream.url, best.stream.fileName, src[1], best.meta.cached, best.meta.sizeBytes);
        altSet = new AltSet(videoId, type, metaId, metaTransport,
                new ArrayList<StreamRanker.Ranked>(ranked), origin);
        try {
            if (IntroSkipPrefs.isOneAheadEnabled(ctx) || IntroSkipPrefs.isBorrowEnabled(ctx)) {
                OneAheadTrigger.onPrepared(ctx, videoId, type, metaId, best.stream.url, best.stream.fileName,
                        src[1], metaTransport, best.meta.cached, best.meta.sizeBytes, external);
            }
        } catch (Throwable ignored) {
            // One-ahead is optional.
        }
        Log.i(TAG, "ready " + videoId + " -> " + best.stream + " (" + best.reason + ", " + how + ", "
                + answered + "/" + asked + " addons, " + ms + " ms" + (warmed ? ", warmed" : "") + ")");
        PlaybackDiary.ev(ctx, "next.prep", "vid", videoId, "ok", true, "n", ranked.size(), "asked", asked,
                "answered", answered, "ms", ms, "cached", best.meta.cached, "warm", warmed, "check", how, "why", best.reason);
    }

    /**
     * Background chapter swap, called only by the one-ahead trigger worker: when the prepared
     * winner's own chapters do not cover the missing types, a same-class candidate whose chapters
     * do replaces it. Returns {url, fileName, sizeBytes} of the new winner, or null (no change).
     * Setting off means no chapter read at all; a used or replaced entry is never touched.
     */
    public static String[] chapterSwap(Context ctx, String videoId, boolean needIntro, boolean needCredits,
                                       double runtimeSec) {
        try {
            if (ctx == null || videoId == null || (!needIntro && !needCredits)) return null;
            if (!IntroSkipPrefs.isOneAheadEnabled(ctx) && !IntroSkipPrefs.isBorrowEnabled(ctx)) return null; // setting off: no read
            Prepared cur = prepared;
            AltSet a = altSet;
            // Only a cached winner is ever read: an uncached link must not be touched at all.
            if (cur == null || !cur.cached || a == null || !videoId.equals(cur.videoId) || !videoId.equals(a.videoId)) return null;
            if (a.ranked.isEmpty() || !cur.streamUrl.equals(a.ranked.get(0).stream.url)) return null;
            boolean used = videoId.equals(launchedId) || videoId.equals(expectedId);
            if (!StreamRanker.chapterSwapAllowed(true, prepared == cur, used)) return null;
            if (IntroSkipBridge.chaptersCover(cur.streamUrl, runtimeSec, needIntro, needCredits)) return null;
            int[] req = StreamRanker.requestOf(videoId);
            for (StreamRanker.Ranked r : StreamRanker.chapterSwapCandidates(a.ranked, req[0], req[1])) {
                if (!IntroSkipPrefs.isOneAheadEnabled(ctx) && !IntroSkipPrefs.isBorrowEnabled(ctx)) return null; // toggled off mid-check: stop reading
                if (!IntroSkipBridge.chaptersCover(r.stream.url, runtimeSec, needIntro, needCredits)) continue;
                String[] src = a.origin.get(r.stream);
                if (src == null) continue;
                String link = "";
                for (int i = 0; i < 2 && link.length() == 0; i++) {
                    String data = NextPrepCore.encodeStreamData(src[0], i == 1);
                    Boolean ok = coreDecodes(data);
                    if (ok == null || ok) link = NextPrepCore.playerLink(data, src[1], a.metaTransport, a.type, a.metaId, videoId);
                    if (ok == null) break;
                }
                if (link.length() == 0) continue;
                synchronized (NextPrep.class) {
                    boolean stillUsed = videoId.equals(launchedId) || videoId.equals(expectedId);
                    if (!StreamRanker.chapterSwapAllowed(IntroSkipPrefs.isOneAheadEnabled(ctx) || IntroSkipPrefs.isBorrowEnabled(ctx), prepared == cur, stillUsed)) return null;
                    prepared = new Prepared(videoId, link, r.stream.toString(), "chapters",
                            System.currentTimeMillis(), r.stream.url, r.stream.fileName, src[1], r.meta.cached, r.meta.sizeBytes);
                }
                Log.i(TAG, "swap " + videoId + " " + cur.sizeBytes + " -> " + r.meta.sizeBytes + " chapters");
                return new String[]{r.stream.url, r.stream.fileName, String.valueOf(r.meta.sizeBytes)};
            }
            return null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * The other cached streams of an episode, for borrowing chapters: rows {url, fileName, title}.
     * Uncached links never leave here; they must not be touched at all.
     */
    public static List<String[]> borrowDonors(String videoId, String targetUrl) {
        List<String[]> out = new ArrayList<String[]>();
        try {
            AltSet a = altSet;
            if (a == null || videoId == null || !videoId.equals(a.videoId)) return out;
            for (StreamRanker.Ranked r : a.ranked) {
                if (!r.meta.cached || r.stream.url == null || r.stream.url.length() == 0
                        || r.stream.url.equals(targetUrl)) continue;
                out.add(new String[]{r.stream.url, r.stream.fileName, r.stream.name + " " + r.stream.title});
            }
        } catch (Throwable ignored) {
            out.clear();
        }
        return out;
    }

    /** True while the prepared entry for videoId is still the one playing streamUrl. */
    public static boolean isPreparedStream(String videoId, String streamUrl) {
        Prepared p = prepared;
        return p != null && videoId != null && videoId.equals(p.videoId)
                && streamUrl != null && streamUrl.equals(p.streamUrl);
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

    /** Why the last get() on this thread returned null (status or exception class); read right after a null. */
    private static final ThreadLocal<String> GET_FAILURE = new ThreadLocal<String>();

    private static String get(String url, int readMs) {
        java.net.HttpURLConnection conn = null;
        GET_FAILURE.set("none");
        try {
            conn = (java.net.HttpURLConnection) new java.net.URL(url).openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(readMs);
            conn.setRequestProperty("Accept", "application/json");
            int status = conn.getResponseCode();
            if (status != 200) { GET_FAILURE.set("http=" + status); return null; }
            java.io.InputStream in = conn.getInputStream();
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) {
                out.write(buf, 0, n);
                if (out.size() > MAX_BODY) { GET_FAILURE.set("too-large"); return null; }
            }
            in.close();
            return out.toString("UTF-8");
        } catch (Throwable failed) {
            GET_FAILURE.set(failed.getClass().getSimpleName());
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
        prepareFrom(ctx, currentVideoId, c, false);
    }

    static void prepareFrom(Context ctx, String currentVideoId, String[] c, boolean external) {
        if (c == null || c[0] == null || c[0].length() == 0) return;
        if (currentVideoId != null && currentVideoId.length() > 0) followsId.put(currentVideoId, c[0]);
        prepare(ctx, c[1], c[0], c[2], c[3], c[4], external);
    }

    /**
     * Ranked direct streams of one episode from one addon (this class's own query
     * code, one request, no retry). Rows: {url, fileName, cached ? "1" : "0", sizeBytes}.
     * Runs on the caller's thread; the one-ahead glue calls it from its worker.
     */
    public static List<String[]> queryEpisodeStreams(String type, String videoId, String transport) {
        List<String[]> out = new ArrayList<String[]>();
        try {
            String url = NextPrepCore.streamRequestUrl(transport, type, videoId);
            if (url.length() == 0) return out;
            String body = get(url, 25000);
            if (body == null) {
                Log.i("NextPrep", "query null-body ep=" + videoId + " why=" + GET_FAILURE.get());
                return out;
            }
            List<StreamRanker.Stream> candidates = new ArrayList<StreamRanker.Stream>();
            for (NextPrepCore.Cand c : NextPrepCore.parseStreams(body)) {
                if (c.url == null || c.url.length() == 0) continue;
                if (c.name.contains("⚠") || c.title.contains("⚠") || c.title.contains("⛔")) continue;
                candidates.add(new StreamRanker.Stream(c.name, c.title, c.url, "", c.fileName));
            }
            int[] req = StreamRanker.requestOf(videoId);
            List<StreamRanker.Ranked> ranked = candidates.isEmpty() ? new ArrayList<StreamRanker.Ranked>()
                    : StreamRanker.rank(candidates, false, req[0], req[1], 0);
            for (StreamRanker.Ranked r : ranked) {
                out.add(new String[]{r.stream.url, r.stream.fileName,
                        r.meta.cached ? "1" : "0", String.valueOf(r.meta.sizeBytes)});
            }
        } catch (Throwable ignored) {
            // No candidates.
        }
        return out;
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
            final String[] early = classicPlayerFragment != null ? playerContext(classicPlayerFragment)
                    : videoId.equals(PortHooks.streamId()) ? playerContext(null) : null;
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
                        if ((c[0] == null || c[0].length() == 0) && (IntroSkipPrefs.isOneAheadEnabled(ctx) || IntroSkipPrefs.isBorrowEnabled(ctx))) {
                            // Neither read named the next episode (not known yet at launch, state gone since): ask the meta.
                            final String[] noNext = c;
                            Thread ask = new Thread(new Runnable() {
                                @Override
                                public void run() {
                                    try {
                                        String next = OneAheadTrigger.nextEpisodeId(noNext[1], NextPrepCore.metaIdOf(videoId), noNext[4], videoId);
                                        Log.i("OneAhead", "ext next from meta: " + (next.length() > 0));
                                        if (next.length() == 0) return;
                                        noNext[0] = next;
                                        new android.os.Handler(android.os.Looper.getMainLooper()).post(new Runnable() {
                                            @Override public void run() { startExternal(ctx, videoId, noNext); }
                                        });
                                    } catch (Throwable ignored) {
                                        // Today's path: nothing prepared.
                                    }
                                }
                            }, "NextPrepExtNext");
                            ask.setDaemon(true);
                            ask.start();
                            return;
                        }
                        startExternal(ctx, videoId, c);
                    } catch (Throwable ignored) {
                        // Today's path.
                    }
                }
            }, EXTERNAL_DELAY_MS);
        } catch (Throwable ignored) {
            // Today's path.
        }
    }

    private static void startExternal(final Context ctx, final String videoId, final String[] c) {
        try {
            Log.i(TAG, "external player: preparing after " + videoId);
            prepareFrom(ctx, videoId, c, true);
            // Real next-episode lookup first (never a blind "unknown"): the
            // journal of the episode playing in Vimu holds its duration by now.
            // No length or no id: the one-ahead run does not start at all.
            if (!IntroSkipPrefs.isOneAheadEnabled(ctx) && !IntroSkipPrefs.isBorrowEnabled(ctx)) return;
            final String[] ctxNext = c;
            Thread lookup = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        long len = app.tikkamasalla.stremio.progress.ExternalProgress
                                .vimuJournalDurationSec(ctx, videoId);
                        String metaId = NextPrepCore.metaIdOf(ctxNext[0]);
                        if (!app.tikkamasalla.stremio.oneahead.OneAheadGate.externalStarts(
                                ctxNext[0], metaId, len)) {
                            Log.i("OneAhead", "ext start refused: " + (ctxNext[0] == null || ctxNext[0].length() == 0
                                    ? "no-next-id" : len <= 0 ? "no-length" : "no-meta-id") + " len=" + len);
                            return;
                        }
                        int[] req = StreamRanker.requestOf(ctxNext[0]);
                        Log.i("OneAhead", "ext lookup: next=" + ctxNext[0] + " len=" + len);
                        IntroSkipBridge.prefetchSkips(ctx, metaId, ctxNext[2],
                                req[0], req[1], len, ctxNext[0], videoId, "");
                    } catch (Throwable t) {
                        Log.i("OneAhead", "ext lookup failed " + t.getClass().getSimpleName());
                    }
                }
            }, "NextPrepExtLookup");
            lookup.setDaemon(true);
            lookup.start();
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
        altSet = null;
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

    /** Short addon tag for the log (host only, never a key): "torrentio.strem.fun" from a transport URL. */
    public static String shortAddon(String transportUrl) {
        try {
            String base = NextPrepCore.addonBase(transportUrl);
            int at = base.indexOf("://");
            String host = at >= 0 ? base.substring(at + 3) : base;
            int slash = host.indexOf('/');
            if (slash >= 0) host = host.substring(0, slash);
            return host.length() == 0 ? "?" : host;
        } catch (Throwable ignored) {
            return "?";
        }
    }
}
