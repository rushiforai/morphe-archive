package app.ckzombies.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

/**
 * The prepared-player tier as the engine drives it. The android.jar stubs return defaults here,
 * so these check what the cache and the player decide, not what the audio framework does.
 */
public class SndCacheTest {

    @Rule
    public TemporaryFolder tmp = new TemporaryFolder();

    @Before
    public void emptyCache() {
        SndCache.pool.clear();
        SndCache.handles.clear();
    }

    /** A file small enough for the prepared-player pool. */
    private String briefing() throws IOException {
        File f = tmp.newFile("mission_briefing.ogg");
        FileOutputStream out = new FileOutputStream(f);
        try {
            out.write(new byte[64 * 1024]);
        } finally {
            out.close();
        }
        return f.getPath();
    }

    @Test
    public void aBriefingCutShortStartsAtFullVolumeTheNextTime() throws IOException {
        String path = briefing();
        ShimPlayer player = new ShimPlayer(path);
        assertTrue(player.poolable);
        SndCache.put(player);

        // The mission closes mid-briefing: the engine fades the voice out, stops it, lets it go.
        player.setVolume(0.4f, 0.4f);
        player.setVolume(0.0f, 0.0f);
        player.stop();
        player.release();
        assertFalse(player.busy);

        // Opening the mission again gets the same player back, as a new one would start.
        assertSame(player, SndCache.get(path));
        assertTrue(player.busy);
        assertEquals(1.0f, player.leftVolume, 0.0f);
        assertEquals(1.0f, player.rightVolume, 0.0f);
    }

    @Test
    public void aPlayerStillInUseIsNotHandedOutAgain() throws IOException {
        String path = briefing();
        ShimPlayer player = new ShimPlayer(path);
        SndCache.put(player);

        // Not released yet, so the engine builds a new player for the second request.
        assertNull(SndCache.get(path));
        assertTrue(player.busy);
    }
}
