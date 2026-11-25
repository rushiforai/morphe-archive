package app.voidhack.extension.applemusic.sing;

import android.content.Context;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.function.Consumer;

public final class SingPlayback {
    private static final String TAG = "VoidhackSing";
    private static final int MODEL_RATE = 44_100;
    private static final int STEREO_CHANNELS = 2;
    private static final int MAX_CHANNELS = 24;
    private static final int PCM_16_BIT = 2;
    private static final int PCM_FLOAT = 4;
    private static final int WINDOW_FRAMES = MdxSpectrum.FRAMES;
    private static final int STEP_FRAMES = WINDOW_FRAMES - MODEL_RATE;
    private static final int OUTPUT_FRAMES = 4096;
    private static final int MAX_STEREO_READY_WINDOWS = 2;
    private static final int MAX_SURROUND_READY_WINDOWS = 1;
    private static final int MAX_STEREO_POOLED_BUFFERS = 6;
    private static final int MAX_SURROUND_POOLED_BUFFERS = 4;
    private static final int MAX_LARGE_SURROUND_POOLED_BUFFERS = 2;
    private static final long STARTUP_WAIT_MS = 180L;
    private static final String MIME_EAC3_JOC = "audio/eac3-joc";
    private static final String MIME_EAC3 = "audio/eac3";
    private static final String MIME_AC3 = "audio/ac3";
    private static final String MIME_AC4 = "audio/ac4";

    private static final ByteBuffer EMPTY = ByteBuffer.allocateDirect(0);
    private static final Map<Object, Stream> STREAMS = new WeakHashMap<>();
    private static final ConcurrentHashMap<String, Boolean> DOLBY_DECODER_CACHE = new ConcurrentHashMap<>();
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(() -> {
            // Keep priority well below UI/RenderThread/SurfaceFlinger/AudioTrack while staying out
            // of Android's SP_BACKGROUND cgroup (nice < 10) so CPU inference stays responsive.
            Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND - 4);
            task.run();
        }, "apple-music-vocal-separation");
        thread.setPriority(Thread.NORM_PRIORITY - 2);
        return thread;
    });
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final List<Consumer<String>> PREPARATION_LISTENERS = new ArrayList<>();

    private static volatile SingInference inference;
    private static volatile int mix;
    private static volatile long mixZeroSinceElapsedMs;
    private static volatile boolean preparing;
    private static volatile boolean supported;

    private SingPlayback() {}

    public static int mix() {
        return mix;
    }

    public static void setMix(int value) {
        int clamped = Math.max(-100, Math.min(100, value));
        int previous = mix;
        if (clamped == 0) {
            if (previous != 0) {
                mixZeroSinceElapsedMs = SystemClock.elapsedRealtime();
            }
        } else {
            mixZeroSinceElapsedMs = 0L;
        }
        mix = clamped;
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
        Log.i(TAG, "Configured audio format: " + sampleRate + " Hz, " + channels
                + "ch, encoding=" + encoding + " (supported=" + compatible + ")");
        return compatible;
    }

    /**
     * Disables encoded bitstream passthrough for Dolby Atmos / Dolby Audio when the device has a
     * platform MediaCodec decoder so decoded PCM passes through SingAudioProcessor.
     */
    public static boolean shouldAllowPassthrough(String mimeType) {
        if (!MIME_EAC3_JOC.equals(mimeType) && !MIME_EAC3.equals(mimeType)
                && !MIME_AC3.equals(mimeType) && !MIME_AC4.equals(mimeType)) {
            return true;
        }
        boolean allow = !hasPlatformDolbyDecoder(mimeType);
        Log.i(TAG, "Passthrough check mime=" + mimeType + " -> allowPassthrough=" + allow);
        return allow;
    }

    private static boolean hasPlatformDolbyDecoder(String mimeType) {
        Boolean cached = DOLBY_DECODER_CACHE.get(mimeType);
        if (cached != null) return cached;
        boolean found = hasNonSecureDecoderInList(MediaCodecList.REGULAR_CODECS, mimeType)
                || hasNonSecureDecoderInList(MediaCodecList.ALL_CODECS, mimeType);
        DOLBY_DECODER_CACHE.put(mimeType, found);
        return found;
    }

    private static boolean hasNonSecureDecoderInList(int kind, String mimeType) {
        try {
            MediaCodecInfo[] codecs = new MediaCodecList(kind).getCodecInfos();
            for (MediaCodecInfo info : codecs) {
                if (info.isEncoder()) continue;
                String name = info.getName();
                if (name != null && name.endsWith(".secure")) continue;
                for (String type : info.getSupportedTypes()) {
                    if (!type.equalsIgnoreCase(mimeType)
                            && !(MIME_EAC3_JOC.equals(mimeType) && type.equalsIgnoreCase(MIME_EAC3))) {
                        continue;
                    }
                    try {
                        MediaCodecInfo.CodecCapabilities caps = info.getCapabilitiesForType(type);
                        if (caps.isFeatureRequired(MediaCodecInfo.CodecCapabilities.FEATURE_SecurePlayback)
                                || caps.isFeatureRequired(MediaCodecInfo.CodecCapabilities.FEATURE_TunneledPlayback)) {
                            continue;
                        }
                    } catch (RuntimeException ignored) {
                    }
                    return true;
                }
            }
        } catch (RuntimeException failure) {
            Log.w(TAG, "Could not query platform Dolby decoders (kind=" + kind + ")", failure);
        }
        return false;
    }

    private static boolean isCompatibleFormat(int rate, int channels, int encoding) {
        if (channels < 1 || channels > MAX_CHANNELS
                || (encoding != PCM_16_BIT && encoding != PCM_FLOAT)) {
            return false;
        }
        return switch (rate) {
            case 24_000, 32_000, MODEL_RATE, 48_000, 88_200, 96_000, 176_400, 192_000 -> true;
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
            SingInference opened = SingInference.open(context);
            inference = opened;
            Log.i(TAG, "Vocal separation model ready (backend=" + opened.activeBackend().id() + ")");
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
            if (stream != null && (stream.sampleRate != sampleRate
                    || stream.channels != channels
                    || stream.floatPcm != (encoding == PCM_FLOAT))) {
                stream.cancel();
                STREAMS.remove(processor);
                stream = null;
            }
            SingInference model = inference;
            if (stream == null && model != null && mix != 0 && input.hasRemaining()) {
                stream = new Stream(model, sampleRate, channels, encoding);
                STREAMS.put(processor, stream);
                Log.i(TAG, "Vocal separation enabled for " + channels + "ch PCM at " + sampleRate + " Hz");
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
                && (stream.ready != null
                        || !stream.readyQueue.isEmpty()
                        || stream.pendingWindow != null
                        || stream.inputFrames > 0);
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
        private final int channels;
        private final int windowFrames;
        private final int windowSamples;
        private final int stepFrames;
        private final int overlapFrames;
        private final int rampFrames;
        private final int maxReadyWindows;
        private final int maxPooledBuffers;
        private final boolean floatPcm;
        private final int bytesPerSample;
        private final ByteBuffer output;
        private final Object poolLock = new Object();
        private final ArrayDeque<float[]> bufferPool;
        private final ArrayDeque<Window> readyQueue;
        private float[] input;
        // Resamplers and multichannel scratch buffers belong strictly to the inference worker.
        private StereoResampler toModel;
        private StereoResampler toSource;
        private float[] modelInput;
        private float[] modelVocals;
        private float[] stereoSourceScratch;
        private float[] stereoOutScratch;
        private MdxSpectrum channelSpectrum;
        private float[] mixSpec;
        private float[] vocalSpec;
        private float[] maskL;
        private float[] maskR;
        private float[] maskC;
        private int[] activeChannels;
        private int[] audibleChannels;
        private int lastAudibleChannelCount;
        private int inputFrames;
        private Future<?> pendingTask;
        private Window pendingWindow;
        private Window ready;
        private Window previous;
        private int outputFrame;
        private int outputEnd;
        private int outputBudgetFrames;
        private int leadDrainRemainder;
        private int deadlineMissCount;
        private boolean loggedFirstWindow;
        private boolean inputEnded;
        private boolean hasFullWindow;
        private boolean hasStartedOutput;
        private boolean inferenceFailed;
        private float currentMix;

        Stream(SingInference model, int sampleRate, int channels, int encoding) {
            this.model = model;
            this.sampleRate = sampleRate;
            this.channels = channels;
            windowFrames = (int) (((long) WINDOW_FRAMES * sampleRate + MODEL_RATE - 1) / MODEL_RATE);
            windowSamples = windowFrames * channels;
            // Start each window on a frame common to both sample grids so the overlap never drifts.
            int alignment = MODEL_RATE / StereoResampler.gcd(MODEL_RATE, sampleRate);
            int alignedStep = STEP_FRAMES - STEP_FRAMES % alignment;
            stepFrames = (int) ((long) alignedStep * sampleRate / MODEL_RATE);
            overlapFrames = windowFrames - stepFrames;
            rampFrames = sampleRate / 100;
            maxReadyWindows = channels > STEREO_CHANNELS ? MAX_SURROUND_READY_WINDOWS : MAX_STEREO_READY_WINDOWS;
            maxPooledBuffers = channels > 8
                    ? MAX_LARGE_SURROUND_POOLED_BUFFERS
                    : (channels > STEREO_CHANNELS ? MAX_SURROUND_POOLED_BUFFERS : MAX_STEREO_POOLED_BUFFERS);
            bufferPool = new ArrayDeque<>(maxPooledBuffers);
            readyQueue = new ArrayDeque<>(maxReadyWindows + 1);
            input = obtainBuffer();
            floatPcm = encoding == PCM_FLOAT;
            bytesPerSample = floatPcm ? Float.BYTES : Short.BYTES;
            output = ByteBuffer.allocateDirect(OUTPUT_FRAMES * channels * bytesPerSample)
                    .order(ByteOrder.LITTLE_ENDIAN);
        }

        private float[] obtainBuffer() {
            synchronized (poolLock) {
                float[] recycled = bufferPool.pollFirst();
                return recycled != null ? recycled : new float[windowSamples];
            }
        }

        private void recycleWindow(Window window) {
            if (window == null || !window.workerDone) return;
            synchronized (poolLock) {
                recycleArrayLocked(window.original);
                recycleArrayLocked(window.vocals);
            }
        }

        private void recycleArrayLocked(float[] array) {
            if (array != null && array.length == windowSamples && bufferPool.size() < maxPooledBuffers) {
                bufferPool.offerFirst(array);
            }
        }

        ByteBuffer feed(ByteBuffer source) {
            if (inputEnded) return drain();
            int consumedFrames = 0;
            while (source.hasRemaining()) {
                promote();
                scheduleFullWindow();
                int frames = consume(source);
                if (frames == 0) break;
                consumedFrames += frames;
                scheduleFullWindow();
            }
            promote();
            if (ready != null && consumedFrames > 0) {
                addOutputBudget(consumedFrames);
            }
            return drain();
        }

        private void addOutputBudget(int consumedFrames) {
            int divisor = SingBackendPolicy.outputPacingDivisor(
                    readyQueue.size(), maxReadyWindows, pendingTask != null);
            int total = consumedFrames + leadDrainRemainder;
            int delta = total / divisor;
            leadDrainRemainder = total % divisor;
            if (delta == 0 && outputBudgetFrames == 0) {
                delta = 1;
            }
            outputBudgetFrames = Math.min(stepFrames, outputBudgetFrames + delta);
        }

        ByteBuffer drain() {
            promote();
            if (inputEnded) {
                scheduleRemaining();
                promote();
            }
            if (ready == null) {
                outputBudgetFrames = 0;
                leadDrainRemainder = 0;
                return EMPTY;
            }
            boolean allowFreeDrain = inputEnded || inputFrames >= windowFrames;
            int maxFrames = allowFreeDrain ? OUTPUT_FRAMES : Math.min(OUTPUT_FRAMES, outputBudgetFrames);
            if (maxFrames <= 0) return EMPTY;

            output.clear();
            int startFrame = outputFrame;
            render(output, Math.min(outputEnd, outputFrame + maxFrames), mix / 100f);
            int rendered = outputFrame - startFrame;
            if (allowFreeDrain) {
                outputBudgetFrames = 0;
            } else {
                outputBudgetFrames = Math.max(0, outputBudgetFrames - rendered);
            }
            hasStartedOutput = true;
            if (previous != null && outputFrame >= overlapFrames) {
                recycleWindow(previous);
                previous = null;
            }
            if (outputFrame == outputEnd) {
                recycleWindow(previous);
                previous = ready;
                ready = null;
                promote();
                scheduleFullWindow();
            }
            output.flip();
            return output;
        }

        private int consume(ByteBuffer source) {
            int frames = Math.min(windowFrames - inputFrames,
                    source.remaining() / (bytesPerSample * channels));
            if (frames == 0) return 0;

            ByteOrder order = source.order();
            source.order(ByteOrder.LITTLE_ENDIAN);
            try {
                int first = inputFrames * channels;
                int limit = first + frames * channels;
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
            return frames;
        }

        private void scheduleFullWindow() {
            if (inputFrames < windowFrames || pendingTask != null || readyQueue.size() >= maxReadyWindows) {
                return;
            }
            float[] full = input;
            input = obtainBuffer();
            System.arraycopy(full, stepFrames * channels, input, 0, overlapFrames * channels);
            inputFrames = overlapFrames;
            submit(full, stepFrames);
            hasFullWindow = true;
        }

        private void scheduleRemaining() {
            if (pendingTask != null || inputFrames == 0) return;
            if (hasFullWindow && inputFrames == overlapFrames && previous != null) {
                if (ready != null || !readyQueue.isEmpty() || pendingWindow != null) return;
                ready = previous;
                previous = null;
                outputFrame = stepFrames;
                outputEnd = windowFrames;
            } else {
                submit(input, inputFrames);
            }
            input = null;
            inputFrames = 0;
        }

        private void submit(float[] pcm, int frames) {
            Window window = new Window(pcm, frames, SystemClock.elapsedRealtime());
            pendingWindow = window;
            pendingTask = WORKER.submit(() -> separate(window));
        }

        private void separate(Window window) {
            try {
                if (inferenceFailed
                        || SingBackendPolicy.shouldSkipIdleInference(
                                mix, mixZeroSinceElapsedMs, SystemClock.elapsedRealtime())) {
                    return;
                }
                long startMs = SystemClock.elapsedRealtime();
                float[] vocals = obtainBuffer();
                if (channels == STEREO_CHANNELS) {
                    separateStereo(window.original, vocals);
                } else if (channels == 1) {
                    separateMono(window.original, vocals);
                } else {
                    separateMultichannel(window.original, vocals);
                }
                // Publish vocals with volatile store so an early-promoted window smoothly ramps in.
                window.vocals = vocals;
                if (!loggedFirstWindow) {
                    loggedFirstWindow = true;
                    long elapsedMs = SystemClock.elapsedRealtime() - startMs;
                    String detail = channels > STEREO_CHANNELS
                            ? channels + "ch (audible=" + lastAudibleChannelCount + "), rate=" + sampleRate + " Hz"
                            : channels + "ch, rate=" + sampleRate + " Hz";
                    Log.i(TAG, "First vocal window ready in " + elapsedMs + "ms (" + detail + ")");
                }
            } catch (Exception | LinkageError failure) {
                inferenceFailed = true;
                Log.w(TAG, "Vocal separation failed for this stream", failure);
            } finally {
                window.workerDone = true;
            }
        }

        private void ensureResamplers() {
            if (sampleRate != MODEL_RATE && toModel == null) {
                toModel = new StereoResampler(sampleRate, MODEL_RATE);
                toSource = new StereoResampler(MODEL_RATE, sampleRate);
                modelInput = new float[WINDOW_FRAMES * STEREO_CHANNELS];
                modelVocals = new float[modelInput.length];
            }
        }

        private void separateStereo(float[] pcm, float[] vocals) throws Exception {
            if (sampleRate == MODEL_RATE) {
                model.separate(pcm, vocals);
            } else {
                ensureResamplers();
                toModel.resample(pcm, modelInput);
                model.separate(modelInput, modelVocals);
                toSource.resample(modelVocals, vocals);
            }
        }

        private void separateMono(float[] pcm, float[] vocals) throws Exception {
            if (stereoSourceScratch == null) {
                stereoSourceScratch = new float[windowFrames * STEREO_CHANNELS];
                stereoOutScratch = new float[stereoSourceScratch.length];
            }
            MultichannelMixer.expandMonoToStereo(pcm, windowFrames, stereoSourceScratch);
            separateStereo(stereoSourceScratch, stereoOutScratch);
            MultichannelMixer.foldStereoToMono(stereoOutScratch, windowFrames, vocals);
        }

        private void separateMultichannel(float[] pcm, float[] vocals) throws Exception {
            if (stereoSourceScratch == null) {
                stereoSourceScratch = new float[windowFrames * STEREO_CHANNELS];
                stereoOutScratch = new float[stereoSourceScratch.length];
                channelSpectrum = new MdxSpectrum();
                mixSpec = new float[MdxSpectrum.TENSOR_SIZE];
                vocalSpec = new float[MdxSpectrum.TENSOR_SIZE];
                int planeSize = MdxSpectrum.BINS * MdxSpectrum.TIME_STEPS;
                maskL = new float[planeSize];
                maskR = new float[planeSize];
                maskC = new float[planeSize];
                activeChannels = MultichannelMixer.activeChannels(channels);
                audibleChannels = new int[activeChannels.length];
            }
            ensureResamplers();

            Arrays.fill(vocals, 0f);
            int audibleCount = MultichannelMixer.collectNonSilentChannels(
                    pcm, channels, windowFrames, activeChannels, audibleChannels);
            lastAudibleChannelCount = audibleCount;
            if (audibleCount == 0) {
                return;
            }

            // 1. Single MDX-Net pass on the ITU/Dolby stereo downmix to derive per-bin Wiener masks.
            MultichannelMixer.downmixToStereo(pcm, channels, windowFrames, stereoSourceScratch);
            float[] stereo44k;
            if (sampleRate == MODEL_RATE) {
                stereo44k = stereoSourceScratch;
            } else {
                toModel.resample(stereoSourceScratch, modelInput);
                stereo44k = modelInput;
            }
            model.separateSpectrum(stereo44k, mixSpec, vocalSpec);
            MultichannelMixer.computeWienerMasks(mixSpec, vocalSpec, maskL, maskR, maskC);

            // 2. Apply masks to every audible non-LFE channel pair, preserving 3D Atmos phase & LFE bass.
            float[] pair44k = sampleRate == MODEL_RATE ? stereoSourceScratch : modelInput;
            float[] pairVoc44k = sampleRate == MODEL_RATE ? stereoOutScratch : modelVocals;
            for (int i = 0; i < audibleCount; i += 2) {
                int chA = audibleChannels[i];
                int chB = (i + 1 < audibleCount) ? audibleChannels[i + 1] : -1;
                MultichannelMixer.extractPair(pcm, channels, windowFrames, chA, chB, stereoSourceScratch);
                if (sampleRate != MODEL_RATE) {
                    toModel.resample(stereoSourceScratch, pair44k);
                }
                channelSpectrum.forward(pair44k, mixSpec);
                float[] maskA = maskForRole(MultichannelMixer.channelRole(channels, chA));
                float[] maskB = chB >= 0 ? maskForRole(MultichannelMixer.channelRole(channels, chB)) : null;
                MultichannelMixer.applyPairMasks(mixSpec, maskA, maskB);
                channelSpectrum.inverseUnity(mixSpec, pairVoc44k);
                if (sampleRate != MODEL_RATE) {
                    toSource.resample(pairVoc44k, stereoOutScratch);
                }
                MultichannelMixer.scatterPair(stereoOutScratch, vocals, channels, windowFrames, chA, chB);
            }
        }

        private float[] maskForRole(int role) {
            return switch (role) {
                case MultichannelMixer.ROLE_LEFT -> maskL;
                case MultichannelMixer.ROLE_RIGHT -> maskR;
                default -> maskC;
            };
        }

        private void promote() {
            if (pendingTask != null && pendingTask.isDone()) {
                pendingTask = null;
                if (pendingWindow != null) {
                    readyQueue.offerLast(pendingWindow);
                    pendingWindow = null;
                }
            }
            if (ready != null) return;

            Window next = readyQueue.pollFirst();
            if (next != null) {
                ready = next;
                outputFrame = 0;
                outputEnd = next.frames;
                return;
            }

            // Never starve AudioTrack if inference lags or on startup: play original PCM seamlessly
            // and crossfade vocals in as soon as the worker publishes window.vocals.
            if (pendingWindow != null) {
                long waitedMs = SystemClock.elapsedRealtime() - pendingWindow.submittedAtMs;
                if (hasStartedOutput || waitedMs >= STARTUP_WAIT_MS) {
                    if (hasStartedOutput && pendingWindow.vocals == null) {
                        deadlineMissCount++;
                        if (deadlineMissCount == 1 || deadlineMissCount % 10 == 0) {
                            Log.w(TAG, "Vocal window missed deadline #" + deadlineMissCount
                                    + " (waited=" + waitedMs + "ms, " + channels + "ch @ " + sampleRate + " Hz)");
                        }
                    }
                    ready = pendingWindow;
                    pendingWindow = null;
                    outputFrame = 0;
                    outputEnd = ready.frames;
                }
            }
        }

        void cancel() {
            if (pendingTask != null) pendingTask.cancel(false);
            pendingTask = null;
            pendingWindow = null;
            readyQueue.clear();
            outputBudgetFrames = 0;
            leadDrainRemainder = 0;
            synchronized (poolLock) {
                bufferPool.clear();
            }
        }

        private void render(ByteBuffer destination, int limit, float level) {
            float[] readyOriginal = ready.original;
            float[] readyVocals = ready.vocals;
            float targetMix = readyVocals == null ? 0f : level;
            Window prev = previous;
            float[] prevOriginal = prev != null ? prev.original : null;
            float[] prevVocals = prev != null ? prev.vocals : null;

            int ramp = Math.min(rampFrames, limit - outputFrame);
            float increment = ramp == 0 ? 0f : (targetMix - currentMix) / ramp;
            int rampEnd = outputFrame + ramp;
            int prevOffset = stepFrames * channels;
            while (outputFrame < limit) {
                currentMix = outputFrame < rampEnd ? currentMix + increment : targetMix;
                float crossfade = prevOriginal == null || outputFrame >= overlapFrames
                        ? 1f : outputFrame / (float) overlapFrames;
                int sample = outputFrame * channels;
                for (int channel = 0; channel < channels; channel++) {
                    int index = sample + channel;
                    float value = mixSample(readyOriginal[index], readyVocals, index, currentMix);
                    if (crossfade < 1f) {
                        int prevIndex = prevOffset + index;
                        float retained = mixSample(prevOriginal[prevIndex], prevVocals, prevIndex, currentMix);
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
            currentMix = targetMix;
        }

        private static float mixSample(float input, float[] vocals, int index, float level) {
            if (vocals == null || level == 0f) return input;
            float voice = vocals[index];
            return level < 0f ? input + level * voice : input + level * (voice - input);
        }
    }

    private static final class Window {
        final float[] original;
        final int frames;
        final long submittedAtMs;
        volatile float[] vocals;
        volatile boolean workerDone;

        Window(float[] original, int frames, long submittedAtMs) {
            this.original = original;
            this.frames = frames;
            this.submittedAtMs = submittedAtMs;
        }
    }
}
