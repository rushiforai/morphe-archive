package app.ayham.extension.music.features;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class MusicVideoTypeTest {
    @Test
    public void onlyAnOfficialVideoCounts() {
        assertFalse(MusicVideoType.musicVideo("vid00000001"));
        MusicVideoType.note("vid00000001", "MUSIC_VIDEO_TYPE_OMV");
        assertTrue(MusicVideoType.musicVideo("vid00000001"));
        MusicVideoType.note("vid00000002", "MUSIC_VIDEO_TYPE_ATV");
        assertFalse(MusicVideoType.musicVideo("vid00000002"));
        MusicVideoType.note("vid00000003", "");
        assertFalse(MusicVideoType.musicVideo("vid00000003"));
    }
}
