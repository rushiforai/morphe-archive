package io.github.emotionbug.patches.runtime;

import android.content.Context;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.util.function.BooleanSupplier;

/** Process-wide ownership: deleting model/results must never race a native inference worker. */
final class SummaryLock implements Closeable {
    private final RandomAccessFile file;
    private final FileLock lock;
    private SummaryLock(RandomAccessFile file, FileLock lock) { this.file = file; this.lock = lock; }
    static SummaryLock acquire(Context context) throws IOException {
        return acquire(context, null);
    }
    /** A non-null cancellation check waits on the worker thread without interrupting inference. */
    static SummaryLock acquire(Context context, BooleanSupplier cancelled) throws IOException {
        RandomAccessFile file = new RandomAccessFile(new File(context.getNoBackupFilesDir(), "ebpatcher-summary.lock"), "rw");
        try {
            while (true) {
                if (cancelled != null && (cancelled.getAsBoolean() || Thread.currentThread().isInterrupted()))
                    throw new InterruptedIOException("Model installation cancelled while waiting for local processing");
                FileLock lock;
                try { lock = file.getChannel().tryLock(); }
                catch (OverlappingFileLockException busy) { lock = null; }
                if (lock != null) return new SummaryLock(file, lock);
                if (cancelled == null) throw new IOException("Local processing is active. Wait for it to stop and try again.");
                try { Thread.sleep(250); }
                catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                    throw new InterruptedIOException("Model installation cancelled while waiting for local processing");
                }
            }
        } catch (IOException | RuntimeException error) {
            file.close();
            throw error;
        }
    }
    @Override public void close() throws IOException {
        try { lock.release(); } finally { file.close(); }
    }
}
