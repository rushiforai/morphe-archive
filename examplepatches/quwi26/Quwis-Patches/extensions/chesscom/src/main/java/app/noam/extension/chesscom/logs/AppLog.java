package app.noam.extension.chesscom.logs;

import android.content.Context;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

import app.noam.extension.chesscom.Features;

/**
 * Keeps this app's own logcat entries in a small rotating file, so the lines from before a restart
 * can still be read afterwards. Android shows an app only its own process's entries: no READ_LOGS
 * permission is involved, and nothing else on the phone is captured.
 */
public final class AppLog {
    private static final String FILE = "app-log.txt";
    private static final String OLD_FILE = "app-log.old.txt";
    /** Each file stays this small; the previous one is kept too, so about a megabyte in all. */
    private static final long MAX_BYTES = 512 * 1024;
    /** What the screen shows: a tail a TextView can still draw quickly. */
    private static final int SHOW_CHARS = 60_000;
    private static final String EMPTY =
        "Nothing was recorded yet. Play a game or open a review, then come back.";

    private static Context context;
    private static Thread thread;
    /** The first run dumps what is already buffered; later runs follow from the last line. */
    private static boolean firstBuffer = true;

    private AppLog() {}

    /** Called from MainApplication.onCreate; does nothing unless the patch is in and the row is on. */
    public static void install(Context app) {
        if (app == null || !Features.logsPatched()) return;
        if (!Features.isEnabled(Features.LOGS)) return;
        if (thread != null) return;
        context = app.getApplicationContext();
        thread = new Thread(AppLog::follow, "morphe-app-logs");
        thread.setDaemon(true);
        thread.start();
    }

    /** Reads logcat into the file, following it for as long as the app lives. */
    private static void follow() {
        while (!Thread.currentThread().isInterrupted()) {
            Process process = null;
            try {
                process = start();
                BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
                try {
                    File file = file();
                    OutputStream out = new FileOutputStream(file, true);
                    long written = file.length();
                    try {
                        String line;
                        while ((line = reader.readLine()) != null) {
                            byte[] bytes = (line + "\n").getBytes(StandardCharsets.UTF_8);
                            out.write(bytes);
                            written += bytes.length;
                            if (written > MAX_BYTES) {
                                out.close();
                                out = rotate();
                                written = 0;
                            }
                        }
                    } finally {
                        closeQuietly(out);
                    }
                } finally {
                    closeQuietly(reader);
                }
            } catch (Throwable throwable) {
                // logcat may be missing on this build: the screen says so instead of crashing.
            } finally {
                if (process != null) process.destroy();
            }
            try {
                Thread.sleep(5000);
            } catch (InterruptedException stop) {
                return;
            }
        }
    }

    /** Starts logcat; some ROMs only expose the binary by its full path. */
    private static Process start() throws IOException {
        try {
            return logcat("logcat");
        } catch (IOException missing) {
            return logcat("/system/bin/logcat");
        }
    }

    private static Process logcat(String binary) throws IOException {
        ProcessBuilder builder = firstBuffer
            ? new ProcessBuilder(binary, "-v", "threadtime")
            : new ProcessBuilder(binary, "-v", "threadtime", "-T", "1");
        builder.redirectErrorStream(true);
        Process process = builder.start();
        firstBuffer = false;
        return process;
    }

    /** The file for this run; the previous one becomes app-log.old.txt. */
    private static OutputStream rotate() throws IOException {
        File file = file();
        File old = new File(context.getFilesDir(), OLD_FILE);
        old.delete();
        file.renameTo(old);
        return new FileOutputStream(file, false);
    }

    /** The newest lines kept on this phone, oldest first, or a note when there are none yet. */
    public static String text() {
        if (context == null) return EMPTY;
        try {
            StringBuilder kept = new StringBuilder();
            kept.append(tail(new File(context.getFilesDir(), OLD_FILE), SHOW_CHARS / 6));
            kept.append(tail(file(), SHOW_CHARS));
            String text = kept.toString();
            if (text.trim().isEmpty()) return EMPTY;
            if (text.length() > SHOW_CHARS) {
                text = text.substring(text.length() - SHOW_CHARS);
                int firstLine = text.indexOf('\n');
                if (firstLine >= 0 && firstLine + 1 < text.length()) text = text.substring(firstLine + 1);
            }
            return text;
        } catch (Throwable throwable) {
            return "The log could not be read: " + throwable;
        }
    }

    /** How much is kept, for the settings row. */
    public static String describe() {
        if (context == null) return "Nothing yet.";
        try {
            long size = file().length() + new File(context.getFilesDir(), OLD_FILE).length();
            if (size <= 0) return "Nothing yet.";
            return (size + 1023) / 1024 + " KB of about " + (MAX_BYTES * 2) / (1024 * 1024) + " MB kept.";
        } catch (Throwable throwable) {
            return "Unknown.";
        }
    }

    public static void clear() {
        if (context == null) return;
        file().delete();
        new File(context.getFilesDir(), OLD_FILE).delete();
    }

    private static File file() {
        return new File(context.getFilesDir(), FILE);
    }

    /** The last [maxChars] characters of the file, starting on a whole line. */
    private static String tail(File file, int maxChars) {
        if (file == null || !file.isFile() || file.length() == 0) return "";
        FileInputStream in = null;
        try {
            long length = file.length();
            long start = Math.max(0, length - (long) maxChars * 4);
            in = new FileInputStream(file);
            long remaining = start;
            while (remaining > 0) {
                long skipped = in.skip(remaining);
                if (skipped <= 0) break;
                remaining -= skipped;
            }
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            byte[] chunk = new byte[8192];
            int read;
            while ((read = in.read(chunk)) > 0) buffer.write(chunk, 0, read);
            String text = new String(buffer.toByteArray(), StandardCharsets.UTF_8);
            if (start > 0) {
                int firstLine = text.indexOf('\n');
                if (firstLine >= 0) text = text.substring(firstLine + 1);
            }
            if (text.length() > maxChars) {
                text = text.substring(text.length() - maxChars);
                int firstLine = text.indexOf('\n');
                if (firstLine >= 0 && firstLine + 1 < text.length()) text = text.substring(firstLine + 1);
            }
            return text;
        } catch (Throwable throwable) {
            return "";
        } finally {
            closeQuietly(in);
        }
    }

    private static void closeQuietly(java.io.Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
        } catch (IOException ignored) {
            // Nothing left to do about it.
        }
    }
}
