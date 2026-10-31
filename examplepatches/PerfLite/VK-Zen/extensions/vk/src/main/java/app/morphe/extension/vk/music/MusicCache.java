package app.morphe.extension.vk.music;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Saves tracks as plain audio files when the user presses the native
 * "download" button. Hooked from MusicCachePatch into the music download
 * pipeline (MusicDownloadInteractorImpl.m).
 *
 * The hook receives a com.vk.dto.music.MusicTrack and everything is read
 * reflectively because VK classes are not on the extension classpath.
 */
public class MusicCache {

    private static final String TAG = "MorpheMusicCache";
    private static final String DIR_NAME = "VK Morphe";
    private static final int CONNECT_TIMEOUT = 15000;
    private static final int READ_TIMEOUT = 30000;

    /** Tracks already saved (or being saved) — avoids duplicate downloads. */
    private static final Set<String> SAVED_TRACK_IDS = ConcurrentHashMap.newKeySet();

    /** Single background worker so several downloads queue up serially. */
    private static final java.util.concurrent.ExecutorService EXECUTOR =
            java.util.concurrent.Executors.newSingleThreadExecutor();

    /**
     * Called (via injected hook) when the user presses the native track
     * "download" button. Receives com.vk.dto.music.MusicTrack reflectively.
     *
     * @param track MusicTrack instance (accessed reflectively)
     */
    public static void onDownloadRequested(Object track) {
        if (track == null) {
            return;
        }
        try {
            String trackId = readTrackId(track);
            String title = readStringField(track, "d");   // MusicTrack.d = title
            String artist = readStringField(track, "h");  // MusicTrack.h = artist
            if (trackId == null) {
                trackId = sanitize(artist) + "_" + sanitize(title);
            }
            if (!SAVED_TRACK_IDS.add(trackId)) {
                toast("Уже скачивается: " + sanitize(artist) + " - " + sanitize(title));
                return;
            }

            // Prefer a direct stream URL from audio_streams (mp3, then aac),
            // fall back to the main HLS url from the track.
            String url = pickStreamUrl(track);

            final String fTrackId = trackId;
            final String fTitle = title == null ? "Unknown" : title;
            final String fArtist = artist == null ? "Unknown Artist" : artist;
            final String fUrl = url;
            if (fUrl == null || fUrl.isEmpty()) {
                SAVED_TRACK_IDS.remove(fTrackId);
                toast("Нет ссылки на трек — сначала запустите воспроизведение");
                return;
            }
            toast("Скачивание: " + fArtist + " - " + fTitle);
            EXECUTOR.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        downloadTrack(fTrackId, fArtist, fTitle, fUrl);
                    } catch (Throwable t) {
                        android.util.Log.w(TAG, "download failed: " + t);
                        SAVED_TRACK_IDS.remove(fTrackId); // allow retry
                        toast("Не удалось скачать: " + fTitle);
                    }
                }
            });
        } catch (Throwable t) {
            android.util.Log.w(TAG, "onDownloadRequested failed", t);
        }
    }

    /**
     * MusicTrack.j is a List<AudioStream> ("audio_streams"): type (field b),
     * url (field c), fallbackUrl (field d). MP3 is the best target, AAC next;
     * any other direct (non-m3u8) stream also beats the HLS playlist.
     */
    private static String pickStreamUrl(Object track) {
        try {
            Field streamsField = track.getClass().getDeclaredField("j");
            streamsField.setAccessible(true);
            Object streamsObj = streamsField.get(track);
            if (!(streamsObj instanceof List)) {
                return readStringField(track, "i"); // MusicTrack.i = main (HLS) url
            }
            List<?> streams = (List<?>) streamsObj;
            String mp3 = null;
            String aac = null;
            String direct = null;
            for (Object s : streams) {
                if (s == null) continue;
                String type = readStringField(s, "b");   // AudioStream.b = type
                String url = readStringField(s, "c");     // AudioStream.c = url
                if (url == null || url.isEmpty()) {
                    url = readStringField(s, "d");        // AudioStream.d = fallbackUrl
                }
                if (url == null || url.isEmpty()) continue;
                if (type == null) type = "";
                String t = type.toLowerCase();
                if (t.contains("mp3") && mp3 == null) {
                    mp3 = url;
                } else if (t.contains("aac") && aac == null) {
                    aac = url;
                } else if (direct == null && !url.contains(".m3u8")
                        && (t.contains("mp3") || t.contains("aac") || t.contains("audio"))) {
                    direct = url;
                }
            }
            if (mp3 != null) return mp3;
            if (aac != null) return aac;
            if (direct != null) return direct;
        } catch (Throwable ignored) {
        }
        return readStringField(track, "i"); // main (HLS) url
    }

    private static String readTrackId(Object track) {
        try {
            Field f = track.getClass().getDeclaredField("b"); // MusicTrack.b = audioId (int)
            f.setAccessible(true);
            Object id = f.get(track);
            Field owner = track.getClass().getDeclaredField("c"); // MusicTrack.c = UserId
            owner.setAccessible(true);
            Object ownerId = owner.get(track);
            return String.valueOf(ownerId) + "_" + String.valueOf(id);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String readStringField(Object obj, String name) {
        try {
            Field f = obj.getClass().getDeclaredField(name);
            f.setAccessible(true);
            Object v = f.get(obj);
            return v instanceof String ? (String) v : null;
        } catch (Throwable t) {
            return null;
        }
    }

    // ------------------------------------------------------------------
    // Download
    // ------------------------------------------------------------------

    private static void downloadTrack(String trackId, String artist, String title, String url) throws IOException {
        Context context = getAppContext();
        if (context == null) {
            return;
        }
        String safeName = sanitize(artist) + " - " + sanitize(title);

        if (url.endsWith(".m3u8") || url.contains(".m3u8")) {
            saveHlsAsAudio(context, trackId, safeName, url);
        } else {
            saveUrlAsMp3(context, trackId, safeName, url);
        }
    }

    /** Plain file download (mp3 or other progressive format). */
    private static void saveUrlAsMp3(Context context, String trackId, String name, String url) throws IOException {
        File tmp = downloadToTempFile(context, url, "mp3");
        if (tmp == null || tmp.length() == 0) {
            throw new IOException("empty download: " + url);
        }
        boolean ok = publishFile(context, tmp, name + ".mp3", "audio/mpeg");
        //noinspection ResultOfMethodCallIgnored
        tmp.delete();
        if (ok) {
            toast("Сохранено: " + name);
        } else {
            throw new IOException("publish failed");
        }
    }

    /**
     * HLS playlist download: fetches every media segment referenced by the
     * playlist and concatenates them into a single file. VK serves HLS with
     * AAC-ADTS or MPEG-TS segments; the concatenated result stays playable
     * by most players (and MediaScanner tags it as audio).
     */
    private static void saveHlsAsAudio(Context context, String trackId, String name, String playlistUrl) throws IOException {
        String playlist = downloadText(playlistUrl);
        if (playlist == null || playlist.isEmpty()) {
            throw new IOException("empty playlist: " + playlistUrl);
        }

        File cacheDir = getTempDir(context);
        File out = new File(cacheDir, "hls_" + System.currentTimeMillis() + ".bin");
        Set<String> segmentUrls = new HashSet<>();
        String baseUrl = extractBaseUrl(playlistUrl);

        for (String line : playlist.split("\n")) {
            line = line.trim();
            if (line.isEmpty() || line.startsWith("#")) {
                continue;
            }
            String seg = resolveUrl(baseUrl, line);
            if (seg != null && segmentUrls.add(seg)) {
                appendToFile(out, seg);
            }
        }

        if (out.length() == 0) {
            //noinspection ResultOfMethodCallIgnored
            out.delete();
            throw new IOException("no HLS segments for " + playlistUrl);
        }

        boolean ok = publishFile(context, out, name + ".aac", "audio/aac");
        //noinspection ResultOfMethodCallIgnored
        out.delete();
        if (ok) {
            toast("Сохранено: " + name);
        } else {
            throw new IOException("publish failed");
        }
    }

    private static File downloadToTempFile(Context context, String url, String ext) throws IOException {
        HttpURLConnection conn = open(url);
        try {
            InputStream in = conn.getInputStream();
            File dir = getTempDir(context);
            File tmp = new File(dir, "dl_" + System.currentTimeMillis() + "." + ext);
            OutputStream out = new FileOutputStream(tmp);
            copy(in, out);
            out.close();
            return tmp;
        } finally {
            conn.disconnect();
        }
    }

    private static void appendToFile(File target, String segmentUrl) throws IOException {
        HttpURLConnection conn = open(segmentUrl);
        try {
            InputStream in = conn.getInputStream();
            OutputStream out = new FileOutputStream(target, true);
            copy(in, out);
            out.close();
        } catch (IOException e) {
            // Segment failures shouldn't abort the whole track
            android.util.Log.w(TAG, "segment failed: " + segmentUrl + " -> " + e);
        } finally {
            conn.disconnect();
        }
    }

    private static String downloadText(String url) throws IOException {
        HttpURLConnection conn = open(url);
        try {
            InputStream in = conn.getInputStream();
            java.io.ByteArrayOutputStream buf = new java.io.ByteArrayOutputStream();
            copy(in, buf);
            return buf.toString("UTF-8");
        } finally {
            conn.disconnect();
        }
    }

    private static HttpURLConnection open(String url) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(CONNECT_TIMEOUT);
        conn.setReadTimeout(READ_TIMEOUT);
        conn.setRequestProperty("User-Agent", "VKAndroidApp/8.195-9778 (Android 14)");
        return conn;
    }

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buf = new byte[64 * 1024];
        int n;
        while ((n = in.read(buf)) > 0) {
            out.write(buf, 0, n);
        }
        in.close();
    }

    // ------------------------------------------------------------------
    // Storage
    // ------------------------------------------------------------------

    /**
     * Moves the downloaded file into shared music storage.
     * API 29+: MediaStore insert. Older: direct file under public Music dir.
     * Returns true when the file became visible to the user.
     */
    private static boolean publishFile(Context context, File src, String displayName, String mimeType) {
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                ContentValues cv = new ContentValues();
                cv.put(MediaStore.Audio.Media.DISPLAY_NAME, displayName);
                cv.put(MediaStore.Audio.Media.MIME_TYPE, mimeType);
                cv.put(MediaStore.Audio.Media.RELATIVE_PATH, Environment.DIRECTORY_MUSIC + "/" + DIR_NAME);
                cv.put(MediaStore.Audio.Media.IS_PENDING, 1);
                Uri collection = MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
                Uri item = context.getContentResolver().insert(collection, cv);
                if (item == null) {
                    return false;
                }
                InputStream in = new java.io.FileInputStream(src);
                OutputStream out = context.getContentResolver().openOutputStream(item);
                if (out == null) {
                    return false;
                }
                copy(in, out);
                out.flush();
                out.close();

                ContentValues done = new ContentValues();
                done.put(MediaStore.Audio.Media.IS_PENDING, 0);
                context.getContentResolver().update(item, done, null, null);
                return true;
            } else {
                File musicDir = new File(
                        Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC),
                        DIR_NAME);
                //noinspection ResultOfMethodCallIgnored
                musicDir.mkdirs();
                File dst = uniqueFile(musicDir, displayName);
                return src.renameTo(dst)
                        || copyFile(src, dst);
            }
        } catch (Throwable t) {
            android.util.Log.w(TAG, "publish failed", t);
            return false;
        }
    }

    private static File uniqueFile(File dir, String displayName) {
        File f = new File(dir, displayName);
        if (!f.exists()) {
            return f;
        }
        String name = displayName;
        String ext = "";
        int dot = displayName.lastIndexOf('.');
        if (dot > 0) {
            name = displayName.substring(0, dot);
            ext = displayName.substring(dot);
        }
        int i = 1;
        while (f.exists()) {
            f = new File(dir, name + " (" + i + ")" + ext);
            i++;
        }
        return f;
    }

    private static boolean copyFile(File src, File dst) {
        try {
            InputStream in = new java.io.FileInputStream(src);
            OutputStream out = new FileOutputStream(dst);
            copy(in, out);
            out.flush();
            out.close();
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    private static File getTempDir(Context context) {
        File dir = new File(context.getExternalCacheDir() != null
                ? context.getExternalCacheDir()
                : context.getCacheDir(), "morphe_music");
        //noinspection ResultOfMethodCallIgnored
        dir.mkdirs();
        return dir;
    }

    // ------------------------------------------------------------------
    // Utils
    // ------------------------------------------------------------------

    private static String extractBaseUrl(String url) {
        int slash = url.lastIndexOf('/');
        return slash >= 0 ? url.substring(0, slash + 1) : "";
    }

    private static String resolveUrl(String baseUrl, String ref) {
        if (ref.startsWith("http://") || ref.startsWith("https://")) {
            return ref;
        }
        if (ref.startsWith("//")) {
            return "https:" + ref;
        }
        return baseUrl + ref;
    }

    private static String sanitize(String s) {
        if (s == null) return "";
        String cleaned = s.replaceAll("[\\\\/:*?\"<>|]", "_").trim();
        if (cleaned.length() > 80) {
            cleaned = cleaned.substring(0, 80);
        }
        if (cleaned.isEmpty()) {
            cleaned = "unknown";
        }
        return cleaned;
    }

    private static void toast(final String message) {
        try {
            final Context context = getAppContext();
            if (context == null) {
                return;
            }
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
                }
            });
        } catch (Throwable ignored) {
        }
    }

    private static Context getAppContext() {
        try {
            Object ctx = Class.forName("xsna.bf3").getDeclaredField("a").get(null);
            if (ctx instanceof Context) {
                return (Context) ctx;
            }
        } catch (Throwable ignored) {
        }
        try {
            Object ctx = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (ctx instanceof Context) {
                return (Context) ctx;
            }
        } catch (Throwable ignored) {
        }
        try {
            Object ctx = Class.forName("android.app.AppGlobals")
                    .getMethod("getInitialApplication").invoke(null);
            if (ctx instanceof Context) {
                return (Context) ctx;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }
}
