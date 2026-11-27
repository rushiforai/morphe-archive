package app.ayham.extension.music.addons;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** Downloads: what a file really is (its bytes), the tier steps, and the stated-format check. */
public class DownloadFormatTest {
    /** A FLAC header: "fLaC", a STREAMINFO block with this rate, channels and bits. */
    private static byte[] flac(int rate, int channels, int bits) {
        byte[] b = new byte[64];
        b[0] = 'f';
        b[1] = 'L';
        b[2] = 'a';
        b[3] = 'C';
        b[4] = (byte) 0x80; // last block, STREAMINFO
        b[7] = 34;
        int d = 8;
        b[d + 10] = (byte) (rate >> 12);
        b[d + 11] = (byte) (rate >> 4);
        b[d + 12] = (byte) ((rate & 0xf) << 4 | (channels - 1) << 1 | ((bits - 1) >> 4));
        b[d + 13] = (byte) (((bits - 1) & 0xf) << 4);
        return b;
    }

    @Test
    public void flacStreamInfo() {
        Fetch.Info cd = Fetch.info(flac(44100, 2, 16), 64);
        assertNotNull(cd);
        assertEquals(44100, cd.rate);
        assertEquals(16, cd.bits);
        assertFalse(cd.hiRes());
        Fetch.Info hr = Fetch.info(flac(96000, 2, 24), 64);
        assertEquals(96000, hr.rate);
        assertEquals(24, hr.bits);
        assertTrue(hr.hiRes());
        assertTrue(Fetch.info(flac(192000, 2, 16), 64).hiRes());
    }

    @Test
    public void lossyIsNotLossless() {
        byte[] mp3 = new byte[64];
        mp3[0] = 'I';
        mp3[1] = 'D';
        mp3[2] = '3';
        assertNull(Fetch.info(mp3, 64));
        byte[] aac = new byte[64];
        aac[4] = 'f';
        aac[5] = 't';
        aac[6] = 'y';
        aac[7] = 'p';
        aac[8] = 'M';
        aac[9] = '4';
        aac[10] = 'A';
        assertNull(Fetch.info(aac, 64)); // an MP4 with no 'alac' box
    }

    @Test
    public void tiersStepDown() {
        assertArrayEquals(new String[]{Pick.LOSSLESS, Pick.HIRES, Pick.CD}, AddonDownloads.steps(AddonDownloads.BEST));
        assertArrayEquals(new String[]{Pick.HIRES, Pick.CD}, AddonDownloads.steps(AddonDownloads.HIRES));
        assertArrayEquals(new String[]{Pick.CD}, AddonDownloads.steps(AddonDownloads.CD));
    }

    /** A FLAC behind an ID3 tag bigger than the 64 KB head (embedded cover art) is still read. */
    @Test
    public void flacAfterBigId3() throws Exception {
        int tag = 200_000;
        byte[] f = new byte[10 + tag + 64];
        f[0] = 'I';
        f[1] = 'D';
        f[2] = '3';
        f[6] = (byte) ((tag >> 21) & 0x7f);
        f[7] = (byte) ((tag >> 14) & 0x7f);
        f[8] = (byte) ((tag >> 7) & 0x7f);
        f[9] = (byte) (tag & 0x7f);
        System.arraycopy(flac(96000, 2, 24), 0, f, 10 + tag, 64);
        java.io.File file = java.io.File.createTempFile("id3", ".flac");
        try {
            java.nio.file.Files.write(file.toPath(), f);
            assertNull(Fetch.formatRefusal(file, "flac", Pick.HIRES, null));
        } finally {
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    /** An ALAC .m4a with its 'moov' (the 'alac' boxes) at the end of the file. */
    @Test
    public void alacAtTheEnd() throws Exception {
        byte[] f = new byte[300_000];
        f[4] = 'f';
        f[5] = 't';
        f[6] = 'y';
        f[7] = 'p';
        int at = f.length - 100;
        byte[] alac = {'a', 'l', 'a', 'c'};
        System.arraycopy(alac, 0, f, at, 4);
        System.arraycopy(alac, 0, f, at + 40, 4);
        int c = at + 40 + 8;
        f[c + 5] = 24;
        int rate = 96000;
        f[c + 20] = (byte) (rate >> 24);
        f[c + 21] = (byte) (rate >> 16);
        f[c + 22] = (byte) (rate >> 8);
        f[c + 23] = (byte) rate;
        java.io.File file = java.io.File.createTempFile("alac", ".m4a");
        try {
            java.nio.file.Files.write(file.toPath(), f);
            assertNull(Fetch.formatRefusal(file, "m4a", Pick.HIRES, null));
        } finally {
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    @Test
    public void statedFormat() {
        Protocol.Stream s = new Protocol.Stream();
        s.codec = "mp3";
        assertNotNull(Fetch.statedRefusal(s, Pick.CD));
        s.codec = "FLAC";
        s.bitDepth = 16.0;
        s.sampleRate = 44100.0;
        assertNull(Fetch.statedRefusal(s, Pick.CD));
        assertNotNull(Fetch.statedRefusal(s, Pick.HIRES));
        s.bitDepth = 24.0;
        assertNull(Fetch.statedRefusal(s, Pick.HIRES));
        s.codec = null; // not stated: the bytes decide
        assertNull(Fetch.statedRefusal(s, Pick.HIRES));
    }
}
