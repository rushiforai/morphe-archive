package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;

import org.junit.Test;

public class AtmosWavTest {
    private static short[] samples(File f) throws Exception {
        ByteBuffer b = ByteBuffer.wrap(Files.readAllBytes(f.toPath())).order(ByteOrder.LITTLE_ENDIAN);
        b.position(44);
        short[] s = new short[b.remaining() / 2];
        for (int i = 0; i < s.length; i++) s[i] = b.getShort();
        return s;
    }

    private static File wav(short[] s, int rate) throws Exception {
        File f = File.createTempFile("atmos", ".wav");
        ByteBuffer b = ByteBuffer.allocate(44 + s.length * 2).order(ByteOrder.LITTLE_ENDIAN);
        b.put(AtmosWav.header(rate, 2, s.length * 2L));
        for (short x : s) b.putShort(x);
        Files.write(f.toPath(), b.array());
        return f;
    }

    @Test
    public void boostsUnderTheCeilingAndLeavesQuietPartsAPlainGain() throws Exception {
        int rate = 48000, n = rate * 2;
        short[] s = new short[n * 2];
        for (int i = 0; i < n; i++) {
            // a quiet second (-30 dBFS), then a loud one (-3 dBFS), a 1 kHz tone on both channels
            double a = i < rate ? 0.0316 : 0.708;
            short v = (short) Math.round(32767 * a * Math.sin(2 * Math.PI * 1000 * i / rate));
            s[2 * i] = v;
            s[2 * i + 1] = v;
        }
        File f = wav(s, rate);
        try {
            AtmosWav.Limited l = AtmosWav.scale(f, 12);
            short[] o = samples(f);
            int ceil = (int) Math.round(32768 * Math.pow(10, -1.5 / 20));
            int loudPeak = 0;
            for (int i = rate; i < n; i++) loudPeak = Math.max(loudPeak, Math.abs(o[2 * i]));
            assertTrue("peak " + loudPeak + " over " + ceil, loudPeak <= ceil + 1);
            assertTrue(loudPeak > ceil * 0.95);
            // the quiet part, away from the loud one's look-ahead: +12 dB exactly
            double g = Math.pow(10, 12 / 20.0);
            for (int i = 1000; i < rate / 2; i += 37) assertEquals(Math.round(s[2 * i] * g), o[2 * i], 1);
            assertTrue(l.limitedShare > 0.45 && l.limitedShare < 0.55);
            assertEquals(-20 * Math.log10(ceil / (32767 * 0.708 * g)), l.maxReductionDb, 0.2);
        } finally {
            //noinspection ResultOfMethodCallIgnored
            f.delete();
        }
    }

    @Test
    public void aPeakInTheFirstMillisecondsStaysUnderTheCeiling() throws Exception {
        int rate = 48000, n = rate / 2;
        short[] s = new short[n * 2];
        // loud from the first frame: the look-ahead has nothing before it
        for (int i = 0; i < n; i++) {
            short v = (short) Math.round(32767 * 0.9 * Math.sin(2 * Math.PI * 1000 * i / rate));
            s[2 * i] = v;
            s[2 * i + 1] = v;
        }
        File f = wav(s, rate);
        try {
            AtmosWav.scale(f, 6);
            short[] o = samples(f);
            int ceil = (int) Math.round(32768 * Math.pow(10, -1.5 / 20));
            for (int i = 0; i < 480; i++) assertTrue("frame " + i + ": " + o[2 * i], Math.abs(o[2 * i]) <= ceil + 1);
        } finally {
            //noinspection ResultOfMethodCallIgnored
            f.delete();
        }
    }

    @Test
    public void aMissingWavFails() {
        try {
            AtmosWav.scale(new File("does-not-exist.wav"), 6);
            org.junit.Assert.fail();
        } catch (java.io.IOException expected) {
        }
    }

    @Test
    public void boostGoesTowardYouTubeUpToTheCap() {
        assertEquals(13.5, AtmosWav.boostDb(6, 13.5), 0);
        assertEquals(14, AtmosWav.boostDb(6, 20), 0);
        assertEquals(-2, AtmosWav.boostDb(-2, -2), 0);
        assertEquals(3, AtmosWav.boostDb(3, Double.NaN), 0);
    }

    @Test
    public void writesAWavOfTheDecodeAndBakesTheGain() throws Exception {
        File f = File.createTempFile("atmos", ".wav");
        try {
            AtmosWav.Writer w = new AtmosWav.Writer(f);
            w.format(48000, 2);
            w.add(new float[][]{{0.25f, -0.5f, 0.75f}, {0.125f, 1f, -1f}}, 3);
            w.finish();
            ByteBuffer h = ByteBuffer.wrap(Files.readAllBytes(f.toPath())).order(ByteOrder.LITTLE_ENDIAN);
            assertEquals("RIFF", new String(h.array(), 0, 4, "US-ASCII"));
            assertEquals(36 + 12, h.getInt(4));
            assertEquals(2, h.getShort(22));
            assertEquals(48000, h.getInt(24));
            assertEquals(12, h.getInt(40));
            short[] s = samples(f);
            assertEquals(8192, s[0]);
            assertEquals(4096, s[1]);
            assertEquals(-16384, s[2]);
            assertEquals(32767, s[3]);   // 1.0 held at full scale
        } finally {
            //noinspection ResultOfMethodCallIgnored
            f.delete();
        }
    }
}
