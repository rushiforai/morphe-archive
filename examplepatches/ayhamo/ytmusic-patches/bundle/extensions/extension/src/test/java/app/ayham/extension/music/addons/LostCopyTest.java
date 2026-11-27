package app.ayham.extension.music.addons;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.util.Map;

import org.junit.Test;

/** A copy whose file is deleted under it is searched and opened once more, not YouTube's audio for 10 minutes (the PC's f8b8b96). */
public class LostCopyTest {
    @SuppressWarnings("unchecked")
    private static void ready(AddonPrep.Prepared p) throws Exception {
        Field f = AddonPrep.class.getDeclaredField("ready");
        f.setAccessible(true);
        ((Map<String, AddonPrep.Prepared>) f.get(null)).put(p.id, p);
    }

    private static AddonPrep.Prepared prepared(String id, File file, boolean saved) {
        AddonPrep.Prepared p = new AddonPrep.Prepared();
        p.id = id;
        p.file = file;
        p.saved = saved;
        return p;
    }

    @Test
    public void aGoneFileIsSearchedAgainOnceThenFails() throws Exception {
        File dir = Files.createTempDirectory("lost").toFile();
        for (boolean saved : new boolean[]{false, true}) {
            String id = saved ? "lostSaved01" : "lostCache01";
            File f = new File(dir, id + ".flac");
            ready(prepared(id, f, saved));
            AddonPrep.dropped(id, "the addon player failed");
            assertNull(AddonPrep.get(id));
            assertFalse("searched again, not held on YouTube: " + id, AddonPrep.failed(id));
            ready(prepared(id, f, saved));
            AddonPrep.dropped(id, "the addon player failed");
            assertTrue("a second loss is a failure: " + id, AddonPrep.failed(id));
        }
    }

    @Test
    public void aFileThatIsThereStillFails() throws Exception {
        File f = File.createTempFile("here", ".flac");
        Files.write(f.toPath(), new byte[]{1, 2, 3});
        ready(prepared("hereCache01", f, true));
        AddonPrep.dropped("hereCache01", "the addon player stalled");
        assertTrue(AddonPrep.failed("hereCache01"));
        assertTrue(f.exists());
    }

    @Test
    public void aStreamWhoseBytesWentStartsItsListAgain() throws Exception {
        File dir = Files.createTempDirectory("lostStream").toFile();
        StreamCache.Entry e = new StreamCache.Entry(dir, "k");
        assertFalse("nothing fetched yet: nothing lost", e.lost());
        Field have = StreamCache.Entry.class.getDeclaredField("have");
        have.setAccessible(true);
        ((java.util.BitSet) have.get(e)).set(0);
        Files.write(new File(dir, "k.bin").toPath(), new byte[]{1});
        assertFalse("its bytes are there", e.lost());
        assertTrue(new File(dir, "k.bin").delete());
        assertTrue(e.lost());
        assertTrue(((java.util.BitSet) have.get(e)).isEmpty());
        assertFalse("lost once", e.lost());
    }
}
