package app.mightymorphing.extension.joey;

import android.content.Context;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Short notes about comment requests that went wrong, shown in Report a problem.
 * Each note is built from fixed fields only: a feature name, status codes, counts and yes/no
 * answers. No ids, names, links or text from Reddit ever go in.
 */
final class RequestLog {
    private static final String FILE = "morphe_requests.txt";
    private static final String GOOD_FILE = "morphe_requests_ok.txt";
    private static final String COUNTS = "morphe_request_counts";
    private static final int KEEP = 30;
    private static final int KEEP_GOOD = 10;
    /** The counters shown in the report, in this order. */
    static final String[][] COUNT_NAMES = {
            {"morechildren-taps", "Load more taps"},
            {"morechildren-clean", "  went cleanly"},
            {"morechildren-problem", "  had a problem"},
            {"comment-lookups", "Comment lookups"},
            {"comment-lookup-clean", "  went cleanly"},
            {"comment-lookup-recovered", "  recovered by Morphe"},
            {"comment-lookup-failed", "  failed"},
    };
    private static final Object LOCK = new Object();

    private RequestLog() {
    }

    /** Builds one note. Keys and values are cut down to plain characters on the way in. */
    static final class Entry {
        private final StringBuilder out = new StringBuilder();

        Entry(String feature) {
            out.append(new SimpleDateFormat("MM-dd HH:mm:ss", Locale.US).format(new Date()))
                    .append(' ').append(clean(feature));
        }

        Entry put(String key, Object value) {
            if (value == null) return this;
            String text = clean(String.valueOf(value));
            if (!text.isEmpty()) out.append(' ').append(clean(key)).append('=').append(text);
            return this;
        }

        void save() {
            add(FILE, KEEP, out.toString());
        }

        void saveGood() {
            add(GOOD_FILE, KEEP_GOOD, out.toString());
        }
    }

    static Entry entry(String feature) {
        return new Entry(feature);
    }

    private static String clean(String value) {
        String out = value.replaceAll("[^A-Za-z0-9_.:,/\\-]", "");
        return out.length() > 40 ? out.substring(0, 40) : out;
    }

    private static void add(String name, int keep, String line) {
        Context context = ProblemReport.app();
        if (context == null) return;
        synchronized (LOCK) {
            try {
                List<String> lines = read(context, name);
                lines.add(line);
                while (lines.size() > keep) lines.remove(0);
                StringBuilder all = new StringBuilder();
                for (String item : lines) all.append(item).append('\n');
                try (OutputStream file = new FileOutputStream(new File(context.getFilesDir(), name))) {
                    file.write(all.toString().getBytes(StandardCharsets.UTF_8));
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static List<String> read(Context context, String name) {
        List<String> list = new ArrayList<>();
        File file = new File(context.getFilesDir(), name);
        if (!file.exists()) return list;
        try (InputStream in = new java.io.FileInputStream(file)) {
            byte[] data = new byte[(int) Math.min(file.length(), 64 * 1024)];
            int read = in.read(data);
            for (String part : new String(data, 0, Math.max(0, read), StandardCharsets.UTF_8).split("\n")) {
                if (!part.trim().isEmpty()) list.add(part);
            }
        } catch (Throwable ignored) {
        }
        return list;
    }

    static List<String> lines(Context context) {
        synchronized (LOCK) {
            return read(context, FILE);
        }
    }

    static List<String> goodLines(Context context) {
        synchronized (LOCK) {
            return read(context, GOOD_FILE);
        }
    }

    /** Adds one to a named counter. */
    static void count(String key) {
        Context context = ProblemReport.app();
        if (context == null) return;
        synchronized (LOCK) {
            try {
                android.content.SharedPreferences prefs = context.getSharedPreferences(COUNTS, Context.MODE_PRIVATE);
                prefs.edit().putInt(key, prefs.getInt(key, 0) + 1).commit();
            } catch (Throwable ignored) {
            }
        }
    }

    /** Counter lines for the report. Empty when nothing has been counted. */
    static List<String> counts(Context context) {
        List<String> list = new ArrayList<>();
        synchronized (LOCK) {
            try {
                android.content.SharedPreferences prefs = context.getSharedPreferences(COUNTS, Context.MODE_PRIVATE);
                if (prefs.getAll().isEmpty()) return list;
                for (String[] item : COUNT_NAMES) list.add(item[1] + ": " + prefs.getInt(item[0], 0));
            } catch (Throwable ignored) {
            }
        }
        return list;
    }

    static boolean isEmpty(Context context) {
        return lines(context).isEmpty() && goodLines(context).isEmpty() && counts(context).isEmpty();
    }

    static void clear(Context context) {
        synchronized (LOCK) {
            new File(context.getFilesDir(), FILE).delete();
            new File(context.getFilesDir(), GOOD_FILE).delete();
            try {
                context.getSharedPreferences(COUNTS, Context.MODE_PRIVATE).edit().clear().commit();
            } catch (Throwable ignored) {
            }
        }
    }
}
