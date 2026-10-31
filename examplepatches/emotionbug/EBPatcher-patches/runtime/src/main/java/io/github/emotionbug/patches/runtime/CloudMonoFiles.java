package io.github.emotionbug.patches.runtime;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.util.UUID;
import java.util.HashSet;
import java.util.Set;

/** Sidecar locks protect live uploads; only this namespace's unlocked, paired files are reclaimed. */
public final class CloudMonoFiles {
    private static final Set<File> ACTIVE = new HashSet<>();
    private CloudMonoFiles() {}

    public static synchronized Lease create(File cache) throws IOException {
        File root = new File(cache.getCanonicalFile(), "ebpatcher-cloud-mono-v1");
        if ((!root.isDirectory() && !root.mkdir()) || !root.getCanonicalFile().equals(root.getAbsoluteFile()))
            throw new IOException("Cannot create private cloud audio cache");
        File guardFile = new File(root, ".guard");
        if (!guardFile.getCanonicalFile().equals(guardFile.getAbsoluteFile()))
            throw new IOException("Invalid cloud audio cache guard");
        try (RandomAccessFile guard = new RandomAccessFile(guardFile, "rw"); FileLock ignored = guard.getChannel().lock()) {
            File[] files = root.listFiles();
            if (files == null) throw new IOException("Cannot inspect cloud audio cache");
            for (File marker : files) {
                if (!marker.getName().matches("audio-[0-9a-f-]{36}\\.lock") || !marker.isFile()
                        || !marker.getCanonicalFile().equals(marker.getAbsoluteFile())) continue;
                // Even opening then closing another descriptor can drop our process's POSIX lock.
                if (ACTIVE.contains(marker)) continue;
                File audio = new File(root, marker.getName().replace(".lock", ".m4a"));
                if (!audio.getCanonicalFile().equals(audio.getAbsoluteFile()) || audio.exists() && !audio.isFile()) continue;
                try (RandomAccessFile stale = new RandomAccessFile(marker, "rw")) {
                    try (FileLock lock = stale.getChannel().tryLock()) {
                        if (lock != null) {
                            if (audio.exists() && !audio.delete()) throw new IOException("Cannot reclaim abandoned cloud audio");
                            if (!marker.delete()) throw new IOException("Cannot reclaim abandoned cloud audio lease");
                        }
                    } catch (OverlappingFileLockException activeInThisProcess) { /* Still owned by an upload. */ }
                }
            }
            String name = "audio-" + UUID.randomUUID();
            File marker = new File(root, name + ".lock"), file = new File(root, name + ".m4a");
            if (!marker.createNewFile()) throw new IOException("Cloud audio cache collision");
            RandomAccessFile owner = null;
            try {
                owner = new RandomAccessFile(marker, "rw");
                FileLock lock = owner.getChannel().lock();
                if (!file.createNewFile()) throw new IOException("Cloud audio output collision");
                ACTIVE.add(marker);
                return new Lease(file, marker, owner, lock);
            } catch (IOException | RuntimeException failure) {
                if (owner != null) try { owner.close(); } catch (IOException suppressed) { failure.addSuppressed(suppressed); }
                marker.delete();
                throw failure;
            }
        }
    }

    public static final class Lease implements Closeable {
        public final File file;
        private final File marker;
        private final RandomAccessFile owner;
        private final FileLock lock;
        private boolean closed;

        private Lease(File file, File marker, RandomAccessFile owner, FileLock lock) {
            this.file = file; this.marker = marker; this.owner = owner; this.lock = lock;
        }

        @Override public synchronized void close() throws IOException {
            if (closed) return;
            closed = true;
            // Never lock the media inode: MediaMuxer/InputStream closing a descriptor can
            // release process-associated POSIX locks on that inode before HTTP consumption ends.
            synchronized (CloudMonoFiles.class) {
                boolean deleted = file.delete() || !file.exists();
                boolean markerDeleted = deleted && (marker.delete() || !marker.exists());
                try {
                    try { lock.release(); } finally { owner.close(); }
                } finally { ACTIVE.remove(marker); }
                if (!deleted || !markerDeleted)
                    throw new IOException("Cannot remove temporary cloud audio; next sweep will retry");
            }
        }
    }
}
