package app.ayham.extension.music.features;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Two fixes around Morphe's lyrics, which pick a provider's result by title, artist and length only:
 * <ul>
 *   <li>Wrong-language matches: a provider can answer a song with the lyrics of another one, such as
 *   Chinese rap for an English song. Lyrics that are mostly Chinese characters are refused for a song
 *   whose title and artist have no CJK at all; the next provider's result is then used. Japanese
 *   (kana) and Korean (Hangul) lyrics are never refused, as their songs often have romanized names.</li>
 *   <li>"No lyrics" after a quick song change (an automix hands over mid-song): Morphe keeps a
 *   provider's miss on disk for good, so a lookup cut short by the change is never asked again.
 *   On "not found" the song is looked up once more, a few seconds later, past those saved misses.</li>
 * </ul>
 */
public final class LyricsGuard {
    private static final String TAG = "AyhamLyrics";
    private static final String LYRICS = "app.morphe.extension.music.patches.lyrics.";
    private static final long RETRY_DELAY_MS = 2000;
    private static final long BYPASS_MS = 20_000;

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final Set<String> retried = Collections.synchronizedSet(new HashSet<>());
    private static volatile String bypassVideo;
    private static volatile long bypassUntil;
    private static Object listener; // kept: Morphe holds it weakly or not at all after removal
    private static boolean listenFailed;
    private static Object notFound;

    private LyricsGuard() {
    }

    // ---- hooks ----

    /** Injection point: start of Morphe's LyricsMatch.isValidLyrics(lyrics, track): true refuses them. */
    public static boolean refuses(Object lyrics, Object track) {
        try {
            if (lyrics == null) return false;
            Object t = track != null ? track : currentTrack();
            if (t == null) return false;
            String title = (String) t.getClass().getMethod("title").invoke(t);
            String artist = (String) t.getClass().getMethod("artist").invoke(t);
            List<String> texts = texts(lyrics);
            if (!scriptMismatch(title, artist, texts)) return false;
            Log.i(TAG, "refused " + provider(lyrics) + " lyrics for '" + title + "' by '" + artist
                    + "': Chinese lyrics for a song with no CJK in its name");
            return true;
        } catch (Throwable e) {
            Log.w(TAG, "script check failed", e);
            return false;
        }
    }

    private static final ThreadLocal<Boolean> inGet = new ThreadLocal<>();
    private static Method cacheGet;

    /**
     * Injection point: start of Morphe's LyricsCache.get(track, source, videoId). Runs the real get
     * (the hook lets it through while this runs) and returns {filtered result}, or null to run the
     * original as it is (on any error).
     */
    public static Object[] aroundCacheGet(Object track, String source, String videoId) {
        if (Boolean.TRUE.equals(inGet.get())) return null;
        inGet.set(true);
        try {
            if (cacheGet == null) {
                Class<?> cache = Class.forName(LYRICS + "storage.LyricsCache");
                cacheGet = cache.getMethod("get", Class.forName(LYRICS + "model.TrackInfo"), String.class, String.class);
            }
            return new Object[]{cached(cacheGet.invoke(null, track, source, videoId), track, videoId)};
        } catch (Throwable t) {
            return null;
        } finally {
            inGet.remove();
        }
    }

    /** A saved wrong match is dropped, and a saved miss is skipped while this song is being looked up again. */
    static Object cached(Object lyrics, Object track, String videoId) {
        try {
            if (lyrics == null) return null;
            if (lyrics == notFound()) {
                String bypass = bypassVideo;
                boolean skip = bypass != null && bypass.equals(videoId) && System.currentTimeMillis() < bypassUntil;
                return skip ? null : lyrics;
            }
            return refuses(lyrics, track) ? null : lyrics;
        } catch (Throwable e) {
            return lyrics;
        }
    }

    // ---- the "not found" retry ----

    /** Called on the main thread while the player shows: registers the listener once. */
    static void listen() {
        if (listener != null || listenFailed) return;
        try {
            Class<?> managerClass = Class.forName(LYRICS + "LyricsManager");
            Class<?> listenerClass = Class.forName(LYRICS + "LyricsManager$Listener");
            Object manager = managerClass.getMethod("getInstance").invoke(null);
            listener = Proxy.newProxyInstance(listenerClass.getClassLoader(), new Class<?>[]{listenerClass}, (p, m, args) -> {
                if ("onLyricsChanged".equals(m.getName()) && args != null && args[0] != null) onState(args[0].toString());
                if ("hashCode".equals(m.getName())) return System.identityHashCode(p);
                if ("equals".equals(m.getName())) return p == args[0];
                if ("toString".equals(m.getName())) return "AyhamLyricsGuard";
                return null;
            });
            managerClass.getMethod("addListener", listenerClass).invoke(manager, listener);
            Log.i(TAG, "listening to Morphe's lyrics");
        } catch (Throwable t) {
            listenFailed = true;
            Log.w(TAG, "lyrics listener not added", t);
        }
    }

    private static void onState(String state) {
        if (!"NOT_FOUND".equals(state)) return;
        String video = currentVideo();
        if (video == null || video.isEmpty() || retried.contains(video)) return;
        // lyrics.md §11.7: offline no provider is asked, and the one retry is kept for when it's back
        if (Features.offline()) return;
        main.postDelayed(() -> retry(video), RETRY_DELAY_MS);
    }

    private static void retry(String video) {
        try {
            Object manager = Class.forName(LYRICS + "LyricsManager").getMethod("getInstance").invoke(null);
            Field stateField = manager.getClass().getDeclaredField("state");
            stateField.setAccessible(true);
            Object state = stateField.get(manager);
            if (state == null || !"NOT_FOUND".equals(state.toString())) return;
            if (Features.offline()) return; // went offline in the 2 s: the retry isn't spent
            if (!video.equals(currentVideo()) || !retried.add(video)) return;
            bypassVideo = video;
            bypassUntil = System.currentTimeMillis() + BYPASS_MS;
            Log.i(TAG, "no lyrics for " + video + ": looking it up once more, past the saved misses");
            manager.getClass().getMethod("reloadAfterSettingsChange").invoke(manager);
        } catch (Throwable t) {
            Log.w(TAG, "lyrics retry failed", t);
        }
    }

    // ---- the script check ----

    /**
     * True when the song's title and artist are written in Latin letters with no CJK at all, and more
     * than half its lyric lines hold Chinese characters (a one-line placeholder too), with no kana or Hangul lines. Counted by lines,
     * not letters: Chinese rap mixes in English words, and one character is a word, not a letter.
     */
    static boolean scriptMismatch(String title, String artist, List<String> lines) {
        // a missing name is no name, not the Latin word "null"
        int[] meta = count((title == null ? "" : title) + " " + (artist == null ? "" : artist));
        if (meta[0] + meta[1] + meta[2] > 0 || meta[3] == 0) return false;
        int sung = 0, chinese = 0, otherCjk = 0;
        for (String l : lines) {
            if (l == null) continue;
            int[] c = count(l);
            if (c[0] + c[1] + c[2] + c[3] + c[4] == 0) continue;
            sung++;
            if (c[1] + c[2] > 0) otherCjk++;
            else if (c[0] >= 2) chinese++;
        }
        return chinese * 2 > sung && otherCjk * 20 < sung;
    }

    /** Letters by script: {Han, kana, Hangul, Latin, other}. */
    static int[] count(String s) {
        int[] c = new int[5];
        for (int i = 0; i < s.length(); ) {
            int cp = s.codePointAt(i);
            i += Character.charCount(cp);
            if (!Character.isLetter(cp)) continue;
            Character.UnicodeScript script = Character.UnicodeScript.of(cp);
            switch (script) {
                case HAN: c[0]++; break;
                case HIRAGANA: case KATAKANA: c[1]++; break;
                case HANGUL: c[2]++; break;
                case LATIN: c[3]++; break;
                default: c[4]++;
            }
        }
        return c;
    }

    // ---- Morphe's objects, by reflection ----

    private static List<String> texts(Object lyrics) throws Exception {
        List<?> lines = (List<?>) lyrics.getClass().getMethod("lines").invoke(lyrics);
        List<String> out = new ArrayList<>();
        if (lines == null) return out;
        Method text = null;
        for (Object line : lines) {
            if (text == null) text = line.getClass().getMethod("text");
            out.add((String) text.invoke(line));
        }
        return out;
    }

    private static String provider(Object lyrics) {
        try {
            return (String) lyrics.getClass().getMethod("providerName").invoke(lyrics);
        } catch (Throwable t) {
            return "?";
        }
    }

    private static Object notFound() throws Exception {
        if (notFound == null) notFound = Class.forName(LYRICS + "model.Lyrics").getField("NOT_FOUND").get(null);
        return notFound;
    }

    private static Object currentTrack() {
        try {
            Object manager = Class.forName(LYRICS + "LyricsManager").getMethod("getInstance").invoke(null);
            return manager.getClass().getMethod("getCurrentTrack").invoke(manager);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String currentVideo() {
        try {
            Object manager = Class.forName(LYRICS + "LyricsManager").getMethod("getInstance").invoke(null);
            Field f = manager.getClass().getDeclaredField("currentVideoId");
            f.setAccessible(true);
            return (String) f.get(manager);
        } catch (Throwable t) {
            return null;
        }
    }
}
