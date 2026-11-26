package app.template.extension.zalo.buglog;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * Append-only bug-log file for one process, rotated as {@code <name>.log} + {@code <name>.1.log}.
 * Lines are queued and written by a daemon thread so callers on the UI thread never touch disk;
 * {@link #appendNow} drains the queue synchronously for the crash path, where the process is about to die.
 */
final class LogStore {
    static final long MAX_FILE_BYTES = 1024 * 1024;
    static final String DIR = "nezumi_logs";

    interface HeaderSource {
        String header();
    }

    private static final class Entry {
        final long time;
        final String body;

        Entry(long time, String body) {
            this.time = time;
            this.body = body;
        }
    }

    private final File dir;
    private final String baseName;
    private final HeaderSource headerSource;
    private final LinkedBlockingQueue<Entry> queue = new LinkedBlockingQueue<>(4096);
    private final Object lock = new Object();
    private final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
    private Writer writer;
    private long size;

    LogStore(File dir, String baseName, HeaderSource headerSource) {
        this.dir = dir;
        this.baseName = baseName;
        this.headerSource = headerSource;
        Thread thread = new Thread(this::drainLoop, "NezumiBugLog");
        thread.setDaemon(true);
        thread.start();
    }

    File dir() {
        return dir;
    }

    /** Queues a line; drops it when the queue is full rather than blocking the caller. */
    void append(long time, String body) {
        queue.offer(new Entry(time, body));
    }

    /** Writes everything queued plus this line before returning. Used when the process is dying. */
    void appendNow(long time, String body) {
        synchronized (lock) {
            drainLocked();
            writeLocked(new Entry(time, body));
            flushLocked();
        }
    }

    void flush() {
        synchronized (lock) {
            drainLocked();
            flushLocked();
        }
    }

    /** Closes the current file and deletes every bug-log file in the directory, for all processes. */
    void clearAll() {
        synchronized (lock) {
            queue.clear();
            closeLocked();
            File[] files = dir.listFiles();
            if (files != null) {
                for (File file : files) {
                    //noinspection ResultOfMethodCallIgnored
                    file.delete();
                }
            }
        }
    }

    private void drainLoop() {
        while (true) {
            try {
                Entry first = queue.take();
                synchronized (lock) {
                    writeLocked(first);
                    drainLocked();
                    flushLocked();
                }
            } catch (InterruptedException interrupted) {
                return;
            } catch (Throwable ignored) {
                // Logging must never take the app down; drop the batch and keep serving.
            }
        }
    }

    private void drainLocked() {
        List<Entry> pending = new ArrayList<>();
        queue.drainTo(pending);
        for (Entry entry : pending) writeLocked(entry);
    }

    private void writeLocked(Entry entry) {
        try {
            if (writer == null) openLocked();
            if (size >= MAX_FILE_BYTES) {
                rotateLocked();
            }
            String line = format.format(new Date(entry.time)) + ' ' + entry.body + '\n';
            writer.write(line);
            size += line.getBytes(StandardCharsets.UTF_8).length;
        } catch (IOException | RuntimeException failure) {
            closeLocked();
        }
    }

    private void openLocked() throws IOException {
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("mkdirs " + dir);
        File file = current();
        size = file.length();
        writer = new OutputStreamWriter(new FileOutputStream(file, true), StandardCharsets.UTF_8);
        if (size == 0) writeHeaderLocked();
    }

    private void rotateLocked() throws IOException {
        closeLocked();
        File previous = new File(dir, baseName + ".1.log");
        //noinspection ResultOfMethodCallIgnored
        previous.delete();
        //noinspection ResultOfMethodCallIgnored
        current().renameTo(previous);
        openLocked();
    }

    private void writeHeaderLocked() throws IOException {
        String header;
        try {
            header = headerSource.header();
        } catch (RuntimeException failure) {
            header = "header unavailable: " + failure;
        }
        String text = "===== Nezumi bug log =====\n" + header + "\n==========================\n";
        writer.write(text);
        size += text.getBytes(StandardCharsets.UTF_8).length;
    }

    private void flushLocked() {
        try {
            if (writer != null) writer.flush();
        } catch (IOException failure) {
            closeLocked();
        }
    }

    private void closeLocked() {
        if (writer == null) return;
        try {
            writer.close();
        } catch (IOException ignored) {
            // The file is being abandoned either way.
        }
        writer = null;
        size = 0;
    }

    private File current() {
        return new File(dir, baseName + ".log");
    }
}
