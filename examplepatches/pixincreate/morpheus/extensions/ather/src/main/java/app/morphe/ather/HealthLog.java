package app.morphe.ather;

import android.content.Context;
import android.content.SharedPreferences;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Captures the Ather "True Health" report.
 *
 * <p>The report is computed by Ather's servers and delivered as a list of parts. Every part,
 * including the battery, is one {@code Component} with an id, a name, a score and a maximum
 * score. The app builds those objects while parsing the response, so hooking the constructor
 * captures the whole report without touching the network layer.
 *
 * <p>Components built within a short window belong to the same fetch; that window is what groups
 * them into one snapshot.
 */
public final class HealthLog {

    private static final String PREFS = "ather_morphe";
    private static final String KEY_REPORT = "health_report";
    private static final String KEY_REPORT_TIME = "health_report_time";
    private static final String KEY_SOH_HISTORY = "health_soh_history";
    private static final String KEY_WEAR = "health_wear";
    private static final String KEY_WEAR_HISTORY = "health_wear_history";

    /** Wipes every captured report and reading. */
    public static void clear() {
        try {
            android.content.Context ctx = MapPref.appContext();
            if (ctx == null) {
                return;
            }
            ctx.getSharedPreferences(PREFS, android.content.Context.MODE_PRIVATE).edit()
                    .remove(KEY_REPORT)
                    .remove(KEY_REPORT_TIME)
                    .remove(KEY_SOH_HISTORY)
                    .remove(KEY_WEAR)
                    .remove(KEY_WEAR_HISTORY)
                    .apply();
        } catch (Throwable t) {
            // Nothing to do.
        }
    }

    /** Components built less than this far apart are treated as one report. */
    private static final long FETCH_WINDOW_MS = 3000L;
    private static final int MAX_SOH_RECORDS = 100;

    /** Parts of the report being collected right now, keyed by part id. */
    private static final Map<String, String> current = new LinkedHashMap<>();
    private static long fetchStart;

    private HealthLog() {
    }

    /**
     * Hook called from the report's {@code Component} constructor.
     *
     * @param id       part id, for example {@code battery}
     * @param name     display name of the part
     * @param score    score awarded to the part
     * @param maxScore highest score the part can reach
     */
    public static void onComponent(String id, String name, double score, double maxScore) {
        try {
            if (id == null || id.isEmpty()) {
                return;
            }
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return;
            }
            long now = System.currentTimeMillis();
            if (now - fetchStart > FETCH_WINDOW_MS) {
                fetchStart = now;
                current.clear();
            }

            String line = id + "|" + (name == null ? "" : name) + "|" + trim(score) + "|"
                    + trim(maxScore);
            String previous = current.get(id);
            current.put(id, line);

            if (line.equals(previous)) {
                // Same value in the same fetch: nothing new to store.
                return;
            }

            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            SharedPreferences.Editor e = p.edit();

            StringBuilder sb = new StringBuilder();
            for (String part : current.values()) {
                if (sb.length() > 0) {
                    sb.append('\n');
                }
                sb.append(part);
            }
            e.putString(KEY_REPORT, sb.toString());
            e.putLong(KEY_REPORT_TIME, fetchStart);

            if (id.toLowerCase(Locale.US).contains("battery")) {
                recordSoh(p, e, now, score, maxScore);
            }
            e.apply();
        } catch (Throwable t) {
            // Never let the hook break response parsing.
        }
    }

    /**
     * Hook called from the report's {@code WearAndTearComponent} constructor. These are the parts
     * that wear with distance, for example the belt and the brakes.
     *
     * @param id           part id
     * @param name         display name of the part
     * @param remainingKms kilometres of rated life still available
     * @param totalKms     rated life of the part
     * @param lifePercent  share of rated life still available
     */
    public static void onWear(String id, String name, int remainingKms, int totalKms,
                              int lifePercent) {
        storeWear(id, name, remainingKms, totalKms, lifePercent);
    }

    /**
     * Hook called from the report's {@code Health} constructor, which holds both part lists. The
     * wear list is read here as well so a part is captured even when its own constructor hook does
     * not run.
     *
     * @param components score parts of the report
     * @param wear       wear and tear parts of the report
     */
    public static void onHealth(Object components, Object wear) {
        try {
            if (wear instanceof List) {
                for (Object part : (List<?>) wear) {
                    captureWear(part);
                }
            }
        } catch (Throwable t) {
            // Never let the hook break response parsing.
        }
    }

    /** Reads one wear part reflectively and stores it. */
    private static void captureWear(Object part) {
        if (part == null) {
            return;
        }
        try {
            Class<?> type = part.getClass();
            Object id = field(type, part, "a");
            Object name = field(type, part, "b");
            storeWear(id == null ? null : String.valueOf(id),
                    name == null ? null : String.valueOf(name),
                    (int) asLong(String.valueOf(field(type, part, "c"))),
                    (int) asLong(String.valueOf(field(type, part, "d"))),
                    (int) asLong(String.valueOf(field(type, part, "e"))));
        } catch (Throwable t) {
            // Skip a part that cannot be read.
        }
    }

    private static Object field(Class<?> type, Object target, String name) throws Exception {
        java.lang.reflect.Field f = type.getField(name);
        return f.get(target);
    }

    private static void storeWear(String id, String name, int remainingKms, int totalKms,
                                  int lifePercent) {
        try {
            if (id == null || id.isEmpty()) {
                return;
            }
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return;
            }
            String shown = name == null || name.isEmpty() ? id : name;

            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            SharedPreferences.Editor e = p.edit();

            Map<String, String> wear = readLines(p.getString(KEY_WEAR, ""));
            String line = id + "|" + shown + "|" + remainingKms + "|" + totalKms + "|"
                    + lifePercent;
            if (line.equals(wear.get(id))) {
                return;
            }
            wear.put(id, line);

            StringBuilder sb = new StringBuilder();
            for (String part : wear.values()) {
                if (sb.length() > 0) {
                    sb.append('\n');
                }
                sb.append(part);
            }
            e.putString(KEY_WEAR, sb.toString());

            // Keep a history so wear can be watched over the months.
            String value = shown + "|" + remainingKms + "|" + totalKms + "|" + lifePercent;
            String old = p.getString(KEY_WEAR_HISTORY, "");
            if (old == null) {
                old = "";
            }
            String[] lines = old.split("\n");
            if (lines.length == 0 || lines[0].isEmpty()
                    || !lines[0].startsWith(id + "|" + value)) {
                String merged = id + "|" + value + "|" + System.currentTimeMillis() + "\n" + old;
                int cut = nthNewline(merged, MAX_SOH_RECORDS);
                e.putString(KEY_WEAR_HISTORY, cut > 0 ? merged.substring(0, cut) : merged);
            }
            e.apply();
        } catch (Throwable t) {
            // Never let the hook break response parsing.
        }
    }

    /** Every wear part of the latest report, as label/value rows. */
    /**
     * Every stored health reading as one CSV table. The {@code kind} column separates the part
     * scores, the wear-and-tear readings and the battery history.
     */
    public static String healthCsv() {
        StringBuilder sb = new StringBuilder(
                "recorded_at,kind,id,name,score,max_score,life_percent,remaining_km,total_km\n");
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return sb.toString();
            }
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            long reportTime = p.getLong(KEY_REPORT_TIME, 0L);

            for (String line : lines(p.getString(KEY_REPORT, ""))) {
                String[] f = line.split("\\|");
                if (f.length < 4) {
                    continue;
                }
                sb.append(iso(reportTime)).append(",score,")
                        .append(escape(f[0])).append(',')
                        .append(escape(f[1])).append(',')
                        .append(escape(f[2])).append(',')
                        .append(escape(f[3])).append(",,,\n");
            }
            for (String line : lines(p.getString(KEY_WEAR, ""))) {
                String[] f = line.split("\\|");
                if (f.length < 5) {
                    continue;
                }
                sb.append(iso(reportTime)).append(",wear,")
                        .append(escape(f[0])).append(',')
                        .append(escape(f[1])).append(",,,")
                        .append(escape(f[4])).append(',')
                        .append(escape(f[2])).append(',')
                        .append(escape(f[3])).append('\n');
            }
            for (String line : lines(p.getString(KEY_SOH_HISTORY, ""))) {
                String[] f = line.split("\\|");
                if (f.length < 3) {
                    continue;
                }
                sb.append(iso(asLong(f[0]))).append(",battery_history,battery,Battery,")
                        .append(escape(f[1])).append(',')
                        .append(escape(f[2])).append(",,,\n");
            }
        } catch (Throwable t) {
            // Return what was built.
        }
        return sb.toString();
    }

    private static List<String> lines(String raw) {
        List<String> out = new ArrayList<>();
        if (raw == null || raw.isEmpty()) {
            return out;
        }
        for (String line : raw.split("\n")) {
            if (!line.isEmpty()) {
                out.add(line);
            }
        }
        return out;
    }

    /** A timestamp a spreadsheet can sort, for example 2026-09-20 19:36:27. */
    private static String iso(long millis) {
        if (millis <= 0L) {
            return "";
        }
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date(millis));
    }

    /** A CSV field, quoted when it holds a comma or a quote. */
    private static String escape(String value) {
        if (value == null) {
            return "";
        }
        if (value.indexOf(',') < 0 && value.indexOf('"') < 0) {
            return value;
        }
        return "\"" + value.replace("\"", "\"\"") + "\"";
    }

    public static List<String[]> wearRows() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            for (String line : readLines(p.getString(KEY_WEAR, "")).values()) {
                String[] parts = line.split("\\|", -1);
                if (parts.length < 5) {
                    continue;
                }
                rows.add(new String[]{parts[1], wear(parts[2], parts[3], parts[4])});
            }
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    /** Wear readings over time, newest first, as label/value rows. */
    public static List<String[]> wearHistoryRows() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            String raw = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getString(KEY_WEAR_HISTORY, "");
            if (raw == null || raw.isEmpty()) {
                return rows;
            }
            for (String line : raw.split("\n")) {
                String[] parts = line.split("\\|", -1);
                if (parts.length < 6) {
                    continue;
                }
                rows.add(new String[]{time(asLong(parts[5])) + "   " + parts[1],
                        wear(parts[2], parts[3], parts[4])});
            }
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    /** Renders a wear part as remaining of total plus the remaining share. */
    private static String wear(String remaining, String total, String percent) {
        long r = asLong(remaining);
        String shown = r + " / " + asLong(total) + " km";
        if (!percent.isEmpty()) {
            shown = shown + "   " + percent + "% life left";
        }
        return shown;
    }

    /** Parses stored {@code id|...} lines into a map keyed by part id, keeping insertion order. */
    private static Map<String, String> readLines(String raw) {
        Map<String, String> out = new LinkedHashMap<>();
        if (raw == null || raw.isEmpty()) {
            return out;
        }
        for (String line : raw.split("\n")) {
            int bar = line.indexOf('|');
            if (bar > 0) {
                out.put(line.substring(0, bar), line);
            }
        }
        return out;
    }

    /** Appends a battery reading to the history when it differs from the last one stored. */
    private static void recordSoh(SharedPreferences p, SharedPreferences.Editor e, long now,
                                  double score, double maxScore) {
        String value = trim(score) + "|" + trim(maxScore);
        String old = p.getString(KEY_SOH_HISTORY, "");
        if (old == null) {
            old = "";
        }
        String[] lines = old.split("\n");
        if (lines.length > 0 && !lines[0].isEmpty()) {
            String[] parts = lines[0].split("\\|");
            if (parts.length == 3 && value.equals(parts[1] + "|" + parts[2])) {
                return;
            }
        }
        String merged = now + "|" + value + "\n" + old;
        int cut = nthNewline(merged, MAX_SOH_RECORDS);
        e.putString(KEY_SOH_HISTORY, cut > 0 ? merged.substring(0, cut) : merged);
    }

    /** Every part of the latest report, as label/value rows. */
    public static List<String[]> healthRows() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            String raw = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getString(KEY_REPORT, "");
            if (raw == null || raw.isEmpty()) {
                return rows;
            }
            for (String line : raw.split("\n")) {
                String[] parts = line.split("\\|", -1);
                if (parts.length < 4) {
                    continue;
                }
                String name = parts[1].isEmpty() ? parts[0] : parts[1];
                rows.add(new String[]{name, score(parts[2], parts[3])});
            }
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    /** When the report currently stored was fetched, or 0 when none has been seen. */
    public static long reportTime() {
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return 0L;
            }
            return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getLong(KEY_REPORT_TIME, 0L);
        } catch (Throwable t) {
            return 0L;
        }
    }

    /** Battery readings over time, newest first, as label/value rows. */
    public static List<String[]> sohRows() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            String raw = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getString(KEY_SOH_HISTORY, "");
            if (raw == null || raw.isEmpty()) {
                return rows;
            }
            for (String line : raw.split("\n")) {
                String[] parts = line.split("\\|", -1);
                if (parts.length < 3) {
                    continue;
                }
                rows.add(new String[]{time(asLong(parts[0])), score(parts[1], parts[2])});
            }
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    // --------------------------------------------------------------- internals

    private static String score(String value, String max) {
        String shown = value;
        double v = asDouble(value);
        double m = asDouble(max);
        if (m > 0.0) {
            shown = value + " / " + max + "  (" + Math.round(v / m * 100.0) + "%)";
        } else if (!max.isEmpty()) {
            shown = value + " / " + max;
        }
        return shown;
    }

    private static String time(long millis) {
        return new java.text.SimpleDateFormat("dd MMM HH:mm", Locale.US)
                .format(new java.util.Date(millis));
    }

    private static String trim(double v) {
        if (v == Math.rint(v) && !Double.isInfinite(v)) {
            return String.valueOf((long) v);
        }
        return String.format(Locale.US, "%.1f", v);
    }

    private static double asDouble(String s) {
        try {
            return Double.parseDouble(s);
        } catch (Throwable t) {
            return 0.0;
        }
    }

    private static long asLong(String s) {
        try {
            return Long.parseLong(s);
        } catch (Throwable t) {
            return 0L;
        }
    }

    private static int nthNewline(String s, int n) {
        int index = -1;
        for (int i = 0; i < n; i++) {
            index = s.indexOf('\n', index + 1);
            if (index < 0) {
                return -1;
            }
        }
        return index;
    }
}
