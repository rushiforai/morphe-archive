package io.github.ilikeadofai.vocacolle.extension.cache;

import android.system.ErrnoException;
import android.system.Os;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.regex.Pattern;

/** Atomic, bounded file cache. Only SHA-256-named files below its root are managed. */
public final class MorpheCache {
    public static final long DEFAULT_MAX_ENTRY_BYTES = 2L * 1024L * 1024L;
    public static final long DEFAULT_MAX_TOTAL_BYTES = 64L * 1024L * 1024L;
    public static final int DEFAULT_MAX_ENTRIES = 256;
    private static final int MAGIC = 0x4d434143; // MCAC
    private static final int VERSION = 1;
    private static final int HEADER_BYTES = 4 * 3 + 8;
    private static final Pattern ENTRY_NAME = Pattern.compile("[0-9a-f]{64}\\.cache");

    public interface Clock { long nowMillis(); }

    interface FileDeleter { boolean delete(File file); }

    private final File root;
    private final long maxEntryBytes;
    private final long maxTotalBytes;
    private final Clock clock;
    private final FileDeleter fileDeleter;

    public static MorpheCache openDefault(File appCacheDirectory) throws IOException {
        Objects.requireNonNull(appCacheDirectory, "appCacheDirectory");
        return new MorpheCache(
                new File(appCacheDirectory, "morphe"),
                DEFAULT_MAX_ENTRY_BYTES,
                DEFAULT_MAX_TOTAL_BYTES
        );
    }

    public MorpheCache(File root, long maxEntryBytes, long maxTotalBytes) throws IOException {
        this(root, maxEntryBytes, maxTotalBytes, System::currentTimeMillis);
    }

    public MorpheCache(File root, long maxEntryBytes, long maxTotalBytes, Clock clock) throws IOException {
        this(root, maxEntryBytes, maxTotalBytes, clock, File::delete);
    }

    MorpheCache(
            File root,
            long maxEntryBytes,
            long maxTotalBytes,
            Clock clock,
            FileDeleter fileDeleter
    ) throws IOException {
        this.root = Objects.requireNonNull(root, "root").getCanonicalFile();
        this.clock = Objects.requireNonNull(clock, "clock");
        this.fileDeleter = Objects.requireNonNull(fileDeleter, "fileDeleter");
        if (maxEntryBytes <= 0 || maxEntryBytes > Integer.MAX_VALUE) {
            throw new IllegalArgumentException("maxEntryBytes must be between 1 and Integer.MAX_VALUE");
        }
        if (maxTotalBytes <= 0) {
            throw new IllegalArgumentException("maxTotalBytes must be positive");
        }
        this.maxEntryBytes = maxEntryBytes;
        this.maxTotalBytes = maxTotalBytes;
        if (this.root.exists() && !this.root.isDirectory()) {
            throw new IOException("Cache root is not a directory");
        }
        if (!this.root.isDirectory() && !this.root.mkdirs()) {
            throw new IOException("Could not create cache directory");
        }
    }

    public synchronized void put(String namespace, String key, byte[] value, long ttlMillis)
            throws IOException {
        Objects.requireNonNull(value, "value");
        if (value.length > maxEntryBytes) {
            throw new IllegalArgumentException("Entry exceeds limit of " + maxEntryBytes + " bytes");
        }
        if (ttlMillis <= 0) {
            throw new IllegalArgumentException("ttlMillis must be positive");
        }
        final long expiry;
        try {
            expiry = Math.addExact(clock.nowMillis(), ttlMillis);
        } catch (ArithmeticException overflow) {
            throw new IllegalArgumentException("Expiry overflows epoch milliseconds", overflow);
        }
        if (HEADER_BYTES + (long) value.length > maxTotalBytes) {
            throw new IllegalArgumentException("Encoded entry exceeds total cache limit");
        }

        File destination = entryFile(namespace, key);
        File temporary = File.createTempFile("morphe-", ".tmp", root);
        boolean moved = false;
        try {
            writeEntry(temporary, expiry, value);
            moveAtomically(temporary, destination);
            moved = true;
            destination.setLastModified(clock.nowMillis());
            evictOldest(destination);
        } finally {
            if (!moved && temporary.exists() && !temporary.delete()) {
                temporary.deleteOnExit();
            }
        }
    }

    public synchronized byte[] get(String namespace, String key) throws IOException {
        File file = entryFile(namespace, key);
        if (!file.isFile()) return null;
        try {
            return readEntry(file);
        } catch (IOException | RuntimeException corrupt) {
            deleteRequired(file);
            return null;
        }
    }

    public synchronized boolean remove(String namespace, String key) throws IOException {
        File file = entryFile(namespace, key);
        if (!file.exists()) return false;
        deleteRequired(file);
        return true;
    }

    public synchronized void clear() throws IOException {
        for (File file : entryFiles()) {
            deleteRequired(file);
        }
        File[] files = root.listFiles((directory, name) -> name.startsWith("morphe-") && name.endsWith(".tmp"));
        if (files == null) throw new IOException("Could not enumerate temporary cache files");
        for (File file : files) deleteRequired(file);
    }

    public synchronized long sizeBytes() throws IOException {
        long total = 0;
        for (File file : entryFiles()) total += file.length();
        return total;
    }

    private byte[] readEntry(File file) throws IOException {
        long fileLength = file.length();
        if (fileLength < HEADER_BYTES || fileLength > HEADER_BYTES + maxEntryBytes) {
            throw new IOException("Invalid cache entry size");
        }
        try (DataInputStream input = new DataInputStream(
                new BufferedInputStream(new FileInputStream(file)))) {
            if (input.readInt() != MAGIC || input.readInt() != VERSION) {
                throw new IOException("Invalid cache entry header");
            }
            long expiry = input.readLong();
            int length = input.readInt();
            if (length < 0 || length > maxEntryBytes || fileLength != HEADER_BYTES + (long) length) {
                throw new IOException("Invalid cache payload length");
            }
            if (expiry <= clock.nowMillis()) {
                throw new ExpiredEntryException();
            }
            byte[] value = new byte[length];
            input.readFully(value);
            if (input.read() != -1) throw new IOException("Trailing cache data");
            return value;
        }
    }

    private static void writeEntry(File file, long expiry, byte[] value) throws IOException {
        try (FileOutputStream fileOutput = new FileOutputStream(file);
             DataOutputStream output = new DataOutputStream(new BufferedOutputStream(fileOutput))) {
            output.writeInt(MAGIC);
            output.writeInt(VERSION);
            output.writeLong(expiry);
            output.writeInt(value.length);
            output.write(value);
            output.flush();
            fileOutput.getFD().sync();
        }
    }

    private void evictOldest(File protectedEntry) throws IOException {
        try {
            enforceLimits(protectedEntry);
        } catch (IOException failure) {
            try {
                deleteRequired(protectedEntry);
            } catch (IOException cleanupFailure) {
                failure.addSuppressed(cleanupFailure);
            }
            throw failure;
        }
    }

    private void enforceLimits(File protectedEntry) throws IOException {
        List<File> managedEntries = entryFiles();
        long total = 0L;
        for (File file : managedEntries) total += file.length();
        int managedCount = managedEntries.size();
        if (total <= maxTotalBytes && managedCount <= DEFAULT_MAX_ENTRIES) return;
        List<File> candidates = new ArrayList<>(managedEntries);
        candidates.remove(protectedEntry);
        Collections.sort(candidates, new Comparator<File>() {
            @Override
            public int compare(File left, File right) {
                int modifiedComparison = Long.compare(left.lastModified(), right.lastModified());
                return modifiedComparison != 0
                        ? modifiedComparison
                        : left.getName().compareTo(right.getName());
            }
        });
        for (File candidate : candidates) {
            if (total <= maxTotalBytes && managedCount <= DEFAULT_MAX_ENTRIES) break;
            long length = candidate.length();
            deleteRequired(candidate);
            total -= length;
            managedCount--;
        }
        if (total > maxTotalBytes || managedCount > DEFAULT_MAX_ENTRIES) {
            throw new IOException("Could not enforce cache limits");
        }
    }

    private List<File> entryFiles() throws IOException {
        File[] files = root.listFiles((directory, name) -> ENTRY_NAME.matcher(name).matches());
        if (files == null) throw new IOException("Could not enumerate cache entries");
        List<File> result = new ArrayList<>();
        for (File file : files) if (file.isFile()) result.add(file);
        return result;
    }

    private File entryFile(String namespace, String key) {
        Objects.requireNonNull(namespace, "namespace");
        Objects.requireNonNull(key, "key");
        return new File(root, sha256(namespace, key) + ".cache");
    }

    private void deleteRequired(File file) throws IOException {
        if (file.exists() && !fileDeleter.delete(file)) {
            throw new IOException("Could not delete cache entry");
        }
    }

    private static void moveAtomically(File source, File destination) throws IOException {
        if (isAndroidRuntime()) {
            try {
                Os.rename(source.getAbsolutePath(), destination.getAbsolutePath());
                return;
            } catch (ErrnoException error) {
                throw new IOException("Could not atomically replace cache entry", error);
            }
        }
        if (!source.renameTo(destination)) {
            throw new IOException("Could not atomically replace cache entry");
        }
    }

    private static boolean isAndroidRuntime() {
        return "Android Runtime".equals(System.getProperty("java.runtime.name"));
    }

    private static String sha256(String namespace, String key) {
        try {
            MessageDigest hasher = MessageDigest.getInstance("SHA-256");
            byte[] namespaceBytes = namespace.getBytes(StandardCharsets.UTF_8);
            byte[] keyBytes = key.getBytes(StandardCharsets.UTF_8);
            updateLength(hasher, namespaceBytes.length);
            hasher.update(namespaceBytes);
            updateLength(hasher, keyBytes.length);
            hasher.update(keyBytes);
            byte[] digest = hasher.digest();
            char[] hex = new char[digest.length * 2];
            final char[] alphabet = "0123456789abcdef".toCharArray();
            for (int index = 0; index < digest.length; index++) {
                int unsigned = digest[index] & 0xff;
                hex[index * 2] = alphabet[unsigned >>> 4];
                hex[index * 2 + 1] = alphabet[unsigned & 0x0f];
            }
            return new String(hex);
        } catch (NoSuchAlgorithmException impossible) {
            throw new AssertionError(impossible);
        }
    }

    private static void updateLength(MessageDigest hasher, int length) {
        hasher.update((byte) (length >>> 24));
        hasher.update((byte) (length >>> 16));
        hasher.update((byte) (length >>> 8));
        hasher.update((byte) length);
    }

    private static final class ExpiredEntryException extends EOFException { }
}
