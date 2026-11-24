package app.jofslash.extension.quora;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Author lists to follow, for Block authors and Spaces: links to plain text files with names, one
 * per line or separated by commas ("#" starts a comment), that someone keeps up, such as a list of
 * spam accounts. The app downloads them once a day, only while there are links, and hides those
 * names like the ones you added yourself. Nothing is sent but the requests for the files.
 */
final class AuthorLists {

    private static final String TAG = "JoFSlashPatches";
    private static final String PREFS = "jofslash_patch_settings";

    /** The links, one per line, as typed under Filters. */
    static final String URLS = "author_lists";
    private static final String NAMES = "author_lists_names";
    private static final String TRIED = "author_lists_tried";
    private static final String TIME = "author_lists_time";

    static final int MAX_LISTS = 5;
    static final int MAX_NAMES = 5000;
    private static final int MAX_BYTES = 256 * 1024;
    private static final long DAY = 24L * 60 * 60 * 1000;

    private static volatile boolean checking;

    private AuthorLists() {
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** The links as saved, one per line. */
    static String saved(SharedPreferences prefs) {
        return prefs.getString(URLS, "");
    }

    /** The https links in the text, at most MAX_LISTS. */
    static List<String> urls(String text) {
        List<String> out = new ArrayList<>();
        if (text == null) return out;
        for (String line : text.split("[\\s,]+")) {
            String s = line.trim();
            // Keyboards like to write "Https://".
            if (s.regionMatches(true, 0, "https://", 0, 8)) s = "https://" + s.substring(8);
            if (!s.matches("https://[A-Za-z0-9.-]+(:\\d{1,5})?/[^\\s]{0,1000}") || out.contains(s)) continue;
            out.add(s);
            if (out.size() >= MAX_LISTS) break;
        }
        return out;
    }

    /** The names in a list file: one per line or separated by commas, "#" starts a comment. */
    static List<String> names(String file) {
        Set<String> out = new LinkedHashSet<>();
        if (file == null) return new ArrayList<>();
        for (String line : file.split("\\r?\\n")) {
            int hash = line.indexOf('#');
            if (hash >= 0) line = line.substring(0, hash);
            for (String part : line.split(",")) {
                String name = part.replaceAll("\\s+", " ").trim();
                if (name.isEmpty() || name.length() > 80) continue;
                out.add(name);
                if (out.size() >= MAX_NAMES) return new ArrayList<>(out);
            }
        }
        return new ArrayList<>(out);
    }

    /** The names from the lists, as downloaded last, separated by commas for the page script. */
    static String namesText(Context context) {
        if (context == null) return "";
        SharedPreferences prefs = prefs(context);
        if (urls(prefs.getString(URLS, "")).isEmpty()) return "";
        try {
            JSONArray list = new JSONArray(prefs.getString(NAMES, "[]"));
            StringBuilder out = new StringBuilder();
            for (int i = 0; i < list.length(); i++) {
                if (out.length() > 0) out.append(',');
                out.append(list.optString(i));
            }
            return out.toString();
        } catch (Exception ex) {
            return "";
        }
    }

    /** Saves the links typed under Filters; new links are downloaded right away. */
    static void setUrls(Context context, String text) {
        SharedPreferences prefs = prefs(context);
        List<String> now = urls(text);
        String value = String.join("\n", now);
        if (value.equals(prefs.getString(URLS, ""))) return;
        prefs.edit().putString(URLS, value).putLong(TRIED, 0).apply();
        if (now.isEmpty()) {
            prefs.edit().remove(NAMES).remove(TIME).apply();
            PatchSettings.reload();
        } else {
            check(context, true);
        }
    }

    /** One line for Filters: how many names the lists gave, and when. */
    static String status(SharedPreferences prefs) {
        if (urls(prefs.getString(URLS, "")).isEmpty()) {
            return Texts.t("Links to text files with names, one per line. They are downloaded once a day.");
        }
        long time = prefs.getLong(TIME, 0);
        if (time == 0) return Texts.t("Not downloaded yet.");
        int count = 0;
        try {
            count = new JSONArray(prefs.getString(NAMES, "[]")).length();
        } catch (Exception ignored) {
        }
        return Texts.t("Names from the lists: ") + count + " · " + android.text.format.DateUtils.getRelativeTimeSpanString(
                time, System.currentTimeMillis(), android.text.format.DateUtils.MINUTE_IN_MILLIS);
    }

    /** Called when the tab bar is set up: downloads the lists when the last try is a day old. */
    static void check(Context context, boolean now) {
        if (context == null || checking) return;
        if (!PatchSettings.isRegistered("blockAuthors") || !PatchSettings.isOn("blockAuthors")) return;
        SharedPreferences prefs = prefs(context);
        List<String> links = urls(prefs.getString(URLS, ""));
        if (links.isEmpty()) return;
        if (!now && System.currentTimeMillis() - prefs.getLong(TRIED, 0) < DAY) return;
        checking = true;
        new Thread(() -> {
            try {
                prefs.edit().putLong(TRIED, System.currentTimeMillis()).apply();
                Set<String> all = new LinkedHashSet<>();
                boolean any = false;
                for (String link : links) {
                    String file = download(link);
                    if (file == null) continue;
                    any = true;
                    for (String name : names(file)) {
                        if (all.size() >= MAX_NAMES) break;
                        all.add(name);
                    }
                }
                // Keeps the last names when every list failed, such as without internet.
                if (!any) return;
                JSONArray list = new JSONArray();
                for (String name : all) list.put(name);
                prefs.edit().putString(NAMES, list.toString()).putLong(TIME, System.currentTimeMillis()).apply();
                new android.os.Handler(android.os.Looper.getMainLooper()).post(PatchSettings::reload);
            } finally {
                checking = false;
            }
        }, "JoFSlashAuthorLists").start();
    }

    private static String download(String link) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) java.net.URI.create(link).toURL().openConnection();
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(15_000);
            connection.setUseCaches(false);
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                Log.e(TAG, "Author lists: HTTP " + code);
                return null;
            }
            try (InputStream in = connection.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int n;
                while ((n = in.read(buffer)) != -1) {
                    out.write(buffer, 0, n);
                    if (out.size() > MAX_BYTES) return null;
                }
                return out.toString("UTF-8");
            }
        } catch (Exception ex) {
            Log.e(TAG, "Author lists: download failed: " + ex);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }
}
