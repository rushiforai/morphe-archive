package dev.ytmruskippper.skipper;

import android.os.SystemClock;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

/** Used on the skipper's single lookup thread. */
final class MusicBrainz {
    private static final String BASE_URL = "https://musicbrainz.org/ws/2/artist";
    private static final String USER_AGENT = "YtmRuSkippper/1 ( https://github.com/diminDDL/ytm-ru-skippper )";
    private static final long REQUEST_INTERVAL_MS = 1100;
    private static final int MAX_ATTEMPTS = 3;
    private final Map<String, String> countries = new LinkedHashMap<>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > 256;
        }
    };
    private long earliestRequest;

    String artistCountry(String name, long deadline) throws IOException, JSONException, InterruptedException {
        if (countries.containsKey(name)) return countries.get(name);

        String query = URLEncoder.encode(name, "UTF-8");
        JSONArray artists = get(BASE_URL + "?query=" + query + "&fmt=json&limit=1", deadline).optJSONArray("artists");
        JSONObject match = artists == null ? null : artists.optJSONObject(0);
        if (match == null || !matchesName(name, match)) {
            countries.put(name, "");
            return "";
        }

        String country = explicitCountry(match);
        if (country.isEmpty()) {
            String id = match.getString("id");
            if (!id.matches("[0-9a-fA-F-]{36}")) return "";
            JSONObject details = get(BASE_URL + "/" + id + "?fmt=json", deadline);
            country = explicitCountry(details);
            JSONObject area = details.optJSONObject("area");
            if (country.isEmpty() && area != null) country = area.optString("name");
        }
        countries.put(name, country);
        return country;
    }

    private static boolean matchesName(String name, JSONObject artist) {
        if (name.equalsIgnoreCase(artist.optString("name"))) return true;
        JSONArray aliases = artist.optJSONArray("aliases");
        for (int i = 0; aliases != null && i < aliases.length(); i++) {
            JSONObject alias = aliases.optJSONObject(i);
            if (alias != null && "Artist name".equals(alias.optString("type"))
                    && name.equalsIgnoreCase(alias.optString("name"))) return true;
        }
        return false;
    }

    private static String explicitCountry(JSONObject artist) {
        return artist.isNull("country") ? "" : artist.optString("country");
    }

    private JSONObject get(String url, long deadline) throws IOException, JSONException, InterruptedException {
        for (int attempt = 0; ; attempt++) {
            try {
                return getOnce(url, deadline);
            } catch (IOException error) {
                if (Thread.currentThread().isInterrupted()) throw new InterruptedException();
                if (error instanceof HttpFailure && !((HttpFailure) error).retryable) throw error;
                long backoff = REQUEST_INTERVAL_MS << attempt;
                earliestRequest = Math.max(earliestRequest, SystemClock.elapsedRealtime() + backoff);
                if (attempt + 1 == MAX_ATTEMPTS || earliestRequest >= deadline) throw error;
            }
        }
    }

    private JSONObject getOnce(String url, long deadline) throws IOException, JSONException, InterruptedException {
        if (earliestRequest >= deadline || SystemClock.elapsedRealtime() >= deadline) {
            throw new InterruptedException("MusicBrainz lookup window expired");
        }
        long wait = earliestRequest - SystemClock.elapsedRealtime();
        if (wait > 0) Thread.sleep(wait);
        long remaining = deadline - SystemClock.elapsedRealtime();
        if (Thread.currentThread().isInterrupted() || remaining <= 0) throw new InterruptedException();
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        int timeout = (int) Math.min(3500, remaining);
        connection.setConnectTimeout(timeout);
        connection.setReadTimeout(timeout);
        connection.setInstanceFollowRedirects(false);
        connection.setRequestProperty("User-Agent", USER_AGENT);
        connection.setRequestProperty("Accept", "application/json");
        earliestRequest = SystemClock.elapsedRealtime() + REQUEST_INTERVAL_MS;
        try {
            int status = connection.getResponseCode();
            if (status != 200) {
                boolean retryable = status == 429 || status == 500 || status == 502 || status == 503 || status == 504;
                if (retryable) honorRetryAfter(connection);
                throw new HttpFailure(status, retryable);
            }
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), StandardCharsets.UTF_8))) {
                StringBuilder body = new StringBuilder();
                char[] buffer = new char[2048];
                int read;
                while ((read = reader.read(buffer)) != -1) {
                    body.append(buffer, 0, read);
                    if (body.length() > 256_000) throw new IOException("MusicBrainz response too large");
                    if (Thread.currentThread().isInterrupted() || SystemClock.elapsedRealtime() >= deadline) {
                        throw new InterruptedException();
                    }
                }
                return new JSONObject(body.toString());
            }
        } finally {
            connection.disconnect();
        }
    }

    private void honorRetryAfter(HttpURLConnection connection) {
        String header = connection.getHeaderField("Retry-After");
        if (header == null) return;
        long now = SystemClock.elapsedRealtime();
        long delay;
        try {
            long seconds = Math.max(0, Long.parseLong(header.trim()));
            delay = Math.min(seconds, (Long.MAX_VALUE - now) / 1000) * 1000;
        } catch (NumberFormatException ignored) {
            delay = connection.getHeaderFieldDate("Retry-After", 0) - System.currentTimeMillis();
        }
        earliestRequest = Math.max(earliestRequest, now + Math.max(0, delay));
    }

    private static final class HttpFailure extends IOException {
        final boolean retryable;

        HttpFailure(int status, boolean retryable) {
            super("MusicBrainz HTTP " + status);
            this.retryable = retryable;
        }
    }
}
