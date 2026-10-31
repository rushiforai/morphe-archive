package app.bitchord.telegram;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

public final class DownmixTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static boolean near(float a, float b) {
        return Math.abs(a - b) < 0.0005f;
    }

    /** Takes at most {@code chunk} bytes per call, like a sink whose buffer is nearly full. */
    static final class FakeSink implements Downmix.Target {
        final List<Float> written = new ArrayList<>();
        int chunk = Integer.MAX_VALUE, calls;
        int encoding = Downmix.PCM_FLOAT;

        public boolean originalHandleBuffer(ByteBuffer buffer, long time, int count) {
            calls++;
            ByteBuffer b = buffer.order(ByteOrder.LITTLE_ENDIAN);
            int bytes = Downmix.bytesPerSample(encoding);
            int take = Math.min(b.remaining(), chunk / bytes * bytes);
            for (int i = 0; i < take / bytes; i++) written.add(Downmix.read(b, encoding));
            return !b.hasRemaining();
        }
    }

    static ByteBuffer pcm(int encoding, float... samples) {
        ByteBuffer b =
                ByteBuffer.allocate(samples.length * Downmix.bytesPerSample(encoding))
                        .order(ByteOrder.LITTLE_ENDIAN);
        for (float s : samples) Downmix.write(b, encoding, s);
        b.flip();
        return b;
    }

    public static void main(String[] args) throws Exception {
        // Matrix: same weights as ffmpeg -ac 2, normalised so a full-scale frame can't clip.
        float[][] m = Downmix.matrix(6);
        float norm = 1 / (1 + 2 * 0.70710677f);
        check(near(m[0][0], norm) && near(m[0][2], 0.70710677f * norm), "5.1 front and centre");
        check(m[0][3] == 0 && m[1][3] == 0, "LFE left out");
        check(m[0][1] == 0 && m[1][0] == 0 && m[0][5] == 0 && m[1][4] == 0, "No crossover");
        for (int channels : new int[] {3, 4, 5, 6, 8}) {
            float[][] matrix = Downmix.matrix(channels);
            float sum = 0;
            for (float gain : matrix[0]) sum += gain;
            check(near(sum, 1f), channels + " channels sum to unity");
        }
        check(Downmix.matrix(2) == null && Downmix.matrix(7) == null, "Unknown layouts left alone");

        // Which formats are folded down
        Downmix.enabled = true;
        check(Downmix.plan("audio/raw", 6, Downmix.PCM_16BIT, false) != null, "5.1 PCM");
        check(Downmix.plan("audio/raw", 2, Downmix.PCM_16BIT, false) == null, "Stereo untouched");
        check(Downmix.plan("audio/eac3", 6, Downmix.PCM_16BIT, false) == null, "Passthrough");
        check(Downmix.plan("audio/raw", 6, 3, false) == null, "8-bit PCM untouched");
        check(Downmix.plan("audio/raw", 6, Downmix.PCM_FLOAT, true) == null, "Remapped channels");
        Downmix.enabled = false;
        check(Downmix.plan("audio/raw", 6, Downmix.PCM_FLOAT, false) == null, "Turned off");
        Downmix.enabled = true;

        // Every encoding round-trips through the mix
        float[] frame = {0.5f, -0.25f, 0.4f, 0.9f, 0.2f, -0.1f};
        float left = 0, right = 0;
        for (int c = 0; c < 6; c++) {
            left += frame[c] * m[0][c];
            right += frame[c] * m[1][c];
        }
        for (int encoding :
                new int[] {
                    Downmix.PCM_16BIT, Downmix.PCM_24BIT, Downmix.PCM_32BIT, Downmix.PCM_FLOAT
                }) {
            Downmix.State state = Downmix.plan("audio/raw", 6, encoding, false);
            ByteBuffer out = Downmix.convert(state, pcm(encoding, frame), null);
            out.order(ByteOrder.LITTLE_ENDIAN);
            check(out.remaining() == 2 * Downmix.bytesPerSample(encoding), "Two samples out");
            float l = Downmix.read(out, encoding), r = Downmix.read(out, encoding);
            check(near(l, left) && near(r, right), "Mix for encoding " + encoding);
        }
        ByteBuffer loud = pcm(Downmix.PCM_16BIT, 1, 1, 1, 1, 1, 1);
        ByteBuffer mixed =
                Downmix.convert(Downmix.plan("audio/raw", 6, Downmix.PCM_16BIT, false), loud, null)
                        .order(ByteOrder.LITTLE_ENDIAN);
        check(mixed.getShort() <= Short.MAX_VALUE && loud.position() == 0, "Input isn't consumed");

        // Partial writes: the sink takes part of a buffer, then the rest on the next call.
        FakeSink sink = new FakeSink();
        Downmix.handleBuffer(sink, pcm(Downmix.PCM_FLOAT, frame), 0, 1);
        check(sink.written.size() == 6, "Without a plan the original buffer passes through");

        sink.written.clear();
        Object key = sink;
        java.lang.reflect.Field field = Downmix.class.getDeclaredField("states");
        field.setAccessible(true);
        @SuppressWarnings("unchecked")
        java.util.Map<Object, Downmix.State> states =
                (java.util.Map<Object, Downmix.State>) field.get(null);
        states.put(key, Downmix.plan("audio/raw", 6, Downmix.PCM_FLOAT, false));
        float[] three = new float[18];
        for (int i = 0; i < three.length; i++) three[i] = frame[i % 6];
        ByteBuffer input = pcm(Downmix.PCM_FLOAT, three);
        sink.chunk = 8; // one stereo float frame per call
        check(!Downmix.handleBuffer(sink, input, 0, 1), "First call partly handled");
        check(input.position() == 0, "Original not marked consumed yet");
        check(!Downmix.handleBuffer(sink, input, 0, 1), "Second call partly handled");
        check(Downmix.handleBuffer(sink, input, 0, 1), "Third call finishes");
        check(!input.hasRemaining(), "Original consumed when the sink finishes");
        check(sink.written.size() == 6, "Three stereo frames, none repeated");
        check(near(sink.written.get(4), left) && near(sink.written.get(5), right), "Last frame");

        sink.written.clear();
        ByteBuffer next = pcm(Downmix.PCM_FLOAT, three);
        Downmix.handleBuffer(sink, next, 0, 1);
        Downmix.flush(sink);
        ByteBuffer after = pcm(Downmix.PCM_FLOAT, frame);
        sink.chunk = Integer.MAX_VALUE;
        check(Downmix.handleBuffer(sink, after, 0, 1), "After a flush the next buffer is new");
        check(sink.written.size() == 4, "Leftover from before the flush is dropped");
        Downmix.off(sink);
        sink.written.clear();
        Downmix.handleBuffer(sink, pcm(Downmix.PCM_FLOAT, frame), 0, 1);
        check(sink.written.size() == 6, "Fallback configuration passes surround through");

        System.out.println("PASS: " + checks + " surround downmix mix and partial-write checks.");
    }
}
