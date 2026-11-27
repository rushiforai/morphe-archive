package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.RandomAccessFile;

public class SourceBoostTest {
    private static AddonPrep.Prepared prepared(double gainDb) {
        AddonPrep.Prepared p = new AddonPrep.Prepared();
        p.gainDb = gainDb;
        return p;
    }

    /** offset-map.md, Level: the fit's boost (at most +6 dB, lowered for the -1 dBTP peak) is applied, not dropped. */
    @Test
    public void theFitsBoostIsApplied() {
        AddonPrep.Prepared p = prepared(1.5);
        assertEquals(1.5, p.boostDb(), 0);
        assertEquals(1f, p.gainLinear(), 0);
    }

    /** Talking Body (phone, 2026-11-19): its peaks at -0.01 dBTP left no room, so the fit gave 0: none. */
    @Test
    public void aPeakCappedFileGetsWhatTheFitGave() {
        assertEquals(0, prepared(0).boostDb(), 0);
    }

    @Test
    public void aCutIsTheVolumesAndNoBoost() {
        AddonPrep.Prepared p = prepared(-0.25);
        assertEquals(0, p.boostDb(), 0);
        assertEquals(Math.pow(10, -0.25 / 20), p.gainLinear(), 1e-6);
    }

    @Test
    public void ourOwnDecodeHasItBakedIn() {
        AddonPrep.Prepared p = prepared(4);
        p.atmos = true;
        p.wav = new File("x.atmos.wav");
        p.file = p.wav;
        assertEquals(0, p.boostDb(), 0);
    }

    /** A deck file (16-byte header, 16-bit stereo): quiet parts take the gain, a peak stays under the ceiling. */
    @Test
    public void theDeckFileIsBoostedUnderTheCeiling() throws Exception {
        File f = File.createTempFile("deck", ".pcm");
        try {
            int frames = 44100;
            try (DataOutputStream o = new DataOutputStream(new FileOutputStream(f))) {
                o.writeInt(0x414d5850);
                o.writeInt(44100);
                o.writeLong(0);
                for (int i = 0; i < frames; i++) {
                    short v = (short) (i == 30000 ? 32700 : 1000);
                    o.writeShort(Short.reverseBytes(v));
                    o.writeShort(Short.reverseBytes(v));
                }
            }
            AtmosWav.Limited l = AtmosWav.limit(f, 16, 2, 44100, 0.857, -0.3);
            assertTrue(l.maxReductionDb > 0.5);
            try (RandomAccessFile r = new RandomAccessFile(f, "r")) {
                assertEquals(0x414d5850, r.readInt());
                r.seek(16 + 4L * 1000);
                assertEquals(Math.round(1000 * Math.pow(10, 0.857 / 20)), Short.reverseBytes(r.readShort()), 1);
                int max = 0;
                r.seek(16);
                for (int i = 0; i < frames * 2; i++) max = Math.max(max, Math.abs(Short.reverseBytes(r.readShort())));
                assertTrue("peak " + max, max <= Math.round(32768 * Math.pow(10, -0.3 / 20)) + 1);
            }
        } finally {
            //noinspection ResultOfMethodCallIgnored
            f.delete();
        }
    }
}
