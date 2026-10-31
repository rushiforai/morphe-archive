package app.tikkamasalla.stremio.introskip;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

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
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, String> FIRST_SEEN = Collections.synchronizedMap(
            new WeakHashMap<Object, String>());
    private static final Map<Object, Long> FIRST_AT = Collections.synchronizedMap(
            new WeakHashMap<Object, Long>());
    private static final Map<Object, Boolean> TIMER_4 = Collections.synchronizedMap(
            new WeakHashMap<Object, Boolean>());
    private static final Map<Object, Boolean> TIMER_8 = Collections.synchronizedMap(
            new WeakHashMap<Object, Boolean>());
    private static volatile String lastPickedVideoId = "";
    // Episode the user long-pressed: its stream list stays on screen even with auto-pick on.
    private static volatile String forceListVideoId = "";

    private StreamAutoPick() {
    }

    /**
     * Hook at the start of StreamsListFragment list observer. Takes the observer
     * lambda (p0) so no new registers are needed; fragment and state come from
     * its this$0 and L$0 fields.
     */
    public static void onStreams(Object lambda) {
        try {
            if (lambda == null) return;
            if (!IntroSkipPrefs.isAutoPickEnabled(appContext())) return;
            if (IntroSkipPrefs.isShowListEnabled(appContext())) return;
            Object fragment = field(lambda, "this$0");
            Object state = field(lambda, "L$0");
            if (fragment == null || state == null) return;
            String videoId = str(call(state, "getVideoId"));
            if (videoId.length() == 0) return;
            if (videoId.equals(forceListVideoId)) return;
            List<Object> streams = list(call(state, "getStreams"));
            if (streams == null || streams.isEmpty()) return;
            String seen = FIRST_SEEN.get(fragment);
            if ((videoId + "#picked").equals(seen) || videoId.equals(lastPickedVideoId)) return;
            long now = System.currentTimeMillis();
            Long firstAt = FIRST_AT.get(fragment);
            if (seen == null || !seen.equals(videoId)) {
                lastPickedVideoId = "";
                FIRST_SEEN.put(fragment, videoId);
                FIRST_AT.put(fragment, now);
                TIMER_4.put(fragment, false);
                TIMER_8.put(fragment, false);
                prefetchAliases(metaNameOf(state));
                schedule(fragment, videoId, WAIT_MS, 4);
                schedule(fragment, videoId, WAIT_NOCACHE_MS, 8);
                return;
            }
            if (firstAt == null) firstAt = now;
            long elapsed = now - firstAt;
            List<StreamRanker.Stream> candidates = toRanker(streams, metaNameOf(state));
            if (candidates.isEmpty()) return;
            int[] req = StreamRanker.requestOf(videoId);
            List<StreamRanker.Ranked> ranked = StreamRanker.rank(candidates, isMovie(state), req[0], req[1]);
            if (ranked.isEmpty()) return;
            boolean anyCached = false;
            for (StreamRanker.Ranked r : ranked) {
                if (r.meta.cached) {
                    anyCached = true;
                    break;
                }
            }
            if (elapsed < WAIT_MS) return;
            if (!anyCached && elapsed < WAIT_NOCACHE_MS) return;
            Object best = streamFor(streams, ranked.get(0).stream);
            if (best == null) return;
            FIRST_SEEN.put(fragment, videoId + "#picked");
            lastPickedVideoId = videoId;
            Log.i(TAG, "pick " + videoId + " -> " + ranked.get(0).stream);
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
            Map<Object, Boolean> map = timer == 4 ? TIMER_4 : TIMER_8;
            if (Boolean.TRUE.equals(map.get(fragment))) return;
            map.put(fragment, true);
            MAIN.postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (!isActive(fragment)) return;
                        if (!IntroSkipPrefs.isAutoPickEnabled(appContext())) return;
                        if (IntroSkipPrefs.isShowListEnabled(appContext())) return;
                        if (videoId.equals(forceListVideoId)) return;
                        String seen = FIRST_SEEN.get(fragment);
                        if (seen == null || !seen.equals(videoId) || videoId.equals(lastPickedVideoId)) return;
                        List<Object> streams = currentStreams(fragment);
                        if (streams == null || streams.isEmpty()) return;
                        List<StreamRanker.Stream> candidates = toRanker(streams, currentMetaName(fragment));
                        if (candidates.isEmpty()) return;
                        String vid = currentVideoId(fragment);
                        int[] req = StreamRanker.requestOf(vid);
                        List<StreamRanker.Ranked> ranked =
                                StreamRanker.rank(candidates, isMovieId(vid), req[0], req[1]);
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
                        lastPickedVideoId = videoId;
                        Log.i(TAG, "pick(timer" + timer + ") " + videoId + " -> " + ranked.get(0).stream);
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

    private static List<Object> currentStreams(Object fragment) {
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
            Object state = flow.getClass().getMethod("getValue").invoke(flow);
            if (state == null) return null;
            return list(call(state, "getStreams"));
        } catch (Throwable ignored) {
            return null;
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

    private static String currentMetaName(Object fragment) {
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
            return metaNameOf(flow.getClass().getMethod("getValue").invoke(flow));
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
        return s.toLowerCase(java.util.Locale.US)
                .replaceAll("\\s*[(\\[]\\s*(?:19|20)\\d{2}[^)\\]]*[)\\]]\\s*$", "")
                .replaceAll("[^a-z0-9]+", " ").trim();
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
    private static boolean matchesMeta(String streamText, String metaName) {
        try {
            List<String> candidates = aliasesFor(metaName);
            if (candidates.isEmpty()) return true;
            String text = streamText == null ? "" : streamText.toLowerCase(java.util.Locale.US);
            java.util.Set<String> tokens = new java.util.HashSet<String>();
            for (String t : text.split("[^a-z0-9]+")) {
                if (t.length() > 0) tokens.add(t);
            }
            for (String candidate : candidates) {
                if (matchesSingleTitle(tokens, candidate)) return true;
            }
            return false;
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static boolean matchesSingleTitle(java.util.Set<String> tokens, String name) {
        String[] words = name.split("[^a-z0-9]+");
        if (words.length > 1) {
            String last = words[words.length - 1];
            if (last.matches("ii|iii|iv|v|vi|vii|viii|ix|[2-9]") && !tokens.contains(last)) return false;
        }
        int significant = 0;
        int matched = 0;
        for (String word : words) {
            if (word.length() < 3 || word.equals("the") || word.equals("and") || word.equals("der")
                    || word.equals("die") || word.equals("das") || word.equals("des")
                    || word.equals("no") || word.equals("wa") || word.equals("ni") || word.equals("ga")) {
                continue;
            }
            significant++;
            if (tokens.contains(word)) matched++;
        }
        if (significant == 0) return true;
        // Require at least 2 matching significant words when the title has >= 2 significant words
        // (so "Shingeki no Kyojin" requires both "shingeki" and "kyojin", and "Attack on Titan"
        // requires both "attack" and "titan").
        return significant >= 2 ? matched >= 2 : matched >= 1;
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

    private static List<StreamRanker.Stream> toRanker(List<Object> streams, String metaName) {
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
                out.add(new StreamRanker.Stream(name, title, url, ""));
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

    private static String descriptionOf(Object stream) {
        String desc = str(call(stream, "getDescription"));
        if (desc.length() == 0) desc = str(call(stream, "getTitle"));
        return desc;
    }

    private static Object streamFor(List<Object> streams, StreamRanker.Stream best) {
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
}
