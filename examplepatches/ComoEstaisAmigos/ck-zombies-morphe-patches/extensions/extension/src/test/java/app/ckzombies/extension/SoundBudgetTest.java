package app.ckzombies.extension;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class SoundBudgetTest {

    private static final int[] STEREO_44K = {2, 44100};

    @Rule
    public TemporaryFolder tmp = new TemporaryFolder();

    /** The first page of an Ogg Vorbis stream: page header, one segment, identification packet. */
    private static byte[] vorbisHead(int channels, int rate) {
        byte[] b = new byte[27 + 1 + 30];
        b[0] = 'O';
        b[1] = 'g';
        b[2] = 'g';
        b[3] = 'S';
        b[5] = 0x02; // beginning of stream
        b[26] = 1; // one segment
        b[27] = 30; // of 30 bytes
        int p = 28;
        b[p] = 1; // identification packet
        byte[] name = "vorbis".getBytes();
        System.arraycopy(name, 0, b, p + 1, 6);
        b[p + 11] = (byte) channels;
        b[p + 12] = (byte) rate;
        b[p + 13] = (byte) (rate >> 8);
        b[p + 14] = (byte) (rate >> 16);
        b[p + 15] = (byte) (rate >> 24);
        return b;
    }

    @Test
    public void readsChannelsAndRate() {
        byte[] head = vorbisHead(2, 44100);
        assertArrayEquals(STEREO_44K, SoundBudget.vorbisFormat(head, head.length));
        head = vorbisHead(1, 22050);
        assertArrayEquals(new int[] {1, 22050}, SoundBudget.vorbisFormat(head, head.length));
    }

    @Test
    public void rejectsWhatIsNotVorbis() {
        byte[] wav = "RIFF\0\0\0\0WAVEfmt ".getBytes();
        assertNull(SoundBudget.vorbisFormat(wav, wav.length));

        byte[] opus = vorbisHead(2, 48000);
        System.arraycopy("OpusHead".getBytes(), 0, opus, 28, 8);
        assertNull(SoundBudget.vorbisFormat(opus, opus.length));

        byte[] cut = vorbisHead(2, 44100);
        assertNull(SoundBudget.vorbisFormat(cut, 40));

        byte[] silent = vorbisHead(0, 44100);
        assertNull(SoundBudget.vorbisFormat(silent, silent.length));
    }

    /** The bug: a 20.8 s briefing is 510 KB on disk but 3.7 MB decoded, and SoundPool kept 5.94 s. */
    @Test
    public void aLongBriefingStaysOutOfSoundPool() {
        assertEquals(3_669_120, SoundBudget.pcmBytes(20_800, 2, 44100));
        assertFalse(SoundBudget.fitsSoundPool(20_800, STEREO_44K));
        // The shortest sound in the game that SoundPool would have cut: 7.1 s.
        assertFalse(SoundBudget.fitsSoundPool(7_109, STEREO_44K));
    }

    @Test
    public void shortEffectsStillGoToSoundPool() {
        // level_up.ogg, the game's longest pooled sound that fits.
        assertTrue(SoundBudget.fitsSoundPool(5_162, STEREO_44K));
        assertTrue(SoundBudget.fitsSoundPool(120, STEREO_44K));
    }

    @Test
    public void theRuleIsDecodedSizeNotLength() {
        // 20 s of 22.05 kHz mono decodes to 882,000 bytes, which fits.
        assertTrue(SoundBudget.fitsSoundPool(20_000, new int[] {1, 22050}));
    }

    @Test
    public void theEdgeIsMaxPooledPcm() {
        // At 8 kHz mono a millisecond is exactly 16 bytes, so the limit falls on a whole ms.
        long ms = SoundBudget.MAX_POOLED_PCM / 16;
        assertEquals(SoundBudget.MAX_POOLED_PCM, SoundBudget.pcmBytes(ms, 1, 8000));
        assertTrue(SoundBudget.fitsSoundPool(ms, new int[] {1, 8000}));
        assertFalse(SoundBudget.fitsSoundPool(ms + 1, new int[] {1, 8000}));
        assertTrue(SoundBudget.MAX_POOLED_PCM < SoundBudget.SOUNDPOOL_HEAP);
    }

    @Test
    public void unknownFormatOrLengthIsNeverPooled() {
        assertFalse(SoundBudget.fitsSoundPool(1_000, null));
        assertFalse(SoundBudget.fitsSoundPool(0, STEREO_44K));
        assertFalse(SoundBudget.fitsSoundPool(-1, STEREO_44K));
    }

    @Test
    public void readsTheHeaderFromAFile() throws IOException {
        File f = tmp.newFile("sound.ogg");
        FileOutputStream out = new FileOutputStream(f);
        out.write(vorbisHead(2, 44100));
        out.close();
        assertArrayEquals(STEREO_44K, SoundBudget.vorbisFormat(f.getPath()));
        assertNull(SoundBudget.vorbisFormat(new File(tmp.getRoot(), "missing.ogg").getPath()));
    }
}
