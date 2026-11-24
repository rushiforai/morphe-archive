package app.fblite.extension.settings;

import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Looks for a newer release of the patches on GitHub. The result is cached in the settings preferences, so the
 * settings screen shows the last known state at once and only asks GitHub every few hours.
 */
final class UpdateChecker {
    static final long AUTO_INTERVAL_MS = 6L * 60 * 60 * 1000;

    private static final String RELEASES = "https://api.github.com/repos/BlazeFTL/FaceBook-Lite-Morphe/releases?per_page=10";
    private static final String KEY_CHECKED_AT = "update_checked_at";
    private static final String KEY_FOR = "update_for";
    private static final String KEY_LATEST = "update_latest";
    private static final String KEY_URL = "update_url";
    private static final String KEY_NOTES = "update_notes";
    private static final int MAX_NOTES = 12000;
    private static final int MAX_RESPONSE = 512 * 1024;

    /** Newest release and the notes of every release newer than the installed one. {@link #latest} is empty when up to date. */
    static final class Result {
        final String latest;
        final String url;
        final String notes;
        final long checkedAt;

        Result(String latest, String url, String notes, long checkedAt) {
            this.latest = latest;
            this.url = url;
            this.notes = notes;
            this.checkedAt = checkedAt;
        }
    }

    private UpdateChecker() {
    }

    /** Blocking network call: run it off the main thread. */
    static Result check(String current) throws IOException, JSONException {
        boolean allowPrerelease = current.contains("-");
        JSONArray releases = new JSONArray(download(RELEASES));
        String latest = "";
        String url = "";
        StringBuilder notes = new StringBuilder();
        for (int i = 0; i < releases.length(); i++) {
            JSONObject release = releases.getJSONObject(i);
            if (release.optBoolean("draft")) continue;
            if (release.optBoolean("prerelease") && !allowPrerelease) continue;
            String version = stripV(release.isNull("tag_name") ? "" : release.optString("tag_name"));
            if (version.isEmpty() || compare(version, current) <= 0) continue;
            if (latest.isEmpty() || compare(version, latest) > 0) {
                latest = version;
                url = release.isNull("html_url") ? "" : release.optString("html_url");
            }
            notes.append("#### v").append(version).append('\n')
                    .append(release.isNull("body") ? "" : release.optString("body")).append("\n\n");
        }
        String text = notes.length() > MAX_NOTES ? notes.substring(0, MAX_NOTES) : notes.toString();
        return new Result(latest, url, text, System.currentTimeMillis());
    }

    private static String download(String address) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        try {
            connection.setConnectTimeout(10000);
            connection.setReadTimeout(10000);
            connection.setRequestProperty("Accept", "application/vnd.github+json");
            connection.setRequestProperty("User-Agent", "Morphe-FBLite-Settings");
            int code = connection.getResponseCode();
            if (code != 200) throw new IOException("HTTP " + code);
            InputStream in = connection.getInputStream();
            try {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int read;
                int total = 0;
                while ((read = in.read(buffer)) != -1) {
                    total += read;
                    if (total > MAX_RESPONSE) throw new IOException("Response too large");
                    out.write(buffer, 0, read);
                }
                return out.toString("UTF-8");
            } finally {
                in.close();
            }
        } finally {
            connection.disconnect();
        }
    }

    // ---- Cache ----

    static void save(SharedPreferences preferences, String current, Result result) {
        preferences.edit()
                .putLong(KEY_CHECKED_AT, result.checkedAt)
                .putString(KEY_FOR, current)
                .putString(KEY_LATEST, result.latest)
                .putString(KEY_URL, result.url)
                .putString(KEY_NOTES, result.notes)
                .apply();
    }

    /** The last result, or null when there is none or it was made for another version of the patches. */
    static Result load(SharedPreferences preferences, String current) {
        long checkedAt = preferences.getLong(KEY_CHECKED_AT, 0);
        if (checkedAt <= 0 || !current.equals(preferences.getString(KEY_FOR, ""))) return null;
        return new Result(preferences.getString(KEY_LATEST, ""), preferences.getString(KEY_URL, ""),
                preferences.getString(KEY_NOTES, ""), checkedAt);
    }

    // ---- Versions ----

    private static String stripV(String version) {
        version = version.trim();
        return version.startsWith("v") || version.startsWith("V") ? version.substring(1) : version;
    }

    /** Compares "1.6.12" style versions. A release is newer than its own "-dev.N" builds. */
    static int compare(String a, String b) {
        a = stripV(a);
        b = stripV(b);
        String preA = "";
        String preB = "";
        int dash = a.indexOf('-');
        if (dash >= 0) {
            preA = a.substring(dash + 1);
            a = a.substring(0, dash);
        }
        dash = b.indexOf('-');
        if (dash >= 0) {
            preB = b.substring(dash + 1);
            b = b.substring(0, dash);
        }
        String[] partsA = a.split("\\.");
        String[] partsB = b.split("\\.");
        for (int i = 0; i < Math.max(partsA.length, partsB.length); i++) {
            int x = i < partsA.length ? leadingNumber(partsA[i]) : 0;
            int y = i < partsB.length ? leadingNumber(partsB[i]) : 0;
            if (x != y) return x < y ? -1 : 1;
        }
        if (preA.isEmpty() != preB.isEmpty()) return preA.isEmpty() ? 1 : -1;
        if (preA.isEmpty()) return 0;
        int x = trailingNumber(preA);
        int y = trailingNumber(preB);
        return x == y ? 0 : (x < y ? -1 : 1);
    }

    private static int leadingNumber(String text) {
        int end = 0;
        while (end < text.length() && Character.isDigit(text.charAt(end))) end++;
        if (end == 0 || end > 9) return 0;
        return Integer.parseInt(text.substring(0, end));
    }

    private static int trailingNumber(String text) {
        int start = text.length();
        while (start > 0 && Character.isDigit(text.charAt(start - 1))) start--;
        if (start == text.length() || text.length() - start > 9) return 0;
        return Integer.parseInt(text.substring(start));
    }

    // ---- Changelog text ----

    /**
     * Turns the release notes (markdown made by semantic-release) into plain styled text: links and commit hashes are
     * dropped, bullets become dots, "####" lines (the versions) are accent colored, "###" lines (the sections) bold.
     */
    static CharSequence render(String markdown, int accent) {
        SpannableStringBuilder out = new SpannableStringBuilder();
        for (String raw : markdown.replace("\r", "").split("\n")) {
            String line = raw.trim();
            line = line.replaceAll("\\s*\\(\\[[0-9a-fA-F]{7,40}\\]\\([^)]*\\)\\)", "");
            line = line.replaceAll("\\[([^\\]]+)\\]\\([^)]*\\)", "$1");
            line = line.replace("**", "").replace("`", "");
            if (line.isEmpty()) continue;

            if (line.startsWith("#")) {
                int level = 0;
                while (level < line.length() && line.charAt(level) == '#') level++;
                // The title line of a release holds its version and date, which the version line already shows.
                if (level <= 2) continue;
                String heading = line.substring(level).trim();
                if (heading.isEmpty()) continue;
                while (out.length() > 0 && out.charAt(out.length() - 1) == '\n') out.delete(out.length() - 1, out.length());
                if (out.length() > 0) out.append("\n\n");
                int start = out.length();
                out.append(heading);
                out.setSpan(new StyleSpan(Typeface.BOLD), start, out.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                if (level >= 4) {
                    out.setSpan(new ForegroundColorSpan(accent), start, out.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
                out.append('\n');
                continue;
            }
            if (line.startsWith("* ") || line.startsWith("- ")) line = "\u2022 " + line.substring(2).trim();
            if (out.length() > 0 && out.charAt(out.length() - 1) != '\n') out.append('\n');
            out.append(line);
        }
        while (out.length() > 0 && out.charAt(out.length() - 1) == '\n') out.delete(out.length() - 1, out.length());
        return out;
    }
}
