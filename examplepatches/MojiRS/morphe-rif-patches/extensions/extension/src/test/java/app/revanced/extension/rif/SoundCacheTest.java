package app.revanced.extension.rif;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.junit.Test;

/** JVM tests for the housekeeping and file naming in {@link SoundCache}. */
public class SoundCacheTest {

    private static File write(File dir, String name, int bytes, long modified) throws IOException {
        File f = new File(dir, name);
        Files.write(f.toPath(), new byte[bytes]);
        assertTrue(f.setLastModified(modified));
        return f;
    }

    @Test
    public void fileNameIsStablePerUrl() {
        assertEquals(SoundCache.fileName("https://v.redd.it/a/DASH_AUDIO_128.mp4"),
                SoundCache.fileName("https://v.redd.it/a/DASH_AUDIO_128.mp4"));
        assertNotEquals(SoundCache.fileName("https://v.redd.it/a/DASH_AUDIO_128.mp4"),
                SoundCache.fileName("https://v.redd.it/b/DASH_AUDIO_128.mp4"));
        assertTrue(SoundCache.fileName("x").endsWith(".mp4"));
    }

    @Test
    public void trimDeletesOldestFirstUntilUnderTheLimit() throws IOException {
        File dir = Files.createTempDirectory("sound").toFile();
        long now = 10_000_000L;
        File oldest = write(dir, "a.mp4", 400, now - 3000);
        File middle = write(dir, "b.mp4", 400, now - 2000);
        File newest = write(dir, "c.mp4", 400, now - 1000);
        SoundCache.trim(dir, 900, now);
        assertFalse(oldest.exists());
        assertTrue(middle.exists());
        assertTrue(newest.exists());
        SoundCache.trim(dir, 100, now);
        assertFalse(middle.exists());
        assertFalse(newest.exists());
    }

    @Test
    public void trimDropsOnlyStalePartFiles() throws IOException {
        File dir = Files.createTempDirectory("sound").toFile();
        long now = 10_000_000L;
        File stale = write(dir, "a.mp4.part", 10, now - 61_000);
        File fresh = write(dir, "b.mp4.part", 10, now - 5_000);
        File done = write(dir, "c.mp4", 10, now - 5_000);
        SoundCache.trim(dir, 1000, now);
        assertFalse(stale.exists());
        assertTrue(fresh.exists());
        assertTrue(done.exists());
    }
}
