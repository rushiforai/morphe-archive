package app.ayham.extension.music.addons;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.ShortBuffer;
import java.nio.channels.FileChannel;

/**
 * Dolby Atmos is played from our own decode of the file: the phone's Dolby decoder's 2-channel
 * render (AudioDecode), written as a 16-bit WAV with the gain in it.
 *
 * YT's player decoding the E-AC-3 itself didn't line up with that decode, which the offset and
 * the mix decks come from (S21 FE, Blinding Lights, recorded): it played 41 to 59 ms ahead, a
 * different amount after each seek, and 6 dB quieter. So a hand-over to the decks jumped and
 * stepped in level. Played from the WAV, the player, the fit and the decks read the same samples.
 * The gain is in the samples too, so a boost needs no more than the player's volume of 1.
 */
public final class AtmosWav {
    private AtmosWav() {
    }

    private static final int HEADER = 44;

    /** Written while the file decodes; finish() fills in the header. */
    public static final class Writer {
        private final File file;
        private OutputStream out;
        private int channels;
        private int rate;
        private long bytes;
        private byte[] buf = new byte[0];

        public Writer(File file) {
            this.file = file;
        }

        public File file() {
            return file;
        }

        public void format(int rate, int channels) throws IOException {
            if (out != null) return;   // a decoder's second format change: the samples carry on
            this.rate = rate;
            this.channels = Math.min(2, channels);
            out = new BufferedOutputStream(new FileOutputStream(file), 1 << 16);
            out.write(new byte[HEADER]);
        }

        public void add(float[][] planar, int frames) throws IOException {
            if (out == null) return;
            int n = frames * channels * 2;
            if (buf.length < n) buf = new byte[n];
            int k = 0;
            for (int f = 0; f < frames; f++) {
                for (int c = 0; c < channels; c++) {
                    float[] ch = planar[Math.min(c, planar.length - 1)];
                    int v = Math.round(ch[f] * 32768f);
                    if (v > 32767) v = 32767;
                    else if (v < -32768) v = -32768;
                    buf[k++] = (byte) v;
                    buf[k++] = (byte) (v >> 8);
                }
            }
            out.write(buf, 0, n);
            bytes += n;
        }

        /** The header, then the file closed. */
        public void finish() throws IOException {
            if (out == null) throw new IOException("no audio decoded");
            out.close();
            out = null;
            try (RandomAccessFile f = new RandomAccessFile(file, "rw")) {
                f.seek(0);
                f.write(header(rate, channels, bytes));
            }
        }

        /** On a failure: closed and deleted. */
        public void abort() {
            try {
                if (out != null) out.close();
            } catch (IOException ignored) {
            }
            out = null;
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    static byte[] header(int rate, int channels, long dataBytes) {
        ByteBuffer h = ByteBuffer.allocate(HEADER).order(ByteOrder.LITTLE_ENDIAN);
        h.put(new byte[]{'R', 'I', 'F', 'F'}).putInt((int) (36 + dataBytes)).put(new byte[]{'W', 'A', 'V', 'E'});
        h.put(new byte[]{'f', 'm', 't', ' '}).putInt(16).putShort((short) 1).putShort((short) channels)
                .putInt(rate).putInt(rate * channels * 2).putShort((short) (channels * 2)).putShort((short) 16);
        h.put(new byte[]{'d', 'a', 't', 'a'}).putInt((int) dataBytes);
        return h.array();
    }

    /**
     * Atmos renders are mastered far quieter than YouTube's copy (Blinding Lights: -23.8 against
     * -10.2 LUFS), more than the +6 dB a file may be boosted plainly. Our decode takes the whole
     * difference, up to this, with a limiter keeping it under the ceiling.
     */
    public static final double MAX_BOOST_DB = 14;
    /** Sample ceiling: 0.5 dB under the -1 dBTP target, room for the peaks between samples. */
    static final double CEILING_DBFS = -1.5;
    static final double LOOKAHEAD_SEC = 0.005, RELEASE_SEC = 0.08;

    /** The gain our decode is given: the fit's, or more toward YouTube's loudness (wantDb). */
    public static double boostDb(double gainDb, double wantDb) {
        if (Double.isNaN(wantDb) || wantDb <= gainDb) return gainDb;
        return Math.max(gainDb, Math.min(wantDb, MAX_BOOST_DB));
    }

    /** What the limiter did: the share of frames turned down and the most it took off. */
    public static final class Limited {
        public double gainDb, limitedShare, maxReductionDb;

        @Override
        public String toString() {
            return String.format(java.util.Locale.US, "%+.2f dB, limiter on %.2f%% of the song, at most -%.1f dB", gainDb, limitedShare * 100, maxReductionDb);
        }
    }

    /**
     * The gain into the samples, in place, under a look-ahead limiter: each frame's need (the
     * ceiling over its loudest channel) is the minimum over the next 5 ms, averaged over 5 ms, so
     * the gain is already down when a peak arrives and ramps smoothly; it comes back up with an
     * 80 ms release. Without a peak over the ceiling it is a plain gain.
     */
    public static Limited scale(File wav, double gainDb) throws IOException {
        // a WAV that is gone or empty must not pass as the song's audio (RandomAccessFile would
        // create it)
        if (wav == null || wav.length() <= HEADER) throw new IOException("Atmos WAV missing or empty: " + wav);
        int channels, rate;
        try (RandomAccessFile f = new RandomAccessFile(wav, "r"); FileChannel ch = f.getChannel()) {
            ByteBuffer hdr = ByteBuffer.allocate(HEADER).order(ByteOrder.LITTLE_ENDIAN);
            ch.read(hdr, 0);
            channels = Math.max(1, hdr.getShort(22));
            rate = hdr.getInt(24) > 0 ? hdr.getInt(24) : 48000;
        }
        return limit(wav, HEADER, channels, rate, gainDb, CEILING_DBFS);
    }

    /**
     * The gain into a file of 16-bit little-endian samples after a [header] of that many bytes, in
     * place, under the look-ahead limiter (see scale) with its ceiling at [ceilingDbfs].
     */
    public static Limited limit(File file, long header, int channels, int rate, double gainDb, double ceilingDbfs) throws IOException {
        Limited out = new Limited();
        out.gainDb = gainDb;
        if (Math.abs(gainDb) < 0.005) return out;
        try (RandomAccessFile f = new RandomAccessFile(file, "rw"); FileChannel ch = f.getChannel()) {
            long len = (ch.size() - header) & ~1L;
            if (len <= 0) return out;
            MappedByteBuffer m = ch.map(FileChannel.MapMode.READ_WRITE, header, len);
            ShortBuffer s = m.order(ByteOrder.LITTLE_ENDIAN).asShortBuffer();
            int frames = s.limit() / channels;
            new Limiter(rate, (float) Math.pow(10, gainDb / 20), (float) (32768 * Math.pow(10, ceilingDbfs / 20))).run(s, channels, frames, out);
            m.force();
        }
        return out;
    }

    /** One pass over the samples (see scale). Output lags the input by the look-ahead, in place. */
    static final class Limiter {
        final int look;
        final float g, ceil, release;

        Limiter(int rate, float g, float ceil) {
            look = Math.max(1, (int) Math.round(rate * LOOKAHEAD_SEC));
            this.g = g;
            this.ceil = ceil;
            release = (float) (1 - Math.exp(-1 / (RELEASE_SEC * rate)));
        }

        void run(ShortBuffer s, int channels, int frames, Limited out) {
            // need r[i] = min(1, ceil / (peak of frame i x g)); m[k] = min r over k..k+look-1 (a
            // monotonic deque); avg[p] = mean m over p-look+1..p; e follows avg down at once, up
            // with the release
            float[] rv = new float[look + 1];
            int[] ri = new int[look + 1];
            int head = 0, tail = 0, size = 0;
            float[] mRing = new float[look];
            double sum = look; // m before the start: 1
            for (int k = 0; k < look; k++) mRing[k] = 1;
            float e = 1, minE = 1;
            long limited = 0;
            for (int i = 0; i < frames + look - 1; i++) {
                float r = 1;
                if (i < frames) {
                    int peak = 0;
                    for (int c = 0; c < channels; c++) peak = Math.max(peak, Math.abs(s.get(i * channels + c)));
                    float want = peak * g;
                    if (want > ceil) r = ceil / want;
                }
                // the deque keeps rising values: drop those not smaller than r from the back
                while (size > 0 && rv[(tail - 1 + rv.length) % rv.length] >= r) {
                    tail = (tail - 1 + rv.length) % rv.length;
                    size--;
                }
                rv[tail] = r;
                ri[tail] = i;
                tail = (tail + 1) % rv.length;
                size++;
                int k = i - look + 1; // the window k..i is complete
                while (ri[head] < k) {
                    head = (head + 1) % rv.length;
                    size--;
                }
                if (k < 0) continue;
                float mk = rv[head];
                if (k == 0) {
                    // the window before the start: the first value, so the average never exceeds r
                    for (int j = 0; j < look; j++) mRing[j] = mk;
                    sum = (double) mk * look;
                }
                int slot = k % look;
                sum += mk - mRing[slot];
                mRing[slot] = mk;
                int p = k; // avg[p] = mean of m[p-look+1..p]
                float avg = (float) (sum / look);
                e = avg < e ? avg : e + (avg - e) * release;
                if (e > avg) e = avg;
                if (e < 0.9999f) limited++;
                if (e < minE) minE = e;
                float k2 = g * e;
                for (int c = 0; c < channels; c++) {
                    int at = p * channels + c;
                    int v = Math.round(s.get(at) * k2);
                    s.put(at, (short) (v > 32767 ? 32767 : v < -32768 ? -32768 : v));
                }
            }
            out.limitedShare = frames == 0 ? 0 : limited / (double) frames;
            out.maxReductionDb = -20 * Math.log10(Math.max(minE, 1e-6f));
        }
    }

    /** A downloaded Atmos file decoded to dst with gainDb in it. */
    public static File decode(File src, File dst, double gainDb) throws Exception {
        final Writer w = new Writer(dst);
        try {
            AudioDecode.decode(src, new AudioDecode.Sink() {
                @Override
                public void format(int rate, int channels) throws IOException {
                    w.format(rate, channels);
                }

                @Override
                public void block(float[][] planar, int frames) throws IOException {
                    w.add(planar, frames);
                }
            });
            w.finish();
            scale(dst, gainDb);
            return dst;
        } catch (Throwable t) {
            w.abort();
            throw t;
        }
    }
}
