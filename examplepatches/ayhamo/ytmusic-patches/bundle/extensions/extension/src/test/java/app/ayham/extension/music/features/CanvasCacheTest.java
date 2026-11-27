package app.ayham.extension.music.features;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import org.junit.BeforeClass;
import org.junit.Test;

/** CanvasCache is a process-wide singleton, initialised once: every test shares one temp folder. */
public class CanvasCacheTest {
    private static File dir;

    @BeforeClass
    public static void setUp() throws Exception {
        dir = Files.createTempDirectory("ayham-canvas-test").toFile();
        dir.deleteOnExit();
        File clip = new File(dir, "clip.mp4");
        Files.write(clip.toPath(), new byte[]{1});
        clip.deleteOnExit();
        // a file as an app killed mid-write could leave it, next to good entries
        String text = "song.noBar=1700000000000\n"
                + "song.notANumber=abc|\n"
                + "song.empty=\n"
                + "song.oldMiss=1|\n"
                + "song.oldClip=1|" + clip.getAbsolutePath().replace("\\", "\\\\") + "\n"
                + "song.goneClip=" + System.currentTimeMillis() + "|/no/such/file.mp4\n"
                + "token=abc.def.ghi\n"
                + "tokenExpires=12345\n";
        try (FileOutputStream out = new FileOutputStream(new File(dir, "ayham-canvas.properties"))) {
            out.write(text.getBytes(StandardCharsets.ISO_8859_1));
        }
        CanvasCache.init(dir);
    }

    /** A downloaded song's saved clips follow the song's own canvas choices (canvas.md §15; extension M16). */
    @Test
    public void savedClipsFollowTheSongsChoices() throws Exception {
        File spotify = new File(dir, "sp.mp4"), apple = new File(dir, "ap.mp4");
        Files.write(spotify.toPath(), new byte[]{1});
        Files.write(apple.toPath(), new byte[]{1});
        spotify.deleteOnExit();
        apple.deleteOnExit();
        CanvasCache.put(CanvasCache.spotifyIdKey("vid1"), spotify.getAbsolutePath());
        CanvasCache.put(CanvasCache.idKey("vid1"), apple.getAbsolutePath());
        java.util.Properties p = new java.util.Properties();
        p.setProperty("canvasApple", "1");
        CanvasChoices.Song ch = new CanvasChoices.Song();
        // the settings' order (music video first): the saved Spotify canvas, also offline
        assertEquals(spotify.getAbsolutePath(), AnimatedCover.savedClip("vid1", p, ch));
        // Spotify off for this song: the saved Apple clip
        ch.off.add(CanvasSettings.SPOTIFY);
        assertEquals(apple.getAbsolutePath(), AnimatedCover.savedClip("vid1", p, ch));
        ch.off.add(CanvasSettings.APPLE);
        assertNull(AnimatedCover.savedClip("vid1", p, ch));
        // Use Apple: Apple's before Spotify's
        ch = new CanvasChoices.Song();
        ch.use = CanvasSettings.APPLE;
        assertEquals(apple.getAbsolutePath(), AnimatedCover.savedClip("vid1", p, ch));
        // the song's own video or Use of the music video: looked up online, no saved clip
        ch.use = CanvasSettings.VIDEO;
        assertNull(AnimatedCover.savedClip("vid1", p, ch));
        ch = new CanvasChoices.Song();
        ch.video = "abcdefghijk";
        assertNull(AnimatedCover.savedClip("vid1", p, ch));
        // Apple's master switch off: never Apple's
        p.setProperty("canvasApple", "0");
        ch = new CanvasChoices.Song();
        ch.off.add(CanvasSettings.SPOTIFY);
        assertNull(AnimatedCover.savedClip("vid1", p, ch));
    }

    @Test
    public void damagedEntriesReadAsUnknownInsteadOfThrowing() {
        assertNull(CanvasCache.lookup("noBar"));
        assertNull(CanvasCache.lookup("notANumber"));
        assertNull(CanvasCache.lookup("empty"));
    }

    @Test
    public void savedClipPlaysAtAnyAgeAndAMissExpires() {
        assertTrue(CanvasCache.lookup("oldClip").endsWith("clip.mp4"));
        assertNull(CanvasCache.lookup("oldMiss"));   // a miss older than a day: looked up again
        assertNull(CanvasCache.lookup("goneClip"));  // the clip file was deleted: looked up again
        assertNull(CanvasCache.lookup("never"));
    }

    @Test
    public void putThenLookupAndNoPartFileLeft() {
        CanvasCache.put("fresh miss", null);
        assertEquals("", CanvasCache.lookup("fresh miss"));
        CanvasCache.put(CanvasCache.idKey("abcdefghijk"), new File(dir, "clip.mp4").getAbsolutePath());
        assertTrue(CanvasCache.lookup("id:abcdefghijk").endsWith("clip.mp4"));
        assertFalse(new File(dir, "ayham-canvas.properties.part").exists());
        assertTrue(new File(dir, "ayham-canvas.properties").length() > 0);
    }

    @Test
    public void tokenBackup() {
        assertArrayEquals(new String[]{"abc.def.ghi", "12345"}, CanvasCache.token());
        CanvasCache.token("x.y.z", 99);
        assertArrayEquals(new String[]{"x.y.z", "99"}, CanvasCache.token());
        CanvasCache.token(null, 0);
        assertNull(CanvasCache.token());
    }
}
