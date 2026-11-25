package app.voidhack.extension.applemusic.sing;

import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

/**
 * Pure-Java backend selection, numerical fidelity checks, and crash-safe cache state
 * for on-device MDX-Net vocal separation.
 */
final class SingBackendPolicy {
    static final int POLICY_VERSION = 3;
    static final long SMOOTH_WALL_BUDGET_MS = 2_000L;
    static final long MAX_CPU_REALTIME_WALL_MS = 2_600L;
    static final long MAX_NNAPI_WALL_MS = 2_400L;
    static final long MAX_WEBGPU_WALL_MS = 1_200L;
    static final long MAX_ACCELERATOR_WALL_MS = MAX_NNAPI_WALL_MS;
    static final long MAX_WARMUP_WALL_MS = 12_000L;
    static final long IDLE_BYPASS_DELAY_MS = 1_500L;
    static final int MAX_RUNTIME_FAILURES = 2;

    static final double MAX_RELATIVE_RMS_ERROR = 0.08;
    static final double MIN_COSINE_SIMILARITY = 0.995;
    static final float MIN_PEAK_TOLERANCE = 0.25f;
    static final float RELATIVE_PEAK_TOLERANCE = 0.20f;

    private static final double ACCELERATOR_CPU_OFFLOAD_RATIO = 0.70;
    private static final double ACCELERATOR_WALL_SPEEDUP_RATIO = 0.75;
    private static final double ACCELERATOR_MAX_CPU_WITH_SPEEDUP = 0.95;
    private static final double ACCELERATOR_MAX_WALL_VS_CPU = 1.35;
    private static final double NPU_SCORE_MULTIPLIER = 0.75;
    private static final double WALL_WEIGHT_IN_SCORE = 0.35;

    private static final String KEY_ENV = "env";
    private static final String KEY_SELECTED = "selected";
    private static final String KEY_PENDING = "pending";
    private static final String KEY_BLOCKED = "blocked";
    private static final String KEY_FAILURES_PREFIX = "failures.";

    private SingBackendPolicy() {}

    enum Backend {
        NNAPI_NPU("nnapi-npu", true),
        WEBGPU_GPU("webgpu-gpu", true),
        CPU_LOW_LOAD("cpu-low-load", false),
        CPU_FAST("cpu-fast", false);

        private final String id;
        private final boolean hardwareAccelerator;

        Backend(String id, boolean hardwareAccelerator) {
            this.id = id;
            this.hardwareAccelerator = hardwareAccelerator;
        }

        String id() {
            return id;
        }

        boolean isHardwareAccelerator() {
            return hardwareAccelerator;
        }

        static Backend fromId(String id) {
            if (id == null || id.isEmpty()) return null;
            for (Backend value : values()) {
                if (value.id.equals(id)) return value;
            }
            return null;
        }
    }

    static final class FidelityMetrics {
        final int nonFiniteCount;
        final double referenceRms;
        final double candidateRms;
        final double relativeRmsError;
        final double cosineSimilarity;
        final float peakAbsError;
        final float referencePeak;

        FidelityMetrics(
                int nonFiniteCount,
                double referenceRms,
                double candidateRms,
                double relativeRmsError,
                double cosineSimilarity,
                float peakAbsError,
                float referencePeak) {
            this.nonFiniteCount = nonFiniteCount;
            this.referenceRms = referenceRms;
            this.candidateRms = candidateRms;
            this.relativeRmsError = relativeRmsError;
            this.cosineSimilarity = cosineSimilarity;
            this.peakAbsError = peakAbsError;
            this.referencePeak = referencePeak;
        }

        boolean isAcceptable() {
            if (nonFiniteCount != 0) return false;
            if (!Double.isFinite(referenceRms) || referenceRms < 1e-4) return false;
            if (!Double.isFinite(relativeRmsError) || relativeRmsError > MAX_RELATIVE_RMS_ERROR) return false;
            if (!Double.isFinite(cosineSimilarity) || cosineSimilarity < MIN_COSINE_SIMILARITY) return false;
            float peakLimit = Math.max(MIN_PEAK_TOLERANCE, referencePeak * RELATIVE_PEAK_TOLERANCE);
            return Float.isFinite(peakAbsError) && peakAbsError <= peakLimit;
        }

        @Override
        public String toString() {
            return String.format(
                    Locale.US,
                    "nf=%d relRms=%.5f cos=%.5f peakErr=%.5f",
                    nonFiniteCount, relativeRmsError, cosineSimilarity, peakAbsError);
        }
    }

    static final class ProbeResult {
        final Backend backend;
        final long openMs;
        final long warmupWallMs;
        final long wallMs;
        final long cpuMs;
        final FidelityMetrics fidelity;
        final String failureReason;

        private ProbeResult(
                Backend backend,
                long openMs,
                long warmupWallMs,
                long wallMs,
                long cpuMs,
                FidelityMetrics fidelity,
                String failureReason) {
            this.backend = backend;
            this.openMs = openMs;
            this.warmupWallMs = warmupWallMs;
            this.wallMs = wallMs;
            this.cpuMs = cpuMs;
            this.fidelity = fidelity;
            this.failureReason = failureReason;
        }

        static ProbeResult success(
                Backend backend,
                long openMs,
                long warmupWallMs,
                long wallMs,
                long cpuMs,
                FidelityMetrics fidelity) {
            return new ProbeResult(backend, openMs, warmupWallMs, wallMs, cpuMs, fidelity, null);
        }

        static ProbeResult failure(Backend backend, String reason) {
            return new ProbeResult(backend, 0L, 0L, 0L, 0L, null, reason == null ? "failed" : reason);
        }

        boolean succeeded() {
            return failureReason == null && fidelity != null && fidelity.isAcceptable();
        }
    }

    static final class CacheState {
        final String envKey;
        Backend selected;
        Backend pendingProbe;
        final EnumSet<Backend> blocked;
        final EnumMap<Backend, Integer> runtimeFailures;
        final boolean recoveredFromCrash;

        CacheState(
                String envKey,
                Backend selected,
                Backend pendingProbe,
                EnumSet<Backend> blocked,
                EnumMap<Backend, Integer> runtimeFailures,
                boolean recoveredFromCrash) {
            this.envKey = envKey;
            this.selected = selected;
            this.pendingProbe = pendingProbe;
            this.blocked = blocked;
            this.runtimeFailures = runtimeFailures;
            this.recoveredFromCrash = recoveredFromCrash;
        }

        static CacheState fresh(String envKey) {
            return new CacheState(
                    envKey,
                    null,
                    null,
                    EnumSet.noneOf(Backend.class),
                    new EnumMap<>(Backend.class),
                    false);
        }

        static CacheState load(Properties properties, String expectedEnvKey) {
            if (properties == null || expectedEnvKey == null
                    || !expectedEnvKey.equals(properties.getProperty(KEY_ENV))) {
                return fresh(expectedEnvKey == null ? "" : expectedEnvKey);
            }
            EnumSet<Backend> blocked = EnumSet.noneOf(Backend.class);
            String blockedRaw = properties.getProperty(KEY_BLOCKED, "");
            if (!blockedRaw.isEmpty()) {
                for (String token : blockedRaw.split(",")) {
                    Backend backend = Backend.fromId(token.trim());
                    if (backend != null) blocked.add(backend);
                }
            }
            EnumMap<Backend, Integer> failures = new EnumMap<>(Backend.class);
            for (Backend backend : Backend.values()) {
                String raw = properties.getProperty(KEY_FAILURES_PREFIX + backend.id());
                if (raw != null && !raw.isEmpty()) {
                    try {
                        int count = Integer.parseInt(raw.trim());
                        if (count > 0) failures.put(backend, count);
                    } catch (NumberFormatException ignored) {
                    }
                }
            }
            Backend selected = Backend.fromId(properties.getProperty(KEY_SELECTED));
            Backend pending = Backend.fromId(properties.getProperty(KEY_PENDING));
            boolean crashed = false;
            if (pending != null) {
                // The previous process terminated natively before clearing the probe marker.
                if (pending.isHardwareAccelerator()) {
                    blocked.add(pending);
                }
                if (selected == pending) {
                    selected = null;
                }
                pending = null;
                crashed = true;
            }
            if (selected != null && blocked.contains(selected)) {
                selected = null;
            }
            return new CacheState(expectedEnvKey, selected, pending, blocked, failures, crashed);
        }

        boolean isBlocked(Backend backend) {
            return blocked.contains(backend);
        }

        void markPending(Backend backend) {
            pendingProbe = backend;
        }

        void clearPending() {
            pendingProbe = null;
        }

        void block(Backend backend) {
            if (backend.isHardwareAccelerator()) {
                blocked.add(backend);
            }
            if (selected == backend) {
                selected = null;
            }
            if (pendingProbe == backend) {
                pendingProbe = null;
            }
        }

        boolean recordRuntimeFailure(Backend backend, boolean immediateBlock) {
            int count = runtimeFailures.getOrDefault(backend, 0) + 1;
            runtimeFailures.put(backend, count);
            if (immediateBlock || count >= MAX_RUNTIME_FAILURES) {
                block(backend);
                return true;
            }
            return false;
        }

        Properties toProperties() {
            Properties properties = new Properties();
            properties.setProperty(KEY_ENV, envKey);
            if (selected != null) {
                properties.setProperty(KEY_SELECTED, selected.id());
            }
            if (pendingProbe != null) {
                properties.setProperty(KEY_PENDING, pendingProbe.id());
            }
            if (!blocked.isEmpty()) {
                StringBuilder joined = new StringBuilder();
                for (Backend backend : blocked) {
                    if (joined.length() > 0) joined.append(',');
                    joined.append(backend.id());
                }
                properties.setProperty(KEY_BLOCKED, joined.toString());
            }
            for (Map.Entry<Backend, Integer> entry : runtimeFailures.entrySet()) {
                if (entry.getValue() != null && entry.getValue() > 0) {
                    properties.setProperty(
                            KEY_FAILURES_PREFIX + entry.getKey().id(),
                            Integer.toString(entry.getValue()));
                }
            }
            return properties;
        }
    }

    static int lowLoadCpuThreads(int availableProcessors) {
        int cores = Math.max(1, availableProcessors);
        return cores >= 4 ? 2 : cores;
    }

    static int fastCpuThreads(int availableProcessors) {
        return Math.min(4, Math.max(1, availableProcessors));
    }

    static int nnapiFallbackThreads(int availableProcessors) {
        return Math.min(2, Math.max(1, availableProcessors));
    }

    static Backend defaultCpuFallback(int availableProcessors) {
        return lowLoadCpuThreads(availableProcessors) < fastCpuThreads(availableProcessors)
                ? Backend.CPU_LOW_LOAD
                : Backend.CPU_FAST;
    }

    static boolean shouldSkipIdleInference(int currentMix, long zeroSinceElapsedMs, long nowElapsedMs) {
        return currentMix == 0 && zeroSinceElapsedMs > 0L && (nowElapsedMs - zeroSinceElapsedMs) >= IDLE_BYPASS_DELAY_MS;
    }

    /**
     * Returns the input-to-output frame pacing divisor for {@link SingPlayback}:
     * 1 once lookahead is full (strict 1:1 conservation), 4 when no window is queued or computing
     * (rapidly build lookahead without starving AudioTrack), and 2 while filling the queue.
     */
    static int outputPacingDivisor(int readyQueueSize, int maxReadyWindows, boolean hasPendingTask) {
        if (readyQueueSize >= maxReadyWindows) {
            return 1;
        }
        if (!hasPendingTask && readyQueueSize == 0) {
            return 4;
        }
        return 2;
    }

    static FidelityMetrics compareOutputs(float[] reference, float[] candidate) {
        if (reference.length != candidate.length || reference.length == 0) {
            return new FidelityMetrics(1, 0.0, 0.0, Double.POSITIVE_INFINITY, 0.0, Float.POSITIVE_INFINITY, 0f);
        }
        int nonFinite = 0;
        double refSumSq = 0.0;
        double candSumSq = 0.0;
        double diffSumSq = 0.0;
        double dot = 0.0;
        float peakErr = 0f;
        float refPeak = 0f;
        for (int i = 0; i < reference.length; i++) {
            float ref = reference[i];
            float cand = candidate[i];
            if (!Float.isFinite(ref) || !Float.isFinite(cand)) {
                nonFinite++;
                continue;
            }
            float absRef = Math.abs(ref);
            if (absRef > refPeak) refPeak = absRef;
            float diff = Math.abs(cand - ref);
            if (diff > peakErr) peakErr = diff;
            refSumSq += (double) ref * ref;
            candSumSq += (double) cand * cand;
            diffSumSq += (double) diff * diff;
            dot += (double) ref * cand;
        }
        int n = reference.length;
        double refRms = Math.sqrt(refSumSq / n);
        double candRms = Math.sqrt(candSumSq / n);
        double relRms = refSumSq > 0.0 ? Math.sqrt(diffSumSq / refSumSq) : Double.POSITIVE_INFINITY;
        double denom = Math.sqrt(refSumSq * candSumSq);
        double cosine = denom > 0.0 ? dot / denom : 0.0;
        return new FidelityMetrics(nonFinite, refRms, candRms, relRms, cosine, peakErr, refPeak);
    }

    static Backend chooseWinner(List<ProbeResult> results) {
        if (results == null || results.isEmpty()) {
            return Backend.CPU_FAST;
        }

        ProbeResult cpuLow = null;
        ProbeResult cpuFast = null;
        List<ProbeResult> accelerators = new ArrayList<>();
        for (ProbeResult result : results) {
            if (result == null || !result.succeeded()) continue;
            if (result.backend == Backend.CPU_LOW_LOAD) {
                cpuLow = result;
            } else if (result.backend == Backend.CPU_FAST) {
                cpuFast = result;
            } else if (result.backend.isHardwareAccelerator()) {
                accelerators.add(result);
            }
        }

        ProbeResult bestCpu = selectBestCpu(cpuLow, cpuFast);
        if (bestCpu == null) {
            return accelerators.isEmpty() ? Backend.CPU_FAST : accelerators.get(0).backend;
        }
        if (!shouldProbeHardwareAccelerators(bestCpu)) {
            return bestCpu.backend;
        }

        ProbeResult bestAccelerator = null;
        double bestScore = Double.POSITIVE_INFINITY;
        for (ProbeResult candidate : accelerators) {
            if (!qualifiesOverCpu(candidate, bestCpu)) continue;
            double score = acceleratorLoadScore(candidate);
            if (score < bestScore) {
                bestScore = score;
                bestAccelerator = candidate;
            }
        }
        return bestAccelerator != null ? bestAccelerator.backend : bestCpu.backend;
    }

    /**
     * Running MDX-Net compute shaders on the shared mobile GPU contends directly with
     * SurfaceFlinger and RenderThread across the entire system. Only probe GPU/NNAPI accelerators
     * when CPU inference alone cannot comfortably sustain real-time playback.
     */
    static boolean shouldProbeHardwareAccelerators(ProbeResult bestCpu) {
        return bestCpu == null || !bestCpu.succeeded() || bestCpu.wallMs > MAX_CPU_REALTIME_WALL_MS;
    }

    static ProbeResult selectBestCpu(ProbeResult cpuLow, ProbeResult cpuFast) {
        if (cpuLow == null || !cpuLow.succeeded()) {
            return cpuFast != null && cpuFast.succeeded() ? cpuFast : null;
        }
        if (cpuFast == null || !cpuFast.succeeded()) return cpuLow;
        // Prefer the lower-thread CPU backend whenever it comfortably meets the real-time stride.
        if (cpuLow.wallMs <= SMOOTH_WALL_BUDGET_MS && cpuLow.cpuMs <= Math.round(cpuFast.cpuMs * 1.10)) {
            return cpuLow;
        }
        return cpuFast.wallMs < cpuLow.wallMs ? cpuFast : cpuLow;
    }

    private static boolean qualifiesOverCpu(ProbeResult candidate, ProbeResult cpuBaseline) {
        long wallCap = candidate.backend == Backend.WEBGPU_GPU ? MAX_WEBGPU_WALL_MS : MAX_NNAPI_WALL_MS;
        if (candidate.wallMs <= 0L || candidate.wallMs > wallCap) {
            return false;
        }
        long maxAllowedWall = Math.max(
                SMOOTH_WALL_BUDGET_MS,
                Math.round(cpuBaseline.wallMs * ACCELERATOR_MAX_WALL_VS_CPU));
        if (candidate.wallMs > maxAllowedWall) {
            return false;
        }
        boolean genuineCpuOffload = cpuBaseline.cpuMs > 0L
                && candidate.cpuMs <= Math.round(cpuBaseline.cpuMs * ACCELERATOR_CPU_OFFLOAD_RATIO);
        boolean fasterWithoutExtraCpu = cpuBaseline.wallMs > 0L
                && candidate.wallMs <= Math.round(cpuBaseline.wallMs * ACCELERATOR_WALL_SPEEDUP_RATIO)
                && (cpuBaseline.cpuMs <= 0L
                        || candidate.cpuMs <= Math.round(cpuBaseline.cpuMs * ACCELERATOR_MAX_CPU_WITH_SPEEDUP));
        return genuineCpuOffload || fasterWithoutExtraCpu;
    }

    private static double acceleratorLoadScore(ProbeResult candidate) {
        double raw = Math.max(0L, candidate.cpuMs) + WALL_WEIGHT_IN_SCORE * Math.max(0L, candidate.wallMs);
        return candidate.backend == Backend.NNAPI_NPU ? raw * NPU_SCORE_MULTIPLIER : raw;
    }

    /**
     * Generates a deterministic, realistic STFT-like tensor exercising both vocal-band energy
     * and high-frequency decay without exceeding FP16 dynamic range.
     */
    static float[] createCalibrationTensor(int bins, int timeSteps) {
        int planeSize = bins * timeSteps;
        float[] tensor = new float[4 * planeSize];
        int seed = 0x51C0CAFE;
        for (int bin = 3; bin < bins; bin++) {
            double harmonic = (bin >= 12 && bin <= 240 && (bin % 17) < 3) ? 2.2 : 1.0;
            float scale = (float) ((6.0 * harmonic) / (1.0 + bin * 0.025));
            int binOffset = bin * timeSteps;
            for (int t = 0; t < timeSteps; t++) {
                float envelope = 0.65f + 0.35f * (float) Math.sin(t * 0.09817477 + bin * 0.013);
                int idx = binOffset + t;
                for (int plane = 0; plane < 4; plane++) {
                    seed = seed * 1664525 + 1013904223;
                    float unit = (((seed >>> 8) & 0xFFFF) / 32768f) - 1f;
                    tensor[plane * planeSize + idx] = unit * scale * envelope;
                }
            }
        }
        return tensor;
    }

    static List<Backend> hardwareCandidatesForSdk(int sdkInt, boolean nnapiAvailable, boolean webgpuAvailable) {
        if (sdkInt < 29) {
            return Collections.emptyList();
        }
        List<Backend> candidates = new ArrayList<>(2);
        if (nnapiAvailable) candidates.add(Backend.NNAPI_NPU);
        if (webgpuAvailable) candidates.add(Backend.WEBGPU_GPU);
        return candidates;
    }
}
