package app.anghami.extension.extension;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * LRCLIB fallback for truncated lyrics (opt-in patch runtime).
 *
 * Entry points called from injected trampolines:
 * - {@link #maybeFetch} (from {@code A7/F.onNext}, after the server teaser
 *   renders) renders full LRCLIB lyrics when the server response is
 *   truncated or empty. Full native responses return early, so the
 *   Plus/native path is untouched.
 * - {@link #substituteCached} (from {@code A7/E.b} entry) rewrites a
 *   truncated/empty response in place with cached LRCLIB lyrics before
 *   native renders it — the teaser is never shown, on first open or
 *   revisit. {@link #impl} re-flags such responses truncated afterwards
 *   so native saveLyrics keeps refusing them.
 * - {@link #paintCached} (from the lyrics-view load) paints cached lyrics
 *   instantly without waiting for the DB/API round-trip.
 * - {@link #showLyricsOptions} (from the play/pause long-press) opens the
 *   options dialog for the current song.
 *
 * All app classes are touched via reflection: the extension compiles
 * without the app on the classpath. Any failure is caught and logged;
 * the host app is never crashed by this helper.
 *
 * Server StoredLyrics cache is never written; fallback results live in
 * a separate SharedPreferences file ("lyrics_fallback").
 */
@SuppressWarnings("unused")
public final class LrclibFallback {

    private static final String TAG = "LyricsFallback";
    private static final String SOURCE_URL = "https://lrclib.net";
    private static final String UA = "AnghamiLyricsFallback/1.0 (+https://lrclib.net/docs)";
    private static final String PREFS = "lyrics_fallback";
    private static final String KEY_VERSION = "v1";
    private static final long POS_TTL_MS = 30L * 24 * 3600 * 1000;
    private static final long NEG_TTL_MS = 7L * 24 * 3600 * 1000;
    private static final int MAX_ENTRIES = 500;
    private static final int HTTP_TIMEOUT_MS = 12000;

    private LrclibFallback() {
    }

    // ---- last-render state (single visible lyrics view at a time) ----

    private static Object lastSong;
    private static Object lastCallback;
    private static Object lastOriginalResponse;
    private static String lastQueryUsed = "";
    private static String lastSource = "";
    private static String lastPlain;
    private static String lastSynced;
    private static boolean lastPreferSynced = true;
    private static long lastDialogMs;
    private static final java.util.WeakHashMap<Object, String> renderedKeys =
            new java.util.WeakHashMap<Object, String>();

    // ================= entry points =================

    /** Called after {@code A7/E.b} renders the server teaser (or empty). */
    public static void maybeFetch(Object songObj, Object responseObj, Object callbackObj) {
        impl(songObj, responseObj, callbackObj);
    }

    /** Called from the API error path (song has nothing usable on the server). */
    public static void maybeFetchNoResponse(Object songObj, Object callbackObj) {
        impl(songObj, null, callbackObj);
    }

    /**
     * Forces per-song flags at the data level (not a consumer workaround).
     * The server song payload carries {@code hasLyrics=false} for
     * lyrics-less songs, and {@code A7/C} actively re-clears it on empty
     * lyrics responses — so nopping each reader (button gate, mode
     * observer, ...) was whack-a-mole. Setting the flag at every trampoline
     * (W0, onNext, onError, mode observer) makes all native checks see
     * lyrics available; the fallback itself still only renders when the
     * server response is truncated/empty. {@code hasKaraoke} is forced
     * false the same way (song-level kill-switch; GSON sets the field
     * directly so there is no method to hook — same treatment as lyrics).
     * Null-safe, reflection-only, never crashes the host.
     */
    public static void forceSongFlags(Object songObj) {
        try {
            if (songObj == null) return;
            Field f = fieldUp(songObj.getClass(), "hasLyrics");
            if (f != null && f.getType() == Boolean.TYPE && !f.getBoolean(songObj)) {
                f.setBoolean(songObj, true);
                Log.d(TAG, "hasLyrics forced true");
            }
            Field k = fieldUp(songObj.getClass(), "hasKaraoke");
            if (k != null && k.getType() == Boolean.TYPE && k.getBoolean(songObj)) {
                k.setBoolean(songObj, false);
                Log.d(TAG, "hasKaraoke forced false");
            }
        } catch (Throwable t) {
            Log.d(TAG, "forceSongFlags failed: " + t);
        }
    }

    private static void impl(Object songObj, Object responseObj, Object callbackObj) {
        try {
            if (songObj == null || callbackObj == null) return;
            // Already served via substituteCached (E.b entry rewrote this
            // response pre-render): re-flag truncated so the native
            // saveLyrics flow keeps refusing it, then stop. StoredLyrics
            // is never written; our prefs cache stays the only source.
            if (unmarkSubstituted(responseObj)) return;
            boolean serverEmpty = true;
            if (responseObj != null) {
                if (isFullNativeResponse(responseObj)) return; // Plus/native path: untouched.
                serverEmpty = isEmptyResponse(responseObj);
            }

            Context ctx = appContextOf(callbackObj);
            if (ctx == null) return;
            SongInfo song = readSong(songObj);
            if (song == null || song.title.isEmpty()) return;

            synchronized (LrclibFallback.class) {
                lastSong = songObj;
                lastCallback = callbackObj;
                lastOriginalResponse = responseObj;
                lastPlain = null;
                lastSynced = null;
            }

            final String key = cacheKey(song);
            Cached hit = lookupCache(ctx, song, key);
            if (hit != null) {
                if (hit.miss) {
                    Log.d(TAG, "negative cache hit for songId=" + song.id);
                    // Still guide the user: the server view alone (teaser
                    // or empty) never mentions the long-press options.
                    // Full native responses returned above, so this is a
                    // truncated teaser or nothing — safe to own the screen.
                    if (serverEmpty) {
                        renderOnMain(ctx, songObj, callbackObj,
                                tr("no_result"), null, "no-result", false);
                    } else if (responseObj != null) {
                        renderTeaserWithGuide(ctx, songObj, callbackObj, responseObj);
                    }
                    return;
                }
                remember(hit.queryUsed, hit.source, hit.plain, hit.synced);
                renderOnMain(ctx, songObj, callbackObj, hit.plain, hit.synced, hit.queryUsed, true);
                return;
            }

            if (serverEmpty) {
                // Own the screen immediately: empty state becomes a loading
                // placeholder instead of the song-has-no-lyrics path.
                renderOnMain(ctx, songObj, callbackObj,
                        tr("searching"), null, "placeholder", false);
            }

            final Context appCtx = ctx.getApplicationContext() != null ? ctx.getApplicationContext() : ctx;
            final Object songRef = songObj;
            final Object cbRef = callbackObj;
            final SongInfo songFinal = song;
            final String keyFinal = key;
            final boolean serverEmptyFinal = serverEmpty;
            new Thread(new Runnable() {
                @Override
                public void run() {
                    Result r;
                    try {
                        r = waterfall(songFinal);
                    } catch (RateLimited rl) {
                        Log.d(TAG, "rate limited, keeping server view for songId=" + songFinal.id);
                        return;
                    } catch (Throwable t) {
                        Log.d(TAG, "waterfall failed: " + t);
                        return;
                    }
                    if (r == null) {
                        writeNegativeCache(appCtx, keyFinal);
                        Log.d(TAG, "no-match for songId=" + songFinal.id);
                        if (serverEmptyFinal) {
                            renderOnMain(appCtx, songRef, cbRef,
                                    tr("no_result"), null, "no-result", false);
                        } else {
                            // Server holds a (truncated) teaser but LRCLIB
                            // has nothing: keep the teaser visible and
                            // append the long-press guide. The unlock
                            // button is a native no-op (A5/t.onClick
                            // returns void), so the guide is the only way
                            // to the manual search.
                            renderTeaserWithGuide(appCtx, songRef, cbRef, responseObj);
                        }
                        return;
                    }
                    writePositiveCache(appCtx, keyFinal, r);
                    remember(r.queryUsed, r.source, r.plain, r.synced);
                    renderOnMain(appCtx, songRef, cbRef, r.plain, r.synced, r.queryUsed, true);
                }
            }).start();
        } catch (Throwable t) {
            Log.d(TAG, "maybeFetch failed: " + t);
        }
    }

    /** Play/pause long-press entry: replaces the native sleep-timer sheet
     * (see the long-press patch) with the lyrics options for the current
     * song. Runs on the main thread (long-click dispatch). Never crashes
     * the host; toasts when nothing is loaded yet.
     */
    public static void showLyricsOptions(Object fragmentObj) {
        try {
            if (fragmentObj == null) return;
            Context ctx = null;
            try {
                Method m = fragmentObj.getClass().getMethod("getActivity");
                Object a = m.invoke(fragmentObj);
                if (a instanceof Context) ctx = (Context) a;
            } catch (Exception ignored) {
            }
            if (ctx == null) return;
            // The dialog edits the CURRENTLY PLAYING song — not the last
            // lyrics request (pre-cached/next-track responses overwrite
            // lastSong while another song plays). PlayQueueManager is the
            // source of truth; lastSong is only the fallback.
            Object song = currentPlayingSong();
            if (song == null) {
                synchronized (LrclibFallback.class) {
                    song = lastSong;
                }
            }
            if (song == null) {
                Toast.makeText(ctx, tr("no_loaded"), Toast.LENGTH_SHORT).show();
                return;
            }
            showOptionsForSong(ctx, song);
        } catch (Throwable t) {
            Log.d(TAG, "showLyricsOptions failed: " + t);
        }
    }

    /** Currently playing song, or null. Reflection-only, never throws. */
    private static Object currentPlayingSong() {
        try {
            Class<?> pqm = Class.forName("com.anghami.odin.playqueue.PlayQueueManager");
            Object inst = pqm.getMethod("getSharedInstance").invoke(null);
            if (inst == null) return null;
            return pqm.getMethod("getCurrentSong").invoke(inst);
        } catch (Throwable t) {
            return null;
        }
    }

    // ================= truncated suppression =================

    /**
     * Responses rewritten by {@link #substituteCached} (identity set).
     * {@link #impl} re-flags them truncated so native saveLyrics keeps
     * refusing them.
     */
    private static final java.util.Set<Object> substituted =
            java.util.Collections.newSetFromMap(
                    new java.util.WeakHashMap<Object, Boolean>());

    /** ID-primary lookup with legacy-key fallback (pre-id-key entries). */
    private static Cached lookupCache(Context ctx, SongInfo song, String key) {
        Cached hit = readCache(ctx, key);
        if (hit == null) {
            String legacy = legacyCacheKey(song);
            if (!legacy.equals(key)) hit = readCache(ctx, legacy);
        }
        return hit;
    }

    private static boolean hasUsableLyrics(Cached hit) {
        return hit != null && !hit.miss
                && ((hit.plain != null && !hit.plain.isEmpty())
                || (hit.synced != null && !hit.synced.isEmpty()));
    }

    /**
     * {@code A7/E.b} entry: when the server response is truncated/empty
     * and we already hold LRCLIB lyrics for this song, rewrite the
     * response in place BEFORE native renders it — the teaser is never
     * shown in any way, on first open or revisit. Full native/Plus
     * responses and cache misses are untouched. All decisions live here
     * so the trampoline stays a branch-free static call.
     */
    public static void substituteCached(Object songObj, Object responseObj, Object callbackObj) {
        try {
            if (songObj == null || responseObj == null || callbackObj == null) return;
            if (isFullNativeResponse(responseObj)) return;
            Context ctx = appContextOf(callbackObj);
            if (ctx == null) return;
            SongInfo song = readSong(songObj);
            if (song == null || song.id.isEmpty()) return;
            Cached hit = lookupCache(ctx, song, cacheKey(song));
            if (!hasUsableLyrics(hit)) return;
            boolean wantSynced = lastPreferSynced && hit.synced != null && !hit.synced.isEmpty();
            if (!wantSynced && (hit.plain == null || hit.plain.isEmpty()) && hit.synced != null) {
                wantSynced = true; // only synced available.
            }
            if (wantSynced) {
                List<Object> lines = buildSyncedLines(hit.synced);
                if (lines.isEmpty()) {
                    if (hit.plain == null || hit.plain.isEmpty()) return;
                    wantSynced = false;
                } else {
                    setLineField(responseObj, "lyricsSynced", lines);
                    setLineField(responseObj, "lyricsUnsynced", null);
                    setLineField(responseObj, "isSynced", true);
                }
            }
            if (!wantSynced) {
                setLineField(responseObj, "lyricsSynced", null);
                setLineField(responseObj, "lyricsUnsynced", hit.plain);
                setLineField(responseObj, "isSynced", false);
            }
            setLineField(responseObj, "truncated", false);
            remember(hit.queryUsed, hit.source, hit.plain, hit.synced);
            synchronized (LrclibFallback.class) {
                lastSong = songObj;
                lastCallback = callbackObj;
                lastOriginalResponse = responseObj;
                substituted.add(responseObj);
            }
            Log.d(TAG, "substituted cached (" + hit.queryUsed + ")");
        } catch (Throwable t) {
            Log.d(TAG, "substituteCached failed: " + t);
        }
    }

    /**
     * Lyrics-view load entry ({@code com.anghami.ui.view.A.h}): paints
     * cached LRCLIB lyrics instantly without waiting for the DB/API
     * round-trip. Miss = no-op, native proceeds. The later API response
     * is rewritten to the same content by {@link #substituteCached}, so
     * there is no visible change when it lands.
     */
    public static void paintCached(Object viewObj) {
        try {
            if (!(viewObj instanceof View)) return;
            final View view = (View) viewObj;
            final Context ctx = view.getContext();
            if (ctx == null) return;
            final Object songObj;
            try {
                songObj = getFieldUp(viewObj, "c");
            } catch (Exception e) {
                return;
            }
            if (songObj == null) return;
            SongInfo song = readSong(songObj);
            if (song == null || song.id.isEmpty()) return;
            Cached hit = lookupCache(ctx, song, cacheKey(song));
            if (!hasUsableLyrics(hit)) return;
            remember(hit.queryUsed, hit.source, hit.plain, hit.synced);
            synchronized (LrclibFallback.class) {
                lastSong = songObj;
                lastCallback = viewObj;
                lastOriginalResponse = null;
            }
            renderOnMain(ctx, songObj, viewObj, hit.plain, hit.synced,
                    hit.queryUsed + " early", true);
        } catch (Throwable t) {
            Log.d(TAG, "paintCached failed: " + t);
        }
    }

    /**
     * True when this response was rewritten by {@link #substituteCached}.
     * Re-flags it truncated so native saveLyrics refuses it (our prefs
     * cache stays the only source of truth), so the caller can stop.
     */
    private static boolean unmarkSubstituted(Object responseObj) {
        try {
            if (responseObj == null) return false;
            boolean mine;
            synchronized (LrclibFallback.class) {
                mine = substituted.remove(responseObj);
            }
            if (!mine) return false;
            Field f = fieldUp(responseObj.getClass(), "truncated");
            if (f != null && f.getType() == Boolean.TYPE) f.setBoolean(responseObj, true);
            Log.d(TAG, "substituted response unmarked (save skipped)");
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * LRCLIB miss while the server holds a (truncated) teaser: re-render
     * the teaser with the long-press guide appended, so the user can
     * still reach the manual search. Plain path only.
     */
    private static void renderTeaserWithGuide(Context ctx, Object songObj,
                                              Object callbackObj, Object responseObj) {
        try {
            String teaser = teaserText(responseObj);
            if (teaser == null || teaser.trim().isEmpty()) {
                renderOnMain(ctx, songObj, callbackObj,
                        tr("no_result"), null, "no-result", false);
                return;
            }
            renderOnMain(ctx, songObj, callbackObj,
                    teaser + "\n\n" + tr("guide_teaser"), null, "teaser-guide", false);
        } catch (Throwable t) {
            Log.d(TAG, "renderTeaserWithGuide failed: " + t);
        }
    }

    /** Best-effort teaser text out of a truncated server response. */
    private static String teaserText(Object responseObj) {
        try {
            String unsynced = getString(responseObj, "lyricsUnsynced");
            if (unsynced != null && !unsynced.trim().isEmpty()) return unsynced;
            List<?> synced = getList(responseObj, "lyricsSynced");
            if (synced == null || synced.isEmpty()) return null;
            StringBuilder sb = new StringBuilder();
            for (Object line : synced) {
                try {
                    Object text = getFieldUp(line, "line");
                    if (text instanceof String && !((String) text).trim().isEmpty()) {
                        if (sb.length() > 0) sb.append('\n');
                        sb.append((String) text);
                    }
                } catch (Exception ignored) {
                }
            }
            return sb.length() == 0 ? null : sb.toString();
        } catch (Throwable t) {
            return null;
        }
    }

    /** Parsed LRC as native LyricsLine objects (line + milliseconds). */
    private static List<Object> buildSyncedLines(String synced) {
        List<Object> out = new ArrayList<Object>();
        try {
            List<Line> parsed = parseLrc(synced);
            if (parsed.isEmpty()) return out;
            Class<?> lc = Class.forName("com.anghami.ghost.pojo.LyricsLine");
            for (Line l : parsed) {
                Object o = lc.newInstance();
                setLineField(o, "line", l.text);
                setLineField(o, "milliseconds", l.ms);
                out.add(o);
            }
        } catch (Throwable t) {
            Log.d(TAG, "buildSyncedLines failed: " + t);
        }
        return out;
    }

    // ================= response inspection =================

    private static boolean isFullNativeResponse(Object response) throws Exception {
        if (getBoolean(response, "truncated")) return false;
        List<?> synced = getList(response, "lyricsSynced");
        if (synced != null && !synced.isEmpty()) return true;
        String unsynced = getString(response, "lyricsUnsynced");
        return unsynced != null && !unsynced.trim().isEmpty();
    }

    private static boolean isEmptyResponse(Object response) {
        List<?> synced = getList(response, "lyricsSynced");
        if (synced != null && !synced.isEmpty()) return false;
        String unsynced = getString(response, "lyricsUnsynced");
        return unsynced == null || unsynced.trim().isEmpty();
    }

    // ================= song / reflection =================

    private static final class SongInfo {
        String id = "";
        String title = "";
        String artist = "";
        float duration;
        boolean hasDuration;
    }

    private static SongInfo readSong(Object songObj) throws Exception {
        SongInfo s = new SongInfo();
        Object id = getFieldUp(songObj, "id");
        Object title = getFieldUp(songObj, "title");
        Object artist = getFieldUp(songObj, "artistName");
        Object dur = getFieldUp(songObj, "duration");
        if (id instanceof String) s.id = (String) id;
        if (title instanceof String) s.title = ((String) title).trim();
        if (artist instanceof String) s.artist = ((String) artist).trim();
        if (dur instanceof Number) {
            s.duration = ((Number) dur).floatValue();
            s.hasDuration = s.duration > 0;
        }
        return s;
    }

    private static Field fieldUp(Class<?> c, String name) {
        for (Class<?> k = c; k != null && k != Object.class; k = k.getSuperclass()) {
            try {
                Field f = k.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {
            }
        }
        return null;
    }

    private static Object getFieldUp(Object o, String name) throws Exception {
        Field f = fieldUp(o.getClass(), name);
        return f == null ? null : f.get(o);
    }

    private static String getString(Object o, String name) {
        try {
            Object v = getFieldUp(o, name);
            return v instanceof String ? (String) v : null;
        } catch (Exception e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    private static List<?> getList(Object o, String name) {
        try {
            Object v = getFieldUp(o, name);
            return v instanceof List ? (List<?>) v : null;
        } catch (Exception e) {
            return null;
        }
    }

    private static boolean getBoolean(Object o, String name) {
        try {
            Object v = getFieldUp(o, name);
            return v instanceof Boolean && (Boolean) v;
        } catch (Exception e) {
            return false;
        }
    }

    private static Context appContextOf(Object callbackObj) {
        try {
            if (callbackObj instanceof View) return ((View) callbackObj).getContext();
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    // ================= normalize =================

    private static final Pattern FEAT_RX =
            Pattern.compile("(?i)\\s+[\\(\\[]?(feat\\.?|ft\\.?|featuring|x|with|&)\\b.*$");
    private static final Pattern PAREN_RX = Pattern.compile("\\s*[\\(\\[].*?[\\)\\]]");
    private static final Pattern PUNCT_RX = Pattern.compile("[^\\p{L}\\p{N} ]+");
    private static final Pattern SPACE_RX = Pattern.compile("\\s+");

    static String normalize(String s, boolean stripParens) {
        if (s == null) return "";
        String t = s.trim().toLowerCase(Locale.ROOT);
        t = Normalizer.normalize(t, Normalizer.Form.NFD).replaceAll("\\p{Mn}+", "");
        t = FEAT_RX.matcher(t).replaceAll("");
        if (stripParens) t = PAREN_RX.matcher(t).replaceAll("");
        t = PUNCT_RX.matcher(t).replaceAll(" ");
        t = SPACE_RX.matcher(t).replaceAll(" ").trim();
        return t;
    }

    // ================= localization =================

    /**
     * All user-visible strings added by this fallback, in every language
     * the app ships (values=en, values-ar, values-fr). Runtime map —
     * the extension adds no res/ resources, so native strings stay
     * untouched and ours follow the device locale.
     */
    static String tr(String key) {
        String lang = "";
        try {
            lang = Locale.getDefault().getLanguage();
        } catch (Exception ignored) {
        }
        boolean ar = "ar".equalsIgnoreCase(lang);
        boolean fr = "fr".equalsIgnoreCase(lang);

        if ("no_result".equals(key)) {
            if (ar) return "لم يتم العثور على كلمات.\nاضغط مطولاً على زر التشغيل للبحث يدوياً.";
            if (fr) return "Paroles introuvables.\nAppui long sur le bouton lecture pour chercher manuellement.";
            return "No lyrics found.\nLong-press the play button to search manually.";
        }
        if ("guide_teaser".equals(key)) {
            if (ar) return "اضغط مطولاً على زر التشغيل لخيارات الكلمات.";
            if (fr) return "Appui long sur le bouton lecture pour les options des paroles.";
            return "Long-press the play button for lyrics options.";
        }
        if ("searching".equals(key)) {
            if (ar) return "جارٍ البحث في LRCLIB…";
            if (fr) return "Recherche sur LRCLIB…";
            return "Searching LRCLIB…";
        }
        if ("no_loaded".equals(key)) {
            if (ar) return "لا توجد كلمات بعد";
            if (fr) return "Aucune parole chargée";
            return "No lyrics loaded yet";
        }
        if ("no_fallback".equals(key)) {
            if (ar) return "لا يوجد بديل لهذه الأغنية";
            if (fr) return "Aucune alternative pour ce titre";
            return "No fallback active for this song";
        }
        if ("hint_artist".equals(key)) {
            if (ar) return "الفنان";
            if (fr) return "Artiste";
            return "Artist";
        }
        if ("hint_title".equals(key)) {
            if (ar) return "العنوان";
            if (fr) return "Titre";
            return "Title";
        }
        if ("clear_cache".equals(key)) {
            if (ar) return "مسح الكلمات المحفوظة";
            if (fr) return "Effacer les paroles en cache";
            return "Clear cached lyrics";
        }
        if ("search".equals(key)) {
            if (ar) return "البحث في LRCLIB";
            if (fr) return "Chercher sur LRCLIB";
            return "Search LRCLIB";
        }
        if ("dialog_title".equals(key)) {
            if (ar) return "مصدر الكلمات";
            if (fr) return "Source des paroles";
            return "Lyrics source";
        }
        if ("retry".equals(key)) {
            if (ar) return "إعادة المحاولة";
            if (fr) return "Réessayer";
            return "Retry";
        }
        if ("show_plain".equals(key)) {
            if (ar) return "عرض بدون توقيت";
            if (fr) return "Afficher sans synchro";
            return "Show plain";
        }
        if ("show_synced".equals(key)) {
            if (ar) return "عرض بالتوقيت";
            if (fr) return "Afficher synchronisé";
            return "Show synced";
        }
        if ("server_version".equals(key)) {
            if (ar) return "نسخة السيرفر";
            if (fr) return "Version du serveur";
            return "Server version";
        }
        if ("pick".equals(key)) {
            if (ar) return "اختر الكلمات";
            if (fr) return "Choisir les paroles";
            return "Pick lyrics";
        }
        if ("no_results".equals(key)) {
            if (ar) return "لا نتائج في LRCLIB";
            if (fr) return "Aucun résultat LRCLIB";
            return "No LRCLIB results";
        }
        if ("empty_record".equals(key)) {
            if (ar) return "تسجيلة فارغة، اختر غيرها";
            if (fr) return "Entrée vide, choisis-en une autre";
            return "Empty record, pick another";
        }
        if ("no_match".equals(key)) {
            if (ar) return "لا تطابق، نبقي الكلمات الحالية";
            if (fr) return "Aucune correspondance, on garde les paroles actuelles";
            return "No match, keeping current lyrics";
        }
        if ("cache_cleared".equals(key)) {
            if (ar) return "تم مسح الكلمات المحفوظة";
            if (fr) return "Paroles en cache effacées";
            return "Cached lyrics cleared";
        }
        if ("instrumental".equals(key)) {
            if (ar) return "موسيقية";
            if (fr) return "Instrumental";
            return "Instrumental";
        }
        return key;
    }

    // ================= cache =================

    private static final class Cached {
        boolean miss;
        long ts;
        String plain;
        String synced;
        String queryUsed = "";
        String source = "";
    }

    private static String cacheKey(SongInfo song) {
        // ID-primary: the server can return slightly different artist/title
        // strings for the same song across sessions (feat. variants,
        // parens). Keying on the stable song id means a cached LRCLIB
        // result keeps winning over future truncated teasers for that song.
        if (song.id != null && !song.id.isEmpty()) return song.id + "|" + KEY_VERSION;
        return song.id + "|" + normalize(song.artist, true)
                + "|" + normalize(song.title, true) + "|" + KEY_VERSION;
    }

    private static String legacyCacheKey(SongInfo song) {
        return song.id + "|" + normalize(song.artist, true)
                + "|" + normalize(song.title, true) + "|" + KEY_VERSION;
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Cached readCache(Context ctx, String key) {
        try {
            String raw = prefs(ctx).getString(key, null);
            if (raw == null) return null;
            JSONObject j = new JSONObject(raw);
            Cached c = new Cached();
            c.ts = j.optLong("ts", 0);
            long age = System.currentTimeMillis() - c.ts;
            if (j.optBoolean("miss", false)) {
                if (age > NEG_TTL_MS) return null;
                c.miss = true;
                return c;
            }
            if (age > POS_TTL_MS) return null;
            c.plain = j.isNull("plain") ? null : j.optString("plain", null);
            c.synced = j.isNull("synced") ? null : j.optString("synced", null);
            c.queryUsed = j.optString("queryUsed", "");
            c.source = j.optString("source", "");
            if (c.plain == null && c.synced == null) return null;
            return c;
        } catch (Exception e) {
            return null;
        }
    }

    private static void writeCache(Context ctx, String key, JSONObject j) {
        try {
            SharedPreferences.Editor ed = prefs(ctx).edit();
            ed.putString(key, j.toString());
            ed.apply();
            trimCache(ctx);
        } catch (Exception e) {
            Log.d(TAG, "cache write failed: " + e);
        }
    }

    private static void writeNegativeCache(Context ctx, String key) {
        try {
            JSONObject j = new JSONObject();
            j.put("miss", true);
            j.put("ts", System.currentTimeMillis());
            writeCache(ctx, key, j);
        } catch (Exception ignored) {
        }
    }

    private static void writePositiveCache(Context ctx, String key, Result r) {
        try {
            JSONObject j = new JSONObject();
            j.put("ts", System.currentTimeMillis());
            j.put("plain", r.plain);
            j.put("synced", r.synced);
            j.put("queryUsed", r.queryUsed);
            j.put("source", r.source);
            writeCache(ctx, key, j);
        } catch (Exception ignored) {
        }
    }

    private static void trimCache(Context ctx) {
        try {
            SharedPreferences p = prefs(ctx);
            Map<String, ?> all = p.getAll();
            if (all.size() <= MAX_ENTRIES) return;
            List<Map.Entry<String, Long>> ages = new ArrayList<Map.Entry<String, Long>>();
            for (Map.Entry<String, ?> e : all.entrySet()) {
                long ts = 0;
                try {
                    ts = new JSONObject(String.valueOf(e.getValue())).optLong("ts", 0);
                } catch (Exception ignored) {
                }
                ages.add(new java.util.AbstractMap.SimpleEntry<String, Long>(e.getKey(), ts));
            }
            Collections.sort(ages, new Comparator<Map.Entry<String, Long>>() {
                @Override
                public int compare(Map.Entry<String, Long> a, Map.Entry<String, Long> b) {
                    return Long.compare(a.getValue(), b.getValue());
                }
            });
            SharedPreferences.Editor ed = p.edit();
            for (int i = 0; i < ages.size() - MAX_ENTRIES; i++) ed.remove(ages.get(i).getKey());
            ed.apply();
        } catch (Exception ignored) {
        }
    }

    // ================= LRCLIB waterfall =================

    private static final class Result {
        String plain;
        String synced;
        String queryUsed = "";
        String source = "";
    }

    private static Result waterfall(SongInfo song) {
        String[] variants = new String[]{
                normalize(song.title, true), normalize(song.title, false)};
        String artist = normalize(song.artist, true);
        String artistFull = normalize(song.artist, false);
        String dur = song.hasDuration ? String.valueOf(Math.round(song.duration)) : null;

        // 1-2. Exact /api/get, title + artist (+ duration), both variants.
        for (String tv : variants) {
            for (String av : new String[]{artist, artistFull}) {
                if (tv.isEmpty()) continue;
                Result r = apiGet(tv, av, dur);
                if (r != null) return r;
                if (r == null && dur != null) {
                    r = apiGet(tv, av, null);
                    if (r != null) return r;
                }
            }
        }
        // 3. Fielded search + scoring.
        Result r = apiSearchFielded(
                normalize(song.title, true), normalize(song.artist, true),
                song.hasDuration ? song.duration : -1);
        if (r != null) return r;
        // 4. q-style, title then artist.
        return apiSearchQ(
                normalize(song.title, true), normalize(song.artist, true),
                song.hasDuration ? song.duration : -1);
    }

    private static String enc(String s) {
        try {
            return URLEncoder.encode(s, "UTF-8");
        } catch (Exception e) {
            return "";
        }
    }

    private static String httpGet(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setRequestMethod("GET");
        c.setRequestProperty("User-Agent", UA);
        c.setRequestProperty("Accept", "application/json");
        c.setConnectTimeout(HTTP_TIMEOUT_MS);
        c.setReadTimeout(HTTP_TIMEOUT_MS);
        int code = c.getResponseCode();
        if (code == 404) return null; // clean miss (TrackNotFound).
        if (code == 503) throw new RateLimited();
        if (code < 200 || code >= 300) return null;
        InputStream in = c.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(in, "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) sb.append(line).append('\n');
        br.close();
        return sb.toString();
    }

    private static final class RateLimited extends RuntimeException {
    }

    private static Result fromGetJson(String body, String queryUsed) {
        try {
            if (body == null) return null;
            return fromRecord(new JSONObject(body), queryUsed, "get");
        } catch (RateLimited rl) {
            throw rl;
        } catch (Exception e) {
            return null;
        }
    }

    private static Result apiGet(String track, String artist, String duration) {
        try {
            if (track.isEmpty() || artist.isEmpty()) return null;
            StringBuilder u = new StringBuilder(SOURCE_URL)
                    .append("/api/get?track_name=").append(enc(track))
                    .append("&artist_name=").append(enc(artist));
            if (duration != null) u.append("&duration=").append(enc(duration));
            String q = "get track=" + track + " artist=" + artist
                    + (duration != null ? " dur=" + duration : "");
            return fromGetJson(httpGet(u.toString()), q);
        } catch (RateLimited rl) {
            throw rl; // abort the whole waterfall; transient, no negative cache.
        } catch (Exception e) {
            return null;
        }
    }

    private static Result fromRecord(JSONObject o, String queryUsed, String source) {
        boolean instrumental = o.optBoolean("instrumental", false);
        String synced = o.isNull("syncedLyrics") ? null : o.optString("syncedLyrics", null);
        String plain = o.isNull("plainLyrics") ? null : o.optString("plainLyrics", null);
        if (!instrumental) {
            try {
                JSONObject file = o.optJSONObject("lyricsfile");
                if (file == null && o.has("lyricsfile") && !o.isNull("lyricsfile")) {
                    // lyricsfile may arrive as a YAML-ish string; only metadata flag matters.
                    String lf = o.optString("lyricsfile", "");
                    if (lf.contains("instrumental: true")) instrumental = true;
                } else if (file != null) {
                    JSONObject meta = file.optJSONObject("metadata");
                    if (meta != null && meta.optBoolean("instrumental", false)) instrumental = true;
                }
            } catch (Exception ignored) {
            }
        }
        if (instrumental) {
            Result r = new Result();
            r.queryUsed = queryUsed;
            r.source = source;
            r.plain = tr("instrumental");
            r.synced = null;
            return r;
        }
        if ((synced == null || synced.isEmpty()) && (plain == null || plain.isEmpty())) return null;
        Result r = new Result();
        r.queryUsed = queryUsed;
        r.source = source;
        r.plain = plain;
        r.synced = synced;
        return r;
    }

    private static Result apiSearchFielded(String track, String artist, float duration) {
        try {
            if (track.isEmpty()) return null;
            String u = SOURCE_URL + "/api/search?track_name=" + enc(track)
                    + (artist.isEmpty() ? "" : "&artist_name=" + enc(artist));
            String body = httpGet(u);
            if (body == null) return null;
            return pickFirst(new JSONArray(body),
                    "search track=" + track + " artist=" + artist);
        } catch (Exception e) {
            return null;
        }
    }

    private static Result apiSearchQ(String track, String artist, float duration) {
        try {
            if (track.isEmpty()) return null;
            String q = (track + (artist.isEmpty() ? "" : " " + artist)).trim();
            String body = httpGet(SOURCE_URL + "/api/search?q=" + enc(q));
            if (body == null) return null;
            return pickFirst(new JSONArray(body), "search q=" + q);
        } catch (Exception e) {
            return null;
        }
    }

    private static Result apiGetById(long id) {
        try {
            String body = httpGet(SOURCE_URL + "/api/get/" + id);
            return fromGetJson(body, "get id=" + id);
        } catch (Exception e) {
            return null;
        }
    }

    /** Auto-pick: first result with usable lyrics wins, no score threshold. */
    private static Result pickFirst(JSONArray arr, String queryUsed) {
        try {
            for (int i = 0; i < arr.length(); i++) {
                JSONObject o = arr.optJSONObject(i);
                if (o == null) continue;
                Result r = fromRecord(o, queryUsed, "search");
                if (r != null) return r;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    /** Ordered unique candidates for the manual picker dialog. */
    static List<JSONObject> searchCandidates(String track, String artist) {
        List<JSONObject> out = new ArrayList<JSONObject>();
        java.util.HashSet<Long> seen = new java.util.HashSet<Long>();
        String[] bodies = new String[2];
        try {
            if (!track.isEmpty()) {
                bodies[0] = httpGet(SOURCE_URL + "/api/search?track_name=" + enc(track)
                        + (artist.isEmpty() ? "" : "&artist_name=" + enc(artist)));
                String q = (track + (artist.isEmpty() ? "" : " " + artist)).trim();
                bodies[1] = httpGet(SOURCE_URL + "/api/search?q=" + enc(q));
            }
        } catch (Exception e) {
            return out;
        }
        for (String body : bodies) {
            if (body == null) continue;
            try {
                JSONArray arr = new JSONArray(body);
                for (int i = 0; i < arr.length() && out.size() < 12; i++) {
                    JSONObject o = arr.optJSONObject(i);
                    if (o == null) continue;
                    long id = o.optLong("id", -1);
                    if (id < 0 || !seen.add(id)) continue;
                    out.add(o);
                }
            } catch (Exception ignored) {
            }
        }
        return out;
    }

    static String candidateLabel(JSONObject o) {
        String t = o.optString("trackName", "?");
        String a = o.optString("artistName", "?");
        double d = o.optDouble("duration", -1);
        String dur = "";
        if (d > 0) {
            int s = (int) d;
            dur = " (" + (s / 60) + ":" + String.format(Locale.ROOT, "%02d", s % 60) + ")";
        }
        return t + " — " + a + dur;
    }

    // ================= LRC -> LyricsLine =================

    private static final Pattern LRC_TAG =
            Pattern.compile("\\[(\\d{1,3}):(\\d{2})(?:[.:](\\d{2,3}))?\\]");
    private static final Pattern LRC_META =
            Pattern.compile("^\\[(ti|ar|al|length|by|offset|re|ve):", Pattern.CASE_INSENSITIVE);

    private static final class Line {
        int ms;
        String text;
    }

    static List<Line> parseLrc(String lrc) {
        List<Line> out = new ArrayList<Line>();
        if (lrc == null) return out;
        for (String raw : lrc.split("\\r?\\n")) {
            String line = raw.trim();
            if (line.isEmpty() || LRC_META.matcher(line).find()) continue;
            Matcher m = LRC_TAG.matcher(line);
            List<Integer> times = new ArrayList<Integer>();
            int end = 0;
            while (m.find()) {
                int mm = Integer.parseInt(m.group(1));
                int ss = Integer.parseInt(m.group(2));
                int frac = 0;
                String f = m.group(3);
                if (f != null) frac = f.length() == 2
                        ? Integer.parseInt(f) * 10 : Integer.parseInt(f);
                times.add((mm * 60 + ss) * 1000 + frac);
                end = m.end();
            }
            if (times.isEmpty()) continue;
            String text = line.substring(end).trim();
            if (text.isEmpty()) continue;
            for (int ms : times) {
                Line l = new Line();
                l.ms = ms;
                l.text = text;
                out.add(l);
            }
        }
        Collections.sort(out, new Comparator<Line>() {
            @Override
            public int compare(Line a, Line b) {
                return Integer.compare(a.ms, b.ms);
            }
        });
        return out;
    }

    // ================= render =================

    private static void remember(String queryUsed, String source, String plain, String synced) {
        synchronized (LrclibFallback.class) {
            lastQueryUsed = queryUsed == null ? "" : queryUsed;
            lastSource = source == null ? "" : source;
            lastPlain = plain;
            lastSynced = synced;
        }
    }

    private static void renderOnMain(final Context ctx, final Object songObj,
                                     final Object callbackObj, final String plain,
                                     final String synced, final String queryUsed,
                                     final boolean toast) {
        // Idempotence: repeated API callbacks for the same song must not
        // re-render (and scroll-jump) an already-shown identical result.
        final String key;
        try {
            Object id = getFieldUp(songObj, "id");
            key = String.valueOf(id) + "|" + (plain == null ? 0 : plain.hashCode())
                    + "|" + (synced == null ? 0 : synced.hashCode())
                    + "|" + lastPreferSynced;
        } catch (Exception e) {
            return;
        }
        synchronized (LrclibFallback.class) {
            if (key.equals(renderedKeys.get(callbackObj))) {
                Log.d(TAG, "duplicate render skipped (" + queryUsed + ")");
                return;
            }
            renderedKeys.put(callbackObj, key);
        }
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                try {
                    Object response = buildResponse(songObj, plain, synced);
                    if (response == null) return;
                    List<Object> lines = buildLines(response, plain, synced);
                    invokeRender(callbackObj, songObj, lines, response);
                    Log.d(TAG, "fallback applied (" + queryUsed + ")");
                } catch (Throwable t) {
                    Log.d(TAG, "render failed: " + t);
                }
            }
        });
    }

    private static Object buildResponse(Object songObj, String plain, String synced) {
        try {
            Class<?> rc = Class.forName("com.anghami.ghost.api.response.LyricsResponse");
            Object r = rc.newInstance();
            Field f;
            f = fieldUp(rc, "songId");
            if (f != null) f.set(r, getFieldUp(songObj, "id"));
            boolean wantSynced = lastPreferSynced && synced != null && !synced.isEmpty();
            if (!wantSynced && (plain == null || plain.isEmpty()) && synced != null) {
                wantSynced = true; // only synced available.
            }
            if (wantSynced) {
                f = fieldUp(rc, "lyricsSynced");
                if (f != null) f.set(r, new ArrayList<Object>());
                f = fieldUp(rc, "isSynced");
                if (f != null) f.setBoolean(r, true);
            } else {
                f = fieldUp(rc, "lyricsUnsynced");
                if (f != null) f.set(r, plain);
                f = fieldUp(rc, "isSynced");
                if (f != null) f.setBoolean(r, false);
            }
            f = fieldUp(rc, "truncated");
            if (f != null) f.setBoolean(r, false);
            return r;
        } catch (Throwable t) {
            Log.d(TAG, "buildResponse failed: " + t);
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    private static List<Object> buildLines(Object response, String plain, String synced) {
        List<Object> out = new ArrayList<Object>();
        try {
            List<Line> parsed = parseLrc(synced);
            Class<?> lc = Class.forName("com.anghami.ghost.pojo.LyricsLine");
            if (!parsed.isEmpty() && (lastPreferSynced || plain == null || plain.isEmpty())) {
                int id = 0;
                int prev = -1;
                for (Line l : parsed) {
                    Object o = lc.newInstance();
                    setLineField(o, "line", l.text);
                    setLineField(o, "milliseconds", l.ms);
                    setLineField(o, "id", id++);
                    setLineField(o, "isActive", id <= 1 || prev < l.ms);
                    prev = l.ms;
                    out.add(o);
                }
            } else if (plain != null) {
                for (String s : plain.split("\\r?\\n")) {
                    Object o = lc.newInstance();
                    setLineField(o, "line", s);
                    setLineField(o, "milliseconds", -1);
                    setLineField(o, "id", out.size());
                    setLineField(o, "isActive", true);
                    out.add(o);
                }
            }
        } catch (Throwable t) {
            Log.d(TAG, "buildLines failed: " + t);
        }
        return out;
    }

    private static void setLineField(Object o, String name, Object value) {
        try {
            Field f = fieldUp(o.getClass(), name);
            if (f == null) return;
            if (value instanceof Integer) f.setInt(o, (Integer) value);
            else if (value instanceof Boolean) f.setBoolean(o, (Boolean) value);
            else f.set(o, value);
        } catch (Exception ignored) {
        }
    }

    private static void invokeRender(Object callbackObj, Object songObj,
                                     List<Object> lines, Object response) {
        try {
            for (Method m : callbackObj.getClass().getMethods()) {
                if (!m.getName().equals("V") || m.getParameterTypes().length != 3) continue;
                Class<?>[] pt = m.getParameterTypes();
                if (pt[1].isAssignableFrom(List.class)
                        && pt[0].isInstance(songObj) && pt[2].isInstance(response)) {
                    m.invoke(callbackObj, songObj, lines, response);
                    return;
                }
            }
            Log.d(TAG, "render method V not found on callback");
        } catch (Throwable t) {
            Log.d(TAG, "invokeRender failed: " + t);
        }
    }

    // ================= options dialog =================

    /** Options dialog for an already-resolved song (play-button entry). */
    private static void showOptionsForSong(Context ctx, Object song) {
        synchronized (LrclibFallback.class) {
            if (System.currentTimeMillis() - lastDialogMs < 2000) return;
            lastDialogMs = System.currentTimeMillis();
        }
        final Object callback;
        final Object original;
        final String query;
        final String source;
        final String plain;
        final String synced;
        synchronized (LrclibFallback.class) {
            callback = lastCallback;
            original = lastOriginalResponse;
            query = lastQueryUsed;
            source = lastSource;
            plain = lastPlain;
            synced = lastSynced;
        }
        if (song == null || callback == null) {
            Toast.makeText(ctx, tr("no_fallback"), Toast.LENGTH_SHORT).show();
            return;
        }
        SongInfo info;
        try {
            info = readSong(song);
        } catch (Exception e) {
            return;
        }
        // Freshness: the last-render globals (source/query/plain/synced/
        // original) may belong to a different (pre-cached/next) song than
        // the long-pressed one. The artist/title fields are always filled
        // from the mapped song; the synced/plain toggle and server-version
        // restore are only offered when the globals match this song.
        boolean fresh = false;
        try {
            Object mappedId = getFieldUp(song, "id");
            Object lastId = lastSong == null ? null : getFieldUp(lastSong, "id");
            fresh = mappedId != null && mappedId.equals(lastId)
                    && callback == lastCallback;
        } catch (Exception ignored) {
        }

        LinearLayout layout = new LinearLayout(ctx);
        layout.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (16 * ctx.getResources().getDisplayMetrics().density);
        layout.setPadding(pad, pad / 2, pad, 0);
        final EditText artistEdit = new EditText(ctx);
        artistEdit.setHint(tr("hint_artist"));
        artistEdit.setText(info.artist);
        final EditText titleEdit = new EditText(ctx);
        titleEdit.setHint(tr("hint_title"));
        titleEdit.setText(info.title);
        layout.addView(artistEdit);
        layout.addView(titleEdit);
        final android.widget.Button clearBtn = new android.widget.Button(ctx);
        clearBtn.setText(tr("clear_cache"));
        layout.addView(clearBtn);
        final android.widget.Button searchBtn = new android.widget.Button(ctx);
        searchBtn.setText(tr("search"));
        layout.addView(searchBtn);

        AlertDialog.Builder b = new AlertDialog.Builder(ctx);
        b.setTitle(tr("dialog_title"));
        b.setView(layout);
        b.setPositiveButton(tr("retry"), null); // overridden below to avoid auto-dismiss.
        if (fresh && plain != null && synced != null
                && !plain.isEmpty() && !synced.isEmpty()) {
            b.setNeutralButton(lastPreferSynced ? tr("show_plain") : tr("show_synced"), null);
        }
        if (fresh) {
            b.setNegativeButton(tr("server_version"), null);
        }
        final AlertDialog dialog = b.create();
        dialog.show();
        searchBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Lowercased: LRCLIB matching is case-sensitive enough
                // that mixed-case artist/title variants miss; normalize()
                // lowercases too, this keeps the dialog path explicit.
                final String a = artistEdit.getText().toString().trim().toLowerCase(Locale.ROOT);
                final String t = titleEdit.getText().toString().trim().toLowerCase(Locale.ROOT);
                if (a.isEmpty() && t.isEmpty()) return;
                dialog.dismiss();
                final Context c = v.getContext();
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        final List<JSONObject> found =
                                searchCandidates(normalize(t, true), normalize(a, true));
                        new Handler(Looper.getMainLooper()).post(new Runnable() {
                            @Override
                            public void run() {
                                if (found.isEmpty()) {
                                    Toast.makeText(c, tr("no_results"),
                                            Toast.LENGTH_SHORT).show();
                                    return;
                                }
                                final String[] labels = new String[found.size()];
                                for (int i = 0; i < found.size(); i++) {
                                    labels[i] = candidateLabel(found.get(i));
                                }
                                new AlertDialog.Builder(c)
                                        .setTitle(tr("pick"))
                                        .setItems(labels, new android.content.DialogInterface.OnClickListener() {
                                            @Override
                                            public void onClick(android.content.DialogInterface d, int which) {
                                                final long id = found.get(which).optLong("id", -1);
                                                if (id < 0) return;
                                                new Thread(new Runnable() {
                                                    @Override
                                                    public void run() {
                                                        Result r = apiGetById(id);
                                                        if (r == null) {
                                                            new Handler(Looper.getMainLooper()).post(new Runnable() {
                                                                @Override
                                                                public void run() {
                                                                    Toast.makeText(c, tr("empty_record"),
                                                                            Toast.LENGTH_SHORT).show();
                                                                }
                                                            });
                                                            return;
                                                        }
                                                        // The user's pick wins and sticks:
                                                        // cached, so future opens load it directly.
                                                        try {
                                                            writePositiveCache(c, cacheKey(readSong(song)), r);
                                                        } catch (Exception ignored) {
                                                        }
                                                        remember(r.queryUsed, r.source, r.plain, r.synced);
                                                        renderOnMain(c.getApplicationContext() != null
                                                                ? c.getApplicationContext() : c,
                                                                song, callback, r.plain, r.synced,
                                                                r.queryUsed, true);
                                                    }
                                                }).start();
                                            }
                                        })
                                        .show();
                            }
                        });
                    }
                }).start();
            }
        });
        clearBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    Context c = v.getContext();
                    prefs(c).edit().clear().apply();
                    Toast.makeText(c, tr("cache_cleared"), Toast.LENGTH_SHORT).show();
                    Log.d(TAG, "fallback cache cleared by user");
                } catch (Throwable t) {
                    Log.d(TAG, "clear cache failed: " + t);
                }
                dialog.dismiss();
            }
        });
        if (dialog.getButton(AlertDialog.BUTTON_POSITIVE) != null) {
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    final String a = artistEdit.getText().toString().trim().toLowerCase(Locale.ROOT);
                    final String t = titleEdit.getText().toString().trim().toLowerCase(Locale.ROOT);
                    if (a.isEmpty() || t.isEmpty()) return;
                    dialog.dismiss();
                    final Context c = v.getContext();
                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            SongInfo s = new SongInfo();
                            try {
                                s.id = String.valueOf(getFieldUp(song, "id"));
                            } catch (Exception ignored) {
                            }
                            s.artist = a;
                            s.title = t;
                            Result r;
                            try {
                                r = waterfall(s);
                            } catch (Throwable th) {
                                Log.d(TAG, "retry waterfall failed: " + th);
                                r = null;
                            }
                            if (r == null) {
                                new Handler(Looper.getMainLooper()).post(new Runnable() {
                                    @Override
                                    public void run() {
                                        Toast.makeText(c, tr("no_match"),
                                                Toast.LENGTH_SHORT).show();
                                    }
                                });
                                return;
                            }
                            remember(r.queryUsed, r.source, r.plain, r.synced);
                            // Retry wins and sticks: cache under the song id so
                            // future opens load it instead of the truncated teaser.
                            try {
                                SongInfo orig = readSong(song);
                                writePositiveCache(c.getApplicationContext() != null
                                        ? c.getApplicationContext() : c,
                                        cacheKey(orig), r);
                            } catch (Exception ignored) {
                            }
                            renderOnMain(c.getApplicationContext() != null
                                    ? c.getApplicationContext() : c,
                                    song, callback, r.plain, r.synced, r.queryUsed, false);
                        }
                    }).start();
                }
            });
        }
        if (dialog.getButton(AlertDialog.BUTTON_NEUTRAL) != null) {
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    synchronized (LrclibFallback.class) {
                        lastPreferSynced = !lastPreferSynced;
                    }
                    dialog.dismiss();
                    renderOnMain(v.getContext(), song, callback, plain, synced, query, false);
                }
            });
        }
        if (dialog.getButton(AlertDialog.BUTTON_NEGATIVE) != null) {
            dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                    if (original == null) return;
                    // Re-render the server teaser from the kept original response.
                    String oPlain = getString(original, "lyricsUnsynced");
                    renderOnMain(v.getContext(), song, callback, oPlain, null, "server", false);
                }
            });
        }
    }
}
