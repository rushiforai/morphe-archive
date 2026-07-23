package io.github.ilikeadofai.vocacolle.extension.cache;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class MorpheCacheTest {
    @Rule public final TemporaryFolder temporaryFolder = new TemporaryFolder();

    @Test
    public void putAndGetUseOnlyHashedFilesBelowRoot() throws Exception {
        File root = temporaryFolder.newFolder("cache");
        MutableClock clock = new MutableClock(1000L);
        MorpheCache cache = new MorpheCache(root, 1024, 4096, clock);
        byte[] value = "value".getBytes(StandardCharsets.UTF_8);

        cache.put("../../outside", "../secret", value, 5000L);

        assertArrayEquals(value, cache.get("../../outside", "../secret"));
        File[] files = root.listFiles();
        assertEquals(1, files == null ? 0 : files.length);
        assertTrue(files[0].getName().matches("[0-9a-f]{64}\\.cache"));
        assertEquals(root.getCanonicalFile(), files[0].getParentFile().getCanonicalFile());
        assertEquals(files[0].length(), cache.sizeBytes());
        assertEquals(0, root.getParentFile().listFiles((dir, name) -> name.equals("secret")).length);
    }

    @Test
    public void defaultCacheUsesDedicatedMorpheDirectoryAndBoundedLimits() throws Exception {
        File appCacheDirectory = temporaryFolder.newFolder("app-cache");
        MorpheCache cache = MorpheCache.openDefault(appCacheDirectory);

        cache.put("ui", "entry", new byte[] {1}, 5000L);

        File root = new File(appCacheDirectory, "morphe");
        assertTrue(root.isDirectory());
        assertEquals(1, root.listFiles().length);
        assertEquals(2L * 1024L * 1024L, MorpheCache.DEFAULT_MAX_ENTRY_BYTES);
        assertEquals(64L * 1024L * 1024L, MorpheCache.DEFAULT_MAX_TOTAL_BYTES);
    }

    @Test
    public void namespaceAndKeyBoundariesCannotCollide() throws Exception {
        File root = temporaryFolder.newFolder("boundaries");
        MorpheCache cache = new MorpheCache(root, 100, 1000, new MutableClock(1000L));
        cache.put("a\u0000b", "c", new byte[] {1}, 5000L);
        cache.put("a", "b\u0000c", new byte[] {2}, 5000L);

        assertArrayEquals(new byte[] {1}, cache.get("a\u0000b", "c"));
        assertArrayEquals(new byte[] {2}, cache.get("a", "b\u0000c"));
        assertEquals(2, root.listFiles().length);
    }

    @Test
    public void expiredEntryMissesAndIsDeletedAtExpiryBoundary() throws Exception {
        File root = temporaryFolder.newFolder("ttl");
        MutableClock clock = new MutableClock(1000L);
        MorpheCache cache = new MorpheCache(root, 100, 1000, clock);
        cache.put("ns", "key", new byte[] {1}, 50L);
        clock.now = 1050L;

        assertNull(cache.get("ns", "key"));
        assertEquals(0, root.listFiles().length);
        assertEquals(0L, cache.sizeBytes());
    }

    @Test
    public void corruptEntryMissesAndIsDeleted() throws Exception {
        File root = temporaryFolder.newFolder("corrupt");
        MorpheCache cache = new MorpheCache(root, 100, 1000, new MutableClock(1000L));
        cache.put("ns", "key", new byte[] {1}, 50L);
        File entry = root.listFiles()[0];
        try (FileOutputStream output = new FileOutputStream(entry)) {
            output.write(new byte[] {1, 2, 3});
        }

        assertNull(cache.get("ns", "key"));
        assertEquals(0, root.listFiles().length);
    }

    @Test
    public void failedDirectoryEnumerationIsReported() throws Exception {
        File root = temporaryFolder.newFolder("enumeration-failure");
        MorpheCache cache = new MorpheCache(root, 100, 1000, new MutableClock(1000L));
        assertTrue(root.delete());
        try (FileOutputStream output = new FileOutputStream(root)) {
            output.write(1);
        }

        assertThrows(java.io.IOException.class, cache::sizeBytes);
    }

    @Test
    public void oversizedEntryIsRejectedWithoutLeavingFiles() throws Exception {
        File root = temporaryFolder.newFolder("oversized");
        MorpheCache cache = new MorpheCache(root, 3, 100, new MutableClock(1000L));

        assertThrows(IllegalArgumentException.class,
                () -> cache.put("ns", "key", new byte[] {1, 2, 3, 4}, 50L));
        assertEquals(0, root.listFiles().length);
    }

    @Test
    public void totalSizeCapEvictsOldestEntry() throws Exception {
        File root = temporaryFolder.newFolder("eviction");
        MutableClock clock = new MutableClock(1000L);
        MorpheCache cache = new MorpheCache(root, 4, 48, clock);
        cache.put("ns", "oldest", new byte[] {1, 1, 1, 1}, 5000L);
        clock.now++;
        cache.put("ns", "middle", new byte[] {2, 2, 2, 2}, 5000L);
        clock.now++;
        cache.put("ns", "newest", new byte[] {3, 3, 3, 3}, 5000L);

        assertNull(cache.get("ns", "oldest"));
        assertArrayEquals(new byte[] {2, 2, 2, 2}, cache.get("ns", "middle"));
        assertArrayEquals(new byte[] {3, 3, 3, 3}, cache.get("ns", "newest"));
        assertTrue(cache.sizeBytes() <= 48L);
    }

    @Test
    public void managedEntryCountEvictsOldestFiles() throws Exception {
        File root = temporaryFolder.newFolder("entry-count");
        for (int index = 0; index < 256; index++) {
            File file = new File(root, String.format("%064x.cache", index));
            try (FileOutputStream output = new FileOutputStream(file)) {
                output.write(index);
            }
            assertTrue(file.setLastModified(index + 1L));
        }
        MorpheCache cache = new MorpheCache(
                root,
                100,
                100_000,
                new MutableClock(10_000L)
        );

        cache.put("ns", "newest", new byte[] {1}, 5000L);

        File[] managed = root.listFiles((directory, name) -> name.matches("[0-9a-f]{64}\\.cache"));
        assertTrue(managed != null);
        assertEquals(256, managed.length);
        assertArrayEquals(new byte[] {1}, cache.get("ns", "newest"));
    }

    @Test
    public void failedCandidateDeletionRemovesNewProtectedEntry() throws Exception {
        File root = temporaryFolder.newFolder("deletion-failure");
        MutableClock clock = new MutableClock(1000L);
        File[] blockedDeletion = new File[1];
        MorpheCache cache = new MorpheCache(root, 4, 24, clock, file -> {
            if (blockedDeletion[0] != null && blockedDeletion[0].equals(file)) return false;
            return file.delete();
        });
        cache.put("ns", "old", new byte[] {1, 1, 1, 1}, 5000L);
        blockedDeletion[0] = root.listFiles()[0];
        clock.now++;

        assertThrows(java.io.IOException.class,
                () -> cache.put("ns", "new", new byte[] {2, 2, 2, 2}, 5000L));

        assertNull(cache.get("ns", "new"));
        assertArrayEquals(new byte[] {1, 1, 1, 1}, cache.get("ns", "old"));
    }

    @Test
    public void removeClearAndAtomicReplacementKeepExactSizeAndNoTemps() throws Exception {
        File root = temporaryFolder.newFolder("operations");
        MorpheCache cache = new MorpheCache(root, 100, 1000, new MutableClock(1000L));
        cache.put("ns", "one", new byte[] {1}, 5000L);
        long oneByteEntrySize = cache.sizeBytes();
        cache.put("ns", "one", new byte[] {2, 3}, 5000L);
        assertArrayEquals(new byte[] {2, 3}, cache.get("ns", "one"));
        assertEquals(oneByteEntrySize + 1, cache.sizeBytes());
        assertEquals(1, root.listFiles().length);

        cache.put("ns", "two", new byte[] {4}, 5000L);
        assertTrue(cache.remove("ns", "one"));
        assertNull(cache.get("ns", "one"));
        assertTrue(cache.sizeBytes() > 0);
        cache.clear();
        assertEquals(0L, cache.sizeBytes());
        assertEquals(0, root.listFiles().length);
    }

    @Test
    public void invalidLimitsAndTtlAreRejected() throws Exception {
        File root = temporaryFolder.newFolder("invalid");
        MutableClock clock = new MutableClock(Long.MAX_VALUE - 5);
        assertThrows(IllegalArgumentException.class, () -> new MorpheCache(root, 0, 100, clock));
        assertThrows(IllegalArgumentException.class, () -> new MorpheCache(root, 100, 0, clock));
        MorpheCache cache = new MorpheCache(root, 10, 100, clock);
        assertThrows(IllegalArgumentException.class,
                () -> cache.put("ns", "key", new byte[] {1}, 0));
        assertThrows(IllegalArgumentException.class,
                () -> cache.put("ns", "key", new byte[] {1}, 10));
    }

    static final class MutableClock implements MorpheCache.Clock {
        long now;
        MutableClock(long now) { this.now = now; }
        @Override public long nowMillis() { return now; }
    }
}
