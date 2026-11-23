package app.jofslash.extension.quora;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.webkit.WebView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Fixes for the patches that hide things, without a new release. When Quora renames what a patch
 * hides, a new selector goes into filters/selectors.json in the repository, and the app picks it up
 * at its next start: it downloads that file at most once a day and adds its selectors to the ones
 * built in, only for the patches that are switched on.
 *
 * <p>The file can only hide things: each entry must be a plain CSS selector (no braces, @-rules,
 * url() or comments), and the app writes the rule around it itself, always display:none. The
 * request sends nothing but what every download sends (the address and the app's user agent).
 */
public final class FilterUpdates {

    private static final String TAG = "JoFSlashPatches";
    private static final String PREFS = "jofslash_patch_settings";

    /** The switch, registered by the Filter updates patch. */
    static final String KEY = "filterUpdates";

    static final String URL = "https://raw.githubusercontent.com/JoFSlash/morphe-patches/main/filters/selectors.json";

    /** The file format this version reads; a newer file with another number is left alone. */
    static final int FORMAT = 1;

    private static final long DAY = 24L * 60 * 60 * 1000;
    private static final int MAX_BYTES = 64 * 1024;
    static final int MAX_SELECTOR = 300;
    static final int MAX_PER_KEY = 50;

    /**
     * What a selector may hold. Quotes, brackets and parentheses are needed for [class*="…"] and
     * :has(…), > for child selectors. Not allowed: { } ; @ \ &lt; and anything outside ASCII.
     */
    private static final Pattern ALLOWED = Pattern.compile("[A-Za-z0-9_\\-\\s.#\\[\\]=\"'*^$|~:(),>+]+");

    private static volatile Map<String, String> css;
    private static volatile boolean checking;

    private FilterUpdates() {
    }

    /** Whether a selector from the file may be used. The same rules are in .github/scripts/check_filters.py. */
    static boolean valid(String selector) {
        if (selector == null) return false;
        String s = selector.trim();
        if (s.isEmpty() || s.length() > MAX_SELECTOR) return false;
        if (!ALLOWED.matcher(s).matches()) return false;
        String lower = s.toLowerCase(java.util.Locale.ROOT);
        return !lower.contains("url(") && !lower.contains("/*") && !lower.contains("image(");
    }

    /**
     * The stylesheet for each patch key in the file: one rule per selector, so a selector this
     * WebView doesn't understand drops only its own rule. Entries that aren't valid are skipped.
     */
    static Map<String, String> parse(String json) {
        Map<String, String> result = new HashMap<>();
        if (json == null || json.isEmpty()) return result;
        try {
            JSONObject root = new JSONObject(json);
            if (root.optInt("format", -1) != FORMAT) return result;
            JSONObject rules = root.optJSONObject("rules");
            if (rules == null) return result;
            Iterator<String> keys = rules.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                if (key.equals(KEY) || !key.matches("[A-Za-z]{1,40}")) continue;
                JSONArray list = rules.optJSONArray(key);
                if (list == null) continue;
                StringBuilder sheet = new StringBuilder();
                for (int i = 0, used = 0; i < list.length() && used < MAX_PER_KEY; i++) {
                    String selector = list.optString(i, null);
                    if (!valid(selector)) continue;
                    sheet.append(selector.trim()).append("{display:none !important;}\n");
                    used++;
                }
                if (sheet.length() > 0) result.put(key, sheet.toString());
            }
        } catch (Exception ex) {
            Log.e(TAG, "Filter updates: the file isn't valid", ex);
        }
        return result;
    }

    private static boolean enabled() {
        return PatchSettings.isRegistered(KEY) && PatchSettings.isOn(KEY);
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Map<String, String> sheets(Context context) {
        Map<String, String> current = css;
        if (current == null) current = css = parse(prefs(context).getString("filters_json", null));
        return current;
    }

    /**
     * Called by PatchSettings.active when a page patch runs and is on: adds the downloaded
     * selectors for that patch to the page, or replaces the ones added before.
     */
    static void apply(WebView webView, String key) {
        if (webView == null || !enabled()) return;
        try {
            String sheet = sheets(webView.getContext()).get(key);
            if (sheet == null) return;
            String id = "jofslash-update-" + key;
            webView.evaluateJavascript("(function(){var c=" + JSONObject.quote(sheet) + ";"
                    + "var s=document.getElementById('" + id + "');"
                    + "if(!s){s=document.createElement('style');s.id='" + id + "';"
                    + "(document.head||document.documentElement).appendChild(s);}"
                    + "if(s.textContent!==c)s.textContent=c;})();", null);
        } catch (Exception ex) {
            Log.e(TAG, "Filter updates: failed to add the selectors for " + key, ex);
        }
    }

    /** Called when the tab bar is set up: downloads the file when the last try is a day old. */
    static void check(Context context) {
        if (context == null || !enabled() || checking) return;
        SharedPreferences prefs = prefs(context);
        if (System.currentTimeMillis() - prefs.getLong("filters_tried", 0) < DAY) return;
        checking = true;
        new Thread(() -> {
            try {
                download(prefs);
            } finally {
                checking = false;
            }
        }, "JoFSlashFilterUpdates").start();
    }

    private static void download(SharedPreferences prefs) {
        HttpURLConnection connection = null;
        try {
            prefs.edit().putLong("filters_tried", System.currentTimeMillis()).apply();
            connection = (HttpURLConnection) java.net.URI.create(URL).toURL().openConnection();
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(15_000);
            connection.setUseCaches(false);
            String etag = prefs.getString("filters_etag", null);
            if (etag != null && prefs.getString("filters_json", null) != null) {
                connection.setRequestProperty("If-None-Match", etag);
            }
            int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_NOT_MODIFIED) {
                prefs.edit().putLong("filters_time", System.currentTimeMillis()).apply();
                return;
            }
            if (code != HttpURLConnection.HTTP_OK) {
                Log.e(TAG, "Filter updates: HTTP " + code);
                return;
            }
            String json = read(connection.getInputStream());
            if (json == null) {
                Log.e(TAG, "Filter updates: the file is too large");
                return;
            }
            new JSONObject(json); // Only a file that parses replaces the one kept.
            prefs.edit()
                    .putString("filters_json", json)
                    .putString("filters_etag", connection.getHeaderField("ETag"))
                    .putLong("filters_time", System.currentTimeMillis())
                    .apply();
            css = parse(json);
        } catch (Exception ex) {
            Log.e(TAG, "Filter updates: download failed: " + ex);
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static String read(InputStream in) throws java.io.IOException {
        try (InputStream input = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int n;
            while ((n = input.read(buffer)) != -1) {
                out.write(buffer, 0, n);
                if (out.size() > MAX_BYTES) return null;
            }
            return out.toString("UTF-8");
        }
    }

    /** One line for the settings page, or null when the patch isn't in the app. */
    static String status(Context context) {
        if (!PatchSettings.isRegistered(KEY)) return null;
        if (!PatchSettings.isOn(KEY)) return Texts.t("Filter updates are off.");
        long time = prefs(context).getLong("filters_time", 0);
        if (time == 0) return Texts.t("Filter updates: not downloaded yet.");
        List<String> names = new ArrayList<>(sheets(context).keySet());
        String when = android.text.format.DateUtils.getRelativeTimeSpanString(time, System.currentTimeMillis(),
                android.text.format.DateUtils.MINUTE_IN_MILLIS).toString();
        return Texts.t("Filter updates: checked ") + when + ". "
                + (names.isEmpty() ? Texts.t("No fixes needed right now.")
                : Texts.t("Fixes in use: ") + names.size() + ".");
    }
}
