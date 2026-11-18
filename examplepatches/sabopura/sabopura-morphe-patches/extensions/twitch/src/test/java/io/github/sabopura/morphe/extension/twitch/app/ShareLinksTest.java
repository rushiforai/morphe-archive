package io.github.sabopura.morphe.extension.twitch.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class ShareLinksTest {
    @Test
    public void removesKnownTrackingKeepsTheRest() {
        assertEquals("https://www.twitch.tv/videos/1?t=42s",
                ShareLinks.clean("https://www.twitch.tv/videos/1?t=42s&tt_medium=mobile&utm_source=copy"));
    }

    @Test
    public void dropsTheQueryWhenOnlyTrackingWasThere() {
        assertEquals("https://www.twitch.tv/somestreamer", ShareLinks.clean("https://www.twitch.tv/somestreamer?tt_content=share&fbclid=x"));
    }

    @Test
    public void keepsUnknownParameterFragmentAndPunctuation() {
        assertEquals("watch https://clips.twitch.tv/Abc?filter=x#c (https://www.twitch.tv/foo?id=1).",
                ShareLinks.clean("watch https://clips.twitch.tv/Abc?filter=x&gclid=1#c (https://www.twitch.tv/foo?id=1&utm_id=2)."));
    }

    @Test
    public void trackingKeysMatchCaseInsensitively() {
        assertEquals("https://twitch.tv/a?b=1", ShareLinks.clean("https://twitch.tv/a?UTM_Source=x&b=1"));
    }

    @Test
    public void leavesOtherHostsAndPlainTextAlone() {
        String other = "https://example.com/a?utm_source=x and https://usher.ttvnw.net/api?tt_medium=y";
        assertEquals(other, ShareLinks.clean(other));
        assertEquals("no links here", ShareLinks.clean("no links here"));
        assertNull(ShareLinks.clean(null));
    }

    @Test
    public void leavesMalformedLinksAlone() {
        String bad = "https://www.twitch.tv/a|b?utm_source=x%zz";
        assertEquals(bad, ShareLinks.clean(bad));
    }
}
