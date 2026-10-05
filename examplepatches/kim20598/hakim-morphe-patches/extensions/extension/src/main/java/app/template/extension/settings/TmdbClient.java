package app.template.extension.settings;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * Minimal TMDB client. Requires a free API key set in Mod settings.
 */
public final class TmdbClient {

    private static final String POSTER_BASE   = "https://image.tmdb.org/t/p/w500";
    private static final String BACKDROP_BASE = "https://image.tmdb.org/t/p/w780";
    private static final String API_BASE      = "https://api.themoviedb.org/3";

    private TmdbClient() {}

    public static boolean isConfigured() {
        String key = Prefs.getString(Prefs.KEY_TMDB_API_KEY, "");
        return key != null && !key.trim().isEmpty();
    }

    public static List<String> fetchPosters(String imdbId) {
        return fetch(imdbId, "posters", POSTER_BASE);
    }

    public static List<String> fetchBackdrops(String imdbId) {
        return fetch(imdbId, "backdrops", BACKDROP_BASE);
    }

    private static List<String> fetch(String imdbId, String kind, String imageBase) {
        List<String> out = new ArrayList<>();
        if (imdbId == null || imdbId.isEmpty()) return out;
        if (!isConfigured()) return out;

        try {
            String key = Prefs.getString(Prefs.KEY_TMDB_API_KEY, "").trim();

            String findUrl = API_BASE + "/find/" + urlEncode(imdbId)
                    + "?api_key=" + urlEncode(key)
                    + "&external_source=imdb_id";
            JSONObject find = httpGetJson(findUrl);
            if (find == null) return out;

            JSONArray movieResults = find.optJSONArray("movie_results");
            if (movieResults == null || movieResults.length() == 0) return out;
            JSONObject firstMovie = movieResults.optJSONObject(0);
            if (firstMovie == null) return out;
            int tmdbId = firstMovie.optInt("id", -1);
            if (tmdbId <= 0) return out;

            String imagesUrl = API_BASE + "/movie/" + tmdbId + "/images"
                    + "?api_key=" + urlEncode(key)
                    + "&include_image_language=en,null";
            JSONObject images = httpGetJson(imagesUrl);
            if (images == null) return out;

            JSONArray arr = images.optJSONArray(kind);
            if (arr == null) return out;
            for (int i = 0; i < arr.length(); i++) {
                JSONObject p = arr.optJSONObject(i);
                if (p == null) continue;
                String path = p.optString("file_path", "");
                if (path == null || path.isEmpty()) continue;
                out.add(imageBase + path);
            }
        } catch (Throwable ignored) {
        }
        return out;
    }

    private static JSONObject httpGetJson(String urlStr) {
        HttpURLConnection conn = null;
        InputStream in = null;
        try {
            URL url = new URL(urlStr);
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(8000);
            conn.setReadTimeout(8000);
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("User-Agent", "MorpheLetterboxdPatch/1.0");
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) return null;
            in = conn.getInputStream();
            String body = readAll(in);
            if (body == null || body.isEmpty()) return null;
            return new JSONObject(body);
        } catch (Throwable t) {
            return null;
        } finally {
            try { if (in != null) in.close(); } catch (Throwable ignored) {}
            try { if (conn != null) conn.disconnect(); } catch (Throwable ignored) {}
        }
    }

    private static String readAll(InputStream in) {
        try {
            BufferedReader r = new BufferedReader(new InputStreamReader(in, "UTF-8"));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = r.readLine()) != null) {
                sb.append(line);
                if (sb.length() > 500_000) break;
            }
            return sb.toString();
        } catch (Throwable t) {
            return null;
        }
    }

    private static String urlEncode(String s) {
        try {
            return URLEncoder.encode(s, "UTF-8");
        } catch (Throwable t) {
            return s;
        }
    }
}
