package app.template.extension.zalo.buglog;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Append-only bug-log file for one process, rotated as {@code <name>.log} + {@code <name>.1.log}.
 * Lines are queued and written by a daemon thread so callers on the UI thread never touch disk;
 * {@link #appendNow} drains the queue synchronously for the crash path, where the process is about to die.
 * Lines dropped because the queue was full are counted and reported on the next write.
 */
final class LogStore {
    static final long MAX_FILE_BYTES = 1024 * 1024;
    static final String DIR = "nezumi_logs";

    interface HeaderSource {
        String header();
    }

    /** A rendered line (everything after the timestamp) and when it was logged. */
    static final class Line {
        final long time;
        final String body;

        Line(long time, String body) {
            this.time = time;
            this.body = body;
        }
    }

    private static final class Entry {
        final long time;
        final String body;
        /** Non-null for the session header, built on the writer thread to keep it off app startup. */
        final HeaderSource session;

        Entry(long time, String body) {
            this(time, body, null);
        }

        Entry(long time, String body, HeaderSource session) {
            this.time = time;
            this.body = body;
            this.session = session;
        }
    }

    private final File dir;
    private final String baseName;
    private final LinkedBlockingQueue<Entry> queue = new LinkedBlockingQueue<>(4096);
    private final Object lock = new Object();
    private final AtomicInteger dropped = new AtomicInteger();
    private Writer writer;
    private long size;
    /** The current session's header, repeated at the top of the file after a rotation. */
    private String sessionHeader;

    LogStore(File dir, String baseName) {
        this.dir = dir;
        this.baseName = baseName;
        Thread thread = new Thread(this::drainLoop, "NezumiBugLog");
        thread.setDaemon(true);
        thread.start();
    }

    File dir() {
        return dir;
    }

    /** Queues the session header block; it is written without a timestamp prefix. */
    void startSession(HeaderSource header) {
        queue.offer(new Entry(System.currentTimeMillis(), null, header));
    }

    /** Queues a line; drops (and counts) it when the queue is full rather than blocking the caller. */
    void append(long time, String body) {
        if (!queue.offer(new Entry(time, body))) dropped.incrementAndGet();
    }

    /** Queues several lines in order. */
    void appendAll(List<Line> lines) {
        for (Line line : lines) append(line.time, line.body);
    }

    /** Writes everything queued plus these lines before returning. Used when the process is dying. */
    void appendNow(List<Line> lines) {
        synchronized (lock) {
            drainLocked();
            for (Line line : lines) writeLocked(new Entry(line.time, line.body));
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
            dropped.set(0);
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
            int lost = dropped.getAndSet(0);
            if (lost > 0) {
                String note = LogLine.full(entry.time, LogLine.body('W', Patch.CORE.id, "BugLog",
                    Thread.currentThread().getName(), "dropped " + lost + " lines", null)) + '\n';
                writer.write(note);
                size += note.getBytes(StandardCharsets.UTF_8).length;
            }
            String line;
            if (entry.session != null) {
                sessionHeader = header(entry.session);
                line = sessionHeader + '\n';
            } else {
                line = LogLine.full(entry.time, entry.body) + '\n';
            }
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

    private static String header(HeaderSource source) {
        try {
            return source.header();
        } catch (RuntimeException failure) {
            return "===== session header unavailable: " + failure + " =====";
        }
    }

    private void writeHeaderLocked() throws IOException {
        String text = "===== Nezumi bug log =====\n";
        // After a rotation the new file still says which session it belongs to.
        if (sessionHeader != null) text += sessionHeader.replaceFirst(" start =====", " continued =====") + '\n';
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
