package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** The badge and the stats line, from the renderer's input Format only. */
public class QualityTest {
    private static Quality.Badge badge(String mime, int rate, int enc, int bitrate) {
        return Quality.badge(false, mime, rate, enc, bitrate);
    }

    @Test
    public void flac16At44IsLossless() {
        assertEquals(Quality.Badge.LOSSLESS, badge("audio/flac", 44100, Quality.PCM_16, -1));
        assertEquals(Quality.Badge.LOSSLESS, badge("audio/flac", 48000, Quality.PCM_16, -1));
    }

    @Test
    public void above16BitOrAbove48kIsHiRes() {
        // the emulator's Tidotido file: 24-bit at 44.1 kHz, though the addon called it 16-bit
        assertEquals(Quality.Badge.HI_RES, badge("audio/flac", 44100, Quality.PCM_24, -1));
        assertEquals(Quality.Badge.HI_RES, badge("audio/flac", 96000, Quality.PCM_16, -1));
        assertEquals(Quality.Badge.HI_RES, badge("audio/alac", 48000, Quality.PCM_32, -1));
        assertEquals(Quality.Badge.HI_RES, badge("audio/raw", 192000, -1, -1));
    }

    @Test
    public void unknownDepthAt44IsPlainLossless() {
        assertEquals(Quality.Badge.LOSSLESS, badge("audio/flac", 44100, -1, -1));
    }

    @Test
    public void onlyTheRenderersLosslessMimesCount() {
        assertTrue(Quality.lossless("audio/flac"));
        assertTrue(Quality.lossless("audio/x-flac"));
        assertTrue(Quality.lossless("audio/alac"));
        assertTrue(Quality.lossless("audio/raw"));
        assertFalse(Quality.lossless("audio/mp4a-latm"));
        assertFalse(Quality.lossless("audio/mpeg"));
        assertFalse(Quality.lossless("audio/opus"));
        assertFalse(Quality.lossless(null));
    }

    @Test
    public void lossyAt256OrMoreIsHighQuality() {
        assertEquals(Quality.Badge.HIGH_QUALITY, badge("audio/mp4a-latm", 44100, -1, 256000));
        assertEquals(Quality.Badge.HIGH_QUALITY, badge("audio/mpeg", 44100, -1, 320157));
        assertEquals(Quality.Badge.NONE, badge("audio/opus", 48000, -1, 160000));
        assertEquals(Quality.Badge.NONE, badge("audio/mpeg", 44100, -1, -1));
    }

    @Test
    public void upgradingUntilSomethingLosslessIsHeard() {
        assertEquals(Quality.Badge.UPGRADING, Quality.badge(true, null, 0, -1, -1));
        assertEquals(Quality.Badge.UPGRADING, Quality.badge(true, "audio/mpeg", 44100, -1, 320000));
        assertEquals(Quality.Badge.HI_RES, Quality.badge(true, "audio/flac", 96000, Quality.PCM_24, -1));
        assertEquals(Quality.Badge.NONE, Quality.badge(false, null, 0, -1, -1));
    }

    @Test
    public void labelsAndShimmer() {
        assertEquals("Hi-Res Lossless", Quality.Badge.HI_RES.label());
        assertEquals("Lossless", Quality.Badge.LOSSLESS.label());
        assertEquals("High Quality", Quality.Badge.HIGH_QUALITY.label());
        assertEquals("Upgrading Quality", Quality.Badge.UPGRADING.label());
        assertTrue(Quality.Badge.HI_RES.shimmers());
        assertTrue(Quality.Badge.LOSSLESS.shimmers());
        assertFalse(Quality.Badge.HIGH_QUALITY.shimmers());
        assertFalse(Quality.Badge.UPGRADING.shimmers());
    }

    @Test
    public void bitsFromPcmEncoding() {
        assertEquals(16, Quality.bits(Quality.PCM_16));
        assertEquals(24, Quality.bits(Quality.PCM_24));
        assertEquals(32, Quality.bits(Quality.PCM_32));
        assertEquals(32, Quality.bits(Quality.PCM_FLOAT));
        assertEquals(24, Quality.bits(Quality.PCM_24_BE));
        assertEquals(0, Quality.bits(-1));
    }

    @Test
    public void statsLine() {
        assertEquals("FLAC 24/96 · Tidotido", Quality.line("audio/flac", 96000, Quality.PCM_24, -1, "Tidotido"));
        assertEquals("FLAC 16/44.1 · Nebula", Quality.line("audio/flac", 44100, Quality.PCM_16, -1, "Nebula"));
        assertEquals("FLAC 44.1 kHz · X", Quality.line("audio/flac", 44100, -1, -1, "X"));
        assertEquals("AAC 256 kbps · X", Quality.line("audio/mp4a-latm", 44100, -1, 256000, "X"));
        assertEquals("MP3 320 kbps", Quality.line("audio/mpeg", 44100, -1, 320157, null));
    }

    @Test
    public void formatHead() {
        String[] h = AddonPlayback.head("Format(null, null, audio/flac, audio/flac, null, -1, null, [-1, -1, -1.0, null], [2, -1, 44100])");
        assertEquals("audio/flac", h[3]);
        assertEquals("-1", h[5]);
        h = AddonPlayback.head("Format(1, null, audio/mp4, audio/mp4a-latm, mp4a.40.2, 256000, und, [-1, -1, -1.0, null], [2, -1, 44100])");
        assertEquals("audio/mp4a-latm", h[3]);
        assertEquals("256000", h[5]);
    }

    @Test
    public void waveParses() {
        float[][] w = Quality.wave();
        assertEquals(3, w.length);
        for (float[] poly : w) {
            assertTrue(poly.length >= 6 && poly.length % 2 == 0);
            for (int i = 0; i < poly.length; i += 2) {
                assertTrue(poly[i] >= 0 && poly[i] <= Quality.WAVE_W);
                assertTrue(poly[i + 1] >= 0 && poly[i + 1] <= Quality.WAVE_H);
            }
        }
    }
}
