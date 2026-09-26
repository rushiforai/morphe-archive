package app.mahirsn.extension.youtube.history;

import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.youtube.addon.AddOnApi;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoState;

/**
 * Keeps the watch history and resume positions on a server of your own, the way YouTube's own
 * history does, so YouTube's history can stay off.
 * <p>
 * Reports the video that plays (id, title, channel, position, length) every few seconds and when
 * playback pauses, ends or moves to another video, and seeks a reopened video to where it was left.
 * Shorts and the muted previews that play in the feeds are left out. Runs on the Morphe Patches add-on hooks; all network calls are off the main
 * thread and failures are silent, so a server that is down never affects playback.
 */
@SuppressWarnings("unused")
public final class WatchHistory {
    private static final String TAG = "WatchHistory";
    private static final long REPORT_EVERY_MS = 10_000;
    private static final long RESUME_MIN_MS = 15_000;   // not from the first seconds…
    private static final long RESUME_END_MS = 20_000;   // …nor from the credits
    private static final long RESUME_WINDOW_MS = 5_000; // only right after the video starts

    private static final AtomicBoolean registered = new AtomicBoolean();
    private static final ExecutorService io = Executors.newSingleThreadExecutor();

    // Main thread only (all add-on hooks run there).
    private static String videoId;
    private static String title = "";
    private static String channel = "";
    private static long timeMs, lengthMs, lastReportAt;
    private static boolean resumeChecked;
    private static volatile String resumeFor;
    private static volatile long resumeAtMs;

    /** The server, set when patching. */
    private static String serverUrl() {
        return "";
    }

    /** The token the server expects in X-Token, set when patching. */
    private static String token() {
        return "";
    }

    /** Injection point: called from AddOnManager.registerAddOns() of Morphe Patches. */
    public static void register() {
        if (!registered.compareAndSet(false, true) || serverUrl().isEmpty()) return;
        AddOnApi.addVideoIdListener(WatchHistory::onVideoId);
        AddOnApi.addVideoTimeListener(WatchHistory::onVideoTime);
        AddOnApi.addVideoStateListener(WatchHistory::onVideoState);
    }

    private static void onVideoId(String id) {
        if (id == null || id.isEmpty() || id.equals(videoId)) return;
        flush(false);
        videoId = id;
        title = "";
        channel = "";
        timeMs = lengthMs = lastReportAt = 0;
        resumeChecked = false;
        resumeFor = null;
        if (VideoInformation.lastVideoIdIsShort()) return;

        final String asked = id;
        io.execute(() -> {
            String body = request("GET", "/progress/" + asked, null);
            if (body == null) return;
            long pos = (long) (number(body, "pos") * 1000);
            if (pos > 0) {
                resumeAtMs = pos;
                resumeFor = asked;
            }
        });
    }

    /** The watch player is on screen (in any size), not a feed preview or a Short. */
    private static boolean onWatchPlayer() {
        String type = PlayerType.getCurrent().name();
        return type.startsWith("WATCH_WHILE") || type.equals("VIRTUAL_REALITY_FULLSCREEN");
    }

    private static void onVideoTime(long time) {
        // A preview never gets a position, so flush() never reports it either.
        if (videoId == null || VideoInformation.lastVideoIdIsShort() || !onWatchPlayer()) return;
        timeMs = time;
        long length = VideoInformation.getVideoLength();
        if (length > 0) lengthMs = length;
        String t = VideoInformation.getVideoTitle();
        if (t != null && !t.isEmpty()) title = t;
        String c = VideoInformation.getChannelName();
        if (c != null && !c.isEmpty()) channel = c;

        if (!resumeChecked && videoId.equals(resumeFor)) {
            resumeChecked = true;
            long at = resumeAtMs;
            if (time < RESUME_WINDOW_MS && at > RESUME_MIN_MS && (lengthMs == 0 || at < lengthMs - RESUME_END_MS)) {
                VideoInformation.seekTo(at);
                return;
            }
        }

        long now = System.currentTimeMillis();
        if (now - lastReportAt >= REPORT_EVERY_MS) {
            lastReportAt = now;
            report(true);
        }
    }

    private static void onVideoState(VideoState state) {
        if (state == VideoState.PAUSED || state == VideoState.ENDED) flush(false);
    }

    /** Reports the current video now, if there is one worth reporting. */
    private static void flush(boolean playing) {
        if (videoId != null && timeMs > 0 && !VideoInformation.lastVideoIdIsShort()) report(playing);
    }

    private static void report(boolean playing) {
        final String json = "{\"id\":" + quote(videoId)
                + ",\"title\":" + quote(title)
                + ",\"channel\":" + quote(channel)
                + ",\"pos\":" + (timeMs / 1000.0)
                + ",\"len\":" + (lengthMs / 1000.0)
                + ",\"playing\":" + playing + "}";
        io.execute(() -> request("POST", "/progress", json));
    }

    private static String request(String method, String path, String json) {
        HttpURLConnection c = null;
        try {
            c = (HttpURLConnection) new URL(serverUrl() + path).openConnection();
            c.setRequestMethod(method);
            c.setConnectTimeout(5000);
            c.setReadTimeout(5000);
            c.setRequestProperty("X-Token", token());
            if (json != null) {
                c.setDoOutput(true);
                c.setRequestProperty("Content-Type", "application/json");
                try (OutputStream out = c.getOutputStream()) {
                    out.write(json.getBytes(StandardCharsets.UTF_8));
                }
            }
            if (c.getResponseCode() != 200) return null;
            try (InputStream in = c.getInputStream()) {
                ByteArrayOutputStream buf = new ByteArrayOutputStream();
                byte[] chunk = new byte[4096];
                for (int n; (n = in.read(chunk)) > 0; ) buf.write(chunk, 0, n);
                return buf.toString("UTF-8");
            }
        } catch (Exception e) {
            Log.d(TAG, method + " " + path + ": " + e);
            return null;
        } finally {
            if (c != null) c.disconnect();
        }
    }

    private static double number(String json, String key) {
        int i = json.indexOf("\"" + key + "\"");
        if (i < 0) return 0;
        i = json.indexOf(':', i) + 1;
        int j = i;
        while (j < json.length() && "0123456789.-eE+ ".indexOf(json.charAt(j)) >= 0) j++;
        try {
            return Double.parseDouble(json.substring(i, j).trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static String quote(String s) {
        StringBuilder b = new StringBuilder("\"");
        for (char ch : (s == null ? "" : s).toCharArray()) {
            if (ch == '"' || ch == '\\') b.append('\\').append(ch);
            else if (ch < 0x20) b.append(String.format("\\u%04x", (int) ch));
            else b.append(ch);
        }
        return b.append('"').toString();
    }

    private WatchHistory() {
    }
}
