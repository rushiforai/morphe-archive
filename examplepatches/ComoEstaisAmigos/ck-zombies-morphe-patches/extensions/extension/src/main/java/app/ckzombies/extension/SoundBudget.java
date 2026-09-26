package app.ckzombies.extension;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Whether a sound fits SoundPool, which depends on its decoded size, not its size on disk.
 *
 * SoundPool decodes a sample into one 1 MiB buffer and silently drops whatever does not fit:
 * kDefaultHeapSize in AOSP's Sound.cpp (Android 11 on) and SoundPool.cpp (before), and in the
 * AudioCache behind MediaPlayer::decode on 2.3. At 44.1 kHz stereo that is 5.94 s, so the
 * mission briefings, 7 to 21 s of speech in a few hundred KB of Vorbis each, played cut short
 * from their second play on. A sound whose PCM would not fit stays with the MediaPlayer tier.
 *
 * Plain Java with no Android types, so the decision is unit-tested off the device.
 */
public final class SoundBudget {

    /** SoundPool's decode buffer, the same on every Android version the game runs on. */
    public static final long SOUNDPOOL_HEAP = 1024 * 1024;

    /**
     * The most PCM a pooled sound may decode to. The headroom covers a duration rounded down to
     * whole milliseconds and a decoder that does not trim the last packet; the game's sounds sit
     * far from it either way (the longest that fits decodes to 910,504 bytes, the shortest that
     * does not to 1,254,248).
     */
    public static final long MAX_POOLED_PCM = SOUNDPOOL_HEAP - 64 * 1024;

    /** First page header, a full segment table, and the 30-byte identification packet. */
    static final int HEAD_BYTES = 27 + 255 + 30;

    private SoundBudget() {
    }

    /** {channels, sample rate} from an Ogg Vorbis identification header, or null for anything else. */
    public static int[] vorbisFormat(byte[] head, int length) {
        if (length < 27 || head[0] != 'O' || head[1] != 'g' || head[2] != 'g' || head[3] != 'S') {
            return null;
        }
        int body = 27 + (head[26] & 0xff);
        if (length < body + 16 || head[body] != 1) {
            return null;
        }
        for (int i = 0; i < 6; i++) {
            if (head[body + 1 + i] != "vorbis".charAt(i)) {
                return null;
            }
        }
        int channels = head[body + 11] & 0xff;
        int rate = (head[body + 12] & 0xff) | (head[body + 13] & 0xff) << 8
                | (head[body + 14] & 0xff) << 16 | (head[body + 15] & 0xff) << 24;
        if (channels <= 0 || rate <= 0) {
            return null;
        }
        return new int[] {channels, rate};
    }

    /** The same, read from the start of a file; null when it cannot be read. */
    public static int[] vorbisFormat(String path) {
        byte[] head = new byte[HEAD_BYTES];
        InputStream in = null;
        try {
            in = new FileInputStream(path);
            int n = 0;
            int r;
            while (n < head.length && (r = in.read(head, n, head.length - n)) > 0) {
                n += r;
            }
            return vorbisFormat(head, n);
        } catch (IOException e) {
            return null;
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
            }
        }
    }

    /** Bytes of 16-bit PCM that a sound of this length and format decodes to. */
    public static long pcmBytes(long durationMs, int channels, int sampleRate) {
        return durationMs * sampleRate / 1000 * channels * 2;
    }

    /** True only for a sound known to fit; an unknown format or length never goes to SoundPool. */
    public static boolean fitsSoundPool(long durationMs, int[] format) {
        return format != null && durationMs > 0 && pcmBytes(durationMs, format[0], format[1]) <= MAX_POOLED_PCM;
    }
}
