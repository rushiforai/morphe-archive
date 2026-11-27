package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/** Only trusted variants count (canvas.md §13 rule 5), and no answer is read past its cap. */
public class HlsClipTest {
    private static final String BASE = "https://mvod.itunes.apple.com/itunes-assets/HLSMusic/v4/x/P.m3u8";

    private static String master(String big, String small) {
        return "#EXTM3U\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=9000000,RESOLUTION=1920x1080,CODECS=\"avc1.640028\"\n" + big + "\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=2000000,RESOLUTION=1280x720,CODECS=\"avc1.64001f\"\n" + small + "\n";
    }

    @Test
    public void aTrustedVariantIsPickedByTheCap() {
        assertEquals("https://mvod.itunes.apple.com/itunes-assets/HLSMusic/v4/x/1080.m3u8",
                HlsClip.pickByCap(BASE, master("1080.m3u8", "720.m3u8"), null));
        assertEquals("https://mvod.itunes.apple.com/itunes-assets/HLSMusic/v4/x/720.m3u8",
                HlsClip.pickByCap(BASE, master("1080.m3u8", "720.m3u8"), 720));
    }

    @Test
    public void anUntrustedVariantNeverCounts() {
        // the bigger one is off Apple's hosts or not https: the trusted smaller one is taken
        assertEquals("https://mvod.itunes.apple.com/itunes-assets/HLSMusic/v4/x/720.m3u8",
                HlsClip.pickByCap(BASE, master("https://evil.example/1080.m3u8", "720.m3u8"), null));
        assertEquals("https://mvod.itunes.apple.com/itunes-assets/HLSMusic/v4/x/720.m3u8",
                HlsClip.pickByCap(BASE, master("http://mvod.itunes.apple.com/1080.m3u8", "720.m3u8"), null));
        assertEquals("https://mvod.itunes.apple.com/itunes-assets/HLSMusic/v4/x/720.m3u8",
                HlsClip.pickVariant(BASE, master("https://evil.example/1080.m3u8", "720.m3u8"), 1080));
        // none trusted: no variant at all
        assertNull(HlsClip.pickByCap(BASE, master("https://evil.example/a.m3u8", "https://user@mvod.itunes.apple.com/b.m3u8"), null));
    }

    @Test
    public void anAnswerOverItsCapIsRefused() throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        assertEquals(10, HlsClip.capped(new ByteArrayInputStream(new byte[10]), out, 10));
        assertEquals(10, out.size());
        try {
            HlsClip.capped(new ByteArrayInputStream(new byte[11]), new ByteArrayOutputStream(), 10);
            fail("over the cap");
        } catch (IOException expected) {
            // refused
        }
    }
}
