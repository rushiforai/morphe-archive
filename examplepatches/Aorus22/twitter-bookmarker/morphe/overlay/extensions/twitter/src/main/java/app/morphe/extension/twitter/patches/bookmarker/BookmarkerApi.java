/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md.
 */

package app.morphe.extension.twitter.patches.bookmarker;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.Logger;

/**
 * The backend as the phone sees it: HTTP only, no Android types, so it can be
 * exercised without a UI and reasoned about without a device.
 *
 * <p>The request bodies are the same ones the browser extension sends — the
 * backend validates {@code author}, {@code username} and {@code tweet_date} and
 * stores anything else as given, so the two clients must agree on the wire
 * contract rather than on each other's code.
 *
 * <p>Every call blocks. Callers run them off the main thread; this class never
 * touches a view, a toast or a preference.
 */
public final class BookmarkerApi {

    /**
     * Long enough for a phone on a slow tunnel, short enough that a wrong
     * address fails while the user is still looking at the screen.
     */
    private static final int CONNECT_TIMEOUT_MS = 5000;
    private static final int READ_TIMEOUT_MS = 10000;

    private BookmarkerApi() {}

    /** One collection as {@code GET /api/gallery/collections} reports it. */
    public static final class Collection {
        public final String slug;
        public final String name;
        public final int postCount;

        Collection(String slug, String name, int postCount) {
            this.slug = slug;
            this.name = name;
            this.postCount = postCount;
        }

        @Override
        public String toString() {
            return name + " (" + postCount + ")";
        }
    }

    /** The tweet fields the backend accepts, already extracted from the app. */
    public static final class Draft {
        public final String url;
        public final String author;
        public final String username;
        public final String tweetDate;
        public final String text;
        public final List<String> media;

        public Draft(String url, String author, String username, String tweetDate,
                     String text, List<String> media) {
            this.url = url;
            this.author = author;
            this.username = username;
            this.tweetDate = tweetDate;
            this.text = text;
            this.media = media == null ? Collections.emptyList() : media;
        }
    }

    /** What a call produced, in terms a toast can repeat verbatim. */
    public static final class Result {
        public final boolean ok;
        /** True when the backend says the tweet is already saved, somewhere. */
        public final boolean duplicate;
        /** The collection the tweet is in: the target, or the owning one on 409. */
        public final String slug;
        public final String message;

        Result(boolean ok, boolean duplicate, String slug, String message) {
            this.ok = ok;
            this.duplicate = duplicate;
            this.slug = slug;
            this.message = message;
        }
    }

    /**
     * Turns whatever the user typed into a base URL: no trailing slash, and a
     * scheme when they left it out, since `192.168.1.13:43121` is a reasonable
     * thing to paste and `http://` is the only reading that works.
     */
    public static String normalizeBaseUrl(String raw) {
        String value = raw == null ? "" : raw.trim();
        while (value.endsWith("/")) {
            value = value.substring(0, value.length() - 1);
        }
        if (value.isEmpty()) return "";
        if (!value.contains("://")) {
            value = "http://" + value;
        }
        return value;
    }

    /**
     * Checks that the address answers and that the token is accepted, which are
     * two different failures and worth telling apart: a tunnel that is up but a
     * token that is wrong looks exactly like a working setup until a save fails.
     *
     * <p>{@code /v1/index} is the probe because it is protected and cheap. Its
     * body is not parsed: the fact that it answered is the result.
     */
    public static Result testConnection(String baseUrl, String token) {
        String base = normalizeBaseUrl(baseUrl);
        if (base.isEmpty()) {
            return new Result(false, false, null, "no backend URL set");
        }

        try {
            int health = request(base, "/health", token, "GET", null).status;
            if (health != HttpURLConnection.HTTP_OK) {
                return new Result(false, false, null, "backend answered /health with " + health);
            }
        } catch (Exception e) {
            return new Result(false, false, null, "cannot reach " + base + ": " + shortReason(e));
        }

        try {
            Response index = request(base, "/v1/index", token, "GET", null);
            if (index.status == HttpURLConnection.HTTP_UNAUTHORIZED) {
                // The reachable-but-locked case: the address is right, the token
                // is not, and saying "connection failed" here would send the user
                // looking at the wrong setting.
                return new Result(false, false, null, "reachable, but the token was rejected (401)");
            }
            if (index.status != HttpURLConnection.HTTP_OK) {
                return new Result(false, false, null, "reachable, but /v1/index returned " + index.status);
            }
            return new Result(true, false, null, "connected: " + summarizeIndex(index.body));
        } catch (Exception e) {
            return new Result(false, false, null, "cannot reach " + base + ": " + shortReason(e));
        }
    }

    /**
     * Which tweet is in which collection, for the whole archive
     * ({@code GET /v1/index}).
     *
     * <p>One request answers for every tweet that will scroll past, which is why
     * this is fetched whole rather than asked per tweet: the body is the backend's
     * own index, and the alternative — a request per tweet — would be slower per
     * tweet and would wake the radio hundreds of times per scroll.
     */
    public static Map<String, String> savedIndex(String baseUrl, String token) throws IOException {
        String base = normalizeBaseUrl(baseUrl);
        if (base.isEmpty()) throw new IOException("no backend URL set");

        Response response = request(base, "/v1/index", token, "GET", null);
        if (response.status == HttpURLConnection.HTTP_UNAUTHORIZED) {
            throw new IOException("the token was rejected (401)");
        }
        if (response.status != HttpURLConnection.HTTP_OK) {
            throw new IOException("the backend returned " + response.status);
        }

        Map<String, String> out = new HashMap<>();
        try {
            JSONObject items = new JSONObject(response.body).optJSONObject("items");
            if (items == null) return out;

            for (Iterator<String> keys = items.keys(); keys.hasNext(); ) {
                String tweetId = keys.next();
                JSONObject item = items.optJSONObject(tweetId);
                if (item == null) continue;
                String slug = item.optString("slug", "");
                if (tweetId.isEmpty() || slug.isEmpty()) continue;
                out.put(tweetId, slug);
            }
        } catch (Exception e) {
            // A body that is not the JSON we expect is a failed call, not an empty
            // archive: reporting "nothing saved" would silently unmark every tweet.
            throw new IOException("could not read the saved index: " + e);
        }
        return out;
    }

    /** The collections a tweet can be saved into, in the backend's order. */
    public static List<Collection> collections(String baseUrl, String token) throws IOException {
        String base = normalizeBaseUrl(baseUrl);
        if (base.isEmpty()) throw new IOException("no backend URL set");

        Response response = request(base, "/api/gallery/collections", token, "GET", null);
        if (response.status != HttpURLConnection.HTTP_OK) {
            throw new IOException("the backend returned " + response.status);
        }

        List<Collection> out = new ArrayList<>();
        try {
            JSONArray array = new JSONObject(response.body).optJSONArray("collections");
            if (array == null) return out;

            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.optJSONObject(i);
                if (item == null) continue;
                String slug = item.optString("slug", "");
                if (slug.isEmpty()) continue;
                String name = item.optString("name", "");
                out.add(new Collection(
                        slug,
                        name.isEmpty() ? slug : name,
                        item.optInt("post_count", 0)));
            }
        } catch (Exception e) {
            // A body that is not the JSON we expect is a failed call, not an
            // empty list: reporting "no collections" would hide the real problem.
            throw new IOException("could not read the collection list: " + e);
        }
        return out;
    }

    /**
     * Saves a tweet into a collection.
     *
     * <p>A 409 is a success in disguise: the tweet is already in the database,
     * possibly in a different collection, and the response names it. It is
     * reported as one so the caller can say where the tweet already lives
     * instead of offering a save that cannot work.
     */
    public static Result save(String baseUrl, String token, String slug, String name, Draft draft) {
        String base = normalizeBaseUrl(baseUrl);
        if (base.isEmpty()) {
            return new Result(false, false, null, "no backend URL set");
        }
        if (draft.tweetDate == null || draft.tweetDate.isEmpty()) {
            return new Result(false, false, null, "could not work out when this tweet was posted");
        }

        try {
            String body = saveBody(slug, name, draft);
            Response response = request(base, "/v1/bookmarks", token, "POST", body);

            switch (response.status) {
                case HttpURLConnection.HTTP_CREATED:
                    return new Result(true, false, slug, "saved to " + slug);
                case HttpURLConnection.HTTP_CONFLICT: {
                    JSONObject json = parseOrEmpty(response.body);
                    String owner = json.optString("slug", "");
                    String where = owner.isEmpty() ? "another collection" : owner;
                    return new Result(false, true, owner.isEmpty() ? null : owner,
                            "already saved in " + where);
                }
                case HttpURLConnection.HTTP_UNAUTHORIZED:
                    return new Result(false, false, null, "the backend rejected the token (401)");
                case HttpURLConnection.HTTP_BAD_REQUEST:
                    return new Result(false, false, null,
                            "the backend refused the tweet: " + reasonOf(response.body));
                default:
                    return new Result(false, false, null,
                            "the backend returned " + response.status + ": " + reasonOf(response.body));
            }
        } catch (Exception e) {
            // Nothing was written: the save is all-or-nothing on the backend, so
            // a failed request never leaves a half-saved row behind. A malformed
            // response lands here too rather than escaping into the thread that
            // called us, where it would take the app down.
            return new Result(false, false, null, "cannot reach the backend: " + shortReason(e));
        }
    }

    /** The {@code POST /v1/bookmarks} body, field for field what the extension sends. */
    private static String saveBody(String slug, String name, Draft draft) throws JSONException {
        JSONObject tweet = new JSONObject();
        tweetPut(tweet, "url", draft.url);
        tweetPut(tweet, "author", draft.author);
        tweetPut(tweet, "username", draft.username);
        tweetPut(tweet, "tweet_date", draft.tweetDate);
        // Text is the one field allowed to be empty: a media-only tweet has none.
        tweet.put("text", draft.text == null ? "" : draft.text);

        JSONArray media = new JSONArray();
        for (String url : draft.media) {
            if (url != null && !url.isEmpty()) media.put(url);
        }
        tweet.put("media", media);

        JSONObject body = new JSONObject();
        body.put("slug", slug == null ? "" : slug);
        if (name != null && !name.isEmpty()) body.put("name", name);
        body.put("tweet", tweet);
        return body.toString();
    }

    private static void tweetPut(JSONObject tweet, String key, String value) throws JSONException {
        tweet.put(key, value == null ? "" : value);
    }

    /** {@code {"reason": "..."}} from a 400 or a 500, as a bare sentence. */
    private static String reasonOf(String body) {
        String reason = parseOrEmpty(body).optString("reason", "");
        return reason.isEmpty() ? "no reason given" : reason;
    }

    private static JSONObject parseOrEmpty(String body) {
        try {
            return body == null || body.isEmpty() ? new JSONObject() : new JSONObject(body);
        } catch (Exception e) {
            // An error body from something that is not our backend (a tunnel
            // login page, a proxy) is not JSON; the status code still is useful.
            return new JSONObject();
        }
    }

    private static String summarizeIndex(String body) {
        try {
            JSONObject items = new JSONObject(body).optJSONObject("items");
            int count = items == null ? 0 : items.length();
            return count + (count == 1 ? " saved bookmark" : " saved bookmarks");
        } catch (Exception e) {
            return "reachable";
        }
    }

    private static String shortReason(Exception e) {
        String message = e.getMessage();
        if (message == null || message.isEmpty()) return e.getClass().getSimpleName();
        return message;
    }

    /** Status and body of one response; the body is already decoded as UTF-8. */
    private static final class Response {
        final int status;
        final String body;

        Response(int status, String body) {
            this.status = status;
            this.body = body;
        }
    }

    /**
     * One request, with the token sent only when there is one: the backend
     * exempts loopback peers, so an empty token means "send no header" rather
     * than "send an empty bearer".
     */
    private static Response request(String base, String path, String token, String method, String body)
            throws IOException {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(base + path).openConnection();
            connection.setRequestMethod(method);
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setRequestProperty("Accept", "application/json");

            String trimmedToken = token == null ? "" : token.trim();
            if (!trimmedToken.isEmpty()) {
                connection.setRequestProperty("Authorization", "Bearer " + trimmedToken);
            }

            if (body != null) {
                byte[] payload = body.getBytes(StandardCharsets.UTF_8);
                connection.setDoOutput(true);
                connection.setFixedLengthStreamingMode(payload.length);
                connection.setRequestProperty("Content-Type", "application/json");
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(payload);
                }
            }

            int status = connection.getResponseCode();
            Logger.printInfo(() -> "twb: " + method + " " + path + " -> " + status);
            return new Response(status, read(connection, status));
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    /** The error stream carries the reason for a 4xx/5xx, so both are read. */
    private static String read(HttpURLConnection connection, int status) {
        InputStream stream = null;
        try {
            stream = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            if (stream == null) return "";

            StringBuilder builder = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(stream, StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    builder.append(line);
                }
            }
            return builder.toString();
        } catch (IOException e) {
            return "";
        }
    }
}
