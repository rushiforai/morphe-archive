package nl.johninnl.medium.reader;

import java.io.File;
import java.io.IOException;
import java.io.FileOutputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.FileTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.function.LongSupplier;

public final class BodyCache {
    public static final class Key {
        public final String postId;
        public final String revision;
        public final URI origin;
        final String token;
        private Key(String postId, String revision, URI origin) {
            if (postId == null || !postId.matches("[a-f0-9]{12}") || revision == null || revision.length() > 512 ||
                    origin == null || !"https".equalsIgnoreCase(origin.getScheme()) || origin.getHost() == null || origin.getUserInfo() != null) {
                throw new IllegalArgumentException("Invalid body cache identity");
            }
            this.postId = postId; this.revision = revision; this.origin = origin;
            token = BodyCodec.hex(BodyCodec.hash((postId + "\u0000" + revision + "\u0000" + origin + "\u0000" + BodyCodec.SCHEMA).getBytes(StandardCharsets.UTF_8)));
        }
        @Override public boolean equals(Object other) { return other instanceof Key && token.equals(((Key) other).token); }
        @Override public int hashCode() { return token.hashCode(); }
    }
    public static final class Entry {
        public final ArticleBody body;
        public final long fetchedAtMillis;
        public Entry(ArticleBody body, long fetchedAtMillis) { this.body = body; this.fetchedAtMillis = fetchedAtMillis; }
    }
    public static Key key(String postId, String revision, URI origin) { return new Key(postId, revision, origin); }
    private final Path directory;
    private final long maxBytes;
    private final int maxEntries;
    private final long ttlMillis;
    private final LongSupplier clock;

    public BodyCache(File directory, long maxBytes, int maxEntries, long ttlMillis, LongSupplier clock) {
        if (maxBytes < 128 || maxEntries < 1 || ttlMillis < 1) throw new IllegalArgumentException("Invalid cache limits");
        this.directory = directory.toPath(); this.maxBytes = maxBytes; this.maxEntries = maxEntries;
        this.ttlMillis = ttlMillis; this.clock = clock;
    }

    public synchronized Entry get(Key key) {
        Path path = path(key);
        if (!Files.isRegularFile(path, LinkOption.NOFOLLOW_LINKS)) return null;
        try {
            if (Files.size(path) > Math.min(maxBytes, BodyCodec.MAX_BYTES)) throw new IOException("Cache entry is too large");
            BodyCodec.Stored stored = BodyCodec.decode(Files.readAllBytes(path));
            long now = clock.getAsLong();
            if (!key.token.equals(stored.key) || !key.postId.equals(stored.body.postId) ||
                    stored.fetchedAt > now + 300000) throw new IOException("Mismatched cache entry");
            // Online expiry requests a refresh; retain the validated snapshot for offline reading.
            if (now - stored.fetchedAt >= ttlMillis) return null;
            return new Entry(stored.body, stored.fetchedAt);
        } catch (IOException invalid) {
            try { Files.deleteIfExists(path); } catch (IOException ignored) { }
            return null;
        }
    }

    public synchronized List<Entry> saved() throws IOException {
        List<Entry> entries = new ArrayList<>();
        for (Path file : files()) try {
            if (Files.size(file) > Math.min(maxBytes, BodyCodec.MAX_BYTES)) throw new IOException("Oversized snapshot");
            BodyCodec.Stored stored = BodyCodec.decode(Files.readAllBytes(file));
            String expected = file.getFileName().toString().replace(".body", "");
            if (!expected.equals(stored.key) || stored.fetchedAt > clock.getAsLong() + 300000) throw new IOException("Invalid snapshot");
            entries.add(new Entry(stored.body, stored.fetchedAt));
        } catch (IOException corrupt) { Files.deleteIfExists(file); }
        entries.sort((a, b) -> Long.compare(b.fetchedAtMillis, a.fetchedAtMillis));
        java.util.Set<String> seen = new java.util.HashSet<>();
        entries.removeIf(entry -> !seen.add(entry.body.postId));
        return entries;
    }

    public synchronized void put(Key key, ArticleBody body) throws IOException {
        if (!key.postId.equals(body.postId)) throw new IOException("Cache key does not match the body");
        long fetchedAt = clock.getAsLong();
        byte[] bytes = BodyCodec.encode(key.token, fetchedAt, body, (int) Math.min(maxBytes, BodyCodec.MAX_BYTES));
        Files.createDirectories(directory);
        Path temporary = Files.createTempFile(directory, ".mr-body-", ".tmp");
        try {
            try (FileOutputStream output = new FileOutputStream(temporary.toFile())) {
                output.write(bytes); output.getFD().sync();
            }
            Files.move(temporary, path(key), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
            Files.setLastModifiedTime(path(key), FileTime.fromMillis(fetchedAt));
            trim();
        } finally { Files.deleteIfExists(temporary); }
    }

    public synchronized void clear() throws IOException { for (Path file : files()) Files.deleteIfExists(file); }
    private Path path(Key key) { return directory.resolve(key.token + ".body"); }
    private List<Path> files() throws IOException {
        List<Path> files = new ArrayList<>();
        if (!Files.isDirectory(directory)) return files;
        try (DirectoryStream<Path> stream = Files.newDirectoryStream(directory, "*.body")) {
            for (Path path : stream) if (path.getFileName().toString().matches("[a-f0-9]{64}\\.body") && Files.isRegularFile(path, LinkOption.NOFOLLOW_LINKS)) files.add(path);
        }
        return files;
    }
    private void trim() throws IOException {
        List<Path> files = files();
        files.sort(Comparator.comparingLong(path -> path.toFile().lastModified()));
        long total = 0; for (Path file : files) total += Files.size(file);
        int remaining = files.size();
        for (Path file : files) {
            if (total <= maxBytes && remaining <= maxEntries) break;
            long size = Files.size(file); Files.delete(file); total -= size; remaining--;
        }
    }
}
