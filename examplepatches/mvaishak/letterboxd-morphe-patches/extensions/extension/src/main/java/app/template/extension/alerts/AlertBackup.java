package app.template.extension.alerts;

import android.content.Context;
import android.content.SharedPreferences;

import app.template.extension.watch.WatchPreferences;

import org.json.JSONException;
import org.json.JSONObject;

import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

public final class AlertBackup {
    public static final String STREAMING_STORE = "morphe_streaming_alerts";
    static final String RELEASE_STORE = "morphe_film_release_alerts";

    private AlertBackup() {}

    public static JSONObject export(Context context) throws JSONException {
        return new JSONObject()
                .put("streaming", exportStore(context, STREAMING_STORE, true))
                .put("releases", exportStore(context, RELEASE_STORE, false));
    }

    private static JSONObject exportStore(Context context, String store, boolean streaming) throws JSONException {
        JSONObject exported = new JSONObject();
        for (var entry : prefs(context, store).getAll().entrySet()) {
            if (!(entry.getValue() instanceof String)) throw new JSONException("Invalid saved alert");
            JSONObject value = new JSONObject((String) entry.getValue());
            if (streaming) value.remove("token");
            exported.put(entry.getKey(), value);
        }
        return exported;
    }

    public static Prepared read(JSONObject data) throws JSONException {
        Map<String, String> streaming = new LinkedHashMap<>();
        Map<String, String> releases = new LinkedHashMap<>();
        if (data.has("streaming")) {
            JSONObject alerts = data.getJSONObject("streaming");
            for (var ids = alerts.keys(); ids.hasNext();) {
                String id = ids.next();
                JSONObject value = alerts.getJSONObject(id);
                checkFilmId(id);
                JSONObject encoded = new JSONObject().put("title", text(value, "title"))
                        .put("known", value.getJSONObject("known"))
                        .put("token", UUID.randomUUID().toString());
                Object year = value.get("year");
                if (!(year instanceof Integer) || (Integer) year < 0) {
                    throw new JSONException("Invalid streaming alert release year");
                }
                encoded.put("year", year);
                WatchPreferences.readServices(value.getJSONObject("known"));
                for (String key : new String[]{"imdb", "tmdb", "justWatch"}) {
                    if (value.has(key) && !value.isNull(key)) encoded.put(key, requiredText(value, key));
                }
                streaming.put(id, encoded.toString());
            }
        }
        if (data.has("releases")) {
            JSONObject alerts = data.getJSONObject("releases");
            LocalDate today = LocalDate.now();
            for (var ids = alerts.keys(); ids.hasNext();) {
                String key = ids.next();
                JSONObject value = alerts.getJSONObject(key);
                int delimiter = key.indexOf('\n');
                checkFilmId(delimiter < 0 ? "" : key.substring(0, delimiter));
                ReleaseAlert alert;
                try {
                    alert = decodeRelease(value);
                } catch (DateTimeParseException error) {
                    throw new JSONException("Invalid film release alert date");
                }
                if (!key.substring(delimiter + 1).equals(alert.key())) {
                    throw new JSONException("Invalid film release alert key");
                }
                text(value, "title");
                checkFilmUrl(requiredText(value, "url"));
                if (!alert.date.isBefore(today)) releases.put(key, value.toString());
            }
        }
        return new Prepared(streaming, releases);
    }

    static ReleaseAlert decodeRelease(JSONObject value) throws JSONException {
        return new ReleaseAlert(LocalDate.parse(requiredText(value, "date")), text(value, "type"),
                text(value, "label"), text(value, "countryCode"), text(value, "country"),
                text(value, "note"));
    }

    public static final class Prepared {
        private final Map<String, String> streaming, releases;

        private Prepared(Map<String, String> streaming, Map<String, String> releases) {
            this.streaming = streaming;
            this.releases = releases;
        }

        public int restoreStreaming(Context context) {
            return merge(context, STREAMING_STORE, streaming);
        }

        public int restoreReleases(Context context) {
            return merge(context, RELEASE_STORE, releases);
        }
    }

    private static int merge(Context context, String store, Map<String, String> values) {
        if (values.isEmpty()) return 0;
        SharedPreferences stored = prefs(context, store);
        SharedPreferences.Editor edit = stored.edit();
        int count = 0;
        for (var entry : values.entrySet()) {
            if (!stored.contains(entry.getKey())) {
                edit.putString(entry.getKey(), entry.getValue());
                count++;
            }
        }
        if (count > 0 && !edit.commit()) throw new IllegalStateException("Couldn’t restore alerts");
        return count;
    }

    private static SharedPreferences prefs(Context context, String store) {
        return context.getSharedPreferences(store, Context.MODE_PRIVATE);
    }

    private static String text(JSONObject data, String key) throws JSONException {
        Object value = data.get(key);
        if (!(value instanceof String)) throw new JSONException("Invalid alert " + key);
        return (String) value;
    }

    private static String requiredText(JSONObject data, String key) throws JSONException {
        String value = text(data, key);
        if (value.isEmpty()) throw new JSONException("Missing alert " + key);
        return value;
    }

    private static void checkFilmId(String id) throws JSONException {
        if (!id.matches("[A-Za-z0-9]{1,32}")) throw new JSONException("Invalid alert film ID");
    }

    private static void checkFilmUrl(String url) throws JSONException {
        try {
            URI uri = new URI(url);
            String host = uri.getHost();
            if (("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme()))
                    && uri.getUserInfo() == null
                    && ("boxd.it".equalsIgnoreCase(host) || "letterboxd.com".equalsIgnoreCase(host)
                    || "www.letterboxd.com".equalsIgnoreCase(host))) return;
        } catch (URISyntaxException ignored) {
            // The same message covers malformed and unsupported links.
        }
        throw new JSONException("Invalid film release alert link");
    }
}
