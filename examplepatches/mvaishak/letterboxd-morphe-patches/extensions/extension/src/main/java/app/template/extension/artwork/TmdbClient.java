package app.template.extension.artwork;

import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public final class TmdbClient {
    public static final String SETTINGS_URL = "https://www.themoviedb.org/settings/api";
    private static final String API = "https://api.themoviedb.org/3";
    private static final String IMAGE = "https://image.tmdb.org/t/p/";
    private static final Pattern IMAGE_PATH = Pattern.compile("/[A-Za-z0-9_-]+\\.(jpg|jpeg|png|webp)");

    public static final class Failure extends Exception {
        Failure(String message) {
            super(message);
        }
    }

    public static final class Image {
        public final String url;
        public final String thumbnail;
        public final String language;

        Image(String path, String size, String language) {
            this.url = IMAGE + "original" + path;
            this.thumbnail = IMAGE + size + path;
            this.language = language;
        }
    }

    public static final class Match {
        public final String id;
        public final String label;

        public final boolean exact;

        Match(String id, String label, boolean exact) {
            this.id = id;
            this.label = label;
            this.exact = exact;
        }
    }

    public static final class Images {
        public final List<Image> posters;
        public final List<Image> backdrops;

        Images(List<Image> posters, List<Image> backdrops) {
            this.posters = posters;
            this.backdrops = backdrops;
        }
    }

    private final String key;

    public TmdbClient(String key) {
        this.key = key;
    }

    public void validate() throws Failure {
        get("/configuration", null);
    }

    public static String keyProblem(String key) {
        return ArtworkRules.keyProblem(key);
    }

    public static String validateUrl(String value) {
        return ArtworkRules.imageUrl(value);
    }

    static String sized(String url, String size) {
        String prefix = IMAGE + "original";
        if (url.startsWith(prefix) && IMAGE_PATH.matcher(url.substring(prefix.length())).matches()) {
            return IMAGE + size + url.substring(prefix.length());
        }
        return url;
    }

    public List<Match> match(ArtworkStore.Film film) throws Failure {
        if (film.tmdb != null) {
            return java.util.Collections.singletonList(new Match(film.tmdb, film.label(), true));
        }
        if (film.imdb != null) {
            List<Match> matches = matches(get("/find/" + film.imdb, "external_source=imdb_id")
                    .optJSONArray("movie_results"), true);
            if (!matches.isEmpty()) return matches;
        }
        if (film.title.isEmpty()) return java.util.Collections.emptyList();
        String query = "query=" + Uri.encode(film.title) + "&include_adult=false";
        if (film.year > 0) query += "&year=" + film.year;
        return matches(get("/search/movie", query).optJSONArray("results"), false);
    }

    public List<Match> search(String title) throws Failure {
        String query = "query=" + Uri.encode(title) + "&include_adult=false";
        return matches(get("/search/movie", query).optJSONArray("results"), true);
    }

    public Images images(String id) throws Failure {
        if (!id.matches("[0-9]{1,10}")) throw new Failure("No matching film on TMDB.");
        JSONObject response = get("/movie/" + id + "/images", null);
        return new Images(images(response.optJSONArray("posters"), "w342"),
                images(response.optJSONArray("backdrops"), "w300"));
    }

    private static List<Image> images(JSONArray array, String size) {
        List<Image> images = new ArrayList<>();
        if (array == null) return images;
        // Preserve TMDB's ordering. It ranks results for this endpoint.
        for (int i = 0; i < array.length(); i++) {
            JSONObject item = array.optJSONObject(i);
            if (item == null) continue;
            String path = item.optString("file_path");
            if (IMAGE_PATH.matcher(path).matches()) {
                images.add(new Image(path, size, item.isNull("iso_639_1") ? null : item.optString("iso_639_1")));
            }
        }
        return images;
    }

    private static List<Match> matches(JSONArray array, boolean exact) {
        List<Match> matches = new ArrayList<>();
        if (array == null) return matches;
        for (int i = 0; i < array.length(); i++) {
            JSONObject item = array.optJSONObject(i);
            if (item == null) continue;
            String id = item.optString("id");
            if (!id.matches("[0-9]{1,10}")) continue;
            String label = item.optString("title");
            String date = item.optString("release_date");
            if (date.length() >= 4) label += " (" + date.substring(0, 4) + ")";
            matches.add(new Match(id, label, exact));
        }
        return matches;
    }

    private JSONObject get(String path, String query) throws Failure {
        String problem = ArtworkRules.keyProblem(key == null ? "" : key);
        if (problem != null) throw new Failure(problem);
        HttpURLConnection connection = null;
        try {
            if (Thread.currentThread().isInterrupted()) throw new InterruptedIOException();
            connection = (HttpURLConnection) new URL(API + path + "?api_key=" + key
                    + (query == null ? "" : "&" + query)).openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(7_000);
            connection.setReadTimeout(8_000);
            connection.setRequestProperty("Accept", "application/json");
            int status = connection.getResponseCode();
            if (status == 401 || status == 403) throw new Failure("TMDB rejected this API key.");
            if (status == 404) throw new Failure("No matching film on TMDB.");
            if (status == 429) throw new Failure("TMDB rate limit reached. Try again in a moment.");
            if (status >= 500) throw new Failure("TMDB is temporarily unavailable. Try again later.");
            if (status != 200) throw new Failure("TMDB couldn't complete this request.");
            try (InputStream in = connection.getInputStream();
                 ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = in.read(buffer)) != -1) {
                    if (Thread.currentThread().isInterrupted()) throw new InterruptedIOException();
                    if (bytes.size() + count > 8_000_000) throw new JSONException("Response too large");
                    bytes.write(buffer, 0, count);
                }
                return new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
            }
        } catch (IOException e) {
            throw new Failure("Couldn't reach TMDB. Check your connection and try again.");
        } catch (JSONException e) {
            throw new Failure("TMDB returned an unreadable response.");
        } finally {
            if (connection != null) connection.disconnect();
        }
    }
}
