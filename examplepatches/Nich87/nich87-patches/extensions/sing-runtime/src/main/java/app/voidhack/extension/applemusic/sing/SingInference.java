package app.voidhack.extension.applemusic.sing;

import ai.onnxruntime.NodeInfo;
import ai.onnxruntime.OnnxJavaType;
import ai.onnxruntime.OnnxTensor;
import ai.onnxruntime.OrtEnvironment;
import ai.onnxruntime.OrtException;
import ai.onnxruntime.OrtProvider;
import ai.onnxruntime.OrtSession;
import ai.onnxruntime.TensorInfo;
import ai.onnxruntime.providers.NNAPIFlags;
import android.content.Context;
import android.os.Build;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;

import app.voidhack.extension.applemusic.sing.SingBackendPolicy.Backend;
import app.voidhack.extension.applemusic.sing.SingBackendPolicy.CacheState;
import app.voidhack.extension.applemusic.sing.SingBackendPolicy.FidelityMetrics;
import app.voidhack.extension.applemusic.sing.SingBackendPolicy.ProbeResult;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.net.ssl.HttpsURLConnection;

final class SingInference implements AutoCloseable {
    private static final String TAG = "VoidhackSing";
    private static final String MODEL_NAME = "UVR_MDXNET_1_9703.onnx";
    private static final String MODEL_URL = "https://huggingface.co/Francasio/sing-android-weights-db/resolve/"
        + "988da1f91b7941690aefa892c44cb4ffe5af8f8c/" + MODEL_NAME;
    private static final String MODEL_SHA256 = "e02220e80d8253f4c2209f8924298b2b686bbdf2868b788ff5500fb9bd94aadc";
    private static final int MODEL_BYTES = 29_704_436;
    private static final int MAX_REDIRECTS = 5;
    private static final long[] SHAPE = {1, 4, MdxSpectrum.BINS, MdxSpectrum.TIME_STEPS};
    private static final String CACHE_FILE_NAME = "backend-v1.properties";

    private final OrtEnvironment environment;
    private final File modelFile;
    private final File cacheFile;
    private final CacheState cacheState;
    private final int availableProcessors;
    private final MdxSpectrum spectrum = new MdxSpectrum();
    private final float[] features = new float[MdxSpectrum.TENSOR_SIZE];
    private final FloatBuffer inputBuffer = allocateTensorBuffer();
    private final FloatBuffer outputBuffer = allocateTensorBuffer();
    private final OnnxTensor input;
    private final OnnxTensor output;

    private OrtSession session;
    private Backend activeBackend;
    private Map<String, OnnxTensor> inputs;
    private Map<String, OnnxTensor> outputs;
    private boolean closed;

    private SingInference(
            OrtEnvironment environment,
            File modelFile,
            File cacheFile,
            CacheState cacheState,
            int availableProcessors,
            Backend activeBackend,
            OrtSession session) throws IOException, OrtException {
        this.environment = environment;
        this.modelFile = modelFile;
        this.cacheFile = cacheFile;
        this.cacheState = cacheState;
        this.availableProcessors = availableProcessors;
        this.activeBackend = activeBackend;
        this.session = session;

        String inputName = tensorName(session.getInputInfo());
        String outputName = tensorName(session.getOutputInfo());
        input = OnnxTensor.createTensor(environment, inputBuffer, SHAPE);
        try {
            output = OnnxTensor.createTensor(environment, outputBuffer, SHAPE);
        } catch (OrtException | RuntimeException exception) {
            input.close();
            throw exception;
        }
        inputs = Collections.singletonMap(inputName, input);
        outputs = Collections.singletonMap(outputName, output);
    }

    static SingInference open(Context context) throws IOException, NoSuchAlgorithmException, OrtException {
        File directory = ensureDataDirectory(context);
        File model = getVerifiedModel(directory);
        return open(directory, model);
    }

    static SingInference open(File dataDirectory, File model) throws IOException, OrtException {
        OrtEnvironment environment = OrtEnvironment.getEnvironment();
        int cores = Math.max(1, Runtime.getRuntime().availableProcessors());
        File cacheFile = new File(dataDirectory, CACHE_FILE_NAME);
        String envKey = buildEnvKey(environment);
        CacheState state = loadCacheState(cacheFile, envKey);
        if (state.recoveredFromCrash) {
            Log.w(TAG, "Recovered from previous hardware accelerator crash; blocked=" + state.blocked);
            saveCacheState(cacheFile, state);
        }

        if (state.selected != null) {
            try {
                SingInference cached = openBackendSession(
                        environment, model, cacheFile, state, cores, state.selected);
                Log.i(TAG, "Opened cached vocal separation backend: " + state.selected.id());
                return cached;
            } catch (Exception | LinkageError failure) {
                Log.w(TAG, "Cached vocal backend " + state.selected.id() + " failed to open; recalibrating", failure);
                state.block(state.selected);
                saveCacheState(cacheFile, state);
            }
        }

        return calibrateAndOpen(environment, model, cacheFile, state, cores);
    }

    Backend activeBackend() {
        return activeBackend;
    }

    synchronized void separate(float[] stereoPcm, float[] vocals) throws IOException, OrtException {
        if (closed) {
            throw new IllegalStateException("Vocal separation session is closed");
        }
        spectrum.forward(stereoPcm, features);
        try {
            runAndValidate(vocals);
        } catch (IOException | OrtException | RuntimeException failure) {
            if (!activeBackend.isHardwareAccelerator()) {
                throw failure;
            }
            boolean nonFinite = failure instanceof NonFiniteOutputException;
            Log.w(TAG, "Hardware vocal backend " + activeBackend.id()
                    + " failed during inference; falling back to CPU", failure);
            fallbackToCpu(nonFinite);
            spectrum.forward(stereoPcm, features);
            runAndValidate(vocals);
        }
    }

    /**
     * Runs one MDX-Net inference pass and returns both the input STFT and the estimated vocal STFT
     * so multichannel surround/Atmos streams can mask every channel without extra neural passes.
     */
    synchronized void separateSpectrum(float[] stereoPcm, float[] mixSpecOut, float[] vocalSpecOut)
            throws IOException, OrtException {
        if (closed) {
            throw new IllegalStateException("Vocal separation session is closed");
        }
        spectrum.forward(stereoPcm, mixSpecOut);
        try {
            runSpectrumAndValidate(mixSpecOut, vocalSpecOut);
        } catch (IOException | OrtException | RuntimeException failure) {
            if (!activeBackend.isHardwareAccelerator()) {
                throw failure;
            }
            boolean nonFinite = failure instanceof NonFiniteOutputException;
            Log.w(TAG, "Hardware vocal backend " + activeBackend.id()
                    + " failed during multichannel inference; falling back to CPU", failure);
            fallbackToCpu(nonFinite);
            runSpectrumAndValidate(mixSpecOut, vocalSpecOut);
        }
    }

    private void runSpectrumAndValidate(float[] mixSpec, float[] vocalSpecOut) throws IOException, OrtException {
        inputBuffer.position(0);
        inputBuffer.put(mixSpec);
        try (OrtSession.Result result = session.run(inputs, outputs)) {
            if (result.size() != 1) {
                throw new IOException("Unexpected vocal model output");
            }
            outputBuffer.position(0);
            outputBuffer.get(vocalSpecOut);
        }
        for (float value : vocalSpecOut) {
            if (Float.isNaN(value) || Float.isInfinite(value)) {
                throw new NonFiniteOutputException("Vocal model produced a non-finite spectral bin");
            }
        }
    }

    private void runAndValidate(float[] vocals) throws IOException, OrtException {
        inputBuffer.position(0);
        inputBuffer.put(features);
        try (OrtSession.Result result = session.run(inputs, outputs)) {
            if (result.size() != 1) {
                throw new IOException("Unexpected vocal model output");
            }
            outputBuffer.position(0);
            outputBuffer.get(features);
        }
        spectrum.inverse(features, vocals);
        for (float sample : vocals) {
            if (Float.isNaN(sample) || Float.isInfinite(sample)) {
                throw new NonFiniteOutputException("Vocal model produced a non-finite sample");
            }
        }
    }

    private void fallbackToCpu(boolean immediateBlock) throws IOException, OrtException {
        Backend failed = activeBackend;
        cacheState.recordRuntimeFailure(failed, immediateBlock);
        Backend fallback = SingBackendPolicy.defaultCpuFallback(availableProcessors);
        cacheState.selected = fallback;
        saveCacheState(cacheFile, cacheState);

        OrtSession replacement = createSessionForBackend(environment, modelFile, fallback, availableProcessors);
        String inputName;
        String outputName;
        try {
            inputName = tensorName(replacement.getInputInfo());
            outputName = tensorName(replacement.getOutputInfo());
        } catch (IOException | OrtException | RuntimeException exception) {
            closeQuietly(replacement);
            throw exception;
        }
        closeQuietly(session);
        session = replacement;
        activeBackend = fallback;
        inputs = Collections.singletonMap(inputName, input);
        outputs = Collections.singletonMap(outputName, output);
        Log.i(TAG, "Switched vocal separation backend to " + fallback.id());
    }

    @Override
    public synchronized void close() {
        if (closed) return;
        closed = true;
        output.close();
        input.close();
        closeQuietly(session);
    }

    private static SingInference openBackendSession(
            OrtEnvironment environment,
            File model,
            File cacheFile,
            CacheState state,
            int cores,
            Backend backend) throws IOException, OrtException {
        if (backend.isHardwareAccelerator()) {
            state.markPending(backend);
            saveCacheState(cacheFile, state);
        }
        OrtSession session = null;
        try {
            session = createSessionForBackend(environment, model, backend, cores);
            SingInference instance = new SingInference(
                    environment, model, cacheFile, state, cores, backend, session);
            if (backend.isHardwareAccelerator()) {
                state.clearPending();
                saveCacheState(cacheFile, state);
            }
            return instance;
        } catch (IOException | OrtException | RuntimeException | LinkageError failure) {
            closeQuietly(session);
            if (backend.isHardwareAccelerator()) {
                state.clearPending();
                saveCacheState(cacheFile, state);
            }
            throw failure;
        }
    }

    private static SingInference calibrateAndOpen(
            OrtEnvironment environment,
            File model,
            File cacheFile,
            CacheState state,
            int cores) throws IOException, OrtException {
        float[] probeInput = SingBackendPolicy.createCalibrationTensor(MdxSpectrum.BINS, MdxSpectrum.TIME_STEPS);
        float[] referenceOutput = new float[MdxSpectrum.TENSOR_SIZE];
        float[] candidateOutput = new float[MdxSpectrum.TENSOR_SIZE];
        FloatBuffer inBuf = allocateTensorBuffer();
        FloatBuffer outBuf = allocateTensorBuffer();
        inBuf.put(probeInput).position(0);

        List<ProbeResult> results = new ArrayList<>();
        try (OnnxTensor inTensor = OnnxTensor.createTensor(environment, inBuf, SHAPE);
             OnnxTensor outTensor = OnnxTensor.createTensor(environment, outBuf, SHAPE)) {

            Backend primaryCpu = SingBackendPolicy.defaultCpuFallback(cores);
            ProbeResult primaryCpuResult = probeCpuBaseline(
                    environment, model, cores, primaryCpu, inTensor, outTensor, outBuf, referenceOutput);
            results.add(primaryCpuResult);
            logProbeResult(primaryCpuResult);

            ProbeResult fastCpuResult = null;
            if (primaryCpu == Backend.CPU_LOW_LOAD
                    && (!primaryCpuResult.succeeded()
                            || primaryCpuResult.wallMs > SingBackendPolicy.SMOOTH_WALL_BUDGET_MS)) {
                checkInterrupted();
                fastCpuResult = probeBackend(
                        environment, model, cacheFile, state, cores, Backend.CPU_FAST,
                        inTensor, outTensor, outBuf, referenceOutput, candidateOutput, false);
                results.add(fastCpuResult);
                logProbeResult(fastCpuResult);
            }

            ProbeResult bestCpu = primaryCpu == Backend.CPU_LOW_LOAD
                    ? SingBackendPolicy.selectBestCpu(primaryCpuResult, fastCpuResult)
                    : SingBackendPolicy.selectBestCpu(null, primaryCpuResult);
            if (!SingBackendPolicy.shouldProbeHardwareAccelerators(bestCpu)) {
                Log.i(TAG, "CPU backend " + bestCpu.backend.id() + " meets real-time budget ("
                        + bestCpu.wallMs + "ms); skipping GPU/NNAPI probes to avoid system UI contention");
            } else {
                EnumSet<OrtProvider> providers = OrtEnvironment.getAvailableProviders();
                List<Backend> hardwareCandidates = SingBackendPolicy.hardwareCandidatesForSdk(
                        Build.VERSION.SDK_INT,
                        providers.contains(OrtProvider.NNAPI),
                        providers.contains(OrtProvider.WEBGPU));
                for (Backend hardware : hardwareCandidates) {
                    if (state.isBlocked(hardware)) {
                        Log.i(TAG, "Skipping blocked vocal backend " + hardware.id());
                        continue;
                    }
                    checkInterrupted();
                    ProbeResult hwResult = probeBackend(
                            environment, model, cacheFile, state, cores, hardware,
                            inTensor, outTensor, outBuf, referenceOutput, candidateOutput, true);
                    results.add(hwResult);
                    logProbeResult(hwResult);
                }
            }
        }

        Backend winner = SingBackendPolicy.chooseWinner(results);
        state.selected = winner;
        state.clearPending();
        saveCacheState(cacheFile, state);
        Log.i(TAG, "Selected vocal separation backend: " + winner.id());

        try {
            return openBackendSession(environment, model, cacheFile, state, cores, winner);
        } catch (Exception | LinkageError failure) {
            if (!winner.isHardwareAccelerator()) {
                throw failure;
            }
            Log.w(TAG, "Opening selected backend " + winner.id() + " failed; falling back to CPU", failure);
            state.block(winner);
            Backend fallback = SingBackendPolicy.defaultCpuFallback(cores);
            state.selected = fallback;
            saveCacheState(cacheFile, state);
            return openBackendSession(environment, model, cacheFile, state, cores, fallback);
        }
    }

    private static ProbeResult probeCpuBaseline(
            OrtEnvironment environment,
            File model,
            int cores,
            Backend backend,
            OnnxTensor inTensor,
            OnnxTensor outTensor,
            FloatBuffer outBuf,
            float[] referenceOutput) throws IOException, OrtException {
        long openStart = SystemClock.elapsedRealtime();
        try (OrtSession session = createSessionForBackend(environment, model, backend, cores)) {
            long openMs = SystemClock.elapsedRealtime() - openStart;
            String inputName = tensorName(session.getInputInfo());
            String outputName = tensorName(session.getOutputInfo());
            Map<String, OnnxTensor> ins = Collections.singletonMap(inputName, inTensor);
            Map<String, OnnxTensor> outs = Collections.singletonMap(outputName, outTensor);

            long wallStart = SystemClock.elapsedRealtime();
            long cpuStart = Process.getElapsedCpuTime();
            try (OrtSession.Result ignored = session.run(ins, outs)) {
                outBuf.position(0);
                outBuf.get(referenceOutput);
            }
            long wallMs = SystemClock.elapsedRealtime() - wallStart;
            long cpuMs = Math.max(0L, Process.getElapsedCpuTime() - cpuStart);
            FidelityMetrics selfCheck = SingBackendPolicy.compareOutputs(referenceOutput, referenceOutput);
            if (!selfCheck.isAcceptable()) {
                return ProbeResult.failure(backend, "baseline fidelity failed: " + selfCheck);
            }
            return ProbeResult.success(backend, openMs, wallMs, wallMs, cpuMs, selfCheck);
        }
    }

    private static ProbeResult probeBackend(
            OrtEnvironment environment,
            File model,
            File cacheFile,
            CacheState state,
            int cores,
            Backend backend,
            OnnxTensor inTensor,
            OnnxTensor outTensor,
            FloatBuffer outBuf,
            float[] referenceOutput,
            float[] candidateOutput,
            boolean twoRuns) {
        if (backend.isHardwareAccelerator()) {
            state.markPending(backend);
            saveCacheState(cacheFile, state);
        }
        try {
            long openStart = SystemClock.elapsedRealtime();
            try (OrtSession session = createSessionForBackend(environment, model, backend, cores)) {
                long openMs = SystemClock.elapsedRealtime() - openStart;
                String inputName = tensorName(session.getInputInfo());
                String outputName = tensorName(session.getOutputInfo());
                Map<String, OnnxTensor> ins = Collections.singletonMap(inputName, inTensor);
                Map<String, OnnxTensor> outs = Collections.singletonMap(outputName, outTensor);

                long warmStart = SystemClock.elapsedRealtime();
                long warmCpuStart = Process.getElapsedCpuTime();
                try (OrtSession.Result ignored = session.run(ins, outs)) {
                    outBuf.position(0);
                    outBuf.get(candidateOutput);
                }
                long warmupWallMs = SystemClock.elapsedRealtime() - warmStart;
                long warmupCpuMs = Math.max(0L, Process.getElapsedCpuTime() - warmCpuStart);

                FidelityMetrics fidelity = SingBackendPolicy.compareOutputs(referenceOutput, candidateOutput);
                if (!fidelity.isAcceptable()) {
                    return ProbeResult.failure(backend, "fidelity rejected: " + fidelity);
                }
                if (twoRuns && warmupWallMs > SingBackendPolicy.MAX_WARMUP_WALL_MS) {
                    return ProbeResult.failure(backend, "warmup too slow: " + warmupWallMs + "ms");
                }

                long steadyWallMs = warmupWallMs;
                long steadyCpuMs = warmupCpuMs;
                if (twoRuns) {
                    long runStart = SystemClock.elapsedRealtime();
                    long runCpuStart = Process.getElapsedCpuTime();
                    try (OrtSession.Result ignored = session.run(ins, outs)) {
                        outBuf.position(0);
                        outBuf.get(candidateOutput);
                    }
                    steadyWallMs = SystemClock.elapsedRealtime() - runStart;
                    steadyCpuMs = Math.max(0L, Process.getElapsedCpuTime() - runCpuStart);
                    fidelity = SingBackendPolicy.compareOutputs(referenceOutput, candidateOutput);
                    if (!fidelity.isAcceptable()) {
                        return ProbeResult.failure(backend, "steady fidelity rejected: " + fidelity);
                    }
                }
                return ProbeResult.success(backend, openMs, warmupWallMs, steadyWallMs, steadyCpuMs, fidelity);
            }
        } catch (Exception | LinkageError failure) {
            return ProbeResult.failure(backend, failure.getClass().getSimpleName() + ": " + failure.getMessage());
        } finally {
            if (backend.isHardwareAccelerator()) {
                state.clearPending();
                saveCacheState(cacheFile, state);
            }
        }
    }

    private static OrtSession createSessionForBackend(
            OrtEnvironment environment,
            File model,
            Backend backend,
            int cores) throws OrtException {
        try (OrtSession.SessionOptions options = new OrtSession.SessionOptions()) {
            options.setInterOpNumThreads(1);
            options.setOptimizationLevel(OrtSession.SessionOptions.OptLevel.ALL_OPT);
            // Bind the model's symbolic batch dimension so NNAPI and layout passes see static shapes.
            options.setSymbolicDimensionValue("batch_size", 1L);
            // Disable the extra packed memory-pattern block (~521 MiB) while keeping the CPU arena
            // warm for CPU/NNAPI so active windows avoid 500-900 MiB mmap/munmap TLB-shootdown stalls.
            options.setMemoryPatternOptimization(false);
            options.setCPUArenaAllocator(backend != Backend.WEBGPU_GPU);
            options.addConfigEntry("session.intra_op.allow_spinning", "0");
            options.addConfigEntry("session.inter_op.allow_spinning", "0");
            options.addConfigEntry("session.set_denormal_as_zero", "1");

            switch (backend) {
                case NNAPI_NPU -> {
                    options.setIntraOpNumThreads(SingBackendPolicy.nnapiFallbackThreads(cores));
                    options.addNnapi(EnumSet.of(NNAPIFlags.USE_FP16, NNAPIFlags.CPU_DISABLED));
                }
                case WEBGPU_GPU -> {
                    options.setIntraOpNumThreads(1);
                    Map<String, String> webgpu = new HashMap<>();
                    webgpu.put("preferredLayout", "NHWC");
                    webgpu.put("powerPreference", "low-power");
                    // Flush compute batches frequently so SurfaceFlinger/HWUI can preempt the mobile GPU.
                    webgpu.put("maxNumPendingDispatches", "16");
                    options.addWebGPU(webgpu);
                }
                case CPU_LOW_LOAD -> options.setIntraOpNumThreads(SingBackendPolicy.lowLoadCpuThreads(cores));
                case CPU_FAST -> options.setIntraOpNumThreads(SingBackendPolicy.fastCpuThreads(cores));
            }
            return environment.createSession(model.getAbsolutePath(), options);
        }
    }

    private static void logProbeResult(ProbeResult result) {
        if (result.succeeded()) {
            Log.i(TAG, String.format(
                    Locale.US,
                    "Probe %-12s OK: open=%dms warm=%dms wall=%dms cpu=%dms %s",
                    result.backend.id(),
                    result.openMs,
                    result.warmupWallMs,
                    result.wallMs,
                    result.cpuMs,
                    result.fidelity));
        } else {
            Log.i(TAG, "Probe " + result.backend.id() + " skipped/rejected: " + result.failureReason);
        }
    }

    private static String buildEnvKey(OrtEnvironment environment) {
        String fingerprint = Build.FINGERPRINT != null ? Build.FINGERPRINT : "unknown";
        String ortVersion = environment.getVersion();
        return fingerprint + "|" + MODEL_SHA256 + "|" + ortVersion + "|v" + SingBackendPolicy.POLICY_VERSION;
    }

    private static CacheState loadCacheState(File cacheFile, String expectedEnvKey) {
        if (!cacheFile.isFile()) {
            return CacheState.fresh(expectedEnvKey);
        }
        Properties properties = new Properties();
        try (InputStream input = new FileInputStream(cacheFile)) {
            properties.load(input);
            return CacheState.load(properties, expectedEnvKey);
        } catch (IOException exception) {
            Log.w(TAG, "Could not read vocal backend cache; starting fresh", exception);
            return CacheState.fresh(expectedEnvKey);
        }
    }

    private static void saveCacheState(File cacheFile, CacheState state) {
        File parent = cacheFile.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs() && !parent.isDirectory()) {
            return;
        }
        File temp = new File(parent, CACHE_FILE_NAME + ".tmp");
        try (FileOutputStream output = new FileOutputStream(temp)) {
            state.toProperties().store(output, "Voidhack Sing backend state");
            output.flush();
            output.getFD().sync();
            if (!temp.renameTo(cacheFile)) {
                try (FileOutputStream direct = new FileOutputStream(cacheFile)) {
                    state.toProperties().store(direct, "Voidhack Sing backend state");
                    direct.flush();
                    direct.getFD().sync();
                }
            }
        } catch (IOException exception) {
            Log.w(TAG, "Could not persist vocal backend cache", exception);
        } finally {
            if (temp.exists() && !temp.delete()) {
                Log.w(TAG, "Could not clean temporary vocal backend cache");
            }
        }
    }

    private static void checkInterrupted() throws InterruptedIOException {
        if (Thread.currentThread().isInterrupted()) {
            throw new InterruptedIOException("Vocal model calibration was interrupted");
        }
    }

    private static void closeQuietly(OrtSession target) {
        if (target == null) return;
        try {
            target.close();
        } catch (OrtException exception) {
            Log.w(TAG, "Could not close the vocal separation session", exception);
        }
    }

    private static FloatBuffer allocateTensorBuffer() {
        return ByteBuffer.allocateDirect(MdxSpectrum.TENSOR_SIZE * Float.BYTES)
            .order(ByteOrder.nativeOrder())
            .asFloatBuffer();
    }

    private static String tensorName(Map<String, NodeInfo> tensors) throws IOException {
        if (tensors.size() != 1) {
            throw new IOException("Expected a single tensor in the vocal model");
        }
        Map.Entry<String, NodeInfo> entry = tensors.entrySet().iterator().next();
        if (!(entry.getValue().getInfo() instanceof TensorInfo info) || info.type != OnnxJavaType.FLOAT) {
            throw new IOException("Expected a float tensor in the vocal model");
        }
        long[] actualShape = info.getShape();
        if (actualShape.length != SHAPE.length) {
            throw new IOException("Unexpected vocal model tensor rank");
        }
        for (int axis = 0; axis < SHAPE.length; axis++) {
            if (axis == 0 && actualShape[axis] == -1) continue;
            if (actualShape[axis] != SHAPE[axis]) {
                throw new IOException("Unexpected vocal model tensor shape");
            }
        }
        return entry.getKey();
    }

    private static File ensureDataDirectory(Context context) throws IOException {
        File directory = new File(context.getNoBackupFilesDir(), "voidhack-sing");
        if (!directory.isDirectory() && !directory.mkdirs() && !directory.isDirectory()) {
            throw new IOException("Could not create vocal model directory");
        }
        return directory;
    }

    private static File getVerifiedModel(File directory) throws IOException, NoSuchAlgorithmException {
        File model = new File(directory, MODEL_NAME);
        if (model.length() == MODEL_BYTES) {
            try (InputStream input = new FileInputStream(model)) {
                if (verifyModel(input, null)) return model;
            } catch (InterruptedIOException exception) {
                throw exception;
            } catch (IOException exception) {
                Log.w(TAG, "Could not read the cached vocal model", exception);
            }
        }

        File temporary = File.createTempFile("model-", ".download", directory);
        try {
            downloadModel(temporary);
            if (!temporary.renameTo(model)) {
                throw new IOException("Could not install the vocal model");
            }
            return model;
        } finally {
            if (temporary.exists() && !temporary.delete()) {
                Log.w(TAG, "Could not remove the temporary vocal model");
            }
        }
    }

    private static void downloadModel(File temporary) throws IOException, NoSuchAlgorithmException {
        URL url = new URL(MODEL_URL);
        for (int redirects = 0; redirects <= MAX_REDIRECTS; redirects++) {
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("Accept-Encoding", "identity");
            try {
                int response = connection.getResponseCode();
                if (response == HttpsURLConnection.HTTP_OK) {
                    try (InputStream input = connection.getInputStream();
                         FileOutputStream output = new FileOutputStream(temporary)) {
                        if (!verifyModel(input, output)) {
                            throw new IOException("Vocal model failed size or SHA-256 verification");
                        }
                        output.getFD().sync();
                        return;
                    }
                }
                if (response != 301 && response != 302 && response != 303 && response != 307 && response != 308) {
                    throw new IOException("Vocal model download failed with HTTP " + response);
                }
                String location = connection.getHeaderField("Location");
                if (location == null) throw new IOException("Missing vocal model redirect location");
                url = new URL(url, location);
                String host = url.getHost();
                if (!"https".equals(url.getProtocol()) || url.getUserInfo() != null
                    || !(host.equals("huggingface.co") || host.endsWith(".hf.co"))) {
                    throw new IOException("Unexpected vocal model redirect");
                }
            } finally {
                connection.disconnect();
            }
        }
        throw new IOException("Too many vocal model redirects");
    }

    private static boolean verifyModel(InputStream input, FileOutputStream copy)
        throws IOException, NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] buffer = new byte[64 * 1024];
        int bytes = 0;
        int count;
        while ((count = input.read(buffer)) != -1) {
            if (Thread.currentThread().isInterrupted()) {
                throw new InterruptedIOException("Vocal model preparation was interrupted");
            }
            bytes += count;
            if (bytes > MODEL_BYTES) return false;
            digest.update(buffer, 0, count);
            if (copy != null) copy.write(buffer, 0, count);
        }
        StringBuilder hex = new StringBuilder(64);
        for (byte value : digest.digest()) {
            hex.append(Character.forDigit((value & 0xff) >>> 4, 16));
            hex.append(Character.forDigit(value & 0x0f, 16));
        }
        return bytes == MODEL_BYTES && MODEL_SHA256.contentEquals(hex);
    }

    private static final class NonFiniteOutputException extends IOException {
        NonFiniteOutputException(String message) {
            super(message);
        }
    }
}
