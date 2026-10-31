package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Maps Car's own log lines: to logcat as before, and to this app's private files for the problem
 * report ({@link ReportPatch}). Logcat on the head unit is short and is lost when the car restarts.
 * <p>
 * Two files of at most 256 KiB in files/morphe_reports/log: 0.txt is written, 1.txt holds the one
 * before. One background thread writes; a failure only loses lines. Lines logged before
 * {@link #start} (from attachBaseContext) wait in memory. Each process appends whole lines, so
 * the processes of the app can share the files.
 */
final class ReportLog {
    /** The tags of the extension's classes, which call this class instead of android.util.Log. */
    static final String[] TAGS = {"MorpheApiCompat", "MorpheBydBattery", "MorpheBydBands", "MorpheBydModel",
            "MorpheLocationLockout", "MorpheLocationService", "MorpheReport", "MorpheSafeMode", "MorpheSendToCar",
            "MorpheTtsWarmup", "MorpheUiDensity", "MorpheWatchdog", "MorpheWindow"};
    private static final long MAX_FILE_BYTES = 256 * 1024;
    private static final int MAX_LINE_CHARS = 1024, STACK_FRAMES = 5, CAUSE_FRAMES = 2, MAX_CAUSES = 3, MAX_PENDING = 500;
    private static final String CURRENT = "0.txt", PREVIOUS = "1.txt";
    private static final Object lock = new Object(), fileLock = new Object();
    // Guarded by lock.
    private static final List<String> pending = new ArrayList<>();
    private static final SimpleDateFormat TIME = utcFormat();
    private static File folder;
    private static boolean scheduled;
    private static ExecutorService writer;

    private ReportLog() {
    }

    static void i(String tag, String message) {
        Log.i(tag, message);
        add('I', tag, message, null);
    }

    static void i(String tag, String message, Throwable error) {
        Log.i(tag, message, error);
        add('I', tag, message, error);
    }

    static void w(String tag, String message) {
        Log.w(tag, message);
        add('W', tag, message, null);
    }

    static void w(String tag, String message, Throwable error) {
        Log.w(tag, message, error);
        add('W', tag, message, error);
    }

    /** A stack that is not a throwable's, such as a stuck thread's: its first [max] frames as trace lines. */
    static void w(String tag, String message, StackTraceElement[] stack, int max) {
        StringBuilder text = new StringBuilder(message);
        for (int i = 0; i < Math.min(max, stack.length); i++) text.append("\n\tat ").append(stack[i]);
        Log.w(tag, text.toString());
        try {
            long now = System.currentTimeMillis();
            synchronized (lock) {
                if (pending.size() >= MAX_PENDING) return;
                pending.add(line(TIME.format(new Date(now)) + "Z W " + tag + ": " + oneLine(message)));
                for (int i = 0; i < Math.min(max, stack.length); i++) pending.add(line("\tat " + stack[i]));
                schedule();
            }
        } catch (RuntimeException ignored) {
            // Logging never fails the caller.
        }
    }

    /** From Application.onCreate in each process: the files folder, and the lines waiting for it. */
    static void start(Context context) {
        try {
            File dir = new File(new File(context.getFilesDir(), "morphe_reports"), "log");
            if (!dir.isDirectory() && !dir.mkdirs()) return;
            synchronized (lock) {
                if (folder != null) return;
                folder = dir;
                schedule();
            }
        } catch (RuntimeException error) {
            Log.w("MorpheReport", "report log not started", error);
        }
    }

    private static void add(char level, String tag, String message, Throwable error) {
        try {
            long now = System.currentTimeMillis();
            synchronized (lock) {
                if (pending.size() >= MAX_PENDING) return;
                pending.add(line(TIME.format(new Date(now)) + "Z " + level + " " + tag + ": " + oneLine(message)));
                if (error != null) addTrace(error);
                schedule();
            }
        } catch (RuntimeException ignored) {
            // Logging never fails the caller.
        }
    }

    // Guarded by lock. The throwable, its first frames, and its causes as "Caused by:" lines.
    private static void addTrace(Throwable error) {
        pending.add(line("\t" + oneLine(String.valueOf(error))));
        frames(error, STACK_FRAMES);
        Throwable cause = error.getCause();
        for (int count = 0; cause != null && cause != error && count < MAX_CAUSES; count++) {
            pending.add(line("Caused by: " + oneLine(String.valueOf(cause))));
            frames(cause, CAUSE_FRAMES);
            cause = cause.getCause();
        }
    }

    private static void frames(Throwable error, int count) {
        StackTraceElement[] stack = error.getStackTrace();
        for (int i = 0; i < Math.min(count, stack.length); i++) pending.add(line("\tat " + stack[i]));
    }

    // Guarded by lock.
    private static void schedule() {
        if (scheduled || folder == null || pending.isEmpty()) return;
        if (writer == null) {
            writer = Executors.newSingleThreadExecutor(runnable -> {
                Thread thread = new Thread(runnable, "MorpheReportLog");
                thread.setDaemon(true);
                return thread;
            });
        }
        scheduled = true;
        writer.execute(ReportLog::drain);
    }

    /** Writes the waiting lines now, on the calling thread: the crash handler, before the process ends. */
    static void flush() {
        drain();
    }

    private static void drain() {
        List<String> lines;
        File dir;
        synchronized (lock) {
            scheduled = false;
            lines = new ArrayList<>(pending);
            pending.clear();
            dir = folder;
        }
        if (dir == null || lines.isEmpty()) return;
        synchronized (fileLock) {
            write(dir, lines);
        }
    }

    // Guarded by fileLock.
    private static void write(File dir, List<String> lines) {
        File current = new File(dir, CURRENT);
        OutputStream out = null;
        try {
            long size = current.length();
            out = new FileOutputStream(current, true);
            for (String line : lines) {
                byte[] bytes = (line + "\n").getBytes(StandardCharsets.UTF_8);
                if (size > 0 && size + bytes.length > MAX_FILE_BYTES) {
                    out.close();
                    File previous = new File(dir, PREVIOUS);
                    //noinspection ResultOfMethodCallIgnored
                    previous.delete();
                    //noinspection ResultOfMethodCallIgnored
                    current.renameTo(previous);
                    out = new FileOutputStream(current, false);
                    size = 0;
                }
                out.write(bytes);
                size += bytes.length;
            }
        } catch (Exception ignored) {
            // The lines are lost; logcat still has them.
        } finally {
            try {
                if (out != null) out.close();
            } catch (Exception ignored) {
                // Nothing more to lose.
            }
        }
    }

    /** The lines for a report: a time window and the caps, newest kept. */
    static final class Recent {
        final List<String> lines = new ArrayList<>();
        int dropped;
        String from, to;
    }

    /**
     * The entries since the given time, newest first until either cap, returned oldest first. An
     * entry's trace lines stay with it. Called off the main thread.
     */
    static Recent recent(long sinceMillis, int maxLines, int maxBytes) {
        Recent result = new Recent();
        List<List<String>> entries = new ArrayList<>();
        List<Long> times = new ArrayList<>();
        File dir;
        synchronized (lock) {
            dir = folder;
        }
        if (dir != null) {
            drain();
            synchronized (fileLock) {
                for (String name : new String[]{PREVIOUS, CURRENT}) read(new File(dir, name), entries, times);
            }
        }
        int lines = 0, bytes = 0, first = entries.size();
        for (int i = entries.size() - 1; i >= 0; i--) {
            if (times.get(i) < sinceMillis) break;
            int size = 0;
            for (String line : entries.get(i)) size += line.getBytes(StandardCharsets.UTF_8).length + 3;
            if (lines + entries.get(i).size() > maxLines || bytes + size > maxBytes) break;
            lines += entries.get(i).size();
            bytes += size;
            first = i;
        }
        for (int i = first; i < entries.size(); i++) result.lines.addAll(entries.get(i));
        for (int i = 0; i < first; i++) if (times.get(i) >= sinceMillis) result.dropped += entries.get(i).size();
        if (first < entries.size()) {
            result.from = entries.get(first).get(0).substring(0, 24);
            result.to = entries.get(entries.size() - 1).get(0).substring(0, 24);
        }
        return result;
    }

    // Lines that start with a time begin an entry; the others belong to the entry before them.
    private static void read(File file, List<List<String>> entries, List<Long> times) {
        if (!file.isFile()) return;
        try (BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8))) {
            String line;
            while ((line = in.readLine()) != null) {
                long time = entryTime(line);
                if (time >= 0) {
                    List<String> entry = new ArrayList<>();
                    entry.add(line);
                    entries.add(entry);
                    times.add(time);
                } else if (!entries.isEmpty() && !line.isEmpty()) {
                    entries.get(entries.size() - 1).add(line);
                }
            }
        } catch (Exception ignored) {
            // A damaged file gives fewer lines.
        }
    }

    /** Whether the line starts an entry ("2026-10-29T09:44:20.115Z I Tag: …") rather than continuing a trace. */
    static boolean isEntry(String line) {
        return line.length() >= 26 && line.charAt(10) == 'T' && line.charAt(23) == 'Z' && line.charAt(24) == ' ';
    }

    // The entry's time, or -1 for a trace line.
    private static long entryTime(String line) {
        if (!isEntry(line)) return -1;
        try {
            synchronized (lock) {
                return TIME.parse(line.substring(0, 23)).getTime();
            }
        } catch (ParseException | RuntimeException error) {
            return -1;
        }
    }

    private static String oneLine(String text) {
        return text == null ? "null" : text.replace("\r\n", "\n").replace('\r', '\n').replace("\n", "\\n");
    }

    private static String line(String text) {
        return text.length() <= MAX_LINE_CHARS ? text : text.substring(0, MAX_LINE_CHARS - 1) + "…";
    }

    private static SimpleDateFormat utcFormat() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.US);
        format.setTimeZone(TimeZone.getTimeZone("UTC"));
        return format;
    }
}
