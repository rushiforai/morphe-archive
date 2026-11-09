package semicoloncolonel.mobilestream.extension.appletv;

import android.app.Application;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * "Show release times" for the Apple TV phone app.
 *
 * Every page and episode list the app's core sends to its screens passes
 * through filter(). Upcoming titles carry their exact release time, but the
 * app shows only a day ("Coming This Wednesday"), worked out from the UTC
 * date, so a release at 4:00 PM Pacific on Tuesday shows as Wednesday.
 *
 * - An episode tile with attributes.comingSoonDate (seconds) shows the day
 *   and time in the device's time zone ("EPISODE 3 · Tue 4:00 PM PST").
 * - On an episode page, the badge ("Coming This Wednesday") gets the day and
 *   time, and the "Coming Soon" row under Information, which shows only the
 *   year, gets the full date and time. The time is the page's releaseDate
 *   (milliseconds) whose UTC date matches its comingSoonDate.
 *
 * Analytics fields are not changed. Labels are matched in English.
 */
@SuppressWarnings("unused")
public final class ReleaseTimes {
    private static final String TAG = "MSP-ATV-TIME";
    private static final Pattern COMING = Pattern.compile(
            "Coming (?:This |Next )?(?:Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)|Coming Tomorrow|Coming Today");
    private static final String SECTION_ID = "canonicalSectionComing Soon";

    private ReleaseTimes() {
    }

    /** Overwritten by the patch: "device", "12", or "24". */
    public static String timeFormat() {
        return "device";
    }

    private static boolean use24Hour() {
        String format = timeFormat();
        if ("24".equals(format)) return true;
        if ("12".equals(format)) return false;
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            return android.text.format.DateFormat.is24HourFormat(app);
        } catch (Throwable t) {
            return false;
        }
    }

    private static String format(long millis, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern, Locale.getDefault());
        format.setTimeZone(TimeZone.getDefault());
        return format.format(new Date(millis));
    }

    private static String time(long millis) {
        String pattern = use24Hour() ? "HH:mm z" : "h:mm a z";
        return format(millis, pattern);
    }

    /** "Tue 4:00 PM PST" */
    static String shortLabel(long millis) {
        return format(millis, "EEE") + " " + time(millis);
    }

    /** "Coming Tuesday at 4:00 PM PST" */
    static String badgeLabel(long millis) {
        return "Coming " + format(millis, "EEEE") + " at " + time(millis);
    }

    /** "Tuesday, November 10, 2026 at 4:00 PM PST" */
    static String fullLabel(long millis) {
        return format(millis, "EEEE, MMMM d, yyyy") + " at " + time(millis);
    }

    public static String filter(String json) {
        if (json == null || (!json.contains("comingSoonDate") && !json.contains(SECTION_ID))) {
            return json;
        }
        try {
            Object root = json.trim().startsWith("[") ? new JSONArray(json) : new JSONObject(json);
            long[] pageRelease = {pageReleaseMillis(root)};
            boolean[] changed = {false};
            walk(root, pageRelease[0], changed);
            if (changed[0]) {
                return root.toString();
            }
        } catch (Throwable t) {
            Log.w(TAG, "filter failed", t);
        }
        return json;
    }

    /** The release time of the title an episode page is about, or -1. */
    private static long pageReleaseMillis(Object root) {
        String[] day = {null};
        java.util.List<Long> releases = new java.util.ArrayList<>();
        collect(root, day, releases);
        if (day[0] == null) return -1;
        SimpleDateFormat utc = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        utc.setTimeZone(TimeZone.getTimeZone("UTC"));
        for (long release : releases) {
            if (day[0].equals(utc.format(new Date(release)))) return release;
        }
        return -1;
    }

    private static void collect(Object node, String[] day, java.util.List<Long> releases) {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Object coming = object.opt("comingSoonDate");
            if (coming instanceof String && day[0] == null && object.optBoolean("isComingSoon", false)) {
                day[0] = (String) coming;
            }
            Object release = object.opt("releaseDate");
            if (release instanceof Number) releases.add(((Number) release).longValue());
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) collect(object.opt(keys.next()), day, releases);
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) collect(array.opt(i), day, releases);
        }
    }

    private static void walk(Object node, long pageRelease, boolean[] changed) throws Exception {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            JSONObject attributes = object.optJSONObject("attributes");
            Object seconds = attributes == null ? null : attributes.opt("comingSoonDate");
            if (seconds instanceof Number && object.opt("children") != null) {
                long millis = ((Number) seconds).longValue() * 1000L;
                relabel(object.opt("children"), shortLabel(millis), changed);
            }
            if (pageRelease > 0) {
                JSONObject badge = object.optJSONObject("editorialBadge");
                if (badge != null) relabel(badge, badgeLabel(pageRelease), changed);
                JSONObject item = object.optJSONObject("canonicalSectionItem");
                if (item != null && SECTION_ID.equals(item.optString("id"))) {
                    describe(item, fullLabel(pageRelease), changed);
                }
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                if (!"metrics".equals(key)) walk(object.opt(key), pageRelease, changed);
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) walk(array.opt(i), pageRelease, changed);
        }
    }

    /** Replaces "Coming This Wednesday" in shown text (value, accessibilityText). */
    private static void relabel(Object node, String label, boolean[] changed) throws Exception {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            java.util.List<String> names = new java.util.ArrayList<>();
            while (keys.hasNext()) names.add(keys.next());
            for (String key : names) {
                Object value = object.opt(key);
                if (value instanceof String && ("value".equals(key) || "accessibilityText".equals(key))) {
                    Matcher matcher = COMING.matcher((String) value);
                    if (matcher.find()) {
                        object.put(key, matcher.replaceFirst(Matcher.quoteReplacement(label)));
                        changed[0] = true;
                    }
                } else if (!"metrics".equals(key)) {
                    relabel(value, label, changed);
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) relabel(array.opt(i), label, changed);
        }
    }

    /** The Information row: its description (and the dialog it opens) get the full date. */
    private static void describe(JSONObject item, String label, boolean[] changed) throws Exception {
        JSONArray children = item.optJSONArray("children");
        if (children == null) return;
        for (int i = 0; i < children.length(); i++) {
            JSONObject child = children.optJSONObject(i);
            JSONObject description = child == null ? null : child.optJSONObject("description");
            if (description == null) continue;
            description.put("value", label);
            changed[0] = true;
            JSONObject prefetched = description.optJSONObject("routerDataSource");
            prefetched = prefetched == null ? null : prefetched.optJSONObject("selectEventDataSource");
            prefetched = prefetched == null ? null : prefetched.optJSONObject("documentDataSource");
            prefetched = prefetched == null ? null : prefetched.optJSONObject("prefetchedData");
            if (prefetched != null && prefetched.has("description")) prefetched.put("description", label);
        }
    }
}
