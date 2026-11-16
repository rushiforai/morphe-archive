package app.morphed.extension.twitch.musicfilter;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import java.util.zip.CRC32;

/**
 * Shazam's audio signature of a few seconds of 16 kHz mono sound: the loudest spectral peaks per frequency band,
 * in Shazam's binary format (the algorithm SongRec and shazamio_core use; checked against shazamio_core's output).
 */
public final class ShazamSignature {
    public static final int RATE = 16000;
    private static final int FFT_SIZE = 2048;
    private static final int BINS = FFT_SIZE / 2 + 1;
    private static final int RING = 256;

    private static final float[] HANNING = new float[FFT_SIZE];

    static {
        for (int i = 0; i < FFT_SIZE; i++) HANNING[i] = (float) (0.5 * (1 - Math.cos(2 * Math.PI * (i + 1) / (FFT_SIZE + 1))));
    }

    private static final class Peak {
        final int pass;
        final int magnitude;
        final int bin;

        Peak(int pass, int magnitude, int bin) {
            this.pass = pass;
            this.magnitude = magnitude;
            this.bin = bin;
        }
    }

    private final short[] samples = new short[FFT_SIZE];
    private int samplesIndex;
    private final float[][] ffts = new float[RING][BINS];
    private int fftIndex;
    private final float[][] spread = new float[RING][BINS];
    private int spreadIndex;
    private int spreadWritten;
    private final double[] frame = new double[FFT_SIZE];
    private final double[] re = new double[BINS], im = new double[BINS];
    private final FrameFft fft = new FrameFft(FFT_SIZE);
    private final TreeMap<Integer, List<Peak>> bands = new TreeMap<>();

    private ShazamSignature() {
    }

    /** The signature of 16 kHz mono 16-bit samples, as Shazam's data URI. */
    public static String uri(short[] sound) {
        ShazamSignature generator = new ShazamSignature();
        int chunks = sound.length / 128;
        short[] chunk = new short[128];
        for (int c = 0; c < chunks; c++) {
            System.arraycopy(sound, c * 128, chunk, 0, 128);
            generator.doFft(chunk);
            generator.doPeakSpreading();
            if (generator.spreadWritten >= 46) generator.doPeakRecognition();
        }
        return "data:audio/vnd.shazam.sig;base64," + java.util.Base64.getEncoder().encodeToString(generator.encode(sound.length));
    }

    private void doFft(short[] chunk) {
        System.arraycopy(chunk, 0, samples, samplesIndex, 128);
        samplesIndex = (samplesIndex + 128) & (FFT_SIZE - 1);
        for (int i = 0; i < FFT_SIZE; i++) {
            frame[i] = (float) (samples[(i + samplesIndex) & (FFT_SIZE - 1)] * HANNING[i]);
        }
        fft.rfft(frame, re, im);
        float[] out = ffts[fftIndex];
        for (int k = 0; k < BINS; k++) {
            float power = (float) (((float) re[k] * (float) re[k] + (float) im[k] * (float) im[k]) / (float) (1 << 17));
            out[k] = Math.max(power, 0.0000000001f);
        }
        fftIndex = (fftIndex + 1) & (RING - 1);
    }

    private void doPeakSpreading() {
        float[] real = ffts[(fftIndex - 1) & (RING - 1)];
        float[] out = spread[spreadIndex];
        System.arraycopy(real, 0, out, 0, BINS);
        for (int p = 0; p <= BINS - 3; p++) out[p] = Math.max(out[p], Math.max(out[p + 1], out[p + 2]));
        for (int p = 0; p < BINS; p++) {
            float max = out[p];
            for (int former : new int[]{1, 3, 6}) {
                float[] older = spread[(spreadIndex - former) & (RING - 1)];
                older[p] = Math.max(older[p], max);
                max = older[p];
            }
        }
        spreadIndex = (spreadIndex + 1) & (RING - 1);
        spreadWritten++;
    }

    private static final int[] NEIGHBORS = {-10, -7, -4, -3, 1, 2, 5, 8};
    private static final int[] OTHERS = {-53, -45, 165, 172, 179, 186, 193, 200, 214, 221, 228, 235, 242, 249};

    private static float magnitude(float value) {
        return (float) Math.max(Math.log(value), 1.0 / 64.0) * 1477.3f + 6144.0f;
    }

    private void doPeakRecognition() {
        float[] fft46 = ffts[(fftIndex - 46) & (RING - 1)];
        float[] spread49 = spread[(spreadIndex - 49) & (RING - 1)];
        for (int bin = 10; bin <= 1014; bin++) {
            float value = fft46[bin];
            if (!(value >= 1.0f / 64.0f && value >= spread49[bin - 1])) continue;
            float maxNeighbor = 0;
            for (int offset : NEIGHBORS) maxNeighbor = Math.max(maxNeighbor, spread49[bin + offset]);
            if (!(value > maxNeighbor)) continue;
            float maxOther = maxNeighbor;
            for (int offset : OTHERS) maxOther = Math.max(maxOther, spread[(spreadIndex + offset) & (RING - 1)][bin - 1]);
            if (!(value > maxOther)) continue;
            int pass = spreadWritten - 46;
            float peak = magnitude(value);
            float before = magnitude(fft46[bin - 1]);
            float after = magnitude(fft46[bin + 1]);
            float variation1 = peak * 2 - before - after;
            float variation2 = (after - before) * 32 / variation1;
            int corrected = (bin * 64 + (int) variation2) & 0xffff;
            float hz = corrected * (16000.0f / 2.0f / 1024.0f / 64.0f);
            int band;
            int whole = (int) hz;
            if (whole >= 250 && whole <= 519) band = 0;
            else if (whole >= 520 && whole <= 1449) band = 1;
            else if (whole >= 1450 && whole <= 3499) band = 2;
            else if (whole >= 3500 && whole <= 5500) band = 3;
            else continue;
            bands.computeIfAbsent(band, b -> new ArrayList<>()).add(new Peak(pass, ((int) peak) & 0xffff, corrected));
        }
    }

    private byte[] encode(int numberOfSamples) {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        for (java.util.Map.Entry<Integer, List<Peak>> entry : bands.entrySet()) {
            ByteArrayOutputStream peaks = new ByteArrayOutputStream();
            int pass = 0;
            for (Peak peak : entry.getValue()) {
                if (peak.pass - pass >= 255) {
                    peaks.write(0xff);
                    writeInt(peaks, peak.pass);
                    pass = peak.pass;
                }
                peaks.write(peak.pass - pass);
                writeShort(peaks, peak.magnitude);
                writeShort(peaks, peak.bin);
                pass = peak.pass;
            }
            writeInt(body, 0x60030040 + entry.getKey());
            writeInt(body, peaks.size());
            byte[] bytes = peaks.toByteArray();
            body.write(bytes, 0, bytes.length);
            for (int i = 0; i < (4 - bytes.length % 4) % 4; i++) body.write(0);
        }
        byte[] content = body.toByteArray();
        int sizeMinusHeader = content.length + 8;
        ByteBuffer out = ByteBuffer.allocate(48 + 8 + content.length).order(ByteOrder.LITTLE_ENDIAN);
        out.putInt(0xcafe2580);
        out.putInt(0); // crc32, below
        out.putInt(sizeMinusHeader);
        out.putInt(0x94119c00);
        out.putInt(0).putInt(0).putInt(0);
        out.putInt(3 << 27); // 16000 Hz
        out.putInt(0).putInt(0);
        out.putInt((int) (numberOfSamples + RATE * 0.24));
        out.putInt((15 << 19) + 0x40000);
        out.putInt(0x40000000);
        out.putInt(sizeMinusHeader);
        out.put(content);
        byte[] bytes = out.array();
        CRC32 crc = new CRC32();
        crc.update(bytes, 8, bytes.length - 8);
        ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).putInt(4, (int) crc.getValue());
        return bytes;
    }

    private static void writeInt(ByteArrayOutputStream out, int value) {
        out.write(value);
        out.write(value >>> 8);
        out.write(value >>> 16);
        out.write(value >>> 24);
    }

    private static void writeShort(ByteArrayOutputStream out, int value) {
        out.write(value);
        out.write(value >>> 8);
    }
}
