package app.ayham.extension.music.features;

import android.content.Context;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Full offline: when YT's native download saves a song, the rest of what its player shows is
 * saved with it, so a downloaded song looks the same with no network:
 * <ul>
 *   <li>its lyrics, from Morphe's providers in the user's order, into Morphe's own lyrics store
 *   (the same track key Morphe's player uses: YT Music's title and artist, cleaned by Morphe);</li>
 *   <li>its animated art clip, into the app's files (not the 80 MB cache), saved against the
 *   video id so the canvas finds it offline;</li>
 *   <li>its video type, for the song-version and automix rules.</li>
 * </ul>
 * YT saves the thumbnail and the player data itself. Two songs at a time in the background (a
 * whole playlist saved at once would otherwise ask every server for every song at once), once per run.
 */
final class OfflineExtras {
    private static final String TAG = "AyhamDownloads";
    private static final String LYRICS = "app.morphe.extension.music.patches.lyrics.";
    private static final Set<String> done = ConcurrentHashMap.newKeySet();
    private static final java.util.concurrent.ExecutorService worker =
            java.util.concurrent.Executors.newFixedThreadPool(2, r -> new Thread(r, "ayham-offline-extras"));

    private OfflineExtras() {
    }

    /** Called when YT's offline engine saves [videoId], with the popup's answer (or the switch's defaults). */
    static void saved(String videoId, DownloadChoice.Choice ch) {
        Context c = Features.appContext;
        if (c == null || videoId == null || videoId.isEmpty() || !done.add(videoId)) return;
        worker.execute(() -> {
            OfflineIndex.touch(c, videoId);
            try {
                JSONObject d = null;
                for (int t = 1; ; t++) {
                    // the popup's answer is used once: a failed lookup is tried again here, not at a later save
                    try {
                        d = details(videoId);
                        if (!d.optString("title", "").isEmpty()) break;
                    } catch (Exception e) {
                        if (t >= 3) throw e;
                    }
                    if (t >= 3) break;
                    Log.i(TAG, "offline extras " + videoId + ": YT's details not there, tried again (" + t + ")");
                    android.os.SystemClock.sleep(10_000L * t);
                }
                String title = d.optString("title", ""), artist = d.optString("author", "");
                int length = d.optInt("lengthSeconds", 0);
                String type = d.optString("musicVideoType", "");
                MusicVideoType.note(videoId, type);
                Log.i(TAG, "offline extras for " + videoId + ": '" + title + "' by '" + artist + "' (" + length + " s): " + ch);
                if (title.isEmpty()) return;
                if (ch.lossless) app.ayham.extension.music.addons.AddonDownloads.enqueue(c, videoId, title, artist,
                        type.contains("OMV") || type.contains("UGC"), ch.tier);
                if (ch.lyrics) Log.i(TAG, "offline extras " + videoId + ": lyrics " + lyrics(c, videoId, title, artist, length));
                if (ch.art) Log.i(TAG, "offline extras " + videoId + ": art clip " + clip(c, videoId, title, artist));
                if (ch.canvas) Log.i(TAG, "offline extras " + videoId + ": canvas " + canvas(c, videoId, title, artist));
            } catch (Throwable t) {
                done.remove(videoId); // asked again on the next save
                Log.w(TAG, "offline extras failed for " + videoId, t);
            }
        });
    }

    /** YT Music's own title / artist / length / type for the video (the WEB_REMIX player data). */
    private static JSONObject details(String videoId) throws Exception {
        JSONObject body = new JSONObject().put("videoId", videoId).put("context", new JSONObject()
                .put("client", new JSONObject().put("clientName", "WEB_REMIX").put("clientVersion", "1.20251101.01.00")
                        .put("hl", "en").put("gl", "US")));
        HttpURLConnection h = (HttpURLConnection) new URL("https://music.youtube.com/youtubei/v1/player?prettyPrint=false").openConnection();
        h.setConnectTimeout(10_000);
        h.setReadTimeout(15_000);
        h.setDoOutput(true);
        h.setRequestProperty("Content-Type", "application/json");
        // a failed send lets the connection go too (the read below has its own finally)
        try (OutputStream out = h.getOutputStream()) {
            out.write(body.toString().getBytes(StandardCharsets.UTF_8));
        } catch (Exception e) {
            h.disconnect();
            throw e;
        }
        try (InputStream in = h.getInputStream()) {
            JSONObject d = new JSONObject(readCapped(in, MAX_DETAILS_BYTES)).optJSONObject("videoDetails");
            return d == null ? new JSONObject() : d;
        } finally {
            h.disconnect();
        }
    }

    /** The player answer's size limit: it is a few hundred KB; anything far bigger is not read into memory. */
    static final int MAX_DETAILS_BYTES = 4 * 1024 * 1024;

    /** The stream as UTF-8 text; an IOException once it passes [max] bytes. */
    static String readCapped(InputStream in, int max) throws java.io.IOException {
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        byte[] b = new byte[16384];
        int n;
        while ((n = in.read(b)) > 0) {
            if (buf.size() + n > max) throw new java.io.IOException("response over " + max / 1024 + " KB");
            buf.write(b, 0, n);
        }
        return buf.toString("UTF-8");
    }

    /**
     * Morphe's own lyrics prefetch, for this song: its search providers in the user's order, the
     * first valid answer stored in its lyrics store under the track key its player looks up.
     */
    private static String lyrics(Context c, String videoId, String title, String artist, int length) throws Exception {
        Class<?> settings = Class.forName("app.morphe.extension.music.settings.Settings");
        Object enabled = settings.getField("LYRICS_ENABLED").get(null);
        if (!(boolean) enabled.getClass().getMethod("get").invoke(enabled)) return "skipped (Morphe's lyrics are off)";
        Object source = settings.getField("LYRICS_SOURCE").get(null);
        String order = (String) source.getClass().getMethod("get").invoke(source);
        Class<?> providersType = Class.forName(LYRICS + "LyricsProviders");
        List<?> providers = (List<?>) providersType.getMethod("searchableProviders", List.class)
                .invoke(null, providersType.getMethod("providersInOrder", String.class).invoke(null, order));
        String[] clean = (String[]) Class.forName(LYRICS + "model.MetadataCleaner")
                .getMethod("parseCleanTitleAndArtist", String.class, String.class).invoke(null, title, artist);
        Class<?> trackType = Class.forName(LYRICS + "model.TrackInfo");
        Object track = trackType.getConstructor(String.class, String.class, String.class, int.class)
                .newInstance(clean[1], clean[0], "", length);
        Class<?> lyricsType = Class.forName(LYRICS + "model.Lyrics");
        Class<?> match = Class.forName(LYRICS + "LyricsMatch");
        Class<?> cache = Class.forName(LYRICS + "storage.LyricsCache");
        Method fetch = Class.forName(LYRICS + "requests.LyricsProvider").getMethod("fetch", trackType);
        Object notFound = lyricsType.getField("NOT_FOUND").get(null);
        for (Object p : providers) {
            Object r;
            try {
                r = fetch.invoke(p, track);
            } catch (Throwable t) {
                continue;
            }
            if (r == null) continue;
            Object l = r.getClass().getMethod("lyrics").invoke(r);
            if (l == null || l == notFound) continue;
            if (!(boolean) match.getMethod("isValidLyrics", lyricsType, trackType).invoke(null, l, track)) continue;
            String src = (String) match.getMethod("cacheSourceFor", lyricsType).invoke(null, l);
            cache.getMethod("put", trackType, String.class, lyricsType, String.class).invoke(null, track, src, l, null);
            keepLyrics(c, videoId, cache, trackType, track, src);
            return "saved from " + p.getClass().getSimpleName() + " for '" + clean[0] + " - " + clean[1] + "'";
        }
        return "none found";
    }

    /**
     * Our copy of Morphe's lyrics file (its cache keeps a set number and trims the oldest), put
     * back at start when trimmed; noted so deleting the song deletes both.
     */
    private static void keepLyrics(Context c, String videoId, Class<?> cache, Class<?> trackType, Object track, String src) {
        try {
            Method key = cache.getDeclaredMethod("key", trackType, String.class);
            Method file = cache.getDeclaredMethod("cacheFile", String.class);
            key.setAccessible(true);
            file.setAccessible(true);
            File f = (File) file.invoke(null, key.invoke(null, track, src));
            if (f == null || !f.exists()) return;
            File copy = new File(OfflineIndex.dir(c), "lyrics/" + videoId + ".lrc");
            OfflineIndex.copy(f, copy);
            File raw = new File(f.getPath() + ".raw");
            if (raw.exists()) OfflineIndex.copy(raw, new File(copy.getPath() + ".raw"));
            OfflineIndex.note(c, videoId, OfflineIndex.LYRICS, f.getAbsolutePath() + "|" + copy.getAbsolutePath());
        } catch (Throwable t) {
            Log.w(TAG, "offline lyrics copy failed for " + videoId + ": " + t);
        }
    }

    /** The song's Spotify canvas, kept in files/ayham-offline/spotify (no cap) and saved against the video id. */
    private static String canvas(Context c, String videoId, String title, String artist) throws Exception {
        CanvasCache.init(c.getFilesDir());
        File f = SpotifyCanvas.find(title, artist, null, 0, new File(OfflineIndex.dir(c), "spotify"), false);
        if (f == null) return "none (no canvas)";
        CanvasCache.put(CanvasCache.spotifyIdKey(videoId), f.getAbsolutePath());
        OfflineIndex.note(c, videoId, OfflineIndex.CANVAS, f.getAbsolutePath());
        return f.getName() + " (" + f.length() / 1024 + " KB)";
    }

    /** Forgets that a song's extras were saved this run (its download was deleted: a new one saves them again). */
    static void forget(String videoId) {
        done.remove(videoId);
    }

    /** The Apple motion clip, kept in files/ayham-offline (no cap) and saved against the video id. */
    private static String clip(Context c, String videoId, String title, String artist) throws Exception {
        CanvasCache.init(c.getFilesDir());
        // the shape the player shows: tall with full-screen art, else square; the other when that fails
        String[] urls = AppleCanvas.find(title, artist, null, FullArt.on());
        if (urls == null) {
            CanvasCache.put(CanvasCache.idKey(videoId), null);
            return "none (no motion art)";
        }
        File f = null;
        Exception last = null;
        for (String url : urls) {
            if (f != null || url == null || !url.contains(".m3u8")) continue;
            try {
                // at the listener's Apple quality, as online (canvas.md §13 rule 5)
                f = HlsClip.fetch(url, new File(c.getFilesDir(), "ayham-offline"), 720, false, CanvasSettings.appleCap(Features.props()));
            } catch (Exception e) {
                last = e; // the other shape is still tried
            }
        }
        if (f == null) return "download failed" + (last == null ? "" : " (" + last.getMessage() + ")");
        CanvasCache.put(CanvasCache.idKey(videoId), f.getAbsolutePath());
        OfflineIndex.note(c, videoId, OfflineIndex.ART, f.getAbsolutePath());
        return f.getName() + " (" + f.length() / 1024 + " KB)";
    }
}
