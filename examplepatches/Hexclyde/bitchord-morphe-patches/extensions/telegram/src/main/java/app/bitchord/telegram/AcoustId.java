package app.bitchord.telegram;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 * Looks a fingerprint up in AcoustID's free database of recordings, with the user's own AcoustID
 * application key. Only the fingerprint, the file's length and the key are sent.
 */
final class AcoustId {
    private AcoustId() {}

    static final String URL = "https://api.acoustid.org/v2/lookup";

    /** How sure AcoustID must be that it's the same recording. */
    static final double MIN_SCORE = 0.8;

    /** A recording's length may differ from the file's by this much. */
    static final int LENGTH_SLACK_SEC = 10;

    /** A rejected key: no point trying again until it's changed. */
    static final class BadKey extends IOException {
        BadKey(String message) {
            super(message);
        }
    }

    /** Sends the lookup and returns AcoustID's answer. */
    static String lookup(String key, int seconds, String fingerprint) throws IOException {
        String body =
                "format=json&meta=recordings&client="
                        + URLEncoder.encode(key, "UTF-8")
                        + "&duration="
                        + seconds
                        + "&fingerprint="
                        + URLEncoder.encode(fingerprint, "UTF-8");
        HttpURLConnection http = (HttpURLConnection) new URL(URL).openConnection();
        try {
            http.setConnectTimeout(15000);
            http.setReadTimeout(30000);
            http.setDoOutput(true);
            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            try (OutputStream out = http.getOutputStream()) {
                out.write(body.getBytes(StandardCharsets.UTF_8));
            }
            int code = http.getResponseCode();
            InputStream in = code >= 400 ? http.getErrorStream() : http.getInputStream();
            if (in == null) throw new IOException("AcoustID answered " + code);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] block = new byte[8192];
            int n;
            while ((n = in.read(block)) > 0 && bytes.size() < 1 << 20) bytes.write(block, 0, n);
            in.close();
            return new String(bytes.toByteArray(), StandardCharsets.UTF_8);
        } finally {
            http.disconnect();
        }
    }

    /**
     * The best recording in AcoustID's answer: {title, artist, score, id}. Null when nothing is
     * close enough. Throws when AcoustID refused the lookup.
     */
    static JSONObject best(String answer, int seconds) throws Exception {
        JSONObject json = new JSONObject(answer);
        if (!"ok".equals(json.optString("status"))) {
            JSONObject error = json.optJSONObject("error");
            int code = error == null ? 0 : error.optInt("code");
            String message =
                    error == null ? "AcoustID refused the lookup" : error.optString("message");
            // 4: invalid API key; 6: invalid user API key; 17: unknown application.
            if (code == 4 || code == 6 || code == 17) throw new BadKey(message);
            throw new IOException(message);
        }
        JSONArray results = json.optJSONArray("results");
        JSONObject best = null;
        double bestScore = 0;
        if (results == null) return null;
        for (int i = 0; i < results.length(); i++) {
            JSONObject result = results.optJSONObject(i);
            if (result == null) continue;
            double score = result.optDouble("score", 0);
            if (score < MIN_SCORE || score <= bestScore) continue;
            JSONArray recordings = result.optJSONArray("recordings");
            if (recordings == null) continue;
            for (int r = 0; r < recordings.length(); r++) {
                JSONObject recording = recordings.optJSONObject(r);
                if (recording == null) continue;
                String title = clean(recording.optString("title"));
                String artist = artists(recording.optJSONArray("artists"));
                int length = recording.optInt("duration");
                if (title.isEmpty() || artist.isEmpty()) continue;
                if (length > 0 && seconds > 0 && Math.abs(length - seconds) > LENGTH_SLACK_SEC)
                    continue;
                best =
                        new JSONObject()
                                .put("title", title)
                                .put("artist", artist)
                                .put("score", Math.round(score * 100) / 100.0)
                                .put("id", recording.optString("id"))
                                .put("by", "AcoustID");
                bestScore = score;
                break;
            }
        }
        return best;
    }

    /** "Artist A feat. Artist B", as MusicBrainz credits them. */
    static String artists(JSONArray artists) {
        if (artists == null) return "";
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < artists.length(); i++) {
            JSONObject artist = artists.optJSONObject(i);
            if (artist == null) continue;
            out.append(clean(artist.optString("name")));
            if (i + 1 < artists.length()) {
                String join = artist.optString("joinphrase", "");
                out.append(join.isEmpty() ? ", " : join);
            }
        }
        return clean(out.toString());
    }

    private static String clean(String s) {
        s = s == null ? "" : s.replaceAll("\\p{Cntrl}", " ").trim();
        return s.length() > TrackNames.MAX_TEXT ? s.substring(0, TrackNames.MAX_TEXT) : s;
    }
}
