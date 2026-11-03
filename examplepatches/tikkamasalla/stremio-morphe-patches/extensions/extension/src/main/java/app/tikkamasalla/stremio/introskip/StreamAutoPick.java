package app.tikkamasalla.stremio.introskip;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import app.tikkamasalla.stremio.diag.PlaybackDiary;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Auto-picks the top ranked stream when an episode or movie is opened.
 * Fail soft: any problem leaves the full stream list on screen.
 */
public final class StreamAutoPick {
    private static final String TAG = "AutoPick";
    private static final long WAIT_MS = 4000L;
    private static final long WAIT_NOCACHE_MS = 8000L;
    // Once every addon has answered the pick does not wait for the timers above; the short dwell is the
    // window to press Back or any key first. POLL_MS: how often a classic screen is re-checked for that.
    private static final long MIN_DWELL_MS = 1200L;
    private static final long POLL_MS = 500L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, String> FIRST_SEEN = Collections.synchronizedMap(
            new WeakHashMap<Object, String>());
    private static final Map<Object, Long> FIRST_AT = Collections.synchronizedMap(
            new WeakHashMap<Object, Long>());
    private static final Map<Object, Boolean> TIMER_4 = Collections.synchronizedMap(
            new WeakHashMap<Object, Boolean>());
    private static final Map<Object, Boolean> TIMER_8 = Collections.synchronizedMap(
            new WeakHashMap<Object, Boolean>());
    // View object and time of each stream screen's first observation, and the time any player last
    // started: a different view later, or a player started since, means the screen came back from a player.
    private static final Map<Object, java.lang.ref.WeakReference<Object>> FIRST_VIEW =
            Collections.synchronizedMap(new WeakHashMap<Object, java.lang.ref.WeakReference<Object>>());
    private static final Map<Object, Long> FIRST_CALL = Collections.synchronizedMap(
            new WeakHashMap<Object, Long>());
    private static volatile long lastPlayerStartAt;
    // Episode the user long-pressed: its stream list stays on screen even with auto-pick on.
    private static volatile String forceListVideoId = "";

    private StreamAutoPick() {
    }

    /** Pure decision logic (no android classes), unit tested standalone. */
    static final class Gate {
        private Gate() {
        }

        /**
         * True when this stream screen is a replay after a player, not a fresh navigation: its view
         * object changed since the first observation, a player started after that observation, or
         * an external player returned for this same video moments ago (the activity can be recreated
         * on return, which makes a new fragment for the same episode).
         */
        static boolean returnedFromPlayer(boolean viewChanged, long firstCallAt, long lastPlayerStartAt,
                                          boolean recentExternalReturn) {
            if (viewChanged) return true;
            if (firstCallAt > 0L && lastPlayerStartAt >= firstCallAt) return true;
            return recentExternalReturn;
        }

        /** Auto-pick may navigate now: not forced to the list, not left/returned, wait elapsed. */
        static boolean shouldAutoPick(boolean returned, boolean alreadyPicked, boolean forceList,
                                      long elapsedMs, boolean anyCached) {
            if (returned || alreadyPicked || forceList) return false;
            if (elapsedMs < WAIT_MS) return false;
            return anyCached || elapsedMs >= WAIT_NOCACHE_MS;
        }

        /** As above; a complete list (every addon answered) may be picked after the short dwell. */
        static boolean shouldAutoPick(boolean returned, boolean alreadyPicked, boolean forceList,
                                      long elapsedMs, boolean anyCached, boolean listComplete) {
            if (returned || alreadyPicked || forceList) return false;
            if (listComplete && elapsedMs >= MIN_DWELL_MS) return true;
            return shouldAutoPick(returned, alreadyPicked, forceList, elapsedMs, anyCached);
        }
    }

    /** Called when any player starts a stream (ExternalProgress.maybeBinge): its stream screen is now behind it. */
    public static void notePlayerStart() {
        lastPlayerStartAt = System.currentTimeMillis();
    }

    /** True once this stream screen was left for a player and came back (or a player returned for it). */
    private static boolean returnedFromPlayer(Object fragment, String videoId) {
        try {
            java.lang.ref.WeakReference<Object> ref = FIRST_VIEW.get(fragment);
            Object view = call(fragment, "getView");
            boolean viewChanged = ref != null && view != null && ref.get() != view;
            Long firstCall = FIRST_CALL.get(fragment);
            return Gate.returnedFromPlayer(viewChanged, firstCall == null ? 0L : firstCall,
                    lastPlayerStartAt,
                    app.tikkamasalla.stremio.progress.ExternalProgress.returnedRecently(videoId));
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Remembers the fragment's first view and call time (once), before any early return. */
    private static void observe(Object fragment) {
        try {
            if (FIRST_CALL.containsKey(fragment)) return;
            FIRST_CALL.put(fragment, System.currentTimeMillis());
            Object view = call(fragment, "getView");
            if (view != null) FIRST_VIEW.put(fragment, new java.lang.ref.WeakReference<Object>(view));
        } catch (Throwable ignored) {
            // No view tracking; the other signals still apply.
        }
    }

    /**
     * Hook at the start of StreamsListFragment list observer. Takes the observer
     * lambda (p0) so no new registers are needed; fragment and state come from
     * its this$0 and L$0 fields.
     */
    public static void onStreams(Object lambda) {
        try {
            if (lambda == null) return;
            rememberAddons(field(lambda, "L$0"));
            if (!IntroSkipPrefs.isAutoPickEnabled(appContext())) return;
            if (IntroSkipPrefs.isShowListEnabled(appContext())) return;
            Object fragment = field(lambda, "this$0");
            Object state = field(lambda, "L$0");
            if (fragment == null || state == null) return;
            String videoId = str(call(state, "getVideoId"));
            if (videoId.length() == 0) return;
            String seen = FIRST_SEEN.get(fragment);
            if (seen != null && !seen.equals(videoId) && !seen.equals(videoId + "#picked")) {
                // The same screen now shows another episode: the old episode's first call / view must not
                // make it look like a return from a player. (seen == null is left alone: a forced list
                // never sets it, and resetting there would auto-pick on Back.)
                FIRST_SEEN.remove(fragment);
                FIRST_CALL.remove(fragment);
                FIRST_VIEW.remove(fragment);
            }
            observe(fragment);
            if (videoId.equals(forceListVideoId)) {
                FIRST_SEEN.put(fragment, videoId + "#picked");
                return;
            }
            if (!(videoId + "#picked").equals(FIRST_SEEN.get(fragment)) && !returnedFromPlayer(fragment, videoId)) {
                // Next episode prepared while the last one played: start it now, before any addon answers.
                String link = NextPrep.takeLink(appContext(), videoId);
                if (link.length() > 0 && navigateLink(fragment, link)) {
                    FIRST_SEEN.put(fragment, videoId + "#picked");
                    markAutoPlaying(fragment); // the stock binge auto-play must not open a second player
                    Log.i(TAG, "pick(prepared) " + videoId);
                    return;
                }
            }
            List<Object> streams = list(call(state, "getStreams"));
            if (streams == null || streams.isEmpty()) return;
            seen = FIRST_SEEN.get(fragment);
            if ((videoId + "#picked").equals(seen)) return;
            if (returnedFromPlayer(fragment, videoId)) {
                // Back from a player (however it was entered): never auto-pick this screen again.
                FIRST_SEEN.put(fragment, videoId + "#picked");
                Log.i(TAG, "skip " + videoId + " (returned from player)");
                PlaybackDiary.ev(appContext(), "pick.skip", "vid", videoId, "why", "returned from player");
                return;
            }
            long now = System.currentTimeMillis();
            Long firstAt = FIRST_AT.get(fragment);
            if (seen == null || !seen.equals(videoId)) {
                FIRST_SEEN.put(fragment, videoId);
                FIRST_AT.put(fragment, now);
                TIMER_4.put(fragment, false);
                TIMER_8.put(fragment, false);
                prefetchAliases(metaNameOf(state));
                schedule(fragment, videoId, WAIT_MS, 4);
                schedule(fragment, videoId, WAIT_NOCACHE_MS, 8);
                schedule(fragment, videoId, MIN_DWELL_MS, 1);
                return;
            }
            if (firstAt == null) firstAt = now;
            long elapsed = now - firstAt;
            List<StreamRanker.Stream> candidates = toRanker(streams, metaNameOf(state), addonNamesOf(state));
            if (candidates.isEmpty()) return;
            int[] req = StreamRanker.requestOf(videoId);
            List<StreamRanker.Ranked> ranked = StreamRanker.rank(candidates, isMovie(state), req[0], req[1],
                    absEpisodeOf(call(state, "getMeta"), req));
            if (ranked.isEmpty()) return;
            boolean anyCached = false;
            for (StreamRanker.Ranked r : ranked) {
                if (r.meta.cached) {
                    anyCached = true;
                    break;
                }
            }
            if (!Gate.shouldAutoPick(false, false, false, elapsed, anyCached, listComplete(state))) return;
            Object best = streamFor(streams, ranked.get(0).stream);
            if (best == null) return;
            FIRST_SEEN.put(fragment, videoId + "#picked");
            Log.i(TAG, "pick " + videoId + " -> " + ranked.get(0).stream);
            PlaybackDiary.ev(appContext(), "pick", "vid", videoId, "timer", 0, "n", ranked.size(), "why", ranked.get(0).reason);
            logTop(ranked);
            navigate(fragment, best);
        } catch (Throwable ignored) {
            // Full list stays on screen.
        }
    }

    /**
     * Hook at the start of the episode list's selection callback (holder is the leanback
     * Presenter.ViewHolder, item the VideoModel). Makes the selected tile long-pressable: a long
     * press opens that episode's stream list instead of auto-picking. Each new selection clears
     * the previous long-press. Fail soft.
     */
    public static void onEpisodeSelected(Object holder, Object item) {
        try {
            forceListVideoId = "";
            // A new selection is a genuine navigation: the just-returned episode may auto-pick again.
            app.tikkamasalla.stremio.progress.ExternalProgress.clearReturnGuard();
            if (holder == null || item == null) return;
            Object tile = field(holder, "view");
            if (!(tile instanceof android.view.View)) return;
            Object video = call(item, "getVideo");
            final String videoId = video == null ? "" : str(call(video, "getId"));
            if (videoId.length() == 0) return;
            ((android.view.View) tile).setOnLongClickListener(new android.view.View.OnLongClickListener() {
                @Override
                public boolean onLongClick(android.view.View view) {
                    try {
                        forceListVideoId = videoId;
                        Log.i(TAG, "long-press: stream list for " + videoId);
                        return view.performClick();
                    } catch (Throwable ignored) {
                        return false;
                    }
                }
            });
        } catch (Throwable ignored) {
            // Long-press stays off; a normal press still works.
        }
    }

    private static void schedule(final Object fragment, final String videoId,
                                 long delayMs, final int timer) {
        try {
            if (timer != 1) {
                Map<Object, Boolean> map = timer == 4 ? TIMER_4 : TIMER_8;
                if (Boolean.TRUE.equals(map.get(fragment))) return;
                map.put(fragment, true);
            }
            MAIN.postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (!isActive(fragment)) return;
                        if (!IntroSkipPrefs.isAutoPickEnabled(appContext())) return;
                        if (IntroSkipPrefs.isShowListEnabled(appContext())) return;
                        if (videoId.equals(forceListVideoId)) return;
                        String seen = FIRST_SEEN.get(fragment);
                        if (seen == null || !seen.equals(videoId)) return;
                        if (returnedFromPlayer(fragment, videoId)) {
                            FIRST_SEEN.put(fragment, videoId + "#picked");
                            Log.i(TAG, "skip(timer" + timer + ") " + videoId + " (returned from player)");
                            return;
                        }
                        Object state = currentState(fragment);
                        List<Object> streams = state == null ? null : list(call(state, "getStreams"));
                        if (timer == 1 && (streams == null || streams.isEmpty() || !listComplete(state))) {
                            // Poll until every addon has answered, within the long wait.
                            Long first = FIRST_AT.get(fragment);
                            if (first != null && System.currentTimeMillis() - first < WAIT_NOCACHE_MS) {
                                MAIN.postDelayed(this, POLL_MS);
                            }
                            return;
                        }
                        if (streams == null || streams.isEmpty()) return;
                        List<StreamRanker.Stream> candidates =
                                toRanker(streams, metaNameOf(state), addonNamesOf(state));
                        if (candidates.isEmpty()) return;
                        String vid = currentVideoId(fragment);
                        int[] req = StreamRanker.requestOf(vid);
                        List<StreamRanker.Ranked> ranked = StreamRanker.rank(candidates, isMovieId(vid),
                                req[0], req[1], absEpisodeOf(call(state, "getMeta"), req));
                        if (ranked.isEmpty()) return;
                        if (timer == 4) {
                            boolean anyCached = false;
                            for (StreamRanker.Ranked r : ranked) {
                                if (r.meta.cached) {
                                    anyCached = true;
                                    break;
                                }
                            }
                            if (!anyCached) return;
                        }
                        Object best = streamFor(streams, ranked.get(0).stream);
                        if (best == null) return;
                        FIRST_SEEN.put(fragment, videoId + "#picked");
                        Log.i(TAG, "pick(timer" + timer + ") " + videoId + " -> " + ranked.get(0).stream);
                        PlaybackDiary.ev(appContext(), "pick", "vid", videoId, "timer", timer, "n", ranked.size(), "why", ranked.get(0).reason);
                        logTop(ranked);
                        navigate(fragment, best);
                    } catch (Throwable ignored) {
                        // Full list stays on screen.
                    }
                }
            }, delayMs);
        } catch (Throwable ignored) {
            // No timer; later observer calls still pick.
        }
    }

    private static void logTop(List<StreamRanker.Ranked> ranked) {
        try {
            for (int i = 0; i < ranked.size() && i < 5; i++) {
                StreamRanker.Ranked r = ranked.get(i);
                Log.i(TAG, "rank " + (i + 1) + ": " + r.stream + " | " + r.reason);
            }
        } catch (Throwable ignored) {
            // Logging only.
        }
    }

    private static android.content.Context appContext() {
        try {
            Class<?> thread = Class.forName("android.app.ActivityThread");
            Method current = thread.getMethod("currentApplication");
            return (android.app.Application) current.invoke(null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object field(Object holder, String name) {
        try {
            Field field = null;
            for (Class<?> c = holder.getClass(); c != null; c = c.getSuperclass()) {
                try {
                    field = c.getDeclaredField(name);
                    break;
                } catch (NoSuchFieldException ignored) {
                    // Superclass next.
                }
            }
            if (field == null) return null;
            field.setAccessible(true);
            return field.get(holder);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object call(Object target, String method) {
        try {
            return target.getClass().getMethod(method).invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String str(Object value) {
        return value == null ? "" : String.valueOf(value);
    }

    @SuppressWarnings("unchecked")
    private static List<Object> list(Object value) {
        if (value instanceof List) return (List<Object>) value;
        return null;
    }

    private static boolean isMovie(Object state) {
        try {
            return isMovieId(str(call(state, "getVideoId")));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isMovieId(String videoId) {
        if (videoId == null || videoId.length() == 0) return false;
        return !videoId.contains(":");
    }

    /** The fragment's current MetaDetailsState (what the observer lambda carries as L$0); null when unavailable. */
    private static Object currentState(Object fragment) {
        try {
            Object viewModel = null;
            try {
                viewModel = fragment.getClass().getMethod("getViewModel").invoke(fragment);
            } catch (Throwable ignored) {
                Object delegate = field(fragment, "viewModel$delegate");
                if (delegate != null) {
                    viewModel = delegate.getClass().getMethod("getValue").invoke(delegate);
                }
            }
            if (viewModel == null) return null;
            Object flow = viewModel.getClass().getMethod("getState").invoke(viewModel);
            return flow.getClass().getMethod("getValue").invoke(flow);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * True when the classic stream screen has no "still loading" label, so every addon answered. Its label is
     * null once all have; false when the state has no such getter (the timed waits then apply).
     */
    private static boolean listComplete(Object state) {
        try {
            Object label = state.getClass().getMethod("getStreamsLabel").invoke(state);
            return label == null || String.valueOf(label).length() == 0;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static String streamKey(String name, String description) {
        return name + "\n" + description;
    }

    /** Stream (name + description) to the title of the addon that returned it, from the classic state's per-addon lists. */
    private static Map<String, String> addonNamesOf(Object state) {
        Map<String, String> out = new java.util.HashMap<String, String>();
        try {
            List<Object> groups = list(call(state, "getAddonStreams"));
            if (groups == null) return out;
            for (Object group : groups) {
                String title = str(call(call(group, "getAddon"), "getTitle"));
                List<Object> streams = list(call(group, "getStreams"));
                if (title.length() == 0 || streams == null) continue;
                for (Object s : streams) {
                    if (s == null) continue;
                    String key = streamKey(str(call(s, "getName")), descriptionOf(s));
                    if (!out.containsKey(key)) out.put(key, title);
                }
            }
        } catch (Throwable ignored) {
            // No addon names; the stream names alone decide.
        }
        return out;
    }

    /** Episodes per season (season 1 and up): the highest episode number in the meta's videos (seriesInfo.season/episode). */
    private static Map<Integer, Integer> seasonCountsOf(Object videos) {
        Map<Integer, Integer> out = new java.util.HashMap<Integer, Integer>();
        try {
            List<Object> all = list(videos);
            if (all == null) return out;
            for (Object video : all) {
                Object info = call(video, "getSeriesInfo");
                Object season = call(info, "getSeason");
                Object episode = call(info, "getEpisode");
                if (!(season instanceof Number) || !(episode instanceof Number)) continue;
                int s = ((Number) season).intValue();
                int e = ((Number) episode).intValue();
                if (s < 1 || e < 1) continue;
                Integer n = out.get(s);
                if (n == null || e > n) out.put(s, e); // highest number, so a gap in the meta does not shift the total
            }
        } catch (Throwable ignored) {
            // Absolute numbering stays unknown.
        }
        return out;
    }

    /** Absolute episode number of the request {season, episode} from the meta's videos; 0 when unknown or season 1. */
    private static int absEpisodeOf(Object meta, int[] req) {
        try {
            if (meta == null || req[0] < 2) return 0;
            return StreamRanker.absoluteEpisode(req[0], req[1], seasonCountsOf(call(meta, "getVideos")));
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static String metaNameOf(Object state) {
        try {
            Object meta = call(state, "getMeta");
            return meta == null ? "" : str(call(meta, "getName"));
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static final Map<String, List<String>> ALIAS_CACHE =
            new java.util.concurrent.ConcurrentHashMap<String, List<String>>();
    private static final java.util.Set<String> ALIAS_INFLIGHT =
             java.util.Collections.synchronizedSet(new java.util.HashSet<String>());

    private static final String[][] STATIC_ALIASES = new String[][] {
        {"attack on titan", "shingeki no kyojin"},
        {"demon slayer", "kimetsu no yaiba"},
        {"my hero academia", "boku no hero academia"},
        {"frieren beyond journeys end", "sousou no frieren"},
        {"fullmetal alchemist", "hagane no renkinjutsushi"},
        {"hunter x hunter", "hxh"},
        {"one punch man", "wanpanman"},
        {"mob psycho 100", "mob psycho hyaku"},
        {"apothecary diaries", "kusuriya no hitorigoto"},
        {"solo leveling", "ore dake level up na ken"},
        {"delicious in dungeon", "dungeon meshi"},
        {"parasyte", "kiseijuu"},
        {"erased", "boku dake ga inai machi"},
        {"promised neverland", "yakusoku no neverland"},
        {"rascal does not dream", "seishun buta yarou"},
        {"assassination classroom", "ansatsu kyoushitsu"},
        {"food wars", "shokugeki no souma"},
        {"seven deadly sins", "nanatsu no taizai"},
        {"fire force", "enen no shouboutai"},
        {"hells paradise", "jigokuraku"},
        {"kaiju no 8", "kaijuu 8 gou"},
        {"neon genesis evangelion", "shin seiki evangelion"},
        {"konosuba", "kono subarashii sekai ni shukufuku wo"},
        {"reincarnated as a slime", "tensei shitara slime datta ken"},
        {"dan da dan", "dandadan"}
    };

    private static String normKey(String s) {
        if (s == null) return "";
        return StreamRanker.normalizeTitle(
                s.replaceAll("\\s*[(\\[]\\s*(?:19|20)\\d{2}[^)\\]]*[)\\]]\\s*$", ""));
    }

    private static List<String> aliasesFor(String metaName) {
        String key = normKey(metaName);
        List<String> list = new ArrayList<String>();
        if (key.length() == 0) return list;
        list.add(key);
        for (int i = 0; i < STATIC_ALIASES.length; i++) {
            String a = STATIC_ALIASES[i][0];
            String b = STATIC_ALIASES[i][1];
            if (key.contains(a) || a.contains(key)) list.add(b);
            if (key.contains(b) || b.contains(key)) list.add(a);
        }
        List<String> dynamic = ALIAS_CACHE.get(key);
        if (dynamic != null) {
            for (String d : dynamic) {
                if (!list.contains(d)) list.add(d);
            }
        }
        return list;
    }

    /**
     * Queries AniList for the canonical romaji + english titles (not localized synonyms, so
     * Italian/French/German dub titles stay filtered out) during the 4 s auto-pick wait window.
     */
    private static void prefetchAliases(final String metaName) {
        final String key = normKey(metaName);
        if (key.length() < 2 || ALIAS_CACHE.containsKey(key) || !ALIAS_INFLIGHT.add(key)) return;
        new Thread(new Runnable() {
            @Override
            public void run() {
                java.net.HttpURLConnection conn = null;
                try {
                    String clean = metaName.replaceAll("\\s*[(\\[]\\s*(?:19|20)\\d{2}[^)\\]]*[)\\]]\\s*$", "").trim();
                    org.json.JSONObject body = new org.json.JSONObject()
                            .put("query", "query ($s: String) { Page(perPage: 5) { media(search: $s, type: ANIME) { title { romaji english } } } }")
                            .put("variables", new org.json.JSONObject().put("s", clean));
                    conn = (java.net.HttpURLConnection) new java.net.URL("https://graphql.anilist.co").openConnection();
                    conn.setRequestMethod("POST");
                    conn.setConnectTimeout(2500);
                    conn.setReadTimeout(2500);
                    conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
                    conn.setRequestProperty("Accept", "application/json");
                    conn.setDoOutput(true);
                    byte[] payload = body.toString().getBytes("UTF-8");
                    java.io.OutputStream os = conn.getOutputStream();
                    os.write(payload);
                    os.close();
                    if (conn.getResponseCode() != 200) return;
                    java.io.BufferedReader br = new java.io.BufferedReader(
                            new java.io.InputStreamReader(conn.getInputStream(), "UTF-8"));
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) sb.append(line);
                    br.close();
                    org.json.JSONArray media = new org.json.JSONObject(sb.toString())
                            .optJSONObject("data").optJSONObject("Page").optJSONArray("media");
                    if (media == null) return;
                    List<String> found = new ArrayList<String>();
                    for (int i = 0; i < media.length(); i++) {
                        org.json.JSONObject t = media.optJSONObject(i) == null ? null
                                : media.optJSONObject(i).optJSONObject("title");
                        if (t == null) continue;
                        String eng = normKey(t.optString("english", ""));
                        String rom = normKey(t.optString("romaji", ""));
                        if (eng.equals(key) || rom.equals(key)
                                || (eng.length() > 3 && eng.startsWith(key))
                                || (rom.length() > 3 && rom.startsWith(key))) {
                            if (rom.length() > 0 && !found.contains(rom)) found.add(rom);
                            if (eng.length() > 0 && !found.contains(eng)) found.add(eng);
                        }
                    }
                    ALIAS_CACHE.put(key, found);
                    if (!found.isEmpty()) {
                        Log.i(TAG, "aliases for '" + metaName + "': " + found);
                    }
                } catch (Throwable ignored) {
                } finally {
                    ALIAS_INFLIGHT.remove(key);
                    if (conn != null) {
                        try { conn.disconnect(); } catch (Throwable ignored) {}
                    }
                }
            }
        }, "AutoPickAlias").start();
    }

    /**
     * Addons sometimes return streams of other titles (a search for a short name). A stream is
     * eligible when it matches the title or its canonical Romaji/English alias; foreign dub
     * titles ("L'attacco Dei Giganti") are still rejected.
     */
    static boolean matchesMeta(String streamText, String metaName) {
        return StreamRanker.titleMatches(streamText, aliasesFor(metaName), StreamRanker.mainTitles(metaName));
    }

    private static String currentVideoId(Object fragment) {
        try {
            Object viewModel = null;
            try {
                viewModel = fragment.getClass().getMethod("getViewModel").invoke(fragment);
            } catch (Throwable ignored) {
                Object delegate = field(fragment, "viewModel$delegate");
                if (delegate != null) {
                    viewModel = delegate.getClass().getMethod("getValue").invoke(delegate);
                }
            }
            if (viewModel == null) return "";
            Object flow = viewModel.getClass().getMethod("getState").invoke(viewModel);
            Object state = flow.getClass().getMethod("getValue").invoke(flow);
            if (state == null) return "";
            return str(call(state, "getVideoId"));
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static List<StreamRanker.Stream> toRanker(List<Object> streams, String metaName,
                                                      Map<String, String> addonNames) {
        List<StreamRanker.Stream> out = new ArrayList<StreamRanker.Stream>();
        for (Object s : streams) {
            if (s == null) continue;
            if (!isPlayable(s)) continue;
            try {
                String name = str(call(s, "getName"));
                String title = descriptionOf(s);
                String url = "";
                try {
                    Object u = call(s, "getUrl");
                    if (u != null) {
                        try {
                            url = str(u.getClass().getMethod("getUrl").invoke(u));
                        } catch (Throwable ignored) {
                            url = str(u);
                        }
                    }
                    // Do not copy torrent infoHash into url: a non-empty url signals a direct
                    // HTTP/debrid stream in StreamRanker.parse(), whereas getTorrent()-only is P2P.
                } catch (Throwable ignored) {
                    url = "";
                }
                if (!matchesMeta(name + " " + title, metaName)) {
                    Log.i(TAG, "drop(meta mismatch vs '" + metaName + "'): ["
                            + name.replace("\n", " | ") + "] " + title.split("\\r?\\n", 2)[0]);
                    continue;
                }
                String addon = addonNames == null ? null : addonNames.get(streamKey(name, title));
                out.add(new StreamRanker.Stream(name, title, url, addon == null ? "" : addon, fileNameOf(s)));
            } catch (Throwable ignored) {
                // Skip unusable entries.
            }
        }
        return out;
    }

    /** Only streams the player can open directly: a URL or a torrent. Web links, YouTube and frames open other apps. */
    private static boolean isPlayable(Object stream) {
        try {
            if (call(stream, "getExternalUrl") != null || call(stream, "getYouTube") != null) {
                return false;
            }
            String name = str(call(stream, "getName"));
            if (name.contains("⚠")) {
                return false; // addon warning/promo card
            }
            return call(stream, "getUrl") != null || call(stream, "getTorrent") != null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isActive(Object fragment) {
        try {
            return fragment != null
                    && Boolean.TRUE.equals(call(fragment, "isAdded"))
                    && Boolean.TRUE.equals(call(fragment, "isResumed"));
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** The file the addon selected inside a pack (behaviorHints.filename); "" when absent. */
    private static String fileNameOf(Object stream) {
        return str(call(call(stream, "getBehaviorHints"), "getFilename"));
    }

    private static String descriptionOf(Object stream) {
        String desc = str(call(stream, "getDescription"));
        if (desc.length() == 0) desc = str(call(stream, "getTitle"));
        return desc;
    }

    static Object streamFor(List<Object> streams, StreamRanker.Stream best) {
        if (best == null) return null;
        for (Object s : streams) {
            try {
                String name = str(call(s, "getName"));
                String title = descriptionOf(s);
                if (name.equals(best.name) && title.equals(best.title)) return s;
            } catch (Throwable ignored) {
                // Continue.
            }
        }
        return null;
    }

    private static void navigate(Object fragment, Object stream) {
        try {
            Method navigate = null;
            try {
                navigate = fragment.getClass().getDeclaredMethod("navigateToStream", stream.getClass());
            } catch (Throwable ignored) {
                for (Method m : fragment.getClass().getDeclaredMethods()) {
                    if ("navigateToStream".equals(m.getName()) && m.getParameterTypes().length == 1) {
                        navigate = m;
                        break;
                    }
                }
            }
            if (navigate == null) return;
            navigate.setAccessible(true);
            navigate.invoke(fragment, stream);
        } catch (Throwable ignored) {
            // User picks manually from the list.
        }
    }

    /** Classic streams page: the addons that answered (title, transport URL) per show, for {@link NextPrep}. */
    private static void rememberAddons(Object state) {
        try {
            List<Object> groups = state == null ? null : list(call(state, "getAddonStreams"));
            if (groups == null || groups.isEmpty()) return;
            List<String[]> out = new ArrayList<String[]>();
            for (Object group : groups) {
                Object addon = call(group, "getAddon");
                out.add(new String[]{str(call(addon, "getTitle")), str(call(addon, "getTransportUrl"))});
            }
            NextPrep.rememberAddons(str(call(state, "getId")), out, "");
        } catch (Throwable ignored) {
            // No addon memory; the player's own addon is still asked.
        }
    }

    /** Sets StreamsListFragment.isAutoPlayingStream, the flag its own auto-play collector checks before navigating. */
    private static void markAutoPlaying(Object fragment) {
        try {
            Field f = fragment.getClass().getDeclaredField("isAutoPlayingStream");
            f.setAccessible(true);
            f.setBoolean(fragment, true);
        } catch (Throwable ignored) {
            // Field absent: the stock auto-play only runs with Stremio's own binge setting.
        }
    }

    /** Starts a player deep link the way the stock stream click does (the fragment's NavController). */
    private static boolean navigateLink(Object fragment, String link) {
        android.net.Uri uri = android.net.Uri.parse(link);
        try {
            ClassLoader cl = fragment.getClass().getClassLoader();
            Class<?> host = Class.forName("androidx.navigation.fragment.NavHostFragment", false, cl);
            Class<?> fragmentClass = Class.forName("androidx.fragment.app.Fragment", false, cl);
            Object controller = host.getMethod("findNavController", fragmentClass).invoke(null, fragment);
            controller.getClass().getMethod("navigate", android.net.Uri.class).invoke(controller, uri);
            Log.i(TAG, "launch via fragment nav controller");
            return true;
        } catch (Throwable ignored) {
            // Shape lookup below.
        }
        try {
            Object activity = call(fragment, "getActivity");
            return activity instanceof android.app.Activity
                    && RealEnv.viaNavController((android.app.Activity) activity, uri);
        } catch (Throwable ignored) {
            return false;
        }
    }

    // ---- Compose builds (TV 1.12.x, phone 2.x) ---------------------------------------------------
    // No stream-list fragment there: Core.dispatch says when a streams page opens (ActionLoad.MetaDetails with
    // a stream path), the decoded MetaDetails model carries the streams, and the pick starts the player
    // through the stream's own deep link. Fail soft: any problem leaves the stream list on screen.

    /** What the Compose path needs from the device; replaced by the unit tests. */
    interface PortEnv {
        long now();

        boolean autoPickOn();

        boolean showListOn();

        boolean windowFocused();

        boolean externalReturned(String videoId);

        /** Starts the player deep link; true when handed to the app. */
        boolean open(String link);
    }

    static PortEnv portEnv = new RealEnv();
    private static final Object PORT_LOCK = new Object();
    private static volatile boolean portArmed;
    static volatile int portGen;
    // portId: streams page video id; portDoneId: ended (picked/cancelled) until the page is left;
    // portPickedId: a player started for it.
    private static volatile String portId = "", portDoneId = "", portPickedId = "";
    private static volatile long portArmedAt, portEvalAt, portLongOkAt, portNextAt, portPlayerEndAt;
    private static volatile String portNextId = "", portPlayerId = "", portAliasFor = "";
    private static volatile boolean portPlayerLoaded;
    private static volatile PortSnapshot portLast;
    private static volatile java.lang.ref.WeakReference<android.app.Activity> portActivity;

    /** MainActivity.onCreate (TV and phone), index 0: the window for the key watcher and the launch. */
    public static void onMainActivity(Object activity) {
        if (activity instanceof android.app.Activity) {
            portActivity = new java.lang.ref.WeakReference<android.app.Activity>((android.app.Activity) activity);
        }
    }

    /** PortHooks.playNext: the next episode's streams page is about to open; it may be picked right away. */
    public static void noteNextEpisode(String videoId) {
        portNextId = videoId == null ? "" : videoId;
        portNextAt = portEnv.now();
    }

    /** Core.dispatch(Action, Field), index 0. */
    public static void onCoreDispatch(Object action, Object field) {
        try {
            if (action == null) return;
            Object load = call(action, "getLoad");
            if (load != null) {
                Object details = call(load, "getMetaDetails");
                Object player = details == null ? call(load, "getPlayer") : null;
                if (details != null) portOnStreamsPage(details);
                else if (player != null) portOnPlayerLoad(player);
            } else if (call(action, "getUnload") != null) {
                String name = field == null ? "" : field.getClass().getName();
                if (name.endsWith("$PLAYER")) {
                    portPlayerLoaded = false;
                    portPlayerEndAt = portEnv.now();
                } else if (name.endsWith("$META_DETAILS")) {
                    portLeftDetails();
                }
            }
        } catch (Throwable ignored) {
            // Observer only.
        }
    }

    /** Meta_detailsKt.decodeWithImpl(MetaDetails.Companion, decoder), before each return: the decoded model. */
    public static void onMetaDetails(Object model) {
        try {
            portRememberAddons(model);
            if (!portArmed) return;
            PortSnapshot snap = portSnapshot(model);
            if (snap == null || !snap.streamId.equals(portId)) return;
            portLast = snap;
            if (snap.metaName.length() > 0 && !snap.metaName.equals(portAliasFor)) {
                portAliasFor = snap.metaName;
                prefetchAliases(snap.metaName);
            }
            long now = portEnv.now();
            if (snap.total > 0 && snap.loading == 0) {
                // Every addon answered: evaluate once the short dwell is over instead of waiting for the timers.
                if (now - portEvalAt >= 300L) {
                    portEvalAt = now;
                    postEvaluate(portGen, Math.max(0L, MIN_DWELL_MS - (now - portArmedAt)));
                }
            } else if (now - portArmedAt >= WAIT_NOCACHE_MS && now - portEvalAt >= 1500L) {
                portEvalAt = now;
                postEvaluate(portGen, 0L);
            }
        } catch (Throwable ignored) {
            // Observer only.
        }
    }

    private static volatile long portAddonsAt;

    /** Compose streams page: the addons that answered with streams (title, transport URL) and the meta addon. */
    private static void portRememberAddons(Object model) {
        try {
            long now = System.currentTimeMillis();
            if (now - portAddonsAt < 1000L) return;
            Object selected = model == null ? null : call(model, "getSelected");
            Object streamPath = selected == null ? null : call(selected, "getStreamPath");
            if (streamPath == null) return;
            // (throttle stamped below, once an addon has answered)
            List<String[]> out = new ArrayList<String[]>();
            List<Object> loadables = list(call(model, "getStreams"));
            for (Object loadable : loadables == null ? new ArrayList<Object>() : loadables) {
                Object ready = loadable == null ? null : call(loadable, "getReady");
                List<Object> streams = ready == null ? null : list(call(ready, "getStreams"));
                if (streams == null || streams.isEmpty()) continue;
                out.add(new String[]{str(call(loadable, "getTitle")), str(call(call(loadable, "getRequest"), "getBase"))});
            }
            // Stamp the throttle only once an addon has answered: the first emission is
            // still loading (empty), and cached addons often answer inside that second.
            if (!out.isEmpty()) portAddonsAt = now;
            String meta = str(call(call(call(model, "getMetaItem"), "getRequest"), "getBase"));
            NextPrep.rememberAddons(NextPrepCore.metaIdOf(str(call(streamPath, "getId"))), out, meta);
        } catch (Throwable ignored) {
            // No addon memory; the player's own addon is still asked.
        }
    }

    private static void postEvaluate(final int gen, long delayMs) {
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                portEvaluate(gen);
            }
        }, delayMs);
    }

    /** A key went down on the window (ACTION_DOWN only). A held OK key marks the next page as "show the list". */
    static void portKey(int keyCode, int repeat, boolean longPress, long eventTime) {
        if ((keyCode == android.view.KeyEvent.KEYCODE_DPAD_CENTER || keyCode == android.view.KeyEvent.KEYCODE_ENTER
                || keyCode == android.view.KeyEvent.KEYCODE_NUMPAD_ENTER) && (longPress || repeat > 0)) {
            portLongOkAt = eventTime;
        }
        if (portArmed && PortGate.interactionCancels(keyCode, eventTime, portArmedAt)) {
            portCancel(keyCode == android.view.KeyEvent.KEYCODE_BACK || keyCode == android.view.KeyEvent.KEYCODE_ESCAPE
                    ? "back" : "key " + keyCode);
        }
    }

    /** A finger went down on the window. */
    static void portTouch(long eventTime) {
        if (portArmed && PortGate.interactionCancels(0, eventTime, portArmedAt)) portCancel("touch");
    }

    /** Forgets all Compose-path state (tests). */
    static void portReset() {
        synchronized (PORT_LOCK) {
            portArmed = false;
            portGen++;
            portId = portDoneId = portPickedId = portNextId = portPlayerId = portAliasFor = "";
            portArmedAt = portEvalAt = portLongOkAt = portNextAt = portPlayerEndAt = 0L;
            portPlayerLoaded = false;
            portLast = null;
        }
    }

    static boolean portIsArmed() {
        return portArmed;
    }

    private static void portCancel(String why) {
        synchronized (PORT_LOCK) {
            if (!portArmed) return;
            portArmed = false;
            portGen++;
            portDoneId = portId;
            Log.i(TAG, "cancel " + portId + " (" + why + ")");
        }
    }

    private static void portLeftDetails() {
        synchronized (PORT_LOCK) {
            portCancel("left details");
            portId = portDoneId = "";
            // While a player is loaded the page is behind it: keep what says "this video was just played".
            if (!portPlayerLoaded) portPlayerId = portPickedId = "";
        }
    }

    private static void portOnPlayerLoad(Object selected) {
        Object request = call(selected, "getStreamRequest");
        Object path = request == null ? null : call(request, "getPath");
        String id = path == null ? "" : str(call(path, "getId"));
        synchronized (PORT_LOCK) {
            portPlayerLoaded = true;
            portPlayerId = id;
            if (id.length() > 0 && id.equals(portId)) portPickedId = id;
            portCancel("player started");
        }
    }

    /** ActionLoad.MetaDetails: a streams page opened (stream path set) or closed (no stream path). */
    private static void portOnStreamsPage(Object selected) {
        Object path = call(selected, "getStreamPath");
        String id = path == null ? "" : str(call(path, "getId"));
        if (id.length() == 0) {
            portLeftDetails();
            return;
        }
        synchronized (PORT_LOCK) {
            if (id.equals(portId) && (portArmed || id.equals(portDoneId))) return;
            portCancel("new page");
            long now = portEnv.now();
            portId = id;
            boolean next = id.equals(portNextId) && now - portNextAt < 20000L;
            boolean returned = PortGate.returnedFromPlayer(id, portPlayerId, portPlayerLoaded,
                    portPlayerEndAt == 0L ? -1L : now - portPlayerEndAt, portEnv.externalReturned(id), next)
                    || (!next && id.equals(portPickedId));
            boolean forced = PortGate.isForcedList(now, portLongOkAt);
            boolean on = portEnv.autoPickOn();
            boolean show = portEnv.showListOn();
            if (forced) portLongOkAt = 0L;
            // No `next` requirement here: takeLink itself only fires for the episode a Next
            // expected (pill, end of file, external binge), exactly as on Classic.
            if (PortGate.shouldArm(on, show, forced, returned)) {
                // Next episode prepared while the last one played: start it now, before any addon answers.
                final String link = NextPrep.takeLink(appContext(), id);
                if (link.length() > 0) {
                    portDoneId = id;
                    portPickedId = id;
                    Log.i(TAG, "pick(prepared) " + id);
                    final String fid = id;
                    final Object page = selected;
                    PhoneOverlay.afterOutgoingGone(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                boolean opened = false;
                                try {
                                    opened = portEnv.open(link);
                                } catch (Throwable ignored) {
                                    // Falls through to arming below.
                                }
                                if (opened) {
                                    Log.i(TAG, "open prepared");
                                    return;
                                }
                                // As on Classic (a failed navigation falls through): arm normal
                                // auto-pick again, unless the page or the player moved on.
                                boolean again;
                                synchronized (PORT_LOCK) {
                                    again = fid.equals(portId) && fid.equals(portDoneId)
                                            && !(portPlayerLoaded && fid.equals(portPlayerId));
                                    if (again) {
                                        portDoneId = "";
                                        portPickedId = "";
                                    }
                                }
                                Log.i(TAG, "open prepared failed" + (again ? ": arming auto-pick" : ": stream list stays"));
                                if (again) portOnStreamsPage(page);
                            } catch (Throwable ignored) {
                                // Stream list stays.
                            }
                        }
                    });
                    return;
                }
            }
            if (!PortGate.shouldArm(on, show, forced, returned)) {
                if (on && !show) Log.i(TAG, "skip " + id + (returned ? " (returned from player)" : " (long-press: stream list)"));
                return;
            }
            portArmed = true;
            portArmedAt = now;
            portLast = null;
            portAliasFor = "";
            int gen = ++portGen;
            Log.i(TAG, "arm " + id + (next ? " (next episode)" : ""));
            postEvaluate(gen, WAIT_MS + 50L);
            postEvaluate(gen, WAIT_NOCACHE_MS + 50L);
            final android.app.Activity watched = portActivity == null ? null : portActivity.get();
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    PortWatch.install(watched);
                }
            });
        }
    }

    /** Ranks the latest streams and starts the best one when the wait rules allow it. Main thread. */
    static void portEvaluate(int gen) {
        String link;
        synchronized (PORT_LOCK) {
            try {
                if (!portArmed || gen != portGen) return;
                String id = portId;
                long elapsed = portEnv.now() - portArmedAt;
                if (!portEnv.autoPickOn() || portEnv.showListOn()) {
                    portCancel("setting changed");
                    return;
                }
                if (elapsed > PortGate.PENDING_MAX_MS) {
                    portCancel("expired");
                    return;
                }
                PortSnapshot snap = portLast;
                if (snap == null || snap.streams.isEmpty()) return;
                List<StreamRanker.Stream> candidates = portCandidates(snap.streams, snap.metaName, snap.addonNames);
                if (candidates.isEmpty()) return;
                int[] req = StreamRanker.requestOf(id);
                List<StreamRanker.Ranked> ranked = StreamRanker.rank(candidates, isMovieId(id), req[0], req[1],
                        req[0] < 2 ? 0 : StreamRanker.absoluteEpisode(req[0], req[1], seasonCountsOf(snap.videos)));
                if (ranked.isEmpty()) return;
                boolean anyCached = false;
                for (StreamRanker.Ranked r : ranked) anyCached |= r.meta.cached;
                boolean complete = snap.total > 0 && snap.loading == 0;
                if (!PortGate.shouldPickNow(true, false, false, portEnv.windowFocused(), elapsed, anyCached, complete)) return;
                Object best = streamFor(snap.streams, ranked.get(0).stream);
                link = best == null ? "" : portPlayerLink(best);
                portArmed = false;
                portGen++;
                portDoneId = id;
                if (link.length() == 0) {
                    Log.i(TAG, "no player link for " + id + ": stream list stays");
                    return;
                }
                portPickedId = id;
                Log.i(TAG, "pick " + id + " -> " + ranked.get(0).stream);
                PlaybackDiary.ev("pick", "vid", id, "port", true, "n", ranked.size(), "why", ranked.get(0).reason);
                logTop(ranked);
            } catch (Throwable ignored) {
                return;
            }
        }
        try {
            Log.i(TAG, portEnv.open(link) ? "open " + link : "open failed: stream list stays");
        } catch (Throwable ignored) {
            // Stream list stays.
        }
    }

    /** One streams page of the MetaDetails model: ready streams of all addons plus load progress. */
    static final class PortSnapshot {
        final String streamId, streamType, metaName, metaType;
        final List<Object> streams;
        final int total, loading;
        /** Addon title of each entry of streams (same index; "" when unknown) and the meta's videos (season counts). */
        final List<String> addonNames;
        final Object videos;

        PortSnapshot(String streamId, String streamType, String metaName, String metaType, List<Object> streams,
                     int total, int loading) {
            this(streamId, streamType, metaName, metaType, streams, total, loading, null, null);
        }

        PortSnapshot(String streamId, String streamType, String metaName, String metaType, List<Object> streams,
                     int total, int loading, List<String> addonNames, Object videos) {
            this.addonNames = addonNames;
            this.videos = videos;
            this.streamId = streamId;
            this.streamType = streamType;
            this.metaName = metaName;
            this.metaType = metaType;
            this.streams = streams;
            this.total = total;
            this.loading = loading;
        }
    }

    /** The model's open streams page; null when no stream path is selected. */
    static PortSnapshot portSnapshot(Object model) {
        try {
            Object selected = model == null ? null : call(model, "getSelected");
            Object streamPath = selected == null ? null : call(selected, "getStreamPath");
            if (streamPath == null) return null;
            Object metaItem = call(model, "getMetaItem");
            Object meta = metaItem == null ? null : call(metaItem, "getReady");
            List<Object> all = new ArrayList<Object>();
            List<String> addons = new ArrayList<String>();
            int total = 0, loading = 0;
            List<Object> loadables = list(call(model, "getStreams"));
            for (Object loadable : loadables == null ? new ArrayList<Object>() : loadables) {
                if (loadable == null) continue;
                total++;
                if (call(loadable, "getLoading") != null) loading++;
                Object ready = call(loadable, "getReady");
                List<Object> streams = ready == null ? null : list(call(ready, "getStreams"));
                if (streams == null) continue;
                String addon = str(call(loadable, "getTitle"));
                for (Object s : streams) {
                    if (s == null) continue;
                    all.add(s);
                    addons.add(addon);
                }
            }
            return new PortSnapshot(str(call(streamPath, "getId")), str(call(streamPath, "getType")),
                    meta == null ? "" : str(call(meta, "getName")), meta == null ? "" : str(call(meta, "getType")),
                    all, total, loading, addons, meta == null ? null : call(meta, "getVideos"));
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** A plain URL stream: no browser link, YouTube, web frame or addon warning card. */
    static boolean isPlayablePort(Object stream) {
        try {
            if (stream == null || call(stream, "getUrl") == null) return false;
            if (call(stream, "getExternal") != null || call(stream, "getYouTube") != null
                    || call(stream, "getPlayerFrame") != null) {
                return false;
            }
            String desc = str(call(stream, "getDescription"));
            return !str(call(stream, "getName")).contains("⚠") && !desc.contains("⚠") && !desc.contains("⛔");
        } catch (Throwable ignored) {
            return false;
        }
    }

    static List<StreamRanker.Stream> portCandidates(List<Object> streams, String metaName) {
        return portCandidates(streams, metaName, null);
    }

    /** addonNames: addon title per entry of streams (same index), or null. */
    static List<StreamRanker.Stream> portCandidates(List<Object> streams, String metaName, List<String> addonNames) {
        List<StreamRanker.Stream> out = new ArrayList<StreamRanker.Stream>();
        List<Object> source = streams == null ? new ArrayList<Object>() : streams;
        for (int i = 0; i < source.size(); i++) {
            Object s = source.get(i);
            if (s == null || !isPlayablePort(s)) continue;
            try {
                String name = str(call(s, "getName"));
                String title = descriptionOf(s);
                if (!matchesMeta(name + " " + title, metaName)) {
                    Log.i(TAG, "drop(meta mismatch vs '" + metaName + "'): ["
                            + name.replace("\n", " | ") + "] " + title.split("\\r?\\n", 2)[0]);
                    continue;
                }
                String addon = addonNames != null && i < addonNames.size() ? addonNames.get(i) : "";
                out.add(new StreamRanker.Stream(name, title, str(call(call(s, "getUrl"), "getUrl")), addon, fileNameOf(s)));
            } catch (Throwable ignored) {
                // Skip unusable entries.
            }
        }
        return out;
    }

    /** The stream's own player deep link (stremio:///player/...); "" when it has none. */
    static String portPlayerLink(Object stream) {
        try {
            Object links = stream == null ? null : call(stream, "getDeepLinks");
            String link = links == null ? "" : str(call(links, "getPlayer")).trim();
            return link.toLowerCase(java.util.Locale.US).startsWith("stremio:") ? link : "";
        } catch (Throwable ignored) {
            return "";
        }
    }

    /** Pure decisions of the Compose path (no android classes), unit tested standalone. */
    static final class PortGate {
        static final long RETURN_WINDOW_MS = 4000L;
        static final long PENDING_MAX_MS = 45000L;

        private PortGate() {
        }

        /**
         * True when this streams page replays after the player: the same video is still loaded in the player
         * or ended moments ago, or an external player just returned for it. A page the app opened itself as
         * the next episode is always fresh.
         */
        static boolean returnedFromPlayer(String id, String lastPlayerId, boolean playerLoaded,
                                          long sinceLastPlayerEndMs, boolean externalReturnedRecently,
                                          boolean expectedNext) {
            if (expectedNext) return false;
            if (externalReturnedRecently) return true;
            if (id == null || id.length() == 0 || !id.equals(lastPlayerId)) return false;
            return playerLoaded || (sinceLastPlayerEndMs >= 0 && sinceLastPlayerEndMs < RETURN_WINDOW_MS);
        }

        static boolean shouldArm(boolean autoPickOn, boolean showListOn, boolean forced, boolean returned) {
            return autoPickOn && !showListOn && !forced && !returned;
        }

        static boolean shouldPickNow(boolean armed, boolean cancelled, boolean playerStartedSinceArm,
                                     boolean windowFocused, long elapsedMs, boolean anyCached) {
            if (!armed || cancelled || playerStartedSinceArm || !windowFocused || elapsedMs > PENDING_MAX_MS) {
                return false;
            }
            return Gate.shouldAutoPick(false, false, false, elapsedMs, anyCached);
        }

        /** As above; a complete list (every addon answered) may be picked after the short dwell. */
        static boolean shouldPickNow(boolean armed, boolean cancelled, boolean playerStartedSinceArm,
                                     boolean windowFocused, long elapsedMs, boolean anyCached, boolean listComplete) {
            if (!armed || cancelled || playerStartedSinceArm || !windowFocused || elapsedMs > PENDING_MAX_MS) {
                return false;
            }
            return Gate.shouldAutoPick(false, false, false, elapsedMs, anyCached, listComplete);
        }

        /** A held OK key just before the page opened keeps the stream list (the 1.6.12 long-press). */
        static boolean isForcedList(long nowMs, long lastLongOkAtMs) {
            return lastLongOkAtMs > 0L && nowMs - lastLongOkAtMs >= 0L && nowMs - lastLongOkAtMs <= 2500L;
        }

        /** Any key after the page opened means the user is browsing; volume, power and home do not count. */
        static boolean interactionCancels(int keyCode, long eventTimeMs, long armedAtMs) {
            if (keyCode == 24 || keyCode == 25 || keyCode == 164 || keyCode == 26 || keyCode == 3) return false;
            return eventTimeMs >= armedAtMs;
        }
    }

    /** The real device: prefs, window focus, launch through the app's own navigation. */
    private static final class RealEnv implements PortEnv {
        @Override
        public long now() {
            return android.os.SystemClock.uptimeMillis();
        }

        @Override
        public boolean autoPickOn() {
            return IntroSkipPrefs.isAutoPickEnabled(appContext());
        }

        @Override
        public boolean showListOn() {
            return IntroSkipPrefs.isShowListEnabled(appContext());
        }

        @Override
        public boolean windowFocused() {
            android.app.Activity a = portActivity == null ? null : portActivity.get();
            return a != null && !a.isFinishing() && a.hasWindowFocus();
        }

        @Override
        public boolean externalReturned(String videoId) {
            return app.tikkamasalla.stremio.progress.ExternalProgress.returnedRecently(videoId);
        }

        @Override
        public boolean open(String link) {
            android.app.Activity a = portActivity == null ? null : portActivity.get();
            android.net.Uri uri = android.net.Uri.parse(link);
            android.content.Context context = a != null && !a.isFinishing() ? a : appContext();
            if (context == null) return false;
            if (context == a && viaNavController(a, uri)) {
                Log.i(TAG, "launch via nav controller");
                return true;
            }
            try {
                android.content.Intent intent = new android.content.Intent(android.content.Intent.ACTION_VIEW, uri);
                intent.setPackage(context.getPackageName());
                if (context != a) intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
                Log.i(TAG, "launch via intent");
                return true;
            } catch (Throwable t) {
                Log.w(TAG, "launch failed", t);
                return false;
            }
        }

        /**
         * The stock stream click calls NavController.navigate(Uri) on the controller the nav host tags on its
         * view, so Back from the player lands on the streams page. Found by shape (the class is obfuscated);
         * null or ambiguous means the caller falls back to an intent.
         */
        private static boolean viaNavController(android.app.Activity a, android.net.Uri uri) {
            try {
                int tag = a.getResources().getIdentifier("nav_controller_view_tag", "id", a.getPackageName());
                Object controller = tag == 0 ? null : findTagged(a.getWindow().getDecorView(), tag, 0);
                if (controller == null) return false;
                Method target = null;
                for (Method m : controller.getClass().getMethods()) {
                    Class<?>[] p = m.getParameterTypes();
                    if (p.length == 1 && p[0] == android.net.Uri.class && m.getReturnType() == void.class) {
                        if (target != null) return false;
                        target = m;
                    }
                }
                if (target == null) return false;
                target.invoke(controller, uri);
                return true;
            } catch (Throwable ignored) {
                return false;
            }
        }

        private static Object findTagged(android.view.View view, int tag, int depth) {
            Object found = view.getTag(tag);
            if (found != null || depth > 8 || !(view instanceof android.view.ViewGroup)) return found;
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount() && found == null; i++) {
                found = findTagged(group.getChildAt(i), tag, depth + 1);
            }
            return found;
        }
    }

    /** Window.Callback proxy that reports key-down and touch-down to the pending pick; everything is forwarded. */
    private static final class PortWatch implements java.lang.reflect.InvocationHandler {
        private final android.view.Window.Callback inner;

        private PortWatch(android.view.Window.Callback inner) {
            this.inner = inner;
        }

        static void install(android.app.Activity a) {
            try {
                android.view.Window.Callback current = a == null ? null : a.getWindow().getCallback();
                if (current == null || (java.lang.reflect.Proxy.isProxyClass(current.getClass())
                        && java.lang.reflect.Proxy.getInvocationHandler(current) instanceof PortWatch)) {
                    return;
                }
                a.getWindow().setCallback((android.view.Window.Callback) java.lang.reflect.Proxy.newProxyInstance(
                        android.view.Window.Callback.class.getClassLoader(),
                        new Class<?>[] {android.view.Window.Callback.class}, new PortWatch(current)));
            } catch (Throwable ignored) {
                // No watcher: the settings and the dispatch signals still apply.
            }
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            try {
                Object arg = args != null && args.length == 1 ? args[0] : null;
                if (arg instanceof android.view.KeyEvent && "dispatchKeyEvent".equals(method.getName())) {
                    android.view.KeyEvent e = (android.view.KeyEvent) arg;
                    if (e.getAction() == android.view.KeyEvent.ACTION_DOWN) {
                        portKey(e.getKeyCode(), e.getRepeatCount(), e.isLongPress(), e.getEventTime());
                    }
                } else if (arg instanceof android.view.MotionEvent && "dispatchTouchEvent".equals(method.getName())
                        && ((android.view.MotionEvent) arg).getActionMasked() == android.view.MotionEvent.ACTION_DOWN) {
                    portTouch(((android.view.MotionEvent) arg).getEventTime());
                }
            } catch (Throwable ignored) {
                // Watching must never break input.
            }
            try {
                return method.invoke(inner, args);
            } catch (java.lang.reflect.InvocationTargetException e) {
                throw e.getCause() != null ? e.getCause() : e;
            }
        }
    }
}
