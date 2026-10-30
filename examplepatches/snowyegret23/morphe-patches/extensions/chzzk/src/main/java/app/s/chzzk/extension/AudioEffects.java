package app.s.chzzk.extension;

import java.lang.reflect.Array;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public final class AudioEffects implements InvocationHandler {
    private static final ByteBuffer EMPTY = ByteBuffer.allocateDirect(0).order(ByteOrder.LITTLE_ENDIAN);
    private static volatile Settings settings = new Settings(0, 100, true);

    private static final class Settings {
        final int mode;
        final int volume;
        final boolean preventDistortion;
        final double threshold;
        final double exponent;
        final double makeup;

        Settings(int mode, int volume, boolean preventDistortion) {
            this.mode = mode;
            this.volume = volume;
            this.preventDistortion = preventDistortion;
            double thresholdDb = mode == 1 ? -18 : mode == 2 ? -24 : -30;
            double ratio = mode == 1 ? 2 : mode == 2 ? 4 : 8;
            threshold = Math.pow(10, thresholdDb / 20);
            exponent = 1 - 1 / ratio;
            makeup = mode == 0 ? 1 : Math.pow(10, (mode * 6) / 20.0);
        }
    }

    private int pendingRate;
    private int pendingChannels;
    private boolean active;
    private int channels;
    private double attack;
    private double release;
    private double smoothing;
    private double limiterRelease;
    private double envelope;
    private double gain = 1;
    private double limiter = 1;
    private boolean ended;
    private ByteBuffer buffer = EMPTY;
    private ByteBuffer output = EMPTY;

    private AudioEffects() {}

    static void update(boolean compress, int strength, boolean boost, int volume) {
        int mode = compress ? Math.max(0, Math.min(2, strength)) + 1 : 0;
        int percent = boost ? Math.max(100, Math.min(300, volume)) : 100;
        boolean preventDistortion = !boost;
        Settings current = settings;
        if (current.mode != mode || current.volume != percent || current.preventDistortion != preventDistortion) {
            settings = new Settings(mode, percent, preventDistortion);
        }
    }

    public static Object append(Object original) {
        Class<?> processor = original.getClass().getComponentType();
        int count = Array.getLength(original);
        Object result = Array.newInstance(processor, count + 1);
        System.arraycopy(original, 0, result, 0, count);
        Array.set(result, count, Proxy.newProxyInstance(processor.getClassLoader(),
            new Class<?>[] {processor}, new AudioEffects()));
        return result;
    }

    public static int sampleRate(Object format) { return 0; }
    public static int channelCount(Object format) { return 0; }
    public static int encoding(Object format) { return 0; }
    public static Object unsetFormat() { return null; }

    public static boolean renamedProcessorMethods() { return false; }

    @Override public Object invoke(Object proxy, Method method, Object[] args) {
        String name = method.getName();
        if (renamedProcessorMethods()) {
            switch (name) {
                case "a": name = "f"; break;
                case "c": name = "a"; break;
                case "e": name = "d"; break;
                case "f": name = "e"; break;
            }
        }
        switch (name) {
            case "d":
                pendingRate = sampleRate(args[0]);
                pendingChannels = channelCount(args[0]);
                active = encoding(args[0]) == 2 && pendingRate > 0 && pendingChannels > 0;
                return active ? args[0] : unsetFormat();
            case "f": return active;
            case "flush": case "g":
                flush();
                return null;
            case "e":
                queue((ByteBuffer) args[0]);
                return null;
            case "a":
                ByteBuffer result = output;
                output = EMPTY;
                return result;
            case "h":
                ended = true;
                return null;
            case "b": return ended && !output.hasRemaining();
            case "i": return args[0];
            case "reset":
                pendingRate = pendingChannels = 0;
                active = false;
                flush();
                buffer = EMPTY;
                return null;
            case "hashCode": return System.identityHashCode(proxy);
            case "equals": return proxy == args[0];
            case "toString": return "S Chzzk audio processor";
            default: throw new UnsupportedOperationException(method.getName());
        }
    }

    private void flush() {
        channels = pendingChannels;
        int rate = Math.max(1, pendingRate);
        attack = Math.exp(-1.0 / (rate * 0.005));
        release = Math.exp(-1.0 / (rate * 0.200));
        smoothing = Math.exp(-1.0 / (rate * 0.020));
        limiterRelease = Math.exp(-1.0 / (rate * 0.100));
        envelope = 0;
        gain = limiter = 1;
        ended = false;
        output = EMPTY;
    }

    private void queue(ByteBuffer input) {
        if (!input.hasRemaining() || output.hasRemaining()) return;
        int size = input.remaining();
        if (buffer.capacity() < size) buffer = ByteBuffer.allocateDirect(size).order(ByteOrder.LITTLE_ENDIAN);
        else buffer.clear();
        Settings config = settings;
        boolean dry = config.mode == 0 && config.volume == 100;
        if (channels <= 0 || (dry && Math.abs(gain - 1) < 0.0001 && limiter > 0.9999)) {
            buffer.put(input);
            envelope = 0;
            gain = limiter = 1;
        } else {
            input.order(ByteOrder.LITTLE_ENDIAN);
            int frameBytes = channels * 2;
            while (input.remaining() >= frameBytes) {
                int start = input.position();
                double peak = 0;
                for (int c = 0; c < channels; c++) {
                    peak = Math.max(peak, Math.abs(input.getShort(start + c * 2) / 32768.0));
                }
                double coefficient = peak > envelope ? attack : release;
                envelope = coefficient * envelope + (1 - coefficient) * peak;
                double compression = config.mode != 0 && envelope > config.threshold
                    ? Math.pow(config.threshold / envelope, config.exponent) : 1;
                double target = compression * config.makeup * config.volume / 100.0;
                gain = smoothing * gain + (1 - smoothing) * target;
                if (config.preventDistortion) {
                    double ceiling = dry ? 1 : 0.98;
                    double limit = peak * gain > ceiling ? ceiling / (peak * gain) : 1;
                    limiter = limit < limiter ? limit : limiterRelease * limiter + (1 - limiterRelease) * limit;
                } else {
                    limiter = 1;
                }
                double scale = gain * limiter;
                for (int c = 0; c < channels; c++) {
                    int sample = (int) Math.round(input.getShort() * scale);
                    buffer.putShort((short) Math.max(-32768, Math.min(32767, sample)));
                }
            }
            // Media3 supplies complete PCM frames; retain any unexpected trailing bytes.
            buffer.put(input);
        }
        buffer.flip();
        output = buffer;
    }
}
