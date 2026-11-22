package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Renders TikTok Lite captions over the TV player. */
@SuppressWarnings("unused")
public final class Subtitles {

    private static final String TAG = "TikTokTVSub";

    private static final String OVERLAY_TAG = "app.tiktoktv.subtitle.text";
    private static final String PREFS = "TikTokTVSubtitles";

    public static final String PREF_ENABLED = "enabled";

    /** The caption language the viewer picked, empty when the post's own track will do. */
    public static final String PREF_TRACK = "track";

    /** The language to translate into, empty when the picture shows the track as the author wrote it. */
    public static final String PREF_TARGET = "target";

    /** The caption style preset, an index into {@link #STYLE_NAMES}. */
    public static final String PREF_STYLE = "style";

    /** The caption size as a percent of the base 17sp, so 100 is the size the patch first drew. */
    public static final String PREF_SIZE = "size";

    /** How far the captions are lifted above their resting place, as a percent of the player height. */
    public static final String PREF_POSITION = "position";

    /** The style presets, ported from SmartTube's PlayerData.initSubtitleStyles. */
    public static final String[] STYLE_NAMES = {
        "White on transparent",
        "White on semi-transparent",
        "White on black",
        "Yellow on transparent",
        "Yellow on semi-transparent",
        "Yellow on black",
    };

    private static final int[] STYLE_TEXT = {
        0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFF00, 0xFFFFFF00, 0xFFFFFF00,
    };

    /** Zero means transparent: the shadow style, and the one the patch drew before styles existed. */
    private static final int[] STYLE_BG = {
        0x00000000, 0x64000000, 0xFF000000, 0x00000000, 0x64000000, 0xFF000000,
    };

    /** The sizes offered, as percents of the base. SmartTube steps 0.1x–2.0x; this keeps the D-pad short. */
    public static final int[] SIZES = {50, 75, 100, 125, 150, 175, 200};

    /** The lifts offered, as percents of the player height. Zero is the resting place above the row. */
    public static final int[] POSITIONS = {0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50};

    private static final int MAX_ENTRIES = 120;
    private static final int FETCH_TIMEOUT_MS = 6000;
    private static final long POLL_MS = 150L;

    /** How deep a body is walked for awemes, enough for a result wrapped twice over. */
    private static final int MAX_DEPTH = 6;

    /** The endpoint that hands back the post's captions in another language. */
    private static final String TRANSLATE_PATH = "/tiktok/cla/subtitle_translation/get/v1/";

    /**
     * The post's mobile page redirects to its canonical URL and is served the SSR variant that
     * embeds the tracks as subtitleInfos.
     */
    private static final String MOBILE_ITEM = "https://m.tiktok.com/v/";

    /** The key the page spells the tracks under, with its array, so a bracket walk can find its end. */
    private static final String CAPTION_INFOS = "\"captionInfos\":[";

    /** The signed stack's page variant spells the same array {@code subtitleInfos}, PascalCase fields. */
    private static final String SUBTITLE_INFOS = "\"subtitleInfos\":[";

    /** TikTok's WAF answers an untrusted client with a scripted page and none of the post. */
    private static final int PAGE_ATTEMPTS = 3;

    /** Any real page carries the post's own JSON, which is far larger than the wall's script. */
    private static final int MIN_PAGE_BYTES = 50_000;

    /** Wait this long between two tries for the same post, and this long between any two posts. */
    private static final long PAGE_RETRY_MS = 1600L;

    private static final long PAGE_SPACING_MS = 2200L;

    /** The page is served to the app identity the rest of this patch presents, not to a desktop browser. */
    private static final String WEB_USER_AGENT =
            "com.zhiliaoapp.musically.go/430265 (Linux; U; Android 12; vi_VN; SM-A515F;"
                    + " Build/SP1A.210812.016;tt-ok/3.10.0.2)";

    /** When the last page was fetched, so the sampler's window can pass before the next one. */
    private static long pageIssuedAt;

    /** Posts whose page was really read, so a post without captions is asked for once. */
    private static final Set<String> WEB_READ = new LinkedHashSet<>();

    /** The service the app's own language picker reads its entries from. */
    private static final String I18N_SERVICE = "com.tiktok.tv.legacy.I18nManagerServiceImpl";

    /** The table once it has been read, since the panel asks for it every time it opens. */
    private static volatile List<String[]> LANGUAGES;

    /** The origin the feed answered on, which is the one this device is signed to talk to. */
    private static volatile String apiOrigin;

    /** Responses this app renders as a grid or a feed, so their posts are worth reading tracks from. */
    private static final String[] SCANNED_PATHS = {
        "/lite/v2/public/item/list/",
        "/aweme/v1/feed/",
        "/aweme/v1/search/tv/general/single/",
        "/tiktok/search/tv/general/single/",
        "/tv/search/general/single/v1",
        "/aweme/v1/search/item/",
    };

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService HTTP = Executors.newSingleThreadExecutor();

    /** aweme id → the tracks that post carries, in the order the server sent them. */
    private static final Map<String, Track[]> TRACKS = Collections.synchronizedMap(
            new LinkedHashMap<String, Track[]>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Track[]> eldest) {
                    return size() > MAX_ENTRIES;
                }
            });

    /** Track url → its parsed cues, so a rebind of a post already watched costs no request. */
    private static final Map<String, Cue[]> CUES = Collections.synchronizedMap(
            new LinkedHashMap<String, Cue[]>(32, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Cue[]> eldest) {
                    return size() > MAX_ENTRIES;
                }
            });

    /** Engines that were asked for their position, most recent last. */
    private static final List<WeakReference<Object>> ENGINES = new ArrayList<>();
    private static final int MAX_ENGINES = 4;

    private static WeakReference<View> boundRoot;
    private static String boundId;
    private static Cue[] boundCues;
    private static String boundText;
    private static long clockOriginMs = -1;
    private static long clockStartedAt;
    private static boolean engineClock;

    /** True while the engine says playback is paused. */
    private static boolean clockPaused;

    /**
     * The engine last seen with play intent. A pause is read from this one, not from whichever
     * prepared neighbour the feed happens to have queued.
     */
    private static WeakReference<Object> playingEngine;

    /** The engine the clock was last taken from and the position it reported. */
    private static WeakReference<Object> clockEngine;
    private static long clockEngineMs;

    private Subtitles() {
    }

    /** One subtitle track as the wire describes it. */
    public static final class Track {
        public final String languageCode;
        public final String languageName;
        public final String format;
        public final String url;
        public final long subId;
        public final long claSubId;
        public final boolean original;
        public final boolean translated;

        Track(String languageCode, String languageName, String format, String url,
              long subId, long claSubId, boolean original, boolean translated) {
            this.languageCode = languageCode;
            this.languageName = languageName;
            this.format = format;
            this.url = url;
            this.subId = subId;
            this.claSubId = claSubId;
            this.original = original;
            this.translated = translated;
        }
    }

    /** One WebVTT cue: the text with the window it is on screen for, in milliseconds. */
    static final class Cue {
        final long start;
        final long end;
        final String text;

        Cue(long start, long end, String text) {
            this.start = start;
            this.end = end;
            this.text = text;
        }
    }

    /**
     * Called with the raw body of a scanned response. path is the endpoint without its query, kept
     * only so a log line can name its source.
     */
    public static void scan(String path, String json) {
        if (scannedPath(path) == null) return;

        rememberOrigin(path);

        try {
            JSONObject body = new JSONObject(json);
            JSONArray items = new JSONArray();
            for (String listKey : new String[] {"aweme_list", "item_list"}) {
                JSONArray list = body.optJSONArray(listKey);
                if (list == null) continue;

                for (int i = 0; i < list.length(); i++) items.put(list.opt(i));
            }
            if (items.length() == 0) collect(body, items, 0);

            if (items.length() == 0) Log.i(TAG, "no aweme in " + path + ": " + keys(body));
            else remember(path, items, json);
        } catch (Throwable throwable) {
            Log.i(TAG, "caption error " + path + " " + throwable);
        }
    }

    /** Appends every aweme below node, wherever the endpoint nested it. */
    private static void collect(Object node, JSONArray out, int depth) {
        if (node instanceof JSONArray) {
            if (depth >= MAX_DEPTH) return;

            for (int i = 0; i < ((JSONArray) node).length(); i++) {
                collect(((JSONArray) node).opt(i), out, depth + 1);
            }
            return;
        }
        if (!(node instanceof JSONObject)) return;

        JSONObject object = (JSONObject) node;
        if (object.has("aweme_id")) {
            out.put(object);
            return;
        }
        if (depth >= MAX_DEPTH) return;

        java.util.Iterator<String> names = object.keys();
        while (names.hasNext()) collect(object.opt(names.next()), out, depth + 1);
    }

    /** Remembers the origin the feed answered on, because that is where translation lives too. */
    private static void rememberOrigin(String path) {
        if (apiOrigin != null) return;

        int slash = path.indexOf('/');
        if (slash <= 0) return;

        apiOrigin = "https://" + path.substring(0, slash + 1);
        Log.i(TAG, "api origin " + apiOrigin);
    }

    /** The origin the feed answered on, or null until a response has been scanned. */
    public static String origin() {
        return apiOrigin;
    }

    /** Remembers the API gateway from any intercepted request url, not just the scanned feed paths. */
    public static void noteOrigin(String url) {
        if (apiOrigin != null || url == null) return;
        if (!url.contains("/comment/") && !url.contains("/aweme/")) return;

        int scheme = url.indexOf("://");
        if (scheme < 0) return;
        int host = url.indexOf('/', scheme + 3);
        if (host < 0) return;

        apiOrigin = url.substring(0, host + 1);
        Log.i(TAG, "api origin " + apiOrigin);
    }

    /** @return the endpoint that serves this url, without its query, or null when unscanned. */
    public static String scannedPath(String url) {
        for (String path : SCANNED_PATHS) {
            if (!url.contains(path)) continue;

            int query = url.indexOf('?');
            int scheme = url.indexOf("//");
            if (query < 0 || scheme < 0) return path;

            return url.substring(scheme + 2, query);
        }
        return null;
    }

    /** @return the tracks of a post, or null when the wire carried none. */
    public static Track[] tracksOf(String awemeId) {
        return awemeId == null ? null : TRACKS.get(awemeId);
    }

    /** @return the tracks of the post on screen, which is what the subtitles panel lists. */
    public static Track[] tracksOfCurrent() {
        Track[] tracks = tracksOf(boundId);
        return tracks == null ? new Track[0] : tracks;
    }

    /** @return the track to draw: the one the viewer picked, or the post's own captions. */
    public static Track chooseTrack(Context context, Track[] tracks) {
        if (tracks == null || tracks.length == 0) return null;

        String wanted = pref(context, PREF_TRACK);
        if (!wanted.isEmpty()) {
            for (Track track : tracks) {
                if (wanted.equals(track.languageCode)) return track;
            }
        }

        for (Track track : tracks) {
            if (track.original) return track;
        }
        return tracks[0];
    }

    static String pref(Context context, String key) {
        String value = context == null ? null : prefs(context).getString(key, "");
        return value == null ? "" : value;
    }

    /** @return the language the picture would use now, empty when this post has none. */
    public static String currentLanguage(Context context) {
        Track track = chooseTrack(context, tracksOfCurrent());
        return track == null ? "" : track.languageCode;
    }

    /** The languages the app itself offers, read from the table its own language picker is built from. */
    public static List<String[]> serverLanguages() {
        List<String[]> cached = LANGUAGES;
        if (cached != null) return cached;

        List<String[]> found = new ArrayList<>();
        List<Object> held = new ArrayList<>();
        try {
            Class<?> service = Class.forName(I18N_SERVICE);
            Object manager = service.getMethod("createI18nManagerServicebyMonsterPlugin").invoke(null);
            Object items = manager.getClass().getMethod("getI18nItems").invoke(manager);
            if (items instanceof List) held.addAll((List<?>) items);
        } catch (Throwable failure) {
            Log.i(TAG, "no tv language table " + failure);
        }

        for (Object item : held) {
            String tag = asString(call(item, "a"));
            if (tag == null || tag.isEmpty()) continue;

            String code = tag.split("-")[0];
            boolean taken = false;
            for (String[] entry : found) {
                if (entry[1].equals(code)) taken = true;
            }
            if (taken) continue;

            String name = asString(call(item, "c"));
            found.add(new String[] {name == null || name.isEmpty() ? tag : name, code});
        }

        if (!found.isEmpty()) LANGUAGES = found;
        Log.i(TAG, "tv languages " + found.size());
        return found;
    }

    /** @return the name TikTok gives this language, or null when its table does not list it. */
    public static String serverName(String code) {
        if (code == null || code.isEmpty()) return null;

        for (String[] entry : serverLanguages()) {
            if (entry[1].equals(code)) return entry[0];
        }
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // Rendering
    // ---------------------------------------------------------------------------------------------

    /** Called with the BaseVideoFragment about to bind an aweme and the aweme itself. */
    public static void onPlay(Object fragment, Object aweme) {
        if (fragment == null || aweme == null) return;

        Object view = call(fragment, "getView");
        if (!(view instanceof View)) return;
        View root = (View) view;

        String id = asString(call(aweme, "getAid"));
        MAIN.post(() -> {
            SubtitleButton.attach(fragment, root);
            SubtitlesMenu.notePlayer(root);
            show(root, id);
        });
    }

    /** Called with each engine the app asks for its position, to give the cues a clock. */
    public static void noteEngine(Object engine) {
        if (engine == null) return;

        synchronized (ENGINES) {
            // A touch is the freshest evidence that this is the player on screen, so an engine
            // already known is moved to the end rather than left where it was first seen.
            for (int i = 0; i < ENGINES.size(); i++) {
                if (ENGINES.get(i).get() == engine) {
                    ENGINES.remove(i);
                    break;
                }
            }
            ENGINES.add(new WeakReference<>(engine));
            while (ENGINES.size() > MAX_ENGINES) ENGINES.remove(0);
        }
    }

    /** Shows or hides this post's captions according to the switch, keeping the row intact. */
    public static void refresh(View root) {
        if (root == null) return;
        show(root, boundId == null ? "" : boundId);
    }

    private static void show(View root, String awemeId) {
        MAIN.removeCallbacks(ticker);

        // The subtitles panel reads the tracks of whatever is on screen, switch or no switch.
        boundRoot = new WeakReference<>(root);
        boundId = awemeId;

        if (!isEnabled(root.getContext()) || awemeId == null || awemeId.isEmpty()) {
            hide(root);
            return;
        }

        Track track = chooseTrack(root.getContext(), tracksOf(awemeId));
        if (track == null) {
            // The wire carried nothing for this post, so ask the page it is played from. The row
            // keeps its button either way, which is what makes the next swipe work.
            online(awemeId);
            hide(root);
            return;
        }

        String target = pref(root.getContext(), PREF_TARGET);
        if (!target.isEmpty() && track.claSubId != 0) {
            Log.i(TAG, "subtitles " + track.languageCode + " into " + target + " for " + awemeId);
            translated(root.getContext(), awemeId, track, target);
            return;
        }

        Log.i(TAG, "subtitles for " + awemeId + " " + track.languageCode + " " + clip(track.url, 90));
        fromUrl(awemeId, track.url);
    }

    /** The captions the author wrote, which live on the CDN as a plain file. */
    private static void fromUrl(String awemeId, String url) {
        Cue[] cached = CUES.get(url);
        if (cached != null) {
            start(cached);
            return;
        }

        boundCues = null;
        load(url, cues -> {
            if (cues == null || cues.length == 0) {
                Log.i(TAG, "no cues for " + awemeId);
                return;
            }
            CUES.put(url, cues);
            if (awemeId.equals(boundId)) start(cues);
        });
    }

    /** The captions of a post the wire gave none for, read off the page the video is played from. */
    private static void online(String awemeId) {
        if (awemeId == null || awemeId.length() < 12) return;

        synchronized (WEB_READ) {
            if (WEB_READ.contains(awemeId)) return;
        }

        HTTP.execute(() -> {
            if (!awemeId.equals(boundId)) return;

            String url = MOBILE_ITEM + awemeId + ".html";
            // The app's own signed stack is never answered with the WAF stub, and the page variant
            // it is served embeds the tracks as subtitleInfos. The raw socket reads the browser
            // variant (captionInfos) and is only the fallback, because the wall's moods affect it.
            String body = signedGet(url);
            final boolean viaSigned = body != null
                    && (body.indexOf(CAPTION_INFOS) >= 0 || body.indexOf(SUBTITLE_INFOS) >= 0);
            if (body != null && !viaSigned) {
                Log.i(TAG, "signed page without captions key for " + awemeId
                        + " (" + body.length() + "B), falling back to the socket");
            }
            if (!viaSigned) {
                body = page(url);
                if (body == null) return;
            }

            final Track[] tracks = webTracks(body);
            synchronized (WEB_READ) {
                WEB_READ.add(awemeId);
                while (WEB_READ.size() > MAX_ENTRIES) WEB_READ.remove(WEB_READ.iterator().next());
            }

            MAIN.post(() -> {
                if (tracks.length == 0) {
                    Log.i(TAG, "no captions on the page of " + awemeId);
                    return;
                }
                TRACKS.put(awemeId, tracks);
                Log.i(TAG, (viaSigned ? "signed page captions for " : "page captions for ")
                        + awemeId + " " + tracks.length + " tracks");

                View root = boundRoot == null ? null : boundRoot.get();
                if (root != null && awemeId.equals(boundId)) show(root, awemeId);
            });
            upgradeIds(awemeId, url, tracks, viaSigned);
        });
    }

    /** The signed stack's page carries no cla subtitle id, so its tracks cannot be translated. */
    private static void upgradeIds(String awemeId, String url, Track[] tracks, boolean viaSigned) {
        if (!viaSigned || tracks.length == 0) return;
        boolean missing = false;
        for (Track track : tracks) {
            if (track.claSubId == 0) missing = true;
        }
        if (!missing) return;
        View root = boundRoot == null ? null : boundRoot.get();
        Context context = root == null ? null : root.getContext();
        if (pref(context, PREF_TARGET).isEmpty()) return;

        Track[] richer = webTracks(page(url));
        Track[] merged = new Track[tracks.length];
        boolean changed = false;
        for (int i = 0; i < tracks.length; i++) {
            merged[i] = tracks[i];
            if (tracks[i].claSubId != 0) continue;
            for (Track candidate : richer) {
                if (candidate.claSubId != 0
                        && candidate.languageCode.equals(tracks[i].languageCode)) {
                    merged[i] = candidate;
                    changed = true;
                    break;
                }
            }
        }
        if (!changed) return;

        Track[] finished = merged;
        MAIN.post(() -> {
            TRACKS.put(awemeId, finished);
            Log.i(TAG, "translation id borrowed for " + awemeId);
            View bound = boundRoot == null ? null : boundRoot.get();
            if (bound != null && awemeId.equals(boundId)) show(bound, awemeId);
        });
    }

    /** @return the post's page as a browser is served it, or null when the wall would not lift. */
    private static String page(String url) {
        for (int attempt = 1; attempt <= PAGE_ATTEMPTS; attempt++) {
            // The first try of a post waits out the gap since the last one; a retry waits less, but
            // never the few hundred ms that the sampler reads as a burst.
            pause((attempt == 1 ? PAGE_SPACING_MS : PAGE_RETRY_MS)
                    - (SystemClock.elapsedRealtime() - pageIssuedAt));
            pageIssuedAt = SystemClock.elapsedRealtime();

            String body = fetch(url);
            if (body == null) return null;
            if (body.length() >= MIN_PAGE_BYTES) return body;

            Log.i(TAG, "page walled at " + body.length() + "B, attempt " + attempt + " of "
                    + PAGE_ATTEMPTS + " for " + clip(url, 90));
        }
        return null;
    }

    /** Sleeps the given time on the fetch thread, if it is still owed. */
    private static void pause(long millis) {
        if (millis <= 0) return;
        try {
            Thread.sleep(millis);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
        }
    }

    private static String fetch(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(FETCH_TIMEOUT_MS);
            connection.setReadTimeout(FETCH_TIMEOUT_MS);
            connection.setRequestProperty("User-Agent", WEB_USER_AGENT);
            // No Accept-Encoding of our own: asking by hand turns off the transparent inflate, and
            // the page is much larger plain than gzipped.
            if (connection.getResponseCode() != 200) {
                Log.i(TAG, "page fetch " + connection.getResponseCode() + " " + clip(url, 90));
                return null;
            }
            return read(connection);
        } catch (Throwable failure) {
            Log.i(TAG, "page fetch failed " + failure);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    /** @return every track the page's embedded caption arrays describe, without repeats. */
    private static Track[] webTracks(String page) {
        if (page == null) return new Track[0];

        List<Track> found = new ArrayList<>();
        for (String key : new String[] {CAPTION_INFOS, SUBTITLE_INFOS}) {
            for (int at = page.indexOf(key); at >= 0; at = page.indexOf(key, at + 1)) {
                int open = page.indexOf('[', at);
                int close = open < 0 ? -1 : arrayEnd(page, open);
                if (close < 0) break;

                try {
                    for (Track track : parse(new JSONArray(page.substring(open, close + 1)))) {
                        boolean held = false;
                        for (Track earlier : found) {
                            if (earlier.url.equals(track.url)) held = true;
                        }
                        if (!held) found.add(track);
                    }
                } catch (Throwable failure) {
                    Log.i(TAG, "page captions unreadable " + clip(String.valueOf(failure), 120));
                }
            }
        }
        return found.toArray(new Track[0]);
    }

    /** @return the index of the bracket that closes the array opened at {@code open}, or -1. */
    private static int arrayEnd(String text, int open) {
        int depth = 0;
        boolean quoted = false;

        for (int i = open; i < text.length(); i++) {
            char c = text.charAt(i);
            if (quoted) {
                if (c == '\\') i++;
                else if (c == '"') quoted = false;
            } else if (c == '"') {
                quoted = true;
            } else if (c == '[' || c == '{') {
                depth++;
            } else if (c == ']' || c == '}') {
                depth--;
                if (depth == 0) return c == ']' ? i : -1;
                if (depth < 0) return -1;
            }
        }
        return -1;
    }

    /** The captions in the language the viewer asked for. */
    private static void translated(Context context, String awemeId, Track track, String target) {
        String key = "trans:" + track.claSubId + ':' + target;

        Cue[] cached = CUES.get(key);
        if (cached != null) {
            start(cached);
            return;
        }

        boundCues = null;
        HTTP.execute(() -> {
            String body = signedGet(apiOrigin + TRANSLATE_PATH + "?subtitle_id=" + track.claSubId
                    + "&target_language=" + target
                    + "&item_id=" + awemeId
                    + "&enter_from=homepage_hot");
            Cue[] cues = null;
            if (body != null) {
                try {
                    String vtt = new JSONObject(body).optString("webvtt_subtitle");
                    if (!vtt.isEmpty()) cues = webvtt(vtt);
                } catch (Throwable failure) {
                    Log.i(TAG, "translate unreadable " + clip(String.valueOf(failure), 120));
                }
            }

            Cue[] parsed = cues;
            MAIN.post(() -> {
                if (!awemeId.equals(boundId)) return;
                if (parsed == null || parsed.length == 0) {
                    Log.i(TAG, "translation empty, showing " + track.languageCode);
                    fromUrl(awemeId, track.url);
                    return;
                }
                CUES.put(key, parsed);
                start(parsed);
            });
        });
    }

    /**
     * A GET through the app's own client, which is the only thing that can add the signature and
     * the common params the API demands.
     */
    public static String signedGet(String url) {
        if (apiOrigin == null) {
            Log.i(TAG, "no api origin yet for " + clip(url, 90));
            return null;
        }

        try {
            Class<?> factoryClass = Class.forName(
                    "com.bytedance.ies.ugc.aweme.network.RetrofitFactory");
            Object factory = factoryClass.getMethod("createIRetrofitFactorybyMonsterPlugin")
                    .invoke(null);
            Object retrofit = factory.getClass().getMethod("create", String.class)
                    .invoke(factory, apiOrigin);
            Class<?> apiClass = Class.forName(
                    "com.ss.android.ugc.aweme.tv.feed.player.impl.TTNetClientApi");
            Object api = retrofit.getClass().getMethod("a", Class.class).invoke(retrofit, apiClass);

            Object call = apiClass.getMethod("get", String.class, List.class).invoke(api, url, null);
            Object response = call.getClass().getMethod("execute").invoke(call);
            if (response == null) return null;

            Object body = response.getClass().getMethod("f").invoke(response);
            Object success = response.getClass().getMethod("e").invoke(response);
            Object code = response.getClass().getMethod("c").invoke(response);
            if (!Boolean.TRUE.equals(success)) Log.i(TAG, "signed get http " + code);

            if (!(body instanceof String)) return null;
            if (((String) body).isEmpty()) Log.i(TAG, "signed get empty " + code + " " + clip(url, 120));
            return (String) body;
        } catch (Throwable failure) {
            Log.i(TAG, "signed get failed " + clip(String.valueOf(failure), 160));
            return null;
        }
    }

    private static void start(Cue[] cues) {
        boundCues = cues;
        boundText = null;
        clockOriginMs = -1;
        clockEngine = null;
        clockEngineMs = -1;
        clockPaused = false;
        MAIN.postDelayed(ticker, POLL_MS);
        Log.i(TAG, "subtitles on: " + cues.length + " cues for " + boundId);
    }

    private static void hide(View root) {
        boundCues = null;
        boundText = null;
        clockPaused = false;
        MAIN.removeCallbacks(ticker);
        clear(root);
    }

    /** The clock: the engine the app is polling, or the wall clock until one shows up. */
    private static long positionMs() {
        long now = SystemClock.elapsedRealtime();

        synchronized (ENGINES) {
            Object playing = null;
            Object paused = null;
            Object fallback = null;
            long pausedAt = -1;
            WeakReference<Object> last = playingEngine;
            Object lastPlaying = last == null ? null : last.get();

            // Newest first: the app polls the engine it is showing for its own progress, so the
            // visible player is the one touched last. A prepared neighbour is started too, but it
            // was never told to play and still sits at its own zero, so it must never time the
            // cues of the video on screen.
            for (int i = ENGINES.size() - 1; i >= 0; i--) {
                Object engine = ENGINES.get(i).get();
                if (engine == null) {
                    ENGINES.remove(i);
                    continue;
                }
                if (!Boolean.TRUE.equals(call(engine, "isStarted"))) continue;

                Object at = call(engine, "getCurrentPlaybackTime");
                long reported = at instanceof Number ? ((Number) at).longValue() : -1;

                // isShouldPlay is the engine's own play intent: play() sets it, pause() clears
                // it. It is the signal ExoPlayer tests before its text renderer advances cues, and
                // it covers every pause path (the play button, the controller, lifecycle pauses)
                // without a second set of hooks in BaseVideoFragment.
                if (Boolean.TRUE.equals(call(engine, "isShouldPlay"))) {
                    playing = engine;
                    break;
                }
                if (fallback == null) fallback = engine;
                if (engine == lastPlaying) {
                    paused = engine;
                    pausedAt = reported;
                } else if (paused == null && reported >= 0) {
                    paused = engine;
                    pausedAt = reported;
                }
            }

            // The engine the clock reads: the one playing, else the one that was playing when the
            // pause came. A neighbour that has never played is only the last resort.
            Object engine;
            long reported;
            if (playing != null) {
                engine = playing;
                reported = positionOf(playing);
                playingEngine = new WeakReference<>(playing);
            } else if (paused != null) {
                engine = paused;
                reported = pausedAt;
            } else if (lastPlaying != null
                    && Boolean.TRUE.equals(call(lastPlaying, "isStarted"))) {
                engine = lastPlaying;
                reported = positionOf(lastPlaying);
            } else {
                engine = fallback;
                reported = -1;
            }

            if (engine != null) {
                WeakReference<Object> anchor = clockEngine;
                // A null anchor means nothing is bound yet (start() just cleared it), and a
                // negative reading is the engine saying "not ready" — a video opened from search
                // reports -1 on its first tick. Neither may be dereferenced or anchored to.
                if (reported >= 0 && (anchor == null || reported != clockEngineMs
                        || engine != anchor.get())) {
                    clockEngine = new WeakReference<>(engine);
                    clockEngineMs = reported;
                    clockOriginMs = reported;
                    clockStartedAt = now;
                    if (!engineClock) {
                        engineClock = true;
                        Log.i(TAG, "subtitles clock from the engine");
                    }
                }

                // A paused engine keeps its position; only the wall-clock bridge has to stop.
                // The cue on screen stays where it was, exactly as an ExoPlayer SubtitleView does.
                // Freezing needs positive evidence of a pause (an engine that was playing); a
                // cold engine that has never reported a position must not pin the cues at zero.
                boolean frozen = playing == null && (paused != null || lastPlaying != null);
                if (frozen) {
                    if (!clockPaused) {
                        clockPaused = true;
                        Log.i(TAG, "subtitles clock paused at " + Math.max(0, clockOriginMs));
                    }
                    if (clockOriginMs < 0) {
                        clockOriginMs = 0;
                        clockStartedAt = now;
                    }
                    return clockOriginMs;
                }
                if (clockPaused) {
                    clockPaused = false;
                    clockStartedAt = now;
                    Log.i(TAG, "subtitles clock resumed at " + Math.max(0, clockOriginMs));
                }

                // A value that has not moved since the previous tick is the app's cache, not
                // the player's, so only the anchor is trusted and the wall clock carries it on.
                if (clockOriginMs < 0) {
                    clockOriginMs = 0;
                    clockStartedAt = now;
                }
                return clockOriginMs + (now - clockStartedAt);
            }
        }

        if (clockOriginMs < 0) {
            clockOriginMs = 0;
            clockStartedAt = now;
        }
        return clockOriginMs + (now - clockStartedAt);
    }

    /** The position an engine reports now, or -1 while it has not started counting. */
    private static long positionOf(Object engine) {
        Object at = call(engine, "getCurrentPlaybackTime");
        return at instanceof Number ? ((Number) at).longValue() : -1;
    }

    private static final Runnable ticker = new Runnable() {
        @Override
        public void run() {
            View root = boundRoot == null ? null : boundRoot.get();

            // A detached fragment is never re-attached: this is the loop's only exit.
            if (root == null || root.getWindowToken() == null) return;

            Cue[] cues = boundCues;
            if (cues == null) {
                clear(root);
                return;
            }

            TextView text = overlay(root);
            if (text == null) {
                MAIN.postDelayed(this, POLL_MS);
                return;
            }

            long at = positionMs();
            String line = "";
            for (Cue cue : cues) {
                if (cue.start > at) break;
                if (at < cue.end) line = cue.text;
            }

            if (!line.equals(boundText)) {
                boundText = line;
                place(root, text);
                paint(text, line);
                text.setVisibility(line.isEmpty() ? View.INVISIBLE : View.VISIBLE);
            }

            MAIN.postDelayed(this, POLL_MS);
        }
    };

    private static void clear(View root) {
        TextView text = overlayOf(root);
        if (text != null && text.getVisibility() != View.GONE) {
            text.setText("");
            text.setVisibility(View.GONE);
        }
    }

    private static TextView overlayOf(View root) {
        View found = root.findViewWithTag(OVERLAY_TAG);
        return found instanceof TextView ? (TextView) found : null;
    }

    /** The picture goes over the player, in the container the fragment inflates for it. */
    private static TextView overlay(View root) {
        TextView existing = overlayOf(root);
        if (existing != null) return existing;

        View host = root.findViewById(idOf(root, "fl_video_container"));
        if (!(host instanceof FrameLayout) || root.getWidth() <= 0) return null;

        Context context = root.getContext();
        TextView text = new TextView(context);
        text.setTag(OVERLAY_TAG);
        text.setVisibility(View.GONE);
        text.setClickable(false);
        text.setFocusable(false);
        text.setGravity(Gravity.CENTER_HORIZONTAL);
        text.setMaxLines(3);
        text.setPadding(sp(context, 12), 0, sp(context, 12), 0);
        style(root, text);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.LEFT);
        ((ViewGroup) host).addView(text, params);
        place(root, text);
        return text;
    }

    /** Re-reads the style prefs and draws them on the captions already on screen. */
    public static void applyStyle(View root) {
        if (root == null) return;

        TextView text = overlayOf(root);
        if (text == null) return;

        style(root, text);
        paint(text, boundText == null ? "" : boundText);
        place(root, text);
        Log.i(TAG, "subtitles style " + STYLE_NAMES[styleIndex(root.getContext())]
                + " " + sizePercent(root.getContext()) + "% lifted "
                + positionPercent(root.getContext()) + "%");
    }

    /** Applies the saved preset and size to the cue view, the way SmartTube's SubtitleManager does. */
    private static void style(View root, TextView text) {
        Context context = root.getContext();
        int index = styleIndex(context);
        text.setTextColor(STYLE_TEXT[index]);
        if (STYLE_BG[index] == 0) text.setShadowLayer(6f, 0f, 2f, 0xB0000000);
        else text.setShadowLayer(0f, 0f, 0f, 0);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f * sizePercent(context) / 100f);
    }

    /** Sets the line, boxing it per line when the preset has a background. */
    private static void paint(TextView text, String line) {
        int background = STYLE_BG[styleIndex(text.getContext())];
        if (background == 0 || line.isEmpty()) {
            text.setText(line);
            return;
        }

        SpannableString spanned = new SpannableString(line);
        spanned.setSpan(new BackgroundColorSpan(background), 0, line.length(),
                Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
        text.setText(spanned);
    }

    /**
     * Fits the caption to the video it rides on and lifts it above the floating row, which shares
     * the bottom of the screen with it.
     */
    private static void place(View root, TextView text) {
        if (!(text.getLayoutParams() instanceof FrameLayout.LayoutParams)) return;

        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) text.getLayoutParams();
        Context context = root.getContext();
        int[] at = new int[2];
        root.getLocationInWindow(at);
        int rootLeft = at[0];
        int rootTop = at[1];

        int width = (int) (root.getWidth() * 0.46f);
        int left = (root.getWidth() - width) / 2;
        View surface = root.findViewById(idOf(root, "player_surface_container"));
        if (surface != null && surface.getWidth() > 0) {
            surface.getLocationInWindow(at);
            width = surface.getWidth() - 2 * sp(context, 14);
            left = at[0] - rootLeft + sp(context, 14);
        }

        int bottom = (int) (root.getHeight() * 0.06f);
        View row = root.findViewById(idOf(root, "play_menu"));
        if (row != null) {
            row.getLocationInWindow(at);
            int rowTop = at[1] - rootTop;
            if (rowTop > 0) bottom = Math.max(bottom, root.getHeight() - rowTop + sp(context, 6));
        }
        // The viewer's lift rides on top of the resting place, so 0% is exactly the old geometry.
        bottom += (int) (root.getHeight() * positionPercent(context) / 100f);

        if (params.width == width && params.leftMargin == left && params.bottomMargin == bottom) {
            return;
        }
        params.width = width;
        params.leftMargin = left;
        params.bottomMargin = bottom;
        text.setLayoutParams(params);
    }

    private static void load(String url, Receiver receiver) {
        HTTP.execute(() -> {
            Cue[] parsed = null;
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(url).openConnection();
                connection.setConnectTimeout(FETCH_TIMEOUT_MS);
                connection.setReadTimeout(FETCH_TIMEOUT_MS);
                // Gzip would have to be undone by hand and these files are a few kilobytes.
                connection.setRequestProperty("Accept-Encoding", "identity");
                if (connection.getResponseCode() == 200) {
                    parsed = webvtt(read(connection));
                } else {
                    Log.i(TAG, "caption fetch " + connection.getResponseCode() + " " + clip(url, 120));
                }
            } catch (Throwable failure) {
                Log.i(TAG, "caption fetch failed " + failure);
            } finally {
                if (connection != null) connection.disconnect();
            }

            Cue[] cues = parsed;
            MAIN.post(() -> receiver.accept(cues));
        });
    }

    private interface Receiver {
        void accept(Cue[] cues);
    }

    private static String read(HttpURLConnection connection) throws Exception {
        InputStream stream = connection.getInputStream();
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(8192);
        byte[] buffer = new byte[4096];
        int read;
        try {
            while ((read = stream.read(buffer)) > 0) bytes.write(buffer, 0, read);
        } finally {
            stream.close();
        }
        return bytes.toString("UTF-8");
    }

    // ---------------------------------------------------------------------------------------------
    // The switch
    // ---------------------------------------------------------------------------------------------

    public static boolean isEnabled(Context context) {
        return prefs(context).getBoolean(PREF_ENABLED, false);
    }

    public static boolean setEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(PREF_ENABLED, enabled).apply();
        return enabled;
    }

    public static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** @return the saved preset, or the transparent white one the patch always drew. */
    public static int styleIndex(Context context) {
        int index = prefs(context).getInt(PREF_STYLE, 0);
        return index < 0 || index >= STYLE_NAMES.length ? 0 : index;
    }

    public static int sizePercent(Context context) {
        return prefs(context).getInt(PREF_SIZE, 100);
    }

    public static int positionPercent(Context context) {
        return prefs(context).getInt(PREF_POSITION, 0);
    }

    /** @return the size as SmartTube spells it: 0.5x, 1.0x, 1.25x. */
    public static String sizeLabel(int percent) {
        String label = String.format(Locale.US, "%.2f", percent / 100f);
        if (label.endsWith("0")) label = label.substring(0, label.length() - 1);
        return label + "x";
    }

    // ---------------------------------------------------------------------------------------------
    // WebVTT
    // ---------------------------------------------------------------------------------------------

    /**
     * The body is a WebVTT file: an optional header, then a cue id, a start --> end line and the
     * cue's text lines until the blank line that ends it.
     */
    static Cue[] webvtt(String body) {
        List<Cue> cues = new ArrayList<>();
        StringBuilder text = new StringBuilder();
        long start = -1;
        long end = -1;

        for (String raw : body.split("\n")) {
            String line = raw.trim();
            int arrow = line.indexOf("-->");

            if (arrow >= 0) {
                close(cues, start, end, text);
                start = stamp(line.substring(0, arrow));
                end = stamp(line.substring(arrow + 3));
                continue;
            }
            if (line.isEmpty()) {
                close(cues, start, end, text);
                start = -1;
                end = -1;
                continue;
            }
            if (start < 0) continue;

            String said = plain(line);
            if (!said.isEmpty()) text.append(said).append('\n');
        }
        close(cues, start, end, text);

        return cues.toArray(new Cue[0]);
    }

    private static void close(List<Cue> cues, long start, long end, StringBuilder text) {
        if (start < 0 || end <= start || text.length() == 0) {
            text.setLength(0);
            return;
        }

        String said = text.toString().trim();
        text.setLength(0);
        if (!said.isEmpty()) cues.add(new Cue(start, end, said));
    }

    /** @return the milliseconds a VTT time stamp stands for, or -1 when the line is not one. */
    private static long stamp(String value) {
        String time = value.trim();
        int settings = time.indexOf(' ');
        if (settings >= 0) time = time.substring(0, settings);

        int scale = time.indexOf('.');
        if (scale < 0) return -1;

        String[] parts = time.substring(0, scale).split(":");
        if (parts.length < 2 || parts.length > 3) return -1;

        try {
            long seconds = Long.parseLong(parts[parts.length - 1]);
            long minutes = Long.parseLong(parts[parts.length - 2]);
            long hours = parts.length == 3 ? Long.parseLong(parts[0]) : 0;

            long millis = 0;
            String fraction = time.substring(scale + 1);
            if (!fraction.isEmpty()) {
                millis = Long.parseLong(fraction.length() > 3 ? fraction.substring(0, 3) : fraction);
                for (int i = fraction.length(); i < 3; i++) millis *= 10;
            }
            return ((hours * 60 + minutes) * 60 + seconds) * 1000 + millis;
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    /** Drops the cue's markup: {@code <c.e2>} classes, tags and the {@code \N} line break. */
    private static String plain(String line) {
        StringBuilder said = new StringBuilder(line.length());
        boolean markup = false;

        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (c == '<') {
                markup = true;
            } else if (c == '>') {
                markup = false;
            } else if (!markup) {
                said.append(c);
            }
        }

        String clean = said.toString().replace("\\N", "\n");
        int nbsp = clean.indexOf("&nbsp;");
        if (nbsp >= 0) clean = clean.replace("&nbsp;", " ");
        return clean.trim();
    }

    // ---------------------------------------------------------------------------------------------
    // Wire parsing
    // ---------------------------------------------------------------------------------------------

    private static void remember(String path, JSONArray items, String json) {
        StringBuilder found = new StringBuilder();
        int withCaptions = 0;
        for (int i = 0; i < items.length(); i++) {
            JSONObject aweme = items.optJSONObject(i);
            if (aweme == null) continue;

            JSONObject video = aweme.optJSONObject("video");
            JSONObject captions = video == null ? null : video.optJSONObject("cla_info");
            JSONArray infos = captions == null ? null : captions.optJSONArray("caption_infos");
            if (infos == null) infos = aweme.optJSONArray("caption_infos");
            if (infos == null) continue;

            String id = aweme.optString("aweme_id");
            if (id.isEmpty()) continue;

            Track[] tracks = parse(infos);
            withCaptions++;
            if (tracks.length == 0) continue;

            TRACKS.put(id, tracks);

            found.append(' ').append(id).append('[');
            for (Track track : tracks) {
                found.append(track.languageCode).append(track.original ? "*" : "").append(' ');
            }
            found.setLength(found.length() - 1);
            found.append(']');
        }
        if (withCaptions > 0) {
            Log.i(TAG, clip("caption tracks " + path + " " + withCaptions + "/" + items.length()
                    + " posts:" + found, 900));
        } else if (items.length() > 0) {
            // Three keys, not one: a renamed field would show up as caption=true/cla_info=false,
            // while all three false is the server answering a payload that carries no tracks.
            Log.i(TAG, "no cla_info in " + items.length() + " posts from " + path
                    + ", body mentions cla_info=" + json.contains("cla_info")
                    + " caption=" + json.contains("caption")
                    + " subtitle=" + json.contains("subtitle")
                    + " webvtt=" + json.contains("webvtt"));
        }
    }

    /** The tracks one caption array describes. The wire spells its keys the way Lite's CaptionItemModel does. */
    private static Track[] parse(JSONArray infos) {
        Track[] parsed = new Track[infos.length()];
        int n = 0;
        for (int i = 0; i < infos.length(); i++) {
            JSONObject info = infos.optJSONObject(i);
            if (info == null) continue;

            String url = firstUrl(info.optJSONArray("url_list"));
            if (url == null) url = firstUrl(info.optJSONArray("urlList"));
            if (url == null) url = firstUrl(info.optJSONArray("url"));
            if (url == null) {
                String plain = info.optString("url");
                if (plain.isEmpty()) plain = info.optString("Url");
                if (plain.startsWith("http")) url = plain;
            }
            if (url == null) continue;

            String code = text(info, "language_code", "languageCode");
            if (code.isEmpty()) code = languageTag(info.optString("LanguageCodeName"));
            String name = text(info, "lang", "language");
            if (name.isEmpty()) name = code;
            String format = text(info, "caption_format", "captionFormat");
            if (format.isEmpty()) format = info.optString("Format");

            parsed[n++] = new Track(
                    code,
                    name,
                    format,
                    url,
                    number(info, "sub_id", "subID"),
                    number(info, "cla_subtitle_id", "claSubtitleID"),
                    original(info),
                    info.optBoolean("is_realtime_translated")
                            || info.optBoolean("isRealtimeTranslated"));
        }
        Track[] tracks = new Track[n];
        System.arraycopy(parsed, 0, tracks, 0, n);
        return tracks;
    }

    /** @return whether this is the track made from the video's own audio. */
    private static boolean original(JSONObject info) {
        if (info.optBoolean("is_original_caption") || info.optBoolean("isOriginalCaption")) {
            return true;
        }
        String source = info.optString("Source");
        if (source.isEmpty()) source = info.optString("source");
        if (source.isEmpty()) return false;

        String lower = source.toLowerCase(Locale.US);
        return !lower.equals("mt") && !lower.contains("translat");
    }

    /** @return the value of whichever of the two spellings the object carries. */
    private static String text(JSONObject info, String wire, String web) {
        String value = info.optString(wire);
        return value.isEmpty() ? info.optString(web) : value;
    }

    /** The signed stack's page names languages {@code vie-VN}; the panel and prefs speak {@code vi}. */
    private static String languageTag(String tag) {
        if (tag.isEmpty()) return "";
        String part = tag.split("-")[0].toLowerCase(Locale.US);
        if (part.length() == 2) return part;
        // Locale keeps ISO 639-2 as written, so the three-letter form is mapped back by hand.
        for (String code : Locale.getISOLanguages()) {
            if (part.equals(new Locale(code).getISO3Language())) return code;
        }
        return part;
    }

    /** @return the value of whichever of the two spellings the object carries. */
    private static long number(JSONObject info, String wire, String web) {
        long value = info.optLong(wire);
        return value != 0 ? value : info.optLong(web);
    }

    private static String firstUrl(JSONArray urls) {
        if (urls == null || urls.length() == 0) return null;

        String url = urls.optString(0);
        return url.isEmpty() ? null : url;
    }

    // ---------------------------------------------------------------------------------------------
    // Reflection helpers shared with the button
    // ---------------------------------------------------------------------------------------------

    static Object call(Object target, String name) {
        if (target == null) return null;
        try {
            return target.getClass().getMethod(name).invoke(target);
        } catch (Throwable failure) {
            return null;
        }
    }

    static int idOf(View root, String name) {
        return root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
    }

    static int drawableOf(View root, String name) {
        return root.getResources().getIdentifier(name, "drawable", root.getContext().getPackageName());
    }

    static int dimenOf(View root, String name) {
        int id = idOf(root, name);
        return id == 0 ? 0 : root.getResources().getDimensionPixelSize(id);
    }

    static int sp(Context context, float value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, value,
                context.getResources().getDisplayMetrics());
    }

    static String asString(Object value) {
        return value instanceof String ? (String) value : null;
    }

    private static String clip(String value, int max) {
        return value.length() <= max ? value : value.substring(0, max) + "…";
    }

    /** @return the body's top-level keys, so a moved item list is visible in one log line. */
    private static String keys(JSONObject body) {
        StringBuilder names = new StringBuilder();
        java.util.Iterator<String> iterator = body.keys();
        while (iterator.hasNext() && names.length() < 140) {
            names.append(' ').append(iterator.next());
        }
        return names.toString().trim();
    }
}
