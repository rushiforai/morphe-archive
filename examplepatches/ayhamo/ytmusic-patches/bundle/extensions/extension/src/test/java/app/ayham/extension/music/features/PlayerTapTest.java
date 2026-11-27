package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import java.util.Collections;

/** The stream line, as BitChord's: codec · sample rate · bitrate · channels, no itag. */
public class PlayerTapTest {

    @Test
    public void opusStereo() {
        assertEquals("Opus · 48.0 kHz · 150 kbps · Stereo",
                PlayerTap.describe("Format(251, null, null, audio/opus, opus, 149843, en, [-1, -1, -1.0, null], [2, 48000])"));
    }

    @Test
    public void thisMedia3sThreeFieldTail() {
        // YT Music 9.30.53 prints [channels, -1, sampleRate] (seen on the emulator)
        assertEquals("Opus · 48.0 kHz · 175 kbps · Stereo",
                PlayerTap.describe("Format(251, null, null, audio/opus, opus, 175000, en, [-1, -1, -1.0, null], [2, -1, 48000])"));
    }

    @Test
    public void aacMonoAndOtherCodecs() {
        assertEquals("AAC · 44.1 kHz · 128 kbps · Mono",
                PlayerTap.describe("Format(140, null, null, audio/mp4a-latm, mp4a.40.2, 128000, null, [-1, -1, -1.0, null], [1, 44100])"));
        assertEquals("EAC3", PlayerTap.codecLabel("audio/eac3"));
    }

    static class OnlinePlayer { Object renderer = "x"; }
    static class OfflinePlayer { Object renderer = "y"; }

    @Test
    public void aPathFromAnotherPlayerIsDroppedNotThrown() throws Exception {
        // the path was found on the streaming player; the downloaded song's player holds another class
        assertNull(PlayerTap.follow(new OfflinePlayer(), Collections.singletonList(OnlinePlayer.class.getDeclaredField("renderer"))));
    }
}
