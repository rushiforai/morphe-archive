package app.voidhack.extension.applemusic.sing;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.function.Consumer;

public final class SingPlayback {
    private static final String TAG = "VoidhackSing";
    private static final int MODEL_RATE = 44_100;
    private static final int CHANNELS = 2;
    private static final int PCM_16_BIT = 2;
    private static final int PCM_FLOAT = 4;
    private static final int WINDOW_FRAMES = MdxSpectrum.FRAMES;
    private static final int STEP_FRAMES = WINDOW_FRAMES - MODEL_RATE;
    private static final int OUTPUT_FRAMES = 4096;

    private static final ByteBuffer EMPTY = ByteBuffer.allocateDirect(0);
    private static final Map<Object, Stream> STREAMS = new WeakHashMap<>();
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(
            task -> new Thread(task, "apple-music-vocal-separation"));
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final List<Consumer<String>> PREPARATION_LISTENERS = new ArrayList<>();

    private static volatile SingInference inference;
    private static volatile int mix;
    private static volatile boolean preparing;
    private static volatile boolean supported;

    private SingPlayback() {}

    public static int mix() {
        return mix;
    }

    public static void setMix(int value) {
        mix = Math.max(-100, Math.min(100, value));
    }

    public static boolean isReady() {
        return inference != null;
    }

    public static boolean isPreparing() {
        return preparing;
    }

    public static boolean streamSupported() {
        return supported;
    }

    public static boolean supportsFormat(int sampleRate, int channels, int encoding) {
        boolean compatible = isCompatibleFormat(sampleRate, channels, encoding);
        supported = compatible;
        return compatible;
    }

    private static boolean isCompatibleFormat(int rate, int channels, int encoding) {
        if (channels != CHANNELS || (encoding != PCM_16_BIT && encoding != PCM_FLOAT)) return false;
        return switch (rate) {
            case 32_000, MODEL_RATE, 48_000, 88_200, 96_000, 176_400, 192_000 -> true;
            default -> false;
        };
    }

    public static void prepare(Context context, Consumer<String> onComplete) {
        Context app = context.getApplicationContext();
        MAIN.post(() -> {
            if (isReady()) {
                onComplete.accept(null);
                return;
            }
            PREPARATION_LISTENERS.add(onComplete);
            if (preparing) return;
            preparing = true;
            WORKER.execute(() -> prepareModel(app));
        });
    }

    private static void prepareModel(Context context) {
        String error = null;
        try {
            inference = SingInference.open(context);
            Log.i(TAG, "Vocal separation model ready");
        } catch (Exception | LinkageError failure) {
            Log.w(TAG, "Could not prepare vocal separation model", failure);
            error = "model";
        }
        String result = error;
        MAIN.post(() -> {
            preparing = false;
            List<Consumer<String>> listeners = new ArrayList<>(PREPARATION_LISTENERS);
            PREPARATION_LISTENERS.clear();
            for (Consumer<String> listener : listeners) listener.accept(result);
        });
    }

    public static ByteBuffer queueInput(
            Object processor, ByteBuffer input, int sampleRate, int channels, int encoding) {
        boolean compatible = isCompatibleFormat(sampleRate, channels, encoding);
        if (input.hasRemaining()) supported = compatible;
        if (!compatible) return null;

        Stream stream;
        synchronized (STREAMS) {
            stream = STREAMS.get(processor);
            SingInference model = inference;
            if (stream == null && model != null && mix != 0 && input.hasRemaining()) {
                stream = new Stream(model, sampleRate, encoding);
                STREAMS.put(processor, stream);
                Log.i(TAG, "Vocal separation enabled for stereo PCM at " + sampleRate + " Hz");
            }
        }
        return stream == null ? null : stream.feed(input);
    }

    public static void finish(Object processor) {
        Stream stream = streamFor(processor);
        if (stream != null) stream.inputEnded = true;
    }

    public static ByteBuffer drain(Object processor) {
        Stream stream = streamFor(processor);
        return stream == null ? null : stream.drain();
    }

    public static boolean hasPendingOutput(Object processor) {
        Stream stream = streamFor(processor);
        return stream != null && stream.inputEnded
                && (stream.ready != null || stream.pending != null || stream.inputFrames > 0);
    }

    private static Stream streamFor(Object processor) {
        synchronized (STREAMS) {
            return STREAMS.get(processor);
        }
    }

    public static void flush(Object processor) {
        Stream stream;
        synchronized (STREAMS) {
            stream = STREAMS.remove(processor);
        }
        if (stream != null) stream.cancel();
    }

    private static final class Stream {
        private final SingInference model;
        private final int sampleRate;
        private final int windowFrames;
        private final int stepFrames;
        private final int overlapFrames;
        private final int rampFrames;
        private final boolean floatPcm;
        private final int bytesPerSample;
        private final ByteBuffer output;
        private float[] input;
        // These resamplers and scratch arrays belong to the inference worker.
        private StereoResampler toModel;
        private StereoResampler toSource;
        private float[] modelInput;
        private float[] modelVocals;
        private int inputFrames;
        private Future<Window> pending;
        private int pendingFrames;
        private Window ready;
        private Window previous;
        private int outputFrame;
        private int outputEnd;
        private boolean inputEnded;
        private boolean hasFullWindow;
        private boolean inferenceFailed;
        private float currentMix;

        Stream(SingInference model, int sampleRate, int encoding) {
            this.model = model;
            this.sampleRate = sampleRate;
            windowFrames = (int) (((long) WINDOW_FRAMES * sampleRate + MODEL_RATE - 1) / MODEL_RATE);
            // Start each window on a frame common to both sample grids so the overlap never drifts.
            int alignment = MODEL_RATE / StereoResampler.gcd(MODEL_RATE, sampleRate);
            int alignedStep = STEP_FRAMES - STEP_FRAMES % alignment;
            stepFrames = (int) ((long) alignedStep * sampleRate / MODEL_RATE);
            overlapFrames = windowFrames - stepFrames;
            rampFrames = sampleRate / 100;
            input = new float[windowFrames * CHANNELS];
            floatPcm = encoding == PCM_FLOAT;
            bytesPerSample = floatPcm ? Float.BYTES : Short.BYTES;
            output = ByteBuffer.allocateDirect(OUTPUT_FRAMES * CHANNELS * bytesPerSample)
                    .order(ByteOrder.LITTLE_ENDIAN);
        }

        ByteBuffer feed(ByteBuffer source) {
            if (inputEnded) return drain();
            promote();
            consume(source);
            scheduleFullWindow();
            return drain();
        }

        ByteBuffer drain() {
            promote();
            if (inputEnded) {
                scheduleRemaining();
                promote();
            }
            if (ready == null) return EMPTY;

            output.clear();
            render(output, Math.min(outputEnd, outputFrame + OUTPUT_FRAMES), mix / 100f);
            if (outputFrame == outputEnd) {
                previous = ready;
                ready = null;
            }
            output.flip();
            return output;
        }

        private void consume(ByteBuffer source) {
            int frames = Math.min(windowFrames - inputFrames,
                    source.remaining() / (bytesPerSample * CHANNELS));
            if (frames == 0) return;

            ByteOrder order = source.order();
            source.order(ByteOrder.LITTLE_ENDIAN);
            try {
                int first = inputFrames * CHANNELS;
                int limit = first + frames * CHANNELS;
                if (floatPcm) {
                    for (int sample = first; sample < limit; sample++) {
                        float value = source.getFloat();
                        input[sample] = Float.isFinite(value) ? value : 0f;
                    }
                } else {
                    for (int sample = first; sample < limit; sample++) {
                        input[sample] = source.getShort() / 32768f;
                    }
                }
            } finally {
                source.order(order);
            }
            inputFrames += frames;
        }

        private void scheduleFullWindow() {
            if (inputFrames < windowFrames || pending != null) return;
            float[] full = input;
            input = new float[windowFrames * CHANNELS];
            System.arraycopy(full, stepFrames * CHANNELS, input, 0, overlapFrames * CHANNELS);
            inputFrames = overlapFrames;
            pendingFrames = stepFrames;
            pending = submit(full);
            hasFullWindow = true;
        }

        private void scheduleRemaining() {
            if (pending != null || inputFrames == 0) return;
            if (hasFullWindow && inputFrames == overlapFrames) {
                if (ready != null) return;
                ready = previous;
                previous = null;
                outputFrame = stepFrames;
                outputEnd = windowFrames;
            } else {
                pendingFrames = inputFrames;
                pending = submit(input);
            }
            input = null;
            inputFrames = 0;
        }

        private Future<Window> submit(float[] pcm) {
            return WORKER.submit(() -> separate(pcm));
        }

        private Window separate(float[] pcm) {
            if (inferenceFailed) return new Window(pcm, null);
            try {
                float[] vocals = new float[pcm.length];
                if (sampleRate == MODEL_RATE) {
                    model.separate(pcm, vocals);
                } else {
                    if (toModel == null) {
                        toModel = new StereoResampler(sampleRate, MODEL_RATE);
                        toSource = new StereoResampler(MODEL_RATE, sampleRate);
                        modelInput = new float[WINDOW_FRAMES * CHANNELS];
                        modelVocals = new float[modelInput.length];
                    }
                    toModel.resample(pcm, modelInput);
                    model.separate(modelInput, modelVocals);
                    toSource.resample(modelVocals, vocals);
                }
                return new Window(pcm, vocals);
            } catch (Exception | LinkageError failure) {
                inferenceFailed = true;
                Log.w(TAG, "Vocal separation failed for this stream", failure);
                return new Window(pcm, null);
            }
        }

        private void promote() {
            if (ready != null || pending == null || !pending.isDone()) return;
            ready = await(pending);
            pending = null;
            outputFrame = 0;
            outputEnd = pendingFrames;
        }

        private static Window await(Future<Window> future) {
            boolean interrupted = false;
            try {
                while (true) {
                    try {
                        return future.get();
                    } catch (InterruptedException ignored) {
                        interrupted = true;
                    }
                }
            } catch (ExecutionException failure) {
                throw new IllegalStateException("Could not process PCM", failure.getCause());
            } finally {
                if (interrupted) Thread.currentThread().interrupt();
            }
        }

        void cancel() {
            if (pending != null) pending.cancel(false);
        }

        private void render(ByteBuffer destination, int limit, float level) {
            int ramp = Math.min(rampFrames, limit - outputFrame);
            float increment = ramp == 0 ? 0f : (level - currentMix) / ramp;
            int rampEnd = outputFrame + ramp;
            while (outputFrame < limit) {
                currentMix = outputFrame < rampEnd ? currentMix + increment : level;
                float crossfade = previous == null || outputFrame >= overlapFrames
                        ? 1f : outputFrame / (float) overlapFrames;
                int sample = outputFrame * CHANNELS;
                for (int channel = 0; channel < CHANNELS; channel++) {
                    int index = sample + channel;
                    float value = ready.sample(index, currentMix);
                    if (crossfade < 1f) {
                        float retained = previous.sample(stepFrames * CHANNELS + index, currentMix);
                        value = retained + (value - retained) * crossfade;
                    }
                    if (floatPcm) {
                        destination.putFloat(Math.max(-1f, Math.min(1f, value)));
                    } else {
                        int linear = Math.round(value * 32768f);
                        destination.putShort((short) Math.max(Short.MIN_VALUE,
                                Math.min(Short.MAX_VALUE, linear)));
                    }
                }
                outputFrame++;
            }
            currentMix = level;
        }
    }

    private static final class Window {
        private final float[] original;
        private final float[] vocals;

        Window(float[] original, float[] vocals) {
            this.original = original;
            this.vocals = vocals;
        }

        float sample(int index, float level) {
            float input = original[index];
            if (vocals == null || level == 0f) return input;
            float voice = vocals[index];
            return level < 0f ? input + level * voice : input + level * (voice - input);
        }
    }
}
