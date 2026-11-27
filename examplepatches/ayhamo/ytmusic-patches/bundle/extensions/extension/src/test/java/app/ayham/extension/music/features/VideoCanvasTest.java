package app.ayham.extension.music.features;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.nio.ByteBuffer;

public class VideoCanvasTest {
    /** 100 markers over [dur] s, flat at 0.2 with a bump at [peakAt]. */
    private static double[] curve(double dur, double peakAt) {
        int n = 100;
        double step = dur / n;
        double[] h = new double[n * 3];
        for (int i = 0; i < n; i++) {
            double t = i * step;
            h[i * 3] = t;
            h[i * 3 + 1] = step;
            h[i * 3 + 2] = Math.abs(t - peakAt) < 15 ? 1 - Math.abs(t - peakAt) / 30 : 0.2;
        }
        return h;
    }

    @Test
    public void thePartStartsWhereTheMostReplayedRiseStarts() {
        double s = VideoCanvas.partStart(curve(200, 120), 200);
        assertEquals(true, s > 95 && s < 122);
    }

    @Test
    public void aBumpOnlyInTheLast30SecondsIsNoPart() {
        assertEquals(-1, VideoCanvas.partStart(curve(200, 190), 200), 1e-9);
    }

    @Test
    public void withoutACurveThereIsNoPart() {
        // Prism's BestPart: no curve, no part (the clip then takes the storyboard's choice)
        assertEquals(-1, VideoCanvas.partStart(null, 200), 1e-9);
    }

    private static String pick(String title, String artist, String videoTitle, String channel) {
        java.util.List<String[]> v = new java.util.ArrayList<>();
        v.add(new String[]{"v1", videoTitle, channel, "0"});
        String[] got = VideoCanvas.pick(title, VideoCanvas.artists(artist), 0, v);
        return got == null ? null : got[0];
    }

    @Test
    public void theArtistsOwnMusicVideoMatches() {
        assertEquals("v1", pick("Midnight Sun", "Zara Larsson", "Midnight Sun", "Zara Larsson"));
        assertEquals("v1", pick("Midnight Sun", "Zara Larsson", "Zara Larsson - Midnight Sun (Official Music Video)", "ZaraLarssonVEVO"));
        assertEquals(null, pick("Midnight Sun", "Zara Larsson", "Zara Larsson - Midnight Sun (Lyrics)", "Ghosts We Carry"));
        assertEquals(null, pick("Midnight Sun", "Zara Larsson", "Midnight Sun (Lyric Video)", "Zara Larsson"));
        assertEquals(null, pick("Midnight Sun", "Zara Larsson", "Midnight Sun (Zara Larsson cover) in the Live Lounge", "BBCRadio1VEVO"));
        assertEquals(null, pick("Midnight Sun", "Zara Larsson", "Stateside + Zara Larsson", "PinkPantheress"));
        assertEquals(2, VideoCanvas.artists("Taylor Swift & Ed Sheeran").length);
    }

    @Test
    public void lengthsAreReadFromTheResult() {
        assertEquals(225, VideoCanvas.lengthOf("3:45"));
        assertEquals(3723, VideoCanvas.lengthOf("1:02:03"));
        assertEquals(0, VideoCanvas.lengthOf("12M views"));
    }

    @Test
    public void sidxGivesTheFragmentsCoveringThePart() {
        ByteBuffer b = ByteBuffer.allocate(32 + 3 * 12);
        b.putInt(32 + 3 * 12).putInt(0x73696478).putInt(0).putInt(1).putInt(1000).putInt(0).putInt(0).putShort((short) 0).putShort((short) 3);
        for (int i = 0; i < 3; i++) b.putInt(100 * (i + 1)).putInt(5000).putInt(0x90000000);
        VideoCanvas.Sidx s = VideoCanvas.Sidx.parse(b.array(), 0);
        // fragments: 0-5 s (100 B), 5-10 s (200 B), 10-15 s (300 B), from byte 1000
        assertArrayEquals(new long[]{1100, 1299, 5_000_000}, s.range(6, 3, 1000));
        assertArrayEquals(new long[]{1100, 1599, 5_000_000}, s.range(6, 8, 1000));
    }
}
