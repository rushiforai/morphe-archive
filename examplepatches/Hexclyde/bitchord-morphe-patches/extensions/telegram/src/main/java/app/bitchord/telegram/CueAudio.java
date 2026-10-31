package app.bitchord.telegram;

import org.json.JSONObject;

/**
 * One track of an album kept as a single file with a cue sheet, as the player sees it: a WAV file
 * of just that track's samples.
 *
 * <p>From a FLAC file, the frames around the wanted samples are decoded as the player reads, and a
 * seek finds its frame by bisecting the file a few kilobytes at a time, so neither the album nor
 * the track is downloaded whole. From a WAV file, the track's bytes are passed on as they are.
 */
final class CueAudio implements ZipDirectory.Source {
    /** How much of the file is looked at to find a frame near a position. */
    static final int SCAN = 64 * 1024;

    private final ZipDirectory.Range range;
    private final JSONObject cue;
    private final long start, end, sourceSize;
    private final int channels, bits, container, frameBytes;
    private final byte[] header;
    private final FlacDecoder.Info info;

    // The frame decoded last, as WAV bytes, and where the next frame starts.
    private long decodedFirst = -1, nextOffset;
    private int decodedCount;
    private byte[] decoded;

    CueAudio(ZipDirectory.Range range, JSONObject cue) throws Exception {
        this.range = range;
        this.cue = cue;
        start = cue.getLong("start");
        end = cue.getLong("end");
        sourceSize = cue.getLong("total");
        channels = cue.getInt("channels");
        bits = cue.getInt("bits");
        container = container(bits);
        frameBytes = channels * container / 8;
        header = wavHeader(end - start, cue.getInt("rate"), channels, bits);
        if (cue.optString("source").equals("flac")) {
            info = new FlacDecoder.Info();
            info.minBlock = cue.optInt("minBlock");
            info.maxBlock = cue.optInt("maxBlock");
            info.maxFrame = cue.optInt("maxFrame");
            info.rate = cue.getInt("rate");
            info.channels = channels;
            info.bits = bits;
            info.firstFrame = cue.getLong("first");
            info.samples = cue.optLong("samples");
        } else info = null;
    }

    /** The size of the WAV file a track becomes. */
    static long size(long samples, int channels, int bits) {
        return 44 + (channels > 2 || bits > 16 ? 24 : 0) + samples * channels * container(bits) / 8;
    }

    static int container(int bits) {
        return bits <= 8 ? 8 : bits <= 16 ? 16 : bits <= 24 ? 24 : 32;
    }

    @Override
    public int read(long position, byte[] buffer, int offset, int length) throws Exception {
        long total = header.length + (end - start) * frameBytes;
        if (position >= total) return -1;
        int wanted = (int) Math.min(length, total - position);
        if (position < header.length) {
            int n = (int) Math.min(wanted, header.length - position);
            System.arraycopy(header, (int) position, buffer, offset, n);
            return n;
        }
        long sample = start + (position - header.length) / frameBytes;
        int within = (int) ((position - header.length) % frameBytes);
        if (info == null) {
            // WAV: the same bytes, from the track's place in the file.
            long at = cue.getLong("first") + (sample * frameBytes) + within;
            byte[] bytes = range.read(at, wanted);
            System.arraycopy(bytes, 0, buffer, offset, bytes.length);
            return bytes.length == 0 ? -1 : bytes.length;
        }
        if (decoded == null || sample < decodedFirst || sample >= decodedFirst + decodedCount)
            seek(sample);
        int from = (int) ((sample - decodedFirst) * frameBytes) + within;
        long last = Math.min(decodedFirst + decodedCount, end);
        int available = (int) ((last - decodedFirst) * frameBytes) - from;
        int n = Math.min(wanted, available);
        if (n <= 0) return -1;
        System.arraycopy(decoded, from, buffer, offset, n);
        return n;
    }

    /** Decodes the frame holding {@code sample}: the next one when reading on, else found anew. */
    private void seek(long sample) throws Exception {
        if (decoded != null && sample >= decodedFirst + decodedCount) {
            // Reading on: the next few frames, without searching.
            for (int n = 0; n < 4 && sample >= decodedFirst + decodedCount; n++)
                if (!decodeAt(nextOffset)) break;
            if (sample >= decodedFirst && sample < decodedFirst + decodedCount) return;
        }
        long lo = info.firstFrame, hi = sourceSize;
        // Bisect: each step reads a few kilobytes at the middle and finds the frame there.
        while (hi - lo > SCAN) {
            long mid = lo + (hi - lo) / 2;
            long[] found = findFrame(mid);
            if (found == null || found[1] > sample) hi = mid;
            else lo = found[0];
        }
        long[] found = findFrame(lo);
        if (found == null) throw new java.io.IOException("No FLAC frame found");
        long at = found[0];
        for (int n = 0; n < 10_000; n++) {
            if (!decodeAt(at)) throw new java.io.IOException("Damaged FLAC frame");
            if (sample < decodedFirst + decodedCount) return;
            at = nextOffset;
        }
        throw new java.io.IOException("Track position not found");
    }

    /** {offset, first sample} of the first frame at or after {@code from}, or null. */
    private long[] findFrame(long from) throws Exception {
        int window = Math.max(SCAN, info.maxFrame > 0 ? info.maxFrame * 2 + 16 : SCAN);
        byte[] b = range.read(from, (int) Math.min(window, sourceSize - from));
        for (int i = 0; i + 16 < b.length; i++) {
            FlacDecoder.Header h = FlacDecoder.header(b, i, b.length, info);
            if (h == null) continue;
            // A frame start is believed once the whole frame decodes and its CRC-16 matches.
            FlacDecoder.Frame f = decodeFrom(from + i);
            if (f != null) return new long[] {from + i, f.first};
        }
        return null;
    }

    private FlacDecoder.Frame decodeFrom(long at) throws Exception {
        int window = info.maxFrame > 0 ? info.maxFrame + 16 : 256 * 1024;
        for (int attempt = 0; attempt < 4; attempt++, window *= 4) {
            byte[] b = range.read(at, (int) Math.min(window, sourceSize - at));
            FlacDecoder.Frame f = FlacDecoder.decode(b, 0, b.length, info);
            if (f != null || b.length < window) return f;
        }
        return null;
    }

    private boolean decodeAt(long at) throws Exception {
        if (at >= sourceSize) return false;
        FlacDecoder.Frame f = decodeFrom(at);
        if (f == null) return false;
        decodedFirst = f.first;
        decodedCount = f.count;
        nextOffset = at + f.length;
        decoded = pcm(f);
        return true;
    }

    /** A frame as little-endian WAV samples, channel by channel within each sample. */
    private byte[] pcm(FlacDecoder.Frame f) {
        int bytes = container / 8, shift = container - bits;
        byte[] out = new byte[f.count * frameBytes];
        int p = 0;
        for (int i = 0; i < f.count; i++)
            for (int ch = 0; ch < channels; ch++) {
                int v = f.samples[ch][i] << shift;
                if (bytes == 1) out[p++] = (byte) (v + 128); // 8-bit WAV is unsigned
                else for (int k = 0; k < bytes; k++) out[p++] = (byte) (v >> (8 * k));
            }
        return out;
    }

    /** A WAV header; extensible for more than two channels or more than 16 bits, as WAV asks. */
    static byte[] wavHeader(long samples, int rate, int channels, int bits) {
        int container = container(bits);
        boolean extensible = channels > 2 || bits > 16;
        int fmt = extensible ? 40 : 16;
        long data = samples * channels * container / 8;
        java.nio.ByteBuffer b =
                java.nio.ByteBuffer.allocate(20 + fmt + 8).order(java.nio.ByteOrder.LITTLE_ENDIAN);
        b.put(new byte[] {'R', 'I', 'F', 'F'});
        b.putInt((int) Math.min(0xffffffffL, 12 + fmt + data));
        b.put(new byte[] {'W', 'A', 'V', 'E', 'f', 'm', 't', ' '});
        b.putInt(fmt);
        b.putShort((short) (extensible ? 0xfffe : 1));
        b.putShort((short) channels);
        b.putInt(rate);
        b.putInt(rate * channels * container / 8);
        b.putShort((short) (channels * container / 8));
        b.putShort((short) container);
        if (extensible) {
            b.putShort((short) 22);
            b.putShort((short) bits);
            b.putInt(channelMask(channels));
            // KSDATAFORMAT_SUBTYPE_PCM
            b.put(
                    new byte[] {
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0x10,
                        0,
                        (byte) 0x80,
                        0,
                        0,
                        (byte) 0xaa,
                        0,
                        0x38,
                        (byte) 0x9b,
                        0x71
                    });
        }
        b.put(new byte[] {'d', 'a', 't', 'a'});
        b.putInt((int) Math.min(0xffffffffL, data));
        return b.array();
    }

    /** FLAC's channel orders, which are WAV's. */
    static int channelMask(int channels) {
        int[] masks = {0x4, 0x3, 0x7, 0x33, 0x37, 0x3f, 0x70f, 0x63f};
        return channels >= 1 && channels <= 8 ? masks[channels - 1] : 0;
    }

    @Override
    public void close() {}
}
