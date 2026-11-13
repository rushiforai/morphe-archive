package app.extendedplaylists.extension;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.Logger;

/** Asks YouTube for the playlists it builds for every channel, named in the user's language. */
final class InnerTube {
    /**
     * Prefix + channel id without "UC" (PlayAllButton.PlaylistIDPrefix in morphe-patches). Each row is
     * the list of all kinds of uploads, then its lists of one kind: videos, shorts, live streams.
     */
    static final String[][] FAMILIES = {
            {"UU", "UULF", "UUSH", "UULV"}, {"PU", "UULP", "UUPS", "UUPV"}, {"UUMO", "UUMF", "UUMS", "UUMV"}};
    /** The popular row stops at 200 videos: there the same size does not prove the same videos. */
    private static final String[] POPULAR = FAMILIES[1];
    private static final String POPULAR_CAP = "200";
    private static final String URL = "https://www.youtube.com/youtubei/v1/browse?prettyPrint=false";
    /**
     * A list of 200 videos answers 1.2 MB without the mask and 482 bytes with it. The third byline
     * says when the list was updated, in the user's language: "Обновлено сегодня".
     */
    private static final String MASK = "header.playlistHeaderRenderer(title,numVideosText,byline,ownerText,"
            + "playlistHeaderBanner.heroPlaylistThumbnailRenderer.thumbnail)";
    private static final int UPDATED_BYLINE = 2;
    private static final int TIMEOUT_MS = 4000;

    static final class Playlist {
        final String id, title, count, countText, thumbnail;
        @Nullable final String updated, owner;
        final int width, height;

        Playlist(String id, String title, String count, String countText, String thumbnail, int width, int height,
                 @Nullable String updated, @Nullable String owner) {
            this.id = id;
            this.title = title;
            this.count = count;
            this.countText = countText;
            this.thumbnail = thumbnail;
            this.width = width;
            this.height = height;
            this.updated = updated;
            this.owner = owner;
        }
    }

    /** Prefixes of the lists turned on in settings, in shown order: each kind with its popular pair, members last. */
    static List<String> order() {
        List<String> all = new ArrayList<>();
        for (int kind = 0; kind < FAMILIES[0].length; kind++) {
            all.add(FAMILIES[0][kind]);
            all.add(POPULAR[kind]);
        }
        all.addAll(Arrays.asList(FAMILIES[2]));
        List<String> out = new ArrayList<>();
        for (String prefix : all) if (Settings.shows(prefix)) out.add(prefix);
        return out;
    }

    /** The non-empty hidden playlists of a channel among the given prefixes (not empty), in their order. Blocks. */
    static List<Playlist> hidden(String channelId, List<String> order) throws InterruptedException {
        List<Callable<Playlist>> calls = new ArrayList<>();
        for (String prefix : order) calls.add(() -> fetch(prefix + channelId.substring(2)));
        ExecutorService pool = Executors.newFixedThreadPool(calls.size());
        Map<String, Playlist> found = new HashMap<>();
        try {
            List<Future<Playlist>> answers = pool.invokeAll(calls, TIMEOUT_MS * 2L, TimeUnit.MILLISECONDS);
            for (int i = 0; i < answers.size(); i++) {
                String prefix = order.get(i);
                try {
                    Playlist p = answers.get(i).get();
                    if (p != null) found.put(prefix, p);
                } catch (Exception e) {
                    // A list that failed or timed out is not shown.
                    Logger.printInfo(() -> "No list " + prefix + channelId.substring(2), e);
                }
            }
        } finally {
            pool.shutdownNow();
        }

        // All kinds with as many videos as one kind holds exactly that kind, and the server titles
        // it as videos even when they are live streams; the one-kind list keeps the right title.
        for (String[] family : FAMILIES) {
            Playlist all = found.get(family[0]);
            if (all == null || (family == POPULAR && all.count.equals(POPULAR_CAP))) continue;
            for (int kind = 1; kind < family.length; kind++) {
                Playlist one = found.get(family[kind]);
                if (one != null && one.count.equals(all.count)) found.remove(family[0]);
            }
        }
        List<Playlist> out = new ArrayList<>();
        for (String prefix : order) if (found.containsKey(prefix)) out.add(found.get(prefix));
        return out;
    }

    /** Null when the list is empty or does not exist: then the answer has only an alert. */
    @Nullable private static Playlist fetch(String id) throws Exception {
        Locale locale = Locale.getDefault();
        JSONObject client = new JSONObject()
                .put("clientName", "WEB")
                .put("clientVersion", "2.20261101.00.00")
                .put("hl", locale.getLanguage())
                .put("gl", locale.getCountry().isEmpty() ? "US" : locale.getCountry());
        JSONObject body = new JSONObject()
                .put("context", new JSONObject().put("client", client))
                .put("browseId", "VL" + id);

        HttpURLConnection c = (HttpURLConnection) new URL(URL).openConnection();
        c.setConnectTimeout(TIMEOUT_MS);
        c.setReadTimeout(TIMEOUT_MS);
        c.setRequestMethod("POST");
        c.setDoOutput(true);
        c.setRequestProperty("Content-Type", "application/json");
        c.setRequestProperty("X-Goog-FieldMask", MASK);
        try {
            try (OutputStream out = c.getOutputStream()) {
                out.write(body.toString().getBytes(StandardCharsets.UTF_8));
            }
            if (c.getResponseCode() != 200) return null;
            JSONObject header = new JSONObject(read(c.getInputStream()))
                    .optJSONObject("header");
            JSONObject h = header == null ? null : header.optJSONObject("playlistHeaderRenderer");
            if (h == null) return null;
            JSONArray runs = h.getJSONObject("numVideosText").getJSONArray("runs");
            String count = runs.getJSONObject(0).getString("text");
            if (count.equals("0")) return null;
            JSONArray thumbs = h.getJSONObject("playlistHeaderBanner")
                    .getJSONObject("heroPlaylistThumbnailRenderer")
                    .getJSONObject("thumbnail").getJSONArray("thumbnails");
            JSONArray byline = h.optJSONArray("byline");
            JSONObject updated = byline == null ? null : byline.optJSONObject(UPDATED_BYLINE);
            updated = updated == null ? null : updated.optJSONObject("playlistBylineRenderer");
            updated = updated == null ? null : updated.optJSONObject("text");
            JSONObject thumb = thumbs.getJSONObject(thumbs.length() - 1);
            JSONObject owner = h.optJSONObject("ownerText");
            return new Playlist(id, text(h.getJSONObject("title")), count, text(h.getJSONObject("numVideosText")),
                    thumb.getString("url"), thumb.optInt("width"), thumb.optInt("height"),
                    updated == null ? null : text(updated), owner == null ? null : text(owner));
        } finally {
            c.disconnect();
        }
    }

    /** A YouTube text: either simpleText or runs. */
    private static String text(JSONObject t) {
        if (t.has("simpleText")) return t.optString("simpleText");
        StringBuilder s = new StringBuilder();
        JSONArray runs = t.optJSONArray("runs");
        for (int i = 0; runs != null && i < runs.length(); i++) s.append(runs.optJSONObject(i).optString("text"));
        return s.toString();
    }

    private static String read(InputStream in) throws Exception {
        try (InputStream s = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            for (int n; (n = s.read(buf)) > 0; ) out.write(buf, 0, n);
            return out.toString("UTF-8");
        }
    }

    private InnerTube() {}
}
