package app.ayham.extension.music.features;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The music-video flag automix needs (a video's own intro and outro rule out a loop mix). Songs in
 * place of videos come from Morphe's "Always play the song version"; this only asks YT what the
 * playing and next ids are.
 */
public final class MusicVideoType {
    private static final String TAG = "Ayham";
    private static final String PLAYER_URL =
            "https://music.youtube.com/youtubei/v1/player?key=AIzaSyAOghZGza2MQSZkY_zfZ370N-PUdXEo8AI";
    private static final String VIDEO = "MUSIC_VIDEO_TYPE_OMV";
    private static final String CLIENT_VERSION = "1.20260914.01.00";

    private static final Map<String, String> types = Collections.synchronizedMap(new HashMap<>());
    private static final ExecutorService worker = Executors.newSingleThreadExecutor();

    private MusicVideoType() {
    }

    /** The type learned elsewhere (a download's player data). */
    static void note(String videoId, String type) {
        if (videoId != null && type != null && !type.isEmpty()) types.put(videoId, type);
    }

    static boolean musicVideo(String videoId) {
        return VIDEO.equals(types.get(videoId));
    }

    /** Looks the id up once, in the background. */
    public static void request(String videoId) {
        if (videoId == null || videoId.isEmpty() || types.containsKey(videoId)) return;
        types.put(videoId, ""); // asked; a failure stays unknown (not a music video)
        worker.execute(() -> {
            try {
                String type = lookup(videoId);
                if (!type.isEmpty()) types.put(videoId, type);
                Log.i(TAG, "video type " + videoId + ": " + (type.isEmpty() ? "unknown" : type));
            } catch (Throwable t) {
                Log.i(TAG, "video type " + videoId + " failed: " + t);
            }
        });
    }

    private static String lookup(String videoId) throws Exception {
        JSONObject body = new JSONObject().put("videoId", videoId).put("context", new JSONObject()
                .put("client", new JSONObject().put("clientName", "WEB_REMIX")
                        .put("clientVersion", CLIENT_VERSION).put("hl", "en").put("gl", "US")));
        HttpURLConnection c = (HttpURLConnection) new URL(PLAYER_URL).openConnection();
        c.setConnectTimeout(10_000);
        c.setReadTimeout(15_000);
        c.setRequestMethod("POST");
        c.setDoOutput(true);
        c.setRequestProperty("User-Agent", "Mozilla/5.0");
        c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
        // the connection goes in every case, a failed send too
        try {
            try (OutputStream out = c.getOutputStream()) {
                out.write(body.toString().getBytes(StandardCharsets.UTF_8));
            }
            int code = c.getResponseCode();
            // an error has no player data to read (and its body may be null)
            if (code >= 400) throw new java.io.IOException("HTTP " + code);
            return readType(c);
        } finally {
            c.disconnect();
        }
    }

    private static String readType(HttpURLConnection c) throws Exception {
        try (InputStream in = c.getInputStream()) {
            ByteArrayOutputStream buf = new ByteArrayOutputStream();
            // a player answer is a few hundred KB
            HlsClip.capped(in, buf, 16L * 1024 * 1024);
            JSONObject details = new JSONObject(buf.toString("UTF-8")).optJSONObject("videoDetails");
            return details == null ? "" : details.optString("musicVideoType", "");
        }
    }

    /**
     * Once: our "Always play the song version" switch (on unless turned off) becomes Morphe's
     * AUTO_SONG_VERSION, which replaced ours.
     */
    static void migrateAutoSong(Context context) {
        if (context == null) return;
        try {
            SharedPreferences prefs = context.getSharedPreferences("morphe_prefs", Context.MODE_PRIVATE);
            if (prefs.getBoolean("ayham_autoSongMigrated", false)) return;
            boolean ours = prefs.getBoolean("ayham_autoSong", true);
            if (ours) {
                Object setting = Class.forName("app.morphe.extension.music.settings.Settings")
                        .getField("AUTO_SONG_VERSION").get(null);
                for (java.lang.reflect.Method m : setting.getClass().getMethods()) {
                    if (m.getName().equals("save") && m.getParameterTypes().length == 1) {
                        m.invoke(setting, Boolean.TRUE);
                        break;
                    }
                }
            }
            prefs.edit().remove("ayham_autoSong").putBoolean("ayham_autoSongMigrated", true).apply();
            Log.i(TAG, "song version: ours was " + (ours ? "on" : "off")
                    + (ours ? ", Morphe's Always play the song version is on now" : ", Morphe's left as it is"));
        } catch (Throwable t) {
            Log.i(TAG, "song version migration failed: " + t);
        }
    }
}
