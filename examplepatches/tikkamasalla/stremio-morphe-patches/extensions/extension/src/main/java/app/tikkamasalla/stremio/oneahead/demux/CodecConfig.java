package app.tikkamasalla.stremio.oneahead.demux;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;

/** Builds the csd-N buffers Android's decoders expect. Pure Java, so it tests on a PC. */
public final class CodecConfig {
    private CodecConfig() {
    }

    /** csd-0, csd-1, ... for the track; empty when the codec needs none; null when required data is bad. */
    public static byte[][] csd(TrackInfo t) {
        if (t.mime == null) return null;
        byte[] p = t.codecPrivate;
        switch (t.mime) {
            case "audio/mp4a-latm":
                return p != null && p.length >= 2 ? new byte[][]{p} : new byte[][]{legacyAacConfig(t)};
            case "audio/opus":
                if (p == null || p.length < 19) return null;
                long preSkip = (p[10] & 0xFF) | ((p[11] & 0xFF) << 8);
                long delayNs = t.codecDelayNs > 0 ? t.codecDelayNs : preSkip * 1_000_000_000L / 48000;
                long preRollNs = t.seekPreRollNs > 0 ? t.seekPreRollNs : 80_000_000L;
                return new byte[][]{p, nativeLong(delayNs), nativeLong(preRollNs)};
            case "audio/vorbis":
                return p == null ? null : splitVorbis(p);
            case "audio/flac":
                return p == null ? null : new byte[][]{p};
            default:
                return new byte[0][];
        }
    }

    private static byte[] nativeLong(long v) {
        return ByteBuffer.allocate(8).order(ByteOrder.nativeOrder()).putLong(0, v).array();
    }

    /** A_AAC/MPEG4/LC style tracks have no private data: AAC-LC config from the rate and channels. */
    private static byte[] legacyAacConfig(TrackInfo t) {
        int[] rates = {96000, 88200, 64000, 48000, 44100, 32000, 24000, 22050, 16000, 12000, 11025, 8000, 7350};
        int index = 4;
        for (int i = 0; i < rates.length; i++) {
            if (rates[i] == t.sampleRate) index = i;
        }
        return new byte[]{(byte) ((2 << 3) | (index >> 1)), (byte) (((index & 1) << 7) | ((t.channels & 15) << 3))};
    }

    /** Xiph-laced ID, comment and setup headers: the decoder wants ID and setup. */
    static byte[][] splitVorbis(byte[] b) {
        if (b.length < 3 || b[0] != 2) return null;
        int p = 1;
        int[] len = new int[2];
        for (int i = 0; i < 2; i++) {
            int v;
            do {
                if (p >= b.length) return null;
                v = b[p++] & 0xFF;
                len[i] += v;
            } while (v == 255);
        }
        if (p + len[0] + len[1] >= b.length || b[p] != 1 || b[p + len[0] + len[1]] != 5) return null;
        return new byte[][]{Arrays.copyOfRange(b, p, p + len[0]), Arrays.copyOfRange(b, p + len[0] + len[1], b.length)};
    }
}
